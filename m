Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F968A45C8E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B347A10E8C3;
	Wed, 26 Feb 2025 11:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UPIM+Gms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D07B10E8C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1740567898; x=1741172698; i=wahrenst@gmx.net;
 bh=6z1xx2C1SeUR1zcFP+YxzGvFZwlZ+pbYA6k2oewlkfQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UPIM+Gmsxs3lkr7lIOWfUs1KPx5kNi8YHuLSS7Q8L14Uwyi3+b146XiXIZNUv3pd
 myIYeHoKdM6bRMatoaMBt7dIjlvPRLU8CHHQrAJelabNy+NXa5wqBuGXilWNUDqOV
 Uy1s58BAW4CZJThoxoks6dlN6Td6e9WiAz36tuoi9NcgL6j5pGmeRiGfQbmmmz+gj
 MulMuRafXl4o+5vJAceGhWaF1FIRar2Cj+cDR5TQogyWCeHLN7GP5hS462rI75xOM
 ZD8a6WVcRz0F/pZzI+EKriCTfIV8dME/OXvA2FCH2hJwsxUmF8tI+GUZLnuyVy8nT
 1JipiZQ0URIgW74hcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQTF-1tUbqJ1cwf-015VFE; Wed, 26
 Feb 2025 12:04:58 +0100
Message-ID: <2585e14d-bb91-4d0a-b0e0-39e60b0b88bd@gmx.net>
Date: Wed, 26 Feb 2025 12:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Add jack detection to HDMI audio driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 kernel-list@raspberrypi.com, David Turner <david.turner@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org
References: <20250222102921.75496-1-wahrenst@gmx.net>
 <3jyp24gystyet326exnbudsprwlpswacmcnvllumgapxlzz7n3@toysyujvsqwq>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <3jyp24gystyet326exnbudsprwlpswacmcnvllumgapxlzz7n3@toysyujvsqwq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x3HOS9jzbIPHd+tOUa1+3KQTjvMtc9T6xurAc23BxLRgboQpRWb
 aiCIffU5ZPBN4fw57OJc6CwHmMXbMBvzdy048DD6z1vqo9kKDUg9XalJJ5nq5FOXb4qnkdf
 YyRlrn4xTLtQE8LjXlNnc7y/owbweqnExo5b5vUFOBnnD3fLlr0gTGHlYkOAHlF7kMo3lzu
 KGA83DC3bnSmq8JY8fLTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xGbvkLpBHU4=;W0KEZojLr0EbZR/ak4rnQCTC3U6
 OZxVIQKjyloPoy7dNKv5m6MD+C+W58FljV14ZWs9HRn3Kp0Lv7cKjAENHHHIUNl6uLEthqpvG
 2hZqrxMlJN2OgZ2ZvVosD8nG3LG73njM0OY8gUBQqa6wGl9OLP3Dm91nkrqo7YceRAipoMpoR
 DP05Uy37q9nKTguM20rFU26aVAo6pKDI6sTjjT5Ct/OBvGFirI34yPrON+Di4b/hcuu1CAAbc
 aj1aLJvcy0J1gKQy/xekZY3WuSJra/d+Rew3ddgYjGMwQxPb93rUknNiKiUCMz1U5CkPlPMJU
 kL61G+V/7TD1UovakqsTCeBmHs+WEn2kDkhPKQsYsTAVhknOPbzw4O7nGoZUOHedmjKOoauEz
 buYjCYo0IDKLyX96MwTMhf05pP/SgNfXLOn6lk3aBE8cYEE/Tw6K0wDnraEy4Xyqn1CB1kdWy
 o9fVBl6/Kbk/Cgx0p8ryH7H9IqjhXV7pFpNTRHkYywNwA1Jwzn2AXuMS6KcchX3/merbEAx1o
 w0FXZQG/8DV2PozNzOtUR6J2AjoNiKocqPTieFy1NpjMxKzxVAqxW/xmeSkQ/gWw8YFhfiXlJ
 dBkH8Uf42YTXAnA22Mssd3KmnBDPq5TsmF6FBs3S5uNRZi1wFbhBH4kbSvW8+uo8i2nXTUcWj
 1wHHsl2bZQvEiVNnYTtqTslLvUo6BIm1Ta4itYLv1TeynRnnfbfY+EiWuAd/r2VDMQLcf9Xzp
 XYYgzgkcr9BYq+T4N3mmcYIdT87DFTy7Xcw5m72ExjOdbnfVwt6NDQEb/g/2pK7X+50z6QaKi
 mpO2QhY5L0CjNwcgDZsHylSMNFQR1tUDrqc5lRxtHAQdr156NWB6/7k35rhJYGW2q3aSwUBLL
 RqTeDwU3SUE54KpGIWT9e5/O6Src3sJa5wba73qAC3Xu26vUewgc0ZdAEkVWIrDhdZJ95oUtp
 KUrqeOY3/f4KCOuKXkalUFRpH1FMPHVTyvIPj9DRqbe9AJTub/SMQXX9+jeRHhBzSTim/BWQs
 W3GQ1Z8XEiyqpZ+KlExOnk84t4zXQb719wKFAYHprajcIwHRh8tSBbMK7RgnfGutj+V0Pa+Gz
 2g+bpErViqoHUbcGvLQ9B3tF2xMOVIZXBbxLLpv9IDwPtaF1fE/iLS+WLvn9VJHWr7EhXXbem
 bQmzOul/WyQ12RaSOJgWuxeChzW5Sbm04ATAYpuz3raQlnvZO9HXQWGr4oGoLZ3wXzq2DNrCc
 R0e8oFtVTk5dVu2WlbksMqrQxelPyAOjh5LxNvAAXHMv6Cc/b4b5MfzeXOYqnvoXlUUzRF9LW
 fKTvqTicfhl7PeuuL9uuEA6H4gzfRj2i9qpr7ZmIRYKGE+CvfKmpcXdATjf6GeKqvZaLABQKp
 lzsxd1ubZO97iPf0SRF5tCk8eh4lN2wTC4LoaxQJD22rL/L8Z8VbkKtgVY
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

Hi Dmitry,

Am 24.02.25 um 04:15 schrieb Dmitry Baryshkov:
> On Sat, Feb 22, 2025 at 11:29:21AM +0100, Stefan Wahren wrote:
>> From: David Turner <david.turner@raspberrypi.com>
>>
>> Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
>> when to add/remove HDMI audio devices.
>>
>> Signed-off-by: David Turner <david.turner@raspberrypi.com>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++--
>>   drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
>>   2 files changed, 31 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
>> index 47d9ada98430..d24ae86d799e 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -51,6 +51,7 @@
>>   #include <linux/reset.h>
>>   #include <sound/dmaengine_pcm.h>
>>   #include <sound/hdmi-codec.h>
>> +#include <sound/jack.h>
>>   #include <sound/pcm_drm_eld.h>
>>   #include <sound/pcm_params.h>
>>   #include <sound/soc.h>
>> @@ -386,6 +387,12 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdm=
i *vc4_hdmi,
>>   	struct drm_connector *connector =3D &vc4_hdmi->connector;
>>   	int ret;
>>
>> +	/*
>> +	 * Needs to be called for both connects and disconnects for HDMI
>> +	 * audio hotplug to work correctly.
>> +	 */
>> +	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
>> +
>>   	/*
>>   	 * NOTE: This function should really be called with vc4_hdmi->mutex
>>   	 * held, but doing so results in reentrancy issues since
>> @@ -405,8 +412,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi=
 *vc4_hdmi,
>>   		return;
>>   	}
>>
>> -	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
>> -
>>   	cec_s_phys_addr(vc4_hdmi->cec_adap,
>>   			connector->display_info.source_physical_address, false);
>>
>> @@ -2203,6 +2208,22 @@ static const struct drm_connector_hdmi_audio_fun=
cs vc4_hdmi_audio_funcs =3D {
>>   	.shutdown =3D vc4_hdmi_audio_shutdown,
>>   };
>>
>> +static int vc4_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +	struct vc4_hdmi *vc4_hdmi =3D snd_soc_card_get_drvdata(rtd->card);
>> +	struct snd_soc_component *component =3D snd_soc_rtd_to_codec(rtd, 0)-=
>component;
>> +	int ret;
>> +
>> +	ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOU=
T,
>> +				    &vc4_hdmi->hdmi_jack);
>> +	if (ret) {
>> +		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return snd_soc_component_set_jack(component, &vc4_hdmi->hdmi_jack, NU=
LL);
> PLease excuse my ignorance, but dows this work. In other words, how is
> the driver exporting the plugged state through this jack?
there is no ignorance just a valid question. Unfortunately my knowledge
here is very limited and I just wanted to minimize the delta between
vendor and mainline tree. That's why I marked it as RFC.

Can someone from Raspberry Pi helps here?

The patch seems to fix an issue? But I don't know the broader context.

Regards
