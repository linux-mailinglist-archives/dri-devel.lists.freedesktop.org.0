Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8DBA3E90
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122C910E1ED;
	Fri, 26 Sep 2025 13:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wUyAiw6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D7910E1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:32:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cYBNP0pt7z9tNq;
 Fri, 26 Sep 2025 15:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758893573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yd4Mx+jNOSdf6VCUIn0E+aIjOManxtZgx8FZ6L3wTIs=;
 b=wUyAiw6MOzMV6zf7lkEjnsjt+tRDVO6Ao57dGOEZTYgFMcEL65ECbBvEI/2WXzr8uXZO/W
 v1BEdJa66C9cq0i+QiS09TuaR84YYZxSmSI1HtIB8vuGqw44LAPcDzA2JmqeWZgYi7zuWl
 2PQUufCxWo1oDAu+Tauj9BxOqDiz1NehzBWN6FfwIUcPP6nXLE9FPI432+sKnK2vXSc+Lh
 JThwcs9VHk+BV24T7GI9J6u3hNVRYSFxLE3dwCJqdFHoGs20mIxI5u6lj1ppRuodwF0Rgw
 FSwRL4iQ3sdvK7EJAPupK1+g28EiZJfgoJeAYplUjKj4fxnq/UQcF4SmTbxLeQ==
Message-ID: <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
Date: Fri, 26 Sep 2025 15:32:46 +0200
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
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNZaatnVRRkaPrnD@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 39f223dbff010fb2613
X-MBO-RS-META: 7t9f5dx43crya5tca76ssnuhq4bazs8u
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

On 9/26/25 11:18 AM, Rain Yang wrote:

Hello Jiyu,

>>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>>> so please drop the reset change.
>>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>>> as the internal driver use mali label to control the thermal up/low limitation.
>>
>> I updated all of the AHAB container, imx-oei and imx-sm components, and the
>> reset controller is no longer needed indeed.
> 
> thanks, please update the gpu node label if possibly.

Which label do you refer to, and which one would you prefer to have there ?

>>> BTW, does the dynamic frequency work well on your side so far with perf domain?
>>
>> How do I test that ?
> 
> cat /sys/kernel/debug/clk/gpu/clk_rate, although its name in dts is core.
> it is an read-only scmi-clk.
> the clk rate should be fixed, as it can be changed only via scmi_perf in i.MX95.

Right now, it is indeed fixed at 1 GHz .

-- 
Best regards,
Marek Vasut
