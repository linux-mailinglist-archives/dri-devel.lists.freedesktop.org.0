Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B323B6BB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 10:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CC8890DD;
	Tue,  4 Aug 2020 08:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9354489D99
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 08:23:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0748N24A003037;
 Tue, 4 Aug 2020 03:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596529382;
 bh=qh0r8t8HGK6CNFdJfRwumFp+jNb1tkA0YMwiPKGjPuo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=L722ZNipBrz1n2r36JdL98aYLnloR5EfP7hfbv2t9iI91WRNTwByh+0Z4EJOJ5a2E
 Gy6dKSg2IayOfceTV7Y9PfbMkr7DwhVwaS1z+8me0kA2ugjOtWF0NAx67VJ7xRIfgB
 eg16kaUleasb/wTc+Z9GGzlwLbOJ4IElN5ttSbpI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0748N2Nu090691
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Aug 2020 03:23:02 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 03:23:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 03:23:01 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0748N0p2078986;
 Tue, 4 Aug 2020 03:23:00 -0500
Subject: Re: [PATCH v2] drm/omap: force runtime PM suspend on system suspend
To: Tony Lindgren <tony@atomide.com>
References: <20200618095153.611071-1-tomi.valkeinen@ti.com>
 <20200717162854.GQ10990@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5c74d5a1-3a5f-6eb9-17f4-147f4b2f890c@ti.com>
Date: Tue, 4 Aug 2020 11:22:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717162854.GQ10990@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/07/2020 19:28, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200618 09:53]:
>> Use SET_LATE_SYSTEM_SLEEP_PM_OPS in DSS submodules to force runtime PM
>> suspend and resume.
>>
>> We use suspend late version so that omapdrm's system suspend callback is
>> called first, as that will disable all the display outputs after which
>> it's safe to force DSS into suspend.
> 
> This would be great to have merged as a fix for v5.8 as it fixes a
> suspend and resume regression:
> 
> Fixes: cef766300353 ("drm/omap: Prepare DSS for probing without legacy platform data")
> Tested-by: Tony Lindgren <tonY@atomide.com>
> 

I have pushed this to drm-misc-fixes. I added

Cc: stable@vger.kernel.org # v5.7+

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
