Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C613FCB9142
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 16:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739BC10E149;
	Fri, 12 Dec 2025 15:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SgcPkbqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8FE10E149
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 15:14:44 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dSY0K0NSbz9sqV;
 Fri, 12 Dec 2025 16:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1765552481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7v7jVCx3tCJx9PyEM2lA4jQjeS1rr+mNLGrWehrqfs=;
 b=SgcPkbqcCAXQkyXTP5wrMCnX3XIOpW74cfkBLuWpBBTgBqZRSmiiRJ29RWMJmrL8FiMaX4
 KanOogvwnQuBpUsA47XxVq42/w3a1nPClG71tQ8uXhGwzD1YH9itoVTJwtBQWkaju1LxkS
 BYgH5RlsQHo2M7bj0AaN/JHcdGXb+KsELVL2B4FdTemVk+TBktGUtHjzcKGXE3HYRFsLVm
 h6kIlR0qRc5EdusjbFBOzcnZPYGfy8QkOAzsG3xXdMck1HK1yNl+Da5F6j3dbuN3qQPgVs
 4gi5lUA/fCmziDEnJKkJ9xe74Cbp4/2J/dgri6d/jSnrv4FqnZm/jp4ODbISGw==
Message-ID: <c5e4fd12-38d9-4169-88d1-115cc38ca409@mailbox.org>
Date: Fri, 12 Dec 2025 16:14:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?Q?Ren=C3=A9_Rebe?=
 <rene@exactco.de>
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
References: <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
 <20251211.134330.2200695829709887915.rene@exactco.de>
 <3e46c10b-79db-4c11-9047-cd33e94ff5e0@suse.de>
 <20251211.153101.411672428832661296.rene@exactco.de>
 <2e26a6e6-6f4b-4b48-8fd0-648372856dce@suse.de>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <2e26a6e6-6f4b-4b48-8fd0-648372856dce@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 634548f9ad74f68829b
X-MBO-RS-META: r5ockyn6u4ykyjpu1qw9dkn465n1ohoj
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

On 12/11/25 15:56, Thomas Zimmermann wrote:
> Am 11.12.25 um 15:31 schrieb René Rebe:
>> On Thu, 11 Dec 2025 15:03:48 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>>>       /* write checksum + signature */
>>> +    writel(swab32(csum), dst);
>>> +    writel(swab32(width), dst + AST_HWC_SIGNATURE_SizeX);
>>> +    writel(swab32(height), dst + AST_HWC_SIGNATURE_SizeY);
>>> +    writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTX);
>>> +    writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTY);
>>> +#else
>>> +    memcpy_toio(dst, src, AST_HWC_SIZE);
>>>       dst += AST_HWC_SIZE;
>>> +
>>> +    /* write checksum + signature */
>>>       writel(csum, dst);
>>>       writel(width, dst + AST_HWC_SIGNATURE_SizeX);
>>>       writel(height, dst + AST_HWC_SIGNATURE_SizeY);
>>>       writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
>>>       writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
>>> +#endif
>> I'm pretty sure this will break the cursor, as the position was
>> working correctly and I only had to swap the cursor image data. The
>> csum will also not be identical anyway, as the checksum function
>> computes it in native byte order. Theoretically that would have to be
>> changed. However, I do not see where it is really used, maybe only
>> some special remote desktop vendor protocol that I'm not using. Maybe
>> the exact checksum does not even matter and is only used as
>> optimization to not resend an unchanged cursor image.
> 
> Oh well! I though that the bus does implicit byte swaps? Or does writel() already swap to little endian, which the AST chip expects? I'm confused.

FWIW, writel indeed converts from native byte order to little endian, see include/asm-generic/io.h.

Can't help with your other questions though.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
