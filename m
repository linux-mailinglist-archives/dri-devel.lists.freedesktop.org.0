Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67384B8DF6B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 18:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC3D10E058;
	Sun, 21 Sep 2025 16:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fT1X8zT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC0210E058
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A2C1944CE4;
 Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67647C4AF09;
 Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758471914;
 bh=4+lFFGxaAXuhxyC60wyFAdmrF9GVKC8NDmo1gVQ1tBU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fT1X8zT50hl2pXeiLohHKGfigxhL9EZEmCFLlf9K+Tjlj6CalyQYnEuy+LCR5vJmB
 sYKmJ2puO2ZdxqRB8Di7vErQnPDTri9bU52sWICrAfYNeBq+hSEaNRzcf5DW8rd4um
 KOrc3oy0jNKIZrCh0DmYrWROTMxvcWT5pASMjfdw0zcmG9alW/d32IVRluZOYGrhzq
 K4SKVPaKHxpSyV+WhjNdDv/XJ/zUMXZniouXpLbpbSXYYvZxySPA50H5yB+c1+WDbS
 ywGHrLC62LlDnsRdo7sjREHp0d+eayNMyoRCkGO9Qg38eeSW+dPsbzX0okZ2PmBRWL
 MS49cRGiCb7UA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dom Cobley <popcornmix@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:13 -0700
Message-ID: <175847191319.4354.13436181095126788590@lazor>
User-Agent: alot/0.11
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

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:18)
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>=20
> From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>=20
> As now the clocks are actually turned off, some of them are now marked
> CLK_IS_CRITICAL, as those are required to be on during the whole system
> operation.
>=20
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inter=
face [1]
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> ---

Applied to clk-next
