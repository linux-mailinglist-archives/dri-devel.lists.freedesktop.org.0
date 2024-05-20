Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929F8C9C3F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA08410E2E1;
	Mon, 20 May 2024 11:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="VwFnbDv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C057310E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:41:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44KBfRqK032177;
 Mon, 20 May 2024 06:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716205287;
 bh=a76NLsOqpAhT7UPR9aUmjJ2mg4WHgQRk5YjCt6+gAeM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=VwFnbDv5uflaIET3e5IHt6ObbQTtfqczMDLmIuuyRwkr+PMKbO6KDftOndM5S4Kk3
 EFwR2f0t4y5Ky2JyTwmRMBI0sbHzhh9dvO0Ycjr5fxMiFRZ9XSTBtBokTWcx6QxG/l
 jVwN1nNzquaUcJv4fRQ8FtcRR7Zo1D83GZB/SvXI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44KBfRQV120258
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 May 2024 06:41:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 May 2024 06:41:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 May 2024 06:41:26 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44KBfJ8A078373;
 Mon, 20 May 2024 06:41:19 -0500
Message-ID: <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
Date: Mon, 20 May 2024 17:11:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Latypov
 <dlatypov@google.com>
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
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Hi Andy, Daniel,

On 18/05/24 01:44, Andy Shevchenko wrote:
> On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:
[..]
> 
>> [devarsht: Rebase to 6.9 and change license to GPL]
> 
> I'm not sure that you may change license. It needs the author's confirmation.
> 

As per latest licensing doc [1], It quotes that GPL  is same as GPL v2 and GPL
v2 exists only for historical reasons as shared below :

“GPL v2 Same as “GPL”. It exists for historic reasons."

So I think it should be fine and more apt to use GPL. This is also highlighted
in below commit:
bf7fbeeae6db644ef5995085de2bc5c6121f8c8d module: Cure the MODULE_LICENSE "GPL"
vs. "GPL v2" bogosity

>> ---
>> Changes since v6:
>> * Rebase to linux-next, change license to GPL as suggested by checkpatch.
> 
> Note, checkpatch.pl is not false positives free. Be careful
> with what it suggests.
> 
>> +#include <kunit/test.h>
>> +#include <linux/gcd.h>
> 
>> +#include <linux/kernel.h>
> 
> Do you know why this header is included?
> 

It includes all the other required headers (including those you mentioned
below), and header list is probably copied from other files in same directory.
But it does suffice the requirements as I have verified the compilation.

>> +#include <linux/lcm.h>
> 
> + math.h // obviously
> + module.h
> 
>> +#include <linux/reciprocal_div.h>
> 
> + types.h
> 

All the above headers are already included as part of kernel.h

Kindly let me know if any queries.

[1]: https://docs.kernel.org/process/license-rules.html

Regards
Devarsh
