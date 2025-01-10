Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A06BA095E4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 16:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD7210F108;
	Fri, 10 Jan 2025 15:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="il0RCBZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293EC10F108
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 15:38:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF21660005;
 Fri, 10 Jan 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736523491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3zvNqD36Ly2VZ9tkKT3O7sEgisvEdurJQ6LVf2r8P8=;
 b=il0RCBZtzS8MM8CP4vxI7ia+4m8a8on3dAjyRA714QxWf1h7Cemz9TvNjcwrsEsXeM+0fo
 2GlfKRiqgDw0g6LFkFFsene205lRx/b1e2AnEsNq8nmkc5vA7INqPqwhgo14eNUtnvnKc2
 wBgsGEKC09Aymfm+L7iAn3Rj8OIMS6X7ImxVv4TMlEIK3DZoFbsGvAf+7ftNkoQ50zmUuJ
 f7Syqi7PfIWaV5uT85CZja6zaC+3yMaGQdMyIPtpmBMJSKdHur+CpJI5L1KkOv95v0/U90
 10O/L9AgIj/PgbDAGZSZQkr6o9KeWd2T0Nd14/0S/BMnDJHEn1AIZSuN+MTneQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>,  Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Ying Liu
 <victor.liu@nxp.com>,  Marek Vasut <marex@denx.de>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org> (Stephen
 Boyd's message of "Mon, 30 Dec 2024 17:22:56 -0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <20241217-brown-wapiti-of-promotion-e3bec6@houat>
 <87bjx2tf3y.fsf@bootlin.com>
 <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:38:09 +0100
Message-ID: <87msfy8yse.fsf@bootlin.com>
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

Hi Stephen,

>> The idea is: if the flag is set, instead of accepting the new upstream
>> rate and recalculate the downstream rate based on a previously set
>> divider value, we change our divider value to match the same frequency
>> as before. But if we cannot, then we just keep the old way.
>>=20
>
> The exclusive rate code could support this if it doesn't already do so.
> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
> clk_set_rate(parent, <new rate>) the core code should try to keep the
> child at the constant rate, or fail the clk_set_rate() call on the
> parent. It should be possible to confirm this with some KUnit tests for
> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
> parent changes the parent rate, we should speculate the new rate of the
> child_A that's protected and fail if we can't maintain the rate. We need
> to start generating a list of clks that we operate a rate change on to
> support this though, because right now we rely on the stack to track the
> clks that we change the rate of.
>
> Initially we thought that we could do this with clk notifiers. That may
> work here, but I suspect it will be clunky to get working because clk
> notifiers operate on struct clk.

I see, thanks a lot for the feedback, I'll have a look.

Thanks,
Miqu=C3=A8l
