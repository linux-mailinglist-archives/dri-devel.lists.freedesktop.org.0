Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B597B39F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 19:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE0810E19D;
	Tue, 17 Sep 2024 17:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="gBEzK9qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFDF10E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1726594447; x=1727199247; i=markus.elfring@web.de;
 bh=VvxXMxcafFA0iLzl+qK+B8NzFkMQKxHmtwIhDsRZPXo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gBEzK9qi8UyIR092liEla+QBpZq0Ub7l2RhydbPCxF4mOLHJKtCl+2oqWdjWeeEC
 zDiyqiGUCJnt9NAacejtUubzfwZDTKus1i3IbB07JL3lxn/sScsNMZfmVJcsFqDK+
 G9QKcxcSUjqTHUWfml7bo/WRodevMTywyA10wilp2IOU0807AdoYjg2vPD4JYlW0e
 1yr2hWqcbApFFDo51w3PLnFGcCfvqUsCKL344dWbpSEh3Ip0br510ELJMvBRIR1u2
 Fr0eXZP0w/V3EyfaISAj5TjdoAcf1mZeeNPegbwBB9JjlQHL6Gje2Wnhr5Q4DfYsn
 +uWe6cm8lHIla9adHQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M59iy-1sri151XV6-00FyQ9; Tue, 17
 Sep 2024 19:34:07 +0200
Message-ID: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
Date: Tue, 17 Sep 2024 19:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] drm/mediatek: Adjustments for mtk_gem_prime_vmap()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jv+5loKG9MPWnWE+0Bw5fMhaNdpSXHI8EOSzOuaZT4ehxYInQxj
 7c6Xgp9F+toHHG67l/6roH+nG6fFLgJMjqCbRlGtsDTIWblY7w6Feuju5nNwPbuqmV9qgyY
 huhUYjgAeEtyqwWqgF71riV05jqgOOLF3CNlpISn0YAniREiQ+vsCt6BhmpYuCGl2CSa1Ca
 75wXNYkbm/Wi6VT/gnjhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gJl61uCuOo0=;bfzP37UybJyqlZzICuvPdQFk1d8
 Ot9IuSNEXn1l5q56UfyK45AaxmXH2CuvIzBLMT6/OKcxICUwr0BblBrf429mQL6zQMIK/CkCI
 WXywfOmZYZ1GlZLnXJuw9owGD79v4/pxClkhNRnbAymTZpenkjcWiRmf9Sv8TDGceDOIeXEt6
 7LaUecWTUxqFI1U74KI6wIavFXAWn9vNMGBnFUy0pRml0Ete/hc0j/9Axpoq4M6HYGdHvgRMp
 laylo31IlmAmL26oH4lfTy3z+4lPGfvJtlF4A0sm9RD7CBrfj1OXU0Xx+9JflFN801xJNWGKb
 h4OskiRy+DX7tbsb2stt7tRJTxaJ/fgtSpaBcMWszdHc1GUJx2CTLDp5Sgg6DFZ34q34rALlR
 MFVCe4jwu5yO2se3BODmoos/cdaACr8e3NCMlyHNDuMpOJRPTb27JhnldY851MFsjkq7KxoP/
 hLxkA83ZEOSkx/1dttShIClxEqBgvklgJ++2SL+4RvUTtfkfsPqmWeelFv52Yig7x7ajSN1km
 YfKuiHy37thJ3B7W73Xr34PYEJb/vIFpuVVdnJsOHid0UijBrVI3jOVX4D65fKewkIcEgnaAH
 bnzJOBe0848ijaOd3tk0ZZg/cORfN2Nt7K4bV4R7/tnuQUY85Wv5NxHMgt9wTUgnvJKJm2auw
 vd0HKfL2SfusoZHyKf41KPkeblnsPFCqfiLJiAlr5koxhKwad01l19EXfKS78RaniIvkzexIU
 SqDx1juO9LeGmZNxCiyb80al4GHSSzQaA0aoCxw6uD0P3TjOxSpRqFlECVZhcKtpCio58G7lB
 McgTmXRJUMSz1kIWiwkzJBBg==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Sep 2024 19:16:45 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Avoid duplicate sg_free_table(sgt) call
  Use common error handling code

 drivers/gpu/drm/mediatek/mtk_gem.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

=2D-
2.46.0

