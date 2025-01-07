Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71076A038DD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 08:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C33E10E236;
	Tue,  7 Jan 2025 07:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="o17cJRY6";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kUQqq3eF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jan 2025 07:36:58 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84AF10EA9E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736235418; x=1767771418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nP3a904pW+4NeZpIzj2rL1y4z2Ox21R2Xnv72pkxwco=;
 b=o17cJRY6sylAGgfbWlySBmdcfzkxERnoqO6ECrYQUhjE7iHTZeTBI5+i
 TWAbeea6bJtX5Zoqmf1YDKVYs5Wo8fzkD0oLsswLn/NXH0KSEw1UZzlWP
 TZQm4yvh4d89/EaEXHqX604OX3Ewujal2lYcKQEggp3Qn5iwI1yFWJX/3
 abi5k+Jw8eEFhAq2UoosVInezyDNTYMvGpE92WnIngmPeiimVfjIF3ud8
 M+E/6C/034GSY21wvI8Dwvr0KjtCZJt17vAotIYAbv0jo5Mp+S7oqc18q
 VxIquSokaDBQ0L7pVG4xuAcJV/x8kqxKaozNu53TKvZDkiU8OX4fzM19l g==;
X-CSE-ConnectionGUID: Izfo4A+rSCy3NyDPZAJESA==
X-CSE-MsgGUID: xzEX+6reTZOhb7p1aXK/6Q==
X-IronPort-AV: E=Sophos;i="6.12,294,1728943200"; d="scan'208";a="40884099"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 Jan 2025 08:29:46 +0100
X-CheckPoint: {677CD7EA-9-1647E5E1-CA16D1A6}
X-MAIL-CPID: 1AEEC7B410713E20B959F122062910D3_2
X-Control-Analysis: str=0001.0A682F28.677CD7EA.00B1, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11EEF16127F; Tue,  7 Jan 2025 08:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736234981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nP3a904pW+4NeZpIzj2rL1y4z2Ox21R2Xnv72pkxwco=;
 b=kUQqq3eFKQVewMaUchSw5EAUYGP9HHxGRg6hRebVznMHtHICrD6XdTKTAfwJWtI0GoTpcs
 ImBdTuEMqD8JIzytM1HTt//DoWwt+Ci/ReXj6QXX/RS4A6rrQCKNyOrnZe9dUG8qMZrHnW
 VygnZzh72HPDs8KMeLlV3U6HG3BiPFJO/QuqnFcti7RLBBG2t8UvwZqoXZLKzXBdS05ohy
 8vXM3XG6VH8PWNBlNxaB5L5HFIWUgLX4NG3cnkPTlMnHI6/br9uYw39Vgl58GQvgy74fEj
 Mq7udal6QZYZOLG+gGpfEKVaWTCuEFNS0fgAVNYIRD8CUcd8DuKhxuh1z+I52g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, mripard@kernel.org,
 Sandor Yu <Sandor.yu@nxp.com>
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, sam@ravnborg.org
Subject: Re: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Date: Tue, 07 Jan 2025 08:29:36 +0100
Message-ID: <2381464.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
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

Hi Sandor,

thanks for the updates.

Am Dienstag, 17. Dezember 2024, 07:51:42 CET schrieb Sandor Yu:
> The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
>=20
> The patch set compose of DRM bridge drivers and PHY driver.
>=20
> Both of them need by patch #1 and #3 to pass build.
>=20
> DRM bridges driver patches:
>   #1: soc: cadence: Create helper functions for Cadence MHDP
>   #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
>   #3: phy: Add HDMI configuration options
>   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
>   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>=20
> PHY driver patches:
>   #1: soc: cadence: Create helper functions for Cadence MHDP
>   #3: phy: Add HDMI configuration options
>   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
>=20
> i.MX8M/TQMa8Mx DT patches:
>   #8: Add DT nodes for DCSS/HDMI pipeline
>   #9: Enable HDMI for TQMa8Mx/MBa8Mx
>=20

I gave this version a new try but unfortunately the display stays black.
Although the display pipeline is intialized and even wayland starts.
Do you have any idea where to start looking?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


