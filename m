Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA68D194D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EB310FD9B;
	Tue, 28 May 2024 11:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wuGTpzYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D065C112120
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:22:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44SBLueP049633;
 Tue, 28 May 2024 06:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716895316;
 bh=LsFWexuqmOIvPySLRES2Xzrrtm5Z8axMJcdqDhRHPIU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=wuGTpzYnhl01qto8/tnlANOM/r0jXRM08h9L6jT3vpx+HKPSyZFE91q9bj9aJFi8g
 1HXCdhmat6FK/RzElvVGnhxo1Bsjcn/fPgXO/2Zlt0Ibpi0wtow5wW0i5HIQ+l5UhN
 U9vh0FjduxBxcEhRqpI77VJv4YdAG4wDmtowNoyA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44SBLuU9046143
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2024 06:21:56 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 May 2024 06:21:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 May 2024 06:21:56 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44SBLkbg062841;
 Tue, 28 May 2024 06:21:47 -0500
Message-ID: <4a8cea8c-4575-bdd8-e8a8-634a2b267ff5@ti.com>
Date: Tue, 28 May 2024 16:51:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
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
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZlTu_9orsuosNiGk@smile.fi.intel.com>
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

On 28/05/24 02:07, Andy Shevchenko wrote:

[..]
>> +#include <kunit/test.h>
>> +#include <linux/gcd.h>
>> +#include <linux/lcm.h>
> 
> + math.h (where abs()/DIV_ROUND_*()/etc come from?)
> I believe I mentioned that.
> 

I did compile and test this, so math.h was indirectly getting included via
some other header file already included but I would not rely on that and
include math.h separately as you suggested.

>> +#include <linux/reciprocal_div.h>
> 
> ...
> 
>> +MODULE_LICENSE("GPL");
> 
> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().
> 

Indeed, it gives below logs, let me add that too.
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/math_kunit.o


Regards
Devarsh
