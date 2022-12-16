Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19064F0B8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D0910E613;
	Fri, 16 Dec 2022 18:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4920810E613
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:08:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F7z-0005DK-Hd; Fri, 16 Dec 2022 19:08:11 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F7x-004yoa-KQ; Fri, 16 Dec 2022 19:08:10 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F7x-000DGO-Pm; Fri, 16 Dec 2022 19:08:09 +0100
Message-ID: <3ea4400913d3da63ce875a0ac0aa74e46c40c1f7.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: Fix overlay plane width
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
Date: Fri, 16 Dec 2022 19:08:09 +0100
In-Reply-To: <5ee075af33e5cee085830ae8237a94706d62d27b.camel@pengutronix.de>
References: <20221108141420.176696-1-p.zabel@pengutronix.de>
 <5ee075af33e5cee085830ae8237a94706d62d27b.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2022-12-02 at 16:43 +0100, Lucas Stach wrote:
> Am Dienstag, dem 08.11.2022 um 15:14 +0100 schrieb Philipp Zabel:
> > ipu_src_rect_width() was introduced to support odd screen resolutions
> > such as 1366x768 by internally rounding up primary plane width to a
> > multiple of 8 and compensating with reduced horizontal blanking.
> > This also caused overlay plane width to be rounded up, which was not
> > intended. Fix overlay plane width by limiting the rounding up to the
> > primary plane.
> >=20
> > drm_rect_width(&new_state->src) >> 16 is the same value as
> > drm_rect_width(dst) because there is no plane scaling support.
>=20
> Heh, I stumbled at exactly this point while reading the code changes
> and was about to suggest it be added to the changelog until I realized
> that it's already here. :)
> >=20
> > Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Thank you, applied to drm-misc-next.

[...]
> There's a opportunity for a follow-up cleanup here:
> "drm_rect_height(&new_state->src) >> 16" is used multiple times in this
> function, which could be replaced by using this local height variable
> instead.

Will create a follow-up patch.

regards
Philipp
