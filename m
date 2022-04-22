Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF850C263
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 00:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CD510E85A;
	Fri, 22 Apr 2022 22:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1D210E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 22:57:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8D7CB8327C;
 Fri, 22 Apr 2022 22:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AA8C385A4;
 Fri, 22 Apr 2022 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650668265;
 bh=75MjpNBFgPBBs/emeCkhjLel+t8PPVsxFTXQq2hBCKk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=g/QW+a2GOBE1soHbImaHItjuBaPtHqq1YJ1tR9FgrubXMsr1IxNAoB869MTaiquJy
 je+bRQ99B11eRYZhHi6I07GE7t+AB2idXITMEaKPumhH2cquFUCO7dumAvjZsIDjDR
 LNAZCk6LzAbjfD51jNXIILyW1TwVFch3nYUXhltbsLHPKNoAkTrG6/rSPf/xj7UGzi
 Ib2rbtAJ+sjU5etcq5ez8Z9Uk9EmuGs61b7o/e8ZWkd2kT59IkZbgnqiTor7iwCkVe
 SnERbrkeq5ti4nn8I/Ae4srlV0GT8BTGG27eEBhqeXCmrT4LL+eziz5mvC4m8ldq7e
 67uQrCgdvjvIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419163810.2118169-38-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-38-arnd@kernel.org>
Subject: Re: [PATCH 37/48] ARM: pxa: move smemc register access from clk to
 platform
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 robert.jarzmik@free.fr
Date: Fri, 22 Apr 2022 15:57:43 -0700
User-Agent: alot/0.10
Message-Id: <20220422225745.64AA8C385A4@smtp.kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2022-04-19 09:37:59)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The get_sdram_rows() and get_memclkdiv() helpers need smemc
> register that are separate from the clk registers, move
> them out of the clk driver, and use an extern declaration
> instead.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Link: https://lore.kernel.org/lkml/87pnielzo4.fsf@belgarion.home/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
