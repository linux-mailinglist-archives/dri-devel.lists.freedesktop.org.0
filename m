Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07DB43DBD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D981910E140;
	Thu,  4 Sep 2025 13:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="BjckCSaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1F010E140
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:52:47 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHgsS0KXcz9tRM;
 Thu,  4 Sep 2025 15:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756993964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sqEiKEPfpjIjaLh3x1IaYvvWhZgSYs4b16QXZYZKsE=;
 b=BjckCSaVvLxdM6JfXq8jeTi7phlIQw71ena4GzJUXYlc8a6jDL7TVdZOWQ2pvKGQuPCIhp
 ikxEigM6lZAzeHO7x6qu54yCbFuZJXvgV+YQnV/I6W69vKHS3S04W5gzmsBdXIcjuoytSo
 RhjHJAYGnEOvusE5YLXBKOQBDE9tLHC6qRsE0mbh6bHdC+eEaGdG+ayt56MtaD+f0YEgep
 +T8gL+IUsy85FIhuOkAvxIb1x4WdxuiFgtJZnDIPiNLSw2ylUJZ5jcu0gzrVUGNN6/zK1c
 Z+c7qQe7pqavwLrr8pBV6Ogwo6lY4UOkGZzAq4gniN4NfY5ezAz7qXH4dd0beQ==
Message-ID: <52e3c5dd-6952-43b5-94f9-43f30734680e@mailbox.org>
Date: Thu, 4 Sep 2025 15:52:38 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20250321200625.132494-1-marex@denx.de>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora> <3372501.aeNJFYEL58@steina-w>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3372501.aeNJFYEL58@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 963jdt3ncpa8jjh39d33r7supr6zwjrz
X-MBO-RS-ID: 7589421d111ea690b65
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

On 9/4/25 8:36 AM, Alexander Stein wrote:

Hello Alexander,

>>> Maybe the GPU remains halted because
>>> setting the GLB_HALT stops command stream processing, and the GPU never
>>> samples the clearing of GLB_HALT and therefore remains halted forever ?
>>
>> Exactly that, and that's expected.
> 
> FYI: in a new release of system manager software (starting from lf-6.12.3-1.0.0),
> the GPU reset is reasserted in SM software already [1] and access to GPU
> block control has been removed from Cortex-A [2]. Starting from B0 step this
> version is required AFAIK.

I don't think the SM is involved in this, because if I do the following 
test, the MCU also fails to boot unless I do a reset:

"
diff --git a/drivers/gpu/drm/panthor/panthor_device.c 
b/drivers/gpu/drm/panthor/panthor_device.c
index d4d73eebca49d..fd81cd2654111 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -642,6 +642,18 @@ int panthor_device_suspend(struct device *dev)
  		panthor_fw_suspend(ptdev);
  		panthor_mmu_suspend(ptdev);
  		panthor_gpu_suspend(ptdev);
+
+
+panthor_gpu_soft_reset(ptdev); // needed, else panthor_fw_resume() 
below fails
+
+		panthor_gpu_resume(ptdev);
+		panthor_mmu_resume(ptdev);
+
+		ret = panthor_fw_resume(ptdev);
+		if (!ret)
+			return 0;
+
+
  		drm_dev_exit(cookie);
  	}

"
