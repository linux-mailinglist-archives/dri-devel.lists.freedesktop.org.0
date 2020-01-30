Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498CC14D7B4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B066F913;
	Thu, 30 Jan 2020 08:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [IPv6:2001:470:0:1f2::b869:4820])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DC96E353
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 06:21:01 +0000 (UTC)
Received: from 94.155.250.134 ([94.155.250.134]) by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 22:20:58 -0800
Subject: Re: [PATCH v3 1/1] drm: sun4i: hdmi: Add support for sun4i HDMI
 encoder audio
To: Maxime Ripard <maxime@cerno.tech>, Stefan Mavrodiev <stefan@olimex.com>
References: <20200128140642.8404-1-stefan@olimex.com>
 <20200128140642.8404-2-stefan@olimex.com>
 <20200129164321.34mornbi3xvx5dys@gilmour.lan>
From: Stefan Mavrodiev <stefan@olimex.com>
Message-ID: <64676a4b-e149-146c-81b4-7fd5e792efc5@olimex.com>
Date: Thu, 30 Jan 2020 08:20:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129164321.34mornbi3xvx5dys@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/29/20 6:43 PM, Maxime Ripard wrote:
> Hi,
>
> On Tue, Jan 28, 2020 at 04:06:42PM +0200, Stefan Mavrodiev wrote:
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> index 68d4644ac2dc..4cd35c97c503 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
>> @@ -23,6 +23,8 @@
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_probe_helper.h>
>>
>> +#include <sound/soc.h>
>> +
>>   #include "sun4i_backend.h"
>>   #include "sun4i_crtc.h"
>>   #include "sun4i_drv.h"
>> @@ -87,6 +89,10 @@ static void sun4i_hdmi_disable(struct drm_encoder *encoder)
>>
>>   	DRM_DEBUG_DRIVER("Disabling the HDMI Output\n");
>>
>> +#ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
>> +	sun4i_hdmi_audio_destroy(hdmi);
>> +#endif
>> +
>>   	val = readl(hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>>   	val &= ~SUN4I_HDMI_VID_CTRL_ENABLE;
>>   	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>> @@ -114,6 +120,11 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
>>   		val |= SUN4I_HDMI_VID_CTRL_HDMI_MODE;
>>
>>   	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>> +
>> +#ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
>> +	if (hdmi->hdmi_audio && sun4i_hdmi_audio_create(hdmi))
>> +		DRM_ERROR("Couldn't create the HDMI audio adapter\n");
>> +#endif
> I really don't think we should be creating / removing the audio card
> at enable / disable time.

For me it's unnatural to have sound card all the time, even when the HDMI
is not plugged-in.

I'll follow your suggestion. Besides it's easier for me just to drop this
register/unregister mechanism.

Best regards,
Stefan Mavrodiev

>
> To fix the drvdata pointer, you just need to use the card pointer in
> the unbind, and that's it.
>
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
