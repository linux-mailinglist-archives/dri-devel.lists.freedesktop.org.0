Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B520E7E567E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 13:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7172810E72D;
	Wed,  8 Nov 2023 12:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B82410E72D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1699447526; x=1730983526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mp0cZhN3AA8YDI2rLb/AqW/Ftccy17dW1aTL8NsNu+0=;
 b=oRu+wqkgoNsI0LhGhYE6gkfx23YDjMoDeUlnLhOgGYO53c6GwaUJBc6Y
 Q7gwV5XwXCaUcQ9Z9wyhkAzuOLQAPvsfphQvQipnGCrbZ6BROJCFrE1h0
 qY/q1zcLNv5akvSiXqUDqEub70dxUWBDdBnIxwMzhhrI8miR5Z0oLQHhC
 X0VXOgRxC8TPl2+7YR7A1G67Ib9mHpJZ9Z61JOTSfNUgFgQl40Bjuvy+i
 0afb1gt4kD40mG9Uk1elL2jf5hOlaPpreAW+gC8NcTDYyPh14DAq99687
 ciVk+2H/PqD9k667vWBjGaQzVbESNf1SrwftZmJW3LaPnthj2lE+JUdhB g==;
X-IronPort-AV: E=Sophos;i="6.03,286,1694728800"; d="scan'208";a="33875585"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Nov 2023 13:45:23 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 69BB028007F;
 Wed,  8 Nov 2023 13:45:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Date: Wed, 08 Nov 2023 13:45:20 +0100
Message-ID: <3537389.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Am Mittwoch, 8. November 2023, 12:27:21 CET schrieb Tomi Valkeinen:
> These two patches are needed to make tc358767 work in the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP connector.
>=20
> I have tested this with TI AM654 EVM with a tc358767 add-on card
> connected to a DP monitor.

Just a question regarding the usage of this DSI-DP bridge.
What is the state of the DSI lanes after the DSI host has been initialized,=
=20
but before calling atomic_pre_enable? AFAIK this bridge requires LP-11 on D=
SI=20
at any time for accessing the AUX channel.

Best regards,
Alexander

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - Update the format negotiation patch as discussed in
> https://lore.kernel.org/all/7ddf0edb-2925-4b7c-ad07-27c030dd0232@ti.com/ -
> Link to v1:
> https://lore.kernel.org/r/20231031-tc358767-v1-0-392081ad9f4b@ideasonboar=
d.
> com
>=20
> ---
> Aradhya Bhatia (1):
>       drm/bridge: tc358767: Add format negotiation hooks for DPI/DSI to
> (e)DP
>=20
> Tomi Valkeinen (1):
>       drm/bridge: tc358767: Fix link properties discovery
>=20
>  drivers/gpu/drm/bridge/tc358767.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> ---
> base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
> change-id: 20231031-tc358767-58e3ebdf95f0
>=20
> Best regards,


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


