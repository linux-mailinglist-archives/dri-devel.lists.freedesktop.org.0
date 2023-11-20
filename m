Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16F7F15DA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 15:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569B010E046;
	Mon, 20 Nov 2023 14:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Mon, 20 Nov 2023 14:38:31 UTC
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A241610E046
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 14:38:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1700490731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9f2A7iG9QxlXfAhIGL2D+akxaRYV9pGj/jh0RBA7f6g=;
 b=eXTUg62Ik8PLUvGO7KikQvTAi17nKie3zmKzUDBoMEk2ga6YJTT54Tjd9fZM8hrdqElBQ4
 PNCG0CuwseA+UJ2MRXx1SbyNNOMxrIBE34jqYs28BsICDpe86GZ1824IfBZ/2hb2mFsx7R
 Uidq3sIaMcDoYnaW3nMGUeT/Zy93B/jRKSKedNKrVt/EQgE+mD/v9HOfvUZ4igosvIYpCb
 6j3A6+7ObP+vWntzpGTxE3GE9DxGUfyOHDxNvYykR4PF6SuwpBtXgxnlfHtWNCMRgZW0qT
 qaRVL1ffrLSwxwZLInfnFEOrxGq+UYUzFgcdDrjJh1Chl7x5Jw6QjDOHRT2RHw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>, linux-rockchip@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2] drm/rockchip: vop: Fix color for RGB888/BGR888 format
 on VOP full
Date: Mon, 20 Nov 2023 15:31:59 +0100
Message-ID: <4726930.fbnEVBQaF0@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231026191500.2994225-1-jonas@kwiboo.se>
References: <20231026191500.2994225-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2134285.SbVt0S7CNQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>,
 Christopher Obbard <chris.obbard@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart2134285.SbVt0S7CNQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Date: Mon, 20 Nov 2023 15:31:59 +0100
Message-ID: <4726930.fbnEVBQaF0@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231026191500.2994225-1-jonas@kwiboo.se>
References: <20231026191500.2994225-1-jonas@kwiboo.se>
MIME-Version: 1.0

On Thursday, 26 October 2023 21:14:58 CET Jonas Karlman wrote:
> Use of DRM_FORMAT_RGB888 and DRM_FORMAT_BGR888 on e.g. RK3288, RK3328
> and RK3399 result in wrong colors being displayed.
> 
> The issue can be observed using modetest:
> 
>   modetest -s <connector_id>@<crtc_id>:1920x1080-60@RG24
>   modetest -s <connector_id>@<crtc_id>:1920x1080-60@BG24

On my Rock64 (rk3328) I was able to see the problem without this patch and see 
it displaying correctly with it, so 

Tested-by: Diederik de Haas <didi.debian@cknow.org>
--nextPart2134285.SbVt0S7CNQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZVtt3wAKCRDXblvOeH7b
bh3QAP9r8UfZ3jyDD/yp2jWUOlNzKz65zugAk67eVGxIULqbyAEAmtAgGSCuHdAN
t0RCnpEig29n4OGCexugcrRCnSp09wE=
=Aix3
-----END PGP SIGNATURE-----

--nextPart2134285.SbVt0S7CNQ--



