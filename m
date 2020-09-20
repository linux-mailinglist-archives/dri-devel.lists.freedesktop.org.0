Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B522271C0A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC956E1A2;
	Mon, 21 Sep 2020 07:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1055 seconds by postgrey-1.36 at gabe;
 Sun, 20 Sep 2020 02:17:26 UTC
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn
 [202.108.3.25])
 by gabe.freedesktop.org (Postfix) with SMTP id 078FB6E090
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Sep 2020 02:17:25 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.67.153])
 by sina.com with ESMTP
 id 5F66BBB10001C927; Sun, 20 Sep 2020 10:17:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 99065454919473
From: Hillf Danton <hdanton@sina.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 3/3] drm: Add a client-cap to set scheduling mode
Date: Sun, 20 Sep 2020 10:17:11 +0800
Message-Id: <20200920021711.9180-1-hdanton@sina.com>
In-Reply-To: <20200919193727.2093945-4-robdclark@gmail.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:44 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Hillf Danton <hdanton@sina.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-arm-msm@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, timmurray@google.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 19 Sep 2020 12:37:26 -0700 Rob Clark wrote:
> +/**
> + * drm_crtc_set_sched_mode:
> + * @dev: DRM device
> + * @mode: one of DRM_CLIENT_CAP_SCHED_x
> + *
> + * Set the scheduling mode for per-CRTC kthread workers.  This controls
> + * whether nonblocking atomic commits will run with SCHED_NORMAL or
> + * SCHED_FIFO (rt) priority.
> + */
> +void drm_crtc_set_sched_mode(struct drm_device *dev, int mode)
> +{
> +	struct drm_crtc *crtc;
> +
> +	drm_for_each_crtc(crtc, dev) {
> +		switch (mode) {
> +		case DRM_CLIENT_CAP_SCHED_NORMAL:
> +			/* zero is default nice value for kthreads: */
> +			sched_set_normal(crtc->worker->task, 0);
> +			break;
> +		case DRM_CLIENT_CAP_SCHED_FIFO:
> +			sched_set_fifo(crtc->worker->task);
> +			break;

Better if they are done in kernel/kthread.c wrt FIFO worker.

Off-topic: if that's fine, what's preventing you from doing the same
in kernel/workqueue.c for the workqueus you create manually?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
