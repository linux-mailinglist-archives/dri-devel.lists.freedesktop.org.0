Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F81B1E91B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3415C10E937;
	Fri,  8 Aug 2025 13:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oPXgVpUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617B310E937
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:24:58 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 578DOWEo602038;
 Fri, 8 Aug 2025 08:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1754659472;
 bh=i5QrXCqm+pifeK6qyJpbRjapusOqLRIsZv1SdbjtFgM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=oPXgVpUky4MiMEuzV1gaxhmE2P+CcZTLHNyN2yEibVfjZ/F5eY7MQ2SGoxsMEMgws
 CDyKh2OOKPW2sGr69AInzj4bQcGNAFUnX+p0uOROD4gmIoO7VqqklFxjDyxJgsHdUF
 6fXLAC6SNg3YueNO8Qt6voOsWnMUjzmbCnldmJ0M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 578DOVfQ1612002
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 8 Aug 2025 08:24:31 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 08:24:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 08:24:30 -0500
Received: from [10.249.145.16] ([10.249.145.16])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 578DONpB3102888;
 Fri, 8 Aug 2025 08:24:23 -0500
Message-ID: <19dd9aa9-43c6-4483-9cdf-f297e41ecdec@ti.com>
Date: Fri, 8 Aug 2025 18:54:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/tidss: Fixes data edge sampling
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>
CC: <thomas.petazzoni@bootlin.com>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <stable@vger.kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, <s-jain1@ti.com>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <1951ecfe-d080-464c-8441-f5400f535495@ideasonboard.com>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <1951ecfe-d080-464c-8441-f5400f535495@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi, Louis,

On 07/08/25 18:51, Tomi Valkeinen wrote:
> Hi,
> 
> On 30/07/2025 20:02, Louis Chauvet wrote:
>> Currently the driver only configure the data edge sampling partially. The 
>> AM62 require it to be configured in two distincts registers: one in tidss 
>> and one in the general device registers.
>>
>> Introduce a new dt property to link the proper syscon node from the main 
>> device registers into the tidss driver.
>>
>> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
>> ---
>> Cc: stable@vger.kernel.org
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> I understand why you call this a fix, but I think this is not really a
> fix. From looking at the patches, my understanding is that for DPI
> outputs we have always only supported certain clock/data edge.

I don't think driver makes a distinction between supported/unsupported
or errors out in case it is run with "different" clock/data edge panel
(for e.g  DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE is set per the panel
configuration). Instead it tries to program the VP registers per the
DRM_BUS_FLAG* getting passed by framework per the connected panel and
gives an incorrect behavior if those are different than defaults since
those settings are not sufficient for these displays and instead extra
MMR register settings are also required.

 So this
> series is adding a new feature to the driver.
> 

I think it is a bug due to above mentioned behavior, and good to have a
Fixes tag.

Regards
Devarsh

