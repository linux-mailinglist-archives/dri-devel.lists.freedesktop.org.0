Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D198D1CA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 12:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2AB10E6F0;
	Wed,  2 Oct 2024 10:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="l4FlZMAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831AA10E6F2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 10:57:46 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B2F5423E20;
 Wed,  2 Oct 2024 12:57:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_Zgs1HC9V7b; Wed,  2 Oct 2024 12:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727866664; bh=d19584Ze1FFYfFbk3f91IPn8+zI74A5SE2RaLA6uUno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=l4FlZMAkq48GYO3R7RMfJR4fcAeb88A7Hwdpl46hT57grAst7otNnQBRozw7M8ffI
 ESmOi1lEM5W70I2lYhHvUAPyzVu8HzDY8SfXsR38UqoHuXa+CKAGKUzzBQ2+T7kDKK
 8ILU3HxZ/ggXh2Em08Wv/QOMy73O7bXJrg1hFBbgXsoAv2R1MdXzLthiD9OA7CeOgn
 ZUcp6zu63VIaauOd468Xy3IZTUTYaHnNePvZO8mvuLRDhl+V7HcVj12rtH3ngDuXLB
 4YCoQhN6+lnjyDUqeMIJp75Maf7BRFsFLDfdKboQ1gGWVaYvCb7jDzzIroy6HCj3p2
 OA6Sh/s9WrhYw==
Date: Wed, 2 Oct 2024 10:57:22 +0000
From: Yao Zi <ziyao@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] drm/meson: Support drm_panic
Message-ID: <Zv0nEqV5G2JamvxL@pineapple>
References: <20241001210403.43535-2-ziyao@disroot.org>
 <20241001210403.43535-3-ziyao@disroot.org>
 <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
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

On Wed, Oct 02, 2024 at 09:59:57AM +0200, Neil Armstrong wrote:
> I thing the code should look like:
> 
> if (priv->viu.osd1_afbcd) {
> 	meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
> 			    priv->viu.osd1_addr,
> 			    priv->viu.osd1_stride,
> 			    priv->viu.osd1_height,
> 			    MESON_CANVAS_WRAP_NONE,
> 			    MESON_CANVAS_BLKMODE_LINEAR, 0);
> 
> 	if (priv->afbcd.ops) {
> 		priv->afbcd.ops->reset(priv);
> 		priv->afbcd.ops->disable(priv);
> 	}
> 
> 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> 		writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
> 				    priv->io_base +
> 				    _REG(VIU_OSD1_BLK0_CFG_W0));
> 		meson_viu_g12a_disable_osd1_afbc(priv);
> 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
> 		writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
> 				    priv->io_base +
> 				    _REG(VIU_OSD1_CTRL_STAT2));
> 		meson_viu_gxm_disable_osd1_afbc(priv);
> 	}
> }

Thanks for correction!

> AFBC is quite hard to test since it requires DRM_FORMAT_XBGR8888, but
> I think sway should perhaps support it, Mesa should also support AFBC.

Have tried with Sway 1.9 and weston 14.0.0 and didn't find a way to make
them create buffers with AFBC modifiers. modetest util in libdrm doesn't
support it either.

> At some point I made some memory dumps of AFBC buffers, perhaps they could
> be useful here.
> 
> Another way would be to simply ignore the AFBC case, and bail out since
> it would be a very rare case.

I'm not sure the use case of an AFBC-enabled primary plane. It should be
rare the whole primary plane is filled with pixel data from GPU or video
codec.

If my guess is true, bailing out when AFBC is enabled should be
acceptable. Will try to do some AFBC tests if possible and consider
it as a latest solution.

btw, I forget to check whether drm_gem_fb_vmap() succeeds. Will fix it
later.

Thanks for your advice again!

Best regards,
Yao Zi
