Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BC25788C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A76E11B;
	Mon, 31 Aug 2020 11:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEF16E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:39:23 +0000 (UTC)
Date: Mon, 31 Aug 2020 11:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1598873960;
 bh=jR//Y3Z0pAZURnrw2Jxzg9pdJ+m1iQvesaUWWeCTY4M=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UekIRHPTa/7jem9cbDC/HwBO8KucEskeXTb8yABX7QRhpmLiBllgeR+x+Lq7qOf5j
 R3Bc3S8aYch9rVGo83pGsmkNsjAOMJ+ouhp3wIFsbSWcEZJYc2t86TiJ07Mn/j33hh
 SLYuzIA7RFb+A93gtgrsro+5j/cAQQlmA4Dm74N9FH8LKdBATinc3mzeZyGfoko1ez
 7+CmpeuErep4xDhYxia/KzwvkihDpR6czC+SRLz4qkmPSZREQkPEdrTWhfU0kQXZal
 +H1Qku2xN4EG32ZnM1A/vKTPIM4LKKeLN+Eq8jwTbqZ8wp4du01d09Y1IYVuVN63jo
 QZD4z5LerLmNA==
To: Sidong Yang <realwakka@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: add support for gamma_set interface
Message-ID: <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
In-Reply-To: <20200829140647.7626-1-realwakka@gmail.com>
References: <20200829140647.7626-1-realwakka@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, August 29, 2020 4:06 PM, Sidong Yang <realwakka@gmail.com> wrote:

> Currently vkms module doesn't support gamma function for userspace. so igt
> subtests in kms_plane(pixel-format-pipe-A-plan) failed for calling
> drmModeCrtcSetGamma().

It doesn't seem like this IGT test's goal is to exercise support for
gamma LUTs. Does the test just tries to reset the gamma LUT to linear?
If so, I think the IGT test should be fixed to ignore "I don't support
gamma" errors.

> This patch set gamma_set interface in vkms_crtc_funcs for
> support gamma function. With initializing crtc, added calls for setting gamma
> size. it pass the test after this patch.
>
> Cc: Daniel Vetter<daniel@ffwll.ch>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index ac85e17428f8..643435fb2ee6 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -160,6 +160,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
>  	.get_crc_sources	= vkms_get_crc_sources,
>  	.set_crc_source		= vkms_set_crc_source,
>  	.verify_crc_source	= vkms_verify_crc_source,
> +	.gamma_set		= drm_atomic_helper_legacy_gamma_set,

Why does VKMS need to use a legacy helper?

It seems like this patch just advertises support for gamma LUTs, but
ignores any value set by user-space. If VKMS advertises support for
gamma LUTs, it needs to take the LUT into account when blending planes.

>  };
>
>  static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
> @@ -275,6 +276,13 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		return ret;
>  	}
>
> +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
> +	if (ret) {
> +		DRM_ERROR("Failed to set gamma size\n");
> +		return ret;
> +	}
> +	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> +
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>
>  	spin_lock_init(&vkms_out->lock);
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
