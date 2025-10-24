Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F305FC048A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539D310E9DE;
	Fri, 24 Oct 2025 06:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="etfvjaQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7127310E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761288214;
 bh=IbkdvNYR2kCJyPzBt28BRC+IBfhLd6Bj/NrNmn8Y4EQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=etfvjaQvpQUkHyjN+yZXLyL7RO5hXRg2yLZ0BmgNuRC2wQ1IZ306phpplQh9Ttii/
 7ERQGs7zUZX0QoVHIc0dA8QKiK2cQfhqqb6lzDHLmvidl3R2PsGhh2dnFe1+OE5VAE
 f3D6RTM9pCP2D0DgAApiET832nATRRByTCwLtTF0jzVpV0+ay2enxhpvMtgm+4GLr/
 gsFIS6SXMTbYDM4XplpF+z9wW09MFcIcetz5nI9EO4eQYUTf7L+G+crVEuN0jrK41w
 tiJGA7MCWNoLaOtSkKZSjtCrS6cx8cRH4T7z21+yUHLLBLuLdMAtU0GbTBwRoAJPkY
 dwNxsaZ6QLYdg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F1BD17E12DF;
 Fri, 24 Oct 2025 08:43:33 +0200 (CEST)
Date: Fri, 24 Oct 2025 08:43:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] drm/panthor: Introduce framework for
 architecture-specific features
Message-ID: <20251024084327.3332d548@fedora>
In-Reply-To: <20251014094337.1009601-4-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-4-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Oct 2025 10:43:30 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> Add a framework to support architecture-specific features. This allows
> other parts of the driver to adjust their behaviour based on the feature
> bits enabled for a given architecture.

I'm not convinced we need this just yet. AFAICT, the only feature flag
being added in this patchset is PANTHOR_HW_FEATURE_PWR_CONTROL, and
most of this is abstracted away with function pointers already. The
only part that tests this FEATURE_PWR_CONTROL flag is the
initialization, which could very much be abstracted away with a
function pointer (NULL meaning no PWR block present). There might be
other use cases you're planning to use this for, so I'd like to hear
about them to make my final opinion on that.

> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_hw.c |  5 +++++
>  drivers/gpu/drm/panthor/panthor_hw.h | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index b6e7401327c3..34536526384d 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -186,3 +186,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
>  
>  	return 0;
>  }
> +
> +bool panthor_hw_has_feature(struct panthor_device *ptdev, enum panthor_hw_feature feature)
> +{
> +	return test_bit(feature, ptdev->hw->features);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 39752de3e7ad..7a191e76aeec 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -4,14 +4,32 @@
>  #ifndef __PANTHOR_HW_H__
>  #define __PANTHOR_HW_H__
>  
> +#include <linux/types.h>
> +
>  struct panthor_device;
>  
> +/**
> + * enum panthor_hw_feature - Bit position of each HW feature
> + *
> + * Used to define GPU specific features based on the GPU architecture ID.
> + * New feature flags will be added with support for newer GPU architectures.
> + */
> +enum panthor_hw_feature {
> +	/** @PANTHOR_HW_FEATURES_END: Must be last. */
> +	PANTHOR_HW_FEATURES_END
> +};
> +
> +
>  /**
>   * struct panthor_hw - GPU specific register mapping and functions
>   */
>  struct panthor_hw {
> +	/** @features: Bitmap containing panthor_hw_feature */
> +	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
>  };
>  
>  int panthor_hw_init(struct panthor_device *ptdev);
>  
> +bool panthor_hw_has_feature(struct panthor_device *ptdev, enum panthor_hw_feature feature);
> +
>  #endif /* __PANTHOR_HW_H__ */

