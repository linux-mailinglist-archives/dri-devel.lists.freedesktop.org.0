Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D8B3A127
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90E110E9CE;
	Thu, 28 Aug 2025 14:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NhRCnLi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6ED10E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:20:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 03DAD601A9;
 Thu, 28 Aug 2025 14:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1216DC4CEED;
 Thu, 28 Aug 2025 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756390833;
 bh=lf36fcVdxXkGVEzJgWrnSFwcXRqDcy56SXyVsTRCxmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhRCnLi+YncysdGOzA4HIa0G0pRTqZOLEmQ6LhvY2CFNvx3g7Fza69XzDm0bgxAUO
 9Kbe/D82zCh0e8rPaHYRoLaR6+MhEmbor4mgRmcCqBwymSTF3/6XFeZFvcpjvs35nB
 7v3niT3IvRhhMfnSIzk7k/T/kNMO/fvSn1SNIz0zPl6NcM7gU7JF3GqeBzBgSSa8II
 YXtHQQ6gMiUBBST3MYmQIi3iCqT0jwHxE0qD2U07RWdKN6aZrAdwAb3LujUGI1l8zi
 nm22KwZQy/JhC4hgRFAHlW1XvSEvpKJW+skpefeWcbDIyAn4I9+db09ltnPBMG/BVb
 5iPwphVSiVoXQ==
Date: Thu, 28 Aug 2025 16:20:30 +0200
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 29/37] ASoC: apple: mca: Add "apple,t8103-mca" compatible
Message-ID: <aLBlrphpYmJs4q8p@finisterre.sirena.org.uk>
Mail-Followup-To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-29-507ba4c4b98e@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uf6ivQ/nvSUaKtJ/"
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-29-507ba4c4b98e@jannau.net>
X-Cookie: Filmed before a live audience.
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


--uf6ivQ/nvSUaKtJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2025 at 04:01:48PM +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,mca" anymore [1]. Use
> "apple,t8103-mca" as base compatible as it is the SoC the driver and
> bindings were written for.

Acked-by: Mark Brown <broonie@kernel.org>

--uf6ivQ/nvSUaKtJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwZa0ACgkQJNaLcl1U
h9AZzAf9FwGiLEV1f73F5zd675Y2KqApY8qs1WdHJoMsbVF2pyIG+BaPOZFWev+Y
W/CGJO/0ug8Dva88HgCqfrQsT5zF1pUdtWCIZtY3aMXaP9xP/c3LdBbKB1I9ZEQm
20sIQJ1uLAvisfFM43hjaucZW+C6Oey6mIMppFulQWLE5grarlOHZooIDxwLZkIl
ImPZcOC2GRY4oA0Q7zduXDpDmBOe5ERiXCHfzq2JCS71tDLQnSqKbsb7xOdn5zVZ
8dikDaRXkjo8Tu17L1s6d+vFZmFEXw2IJ+fX0+s1lkb+me0WQitFjcJefrfeeaIV
3Cn6PEYlYDOwQ6jpDJil1kegfjJHOA==
=avIu
-----END PGP SIGNATURE-----

--uf6ivQ/nvSUaKtJ/--
