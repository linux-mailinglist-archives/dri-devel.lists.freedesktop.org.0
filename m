Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F99C1F120
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8919710E91E;
	Thu, 30 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pLRitz3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9574E10E71B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:14:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42966ce6dbdso5007439f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761725673; x=1762330473;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=;
 b=pLRitz3pYO9r5OS6En9IeBV7ia0jGYlEYb3lG/EB7rtlFiMeMkVs6zBiYPl1M8zrJJ
 WKsgoHcGbTyPhC3guqtLaZBMZR2G9GBWpj6KIEDaAtGbrmrhHe1yNM1q+lkcW2sf3UWi
 vrvMDhx0pqatAYQxERpMDMvaG4D4ECqS4kKPJ97z1uGZHYzBzembnCKvC1WTwxH26p54
 uOOtRitVLRdi8uan3xRXqlw4J+i3W8Fj2iis2BDuIbKFVQOEP3qiapMl2MWPvV9d/iR8
 UnhDTiSKrqCmR0ziOAOm6ZHifZgmgkfzQKQ/TawHdjkybfKzmHMJz3GVFgxlU7FY+PQs
 aTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725673; x=1762330473;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=;
 b=lajCxFNv17THC0sANxOu1FviZ40Y/L0GosPJ7NcJ2/HXbKQceB8gLYiAWM1Ypsrmkf
 UvrgQBm2912ddjjAMWw8HxTMiV8V/3dhuqlGP3EUwcFrYibXavyjJbeH/I5AH69j0qGU
 pILbKevRYUbFA1teeJYT+qS7gt/t9xv7D+kkHfGjk64pNX8K1AjUF3jzukGuRdjiJ/mx
 CSq3Q0oim33WBhPtLa7ZEYgVn26lZDlCYQrFDCsf4d+9sygGWZ0pctyvbP+zTCZH5SaV
 JHGBNHoTOQMQzD3AOrFks2ZpksIjR2IIA4CDeDmo+t4aObhOOjFLBH1ih/FbTV6ZqhMy
 EGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVIixxCl1lLpCKKT6kQBKrhs534Y5Slo9/D0jDiYwqziWctq2LFAkgZQIooo/zVBg1WvVSdSh1o3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPj7dXrIaqFTUwNsSNOUjrjWUzTpoccExw3eoeFGP5dMlDQHZe
 Wxz6Qgz9Ux9BgjOQBpz2//iCB9lj1+/S1QpEOY8VBnV16iKwCe1VTL4l9keB7xM3fvw=
X-Gm-Gg: ASbGncu9RKKItsKXRXcsgNg2deTKi9mQgo4cTC61rq/U+XpqUc8Q4RO+P8rmh1Nev+y
 sxK2TFq097HX8LKOpbeTuq9F17Udf5cK/OvApDCZvGKGqTWGt+IhSZySFoLlv5zomY6VIfJN4G/
 Zb870M2y6X+2PbF772ChjyzIayHCQ03vMMvV11t9jFrga8B/zrpVKaqShkO4JWsUy8DZiqyy6WO
 tvwliINS9XKUTLvEKT00SQHR3mdRR9oMvdqP011tocfYt+GbWTH8S3/5FRl5OkFmCFcgmn086T4
 29Yg1tgfPunkkn3iAkB5IGNoX9xQP0jbepoDCyuiM4vCRyXv2tn5bAri+PfYBY+hq1sTL+eKXRs
 o13OVALQ74F8FEVoL27oIrzLtRdzPtuoLMNHM0tKcA6uEiLLhOuPY91TgW5holUC01+7vv/4DTU
 Zf/Dc=
X-Google-Smtp-Source: AGHT+IEwzzvxzDwy2hXfDTMyKk2u3q3b4WDeoC3Cd1r42aF64N8QkWqyq5rTqATRPlQPagJ+AbKIrw==
X-Received: by 2002:a05:6000:240f:b0:428:52d1:73ab with SMTP id
 ffacd0b85a97d-429aefcd0f0mr1311537f8f.58.1761725672718; 
 Wed, 29 Oct 2025 01:14:32 -0700 (PDT)
Received: from localhost ([195.52.63.148]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm25774340f8f.44.2025.10.29.01.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:14:31 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 29 Oct 2025 09:14:23 +0100
Message-Id: <DDUNMKXD4HRX.DXUT67S354TJ@baylibre.com>
To: "Miaoqian Lin" <linmq006@gmail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "CK Hu" <ck.hu@mediatek.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Guillaume Ranquet"
 <granquet@baylibre.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: Fix device node reference leak in
 mtk_dp_dt_parse()
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20251029072307.10955-1-linmq006@gmail.com>
In-Reply-To: <20251029072307.10955-1-linmq006@gmail.com>
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:46 +0000
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

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 29, 2025 at 8:23 AM CET, Miaoqian Lin wrote:
> The function mtk_dp_dt_parse() calls of_graph_get_endpoint_by_regs()
> to get the endpoint device node, but fails to call of_node_put() to relea=
se
> the reference when the function returns. This results in a device node
> reference leak.
>
> Fix this by adding the missing of_node_put() call before returning from
> the function.
>
> Found via static analysis and code review.
>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best
Markus

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaQHM3xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMY
BQEAuHoHmQztjd0qDVochaQgMwU/UDAYYFg9Pt2qLtKUZoIA/RVh2U8TuEbNs/4U
K3J+cqEkOl1LVK9aUjFYUv90UyQJ
=nF+A
-----END PGP SIGNATURE-----

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9--
