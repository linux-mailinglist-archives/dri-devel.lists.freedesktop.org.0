Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4B12A235
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9B6E5C8;
	Tue, 24 Dec 2019 14:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104089950
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 14:27:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 8D11B292129
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
 <CANMq1KBHsc8oqcjWnjLPCpRToyOm16X6EcQqmqPjZf=D7wA2-Q@mail.gmail.com>
 <05db638b-02a6-0e3a-43ed-44a0a1458d87@collabora.com>
 <CANMq1KA4mp648p1LicOzAyra6tdgN2qdDY=N0XyDYhgt6BP26w@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <1c68fa67-c4c4-ea78-bfe4-6344799bbf46@collabora.com>
Date: Mon, 23 Dec 2019 15:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KA4mp648p1LicOzAyra6tdgN2qdDY=N0XyDYhgt6BP26w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

On 23/12/19 10:14, Nicolas Boichat wrote:
> On Mon, Dec 23, 2019 at 3:10 PM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> Hi Nicolas,
>>
>> Many thanks for you review. Just preparing a new version with your comments
>> addressed.
>>
>> On 20/12/19 9:44, Nicolas Boichat wrote:
>>> On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
>>> <enric.balletbo@collabora.com> wrote:
>>>>
>>>> From: Jitao Shi <jitao.shi@mediatek.com>
>>>>
>>>> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
>>>>
>>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>>> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
>>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> [uli: followed API changes, removed FW update feature]
>>>> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> ---
>> [snip]
>>>> +       ret = i2c_smbus_write_byte_data(client, PAGE2_MCS_EN,
>>>> +                                       status & ~MCS_EN);
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
>>>> +               goto err_regulators_disable;
>>>> +       }
>>>> +
>>>> +       ret = ps8640_bridge_unmute(ps_bridge);
>>>> +       if (ret)
>>>> +               DRM_ERROR("failed to enable unmutevideo: %d\n", ret);
>>>
>>> failed to unmute? Or failed to enable?
>>>
>>
>> failed to unmute sound more clear to me.
> 
> I may be wrong, but I have the feeling that the functions
> "mute/unmute" video/display, actually... And that the function naming
> is strange...
> 

Yes, that's strange.

> You could just try to remove the calls, as there is no audio on the
> board you have (elm), so if video still works, maybe this is actually
> audio ,-)
> 

And without those the display doesn't work. So I suspect that what is wrong and
confusing is the message, instead of mute/unmute, and based on the register
names this looks more like an internal regulator that you need to enable and
disable, so I'll change the error message accordingly.

Thanks,
 Enric

> Thanks,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
