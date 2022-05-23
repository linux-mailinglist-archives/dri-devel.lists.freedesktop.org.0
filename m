Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F9C530E78
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FDB10E914;
	Mon, 23 May 2022 10:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836D210E90B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:54:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C772F80351;
 Mon, 23 May 2022 12:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653303270;
 bh=ygIY+UZ8fKEEFE3cSCeoyuqn9kp29U0XNkC4K25f7e4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G3XfGonik7chtGLES061VZTHJw0gqt2VZwcdieoMogkTV0/rcXxEnnzz+cKLloKI9
 b9Lym3c4sDdRy3G8h9w7a58UGcuSarGRKiT9B8YqPeroFRmVh87VlpEfh1xp/v33yh
 GsbXmSHDGInIvHghr4s7A15nk3BTqcunLldjaOqW6xA3CznXJfJC8MwnAYU9Xpi2/4
 NQKAF+FLrn8qo58n/Z+tuU7QXNfiTHin3+yDVU4jSWKQuwjvp0T72AEqfuSzUzG61L
 YMBQWUa7j+S89aCGNLV51vaXjbMQ4O4ubpuiDllUIRYX6YURMEg5oTIWT7LA8Z2gKv
 HSzFTeYtgv1/Q==
Message-ID: <26c707fc-5d7b-581f-6a21-9026038ed9e7@denx.de>
Date: Mon, 23 May 2022 12:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
References: <20220518233844.248504-1-marex@denx.de>
 <5ff1a7f051c72891c820bb4c9a9062c7c0591840.camel@pengutronix.de>
 <CAG3jFyvm+gVESUX9LM0Mh48SsC+MZnTpOwrtbi+rRv8PtRWWTQ@mail.gmail.com>
 <adadd88b-9e6f-1ee8-9824-d284b0f91237@denx.de>
 <CAG3jFysH5oLtoJ+bkHL-7m2Qbp3W7ostU7YH6_2D6tTGzTup4g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAG3jFysH5oLtoJ+bkHL-7m2Qbp3W7ostU7YH6_2D6tTGzTup4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/23/22 12:23, Robert Foss wrote:
> On Mon, 23 May 2022 at 11:58, Marek Vasut <marex@denx.de> wrote:
>>
>> On 5/23/22 11:40, Robert Foss wrote:
>>> On Thu, 19 May 2022 at 09:57, Lucas Stach <l.stach@pengutronix.de> wrote:
>>>>
>>>> Am Donnerstag, dem 19.05.2022 um 01:38 +0200 schrieb Marek Vasut:
>>>>> Handle empty data-lanes = < >; property, which translates to
>>>>> dsi_lanes = 0 as invalid.
>>
>> [...]
>>
>>>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>> index d64d4385188dd..dc65f424e7f3c 100644
>>>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>> @@ -585,7 +585,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>>>>>         ctx->host_node = of_graph_get_remote_port_parent(endpoint);
>>>>>         of_node_put(endpoint);
>>>>>
>>>>> -     if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4) {
>>>>> +     if (ctx->dsi_lanes <= 0 || ctx->dsi_lanes > 4) {
>>>>>                 ret = -EINVAL;
>>>>>                 goto err_put_node;
>>>>>         }
>>>>
>>>>
>>>
>>> Applied to drm-misc-next.
>>
>> This was already applied to drm-misc-next-fixes , since this is a fix
>> for something that was already in release . The conflict will resolve
>> itself easily though ?
> 
> Ah, I didn't realize. I'm not sure if it will resolve itself or not.
> But I think either it is reverted in drm-misc-next now, or we wait for
> an issue to crop up. I think either way is acceptable, but waiting
> maybe causes less churn. So unless someone has another preference,
> let's wait and see if a conflict arises.

I agree, we wait.
