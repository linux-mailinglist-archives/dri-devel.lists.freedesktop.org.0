Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B435BF9CC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 10:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540EE10E2F9;
	Wed, 21 Sep 2022 08:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0F210E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:49:34 +0000 (UTC)
X-UUID: 20cf9df1efb941bb978f518168bb9188-20220921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID;
 bh=Sd+Fxwzp7bxeXD28OoMGK9mSgc3f6o0UFW/iNLtc8BI=; 
 b=CSJ0NDh69Lvh5yBCzzowyzfIFyXDnRZHZRNlIM+MBi9VBvaGWgcYKzQBH+RFCya/JoFfCqcqM7i9sK3h48j/OUKz34g0rK4RBuQleK/FOJJcFPGDHRazq8DUVjZqDnG1iXUsT7mVzadY2A0aQ8i0tHiXwpA6gaGA1iEnJ7H4hds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:41914426-8510-42a7-a32e-10054c44b235, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:a0a226f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 20cf9df1efb941bb978f518168bb9188-20220921
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2011992881; Wed, 21 Sep 2022 16:49:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 21 Sep 2022 16:49:26 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Sep 2022 16:49:26 +0800
Message-ID: <0bf7b7d5-087b-912e-412e-2b3b742448bd@mediatek.com>
Date: Wed, 21 Sep 2022 16:49:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/mediatek: dsi: Move mtk_dsi_stop() call back to
 mtk_dsi_poweroff()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220804194325.1596554-1-nfraprado@collabora.com>
 <CAJMQK-hOxxvkjgOxA6KLLUJxxBehHDQvRo-Y_FLMPLEfkoVMzA@mail.gmail.com>
 <227bce07-37cc-da1d-fc99-065a12cdf3f5@collabora.com>
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
In-Reply-To: <227bce07-37cc-da1d-fc99-065a12cdf3f5@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/19/22 21:32, AngeloGioacchino Del Regno wrote:
> Il 19/09/22 10:40, Hsin-Yi Wang ha scritto:
>> On Mon, Sep 19, 2022 at 4:39 PM Nícolas F. R. A. Prado
>> <nfraprado@collabora.com> wrote:
>>>
>>> As the comment right before the mtk_dsi_stop() call advises,
>>> mtk_dsi_stop() should only be called after
>>> mtk_drm_crtc_atomic_disable(). That's because that function calls
>>> drm_crtc_wait_one_vblank(), which requires the vblank irq to be enabled.
>>>
>>> Previously mtk_dsi_stop(), being in mtk_dsi_poweroff() and guarded by a
>>> refcount, would only be called at the end of
>>> mtk_drm_crtc_atomic_disable(), through the call to
>>> mtk_crtc_ddp_hw_fini().
>>> Commit cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
>>> enable/disable and define new funcs") moved the mtk_dsi_stop() call to
>>> mtk_output_dsi_disable(), causing it to be called before
>>> mtk_drm_crtc_atomic_disable(), and consequently generating vblank
>>> timeout warnings during suspend.
>>>
>>> Move the mtk_dsi_stop() call back to mtk_dsi_poweroff() so that we have
>>> a working vblank irq during mtk_drm_crtc_atomic_disable() and stop
>>> getting vblank timeout warnings.
>>>
>>> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from
>>> enable/disable and define new funcs")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>
> 
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> 
> 

Tested suspend/resume work properly on mt8188 and mt8186  .

Tested-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
