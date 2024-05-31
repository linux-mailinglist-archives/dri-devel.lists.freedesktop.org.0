Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE98D5CD7
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7F610E429;
	Fri, 31 May 2024 08:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="meMAKXV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A9510E429
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:36:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44V8aMR9042855;
 Fri, 31 May 2024 03:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717144582;
 bh=S0ukmk1g2waDrHjd+R+8zkx4KdRvWUrWFxGLS+wgH5o=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=meMAKXV66h+EykWFPDoMgyrkHcRwg0+dFJ/xtgo6dy/5/lpt8EuwgxEeH80KIrnSG
 U940IDV5SC45+69YFr2knqGlDA+G9lN0oYWmsx5AYL2M74hR/3iaqCyPhvJg8TOfCf
 sK7vMOV9TYdPqU1Kx/Gd3bBUepEm8LLSZ9pPOv+E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44V8aMc9051757
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 May 2024 03:36:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 03:36:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 03:36:22 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44V8aEXd052311;
 Fri, 31 May 2024 03:36:14 -0500
Message-ID: <7bed5792-db9d-3bc8-5325-7333076822e9@ti.com>
Date: Fri, 31 May 2024 14:06:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 06/11] math.h: Add macros for rounding to closest value
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
 <adobriyan@gmail.com>, <jani.nikula@intel.com>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
 <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
 <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
 <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171225.2749312-1-devarsht@ti.com>
 <ZljRSXtXWdOyCJaB@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZljRSXtXWdOyCJaB@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On 31/05/24 00:49, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 10:42:25PM +0530, Devarsh Thakkar wrote:
>> Add below rounding related macros:
>>
>> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round up in case two nearest values are
>> possible.
>>
>> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round down in case two nearest values are
>> possible.
>>
>> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
>> generally be used only when y is not multiple of 2 as otherwise
>> round_closest* macros should be used which are much faster.
>>
>> Examples:
>>  * round_closest_up(17, 4) = 16
>>  * round_closest_up(15, 4) = 16
>>  * round_closest_up(14, 4) = 16
>>  * round_closest_down(17, 4) = 16
>>  * round_closest_down(15, 4) = 16
>>  * round_closest_down(14, 4) = 12
>>  * roundclosest(21, 5) = 20
>>  * roundclosest(19, 5) = 20
>>  * roundclosest(17, 5) = 15
> 
> ...
> 
>> + * Examples :
> 
> It's inconsistent with the other one below.
> 
>> + * 	round_closest_up(17, 4) = 16
>> + *
>> + * 	round_closest_up(15, 4) = 16
>> + *
>> + * 	round_closest_up(14, 4) = 16
> 
> The three have TABs/spaces mixture.
> 
> I believe you wanted:
> 
>  * Examples::
>  * * round_closest_up(17, 4) = 16
>  * * round_closest_up(15, 4) = 16
>  * * round_closest_up(14, 4) = 16
> 

I initially referred the style from this link [1] but probably missed to
remove extra space from my patch.

But what you suggested looks better, I will go with what you suggested.

[1]  https://elixir.bootlin.com/linux/v6.9/source/include/linux/int_log.h#L22

Regards
Devarsh
