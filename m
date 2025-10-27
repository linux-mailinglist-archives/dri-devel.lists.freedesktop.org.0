Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985DAC0FCC1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C407E10E53E;
	Mon, 27 Oct 2025 17:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="DfT9TLL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B2510E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:54:24 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RHrssW2479401;
 Mon, 27 Oct 2025 12:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761587634;
 bh=gFyTNoE2X2hQrZXZgQ1MBu5TC8MY83aQCzpJALZfkd4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=DfT9TLL1J4E5CSALY/kZQMoepMNVcrZdFJ8G15x4Q9Um4UiFHL4anwgTSzoDcKX1P
 2AOpvzY1e81vSYXz2PEnEreCy/rByPtzdWqPFQattLfXetkj1E4vOmFbyZxBqFzc6A
 HnYhVaehSyU5gmGxes8Pgh7UejjHh3LcA0DPOZgY=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RHrrD81816199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Oct 2025 12:53:53 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 12:53:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 12:53:53 -0500
Received: from [10.249.128.221] ([10.249.128.221])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RHriYB1061461;
 Mon, 27 Oct 2025 12:53:45 -0500
Message-ID: <dcf71d6b-f453-425f-a49e-2408d0caad20@ti.com>
Date: Mon, 27 Oct 2025 23:23:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/tidss: Fixes data edge sampling
To: Louis Chauvet <louis.chauvet@bootlin.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>,
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, "Thakkar, Devarsh" <devarsht@ti.com>
CC: <thomas.petazzoni@bootlin.com>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <stable@vger.kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Hi Louis,

On 30-07-2025 22:32, Louis Chauvet wrote:
> Currently the driver only configure the data edge sampling partially. The
> AM62 require it to be configured in two distincts registers: one in tidss
> and one in the general device registers.
> 
> Introduce a new dt property to link the proper syscon node from the main
> device registers into the tidss driver.
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> ---

We are planning to re-spin the series with a v2.
If you have any concerns please inform.

Regards,
Swamil

> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ---
> Louis Chauvet (4):
>        dt-bindings: display: ti,am65x-dss: Add clk property for data edge synchronization
>        dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
>        arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
>        drm/tidss: Fix sampling edge configuration
> 
>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       |  6 ++++++
>   Documentation/devicetree/bindings/mfd/syscon.yaml          |  3 ++-
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi                   |  6 ++++++
>   drivers/gpu/drm/tidss/tidss_dispc.c                        | 14 ++++++++++++++
>   4 files changed, 28 insertions(+), 1 deletion(-)
> ---
> base-commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13
> change-id: 20250730-fix-edge-handling-9123f7438910
> 
> Best regards,

