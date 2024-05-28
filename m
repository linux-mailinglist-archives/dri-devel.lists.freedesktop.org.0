Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E8E8D18A2
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 12:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30FB10E052;
	Tue, 28 May 2024 10:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XSl0VC+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D9710E052
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 10:32:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44SAWeAJ016018;
 Tue, 28 May 2024 05:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716892360;
 bh=fhM8umhhiFzOsQ7NzwP9rqG6fzIi2j17UUh3XrA9av4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=XSl0VC+Yfi+BjJdSXwgKkRbMPnFl8ZZzczn/3EpXy35kecRoYRg9rq/hOlqHaNGMo
 mM/F77gLUPG0lC4/TCkbvtH1QrRfLe/HiLUrof7efeosumfH7Xc7CqoRSGoojwEVAU
 w8ckzDWUiLp18RSvJlaLKQUqYpe7asoJgCTXXcI4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44SAWewA017903
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2024 05:32:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 May 2024 05:32:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 May 2024 05:32:40 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44SAWVsL025055;
 Tue, 28 May 2024 05:32:32 -0500
Message-ID: <86f9ed66-c58e-0b2d-dd2b-4372ff26a3c3@ti.com>
Date: Tue, 28 May 2024 16:02:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 06/10] math.h: Add macros for rounding to closest value
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
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180856.1124470-1-devarsht@ti.com>
 <ZlTt-YWzyRyhmT9n@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZlTt-YWzyRyhmT9n@smile.fi.intel.com>
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

On 28/05/24 02:02, Andy Shevchenko wrote:
> On Sun, May 26, 2024 at 11:38:56PM +0530, Devarsh Thakkar wrote:
...

>> +/**
>> + * round_closest_up - round closest to be multiple of specified value (which is
>> + *                    power of 2) with preference to rounding up
>> +
> 
> Not that big deal, but missing '*' here. Personally I would not even put
> a blank line between Summary and Field Descriptions.
> 

My bad. Yes I would remove the blank line here. This is picked up as warning
from kernel-doc too.

>> + * @x: the value to round
>> + * @y: multiple to round closest to (must be a power of 2)
>> + *
>> + * Rounds @x to closest multiple of @y (which must be a power of 2).
>> + * The value can be either rounded up or rounded down depending upon rounded
>> + * value's closeness to the specified value. If there are two closest possible
>> + * values, i.e. the difference between the specified value and it's rounded up
>> + * and rounded down values is same then preference is given to rounded up
>> + * value.
>> + *
>> + * To perform arbitrary rounding to closest value (not multiple of 2), use
>> + * roundclosest().
>> + *
>> + * Examples :
> 
> What is this suppose to be rendered to?
> 

The file math.h is not rendered as part of kernel-doc right now. I can put
this under Documentation/core-api/kernel-api.rst perhaps I can create a new
section as below:

Rounding, absolute diff and 32bit division macros
-------------------------------------------------

under the section:
CRC and Math Functions in Linux

===============================

is that okay ?

>> + * round_closest_up(17, 4) = 16
>> + * round_closest_up(15, 4) = 16
>> + * round_closest_up(14, 4) = 16
> 
> Btw, is kernel-doc validator happy about all kernel docs you added?
> 

Yes, except the aforementioned blank line.

Regards
Devarsh
