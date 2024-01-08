Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B6826AD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF210E1BC;
	Mon,  8 Jan 2024 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7510E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1704706620; x=1736242620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9u6X44w9k8SfVi17eVGHwXQBmC6WQZ/mGwNTui5DzTc=;
 b=bsDu8geCPTfNV3BUMGCYnDYbNeHEFLQ+p2HtKOAdX6JnUDNKI4k2aYdG
 x8PcBnt6KYf1rtQgNqHOz+91VbZmuHkZy6KN3S+tm7swe3XAYeI3V277W
 pm2Dr/LDC2BVEHo0cSgyrOKIW8zod6VebS4h5UMltgNWzkkjKUO8C4qSv
 SJi15rqyfvtsBSUNiQqWiRZ/u06qOyCXdp1QvsR9fIvoSjWcE+fw3j+Oy
 pTksJEdDNrl7QkwdM52arhavsEjhB2HLhNRhypvEtQKUps5d7MSCb7s/G
 5/fQt2X/VY0J0uf1tZurxU3OaM6KzBWL5/BcB6BS3kAFnW33TBuISX9RO w==;
X-IronPort-AV: E=Sophos;i="6.04,340,1695679200"; d="scan'208";a="34781875"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Jan 2024 10:36:58 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0EE9F280075;
 Mon,  8 Jan 2024 10:36:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Francesco Dolcini <francesco@dolcini.it>,
 Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH 3/6] drm/bridge: imx: imx-ldb-helper: Use dev_err_probe
Date: Mon, 08 Jan 2024 10:36:57 +0100
Message-ID: <6100371.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240104192808.GB20694@francesco-nb>
References: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
 <20240104191928.GA20694@francesco-nb> <20240104192808.GB20694@francesco-nb>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Francesco,

thanks for the feedback.

Am Donnerstag, 4. Januar 2024, 20:28:08 CET schrieb Francesco Dolcini:
> On Thu, Jan 04, 2024 at 08:20:37PM +0100, Francesco Dolcini wrote:
> > On Mon, Dec 18, 2023 at 11:57:15AM +0100, Alexander Stein wrote:
> > > This simplifies the code and gives additional information upon deferr=
al.
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >=20
> > Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> mumble, looking at this more closely with your change you stop using
> the print wrapper from drm_print.h. Probably a more generic solution is
> needed there?

You are talking about DRM_DEV_ERROR()? Well, it's deprecated, see [1]. Inst=
ead=20
of dev_err, I rather use dev_err_probe because this is what we want to use=
=20
here.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/
include/drm/drm_print.h#n365
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


