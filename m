Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A6D9FEC11
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 02:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DC810E5B5;
	Tue, 31 Dec 2024 01:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ineBT4yO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9257F10E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 01:09:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1327CA40FE6;
 Tue, 31 Dec 2024 01:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2294DC4CED0;
 Tue, 31 Dec 2024 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735607374;
 bh=R2977F/vnqyUBER9tNZQq405KupuOFUv4wjLFhd48yk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ineBT4yOUiXBvn2+CodK1YF7hwKVCCNuLyQu5OH4u16pqhUgBmf7U9QkzPa63WGk4
 Zg5Q1rdhujUIxFErggh6/iTv1PSrWghsyEPFEwBeKMnhNIlLzz3VdXum0ysOFo8KuY
 bIdeuTIuUj9ZwsngrvVFS66fLt8LBhXRCvWSmLzRsLSAhLEBaKCMmi2CnkP31sNL1R
 fHi5rTvipoQyzOhMQsqheNpGiLCUkSsEzcoF7Y75/QOmbamiDA/ih3zz0gAfZ1Xl08
 iKDt/xGirMiRuvToAgNTnJbtpOOl0k27CEThxpeahTgUTqmr+nMnpYfoK/qt+9USXM
 R0pFoa27MI7eQ==
Message-ID: <3bcf5bc1007c9ed2900780fe07e66cb8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87jzbqtfc3.fsf@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org>
 <87jzbqtfc3.fsf@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Ying Liu <victor.liu@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Dec 2024 17:09:32 -0800
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

Quoting Miquel Raynal (2024-12-23 10:38:20)
> Hi Stephen,
>=20
> >> +/* do not passively change this clock rate during subtree rate propag=
ation */
> >> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
> >
> > Why doesn't rate locking work?
>=20
> Can you be more specific? What function from the API is supposed to do
> what I need? AFAIU, none of them is properly locking the rate during a
> subtree walk, but if I misread one of them, I'd be glad to drop all this.
>=20

It's clk_set_rate_exclusive() as Maxime also asked about in the other
thread.
