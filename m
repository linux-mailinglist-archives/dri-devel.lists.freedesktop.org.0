Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E7D9C8614
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 10:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCD110E7C2;
	Thu, 14 Nov 2024 09:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="owPwdOHQ";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HR1HvmsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE910E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1731576442; x=1763112442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbnYJm4hytCclaXjBxd1uJhQNcP05/h7JvcogOHyxgQ=;
 b=owPwdOHQ/QcWb+i97UW67y9AkdKna7JWKScishBY5aBc8OwQAao6/l+t
 ytQASw83EzK59oKOwrtge7cVgNyFtlrEO6IdbygL/VHQA8Kyo1/jkM6sF
 UTivGrSuHsemqdvcSanKrzw/OA6LHq3nDns000q32rVKGD1/9nxouTcNu
 nABf/5IXHJSN1dL0KTxmZAKTU7B/LB8V+qQvbS8pTFLv+WMk2kbA5zLxp
 AyzpZ6KNOijehil5JFP3tAZWg+En0l6/yYJ34RsUCMLQtlPWmtho29cP+
 kSjK0pbfNN287z0YmD+Y5LTG6Te9cmopCJPeF5MKIyN9/AI4grTl6Zszd A==;
X-CSE-ConnectionGUID: 3nq19/tRSNK6PsCeqyjCvA==
X-CSE-MsgGUID: Z6MRZlEqSGaPur5LAMPB2g==
X-IronPort-AV: E=Sophos;i="6.12,153,1728943200"; d="scan'208";a="40034487"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 14 Nov 2024 10:27:20 +0100
X-CheckPoint: {6735C278-12-5736D786-D50827BE}
X-MAIL-CPID: D0D1C3602109D73906E60781C85D37A6_2
X-Control-Analysis: str=0001.0A682F24.6735C278.00D1, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B88C167AC7; Thu, 14 Nov 2024 10:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1731576436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbnYJm4hytCclaXjBxd1uJhQNcP05/h7JvcogOHyxgQ=;
 b=HR1HvmsDDY4QrtNaINKfIdCHi06cHWrju/AIhYI8Tdb1xHxNFzur7oJXoajheb6b+uLicY
 WKJiQjhBMBowUNPCHo964YRLsr/+I4hXI0LLJl5auiHPkZZucAFIAM4RfcVLsfHa+Fw8IV
 BwSwOix+eun2AcnlkthsQO1nuuK7rVEqIWraEBVIaNxJ8wvwWczNMelQxFgOO5QUziD3DU
 nj/D5sekYTwDJPRoUBDdFH9tdFeu1ssK1SlSO4jTtI2yPntlZy32sD9NosoGeMnkOyEEeD
 VS4SkraQwT9B1LrLwFzfSd4CcRs6Jz1cJFI8lJz1H0kMKa9YpVWFO06P8nxKoQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/bridge: tc358767: Fix use of unadjusted mode in the driver
Date: Thu, 14 Nov 2024 10:27:12 +0100
Message-ID: <2351528.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241026041057.247640-1-marex@denx.de>
References: <20241026041057.247640-1-marex@denx.de>
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

Hi Marek,

Am Samstag, 26. Oktober 2024, 06:10:42 CET schrieb Marek Vasut:
> The driver configures mostly Pixel PLL from the clock cached in
> local copy of the mode. Make sure the driver uses adjusted mode
> which contains the updated Pixel PLL settings negotiated in
> tc_dpi_atomic_check()/tc_edp_atomic_check().
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 7968183510e63..0d523322fdd8e 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1764,7 +1764,7 @@ static void tc_bridge_mode_set(struct drm_bridge *b=
ridge,
>  {
>  	struct tc_data *tc =3D bridge_to_tc(bridge);
> =20
> -	drm_mode_copy(&tc->mode, mode);
> +	drm_mode_copy(&tc->mode, adj);
>  }
> =20
>  static const struct drm_edid *tc_edid_read(struct drm_bridge *bridge,
>=20

This unfortunately breaks my DSI->DP setup on TQMa8MPxL/MBa8MPxL.

When I revert it, DP works again. I'm currently running on next-20241114
with patches regarding DSI initialization.

before:
tc358767 1-000f: PLL: requested 148500000 pixelclock, ref 26000000
tc358767 1-000f: PLL: got 147333333, delta -1166667
tc358767 1-000f: PLL: 26000000 / 1 / 1 * 17 / 3
tc358767 1-000f: set mode 1920x1080
tc358767 1-000f: H margin 148,88 sync 44
tc358767 1-000f: V margin 36,4 sync 5
tc358767 1-000f: total: 2200x1125

after:
tc358767 1-000f: PLL: requested 147333000 pixelclock, ref 26000000
tc358767 1-000f: PLL: got 146250000, delta -1083000
tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
tc358767 1-000f: set mode 1920x1080
tc358767 1-000f: H margin 148,88 sync 44
tc358767 1-000f: V margin 36,4 sync 5
tc358767 1-000f: total: 2200x1125

The reason this breaks is that the adjusted clock frequency is slightly off
to the previously calculated one: 147333333 <-> 147333000
This is because mode clock is only specyfied in KHz. With this incorrect
input the new result is even lower than requested, thus failing to setup
correctly.

As I don't see a quick fix, I propose a revert meanwhile. Any comments?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


