Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8939AEA18
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2760610E2BB;
	Thu, 24 Oct 2024 15:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UV0Y7R/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4189310E963
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:14:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2720EA45434;
 Thu, 24 Oct 2024 15:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B0DC4CEE4;
 Thu, 24 Oct 2024 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782886;
 bh=Fhhtx0SKw8R7fwmiWBICVYOc8q6+cAez3j0Ek1hM190=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=UV0Y7R/6YQiFBOZvJUQydU4Yxt+U9SxMjlRxZMea1owRTDM7Fti6imYGZVsIfWN41
 oDctMYnTbJkbl3KGUJT+O1oXccwmPXnsC/EhPzxPzT/Lle/JOhuEXOXAKocPRREOom
 pTNzMTAIv3X/bQqAFV5AaPLK7Zc5DyqeJeVz0+nyoasRrT5zawOKBSgfqyI+m3RHVg
 3mYcbqSAiNv+U5FoLoYpHzXS3BCnWzINmPdSbeXL41n/j6FBSHLIdYaHnatCaxhwMR
 igF5ds7OCBby6INyeeOz0c9DLocUYF1KlKyHVDOlzuu+hvA8E5RVkxbLwbENIzdlIE
 YbwEs/93bZDJw==
Message-ID: <baa171fd4e0cd7ddf2d4ce593b690ed3@kernel.org>
Date: Thu, 24 Oct 2024 15:14:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 02/37] drm/vc4: Use of_device_get_match_data to set
 generation
In-Reply-To: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
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

On Wed, 23 Oct 2024 17:49:59 +0100, Dave Stevenson wrote:
> Use of_device_get_match_data to retrieve the generation value
> as set in the struct of_device_id, rather than manually comparing
> compatible strings.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
