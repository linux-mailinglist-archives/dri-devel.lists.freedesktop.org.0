Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731C3B9E1A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C683E89AB9;
	Fri,  2 Jul 2021 09:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0F889A91
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 09:23:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1629AxOI019441; Fri, 2 Jul 2021 11:23:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5ywvL4VVQ+2r/jhdIM14ypRiW/ywajQXfPzZ2maovTA=;
 b=LCFPp+Y/RgFx7ixHPOVRqbIYocI4RlvALr9i9XihsloC62P6IqcJYwyoVmO8ylFHUZ20
 L8og9QpEFFl1aiSqTNk9cS9Z7SrCTiYbrmqAsWAxFMurq+NRNG26/Sl2q2j4+Kmtysz5
 k0vqFhDN2uHI6j8gFBRBfBWOgFNkLlXVQGdpeN5Sxsf19WOtmvPibI9VciZUFYW9yYdL
 gc/Mewf4JRC9Ocf81Ywq18JbF7ik0ZCTLv5Bb7qoXfgJQ0Zjm56yfEe6pdpc4QASptl3
 H9b5gRz0WrsJfQE7zpIvK19h/jh6l6GLIR4EuT5PLLUFMAC9x0eLi+cos7DiI+ViAvAo lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39hw3cscpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 11:23:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 317E610002A;
 Fri,  2 Jul 2021 11:23:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E2F8217B92;
 Fri,  2 Jul 2021 11:23:23 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 2 Jul
 2021 11:23:22 +0200
Subject: Re: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
To: Marek Vasut <marex@denx.de>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
Date: Fri, 2 Jul 2021 11:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_01:2021-07-02,
 2021-07-02 signatures=0
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,


Sorry for the late answer.


On 6/30/21 2:35 AM, Marek Vasut wrote:
> On 6/29/21 1:58 PM, Raphael GALLAIS-POU - foss wrote:
>
> [...]
>
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct 
>> drm_crtc *crtc,
>>   {
>>       struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>>       struct drm_device *ddev = crtc->dev;
>> +    int ret;
>>         DRM_DEBUG_DRIVER("\n");
>>   -    pm_runtime_get_sync(ddev->dev);
>> +    if (!pm_runtime_active(ddev->dev)) {
>> +        ret = pm_runtime_get_sync(ddev->dev);
>
> All these if (!pm_runtime_active()) then pm_runtime_get_sync() calls 
> look like workaround for some larger issue. Shouldn't the pm_runtime 
> do some refcounting on its own , so this shouldn't be needed ?


This problem purely comes from the driver internals, so I don't think it 
is a workaround.

Because of the "ltdc_crtc_mode_set_nofb" function which does not have 
any "symmetrical" call, such as enable/disable functions, there was two 
calls to pm_runtime_get_sync against one call to pm_runtime_put_sync.

This instability resulted in the LTDC clocks being always enabled, even 
when the peripheral was disabled. This could be seen in the clk_summary 
as explained in the patch summary among other things.

By doing so, we first check if the clocks are not already activated, and 
in that case we call pm_runtime_get_sync.



Regards,

Raphaël G-P

