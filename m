Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF7DA095FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 16:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAA710F10D;
	Fri, 10 Jan 2025 15:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XsaKQJa1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E810F10D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 15:40:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68B7E40002;
 Fri, 10 Jan 2025 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736523627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSpc6VQBDb8JoEfMgCNEhRDbGhq1uPR/LeYIvEpv6E8=;
 b=XsaKQJa1dm9gvKtfk04b/ubKT3ff/t4Kpn/YpVN3Nizo87LlyZp8WUD16Pv5orCRashuaC
 XmSQuGhqCtqxKw+8YvamI8N09XCpRSzudCrhxJN6UsR32W3VgjEV2+1wWo0gwzrM0o1iOa
 n2NdoPVAK8qSwcvzaJUU6fUwln6WHzd9w4b+ia51sFAz/Bsf8af9X152YfaOIr7myAw0kG
 UI8pmzCw8yaMZ8vI32bJljU3RjNqG8vTfgJluENX2ReH5J4Qz70QQG+mjXA75Lk/XWWGdZ
 8SA1PRjdshzzFuKbljgsUKGN20N0HorIpcCflnLDWmdxC2IL697yEjkMfnJMVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Abel Vesa <abelvesa@kernel.org>,  Peng
 Fan <peng.fan@nxp.com>,  Michael Turquette <mturquette@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Ying Liu <victor.liu@nxp.com>,  Marek Vasut
 <marex@denx.de>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <20250106-fabulous-tapir-of-acceptance-c4e3e7@houat> (Maxime
 Ripard's message of "Mon, 6 Jan 2025 15:36:33 +0100")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <20241217-brown-wapiti-of-promotion-e3bec6@houat>
 <87bjx2tf3y.fsf@bootlin.com>
 <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
 <20250106-fabulous-tapir-of-acceptance-c4e3e7@houat>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:40:26 +0100
Message-ID: <878qri8yol.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hi Maxime,

>> The exclusive rate code could support this if it doesn't already do so.
>> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
>> clk_set_rate(parent, <new rate>) the core code should try to keep the
>> child at the constant rate, or fail the clk_set_rate() call on the
>> parent. It should be possible to confirm this with some KUnit tests for
>> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
>> parent changes the parent rate, we should speculate the new rate of the
>> child_A that's protected and fail if we can't maintain the rate. We need
>> to start generating a list of clks that we operate a rate change on to
>> support this though, because right now we rely on the stack to track the
>> clks that we change the rate of.
>>=20
>> Initially we thought that we could do this with clk notifiers. That may
>> work here, but I suspect it will be clunky to get working because clk
>> notifiers operate on struct clk.
>
> I think notifiers are great for customers, but not really adequate for
> the clock drivers tree. Indeed, you can only react to a (sub)tree
> configuration using notifiers, but you can't affect it to try something
> new that would be a better fit.
>
> Like, if we have a PLL A, with two child clocks that are dividers. B is
> initially (exclusively) set to freq X, and then you want to set C to 2X.
>
> The best thing to do is to set A to 2X, and double B's divider. It's
> simple enough, but we have no way to try to negociate that at the
> moment.

Indeed. Do you have something in mind to address this situation (eg. a
new clk provider or core API)?

Thanks,
Miqu=C3=A8l
