Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956EB8DF74
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 18:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE7210E112;
	Sun, 21 Sep 2025 16:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S27S9Jad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F7510E119
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 16:25:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9ACE4601AB;
 Sun, 21 Sep 2025 16:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300F8C4CEF7;
 Sun, 21 Sep 2025 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758471923;
 bh=OtNY3mZb+yYSBJf2rxALF2ewBk5OdFI056vRwJ4aepI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=S27S9JadoG9UKdmIkd4Bwr0qPl6ZUGqVre7SQ2mnHuVVJ1mqZx2oc+qo52g0vPyNL
 Wohf9xmDPeyAk/dAWAIRvvgPs+E7onwrD/NS3ccl6bRG2+k3RlNWQGMYN8biB9FgPx
 W+tSm1NseZKdwlFwDX2HIsNnhOQSKHVxwhc1t/0TytdvrUMznpPIRKQlrFDrhE/iNe
 L2pJEhskt7wNu8fYRtft+wYdAY0cqztve762qMKpu+aEpuchJVgQn5pgHAvsd37b7E
 L6d4FycfLOwQ1qpNcWupZGiijOcBAD2HqCDlwnVQsHPHqS/QeB7FcsH+coEk9GPyck
 CjP1eoHxgKkJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 3/5] clk: bcm: rpi: Maximize V3D clock
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
Date: Sun, 21 Sep 2025 09:25:21 -0700
Message-ID: <175847192183.4354.13711226446879462833@lazor>
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

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:19)
> Although minimizing the clock rate is the best for most scenarios, as
> stated in commit 4d85abb0fb8e ("clk: bcm: rpi: Enable minimize for all
> firmware clocks"), when it comes to the GPU, it's ideal to have the
> maximum rate allowed.
>=20
> Add an option to maximize a firmware clock's rate when the clock is
> enabled and set this option for V3D.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next
