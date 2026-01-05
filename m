Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38DCF4B6C
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C7910E3E7;
	Mon,  5 Jan 2026 16:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="BIVyRKIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848710E423
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:34:38 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dlKdQ0LVmz9tQk;
 Mon,  5 Jan 2026 17:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767630874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhJ7h8tQ1M7ApNeSHh732JqFfmiwDgOtDBPBZ+jirFw=;
 b=BIVyRKIAx9yStlJk6/RFqtP/ryK6HKjrxkjwB+gtaWVcJ7NZTq8cjMPQjZzj7PzcFggd0i
 rOPLXNRNGcHQ2/wrltWRRvKAWutkTr0/HVE2/JcAEGgRY1Zccgl5dfPIHM5guPAcgzEWVt
 TgX2ZshfKGAEy5Vf4mhPVRJ2VJ96S7uoOZuGpev7EUchI8MQ0NXqVKyJFhii+7A00YsSPH
 8q+CVy6B0jGy8Aj/Zn87Kg6lkEHLcyLQ6nPzjuIau7h/8TJhG74dbyETc0FVEezb1XoE0I
 gIh8PxedLZmTLbfLRfipK3EyAYFTB+66y7CGvxGD1hokSpWe7uBl0xY0WOFWUw==
Message-ID: <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Date: Mon, 5 Jan 2026 17:34:30 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: efd2453e431ebab954b
X-MBO-RS-META: 6ep6ign7mmgf1jwjst9tp54jsmqoiwad
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

On 1/5/26 2:09 PM, Matt Coster wrote:
> On 06/11/2025 23:24, Marek Vasut wrote:
>> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>
>> This allows this driver to bind on Renesas R-Car H2 which contains
>> Rogue G6400 BVNC 1.39.4.1 .
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Hi Marek,

Hello Matt,

> My apologies, this one appears to have slipped through the cracks on our
> end.

No worries.

>> +++ b/drivers/gpu/drm/imagination/Kconfig
>> @@ -3,7 +3,7 @@
>>   
>>   config DRM_POWERVR
>>   	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
>> -	depends on (ARM64 || RISCV && 64BIT)
>> +	depends on ARM || ARM64 || RISCV
> 
> This seems fine to me. Do you know any reason why the single change
> below might *not* be sufficient to support non-64-bit riscv? I can't
> think of any, I just wanted to double check this had been considered.
I do not have any 32bit RV to test this on, I only have 32bit ARM (R-Car 
H2).
