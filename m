Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341BB8DF67
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 18:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7719E89DC0;
	Sun, 21 Sep 2025 16:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oJ8IiKhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC44389DC0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4BF343EA5;
 Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5766BC4CEE7;
 Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758471909;
 bh=T9JqLTewmUpzp1OJfKf6FYT+qzF9twZfYc+1+MFwbns=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=oJ8IiKhJtTlROb1iPY4bymSBTzOt4iHwMlN82VPt3hV5sb3iYv40IvlHwq+Z7E0p5
 3uT6ACJVpb2nhbJHQZY9GGQIST+pXrxzEbwIOHMJ/T/d0rlCcRyn3FUorKVHTthbx1
 TIJNaIZ4xbPSUtCl+h9CKJpg65ChDBizkk9RPLPz8Rg4THV34TSgscVESAOJ1nbJ1q
 Iw2P9LOvb7yH4u7RrwEeiAdmhrylETRStAoqM8+RfF1s0pJTnN1i69I1qTZjvaNzPA
 JNmdnioSuwINEixg1bdWE70tEkNyozV1d4GK50yIH6sbt6gAbGOSCmfmw6b336ORbI
 RPZVDp8XENiFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware fails
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
Date: Sun, 21 Sep 2025 09:25:07 -0700
Message-ID: <175847190778.4354.11122681024032617561@lazor>
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

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:17)
> From: Stefan Wahren <wahrenst@gmx.net>
>=20
> In contrary to raspberrypi_fw_set_rate(), the ops for is_prepared() and
> recalc_rate() silently ignore firmware errors by just returning 0.
> Since these operations should never fail, add at least error logs
> to inform the user.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next
