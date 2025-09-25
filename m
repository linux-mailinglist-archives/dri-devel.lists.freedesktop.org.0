Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C51BA1633
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 22:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB5E10E9B3;
	Thu, 25 Sep 2025 20:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="r/jHz6jn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C11510E9B3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 20:41:45 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cXlxd5FDcz9t6q;
 Thu, 25 Sep 2025 22:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758832901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CijZ3Xqd6wqxDdeAlLP2vKxFbA+8L+sWoLSvg2ZGilI=;
 b=r/jHz6jnoaua6QeLVAKaSSvhFNHUK1SEppt1e4VfZcHodDk0zlMAdXYuen99UuKB+ssZUu
 zIouJzVc2yEVwP8p/SAQlZGLe/Z1Zl0SsbllTruD79VTA2he6cWIWiTz1jN8W5MEnLzF25
 Gr/ezLzyiwEVn4u13TZxJsqJdHTnrFWTU8WEZ+G5yWBnEWQteTCi04Czn5/cuMV/b2mmQD
 UlseG98XIWiJDk5doIyOtt9KYJlIs69B8+hgPFzAVRhmPHzmKJCuWWU1E9TgBRKDEZI5TK
 9Wg7q/Llf2ayJDuNxwRBGnw7A4ZePEH3XGxWeCszEed6TRhUvQLt/n4popvhng==
Message-ID: <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
Date: Thu, 25 Sep 2025 22:41:37 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de,
 xianzhong.li@nxp.com
References: <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aMrDKkIoZvAlBD8d@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1dyck573mitkj4nhekjarxur44xtxn3t
X-MBO-RS-ID: 09b1e6ab6b2edc227a4
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

On 9/17/25 4:18 PM, Rain Yang wrote:

Hello Jiyu,

sorry for the late reply.

>>> sorry for the inconvienence. this uboot version don't include SM-184's change.
>>> I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
>>> or build from source, or raise one ticket in this website[2].
>>
>> I use mainline U-Boot 2025.07 with about 10 extra patches, but nothing
>> significant. I don't think this is U-Boot issue, is it ?
>>
>> I can rebuild SM, which commit in SM (from imx-sm repository) do I need to
>> use ?
>>
>> -- 
>> Best regards,
>> Marek Vasut
> Hi Marek,
> I think the problem may be about the multi power domain, the second power domain named perf
> is for frequency change only, you can try to power on gpumix power domain only.

I dropped that one.

> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
> so please drop the reset change.
> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
> as the internal driver use mali label to control the thermal up/low limitation.

I updated all of the AHAB container, imx-oei and imx-sm components, and 
the reset controller is no longer needed indeed.

> BTW, does the dynamic frequency work well on your side so far with perf domain?

How do I test that ?

-- 
Best regards,
Marek Vasut
