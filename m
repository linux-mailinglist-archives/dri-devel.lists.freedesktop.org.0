Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B061F740
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0274910E3AC;
	Mon,  7 Nov 2022 15:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAF210E3B0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667833853; x=1699369853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WpNLkWsma8OlnJ2HaCkn1bSw2kA9P5c0g5KKNekKSuU=;
 b=Grf7InQQCWU0L4Pjzs9AWa+vC8SmCNh5B4fT4BZ/ttR8+6Cxo5ZU/R1K
 lGeI0RsqsnmZnn47BuTrt6po6nHXfeQpRNSbVY1vPnmJ55LpC7U92xz0t
 zyGZzcCrwUEW1WRwKRC6SA7wHU1ibFvSMGJG37TsFHGLE2vrNteA2EsaJ
 QTK3RUqfkfWI2NpaFn1vQ3Zu2uqiUCEz1HB5noH8oLctR9xHoV4ygc9Lh
 4F7syT5PhQpOUeiCK5R/4UUSnY0hmHT6JgDelHIFCBAPzvesaeFp78Rv/
 9EVCkyT8iLEob7APKWIou4WOAflHlkrGczSTcASdGUOa0rpovyvR+3o2J w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308056624"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308056624"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 07:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630514454"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="630514454"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 07 Nov 2022 07:10:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 17:10:48 +0200
Date: Mon, 7 Nov 2022 17:10:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH RESEND] drm: fix crash in drm_minor_alloc_release
Message-ID: <Y2kf+HLy/Kz5BclF@intel.com>
References: <20221107144500.3692212-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107144500.3692212-1-stanislaw.gruszka@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 03:45:00PM +0100, Stanislaw Gruszka wrote:
> If drm_sysfs_minor_alloc() fail in drm_minor_alloc() we can end up
> freeing invalid minor->kdev pointer and drm_minor_alloc_release()
> will crash like below:
> 
> RIP: 0010:kobject_put+0x19/0x1c0
> RSP: 0018:ffffbc7001637c38 EFLAGS: 00010282
> RAX: ffffffffa8d6deb0 RBX: 00000000ffffffff RCX: ffff9cb5912d4540
> RDX: ffffffffa9c45ec5 RSI: ffff9cb5902f2b68 RDI: fffffffffffffff4
> RBP: fffffffffffffff4 R08: ffffffffa9c40dec R09: 0000000000000008
> R10: ffffffffaa81f7d2 R11: 00000000aa81f7ca R12: ffff9cb5912d4540
> R13: ffff9cb5912d4540 R14: dead000000000122 R15: dead000000000100
> FS:  00007f56b06e6740(0000) GS:ffff9cb728b40000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000030 CR3: 000000011285b004 CR4: 0000000000170ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  drm_minor_alloc_release+0x19/0x50
>  drm_managed_release+0xab/0x150
>  drm_dev_init+0x21f/0x2f0
>  __devm_drm_dev_alloc+0x3c/0xa0
>  ivpu_probe+0x59/0x797 [intel_vpu 127058409b05eb2f99dcdecd3330bee28d6b3e76]
>  pci_device_probe+0xa4/0x160
>  really_probe+0x164/0x340
>  __driver_probe_device+0x10d/0x190
>  device_driver_attach+0x26/0x50
>  bind_store+0x9f/0x120
>  kernfs_fop_write_iter+0x12d/0x1c0
>  new_sync_write+0x106/0x180
>  vfs_write+0x216/0x2a0
>  ksys_write+0x65/0xe0
>  do_syscall_64+0x35/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Fix this crash by checking minor->kdev when freeing.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8214a0b1ab7f..e3a1243dd2ae 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -102,7 +102,8 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
>  
>  	WARN_ON(dev != minor->dev);
>  
> -	put_device(minor->kdev);
> +	if (!IS_ERR(minor->kdev))
> +		put_device(minor->kdev);

Assigning error pointers into things is a terrible idea.
IMO the correct fix would be to not return some
half-constructed garbage from drm_minor_alloc().
So basically should at least partically revert
commit f96306f9892b ("drm: manage drm_minor cleanup with drmm_")

>  
>  	spin_lock_irqsave(&drm_minor_lock, flags);
>  	idr_remove(&drm_minors_idr, minor->index);
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
