Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EF7CC21C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 13:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C61B10E274;
	Tue, 17 Oct 2023 11:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3410E274
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 11:57:16 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F06566084C6;
 Tue, 17 Oct 2023 12:57:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697543835;
 bh=AyuqoMdszEZGzIWvv2uoi2F/5G+cqfsrjpIs6w3mh0I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ww2qGQ2R4Q6QkN5em1t0y5CZi7yoro3gEHwoYsemaDDR9jjn28lISZtaFBK22Z1fk
 Qi92yYJksMQk3MpU7+yeaK/LgcMWwAA5RfaB/1U51LpTELkztPmxND2KmcXhICOHtn
 GPmzSZVJjMD5HZGPIWJmpRH782qrcpshwshkEQlHvFs3fNlf4SV9qhEZcIJNgweKDI
 u4YeRzIOvORqPiLscuglPAvVuURm6xg6p4fCF08oJkvFpUMKxIpUu6nA2z+ZS9EhMX
 53zsfsZi75dcGYTTo5cDDirk2VaTeIzEgyAEG0zjFTeaIbeXeQiEMPZeRHApfijy3r
 9f6y9uDcT5T3A==
Message-ID: <ff9374af-2664-4bd0-a13f-257fbf09dc2a@collabora.com>
Date: Tue, 17 Oct 2023 13:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-16-shawn.sung@mediatek.com>
 <91932706-c42c-4c10-96bd-c8a91b7d82f0@collabora.com>
 <714697a54f449cbc78620f7482ca78173fc94230.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <714697a54f449cbc78620f7482ca78173fc94230.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: =?UTF-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "johnson.wang@mediatek.corp-partner.google.com"
 <johnson.wang@mediatek.corp-partner.google.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/10/23 12:50, Shawn Sung (宋孝謙) ha scritto:
> Hi Angelo,
> 
> On Tue, 2023-10-17 at 11:47 +0200, AngeloGioacchino Del Regno wrote:
>> Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
>>> By registering component related functions to the pointers,
>>> we can easily manage them within a for-loop and simplify the
>>> logic of clock control significantly.
>>>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
>>> ---
>>>    .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 111 +++++++----
>>> -------
>>>    1 file changed, 44 insertions(+), 67 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>>> b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>>> index 60e5dfe9ef0d..fffef2a4f919 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>>> @@ -53,6 +53,7 @@ struct ovl_adaptor_comp_match {
>>>    	enum mtk_ovl_adaptor_comp_type type;
>>>    	enum mtk_ddp_comp_id comp_id;
>>>    	int alias_id;
>>> +	const struct mtk_ddp_comp_funcs *funcs;
>>>    };
>>>    
>>>    struct mtk_disp_ovl_adaptor {
>>> @@ -67,20 +68,35 @@ static const char * const
>>> private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>>>    	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
>>>    };
>>>    
>>> +static const struct mtk_ddp_comp_funcs _ethdr = {
>>
>> Sorry I just noticed that; can you please remove the leading "_" from
>> all
>> of those?
>>
>> _ethdr -> ethdr or mtk_ethdr
>> _merge -> merge or mtk_merge
>> _rdma  -> rdma  or mtk_rdma
>>
>> Thanks,
>> Angelo
>>
> 
> Sure. Will do in the next version.
> The reason I didn't use mtk_* is simply because of the column width
> will exceed 100 characaters.
> 

Okay that would not be good, I guess that just `ethdr`, `merge`, `rdma` will
be fine then.

Cheers,
Angelo

> Thanks,
> Shawn



