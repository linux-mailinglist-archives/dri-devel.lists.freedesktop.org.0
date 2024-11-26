Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B29D9400
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 10:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C49110E3F7;
	Tue, 26 Nov 2024 09:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="8Els/mG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1515 seconds by postgrey-1.36 at gabe;
 Tue, 26 Nov 2024 09:17:16 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171D410E7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:17:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ0l64w000476;
 Tue, 26 Nov 2024 09:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8jxIHGeNhIdRyq1hTjMruj+uZWn6hIrTILsLNytxbPs=; b=8Els/mG8lomYzWTA
 SH/GmSoMEy8/ORL68+wQ8SuoxcDHsKn1HY1YWW0pJrw/wTmlYhPdNFAylL+JCxZC
 cPDGnBtAjc4bPIdZSO53tmt4ifuSMZvzbgr/PjN96mlKOPQQO9owzHALyvO2jHBC
 yPUnnRmZE7wi9FmqxwPasCjyTDp6sMpO1jXWPzgjlx/OElCaLBGjCAqL45Bh3dKM
 mZCyBOcNr7Ea3CQNRSirzFdh8K14zEpy8wOKNwE9fUJUaP/PkT2lRSBKjDxomNVP
 D9yF3Oy6GkOSje7ITKMQNDgo8FSMyN/fScqkkyeS7hHMKBtyfRhab2Jn+FkXCd/P
 5y7Imw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4335bkv4tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 09:51:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 21B2440057;
 Tue, 26 Nov 2024 09:49:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33D08269E1E;
 Tue, 26 Nov 2024 09:47:19 +0100 (CET)
Received: from [10.129.178.23] (10.129.178.23) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 09:47:18 +0100
Message-ID: <725aafb8-abfa-40c0-967a-62122206f736@foss.st.com>
Date: Tue, 26 Nov 2024 09:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
To: Sean Nyekjaer <sean@geanix.com>, Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.23]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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


On 11/26/24 08:36, Sean Nyekjaer wrote:
> Hi Maxime,
>
> On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
>> Hi Sean,
>>
>> On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
>>> Check if the required pixel clock is in within .5% range of the
>>> desired pixel clock.
>>> This will match the requirement for HDMI where a .5% tolerance is allowed.
>>>
>>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>>> ---
>>>  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
>>>  include/drm/drm_modes.h     |  2 ++
>>>  2 files changed, 36 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>>> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
>>> --- a/drivers/gpu/drm/drm_modes.c
>>> +++ b/drivers/gpu/drm/drm_modes.c
>>> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>>>  }
>>>  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
>>>  
>>> +/**
>>> + * drm_mode_validate_mode
>>> + * @mode: mode to check
>>> + * @rounded_rate: output pixel clock
>>> + *
>>> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
>>> + * CVT spec reuses that tolerance in its examples, so it looks to be a
>>> + * good default tolerance for the EDID-based modes. Define it to 5 per
>>> + * mille to avoid floating point operations.
>>> + *
>>> + * Returns:
>>> + * The mode status
>>> + */
>>> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
>>> +					    unsigned long long rounded_rate)
>>> +{
>>> +	enum drm_mode_status status;
>>> +	unsigned long long rate = mode->clock * 1000;
>>> +	unsigned long long lowest, highest;
>>> +
>>> +	lowest = rate * (1000 - 5);
>>> +	do_div(lowest, 1000);
>>> +	if (rounded_rate < lowest)
>>> +		return MODE_CLOCK_LOW;
>>> +
>>> +	highest = rate * (1000 + 5);
>>> +	do_div(highest, 1000);
>>> +	if (rounded_rate > highest)
>>> +		return MODE_CLOCK_HIGH;
>>> +
>>> +	return MODE_OK;
>>> +}
>>> +EXPORT_SYMBOL(drm_mode_validate_mode);
Hi Sean, Maxime,
>> Thanks a lot for doing that!
>>
>> I wonder about the naming though (and prototype). I doesn't really
>> validates a mode, but rather makes sure that a given rate is a good
>> approximation of a pixel clock. So maybe something like
>> drm_mode_check_pixel_clock?
> Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
>
> Would it make sense to have the pixel clock requirement as a input
> parameter? For HDMI it is 0.5% and in my case the LVDS panel 10%.
>
> enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> 					    unsigned long long rounded_rate, unsigned tolerance)
> ?


IMO adding the tolerance as input parameter is a good idea.  This would useful
other than for HDMI pixel clock validation (and LVDS in your case).

Best regards,
Raphaël

>
> And maybe a drm_mode_validate_mode_hdmi() with the default tolerance of
> .5%?
>> We probably need some kunit tests here too.
> Good idea, will be my first :)
>
> /Sean
