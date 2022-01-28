Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DB49F60F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 10:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FBA10F600;
	Fri, 28 Jan 2022 09:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E317410F5FE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 09:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 029441F45DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643361215;
 bh=1t37Who892UgzGYY1/obVI1c4xg7GCI5hTII7E25RXc=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=icjXHmtYlty4sGUEzqvYYuKTs/KKYuBCXYBiIJKGV1pyFbjQO+zU9XWbOgmB9/v1S
 UFd2f7F5Lv5p/xtwrJSx94W16cekuZkPoaNq+zfwxX95RrzT9NkvVEsnFyhabpClTD
 81HswS6Vi3aZzf5lLfcsHp1JpQTshMri2jR1qzmSoeHQ3IT15oW8T06WKCdWmTLo8R
 QcLTNK1MvQGUNMh07HHx9xsG5QSKh00VIvTBcrvqrDxyAmFEKcSJvXAUWsn/Mf9+PT
 9942P6a51mYZLUhLAHO/PL3ilq8Fh8NbnATnoUQ/rWVsNRukJaUpIGEmKfg1VN14LY
 ou3MgSVqDEHPA==
Subject: Re: [PATCH v3] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220127143623.123025-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__yO6Cq8qt8RSh9AX68mJEv+wWvuhY0_p-PTJ=eJD_7aA@mail.gmail.com>
 <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
Message-ID: <ddb05e08-f81a-11f9-8091-9af0c57e687d@collabora.com>
Date: Fri, 28 Jan 2022 10:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/01/22 16:46, AngeloGioacchino Del Regno ha scritto:
> Il 27/01/22 16:21, Chun-Kuang Hu ha scritto:
>> Hi, Angelo:
>>
>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
>> 2022年1月27日 週四 下午10:36寫道：
>>>
>>> DRM bridge drivers are now attaching their DSI device at probe time,
>>> which requires us to register our DSI host in order to let the bridge
>>> to probe: this recently started producing an endless -EPROBE_DEFER
>>> loop on some machines that are using external bridges, like the
>>> parade-ps8640, found on the ACER Chromebook R13.
>>>
>>> Now that the DSI hosts/devices probe sequence is documented, we can
>>> do adjustments to the mtk_dsi driver as to both fix now and make sure
>>> to avoid this situation in the future: for this, following what is
>>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
>>> mtk_dsi_ops.attach callback and delete it in the detach callback;
>>> keeping in mind that we are registering a drm_bridge for our DSI,
>>> which is only used/attached if the DSI Host is bound, it wouldn't
>>> make sense to keep adding our bridge at probe time (as it would
>>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
>>> that one to the dsi host attach function (and remove it in detach).
>>>
>>> Fixes: 209264a85707 ("drm/bridge: Document the probe issue with MIPI-DSI bridges")
>>
>> The fixed tag should indicate the patch which cause the bug, but why a
>> patch just adding document would cause bug?
>> So no any patch cause bug? This patch just want to prevent a possible bug?
>>
> 
> I think you've missed my previous message on v2, so I will paste it here:
> 
> unfortunately I couldn't find a valid commit for a Fixes tag. This
> started being an issue at some point, when the DRM was changed to
> adhere to the documented probe sequence: the MediaTek DSI driver was
> not the only one that got broken/affected by these changes.
> 
> If you have any advice on which commit should be tagged, I'm open for
> any kind of suggestion.
> 
> 
> I tried to check on other drivers which got fixed for the same behavior,
> for example drm/msm, but none of them had a Fixes tag.
> When the DRM got changed to adhere to this sequence, some drm/bridge
> drivers were also changed; this has created some incompatibilities with
> some drm drivers, including drm/msm and drm/mediatek.
> 
> This commit is not fixing a latent bug that was introduced in drm/mediatek
> but rather one that was induced by the new, fixed, probe flow that got
> recently documented - and to which drivers should adhere; failing to adhere
> to that will produce an endless -EPROBE_DEFER loop, due to other drivers
> (as mentioned, for example drm/bridge drivers) having been changed to use
> that probe sequence.
> 
> 
> Regards,
> Angelo
> 

I've been thinking about another solution to this issue.

Would it be fine if I send a v4 that removes the Fixes tag, but adds the following?

Cc: stable@kernel.org # v5.15+

>> Regards,
>> Chun-Kuang.
>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
>>>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++--------------
>>>   1 file changed, 84 insertions(+), 83 deletions(-)
>>>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
