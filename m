Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D4A357F1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 08:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2510E24E;
	Fri, 14 Feb 2025 07:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="eAgNuA5f";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aG5yRY79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B5110E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1739518449; x=1771054449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dqBLyZA03PfD+/Z73Ovi+UOnmR4xxrTEqCfGNVFEHgs=;
 b=eAgNuA5fi0K7FXPjOAGZisMhQhq5a9RUH+tbfrq56eYN99ivOuB84egr
 61Ng1GOeh3ZTuRj0+YU8YQpMiJveCzYXEdeyHzelRVPfiDIgG1ldMZRmQ
 30R0KmVOB7U2YEODsiFTJCsHdOBCxSTffAcjUqg9VM+psAHP39LR/3u9C
 MngfZWOg1TAF1MohFZ/OzktpUbfrm5L7RSo5MVAewC8XcZccsJzmjxgUy
 D3bEn/4qaijuLMLXbBKv1kruoG4Sol5uS/TkVV2+D0Low5ZVuBMrmMw6j
 f+hQSHV800gfWcnHnv+oWXNUnHeNaz2RYAtrYkAXxjT/eKrQfdRYbaTPg g==;
X-CSE-ConnectionGUID: VmwVF+vFQgS7wY/KlJlFVA==
X-CSE-MsgGUID: xLlWDxviTo2lQMr3EMGI2A==
X-IronPort-AV: E=Sophos;i="6.13,285,1732575600"; d="scan'208";a="41845952"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 14 Feb 2025 08:33:56 +0100
X-CheckPoint: {67AEF1E4-9-EBA888C4-C1AC8B84}
X-MAIL-CPID: F48EE102AD0F0138F0FF3E9174C0B0BC_0
X-Control-Analysis: str=0001.0A002123.67AEF1EF.0012, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29BAF16B879; Fri, 14 Feb 2025 08:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1739518431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqBLyZA03PfD+/Z73Ovi+UOnmR4xxrTEqCfGNVFEHgs=;
 b=aG5yRY79cPuYPJezU0ratTDxHgDNxG6xLeVjTezdVN4mXg+a1VWNKBHCmpQVPnnXzukx9g
 h95qwjPurFMmuABsaPOB0ekrdQZi7ge4C9QPNlj77A6VSxhipTQ8ZSMrwkUIxfe488zYEL
 lFetBKr+oePS25yaltr7HdZQfLSmB8G1/yCSPpaW06/66uRmOcWwV5bVn2sJfieKvgAhDu
 bNRocf8g/8ty/TGeWHB71nJPPF8Eq77DMiZ8AzOqPzKcJJ5MaP7021TWoiYMJBTshs2G9H
 Fa5yhCRV+TH6lLAouv4RcyzTuQW2kylAn/dKUt9cdunmCF3UJISZWe5rxvktZQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, Herve Codina <herve.codina@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 0/4] Add support for errors recovery in the TI
 SN65DSI83 bridge driver
Date: Fri, 14 Feb 2025 08:33:46 +0100
Message-ID: <2023388.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250210132620.42263-1-herve.codina@bootlin.com>
References: <20250210132620.42263-1-herve.codina@bootlin.com>
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

Am Montag, 10. Februar 2025, 14:26:15 CET schrieb Herve Codina:
> Hi,
>=20
> Usually the TI SN65DSI83 recovers from error by itself but during ESD
> tests, we have some cases where the TI SN65DSI83 didn't recover.
>=20
> In order to handle those cases, this series adds support for a recovery
> mechanism.
>=20
> Compare to the previous iteration, this v6 series fixes a NULL
> pointer dereference.
>=20
> Best regards,
> Herv=E9 Codina

=46WIW
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #tqma8mqml-mba=
8mx

> Changes v5 -> v6
>   v5: https://lore.kernel.org/lkml/20250203161607.223731-1-herve.codina@b=
ootlin.com/
>=20
>   - Patch 1:
>     No change
>=20
>   - Patch 2
>     Add 'Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>'
>     Add 'Reviewed-by: Maxime Ripard <mripard@kernel.org>'
>=20
>   - Patch 3
>     Add 'Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>'
>     Add 'Reviewed-by: Maxime Ripard <mripard@kernel.org>'
>=20
>   - Patch 4
>     Add 'Reviewed-by: Maxime Ripard <mripard@kernel.org>'
>     Fix a NULL pointer dereference reported by Alexander Stein in v5.
>     Mode the dev_warn() signaling the pipe reset closer to the pipe
>     reset operation itfelf.
>=20
> Changes v4 -> v5
>   v4: https://lore.kernel.org/lkml/20250203145824.155869-1-herve.codina@b=
ootlin.com/
>=20
>   Exact same changes as the v4. The v4 series doesn't apply on top of
>   v6.14-rc1 and should be simply ignore.
>   This v5 series is the v4 fixed to apply on top of v6.14-rc1.
>=20
> Changes v3 -> v4
>   v3: https://lore.kernel.org/lkml/20250108101907.410456-1-herve.codina@b=
ootlin.com/
>=20
>   - Patch 1:
>     No changes
>=20
>   - Patch 2 and 3 (patch 2 in v3):
>     Rename the helper to drm_atomic_helper_reset_crtc()
>     Split the patch available in v3 in two patches.
>=20
>   - Patch 4 (patch 3 in v3):
>     Take into account commit d2b8c6d549570 ("drm/bridge: ti-sn65dsi83:
>     Add ti,lvds-vod-swing optional properties"), available in v6.14-rc1.
>     Disable irq when a fault is detected and re-enable it after the pipe
>     reset.
>     Remove state duplication and use bridge.encoder->crtc directly
>=20
> Changes v2 -> v3
>   v2: https://lore.kernel.org/lkml/20241217143216.658461-1-herve.codina@b=
ootlin.com/
>=20
>   - Patch 1:
>     No changes
>=20
>   - Patch 2 (new in v3)
>     Move reset_pipe() from VC4 HDMI driver to a new atomic helper
>=20
>   - Patch 3
>     Use the new drm_atomic_helper_reset_pipe()
>=20
>   Patch removed in v3
>     - Patch 2 in v2
>       No more needed
>=20
> Changes v1 -> v2
>   v1: https://lore.kernel.org/lkml/20241024095539.1637280-1-herve.codina@=
bootlin.com/
>=20
>   - Patch 1:
>     Add 'Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonb=
oard.com>'
>     Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'
>=20
>   - Patch 2 (new patch in v2)
>     Introduce drm_atomic_helper_disable_connector()
>=20
>   - Patch 3 (patch 2 in v1)
>     Reset the output path instead of the full pipeline.
>     Update and add more information related to the bridge in commit log.
>=20
> Herve Codina (4):
>   dt-bindings: display: bridge: sn65dsi83: Add interrupt
>   drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
>   drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
>   drm: bridge: ti-sn65dsi83: Add error recovery mechanism
>=20
>  .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 142 ++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  41 +++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |  30 +---
>  include/drm/drm_atomic_helper.h               |   2 +
>  5 files changed, 189 insertions(+), 29 deletions(-)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


