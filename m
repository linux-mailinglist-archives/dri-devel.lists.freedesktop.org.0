Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CC855D44
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3642110E419;
	Thu, 15 Feb 2024 09:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="DXCK50VK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5048D10E419
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1707987825; x=1739523825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zQrS4HbyreGN0s+IdWF/KCYWN7W7xmEy9D7hkjVlPjI=;
 b=DXCK50VK3L89puTTT9LUjNxz3jdz0ENLzoO1NMh9sFG7dHGYU0DFml57
 jlAFUg/BYlnag603X6+bjnqxrxgjipWKN2YTmjRwoh8Y6NmEBjDMcxK0I
 gVN5Nd4nxrImDIwhzUUpJpiWfpG3NHN/Ca2FSNrzhfrLMuLYU/E+iKt1J
 P7EZnevVFGK+kj7TMpCC98p7Eq52/BEOeqHeMzBfkiwKf54SAINSosyIa
 iPNo2s5jZqX1moRdbx6V95iQRS0rVwdxqr8r8CV8f0UgL9kB9MDEQmtF+
 Que9I0BzI8KcsjTnbfly88atmtQVvjPRjruG/cxmhxHqEsU2UwSkkaX57 w==;
X-IronPort-AV: E=Sophos;i="6.06,161,1705359600"; d="scan'208";a="35419042"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2024 10:03:40 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D8F34280075;
 Thu, 15 Feb 2024 10:03:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 marex@denx.de, Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Date: Thu, 15 Feb 2024 10:03:41 +0100
Message-ID: <3277848.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

Am Donnerstag, 15. Februar 2024, 09:53:54 CET schrieb Jan Kiszka:
> On 11.12.23 09:07, Aradhya Bhatia wrote:
> > On 06/12/23 17:41, Tomi Valkeinen wrote:
> >> Hi,
> >>=20
> >> On 08/11/2023 14:45, Alexander Stein wrote:
> >>> Hi Tomi,
> >>>=20
> >>> Am Mittwoch, 8. November 2023, 12:27:21 CET schrieb Tomi Valkeinen:
> >>>> These two patches are needed to make tc358767 work in the
> >>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP
> >>>> connector.
> >>>>=20
> >>>> I have tested this with TI AM654 EVM with a tc358767 add-on card
> >>>> connected to a DP monitor.
> >>>=20
> >>> Just a question regarding the usage of this DSI-DP bridge.
> >>> What is the state of the DSI lanes after the DSI host has been
> >>> initialized,
> >>> but before calling atomic_pre_enable? AFAIK this bridge requires LP-11
> >>> on DSI
> >>> at any time for accessing the AUX channel.
> >=20
> > + Marek
> >=20
> > Marek, Alexander,
> >=20
> > A quick grep tells me that you have added devicetree for tc358767 in DSI
> > to (e)DP mode on other platforms. Could you please test these patches
> > and report if you find any issue?

Sorry, I can't provide any feedback here. I've yet to setup the DSI-DP=20
correctly.

Best regards,
Alexander

> Is this the last blocker to move forward with these fixes? I'd really
> like to see them finally merged.
>=20
> Thanks,
> Jan


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


