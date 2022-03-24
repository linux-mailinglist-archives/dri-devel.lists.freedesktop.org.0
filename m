Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A54E6A8A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 23:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F9A10E17A;
	Thu, 24 Mar 2022 22:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1749 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 22:13:48 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.193.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D6510E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 22:13:48 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 9A7401B7C8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 16:18:10 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id XUqQnIhJTRnrrXUqQnb0wz; Thu, 24 Mar 2022 16:18:10 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYIalswLom+ceKwMGJo6mQG4+4OkZPeJDwH7fRE+ZPk=; b=cMxNZZ92vrPsegNwniVsIiJu6H
 cjg0z0Aq0AcDBpxN2VsWvG9wDTT34MReKb1oO5UGRnZcwNJG1f9Eo2uM8Naq2VkW6x7XwbmQAfXHr
 JRf0KsW/pTJcxLSqrCMQAeqPnwqhxfoq8whse9R2+mxnQuUxiRsHU0wvZvzM4D9LQEimEOudZyKRN
 0OQ4O6f2mVCShIIEnnJVdSHl/D2eJc/Fctnfq0YAJoTLwVPQIGBEtboCNaPZ89EgVBCNdZwEvetjP
 3/KFA5PV1K09QNsDE9HnEkNKxCFok3ntDVoKIc1bV7MPs2TQDER2STwyF4iPJzJ7a+G8q/URFCqB5
 DxVxXxdg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54452)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nXUqP-004IOY-Ss; Thu, 24 Mar 2022 21:18:09 +0000
Message-ID: <05be3d3b-16a7-2a65-fa58-606f22bfeeb8@roeck-us.net>
Date: Thu, 24 Mar 2022 14:18:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
 <20220324191116.GA1045463@roeck-us.net>
 <db7e3568-5dc2-eb84-8ee4-191442da85e9@suse.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <db7e3568-5dc2-eb84-8ee4-191442da85e9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nXUqP-004IOY-Ss
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54452
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 11
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, geert@linux-m68k.org,
 kraxel@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/24/22 12:18, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.03.22 um 20:11 schrieb Guenter Roeck:
>> Hi,
>>
>> On Wed, Feb 23, 2022 at 08:38:03PM +0100, Thomas Zimmermann wrote:
>>> Improve the performance of cfb_imageblit() by manually unrolling
>>> the inner blitting loop and moving some invariants out. The compiler
>>> failed to do this automatically. This change keeps cfb_imageblit()
>>> in sync with sys_imagebit().
>>>
>>> A microbenchmark measures the average number of CPU cycles
>>> for cfb_imageblit() after a stabilizing period of a few minutes
>>> (i7-4790, FullHD, simpledrm, kernel with debugging).
>>>
>>> cfb_imageblit(), new: 15724 cycles
>>> cfb_imageblit(): old: 30566 cycles
>>>
>>> In the optimized case, cfb_imageblit() is now ~2x faster than before.
>>>
>>> v3:
>>>     * fix commit description (Pekka)
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> This patch causes crashes with arm mainstone, z2, and collie emulations.
>> Reverting it fixes the problem.
>>
>> collie crash log and bisect log attached.
> 
> Does it work if you apply the fixes at
> 
> https://patchwork.freedesktop.org/series/101321/
> 
> ?
> 

Yes, it does, specifically the cfb related patch. I sent a Tested-by:.

Thanks,
Guenter
