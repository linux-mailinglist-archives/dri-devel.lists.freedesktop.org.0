Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BE1B1E5B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 07:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148B89FA9;
	Tue, 21 Apr 2020 05:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD5789FA9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:52:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03L5q5tI022869;
 Tue, 21 Apr 2020 00:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587448325;
 bh=PmuR6BJKwcLG9x5ikzLU67xqNt5W5WSyJdrYIgpZ5Nk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vN6nNbal1T91mKtG0oPg82ShW2RdFekTpRyzpmAd6lgFtdULO8dOSjcnfNszoSYV4
 rrwR3UG1ixMT9Vnt7MfFWIHk29WKqv5OyuyvMoqoLKjH8S3IoMLXUVTbXwccB0E87T
 OgS2nO+G9inRhfj0DSaBLkUiNUb1DM0zA+/sBCpw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L5q5PZ104491;
 Tue, 21 Apr 2020 00:52:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 00:52:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 00:52:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L5q2bk101041;
 Tue, 21 Apr 2020 00:52:03 -0500
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
 <20200420160154.4xxv37fofx37ow7q@holly.lan>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
Date: Tue, 21 Apr 2020 08:52:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420160154.4xxv37fofx37ow7q@holly.lan>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2020 19:01, Daniel Thompson wrote:
> On Fri, Apr 17, 2020 at 02:33:12PM +0300, Tomi Valkeinen wrote:
>> led_bl_parse_levels() is rather difficult to follow. Rewrite it with a
>> more obvious code flow.
> 
> ... that introduces new behaviour.
> 
> There's a couple of new behaviours here but the one that particular
> attracted my attention is the disregarding the "default-brightness-level" if
> there is no table. That looks like a bug to me.

I think the previous behavior was a (minor) bug: how can there be default brightness level if there 
are no brightness levels? The led-backlight.txt is a bit lacking (another thing to improve...) but 
led-backlight mimics pwm-backlight, and pwm-backlight.txt says

default-brightness-level: The default brightness level (index into the array defined by the 
"brightness-levels" property)

But I agree, it's a change, so good to mention.

> Please can you add any intended changes of behaviour in the patch
> header?

Ok.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
