Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C413E712431
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1310E7D5;
	Fri, 26 May 2023 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A4310E7D5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:06:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34Q8jPxs009638; Fri, 26 May 2023 12:06:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BgUqqRbOorlcfxtp7NVxsl7m4DQQsP57P2IYkQ1uqM4=;
 b=NI4SkOm6uDzIM8QJ+EHmyX0Lc2Wt8FsFanyhQSHdrpdbMhl8kLdgl5Ng9NXJIF5UH67z
 1XNTl4SOlATmAj61eAiNoIcTmhwjqyAwgcjV/UNZWrTjknkGIkGyMZ+fohB2cmKAzw35
 BF3xoywqhDcwN6LRZPq4d7vRuzjqPtZyaNEICw8SipLhdAJIEGk8KJ8QipiigyQfXtIV
 B2NnLlEbMdUCvtJKUbKmB+8Ctro7fXlftAoRvlSfCWUu/eXmqseXMl6N8ALOc8GZtY7q
 Pb4Z6xrD0czXDScCccd7MMH571NZpBkNkN+Hx+eBy4WL3ynpnPef1ITZZaDOBEb7gHOB pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qru86wcv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 12:06:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0677C10002A;
 Fri, 26 May 2023 12:06:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC3A5222C88;
 Fri, 26 May 2023 12:06:31 +0200 (CEST)
Received: from [10.48.0.148] (10.48.0.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 12:06:31 +0200
Message-ID: <1ca05e11-3db1-193a-eaba-bb92b40e7179@foss.st.com>
Date: Fri, 26 May 2023 12:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/stm: Fix resolution bitmasks
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Yannick FERTRE <yannick.fertre@foss.st.com>, 
 <dri-devel@lists.freedesktop.org>
References: <20221011231048.505967-1-marex@denx.de>
 <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
 <3ce425c7-978f-64e7-0630-b9aa5d1af55c@foss.st.com>
 <e7593ac2-fa0a-18ff-d286-2f4080bd5b86@denx.de>
 <58147ea7-d0dc-439d-5610-b293513b0e75@denx.de>
 <8c3ab04c-7fa8-63a3-a4b2-1a76fc7d6c54@foss.st.com>
 <de7cad77-1735-32a6-034e-8df24cda44c3@denx.de>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <de7cad77-1735-32a6-034e-8df24cda44c3@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.0.148]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
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



On 5/26/23 11:05, Marek Vasut wrote:
> On 5/15/23 18:02, Philippe CORNU wrote:
> 
> Hi,
> 
>>>>> The genmask of regsiter SSCR, BPCR & others were setted accordly to 
>>>>> the chipset stm32f4.
>>>>
>>>> So that means:
>>>> F4 -> 2048x2048 framebuffer
>>>> H7/MP1 -> 4096x4096 framebuffer
>>>> ?
>>>
>>> Worse
>>>
>>> F4 is 2048x2048
>>> F7 is 4096x2048
>>> MP1 is 4096x4096
>>>
>>> and there is no IDR register on F4/F7 like on MP1, or is there ?
>>>
>>> How else can we tell those LTDC versions apart ?
>>>
>>>
>>
>> Dear Marek,
>> Many thanks for your patch (and sorry for this late reply).
>> Your patch is good and fixes this ltdc driver source code vs. the 
>> related reference manual.
>> imho, it will not be an issue for F4 & F7 series if these bit-fields 
>> are "bigger" as I am pretty sure stm32 MCUs are not really using such 
>> high resolutions.
>> Yannick already replied with his reviewed-by. I add my
>>
>> Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
>>
>> If you agree, I will merge your patch really soon.
> 
> I would say there is no rush, so let's get this done right .
> 
>> Dear Yannick,
>> You may add to your todo list to double check if there is a need to 
>> detect stm32 MCUs vs. these bit-field sizes...
> 
> Can we use a compatible string , or I think there is some ID register ?
> 
> [...]
> 
> btw I only received this email now, odd, I wonder whether it was stuck 
> in some SMTP server. Sorry for the delayed reply, it was out of my control.


Hi Marek,
Thank you for your feedback, I agree it is better to fix this properly.
Note: After a quick check, I'm 99% sure that the smtp problem was on my 
end (although I don't understand why I know we've had some issues with 
the mailing lists over the past few weeks), so all my apologies for that :-)

Hi Yannick,
May I ask you please to prepare this clean up (taking into account all 
ltdc versions).

Many thanks
Philippe :-)


