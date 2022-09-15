Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B265B93E5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 07:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218B410EA68;
	Thu, 15 Sep 2022 05:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1206810EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 05:19:12 +0000 (UTC)
X-UUID: eaee028f665b40e8ad518f2ce0622054-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:Message-ID;
 bh=I/eK0cfbxCIDrkJpxpNUKq8DfD7I1QFLOHC7/nfS/3o=; 
 b=dmn+CBxXltA8CLcFtZ+rGyEmzcSV/fz6VPlKGKEU4uGf0I95H5KjWcHIsiK64cmMthWvfM6s6q9T5yKGzV84EVyZMOgTaQfxIBeMSMebcmHdeGXR7iakLsVY0YLnfS/aMGTXOmwnVTcg4v2iMDim1wcYC/8UFKyT/3bLt6Fo0+o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:60b2e5e1-0c7d-47f8-9011-4f681b75e465, IP:0,
 U
 RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Release_Ham,ACT
 ION:release,TS:93
X-CID-INFO: VERSION:1.1.11, REQID:60b2e5e1-0c7d-47f8-9011-4f681b75e465, IP:0,
 URL
 :25,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:93
X-CID-META: VersionHash:39a5ff1, CLOUDID:fc4fb37b-ea28-4199-b57e-003c7d60873a,
 B
 ulkID:220914161747OE9HJACH,BulkQuantity:69,Recheck:0,SF:28|17|19|48,TC:nil
 ,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: eaee028f665b40e8ad518f2ce0622054-20220915
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 76293047; Thu, 15 Sep 2022 13:19:05 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 13:19:03 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Sep 2022 13:19:03 +0800
Message-ID: <03cb748c-4531-9669-faac-7e975855149d@mediatek.com>
Date: Thu, 15 Sep 2022 13:19:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] drm: mediatek: Fix display vblank timeout when disable dsi
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <1663136309-29491-1-git-send-email-xinlei.lee@mediatek.com>
 <0723c329-475c-42a1-f6d5-f478d649aef1@collabora.com>
 <64bf6d7b-5a28-9b7d-fc3e-4c3c8eaa7d25@mediatek.com>
 <3dd03eea-84cf-73bc-0bd4-3450c44ac8ba@collabora.com>
Content-Language: en-US
In-Reply-To: <3dd03eea-84cf-73bc-0bd4-3450c44ac8ba@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi maintainer,

Patch v2 has been sent to [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20220914140031.18578-1-allen-kh.cheng@mediatek.com/

I'm sorry I didn't reply to all the email lists in the initial reply.

Below is the most recent information.

Thanks,
Allen

On 9/14/22 21:34, AngeloGioacchino Del Regno wrote:
> Il 14/09/22 15:30, Allen-KH Cheng ha scritto:
>> Hi Angelo,
>>
>> It's mt8186 corsola board. When this problem arises in system
>> susepend/resume, we have your fix[1] in our dsi driver.
>>
>> Because there is a conflict in mediatek-drm-fixes,
>> kernel/git/chunkuang.hu/linux.git.
>>
>> I'll assist Xinlei with another resend.
>>
>
> Ok, thanks for confirming!
>
> Cheers,
> Angelo
>
