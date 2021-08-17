Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586A3EEA2B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEED86E150;
	Tue, 17 Aug 2021 09:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E2F6E150
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:44:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17H9Pqpa013375; Tue, 17 Aug 2021 11:43:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iQBg0AS6zUIUk6stFAs5jtKKe3PmvtRCEODGkgVmoNc=;
 b=aJ5izF7+gl64fItY6ngezbpPsIixaPydAqMvgnaPmpjJuHEqtjtuibZJTQJsr11vpzU0
 K1RVbPIXoSCTzmT7enfhhOkSrHfLw4YA0oYVrjo12yWX08HK2XSSkGrhNkAMR7UezVkb
 3vU3+P/DUja06o95Y23dKRAJ8TRF54QhbjC/AUkkocuxNWKlhGcKELCNeeVLeh8BreM4
 Nfsn0+phqzjBbe1Gw5K7GOLfgt6RBgCB84oKxeXdXKb2tBgxEy6IHJh4tCzqAEdKJXM4
 1xFEYhjBvilS8ES2nZqkt7THcBRyRyDQnWu4SnC0kKhV3S110yFUxdQJTYVFpjPnNMvD qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3afx6junxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 11:43:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8914910002A;
 Tue, 17 Aug 2021 11:43:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75DA722AFE7;
 Tue, 17 Aug 2021 11:43:44 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 17 Aug
 2021 11:43:43 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
To: Marek Vasut <marex@denx.de>
CC: Yannick FERTRE <yannick.fertre@st.com>, Philippe CORNU
 <philippe.cornu@st.com>, Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
 <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
 <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
Message-ID: <629b6666-74b3-91f0-5c6c-e26d55ea62d8@foss.st.com>
Date: Tue, 17 Aug 2021 11:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_03:2021-08-16,
 2021-08-17 signatures=0
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


On 7/2/21 8:07 PM, Marek Vasut wrote:
> On 7/2/21 11:23 AM, Raphael Gallais-Pou wrote:
>> Hello Marek,
>
> Hi,
>
>> Sorry for the late answer.
>
> No worries, take your time
>
>> On 6/30/21 2:35 AM, Marek Vasut wrote:
>>> On 6/29/21 1:58 PM, Raphael GALLAIS-POU - foss wrote:
>>>
>>> [...]
>>>
>>>> +++ b/drivers/gpu/drm/stm/ltdc.c
>>>> @@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
>>>>   {
>>>>       struct ltdc_device *ldev = crtc_to_ltdc(crtc);
>>>>       struct drm_device *ddev = crtc->dev;
>>>> +    int ret;
>>>>         DRM_DEBUG_DRIVER("\n");
>>>>   -    pm_runtime_get_sync(ddev->dev);
>>>> +    if (!pm_runtime_active(ddev->dev)) {
>>>> +        ret = pm_runtime_get_sync(ddev->dev);
>>>
>>> All these if (!pm_runtime_active()) then pm_runtime_get_sync() calls look like workaround for some larger issue. Shouldn't the pm_runtime do some refcounting on its own , so this shouldn't be needed ?
>>
>>
>> This problem purely comes from the driver internals, so I don't think it is a workaround.
>>
>> Because of the "ltdc_crtc_mode_set_nofb" function which does not have any "symmetrical" call, such as enable/disable functions, there was two calls to pm_runtime_get_sync against one call to pm_runtime_put_sync.
>>
>> This instability resulted in the LTDC clocks being always enabled, even when the peripheral was disabled. This could be seen in the clk_summary as explained in the patch summary among other things.
>>
>> By doing so, we first check if the clocks are not already activated, and in that case we call pm_runtime_get_sync.
>
> I just have to wonder, how come other drivers don't need these if (!pm_runtime_active()) pm_runtime_get_sync() conditions. I think they just get/put the runtime PM within a call itself, not across function calls. Maybe that could be the right fix here too ?


Hello Marek,


I've run a deeper analysis over this implementation.

If I may take rockchip's "rockchip_drm_vop.c" driver, there is an boolean "is_enabled" set to true when crtc_atomic_enable is called.

The above implementation could save us from adding such field in the ltdc_dev structure.

Another solution could be in order to simply call pm_runtime_get_sync() in ltdc_crtc_mode_set_nofb() and by removing this condition in ltdc_atomic_crtc_disable() the driver behaves just like the first version of this patch.

In this way, it avoids such conditions and seems more to get along with the current implementation.


Regards,

Raphaël

