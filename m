Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD491A05742
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE510E82F;
	Wed,  8 Jan 2025 09:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="hlPeaoxP";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="tOhnGu0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8952310E82D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736329610; x=1767865610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EwDzKG89Ymx/QU9yuPa/mg303XLB6Tg6l+Zi/jlAIcY=;
 b=hlPeaoxPemir/7rIVHTESYccndv14R9jvIS/EMBRESekmRRNYkEo/7He
 XnCsDCdxu7VZ5NCjWFmPcTwiFIfBUqwby153SO3iNnQt/eKT9T+ht89BD
 pGCKsULTB+Eby92qWpMKdIlg1jnj6C0aCq/4X9yQo/2ShwMWhGzpBkjBZ
 sBAJHhZpWzw6J9RNQ23eUrk+OVyqs6rUH2VrxUQrOPKsNdaAw+x6Sat6d
 5mdxOcZx/vV8DTz+wDXOjaQH6iQ1tygzMjr99oG91UF7jZ6tF1yNg04me
 3XBffrKPEjPk6m8v7RX8oQBURk6FC6zVX8/qOIy9HDp6RlsSvWEwMlqBu w==;
X-CSE-ConnectionGUID: IDIOolozTOC6mUvbW3yfcQ==
X-CSE-MsgGUID: x5ymoHilTAS0JUrHU8T2sg==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; d="scan'208";a="40916184"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:46:48 +0100
X-CheckPoint: {677E4988-4D-1D00F64B-E6C57517}
X-MAIL-CPID: 47C7EC1946D9CCB4724F46AA6969121D_3
X-Control-Analysis: str=0001.0A682F15.677E4988.00E8, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F30F160D36; Wed,  8 Jan 2025 10:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736329604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwDzKG89Ymx/QU9yuPa/mg303XLB6Tg6l+Zi/jlAIcY=;
 b=tOhnGu0cE3nBLFPO4amlKfb72Obw76/CSAf/acU0E3GLDRNueEmaBY4a6MLdi+THA/h6x/
 vdLE+4OUi6KUjH+HGkWH8WW4MGFHbWn0kf9b+k/zfYTTLr9UrkyJSj43PI6ximPDoRhBg2
 U8YzoZrgvv36fHUAzpuma/YBDbAIhcKSe6qaPU4NOZsDzqt71OTevGkBte7w+CO1NSKr0y
 SVaXnc0b7kwOsJQsN5CMiapVxRX3VDl5dCmCwE6ckItCqcGUyGdhMLd7kaOWnz+VMQq+UX
 8ZV6Tj6qeHMBmqm3uKYmBiJ3ljKxYsFONaSiBOsuOuLIk8tnN/kEXCjU3T95wg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] dev_err_probe usage for imx8qxp DPU pipeline
Date: Wed, 08 Jan 2025 10:46:41 +0100
Message-ID: <23817363.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <b3499ec5-c751-4809-82de-9d937fe47c6b@nxp.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
 <b3499ec5-c751-4809-82de-9d937fe47c6b@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Mittwoch, 8. Januar 2025, 04:13:51 CET schrieb Liu Ying:
> On 01/07/2025, Alexander Stein wrote:
> > Hi everyone,
>=20
> Hi Alexander,
>=20
> >=20
> > this is a v2 of an old series still in my queue.
> >=20
> > Changes in v2:
> > * Rebase to next-20250107
> > * Remove 'imx' prefix for commit subject in patch 2 & 3
> >=20
> > Best regards,
> > Alexander
> >=20
> > Alexander Stein (4):
> >   drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
> >   drm/bridge: imx8qxp-ldb: Use dev_err_probe
> >   drm/bridge: imx-ldb-helper: Use dev_err_probe
> >   drm/bridge: imx8qxp-pixel-link: Use dev_err_probe
>=20
> i.MX8QXP Pixel Combiner is also in the pipeline, so imx8qxp-pixel-combine=
r.c
> needs to be changed.
>=20
> To achieve consistent log upon probe deferral, i.MX8QM LDB bridge driver
> imx8qm-ldb.c needs to be changed too, but it can be done with a separate =
patch.

Thanks for spotting. I've added both for v2 of this series.

Best regards,
Alexander

> >=20
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 13 ++-----
> >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c      | 37 ++++++-------------
> >  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 +++-------
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 26 ++++---------
> >  4 files changed, 29 insertions(+), 66 deletions(-)
> >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


