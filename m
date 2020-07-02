Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C802135ED
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6B26EB1A;
	Fri,  3 Jul 2020 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jul 2020 11:03:03 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721656E038
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:03:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49yFLr39hkz1rVw0;
 Thu,  2 Jul 2020 12:53:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49yFLr2C48z1qw71;
 Thu,  2 Jul 2020 12:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id XE8f4teyIOH6; Thu,  2 Jul 2020 12:53:22 +0200 (CEST)
X-Auth-Info: BxUsMb4hTCTIOASkHZPedF6xg2xeCtGU7rA2aRGZqFc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  2 Jul 2020 12:53:22 +0200 (CEST)
Subject: Re: [PATCH] drm/stm: repair runtime power management
To: Philippe CORNU <philippe.cornu@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20200229221649.90813-1-marex@denx.de>
 <a30ad5a774004221903292871797607a@SFHDAG6NODE1.st.com>
 <64ea7f77-0a0b-ae3a-2911-5fdc8633255e@denx.de>
 <68f47008-f0ed-384c-7e21-f29b444da3ee@st.com>
 <3121f339-c513-f75d-569e-81c5c0f3cd1a@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a35217e6-21ce-6d36-c1bb-9e057ae35be1@denx.de>
Date: Thu, 2 Jul 2020 12:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3121f339-c513-f75d-569e-81c5c0f3cd1a@st.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/2/20 12:07 PM, Philippe CORNU wrote:

Hi,

[...]

>>>> Thank for your patch. Pm_runtime_put_sync is also done into function ltdc_crtc_mode_fixup.
>>>> To avoid several call of Pm_runtime_put_sync, it could be better to check pm_runtime activity:
>>>>
>>>> +	int ret;
>>>>    
>>>>    	DRM_DEBUG_DRIVER("\n");
>>>>    
>>>> +	if (!pm_runtime_active(ddev->dev)) {
>>>> +		ret = pm_runtime_get_sync(ddev->dev);
>>>> +		if (ret) {
>>>> +			DRM_ERROR("Failed to enable crtc, cannot get sync\n");
>>>> +			return;
>>>> +		}
>>>> +	}
>>>> +
>>>
>>> Where should this go ? And wouldn't that only hide nastier PM imbalance
>>> issues ?
>> Hi Marek,
>> I tested the patch &  it generate an error when I try wake up / sleep
>> the board STM32MP1 DK2 with weston application.
>> It need an additional patch
>> drm-stm-ltdc-remove-call-of-pm-runtime-functions.
>>
>> Thanks for the patch.
>>
>> Tested-by: Yannick Fertre <yannick.fertre@st.com>
>>
> 
> Hi Marek,
> before merging the 2 patches, I would like to be sure that Yannick's 
> patch does not "break" your use case (Qt I think)?
> May I ask you please to give it a try?
> Note: If you think there is no need to do extra checks, simply tell me 
> of course
It's fine, thanks !

-- 
Best regards,
Marek Vasut
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
