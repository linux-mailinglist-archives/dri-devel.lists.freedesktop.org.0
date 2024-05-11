Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3548C32FD
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 19:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F610E39A;
	Sat, 11 May 2024 17:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="lxV0qPuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F4910E39A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 17:49:38 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BHnQ8f013210;
 Sat, 11 May 2024 12:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715449766;
 bh=4215bRTgwZdqG5KkXJIS7GulsBaMdC4XYJ8YcQUiUgk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=lxV0qPuWTOU6SaCKezg3siI2giP8qdepUnCvfOSUUL+bEsDMjX6bpsSXj5G+14F56
 7HxFEEpj6wda3qzhPRVJZESuO0ljZgNSetf9IbJ9kP5qM7LT0Ju5DmhyQjpZKJToxC
 9aqF8RdjTTwrNX3wsH9Jld5tfsFkTKyXKQ4gm8EY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BHnQms031044
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 12:49:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 12:49:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 12:49:26 -0500
Received: from [10.249.130.181] ([10.249.130.181])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BHnEIi018005;
 Sat, 11 May 2024 12:49:15 -0500
Message-ID: <e8ae7dae-a39e-4e8d-a4ba-c720d40653e6@ti.com>
Date: Sat, 11 May 2024 23:19:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to
 nearest multiple
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
 <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
 <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
 <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>
References: <20240509184010.4065359-1-devarsht@ti.com>
 <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
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

Thanks for the quick review.

On 10/05/24 20:33, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 12:10:10AM +0530, Devarsh Thakkar wrote:
>> Use generic macro round_closest_up for rounding to nearest multiple instead
> 
> round_closest_up()
> 
> We refer to the functions as func().
> 

Agreed. Will fix commit msg to use round_closest_up()

>> of using local function.
> 
> ...
> 
>> @@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
>>  		 * The closest input sample position that we could actually
>>  		 * start the input tile at, 19.13 fixed point.
>>  		 */
>> -		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
>> +		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
>>  		/* Convert 19.13 fixed point to integer */
>>  		in_pos_rounded = in_pos_aligned / 8192U;
> 
> Oh, these seems to be better to use either ALIGN*(), or PFN_*() / PAGE_*()
> families of macros. What the semantic of 8192 is?
> 

As Laurent mentioned, it looks like the fractional part of the integer.
But functionality wise, there is no change with the introduction of this
patch. round_closest_up() does exactly the same thing as what the local
function round_closest used to do before this patch.

Regards
Devarsh
