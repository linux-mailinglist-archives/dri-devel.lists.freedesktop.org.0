Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E39E8F27
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 10:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F9B10E69C;
	Mon,  9 Dec 2024 09:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gLAlzeCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40E710E69C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733737770;
 bh=vDVoR6QJHDbAwKUmHAbTLSwKdLlywl2nMTNdrlzT7ps=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gLAlzeCQfkpTQp2EmlKFXooBQiBUryzCmDJjPB+gfcQaqEw9EgdVaJvhwctpQkX/J
 Ob4ObKCYSBfEZ3dkPmuc9169HstBj8Ik0XVxy/ySYno8CqPJGYv60WspYpeKEoWNci
 MrsJaNcevihSx7KjRvZH0SRmaI9Yt4Nl+pgIep0xDJZYhpyoJ+/Fm4Jlmq77RVkBjI
 kmpgr6Ww4ESZP+Yr5sExjFYAKcqexK6sXrZm+aWPfdb4E/fcN5azk1XtffGLoF8cn7
 GTpBsrD7cM8xOqhgz6HUMcTXtlXvEIy11dXbFRfJIryJtBZoQw1fZGF5cvK+M0xd/i
 sdm6z27mHpq6Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F2EB17E3615;
 Mon,  9 Dec 2024 10:49:29 +0100 (CET)
Message-ID: <b5a77637-64b0-4ed3-9619-e76d094505af@collabora.com>
Date: Mon, 9 Dec 2024 10:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-14-angelogioacchino.delregno@collabora.com>
 <c0e144b3a90881066d0974157e66ac23f09a0fc5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c0e144b3a90881066d0974157e66ac23f09a0fc5.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/12/24 09:17, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-05 at 12:45 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for adding the new HDMI TX v2 IP driver, assign the
>> pointer to the DDC adapter to struct drm_bridge during probe.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index 1b23ab6969ec..4f708b04f5e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -410,6 +410,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
>>          hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
>>          hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>          hdmi->bridge.of_node = pdev->dev.of_node;
>> +       hdmi->bridge.ddc = hdmi->ddc_adpt;
> 
> I don't know why only v2 driver need to assign this?
> Could you point out the code where access this value?
> 

v2 uses hdmi helpers, which make use of bridge->ddc.
mtk_hdmi_v2_bridge_edid_read() calls drm_edid_read().

drm_edid.c -> drm_edid_read()
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/drm_edid.c?h=next-20241209#n2704

...while v1 feeds the (internal) ddc pointer to drm_edid_read_ddc() instead.

Cheers,
Angelo

> Regards,
> CK
> 
>>
>>          ret = devm_drm_bridge_add(dev, &hdmi->bridge);
>>          if (ret)
>> --
>> 2.47.0
>>
> 


