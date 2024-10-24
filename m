Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E549AE9F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94F210E962;
	Thu, 24 Oct 2024 15:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eecpF2i6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342CE10E962
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E27665C4B3B;
 Thu, 24 Oct 2024 15:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2673C4CEC7;
 Thu, 24 Oct 2024 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782679;
 bh=I76Gec9xgruH7NQkJwJSzMFNiwa11T/xDsEdrENqZqc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=eecpF2i6nIOyz1a7oqzObncQ22J0O0Li2FE+nn49+jrs8lQ31Zm3M6QoqBuLBpPZT
 yJXvJVHaKsqyAIcnf9GESQF/M3UErCbD5Cw1qwi7TZM96TsRyivmRuHNq4twPmtdri
 l9gYBKyoO9Zlv6R1wcscx91VUsQWDLFtVTLe2GVky3TZ2FWhxhG2uA8N8Sot+fdUk3
 OnJ03gBx4abnmCD4+Fd7eENwa/aEuGVrY7tg0phennnE1coK1bIs5FD8JBhJhhASR2
 iC/bqhMPNaTvkLDuDIeYMA0DaUlPM/IiTisRcDr4JuHFfdKFio+oDT9n2JUV3HOr8q
 6xfQ6wjA2u3HQ==
Message-ID: <9202d665c15915cb087d8be5f02fee4c@kernel.org>
Date: Thu, 24 Oct 2024 15:11:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 29/37] drm/vc4: Drop planes that are completely
 off-screen or 0 crtc size
In-Reply-To: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
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

On Wed, 23 Oct 2024 17:50:26 +0100, Dave Stevenson wrote:
> It is permitted for a plane to be configured such that none
> of it is on-screen via either negative dest rectangle X,Y
> offset, or an offset that is greater than the crtc dimensions.
> 
> These planes were resized via drm_atomic_helper_check_plane_state
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
