Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A559EB67
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 20:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B111810F053;
	Tue, 23 Aug 2022 18:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1110FDA9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 18:50:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 358DB6171B;
 Tue, 23 Aug 2022 18:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01422C433C1;
 Tue, 23 Aug 2022 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280629;
 bh=nmKhuu0H6Ctnqky5A5KnLiUKuE2JCD8f4yeVBOb27DY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=S+VkSR1lDtb3OUe5P9NME+KHmd4RosTBmqROo6DCvQltfgWMqXQG7Ie0M/UB4XHI/
 r73QsNGJ5oE7EmD1xjwOvWTqHWYpRfc024xt/P1gM0c2blZAKiviqdKyNFAvuy32nU
 xDNUizqGh3SfKJyyPqGJ1AlrWQndx8G224V5HWsBA100tCQhf+Twwy8CDB0ah+a6nm
 2i+P90YtBt1FHUWsmqOuhZC4AOefDVGtyesAYYy9WbD/44Y0WqvflVHA8vwc7hKfFV
 LGaZtsfIbKqI4FdZWpiNlir5zkowA80vbXDZtxX4ITLJXav4Uw+Dx9IuvfjWH1bIEf
 6cHtR3wmfaPUg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1660934107.git.mazziesaccount@gmail.com>
References: <cover.1660934107.git.mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v3 00/14] Use devm helpers for regulator get and
 enable
Message-Id: <166128062169.1031899.17830320984922202786.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Xiang wangx <wangxiang@cdjrlc.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Alexandru Ardelean <aardelean@deviqon.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alexandru Tachici <alexandru.tachici@analog.com>, Jean Delvare <jdelvare@suse.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Alexandru Lazar <alazar@startmail
 .com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org, Nuno Sá <nuno.sa@analog.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>, Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022 22:16:48 +0300, Matti Vaittinen wrote:
> Use devm helpers for regulator get and enable
> 
> NOTE: The series depends on commit
> ee94aff2628b ("Devm helpers for regulator get and enable")
> which currently sits in Mark's regulator/for-next
> 
> A few* drivers seem to pattern demonstrated by pseudocode:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/14] docs: devres: regulator: Add new get_enable functions to devres.rst
        commit: 9048b9912f767ea9609e520678def446af804771

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
