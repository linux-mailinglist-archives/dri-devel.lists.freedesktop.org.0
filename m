Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881469E2D54
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 21:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEBB10E164;
	Tue,  3 Dec 2024 20:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jZbD5cB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C01210E164
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 20:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87DD1A40BB6;
 Tue,  3 Dec 2024 20:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FBFC4CECF;
 Tue,  3 Dec 2024 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733258434;
 bh=4UjsiC0KsWowBXHcrV7nZu5jRThZpr9xrSV3uf9AHMY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jZbD5cB+8cM095ogWta+4NF5rrGHNyBhea4lomQM43bAe6yABlDfcBYrnNi1biFp/
 YU01SFTTaCuEf7yRX102QK1LMjnUlK4W7XdvR3m1DFL2b+mltLTCveVTd4h+9EWX74
 uADzl9CJNHLdocs3bt/4VEogA6aLuG/H1+zJiUsnhHp3jM3iOfpRdpYSx/clEjUKt4
 0WLEhyZl72QMs5JJFv1QEIq6FzQz463EpnLWsjXp2t8d3vq80LTnImUVlJQ6ET8boQ
 e83xR84FZ547Wz2dmicOwaSjwrfa50SdptnQHe/GWx28Z5Wm70sderqhxnwSowWALh
 C+YGurMCYJ2TA==
Message-ID: <0c17fbef1e4dd692e2459255af0b4ace.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntD7tf6+PXKdWe8_KjCiPoemR0RQDiaHHndtjutOLGbR1w@mail.gmail.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com>
 <20241122-orthodox-mantis-of-reading-2dcdcf@houat>
 <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com>
 <CAPY8ntD7tf6+PXKdWe8_KjCiPoemR0RQDiaHHndtjutOLGbR1w@mail.gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display
 hardware
From: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Date: Tue, 03 Dec 2024 12:40:32 -0800
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

Quoting Dave Stevenson (2024-11-27 06:43:38)
>=20
> V2 includes fixing Maxime's comment on "[PATCH 31/37] clk: bcm: rpi:
> Allow cpufreq driver to also adjust gpu clocks" that Stephen also
> commented on.
>=20
> Stephen: Sorry, maintaining newbie, particularly for clocks. I see in
> linux-clk patchwork they are marked as "Awaiting Upstream". What, if
> anything, do I need to do on those?

I wasn't expecting to take the patches. If you want me to do so please
resend the clk patches and I'll apply them for the next merge window..
