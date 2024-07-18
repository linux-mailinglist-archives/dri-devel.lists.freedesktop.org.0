Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961D934C4C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041810E7B6;
	Thu, 18 Jul 2024 11:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GGTbJ5z0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2910E7A4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721301568;
 bh=OxM4UDPZ+xv+v3W6VDLH7BcPrLByvTYnPHEmdhBrqY8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GGTbJ5z08cXirsinf/f56Fc3980CBrTiZ09zsAyEtdYjXxMON4akBrnrnOY6/XlGt
 zgICRk+ItXVxSaP0AUX1S5/vYFV+1yrSE4JB5tKvjog3cRCPP0N6+CJVQjs0g5CAL0
 ZcWhKe2DhXRkQBW/E9TYxPH0i+RaKjyjoscoHDbr3AbsiSblD7Kj9CF9pQBkXZTIkN
 xx9DNyXFqZbaH+htn1glXXbyqYRJGXPw+icEQuIzwFEyVycVkOrUlOlTyUZHxV4hwv
 kDPv1ftsAIqHYqwTVyqPf1x2UUZzAqnsKFLG6DjYJ8acaOB6RFGu9NL2zbRt6ZOdHZ
 S9TFJh0CTEExA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 55328378202D;
 Thu, 18 Jul 2024 11:19:27 +0000 (UTC)
Message-ID: <f06ea90a-7f42-453d-8dfe-84dd4038b8af@collabora.com>
Date: Thu, 18 Jul 2024 13:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Declare Z Position for all planes
To: Daniel Stone <daniel@fooishbar.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240718082507.216764-1-angelogioacchino.delregno@collabora.com>
 <CAPj87rM1dbawwtRnMzDRLLCt6FuOU+851hcJhKDsg1ioRM2Pqw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rM1dbawwtRnMzDRLLCt6FuOU+851hcJhKDsg1ioRM2Pqw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/07/24 13:15, Daniel Stone ha scritto:
> Hi,
> 
> On Thu, 18 Jul 2024 at 09:25, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> MediaTek SoCs support multiple planes, one of which is the primary
>> and all the others are overlays (and CURSOR is the last overlay).
>>
>> In all currently supported SoCs, the Z order of the overlays can't
>> be changed with any fast muxing action, and can only be changed by
>> swapping the contents of the entire register set of one overlay
>> with the other to internally reorder the layer properties, which
>> is indeed feasible, but probably more expensive than desired.
>>
>> Declare the Z position for all planes with an immutable property
>> at least for now, so that the userspace can take its decisions
>> accordingly.
> 
> Thanks a lot for this fix!
> 
> If I understand your middle paragraph correctly, please don't ever do
> that though. I think what you're suggesting by 'swapping the contents
> of the entire register set' is:
> * plane ID 40 (normally) controls OVL1
> * plane ID 41 controls OVL2
> * userspace configures planes 40 & 41 with a zpos suggesting that 41
> should be below 40
> * the DRM driver 'swaps the contents of the entire register set' by
> making plane 40 control OVL2 instead and plane 41 control OVL1 instead

Yeah, that's exactly what I mean.

> 
> If so - please no. Just declare an immutable zpos, because that
> actually matches the hardware, and then leave userspace to configure
> the planes in a way which makes sense. 

I had a hunch... and that's a perfect confirmation - thank you!

> Looking at the zpos property is
> already required in order to handle overlapping overlay planes, and
> any userspace which supports overlays (including Weston) already looks
> at zpos, handles immutable properties, and will dtrt.
> 
> Anyway, this is:
> Acked-by: Daniel Stone <daniels@collabora.com>

Thumbs up! :-)

Cheers!

> 
> Cheers,
> Daniel



