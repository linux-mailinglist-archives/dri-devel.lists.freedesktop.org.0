Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E64737913C
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345089D4D;
	Mon, 10 May 2021 14:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEBE89D4D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 14:47:40 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7C6-0005Pe-Rg; Mon, 10 May 2021 16:47:38 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7C6-0001kA-B1; Mon, 10 May 2021 16:47:38 +0200
Message-ID: <f7f6f88a7eca343ceffb7921918f4a7d76ca765e.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: use drm managed resources
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 10 May 2021 16:47:38 +0200
In-Reply-To: <20210510142915.941460-1-l.stach@pengutronix.de>
References: <20210510142915.941460-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Mon, 2021-05-10 at 16:29 +0200, Lucas Stach wrote:
> The conversion to drm managed resources introduced two bugs: the plane is=
 now
> always initialized with the linear-only list, while the list with the Viv=
ante
> GPU modifiers should have been used when the PRG/PRE engines are present.=
 This
> masked another issue, as ipu_plane_format_mod_supported() is now called b=
efore
> the private plane data is set up, so if a non-linear modifier is supplied=
 in
> the plane modifier list, we run into a NULL pointer dereference checking =
for
> the PRG presence. To fix this just remove the check from this function, a=
s we
> know that it will only be called with a non-linear modifier, if the plane=
 init
> code has already determined that the PRG/PRE is present.
>=20
> Fixes: 699e7e543f1a ("drm/imx: ipuv3-plane: use drm managed resources")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Thank you, I've rebased and applied this patch on top of imx-drm/next.

regards
Philipp
