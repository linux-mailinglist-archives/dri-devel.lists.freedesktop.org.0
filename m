Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0817D8F88
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ABC10E941;
	Fri, 27 Oct 2023 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5710E941
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:18:00 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B1EB066072FC;
 Fri, 27 Oct 2023 08:17:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698391079;
 bh=w/e9oob7hOM84wZctGqMXlvAjyoXB4ZayuMpg1DFtoo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iYXmJ00v795Yr+zDHJDGbHzhx2cS3to1OcLA4ajP8OjGJia2t36WLicmzsOY9p5Ki
 c4FwassYWQTyjXskC82OSEDK8xt6l4/fAbJX/6K8klh8vvSQ0+fV8sLD8tJpbuo8Wu
 JmXD4xnw/9ZOJmgrUyow6JTLDWwTcd+aOSSPmSUSUB87xm9CZrwfRVwUTrazg9TXkc
 MxGXHnG3mobJzWqN4nUd68XGJlMOM+Ty5rI9YBol5/BQC5UhYTj/PYoV2rOpFFKLZa
 Ef0ROodFZJb4+CC35AvtD2cL+0B8R5W3gbKd1h0aYO/VpxTcsHGEGEAwLcZLBH2m2D
 tS7n10mQNpzmw==
Date: Fri, 27 Oct 2023 09:17:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027091755.3635be36@collabora.com>
In-Reply-To: <20231026161431.5934-1-dakr@redhat.com>
References: <20231026161431.5934-1-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Thu, 26 Oct 2023 18:13:00 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +
> +	/**
> +	 * @update_job_credits: Called once the scheduler is considering this
> +	 * job for execution.
> +	 *
> +	 * Drivers may use this to update the job's submission credits, which is
> +	 * useful to e.g. deduct the number of native fences which have been
> +	 * signaled meanwhile.
> +	 *
> +	 * The callback must either return the new number of submission credits
> +	 * for the given job, or zero if no update is required.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);

I'm copying my late reply to v2 here so it doesn't get lost:

I keep thinking it'd be simpler to make this a void function that
updates s_job->submission_credits directly. I also don't see the
problem with doing a sanity check on job->submission_credits. I mean,
if the driver is doing something silly, you can't do much to prevent it
anyway, except warn the user that something wrong has happened. If you
want to

	WARN_ON(job->submission_credits == 0 ||
		job->submission_credits > job_old_submission_credits);

that's fine. But none of this sanity checking has to do with the
function prototype/semantics, and I'm still not comfortable with this 0
=> no-change. If there's no change, we should just leave  
job->submission_credits unchanged (or return job->submission_credits)
instead of inventing a new special case.

Regards,

Boris
