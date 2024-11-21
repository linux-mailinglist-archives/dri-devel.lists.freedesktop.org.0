Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5589D468C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 05:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6E610E856;
	Thu, 21 Nov 2024 04:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Z47VNZrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E3810E856
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 04:16:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6131789634;
 Thu, 21 Nov 2024 05:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732162589;
 bh=/h+Aqf+FUd6Y7eBOAWkUFVG4S9BbIuewS7MSwsHNJ0U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z47VNZrjkXdRpTnkUBfyeS+GzuPm3YNuXhwk4wB3lz3abLpC5KL+scqK74W7Qk6y2
 Ykr9H/DHfjCHTHs4j0YoPjoj+Fb3BioGcvxQXmbexmKYeR8atLfkVNsyA5rr600KlS
 GpFsOwPSmL9PQMEczOJRqQDKGz/93fO0sovc7vN7FLrey6j0cyuN6jgUZP8KtQeO2/
 1FH6gk2or/Btc9F9JdpgirEgjHGTjOR9Xj9lIIXz/qI5KVnDhPBbfrzTOV0wdyBqF5
 lEXsCO+3TQaC5xG7dcbbVKJI/A3LOlw9OMnhQsmLcMNdeDAf4ZcTe5Gw0WqpVUVKzl
 nqjaRa7D319qg==
Message-ID: <5f56ac1e-7b88-4962-838f-66dbac292828@denx.de>
Date: Thu, 21 Nov 2024 03:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
 <1f5e9559-59f8-490b-9cb2-2f8d4a8823e6@denx.de>
 <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

I'll stop this thread, let's continue the discussion in one place in:

[PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp pixel 
clock reconfigure parent rate"
