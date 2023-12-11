Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F780C37E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4700510E365;
	Mon, 11 Dec 2023 08:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694D110E361
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702284158; x=1733820158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LcTEGYipYtNYuhq4JAQa9EjrkKVT8t/tenAGI2lHM9M=;
 b=YH/icvc7z68XBPTToM58hJZJLs9fYzZJMGZFAPIRV8a53Q5rtu+nk1WO
 5mvw9Pp+T1CIwUMjMG3hXQGMARlPVPXxFbSz4XdkjRJn51rrKHnbjLK0s
 v2fuOXkr0skEuiPI3l0O2SawdVjN1Xi+RqH3OVaeYjAQHXT2GJxK8ckf5
 j8nue4rCJgS7HtrR8kqs88IyRIJAe94/i2YHDRnBmpwD89j0nOQh4pu8e
 tvDEmWeWkaLsL28fAWyzMGa7PrLZRFtJ6Pu4O4OVyPEeFIEGom0xt68/i
 NN0ObGGYZBVgTELOdEJNJLmEpCVS+h3GVtiu3ACHSYvTTSaaVNIdPheud Q==;
X-IronPort-AV: E=Sophos;i="6.04,267,1695679200"; d="scan'208";a="34426043"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Dec 2023 09:42:36 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B19F9280075;
 Mon, 11 Dec 2023 09:42:35 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Date: Mon, 11 Dec 2023 09:42:37 +0100
Message-ID: <4854369.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <511f437b-89b5-4963-ae7d-dd66ab6db4fc@ideasonboard.com>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <3537389.iIbC2pHGDl@steina-w>
 <511f437b-89b5-4963-ae7d-dd66ab6db4fc@ideasonboard.com>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Am Mittwoch, 6. Dezember 2023, 13:11:59 CET schrieb Tomi Valkeinen:
> Hi,
>=20
> On 08/11/2023 14:45, Alexander Stein wrote:
> > Hi Tomi,
> >=20
> > Am Mittwoch, 8. November 2023, 12:27:21 CET schrieb Tomi Valkeinen:
> >> These two patches are needed to make tc358767 work in the
> >> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP connecto=
r.
> >>=20
> >> I have tested this with TI AM654 EVM with a tc358767 add-on card
> >> connected to a DP monitor.
> >=20
> > Just a question regarding the usage of this DSI-DP bridge.
> > What is the state of the DSI lanes after the DSI host has been
> > initialized,
> > but before calling atomic_pre_enable? AFAIK this bridge requires LP-11 =
on
> > DSI at any time for accessing the AUX channel.
>=20
> We haven't received any test reports for the DSI-DP case... I was
> looking at the datasheet, and I wonder, why do you say the bridge
> requires DSI to be up for the AUX transactions?

Looking at Figure 4.20 (Power On Sequence) in the datasheet TC9595XBG (Rev =
1.1=20
2021-06-23) you can see that RESX can be released (only) after DSI lanes we=
nt=20
to LP-11 state. I got information, down from the support, that LP-11 must b=
e=20
up in order to use AUX channel. This also matches our observations, DSI hos=
ts=20
often enable LP-11 only in atomic_prepare. That's too late so we used some=
=20
hacks to enable LP-11 right from the beginning just to get access to AUX=20
channel.

Best regards
Alexander

>=20
>   Tomi
>=20
> > Best regards,
> > Alexander
> >=20
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >> Changes in v2:
> >> - Update the format negotiation patch as discussed in
> >> https://lore.kernel.org/all/7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.co=
m/
> >> -
> >> Link to v1:
> >> https://lore.kernel.org/r/20231031-tc358767-v1-0-392081ad9f4b@ideasonb=
oar
> >> d.
> >> com
> >>=20
> >> ---
> >>=20
> >> Aradhya Bhatia (1):
> >>        drm/bridge: tc358767: Add format negotiation hooks for DPI/DSI =
to
> >>=20
> >> (e)DP
> >>=20
> >> Tomi Valkeinen (1):
> >>        drm/bridge: tc358767: Fix link properties discovery
> >>  =20
> >>   drivers/gpu/drm/bridge/tc358767.c | 32 +++++++++++++++++++++++++++++=
+++
> >>   1 file changed, 32 insertions(+)
> >>=20
> >> ---
> >> base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
> >> change-id: 20231031-tc358767-58e3ebdf95f0
> >>=20
> >> Best regards,


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


