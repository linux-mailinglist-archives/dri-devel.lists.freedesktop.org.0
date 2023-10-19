Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0D7CF38C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 11:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDCF10E4A3;
	Thu, 19 Oct 2023 09:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2310E4A3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 09:07:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 12B4D6607323;
 Thu, 19 Oct 2023 10:07:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697706469;
 bh=i4wN4m4h2lJzPVgsUhjbrbiElmhqA0fmSzmkzrYrPWo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FDlbibuIvhnNoxRHgtGqCpkWiPIo+sf4Cym/EB/rZhahxHY6GN91Y9Zvx9lACMTP0
 0n50RaX+pPgmbBj+Og56zGRzTMqp1ZSb5u2f2yeeWirimR40+VEctVjtGU7rsJpmvw
 Ygzh8rR+xWHPzy6ZBtqzNegZCdVi5481tBqSfxX7+mud+xcGAwckpl/+19oi3d4xBX
 th2O3dEsmzcWw7ccBsqC8pyZSYzlIQPWJalIIu26qTle5PXYUVccoEiH17lTHeuNT4
 tGxRewA1F5G8O/t4PDkWlfcGzNAI0DIOhq2O/LgjXr3US9DQwcja4foO5pMJigTNc2
 jiI2/SYOHsWtA==
Message-ID: <0815ab39-8796-4719-bec5-489aace1cb7c@collabora.com>
Date: Thu, 19 Oct 2023 11:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 14/24] drm/mediatek: Power on/off devices with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-15-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231019055619.19358-15-shawn.sung@mediatek.com>
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
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/10/23 07:56, Hsiao Chien Sung ha scritto:
> Different from OVL, OVL adaptor is a pseudo device so we didn't
> define it in the device tree, consequently, pm_runtime_resume_and_get()
> called by .atomic_enable() powers on no device. For this reason, we
> implement a function to power on the RDMAs in OVL adaptor, and the
> system will make sure the IOMMUs are powered on as well because of the
> device link (iommus) in the RDMA nodes in DTS.
> 
> This patch separates power and clock management process, it would be
> easier to maintain and extensions.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

