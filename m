Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C313923D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 14:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3DD89D39;
	Mon, 13 Jan 2020 13:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228D89D39
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 13:31:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DDVbdV095548;
 Mon, 13 Jan 2020 07:31:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578922297;
 bh=eExHtfNa/3+OXRiepMDyWgRKdCF1wcbIeNDOIhUtL5Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=TZ9/ztdp5jMWrcWSq1dnoYt4U27uQci2gkOzpBx4sLS0k/oCaDq5RERX2tlVGTj65
 sGgIj3M5BctXTjFjS2UD/demGaHOhj5ZS6hqy6X8qnRaI01mCvwO4ozzwnZPmS0n0N
 +nBBCPjfr68YP6uSIpzAUnGHzSdGJCN3YPdCYD6k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DDVbXx091254
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Jan 2020 07:31:37 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 07:31:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 07:31:36 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DDVYQW032900;
 Mon, 13 Jan 2020 07:31:35 -0600
Subject: Re: [PATCH] drm/bridge: tc358767: fix poll timeouts
To: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20191209082707.24531-1-tomi.valkeinen@ti.com>
 <CAHQ1cqHJYrDzrK9AUOGdF8uggLNHOS1pfZfbJcicPnYBXzddsA@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <943cfd61-8756-a2f4-5659-1f0335c7ed1e@ti.com>
Date: Mon, 13 Jan 2020 15:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqHJYrDzrK9AUOGdF8uggLNHOS1pfZfbJcicPnYBXzddsA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On 09/12/2019 16:45, Andrey Smirnov wrote:
> + Chris Healy
> 
> On Mon, Dec 9, 2019 at 12:27 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> Link training fails with:
>>
>>    Link training timeout waiting for LT_LOOPDONE!
>>    main link enable error: -110
>>
>> This is caused by too tight timeouts, which were changed recently in
>> aa92213f388b ("drm/bridge: tc358767: Simplify polling in tc_link_training()").
>>
>> With a quick glance, the commit does not change the timeouts. However,
>> the method of delaying/sleeping is different, and as the timeout in the
>> previous implementation was not explicit, the new version in practice
>> has much tighter timeout.
>>
>> The same change was made to other parts in the driver, but the link
>> training timeout is the only one I have seen causing issues.
>> Nevertheless, 1 us sleep is not very sane, and the timeouts look pretty
>> tight, so lets fix all the timeouts.
>>
>> One exception was the aux busy poll, where the poll sleep was much
>> longer than necessary (or optimal).
>>
>> I measured the times on my setup, and now the sleep times are set to
>> such values that they result in multiple loops, but not too many (say,
>> 5-10 loops). The timeouts were all increased to 100ms, which should be
>> more than enough for all of these, but in case of bad errors, shouldn't
>> stop the driver as multi-second timeouts could do.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Fixes: aa92213f388b ("drm/bridge: tc358767: Simplify polling in tc_link_training()")
> 
> Tested on RDU2 with TC358767/eDP panel, doesn't seem to break anything
> there, so:
> 
> Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Andrzej, can you pick this up for -fixes?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
