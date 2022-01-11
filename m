Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978948ABE3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6A410F7CB;
	Tue, 11 Jan 2022 10:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DD910F234
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:57:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7F8D61F43A35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898669;
 bh=w5BDtpAS0IG8A52FS/8V2a2UttXGE+Cd5hv/CSzivNE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YiyLULsgUHw/8bEQUraCWZ47NGhu/oZat3mLwkUxP0OHrHmnIumJbpycM+cDbhcog
 bSF0Rog5BfHklpvJkxJY8oDnhEF9Z7GQGd/RPARulgMY/HjTldhm1SZEtVwZtYlyWP
 AiRk59GOJjVjBhj+SQmmZjPu0Mh3bsNvdAXUvv1HH3OR1Yu2Da+68ocTSP3rIebtkX
 4Gn4UOIbkBSJ9RVrI3KA4aMdwHacS+PmqCBGp7zpHDxu4wvy+21qkz84COAB7a/hiP
 3kkhN2gGyc9hLfo2CVQL1IEqH6lFSniTJfwAGajOkR6Nd8FoA9nk2OTal/BWcKbdhI
 mUaRVU2/OMeyw==
Subject: Re: [PATCH v9 06/15] media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-7-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1003e60d-fa75-d518-943d-72ff88d6b132@collabora.com>
Date: Tue, 11 Jan 2022 11:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-7-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, devicetree@vger.kernel.org,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 yf.wang@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/11/21 11:55, Yong Wu ha scritto:
> MediaTek IOMMU has already added device_link between the consumer
> and smi-larb device. If the jpg device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> After removing the larb_get operations, then mtk_jpeg_clk_init is
> also unnecessary. Remove it too.
> 
> CC: Rick Chang <rick.chang@mediatek.com>
> CC: Xia Jiang <xia.jiang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Rick Chang <rick.chang@mediatek.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

