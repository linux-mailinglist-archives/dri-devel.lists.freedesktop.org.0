Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCD9AE9E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC86010E960;
	Thu, 24 Oct 2024 15:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z9EC93Ux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388D610E962
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:10:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E5F125C6023;
 Thu, 24 Oct 2024 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FE0C4CEC7;
 Thu, 24 Oct 2024 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782604;
 bh=VMFs9dmln36rULHELZnrUMSHBuywGkITllI3k0F8SzM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Z9EC93UxAcJyaTtDojfNt/Fu3i3015IzTXL6vRFRwso6gj8phUyldJ7Ekf5kjNDVT
 4N/K+qPmyTw5fFrBwxp3kO/DPWYf3HwhLRsY4Npr7VA/UacwXiNt3QDnAxHE+vk18x
 6KT5LkITQb5Qdgy9o8vQfU0iWMsPJ99kHFbAP5lKaAZwW7Af4GRdW6hShEjy/k0J8Q
 yJybhfMppI7PMbJiYREK5ZOQsy0qCVzxRSLnExvemUjkVWmv0Q/Hrq3buRE7NdpGxx
 BMIAlMUmtHwn/xfV+Ci85xYy07nFTmncxUt6RTL1Q1OxR+by2JNsJDcdp2WqzPOim1
 jevI+VjrTD1UQ==
Message-ID: <76a344eb23149909d13ea46c25b97684@kernel.org>
Date: Thu, 24 Oct 2024 15:10:01 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 28/37] drm/vc4: Enable bg_fill if there are no planes
 enabled
In-Reply-To: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
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

On Wed, 23 Oct 2024 17:50:25 +0100, Dave Stevenson wrote:
> The default was to have enable_bg_fill disabled and the first
> plane set it if it wasn't opaque and covering the whole screen.
> However that meant that if no planes were enabled, then the
> background fill wasn't enabled, and would give a striped
> output from the uninitialised output buffer.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
