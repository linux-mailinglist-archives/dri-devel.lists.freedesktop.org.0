Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E367985BF02
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D3110E490;
	Tue, 20 Feb 2024 14:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="cXmQrd8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AC110E496
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1708440219; x=1739976219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nVVaHx+ANuRHgvTt6N3BiJf/UBep7MS+eoTjckq+1YI=;
 b=cXmQrd8YjTDN8scub1HWb30kg2nfDmP0gsPzp5DdErnFHQTz5OqpUiH4
 oFk2q7EiTNLdLjYKtyhrumNTvLhD0+9m2XRMEkVnx9ehTvQQ5gVxDYy6A
 40aGwlmcFePVm6DNqbGYwYxw9ZeE6p4ggHlkmb+RG2fUaA32KQWEWiIYZ
 yFtb9sb3/zqdBcbIExG6wFBKeXF233HoRLmyXHpmfP3DKxJqfE65TaGg0
 Z/Q45FfdRRnK74plqZDg1CFH4WruDBJMiGiBTzL4nToRCsxPwSkyu4aTR
 z/e99+KCqsPq/7qGjalqtAo1H3fdWSf2ZDaU+YRcHKfXO88r+i1i/XQJU g==;
X-IronPort-AV: E=Sophos;i="6.06,174,1705359600"; d="scan'208";a="35502881"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 20 Feb 2024 15:43:37 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 10991280075;
 Tue, 20 Feb 2024 15:43:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/bridge: Silence error messages upon probe
 deferral
Date: Tue, 20 Feb 2024 15:43:39 +0100
Message-ID: <3209672.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230822115200.712231-1-alexander.stein@ew.tq-group.com>
References: <20230822115200.712231-1-alexander.stein@ew.tq-group.com>
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

Am Dienstag, 22. August 2023, 13:52:00 CET schrieb Alexander Stein:
> When -EPROBE_DEFER is returned do not raise an error, but silently return
> this error instead. Fixes error like this:
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@308000=
00/mipi-dsi@30a00000 to encoder None-34: -517
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@308000=
00/mipi-dsi@30a00000 to encoder None-34: -517
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Adjust the indentation
>=20
> Considering Laurent's input IMHO -517 should not occur when using compone=
nt
> framework, e.g. drivers/gpu/drm/mcde/mcde_drv.c. This should warrant to o=
nly
> print an error if it is not deferred probe.
> dev_err_probe() sounds reasonable, but this is something which should be =
done
> in drivers. It is also arguable if this message is "hidden" within a debug
> statement.

Any additional feedback on this? I'd like to get rid of an error message wh=
ich just prints
a regular probe deferral.

Best regards,
Alexander

>  drivers/gpu/drm/drm_bridge.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 39e68e45bb124..132180a03c0eb 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -352,13 +352,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, =
struct drm_bridge *bridge,
>  	bridge->encoder =3D NULL;
>  	list_del(&bridge->chain_node);
> =20
> +	if (ret !=3D -EPROBE_DEFER) {
>  #ifdef CONFIG_OF
> -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> -		  bridge->of_node, encoder->name, ret);
> +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> +			bridge->of_node, encoder->name, ret);
>  #else
> -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> -		  encoder->name, ret);
> +		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> +			encoder->name, ret);
>  #endif
> +	}
> =20
>  	return ret;
>  }
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


