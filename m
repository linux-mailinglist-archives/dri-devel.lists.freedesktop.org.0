Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C85BC195
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 05:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618210E4ED;
	Mon, 19 Sep 2022 03:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C798110E4ED
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 03:01:17 +0000 (UTC)
X-UUID: 8e7c2af9fdbe40aa902e87221b3b1be1-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID;
 bh=brO5M1scQWHNwMS0EUhURU1amtuc/rJCBXyobl1FbS4=; 
 b=XFhhWjB6HiwifZ+jpsdNB98ckYp/1KCdAiqeqptTNpdgdu38zRIBV23uNev7Cnlw5FC8iFRlX8IFIzQ1dZU/qFUEZT1/4b2bK7gnh1YX8uj429rjrxk35IOcgGDWJLWGS1lWdEmCKEIQEhxFJ88erWj8RhrtcvHP+cOKynlEUWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:234500b2-2d89-4c29-a46b-5df75421d762, IP:0,
 U
 RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:20
X-CID-META: VersionHash:39a5ff1, CLOUDID:2c5ad4f6-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8e7c2af9fdbe40aa902e87221b3b1be1-20220919
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 296657723; Mon, 19 Sep 2022 11:01:13 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 11:01:12 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Sep 2022 11:01:11 +0800
Message-ID: <7ef4e4c6-e8e6-74a9-8211-bff90ad2d9fb@mediatek.com>
Date: Mon, 19 Sep 2022 11:01:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm: mediatek: Fix display vblank timeout when disable
 dsi
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
 <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
In-Reply-To: <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
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
Cc: =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

We will test this fix on the mt8186/mt8183.
Maybe our fix is not necessary.

I appreciate your suggestion.

BRs,
Allen

On 9/18/22 12:32, Chun-Kuang Hu wrote:
> Hi, Allen:
> 
> Allen-KH Cheng <allen-kh.cheng@mediatek.com> 於 2022年9月14日 週三 晚上10:00寫道：
>>
>> From: Xinlei Lee <xinlei.lee@mediatek.com>
>>
>> Dsi is turned off at bridge.disable, causing crtc to wait for vblank
>> timeout. It is necessary to add count protection to turn off dsi and
>> turn off at post_disable.
> 
> If turn off dsi in post_disable(), you should turn on dsi in pre_enable().
> 
> There is another patch fix this problem [1], do you have any comment
> on that patch?
> 
> [1] http://lists.infradead.org/pipermail/linux-mediatek/2022-August/046713.html
> 
> Regards,
> Chun-Kuang.
> 
>>
>> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs")
>> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
>> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> ---
>> Change in v1:
>>   * Rebase to kernel/git/chunkuang.hu/linux.git, mediatek-drm-fixes
>>     [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
>> ---
>> ---
>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 5b624e0f5b0a..e30f4244c001 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -768,14 +768,6 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
>>         drm_display_mode_to_videomode(adjusted, &dsi->vm);
>>  }
>>
>> -static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
>> -                                         struct drm_bridge_state *old_bridge_state)
>> -{
>> -       struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>> -
>> -       mtk_output_dsi_disable(dsi);
>> -}
>> -
>>  static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>>                                          struct drm_bridge_state *old_bridge_state)
>>  {
>> @@ -803,13 +795,15 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>  {
>>         struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>>
>> +       if (dsi->refcount == 1)
>> +               mtk_output_dsi_disable(dsi);
>> +
>>         mtk_dsi_poweroff(dsi);
>>  }
>>
>>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>>         .attach = mtk_dsi_bridge_attach,
>>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> -       .atomic_disable = mtk_dsi_bridge_atomic_disable,
>>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>         .atomic_enable = mtk_dsi_bridge_atomic_enable,
>>         .atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
>> @@ -829,6 +823,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
>>  {
>>         struct mtk_dsi *dsi = dev_get_drvdata(dev);
>>
>> +       if (dsi->refcount == 1)
>> +               mtk_output_dsi_disable(dsi);
>> +
>>         mtk_dsi_poweroff(dsi);
>>  }
>>
>> --
>> 2.18.0
>>
