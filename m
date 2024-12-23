Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047159FB40E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 19:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CF210E004;
	Mon, 23 Dec 2024 18:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AEPx8jWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B4E10E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 18:38:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EDC2E0002;
 Mon, 23 Dec 2024 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734979102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5bZB9tN6Ej5m8fd1ZE4u2Ym/mpu03gi79bnPoBZCto=;
 b=AEPx8jWEsJxPYdnDQzfB8/CNI5cobqCAzbcuBIKwuH7AiTDdkAkZqNcIIIxmP58+epXv8L
 kEJJ8N3BI9y8tQyvVcwWb/Bd39aLZrP7JZvOoOycQlxobAzMhq3iLCPdj7yzhI71TQtzOq
 GY10Ulp4TwgoaFPbnLcGQCezegpVUm37z+kK5BBhJibptU7vUDgy6BNEwirZx4RCVf8I3h
 pAKQv84nw1J5JySH2a1viZeZy0g6aiBtT8pT6oxm3/WsxJlA0pkRRUIb2AU+bQzjoPiH7v
 mjdLpmzyYbPRkpSwCvqtbzprLhUMOxoL+DXaE4NdBJ1Va5H9u5jxReDFjPl0Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,  Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>,  Michael Turquette
 <mturquette@baylibre.com>,  Peng Fan <peng.fan@nxp.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Shawn Guo <shawnguo@kernel.org>,  Ying Liu
 <victor.liu@nxp.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org> (Stephen
 Boyd's message of "Tue, 10 Dec 2024 14:44:19 -0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:38:20 +0100
Message-ID: <87jzbqtfc3.fsf@bootlin.com>
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

>> +/* do not passively change this clock rate during subtree rate propagat=
ion */
>> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
>
> Why doesn't rate locking work?

Can you be more specific? What function from the API is supposed to do
what I need? AFAIU, none of them is properly locking the rate during a
subtree walk, but if I misread one of them, I'd be glad to drop all this.

Thanks,
Miqu=C3=A8l
