Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E56A45DD0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFBF10E257;
	Wed, 26 Feb 2025 11:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c6IURImb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CE810E257
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740570351;
 bh=zuDQtknTvVdF2ZgtKWCQkBEadEohQseRtbIm+TZ42II=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c6IURImbp3KCNPOXFqy/b6TUhD6r6DZYgxKIeCAGg7D8+LlPKf7XzU2cGsy+oKS9Z
 8GT8GVmWOkCPxrTBLFR3F+TfZJgI6Xwko6eiu6Bz2d/BDAatb5HIZ3hGOZ0NSYpcIN
 DEWkzB2FF6Vf+hwAURRZhY6pPQByQtkVwj/vtHFnXls+kkCP3jAjrBfc3tZnGiZOpE
 WsRwsZcFKKMVnjizZA6i8Gn/IFm41fWyeeceJL+EE+sHY3cAFIqcBTCg/E5DX6SPCA
 OiYFmkguld2n2q6v67dYHd4hYE+oaSRaeZ0+vRQOPqNIv7bQZrFMKDZECDO751geVT
 CJCxipnCBdbvw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E0BF317E001E;
 Wed, 26 Feb 2025 12:45:49 +0100 (CET)
Message-ID: <c2154240-efa1-4c73-aabe-74e938a75af1@collabora.com>
Date: Wed, 26 Feb 2025 12:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
 <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
 <3310b6f9-df7a-4769-a221-4a93cc3ec035@collabora.com>
 <0863ee2e-25ed-43b7-a896-e380de828d58@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0863ee2e-25ed-43b7-a896-e380de828d58@baylibre.com>
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

Il 26/02/25 12:35, Alexandre Mergnat ha scritto:
> 
> 
> On 18/02/2025 09:52, AngeloGioacchino Del Regno wrote:
>> Il 17/02/25 16:03, Alexandre Mergnat ha scritto:
>>> Hi CK.
>>>
>>> On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
>>>> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>>>>> External email : Please do not click links or open attachments until you have 
>>>>> verified the sender or the content.
>>>>>
>>>>>
>>>>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>>>>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>>>>> mtk_dsi_lane_ready function, and the DSI module is set up during
>>>>> mtk_dsi_poweron.
>>>>>
>>>>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>>>>> nothing because lanes are considered ready. Unfortunately, when the panel
>>>>> driver try to communicate, the DSI returns a timeout.
>>>>>
>>>>> The solution found here is to put lanes_ready flag to false after the DSI
>>>>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>>>>> setup of the DSI module.
>>>>
>>>> I'm not clear about what happen.
>>>> I think this DSI flow has worked for a long time.
>>>> So only some panel has problem?
>>>
>>> I don't know if it's related to a specific panel or not.
>>>
>>>>
>>>> And another question.
>>>> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not 
>>>> actually ready?
>>>
>>> The workflow should be:
>>> ... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = 
>>> true (to avoid re-do dsi lanes setup) | ...
>>>
>>> I observe (print function name called + dsi->lanes_ready value):
>>
>> Alex, the first poweron is called by mtk_dsi_ddp_start() - and the start callback
>> is internal to the mediatek-drm driver.
>>
>> That callback is called by mtk_crtc during setup and during bridge enable(), and
>> there we go with suboptimal code design backfiring - instead of using what the
>> DRM APIs provide, this driver uses something custom *and* the DRM APIs, giving
>> this issue.
>>
>> Part of what mtk_crtc does is duplicated with what the DRM APIs want to do, so
>> there you go, that's your problem here :-)
>>
>> Should I go on with describing the next step(s), or is that obvious for everyone?
>>
>> :-)
>>
>> Cheers,
> 
> Ok thanks Angelo.
> Can you let me know if you agree with this change please ? This should be better:
> 

No, no, I'm saying that we should do the exact opposite of what you're doing here!

We should drop the MediaTek custom stuff that duplicates the DRM APIs behavior(s),
and conform to what the DRM APIs provide and want us to do.

To be really really clear - I'm saying to delete and avoid using:
- mtk_dsi_ddp_start()
- mtk_dsi_ddp_stop()

The spirit here should be to use kernel provided APIs, and to make custom stuff
to disappear as much as possible (again, that mtk_crtc .start/.stop).

I'm not saying that literally all of the start/stop callbacks for all of the
MTK DRM drivers should disappear *all at once* but... gradually, one by one,
these should get lost (where/if possible).

Just one more mention: that custom handling also backfired on me while writing
the hdmiv2/dpi drivers... and now backfires on dsi, and in the future it will
backfire again on something else. It's there only to give problems in the end,
not to solve them :-)

Cheers,
Angelo

> @@ -843,25 +843,6 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge 
> *bridge,
>       mtk_output_dsi_enable(dsi);
>   }
> 
> -static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> -                         struct drm_bridge_state *old_bridge_state)
> -{
> -    struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> -    int ret;
> -
> -    ret = mtk_dsi_poweron(dsi);
> -    if (ret < 0)
> -        DRM_ERROR("failed to power on dsi\n");
> -}
> -
> -static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> -                           struct drm_bridge_state *old_bridge_state)
> -{
> -    struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> -
> -    mtk_dsi_poweroff(dsi);
> -}
> -
>   static enum drm_mode_status
>   mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>                 const struct drm_display_info *info,
> @@ -886,8 +867,6 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>       .atomic_disable = mtk_dsi_bridge_atomic_disable,
>       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>       .atomic_enable = mtk_dsi_bridge_atomic_enable,
> -    .atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> -    .atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
>       .atomic_reset = drm_atomic_helper_bridge_reset,
>       .mode_valid = mtk_dsi_bridge_mode_valid,
>       .mode_set = mtk_dsi_bridge_mode_set,
> 
> 


