Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC9379973
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80A6E926;
	Mon, 10 May 2021 21:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1330 seconds by postgrey-1.36 at gabe;
 Mon, 10 May 2021 21:50:30 UTC
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
 [192.185.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3D56E927
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:50:30 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 90D3C400CA1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:28:13 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id gDRllCFU6MGeEgDRllIOcb; Mon, 10 May 2021 16:28:13 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KgfgvAJslFXT/V//YjtBHOgr5mG9TcHB2XOA5MwkyEc=; b=jBEbMKAMemcnb4u3CBVuzDGDg/
 9TAQOBwBZc8a0bYT0mZXv0Az0trVtcXMbJaj5NTPgpRHn6s8y6j9uwqjqS9TO2hXOeHcP6Y0zMlct
 z9W1UgaHqhQSY7T8JBksNrS9m5YBhU4iOQS+pLgMqGY0Qgm+IUudasrrN/xO1kvLqNi0Ycg4g2706
 dA9uU9e9MrQr8v0rFuJjnU9fULOrz1TNk3rGPp6zZrd2J5Bj08W8MDxSWiTwC9QXFnZM2fu/GSFkw
 EehqKoYJrDqeSoZ/os8loLvV5zVg8oT0KrbTAIYcP7tF3lqOfk1Rb0OFLoj8R/w5YMlENzZ0NyLsY
 1A/4VDyA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:42170
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lgDRg-00137t-Uf; Mon, 10 May 2021 16:28:08 -0500
Subject: Re: [PATCH] drm/radeon/ni_dpm: Fix booting bug
To: Alex Deucher <alexdeucher@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
Date: Mon, 10 May 2021 16:28:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lgDRg-00137t-Uf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:42170
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 5/10/21 16:17, Alex Deucher wrote:
> On Sun, May 9, 2021 at 6:48 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
[..]

>>
>> Bug: https://lore.kernel.org/dri-devel/3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de/
>> Fixes: 434fb1e7444a ("drm/radeon/nislands_smc.h: Replace one-element array with flexible-array member in struct NISLANDS_SMC_SWSTATE")
>> Cc: stable@vger.kernel.org
>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Link: https://lore.kernel.org/dri-devel/9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de/
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> This seems like a lot of churn just to use flexible arrays.  That
> said, if static checkers are going to keep complaining about single
> element arrays, I don't mind applying these patches since this code is
> not likely to change.  Applied.  Thanks.

This is not only about the one-element arrays. These fixes (together with commits
434fb1e7444a and 96e27e8d919e) allow us to fix more than a dozen of these out-of-bounds
warnings:

drivers/gpu/drm/radeon/ni_dpm.c:2521:20: warning: array subscript 1 is above array bounds of ‘NISLANDS_SMC_HW_PERFORMANCE_LEVEL[1]’ {aka ‘struct
NISLANDS_SMC_HW_PERFORMANCE_LEVEL[1]’} [-Warray-bounds]
 2521 |   smc_state->levels[i].dpm2.MaxPS =
      |   ~~~~~~~~~~~~~~~~~^~~

which should be fixed in order to globally enable -Warray-bounds. :)

Thanks!
--
Gustavo

