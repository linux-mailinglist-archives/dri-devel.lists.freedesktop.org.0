Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799A17F1C6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62D6E852;
	Tue, 10 Mar 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707B6E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:18:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48bqLD5rp6z1rsMt;
 Mon,  9 Mar 2020 21:18:44 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48bqLD4xmLz1qqkK;
 Mon,  9 Mar 2020 21:18:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 4sK2k-XtbMAj; Mon,  9 Mar 2020 21:18:43 +0100 (CET)
X-Auth-Info: WQ1ucZ0QV8bIkTvqWEgIGFJlUIWAaoadPLtgYa0/dH4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  9 Mar 2020 21:18:43 +0100 (CET)
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
From: Marek Vasut <marex@denx.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20191114131751.26746-1-marex@denx.de>
 <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
 <86c5d55e-d113-7f5e-c8e2-9d025d0d481e@denx.de>
Message-ID: <6347b0cf-1967-d112-7d10-021a64eb3498@denx.de>
Date: Mon, 9 Mar 2020 21:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <86c5d55e-d113-7f5e-c8e2-9d025d0d481e@denx.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/20 9:03 PM, Marek Vasut wrote:
> On 3/9/20 11:50 AM, Philipp Zabel wrote:
>> Hi Marek,
> 
> Hi,
> 
>> On Thu, 2019-11-14 at 14:17 +0100, Marek Vasut wrote:
>>> The bus_flags and bus_format handling logic does not seem to cover
>>> all potential usecases. Specifically, this seems to fail with an
>>> "edt,etm0700g0edh6" display attached to an 24bit display interface,
>>> with interface-pix-fmt = "rgb24" set in DT.
>>
>> interface-pix-fmt is a legacy property that was never intended to be
>> used as an override for the panel bus format. The bus flags were
>> supposed to be set from the display-timings node, back when there was no
>> of-graph connected panel at all.
>>
>> That being said, there isn't really a proper alternative that allows to
>> override the bus format requested by the panel driver in the device tree
>> to account for weird wiring. We could reuse the bus-width endpoint
>> property documented in [1], but that wouldn't completely specify how the
>> RGB components are to be mapped onto the parallel bus.
>>
>> [1] Documentation/devicetree/bindings/media/video-interfaces.txt
>>
>> I do wonder whether for your case it would be better to implement a
>> MEDIA_BUS_FMT_RGB666_1X24_CPADLO though, to leave the LSBs untouched
>> instead of risking to dump them into accidental PCB antennae.
>>
>>> In this specific setup, the panel-simple.c driver entry for the display
>>> sets .bus_flags to non-zero value. However, as imxpd->bus_format is set
>>> from the DT property "interface-pix-fmt", imx_pd_encoder_atomic_check()
>>> will set imx_crtc_state->bus_flags = imxpd->bus_flags even though the
>>> imxpd->bus_flags is zero, while the di->bus_flags is correctly set by
>>> the panel-simple.c and non-zero.
>>>
>>> The result is incorrect flags being
>>> used for the display configuration and thus an image corruption.
>>> (Specifically, DRM_BUS_FLAG_PIXDATA_POSEDGE is not propagated and thus
>>> the ipuv3 clocks pixels on the wrong edge).
>>>
>>> This patch fixes the problem by overriding the imx_crtc_state->bus_format
>>> from the imxpd->bus_format only if the DT property "interface-pix-fmt" is
>>> present or if the DI provides no formats. Similarly for bus_flags, which
>>> are set from imxpd->bus_flags only if the DI provides no formats.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> To: dri-devel@lists.freedesktop.org
>>> ---
>>>  drivers/gpu/drm/imx/parallel-display.c | 13 ++++++++-----
>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
>>> index 35518e5de356..92f00b12c068 100644
>>> --- a/drivers/gpu/drm/imx/parallel-display.c
>>> +++ b/drivers/gpu/drm/imx/parallel-display.c
>>> @@ -113,13 +113,16 @@ static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
>>>  	struct drm_display_info *di = &conn_state->connector->display_info;
>>>  	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
>>>  
>>> -	if (!imxpd->bus_format && di->num_bus_formats) {
>>> -		imx_crtc_state->bus_flags = di->bus_flags;
>>> +	if (imxpd->bus_format || !di->num_bus_formats)
>>
>> I see no reason to invert the logic here. Let's keep the common case
>> first.
>>
>>> +		imx_crtc_state->bus_format = imxpd->bus_format;
>>> +	else
>>>  		imx_crtc_state->bus_format = di->bus_formats[0];
>>> -	} else {
>>> +
>>> +	if (di->num_bus_formats)
>>> +		imx_crtc_state->bus_flags = di->bus_flags;
>>> +	else
>>>  		imx_crtc_state->bus_flags = imxpd->bus_flags;
>>> -		imx_crtc_state->bus_format = imxpd->bus_format;
>>> -	}
>>> +
>>>  	imx_crtc_state->di_hsync_pin = 2;
>>>  	imx_crtc_state->di_vsync_pin = 3;
>>
>> So while I don't like this being used at all, I think the patch improves
>> consistency, as imx_pd_connector_get_modes doesn't allow to override the
>> panel's modes with DT display-timings either.
> 
> So when this patch was posted half a year ago, it was needed. I rebased
> on current next and this patch is no longer needed as some form of it
> got in as part of other patches. This functionality is still broken in
> e.g. 5.4 though.

Correction, a small subset of this patch is still needed, I'll send a V2.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
