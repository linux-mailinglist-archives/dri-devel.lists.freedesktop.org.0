Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D7B97E5E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 02:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23A810E68A;
	Wed, 24 Sep 2025 00:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ua01Hs6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3088F10E68A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 00:34:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWdBs0KWyz9sSf;
 Wed, 24 Sep 2025 02:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758674053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/R193MJlhQdA+H4k7fkW5uoPMPkgmD96yRAkQq6Zdc=;
 b=ua01Hs6DqrCZdHiJSSlrUe64yasu/lbkXyrOu1ZyVAhhAR1jwsTIY8BD58z3vFLPtviKjY
 ti0z5cu/IcVJ+zTrX2XSfL7DkRMyaskjL9gAGV3rHTFEy1DGwMhCiFtVigmSE7ALgpPCxt
 zd4CRBkS05JviKjI6mmkZN5POdYNg60WKagaeyuOwys061gR+l0k1D6Hx2aQtCMUWIsAm0
 IgGn28KTuk5Ql3t80uPtqNPPS5o2gcEBp9nGo9C/+cqKzEeWMe3HBrJVGYvG4MS7zxO5l8
 R8BsYtYMv4NGB2gl4vqS7scEta1YWSERCc5m+z87VV0NesffvHqjOlRZq4WhSA==
Message-ID: <78d022c6-c158-4c80-a65a-3bc6c61fe360@mailbox.org>
Date: Wed, 24 Sep 2025 02:34:10 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 8/9] drm/rcar-du: dsi: Convert register bits to BIT() macro
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-9-marek.vasut+renesas@mailbox.org>
 <20250923141631.GJ20765@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250923141631.GJ20765@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wpxyfkpw7ewrr6zfhs8bkjrwaefhbgzd
X-MBO-RS-ID: 09a1949d4a687db1203
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

On 9/23/25 4:16 PM, Laurent Pinchart wrote:

Hello Laurent,

[...]

>>   #define CLOCKSET1			0x101c
>> -#define CLOCKSET1_LOCK_PHY		(1 << 17)
>> -#define CLOCKSET1_CLKSEL		(1 << 8)
>> -#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
>> +#define CLOCKSET1_LOCK_PHY		BIT(17)
>> +#define CLOCKSET1_CLKSEL		BIT(8)
> 
> This is a two bits field.

Fixed in v2 2/10 .

>> +#define CLOCKSET1_CLKINSEL_MASK		GENMASK(3, 2)
>>   #define CLOCKSET1_CLKINSEL_EXTAL	0
>>   #define CLOCKSET1_CLKINSEL_DIG		1
>>   #define CLOCKSET1_CLKINSEL_DU		2
>> -#define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
>> -#define CLOCKSET1_UPDATEPLL		(1 << 0)
>> +#define CLOCKSET1_SHADOW_CLEAR		BIT(1)
>> +#define CLOCKSET1_UPDATEPLL		BIT(0)
>>   
>>   #define CLOCKSET2			0x1020
>>   #define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
>> @@ -281,15 +281,15 @@
>>   #define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
>>   
>>   #define PHTW				0x1034
>> -#define PHTW_DWEN			(1 << 24)
>> +#define PHTW_DWEN			BIT(24)
>>   #define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
>> -#define PHTW_CWEN			(1 << 8)
>> +#define PHTW_CWEN			BIT(8)
>>   #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
>>   
>>   #define PHTR				0x1038
>> -#define PHTR_TEST			(1 << 16)
>> +#define PHTR_TEST			BIT(16)
> 
> And this is a 8 bits field.
I'll fix this in v3, once I get further feedback on V2, I missed this one.
