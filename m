Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED15A5DDB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9089210EBBD;
	Tue, 30 Aug 2022 08:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CA810EBBD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:16:02 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42EFD481;
 Tue, 30 Aug 2022 10:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661847360;
 bh=ApBwk4f3KoSc9NbmtbDrFXaF6qmqL8hvYhHNyNP1PU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tY3FmSX476zW18wzvioGrYJZv99JEAuPO1sE5b5UrxzU0Hn9fap29g64NbGV/3C7O
 XsvV0/dxAVIJmF8tQd2f8BMjJlbCTYh7y2XmUwKwPjqFQV2YcjZNNkEww5TrGNEsTA
 +++1cGt0O5UdB3pTOas143+zSsFXTnZ7F+7d0Dy0=
Message-ID: <e77bbe3c-c6dd-56e0-5a04-de7c9313620d@ideasonboard.com>
Date: Tue, 30 Aug 2022 11:15:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
 <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On 29/08/2022 20:23, Doug Anderson wrote:
> Hi,
> 
> On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> The blanking related registers are 8 bits, so reject any modes
>> with larger blanking periods.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index ba84215c1511..f085a037ff5b 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>>          if (mode->clock > 594000)
>>                  return MODE_CLOCK_HIGH;
>>
>> +       /*
>> +        * The blanking related registers are 8 bits, so reject any modes
>> +        * with larger blanking periods.
>> +        */
>> +
>> +       if ((mode->hsync_start - mode->hdisplay) > 0xff)
>> +               return MODE_HBLANK_WIDE;
>> +
>> +       if ((mode->vsync_start - mode->vdisplay) > 0xff)
>> +               return MODE_VBLANK_WIDE;
>> +
>> +       if ((mode->hsync_end - mode->hsync_start) > 0xff)
>> +               return MODE_HSYNC_WIDE;
> 
> Please double-check your patch. Reading through
> ti_sn_bridge_set_video_timings(), I see "mode->hsync_end -
> mode->hsync_start" is allowed to be up to 0x7fff. The datasheet seems
> to confirm. If I got that right it means you're rejecting valid modes.
> 
> I didn't validate any of your other checks, but at least that one seems wrong.

Indeed, I misread the spec. The pulse width registers are 15 bits. The 
front and back porch are 8 bits.

Thanks!

  Tomi
