Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL79LaJ4hWllCAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 06:14:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B80FA505
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 06:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9932D10E2FF;
	Fri,  6 Feb 2026 05:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FVPA2d/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906EC10E2FF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 05:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 123ED6001A;
 Fri,  6 Feb 2026 05:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153BCC116C6;
 Fri,  6 Feb 2026 05:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770354846;
 bh=KMl3QlTFnteWHPynJs9RzC7YCzH6lbUv5uYhAVsWxtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVPA2d/3TAPEDTiQeZt+qMRnw6ml+PXHTfPeLZLVamz1l8A7L1AkBdfOE3vH/ww0Z
 kM/ywttnqAj0JfhVfiEOd7OvZYwReZgFcQrxURuMqrCb6BhgUnhKJvFXlhYqwgH2BT
 3oLs7ibhODX75ocB86Nfn/NLNpr3nxT5/8XaLjWz1h4annYNHjVFbxThl9UGMlNT2E
 p4cpUxIHsaxHRnNx7RGJDH769V7Cp5/pBvbY/2yTn3lOEWTx9LNnw0+x4krrDV3Zex
 9SXAxB9hKcKl4WZ8J2uRz/20h/sH8TzfRHqDQXsAsHX8y3JQum6H8diO//NVEg/gNo
 2QLNbyeE/7Hww==
Date: Fri, 6 Feb 2026 05:14:03 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
Message-ID: <aYV4m5Q1U4Nc1qwm@google.com>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203135519.417931-12-tzimmermann@suse.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 49B80FA505
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 02:52:30PM +0100, Thomas Zimmermann wrote:
> Add corebootdrm, a DRM driver for coreboot framebuffers. The driver
> supports a pre-initialized framebuffer with various packed RGB formats.
> The driver code is fairly small and uses the same logic as the other
> sysfb drivers. Most of the implementation comes from existing sysfb
> helpers.
> 
> Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
> output. Initialize the platform device for corebootdrm in the same place
> in framebuffer_probe(). With a later commit, the simple-framebuffer should
> be removed.
> 
> v3:
> - comment on _HAS_LFB semantics (Tzung-Bi)
> - fix typo in commit description (Tzung-Bi)
> - comment on simple-framebuffer being obsolete for coreboot
> v2:
> - reimplement as platform driver
> - limit resources and mappings to known framebuffer memory; no
>   page alignment
> - create corebootdrm device from coreboot framebuffer code

Changelog should be after "---" otherwise it becomes part of commit message.

> +static int corebootdrm_probe(struct platform_device *pdev)
> +{
[...]
> +	if (!fb) {
> +		drm_err(dev, "coreboot framebuffer not found\n");
> +		return -EINVAL;
> +	} else if (!LB_FRAMEBUFFER_HAS_LFB(fb)) {
> +		drm_err(dev, "coreboot framebuffer entry too small\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Hardware settings
> +	 */
> +
> +	format = corebootdrm_get_format_fb(dev, fb);
> +	if (!format)
> +		return -EINVAL;
> +	width = corebootdrm_get_width_fb(dev, fb);
> +	if (width < 0)
> +		return width;
> +	height = corebootdrm_get_height_fb(dev, fb);
> +	if (height < 0)
> +		return height;
[...]
> diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> index 5746b99a070d..b51665165f9f 100644
> --- a/include/linux/coreboot.h
> +++ b/include/linux/coreboot.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/compiler_attributes.h>
>  #include <linux/types.h>
> +#include <linux/stddef.h>

Move it before types.h?  's' vs. 't'.

> +/*
> + * True if the coreboot-provided data is large enough to hold information
> + * on the linear framebuffer. False otherwise.
> + */
> +#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> +	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> +

To make sure I understand, do you mean:

- The __fb->size is possibly less than sizeof(struct lb_framebuffer).
  LB_FRAMEBUFFER_HAS_LFB() is for checking the following fields
  (e.g. fb->x_resolution) are available?

    struct lb_framebuffer {
    	u32 tag;
    	u32 size;

    	u64 physical_address;
    	u32 x_resolution;
    	u32 y_resolution;
    	u32 bytes_per_line;
    	u8  bits_per_pixel;
    	u8  red_mask_pos;
    	u8  red_mask_size;
    	u8  green_mask_pos;
    	u8  green_mask_size;
    	u8  blue_mask_pos;
    	u8  blue_mask_size;
    	u8  reserved_mask_pos;
    	u8  reserved_mask_size;
    };

- If answer of the previous question is yes, the next question: does
  LB_FRAMEBUFFER_HAS_LFB() needs to check up to `reserved_mask_size`?
  As in the patch, it only accesses up to `blue_mask_size`.
