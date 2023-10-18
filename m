Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58B7CD611
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 10:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898510E023;
	Wed, 18 Oct 2023 08:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0CA10E023
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 08:06:46 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 49E9B66072ED;
 Wed, 18 Oct 2023 09:06:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697616405;
 bh=SKaYS5DAqe/a4E7/c1VcAilMd6UWMjFFf0Epels2xL8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MdDYz9WoTVlY4oHxVt/oTkSzcqWPK4ev+LKCoza0HMj4mlY/URh65GQQnpkGFSbKm
 d70v6ajl9K5xhqr31MT4u0bOUHhNp+n9lsVauYGHkUwIf94Aww1rLE6s6Oii18jTzk
 S5CT8aHpkM+eJHZx/uMWa0zHaO6/zd96sHtdTnVYQARLFR14TPUyCnus1lBuRznKlN
 Nd4EDwW2Nw1L7eKwPZOC/SyxJT7Wpu3Zv9mLxDoK+pPhpjgAGcBqG9YCU4yY8c5AF7
 ovsMKvKyFGqczaHX4eFSW0GW/kBc4PICK6/qVmEiISwQe67T5d7DTFSV1hHGugCHl8
 YDC4GBzuJPfkQ==
Message-ID: <4e402da6-f6ba-4200-9cbb-47d2b117aa91@collabora.com>
Date: Wed, 18 Oct 2023 10:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 22/23] drm/mediatek: Power on devices in OVL adaptor
 when atomic enable
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231018043650.22532-1-shawn.sung@mediatek.com>
 <20231018043650.22532-23-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231018043650.22532-23-shawn.sung@mediatek.com>
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

Il 18/10/23 06:36, Hsiao Chien Sung ha scritto:
> Different from OVL, OVL adaptor is a pseudo device so we didn't
> define it in the device tree, consequently, pm_runtime_resume_and_get()
> called by .atomic_enable() powers on no device in OVL adaptor and
> leads to power outage in the corresponding IOMMU.
> 
> To resolve the issue, we implement a function to power on the RDMAs
> in OVL adaptor, and the system will make sure the IOMMU is powered on
> as well because of the device link (iommus) in the RDMA nodes in DTS.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


