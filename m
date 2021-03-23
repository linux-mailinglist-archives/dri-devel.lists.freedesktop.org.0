Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FCE34614D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4E56E0EA;
	Tue, 23 Mar 2021 14:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0115.hostedemail.com
 [216.40.44.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6636E0EA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:19:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 5CD28180931AA;
 Tue, 23 Mar 2021 14:19:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2901:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:6119:6742:7576:7652:7903:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12295:12296:12297:12438:12679:12740:12895:13069:13311:13357:13439:13894:14181:14659:14721:21080:21451:21627:21660:21966:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: glove95_5b1863d27772
X-Filterd-Recvd-Size: 2732
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Tue, 23 Mar 2021 14:19:01 +0000 (UTC)
Message-ID: <7ef41d771af88f84b650ff83771cd59eb745634f.camel@perches.com>
Subject: Re: [PATCH] drm/imx: fix out of bounds array access warning
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 23 Mar 2021 07:19:00 -0700
In-Reply-To: <20210323130550.2289487-1-arnd@kernel.org>
References: <20210323130550.2289487-1-arnd@kernel.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-03-23 at 14:05 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> =

> When CONFIG_OF is disabled, building with 'make W=3D1' produces warnings
> about out of bounds array access:
> =

> drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
> drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below =
array bounds of 'struct clk *[4]' [-Werror=3Darray-bounds]
> =

> Add an error check before the index is used, which helps with the
> warning, as well as any possible other error condition that may be
> triggered at runtime.
[]
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
[]
> @@ -197,6 +197,12 @@ static void imx_ldb_encoder_enable(struct drm_encode=
r *encoder)
> =A0	int dual =3D ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
> =A0	int mux =3D drm_of_encoder_active_port_id(imx_ldb_ch->child, encoder);
> =

> +	if (mux < 0) {
> +		dev_warn(ldb->dev,
> +			 "%s: invalid mux\n", __func__);

trivia:

Any real reason to make this 2 lines?  It fits nicely in 80 chars.  Maybe:

		dev_warn(ldb->dev, "%s: invalid mux: %d\n", __func__, mux);

or maybe:

		dev_warn(ldb->dev, "%s: invalid mux: %pe\n",
			 __func__, ERR_PTR(mux));

> @@ -255,6 +261,12 @@ imx_ldb_encoder_atomic_mode_set(struct drm_encoder *=
encoder,
[]
> +	if (mux < 0) {
> +		dev_warn(ldb->dev,
> +			 "%s: invalid mux\n", __func__);

etc...


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
