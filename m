Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E11174A763E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCD110E3F1;
	Wed,  2 Feb 2022 16:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE1610E3F1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:55:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D7F961757;
 Wed,  2 Feb 2022 16:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E46C004E1;
 Wed,  2 Feb 2022 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643820900;
 bh=+Mw3UqSA9RW9lVv7cMeO4kcmAotMs1Y2FfPXU4FBX0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MLDcYJAZvsv0XjxsuicWh3967mYmwunkokbmM+LwLId1hMsSp9rl1N3omNdCRHynH
 BXyvlTGymC3VchPCaetwp6qPoimzewJphziaYPKVoMe7RBiYK7aBEwXg79ysMnq1by
 4YIxFZe1wIiKqNoQvUoR+Lea7Qga6Ai4DA7mAkmFJkafEfDSvyXEflnnfVunelFB8M
 W8UnHi+FVqr2zmpCDBRw1TJkIwsiRYJXog7IVacvNlpd0zDWp/ctF/3gRU+/maemd7
 kEmmGNuEx7RUhG2h0KO2KEeV4FC6natUldJrgVB9m5DQj8W9NPGFCLTFy3Tr4s1KDy
 YkX+82ZIKJoxA==
Date: Wed, 2 Feb 2022 09:54:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [PATCH 5/5] drm/stm: ltdc: add support of ycbcr pixel formats
Message-ID: <Yfq3XwozrxYaFhgD@dev-arch.archlinux-ax161>
References: <20211215214843.20703-1-yannick.fertre@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215214843.20703-1-yannick.fertre@foss.st.com>
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
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yannick,

On Wed, Dec 15, 2021 at 10:48:43PM +0100, Yannick Fertre wrote:
> This patch adds the following YCbCr input pixel formats on the latest
> LTDC hardware version:
> 
> 1 plane  (co-planar)  : YUYV, YVYU, UYVY, VYUY
> 2 planes (semi-planar): NV12, NV21
> 3 planes (full-planar): YU12=I420=DRM YUV420, YV12=DRM YVU420
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>

<snip>

> +static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fmt)
> +{
> +	struct ltdc_device *ldev = plane_to_ltdc(plane);
> +	struct drm_plane_state *state = plane->state;
> +	u32 lofs = plane->index * LAY_OFS;
> +	u32 val;
> +
> +	switch (drm_pix_fmt) {
> +	case DRM_FORMAT_YUYV:
> +		val = (YCM_I << 4) | LxPCR_YF | LxPCR_CBF;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		val = (YCM_I << 4) | LxPCR_YF;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		val = (YCM_I << 4) | LxPCR_CBF;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +		val = (YCM_I << 4);
> +		break;
> +	case DRM_FORMAT_NV12:
> +		val = (YCM_SP << 4) | LxPCR_CBF;
> +		break;
> +	case DRM_FORMAT_NV21:
> +		val = (YCM_SP << 4);
> +		break;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YVU420:
> +		val = (YCM_FP << 4);
> +		break;
> +	default:
> +		/* RGB or not a YCbCr supported format */
> +		break;
> +	}
> +
> +	/* Enable limited range */
> +	if (state->color_range == DRM_COLOR_YCBCR_LIMITED_RANGE)
> +		val |= LxPCR_YREN;
> +
> +	/* enable ycbcr conversion */
> +	val |= LxPCR_YCEN;
> +
> +	regmap_write(ldev->regmap, LTDC_L1PCR + lofs, val);
> +}

This patch as commit 484e72d3146b ("drm/stm: ltdc: add support of ycbcr
pixel formats") in -next introduced the following clang warning:

drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
        default:
        ^~~~~~~
drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
        val |= LxPCR_YCEN;
        ^~~
drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
        u32 val;
               ^
                = 0
1 warning generated.

Would it be okay to just return in the default case (maybe with a
message about an unsupported format?) or should there be another fix?

Cheers,
