Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAC9AEA21
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55310E963;
	Thu, 24 Oct 2024 15:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EWjQjEyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C216010E963
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:16:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9EB1F5C601A;
 Thu, 24 Oct 2024 15:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC13C4CEC7;
 Thu, 24 Oct 2024 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782962;
 bh=/gnpu4B8t4IL7ynEXrUUxsgwtBS+XtHTbgdzxW9txJc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=EWjQjEylN9jN2AYF2Z+Buio7/U4Het2kbl4zvp7VcNMpe6uoxAQnKKAheRPTROr1y
 4KXRC7fWnDWpF3EOlNWbZhf7g5pYMZrH/GOJ7zGGnEop5veigljsQuodcz56osmzJ5
 myqrlmGwY+71MRipkTD0WB6g4wWycrRyhrgFd2ChRzAia1fuC8CZR3SvriCiaElllI
 rBTRXObrnyhUHOEXb32JT8kEDLsDSaMEqCHVStep7+CGKa6NSuVeXQvSlqKDW1EdXV
 puab9WgqJpvvQXLLnMUHWE05nGDShEetrFoMi9HspQhyDJfo+j8dBPImpNV5++Wcsr
 DMxmwgT9KrjOA==
Message-ID: <499656b677fc13544f5e0e46e5e887ec@kernel.org>
Date: Thu, 24 Oct 2024 15:16:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 03/37] drm/vc4: Fix reading of frame count on GEN5 / Pi4
In-Reply-To: <20241023-drm-vc4-2712-support-v1-3-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-3-1cc2d5594907@raspberrypi.com>
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

On Wed, 23 Oct 2024 17:50:00 +0100, Dave Stevenson wrote:
> The frame count values moved within registers DISPSTAT1 and
> DISPSTAT2 with GEN5, so update the accessor function to
> accommodate that.
> 
> Fixes: b51cd7ad143d ("drm/vc4: hvs: Fix frame count register readout")
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
