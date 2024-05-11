Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C948C32EE
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 19:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E9510E076;
	Sat, 11 May 2024 17:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="leBQbhMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7579010E076
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 17:26:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BHQg4Z027197;
 Sat, 11 May 2024 12:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715448402;
 bh=6K8Nz8BB11B/MMWfWwV1JBB5EmA0ZBK0yGA1FoNg3Dg=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=leBQbhMFjAOfW+sqINXw6MXfsHCNBMTxzzaSDo+u411Je0bVsLGalDgDfZmjKPoUU
 TvlGKYTMcCpfH9/dmKzUUBg3IwynDRwYm12ZctAWNNy5tARp9r0LK2pbkzN3/wVzcy
 Y449/faFuo/sgya/ZDhIGzby+qXsSU/79+icgwks=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BHQgWG118711
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 12:26:42 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 12:26:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 12:26:42 -0500
Received: from [10.249.130.181] ([10.249.130.181])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BHQVPB112101;
 Sat, 11 May 2024 12:26:32 -0500
Message-ID: <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
Date: Sat, 11 May 2024 22:56:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
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
 <nicolas@ndufresne.ca>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zj42vTpyH71TWeTk@smile.fi.intel.com>
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

On 10/05/24 20:31, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
>> Add macros to round to nearest specified power of 2.
> 
> This is not what they are doing. For the above we already have macros defined.
> 

Sorry I did not understand this comment, if you are talking about
existing macros round_up & round_down they either round "up" and round
"down" to specified power of 2 as specified here [1].
whereas the macros introduced in this patch round to "nearest" specified
power of 2.

>> Two macros are added :
> 
> (Yes, after I wrapped to comment this line looks better on its own,
>  so whatever will be the first sentence, this line should be separated
>  from.)
> 

Agreed.

>> round_closest_up and round_closest_down which round up to nearest multiple
> 
> round_closest_up() and round_closest_down()
> 
> 
>> of 2 with a preference to round up or round down respectively if there are
>> two possible nearest values to the given number.
> 
> You should reformulate, because AFAICS there is the crucial difference
> from these and existing round_*_pow_of_two().
> 

In math.h, we already have round_up/round_down macros which rounded
up/down to next specified power of 2. Then we had the DIV_ROUND_CLOSEST
which used the suffix _CLOSEST to imply the meaning that divided value
will be rounded to nearest/closest int value either by rounding up or
rounding down.

So inspired from naming convention of this macros given developers are
already familiar with them, I used round_closest for specifying the
rounded value to nearest/closest value which can be achieved either by
rounding up/down. And I also wanted user to have finer control for the
scenarios where there are two possible nearest values :

For e.g round(160, 64) can be either 192 and 128 and both are 32 away
from 160.

And that's the reason I went ahead with two macros instead i.e
round_closest_up, round_closest_down so that developers can choose
exactly what they want.

Regards
Devarsh
