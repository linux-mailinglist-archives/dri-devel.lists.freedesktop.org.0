Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721EF8C9EAE
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 16:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BD210E451;
	Mon, 20 May 2024 14:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Zg5m/EYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AF810E451
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:21:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44KELX8Y090865;
 Mon, 20 May 2024 09:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716214893;
 bh=SkFgN9UwfacOpW7pnIR1XMF1buDzs5cFhviEj/eFykI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Zg5m/EYePT4COBPibcYNKHuApVYotWNtdx7jyQUacVYFhsP1FyMRIQqYvd4pWX3t/
 O9iz0rUndYEzkkT9hsHbljGJrngJuE91+OjQPU45izy7KwJXpGL2jcO4w6M6Wz44qm
 RvwKLQN+e3hxtzwAecI05FATGorJRjeog3y8KuWE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44KELX1U045568
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 May 2024 09:21:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 May 2024 09:21:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 May 2024 09:21:32 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44KELOPC079538;
 Mon, 20 May 2024 09:21:25 -0500
Message-ID: <01bd1d88-2cff-ad12-c7fb-3f2eddcfd899@ti.com>
Date: Mon, 20 May 2024 19:51:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Daniel Latypov <dlatypov@google.com>, <mchehab@kernel.org>,
 <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
 <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
 <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
 <davidgow@google.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
 <ZktAlza1zEke1eCx@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZktAlza1zEke1eCx@smile.fi.intel.com>
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

On 20/05/24 17:52, Andy Shevchenko wrote:
> On Mon, May 20, 2024 at 05:11:18PM +0530, Devarsh Thakkar wrote:
>> On 18/05/24 01:44, Andy Shevchenko wrote:
>>> On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:
> 
> [..]
> 

[..]
> Yes, and one should follow IWYU principle and not cargo cult or whatever
> arbitrary lists.
> 

Agreed.

>>>> +#include <linux/lcm.h>
>>>
>>> + math.h // obviously
>>> + module.h
>>>
>>>> +#include <linux/reciprocal_div.h>
>>>
>>> + types.h
>>
>> All the above headers are already included as part of kernel.h
> 
> Yes, that's why you should not use "proxy" headers.
> Have you read the top comment in the kernel.h?
> 

Yes, it says it is not recommended to include this inside another header file.
Although here we are adding it inside c file, but I can still try avoid it and
include only the required headers instead of kernel.h as you recommended.

Regards
Devarsh
