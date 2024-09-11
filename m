Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD9974BEF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 09:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD13010E182;
	Wed, 11 Sep 2024 07:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GTLqK+Zx";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="hbJ7HBdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 917 seconds by postgrey-1.36 at gabe;
 Wed, 11 Sep 2024 07:57:53 UTC
Received: from a7-45.smtp-out.eu-west-1.amazonses.com
 (a7-45.smtp-out.eu-west-1.amazonses.com [54.240.7.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE66010E108
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726040554;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=+z0iaYPRF8aOAeyudpMIOAITImEM365oGsItYDeMrNE=;
 b=GTLqK+Zxla3s5iAGSe/h9kxrPUSF87jCwiNhqceQcGgcSXvpl305psrUwII5SwKf
 b24gxrEovDeflPUEpV1YVET4Ls0IBxHJo9ORtqxk838sOZrsK8AjSL9R0opIdKx1WMB
 iTZBAayeKXwiqbZulfTtXKoqKahSzJPCaUNf0JUmhB7TQdTIQ+BpLOOHVu9/33/gsKK
 Ez6U4I0w0VT/1uxv8DxSjCNzUmUNX0gPWCuFTVq0WIRgu0QoD/0q1NoSBvmocQJVQz3
 8NE4JiZY1u9uci+sixDZINIEYt5O/OIK4XsrDtZpT8PqMNtlwFldLbtaouHBn8MCfFm
 qu6rNL65gw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726040554;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=+z0iaYPRF8aOAeyudpMIOAITImEM365oGsItYDeMrNE=;
 b=hbJ7HBdKOzai+xLjoaWwAVtHEd+Wao7fakZkcpV33sHkzS3JaM6vVCgzN6mD97Jm
 mVWtXv8wZyidNiSvh8UfItBq/8gnlS5oNFp+6HrWeDzrhpuz8oEzuBE9Fesx608DK1K
 CYAuH00qqq+JkPU+I7knFpOtsiuJmnPf0dwiuxaU=
Message-ID: <01020191e008baec-ca547413-aeba-4508-8a05-2c35b06150c2-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 07:42:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/mediatek: dp: constify regmap_config
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
 <20240908-regmap-config-const-v1-4-28f349004811@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240908-regmap-config-const-v1-4-28f349004811@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.45
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

Il 08/09/24 16:21, Krzysztof Kozlowski ha scritto:
> Mark local static 'struct regmap_config' as const for safer and more
> obvious code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

