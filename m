Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424E640484
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF2410E6C0;
	Fri,  2 Dec 2022 10:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429910E6C0;
 Fri,  2 Dec 2022 10:23:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C17C08363D;
 Fri,  2 Dec 2022 11:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1669976587;
 bh=BwmYnpAE/FuI0vsVxqQn5tgbDKF0peigsicSl1VO268=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KjKiMsIspZfOhX6tKcmgZC3UHGj2pIR3/5yz84KMApZ9JFU1QwocDfTzfWwWZm7TE
 jRIVaDdOgbACFV8/lM2UgWOcnP7oP6vmRzeR1xLShtJTqgZqgfZM+6IJLm6WgOVKFe
 DMrxFQ1RmEJ8kIDMQSVjT9eRWoRnMwBFL4enVS0L9P5j81Z7DP7RIrRsg9Iivg6X4r
 MEHdh2S10+URTJmoTz/n6Lbk8Y3XZODyiLXN+ktkiC/LICWcXIttkiKZDPQZ8VKXC8
 5suJS70bEcI8JKa7IWzHC2W6gOdd1fsHfDoNMldIw6dk6petilwehBWDn8S1i/cWV/
 H98CfmykVE1pw==
Message-ID: <d063b82d-7557-8f97-114e-3e7828c6dfb8@denx.de>
Date: Fri, 2 Dec 2022 11:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] [RFC] drm/etnaviv: Disable softpin
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20221201232100.221606-1-marex@denx.de>
 <6dc1400c0f39849ca5ba675e25e26e5f4a663e78.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6dc1400c0f39849ca5ba675e25e26e5f4a663e78.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/2/22 09:59, Lucas Stach wrote:
> Am Freitag, dem 02.12.2022 um 00:21 +0100 schrieb Marek Vasut:
>> Currently softpin suffers from assorted race conditions exposed by newer
>> versions of mesa 22.2.y and 22.3.y . Those races are difficult to fix in
>> older kernel versions due to massive amount of backports necessary to do
>> so. Disable softpin by default until Linux 6.1.y is out, which contains
>> the necessary fixes to make softpin work reliably.
>>
> Sorry, but that's a NACK. The userspace driver depends on softpin for
> GPUs with texture descriptors, so this introduces a hard functional
> regression for those GPUs. I.e. they would go from "require race fixes
> that are already on the way to upstream" to not working at all.

I expected that NAK.

But then, what options do we have here, except for a massive convoluted 
backport, which might bring bugs of its own ?
