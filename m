Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEB41098A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 05:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0E6E18E;
	Sun, 19 Sep 2021 03:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Sun, 19 Sep 2021 03:24:59 UTC
Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn
 [202.108.3.23])
 by gabe.freedesktop.org (Postfix) with SMTP id CD92B6E18E
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 03:24:59 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.115.166.15])
 by sina.com (172.16.97.23) with ESMTP
 id 6146AC440001A880; Sun, 19 Sep 2021 11:19:34 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 83412854919335
From: Hillf Danton <hdanton@sina.com>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] DRM: Add support of AI Processor Unit (APU)
Date: Sun, 19 Sep 2021 11:19:24 +0800
Message-Id: <20210919031924.4426-1-hdanton@sina.com>
In-Reply-To: <20210917125945.620097-3-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Sep 2021 14:59:43 +0200 Alexandre Bailon wrote:
> +static DEFINE_IDA(req_ida);
> +static LIST_HEAD(complete_node);

I see accesses to complete_node in apu_drm_callback(), apu_job_timedout()
and ioctl_gem_dequeue() without working out the serialization to avoid
list corruption. Can you add a comment to specify it?

> +
> +int apu_drm_callback(struct apu_core *apu_core, void *data, int len)
> +{
> +	struct apu_request *apu_req, *tmp;
> +	struct apu_dev_request *hdr = data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&apu_core->ctx_lock, flags);
> +	list_for_each_entry_safe(apu_req, tmp, &apu_core->requests, node) {
> +		struct apu_job *job = apu_req->job;
> +
> +		if (job && hdr->id == job->id) {
> +			kref_get(&job->refcount);
> +			job->result = hdr->result;
> +			if (job->size_out)
> +				memcpy(job->data_out, hdr->data + job->size_in,
> +				       min(job->size_out, hdr->size_out));
> +			job->size_out = hdr->size_out;
> +			list_add(&job->node, &complete_node);
> +			list_del(&apu_req->node);
> +			ida_simple_remove(&req_ida, hdr->id);
> +			kfree(apu_req);
> +			drm_send_event(job->apu_drm->drm,
> +				       &job->event->pending_event);
> +			dma_fence_signal_locked(job->done_fence);
> +		}
> +	}
> +	spin_unlock_irqrestore(&apu_core->ctx_lock, flags);
> +
> +	return 0;
> +}
