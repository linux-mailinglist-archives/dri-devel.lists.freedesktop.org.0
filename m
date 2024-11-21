Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343AC9D55C5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A434610E423;
	Thu, 21 Nov 2024 22:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KbtcTKIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8077D10E423
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 22:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 053DA5C5783;
 Thu, 21 Nov 2024 22:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652FCC4CECC;
 Thu, 21 Nov 2024 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732229301;
 bh=T1fLa13P8mDRrOP8+gS00AgdX2GjJzhR8vsIwPskW5o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KbtcTKIuHq2k3j4iGWdl9hio2PzCgQZ2jAGMlIZrsvhB+x9GnstYr/Mjh7a4lbZyK
 yfSfwfcBgP+goaruiHsFw6eZFKnbmDMB3P/qxK/QoYeEN2OH06trSzSIL8y0KH4hcN
 WBYgvjeEGhJ2TxmV2wqGmws0kjEeQ/OBRRLOaK/yrnPUrzxktAK8da62qu0Bb3OCHz
 1RDGnT1Q0fBb23ioUIRBAiE8/UkqcKxJGOAHB1h+vHZGa5XFq6xasIuytqIiTB5DJg
 HJKT7K2RXFaSxnWDZ3vBmEoG5fiwUB9GdARnt12qMy4kFZWfHQoQXYwiBcUafMMXFP
 wZTwIzdvOwu4Q==
Message-ID: <9c072de477d913acffa50696c426d8ff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
Subject: Re: [PATCH 31/37] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Date: Thu, 21 Nov 2024 14:48:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Dave Stevenson (2024-10-23 09:50:28)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> For performance/power it is beneficial to adjust gpu clocks with arm cloc=
k.
> This is how the downstream cpufreq driver works
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

With Maxime's suggestion:

Acked-by: Stephen Boyd <sboyd@kernel.org>
