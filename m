Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC63C24FF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 15:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC2E6EA30;
	Fri,  9 Jul 2021 13:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881B76EA33
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mt074ko4UtSHjNMmThnrxi4cb777qsW0AWlG2IFXMF4=; b=FzD6TuTEzNje5vMTaIeSxWYP+Y
 ceTZXEf9TYGU0mlqjxZau+xvipL5n/4SVJHyPPpJAoXQDub5x20kF+XNcFyjcJK3MxXjD7qgrkQPq
 Vh57b1dJZlTPIQZ6kb5xZycx/424NXLoQkxyc0dOchwpxdLWrdlS+K4RWi1Ywm+o6uSldG/gli7aq
 UMH0vnswHLdsOgUMYZKS5Lr1+XoLoza3Dv+PhoE6k9M1XSnPI5RJbibe6kw8cpRM85Jde5wd3/KlS
 F7z8bW1mtj7S09D8kueO8hc6S4zwJc8PjiKttsHHDC/IbozAhsonug4GORiN122c9VHyA/ZQH1flZ
 hjSkdGpQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61878
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m1qVX-0006ag-W2; Fri, 09 Jul 2021 15:25:32 +0200
Subject: Re: [PATCH] video: backlight: Only set maximum brightness for
 gpio-backlight
To: Marek Vasut <marex@denx.de>, Daniel Thompson <daniel.thompson@linaro.org>
References: <20210708091058.56317-1-marex@denx.de>
 <20210709110315.vv5hbngg26o4vj63@maple.lan>
 <6330fc87-333e-f507-0a39-3ca1bfa6b39f@denx.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <acda9315-c4c1-1f69-2911-f6ae01431dec@tronnes.org>
Date: Fri, 9 Jul 2021 15:25:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6330fc87-333e-f507-0a39-3ca1bfa6b39f@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 linux-fbdev@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 09.07.2021 15.19, skrev Marek Vasut:
> On 7/9/21 1:03 PM, Daniel Thompson wrote:
>> On Thu, Jul 08, 2021 at 11:10:58AM +0200, Marek Vasut wrote:
>>> The note in c2adda27d202f ("video: backlight: Add of_find_backlight
>>> helper
>>> in backlight.c") says that gpio-backlight uses brightness as power
>>> state.
>>> Other backlight drivers do not, so limit this workaround to
>>> gpio-backlight.
>>>
>>> This fixes the case where e.g. pwm-backlight can perfectly well be
>>> set to
>>> brightness 0 on boot in DT, which without this patch leads to the
>>> display
>>> brightness to be max instead of off.
>>>
>>> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper
>>> in backlight.c")
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>>> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
>>> Cc: Noralf Trønnes <noralf@tronnes.org>
>>> Cc: Sean Paul <seanpaul@chromium.org>
>>> Cc: Thierry Reding <treding@nvidia.com>
>>
>> I have to admit that this patch really does makes it clear just how
>> nasty the hack in of_find_backlight() currently is.
>>
>> Moreover I think it is also be obsolete. gpio-backlight power mode
>> handling was pretty broken when this code was introduced. It was fixed
>> in 2019 by ec665b756e6f ("backlight: gpio backlight: Correct initial
>> power state handling") by trying to match the behaviour of PWM
>> backlight.  The new code always sets the brightness to 1 so I think we
>> can just remove the hack from of_find_backlight() since I think it is
>> unreachable.
> 
> I assume by "new code" you mean the fixed gpio-backlight driver ?
> 
> Dropping the whole code after the Note: is fine by me.

I haven't actually tested it, but when I saw the patch that Daniel
points to, it looked like this work around could be removed.
I haven't got time to tests it, but I will ack a patch that removes the
hack.

Noralf.

