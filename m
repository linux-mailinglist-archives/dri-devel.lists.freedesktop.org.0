Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82877CBFDD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 11:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E0310E2B2;
	Tue, 17 Oct 2023 09:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5360210E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 09:48:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E9B6366072C1;
 Tue, 17 Oct 2023 10:48:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697536117;
 bh=YzKXJVl8pbT1OJptJTg1ONfOaAgrUeRJMmkISwud0mY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dVKS09CrX743nHJGLFQLvcN3+KNzr5wTRKvq7rY3phMiKiICxYSOxf2m4d9sV/YML
 o1XHziWU8xQxrCKbqFGDVoXpgqd7HMXEfzo7DzQBspFURzV0JucFbnuHOeXdwpAiCf
 r9dBz1Zd0xyeZA6SbGSpupkl4LDs8ufpBR3T/7e8jKQgLKWNmesXkhsQUSb1SaZL1g
 Ah6bE1xClh7c9Y8SV0+SQkdUNTFhRiYVEWV9WiHMlw67xkSVY1CkAziDpaT/mpEBaM
 DBoIyGiM0X25lRxyn2qkMIzJiKDex3gio+vD7pWX01Uq6TBS6Ogq3RKGw9qy+kK1ri
 P863fr1X1ankw==
Message-ID: <c23d00d0-604c-451f-9c1b-407fa2118031@collabora.com>
Date: Tue, 17 Oct 2023 11:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 19/23] drm/mediatek: Return error if MDP RDMA failed to
 enable the clock
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-20-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-20-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> Return the result of clk_prepare_enable() instead of
> always returns 0.
> 
> Fixes: f8946e2b6bb2 ("drm/mediatek: Add display MDP RDMA support for MT8195")
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


