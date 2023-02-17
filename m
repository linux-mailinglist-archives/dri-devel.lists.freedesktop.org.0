Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C969AAFA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954DC10EF8E;
	Fri, 17 Feb 2023 12:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B5310EF8A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PjWiNwTmEhRSSZTly80+HW62nAvYdIDjHozUAxMbY5Q=; b=AtM/UKrikxMaYGW8xvZkSC3+bN
 NczTqVh1+xI/osBzoF0PnNNu5ol8ndsdnrqS8W2XBt/vSbbUx/23FoEPSZaIyJ3s3ywM/bfvvBfYN
 moOwLR8KHadR/UgBHqkEU/JkdOD5mbucRrVMs4zTgjuB95kSYb7gb+fll4rqVAnDbyQ5rEDcodewE
 07GohQqX+uWZOiu2Orze5dhfZciU755Zw8DY0XLt8SJIqdUv96yxgZ6J/flFBAirRUWbyjQDZX1r4
 en6BbLp6qDk+vxqTznMzcfaiDWXVeF0Mj9xbb2NVRoYEyEKM2ZJC/v4xQcuTq7GXJvFLkQGsyxA0e
 G0vUJC4A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pSzTR-00EFHl-3U; Fri, 17 Feb 2023 14:04:21 +0200
Message-ID: <b21541c5-f55d-d33e-9310-6db5ccb08b25@kapsi.fi>
Date: Fri, 17 Feb 2023 14:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] Don't test for NULL firmware before releasing
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jesper Juhl <jesperjuhl76@gmail.com>
References: <1af763de-dbb8-a6f8-1a8a-2d76610d8776@gmail.com>
 <20230216131934.GF2849548@linux.intel.com>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20230216131934.GF2849548@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/16/23 15:19, Stanislaw Gruszka wrote:
> Hi
> 
> On Thu, Feb 16, 2023 at 02:37:15AM +0100, Jesper Juhl wrote:
>>  From 4fe34831e2e7677b1c9616356f0a2e0a36ec092f Mon Sep 17 00:00:00 2001
>> From: Jesper Juhl <jesperjuhl76@gmail.com>
>> Date: Thu, 16 Feb 2023 02:33:05 +0100
>> Subject: [PATCH] Don't test for NULL firmware before releasing
>>
>> release_firmware() tests for a NULL pointer itself, no need to do it up-front.
>>
>> Signed-off-by: Jesper Juhl <jesperjuhl76@gmail.com>
>>
>> ---
>>   drivers/gpu/drm/tegra/falcon.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
>> index c0d85463eb1a..ae599441f031 100644
>> --- a/drivers/gpu/drm/tegra/falcon.c
>> +++ b/drivers/gpu/drm/tegra/falcon.c
>> @@ -153,8 +153,7 @@ int falcon_init(struct falcon *falcon)
>>
>>   void falcon_exit(struct falcon *falcon)
>>   {
>> -	if (falcon->firmware.firmware)
>> -		release_firmware(falcon->firmware.firmware);
>> +       	release_firmware(falcon->firmware.firmware);
> 
> Please check patches with checkpatch.pl before posting.
> 
> Regards
> Stanislaw
> 

Aside the formatting deficiencies, I'm also not in favor of relying on 
NULL checks inside callees since doing so removes contextual information 
from the programmer; just looking at the code, it is easy to assume the 
pointer cannot be NULL if there is no NULL check. Recently had a longer 
thread about this in the context of kfree in TegraDRM.

Thanks
Mikko
