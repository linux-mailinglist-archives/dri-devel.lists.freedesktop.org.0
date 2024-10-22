Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF09AB508
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 19:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB8B10E209;
	Tue, 22 Oct 2024 17:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="dX5ps/dz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0810E209
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 17:26:10 +0000 (UTC)
Message-ID: <36128d71-a600-4c33-97f6-e694e493b3ee@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729617968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwKPfXU/T50nQaARoPN0RhbbMTvY/JMH3FKeKZmALbM=;
 b=dX5ps/dziD7FZkL1sY7WLDg16LyO3sOEAD+ULmaWNkp2+CyaGUBjErR+pD9yto10olZbDO
 y8GVUxWQD09OgTa+7Mq/zuyuyxin4T5U5V9wBvYX/nGEcMNdmYhLKTHILbdEQu1j+tjrU6
 KWhKiIUJCYmqqzIrFmvOW/ZavIJ1jzw=
Date: Tue, 22 Oct 2024 22:55:38 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v5 07/13] drm/bridge: cdns-dsi: Wait for Clk and Data
 Lanes to be ready
To: Devarsh Thakkar <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019195411.266860-8-aradhya.bhatia@linux.dev>
 <c0784c5e-fc71-64c5-e09f-63e1abd1b61d@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <c0784c5e-fc71-64c5-e09f-63e1abd1b61d@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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



On 22/10/24 11:55, Devarsh Thakkar wrote:
> Hi Aradhya,
> 
> Thanks for the patch.
> 
> On 20/10/24 01:24, Aradhya Bhatia wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> [...]
> 
>> +	/*
>> +	 * Now that the DSI Link and DSI Phy are initialized,
>> +	 * wait for the CLK and Data Lanes to be ready.
>> +	 */
>> +	tmp = CLK_LANE_RDY;
>> +	for (int i = 0; i < nlanes; i++)
>> +		tmp |= DATA_LANE_RDY(i);
>> +
>> +	if (readl_poll_timeout(dsi->regs + MCTL_MAIN_STS, status,
>> +			       status & tmp, 100, 500000))
> 
> The above would mark the condition as true even if one data lane gets ready. I
> think we need to poll until all data lanes are marked as ready. Also good to
> give a warning in case we time out.
> 
> IMHO below should fix this:
>         WARN_ON_ONCE(readl_poll_timeout(dsi->regs + MCTL_MAIN_STS, status,
>                                        (tmp == (status & tmp)), 100, 0));
> 

That's how the condition should be, yes! Thanks for the catch!

I would still prefer to keep dev_err instead of WARN_ON_ONCE, because
the latter stack-dumps during boot once, and then can never be seen
again during multiple modesets. The noise in the dmesg is not worth
the issue either.

With dev_err, it can show a clear print once every time it times out.

-- 
Regards
Aradhya

