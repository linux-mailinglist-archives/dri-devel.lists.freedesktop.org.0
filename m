Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2643E305
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 16:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD676E98A;
	Thu, 28 Oct 2021 14:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0F36E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 14:04:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="291246668"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="291246668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 07:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="636208867"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 28 Oct 2021 07:04:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Oct 2021 17:04:19 +0300
Date: Thu, 28 Oct 2021 17:04:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: George Kennedy <george.kennedy@oracle.com>
Cc: gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Message-ID: <YXqt46TPL9tUZCL1@intel.com>
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
> Do a sanity check on struct drm_format_info hsub and vsub values to
> avoid divide by zero.
> 
> Syzkaller reported a divide error in framebuffer_check() when the
> DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
> the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
> the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
> fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
> vsub as a divisor. These divisors need to be sanity checked for
> zero before use.
> 
> divide error: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
> Hardware name: Red Hat KVM, BIOS 1.13.0-2
> RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
> RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
> drivers/gpu/drm/drm_framebuffer.c:317
> 
> Call Trace:
>  drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
>  drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
>  drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
>  drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:874 [inline]
>  __se_sys_ioctl fs/ioctl.c:860 [inline]
>  __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc..a146e4b 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
>  	/* now let the driver pick its own format info */
>  	info = drm_get_format_info(dev, r);
>  
> +	if (info->hsub == 0) {
> +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
> +		return -EINVAL;
> +	}
> +
> +	if (info->vsub == 0) {
> +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
> +		return -EINVAL;
> +	}

Looks like duct tape to me. I think we need to either fix those formats
to have valid format info, or just revert the whole patch that added such
broken things.

> +
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = fb_plane_width(r->width, info, i);
>  		unsigned int height = fb_plane_height(r->height, info, i);
> -- 
> 1.8.3.1

-- 
Ville Syrjälä
Intel
