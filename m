Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29226F6835
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A273910E407;
	Thu,  4 May 2023 09:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E8310E407
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683192096; x=1714728096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g6RxfrONaXC7pnFp2IZrwZPN67O1XvovTarMdoUT4JQ=;
 b=KUTJLe2UPHItd+Hs9Z6nQo99+e7V88qgVlDllC4ipZxY+BHuJdnaS+Zj
 B8oBZPB2x0hO4HurMczIymKA5vl7clDjuBzisOBjER/0UaGZjd0ssoVTn
 2LdhPCG/5Eq+sKZ2T/Nooj0FcR6FnOqGV9oLRCTgIMqZjPEsF5Mj8dwlB
 nWPElDAooShsjfsxawY/kq98S/XKNwXWZWs0EobEtHhtVtAVOZ3nQLRNv
 wEFwzTYN1RobLUhh9c5bZhbUVuww9frPGiFnwNbo2UWlDI6aXMk5yYq9V
 zW0IR+0c1E/LgJ5l+qVvsKIsHQvx//Z2tXXf4yvUinUK7LLwNFl/y3xLA w==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30715302"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 11:21:32 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 11:21:32 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 11:21:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683192092; x=1714728092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g6RxfrONaXC7pnFp2IZrwZPN67O1XvovTarMdoUT4JQ=;
 b=CIG+oU/lzn/GuEWp+s8219DvxNlK2Q6Ahxvdp//nqqH5usZBDpeUYljH
 Ip4pSpcBwdVjiNEYF1PRTAlyf96TRW1U/EUcJyjhX+hdNauAmiOZyKkFP
 Qb7O2kbVlrF+/pAA2Om32dMexrUYqZAhN/alOdw/7ctiAWB7aEjAD/fEv
 OYyQJrfrVUG7rKMslEjEp9d97LZjY6cfwfzjWpwcn+QCNuCI6in89yyJw
 xXMfNYKKQrm8KMc5pvG3H8CLFqDQD7c7nlQMfvfWMaZuys1pBeE4Xxsm9
 qNmZrGkm8pdQOhPQ3np2VeuhMhpUrQKVX+1seDGt0gLb5/m06dbMgRngZ w==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30715301"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 11:21:32 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E0557280056;
 Thu,  4 May 2023 11:21:31 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V3 3/7] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
Date: Thu, 04 May 2023 11:21:30 +0200
Message-ID: <7519081.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230502010759.17282-4-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-4-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 2. Mai 2023, 03:07:55 CEST schrieb Adam Ford:
> Make the pll-clock-frequency optional.  If it's present, use it
> to maintain backwards compatibility with existing hardware.  If it
> is absent, read clock rate of "sclk_mipi" to determine the rate.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c index bf4b33d2de76..2dc02a9e37c0
> 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct samsung_d=
sim
> *dsi) {
>  	struct device *dev =3D dsi->dev;
>  	struct device_node *node =3D dev->of_node;
> +	struct clk *pll_clk;
>  	int ret;
>=20
>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
>  				       &dsi->pll_clk_rate);
> -	if (ret < 0)
> -		return ret;
> +
> +	/* If it doesn't exist, read it from the clock instead of failing */
> +	if (ret < 0) {
> +		pll_clk =3D devm_clk_get(dev, "sclk_mipi");
> +		if (!IS_ERR(pll_clk))
> +			dsi->pll_clk_rate =3D clk_get_rate(pll_clk);
> +		else
> +			return PTR_ERR(pll_clk);
> +	}
>=20

Now that 'samsung,pll-clock-frequency' is optional the error in=20
samsung_dsim_of_read_u32() should be changed. Otherwise you will get
> /soc@0/bus@32c00000/dsi@32e10000: failed to get 'samsung,pll-clock-
frequency' property

Best regards,
Alexander

>  	ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-
frequency",
>  				       &dsi->burst_clk_rate);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


