Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9267F5EB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 09:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612E810E074;
	Sat, 28 Jan 2023 08:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1429F10E074
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLpchkzEUKvtWSQnseIYZdMDBaGfP5kVaR4wnUmvEEQ=; b=GEjRytbk6BZNgR+TLSTvlLv739
 F9gpXR7MS46BKc2ngfRylLO8Em1c7DDuEoGU0xKAoC2LOPF0qxvTMm1+xIJAie1A/u5FqW1xT91lc
 nWK2QP9aDTeixZfjYqGjDS2Weoa5ce6aWjw7DnC4z/Ci7loIAQDj4Q9dHaKONW7JnbsKqWzvKuLjM
 tU0kOxWSaMGr/EWJe4ivHHA96Lt/KF+mW5BViKA/4+zu9p0MIbSS/qao5tshY7uXdi8TzS2YIY451
 ln6KYeD3NoxQd9gR+/BOIv3l+BvMPmpEYQDSfkrSdww1MLg+dwHm3jx36SuXnzBGDXhWoUqs+46fF
 o3zIo2oA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pLgJs-009HDo-HM; Sat, 28 Jan 2023 10:12:16 +0200
Message-ID: <46a462ec-bc80-cbb7-4833-d9c430f4e9c3@kapsi.fi>
Date: Sat, 28 Jan 2023 10:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20230127221418.2522612-1-arnd@kernel.org>
 <Y9RbvPRP5Yw/fUMM@dev-arch.thelio-3990X>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <Y9RbvPRP5Yw/fUMM@dev-arch.thelio-3990X>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/28/23 01:18, Nathan Chancellor wrote:
> On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The error handling for platform_get_irq() failing no longer
>> works after a recent change, clang now points this out with
>> a warning:
>>
>> drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>>          if (syncpt_irq < 0)
>>              ^~~~~~~~~~
>>
>> Fix this by removing the variable and checking the correct
>> error status.
>>
>> Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I had the same diff pending but civic duty called today :)
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
>> ---
>>   drivers/gpu/host1x/dev.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index 4872d183d860..aae2efeef503 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
>>   static int host1x_probe(struct platform_device *pdev)
>>   {
>>   	struct host1x *host;
>> -	int syncpt_irq;
>>   	int err;
>>   
>>   	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
>> @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	host->syncpt_irq = platform_get_irq(pdev, 0);
>> -	if (syncpt_irq < 0)
>> -		return syncpt_irq;
>> +	if (host->syncpt_irq < 0)
>> +		return host->syncpt_irq;
>>   
>>   	mutex_init(&host->devices_lock);
>>   	INIT_LIST_HEAD(&host->devices);
>> -- 
>> 2.39.0
>>

Thanks both for the fix :)

FWIW,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
