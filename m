Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB6BE4E4B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7F410EA74;
	Thu, 16 Oct 2025 17:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uSAD+5cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB0210EA59
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:40:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnZwX3zWhz9tHQ;
 Thu, 16 Oct 2025 19:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760636412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxP0Op2GOPJGCmVQfhpVi9OKM831NuQf5A5nCw+dZv4=;
 b=uSAD+5cfZSmQYp83bqgCZJ2GFHuuQhmPjHL/wN/5mHexJACIMaAVV+lt/vEBlttehdTl28
 eEGLhxwyU7vQRgALRAV8NAQEzMqaJiVtYNBbV2ib9G/rQblwYzxhZZOxWuBiUpr5yD74OG
 N/nf9nemOKlaXVUVo0kriTvuDpV/ik6jDF0IMYpBfNu4OzqHNTkcR/lSnwV+czwWXkrTxR
 T6BnyiZzrG8Xwfrv1a+RPavCsuU7dgc9HBKTfXiH5y90zKUKLtLahQ5S2j/a8ScaDBx8bB
 Srzn/G0HBPbRhDnoTJohEiB7CRI9xQu3XNqYz5kfGWHWvNc09KH0S2WkKb/YLQ==
Message-ID: <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
Date: Thu, 16 Oct 2025 19:39:58 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oisd1xzkoiz1sooehr5hspunmxjz571t
X-MBO-RS-ID: eee63f1da7d39cab528
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

On 10/16/25 8:32 AM, Liu Ying wrote:

Hello Liu,

> +++ b/drivers/gpu/drm/imx/dc/Kconfig
> @@ -1,6 +1,7 @@
>   config DRM_IMX8_DC
>   	tristate "Freescale i.MX8 Display Controller Graphics"
>   	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
> +	depends on IMX_SCU
Can the SCU dependency be made optional, or per-module, or somehow 
abstracted out (via regmap?), so iMX95 support can be added into the 
driver easily too ?

Thank you
