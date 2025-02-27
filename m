Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60340A47FD2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 14:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6E10EAE4;
	Thu, 27 Feb 2025 13:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u7PEQG2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1275410EAE4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 13:48:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42E7761F30;
 Thu, 27 Feb 2025 13:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E80BC4CEDD;
 Thu, 27 Feb 2025 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740664103;
 bh=+0o56Rl9c9XlxO66ciG8cF7751qtwRokbDOXu3oKKI4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=u7PEQG2j83U1EUgccAsv7ZZeyzoXGP5E3eyEnhw4NoElI1P1PQduAFpk3Aw26XQga
 MU1FsSM2xWeVk3888IvozG2rU0czOy6ksHQKL+ms88vEKd69Oz3Wn/JfI5RXTFTwNk
 wfGNc/kEM3DNOFtXZ34ZRYeTDGKQ9rq2QA/8JJ070MZrbICKSyOueWiZTR8CewZk/4
 YNa2OgN5lkcQjeMyprtE571tUFUuQFiRLywSCD55mJu1bl6w3MNEN7o1f2vw9759LK
 TWM2LHQPLAcDuMVzwA6GP/6GMrZpDf8H3uZGfG3Gq2L3gj60l5E8fYaRb6MO8wqJWV
 z16TlfgV2NvRQ==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, Johan Jonker <jbx6244@gmail.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, 
 Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-serial@vger.kernel.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ulf.hansson@linaro.org, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, 
 Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Shresth Prasad <shresthprasad7@gmail.com>, Tim Lunn <tim@feathertop.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>, 
 Dragan Simic <dsimic@manjaro.org>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
Subject: Re: (subset) [PATCH v3 00/15] rockchip: Add rk3562 SoC and evb support
Message-Id: <174066409262.43847.18143301735398340521.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 13:48:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
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

On Thu, 27 Feb 2025 19:18:58 +0800, Kever Yang wrote:
> This patch set adds rk3562 SoC and its evb support.
> 
> I have split out patches need driver change for different subsystem.
> And all the modules with dt-binding document update in this patch set
> do not need any driver change. I put them together to make it clear we
> have a new SoC and board to use the new compatible. Please pick up the
> patch for your subsystem, or please let me know if the patch has to
> send separate.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[07/15] dt-bindings: spi: Add rk3562 support
        commit: 825687c1662c53ecda991adf0ecfd8dd3d864043

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

