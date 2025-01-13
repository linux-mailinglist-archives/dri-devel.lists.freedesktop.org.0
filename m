Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D3A0BC55
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9FD10E6E6;
	Mon, 13 Jan 2025 15:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Nlz5vOJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62B310E6E6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:44:41 +0000 (UTC)
Message-ID: <c939bbf4-2cde-4897-8ccd-b8d2420fa9b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736783050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Phc0agFb9IGS06byHBV7HOmGEG8Ax1qwKhDEggT62bI=;
 b=Nlz5vOJ8zE7NeizUi4cNzdyq3VcgQGaV+RlxIKCMswKwryJcWflchQ0SixW67SVnI71cUP
 4M6BQCMtBb7i0lgJFN8wj5QBH+Av4oIHiGFKxzpTz0VWvfFSV8JfkMVp20+BID2Gr0zgHl
 NXFhziocZ+sb7TSb4GJ+3l/JDi/e6wY=
Date: Mon, 13 Jan 2025 21:14:02 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v6 10/12] drm/bridge: cdns-dsi: Move DSI mode check to
 _atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-11-aradhya.bhatia@linux.dev>
 <nlrgtmnbkfupr5h7rawogrzw3lqi7hqmyq2d3u2wew7ojx7phn@6kw7vcz2yjny>
Content-Language: en-US
In-Reply-To: <nlrgtmnbkfupr5h7rawogrzw3lqi7hqmyq2d3u2wew7ojx7phn@6kw7vcz2yjny>
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



On 1/13/25 14:43, Dmitry Baryshkov wrote:
> On Sun, Jan 12, 2025 at 12:57:36AM +0530, Aradhya Bhatia wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> At present, the DSI mode configuration check happens during the
>> _atomic_enable() phase, which is not really the best place for this.
>> Moreover, if the mode is not valid, the driver gives a warning and
>> continues the hardware configuration.
>>
>> Move the DSI mode configuration check to _atomic_check() instead, which
>> can properly report back any invalid mode, before the _enable phase even
>> begins.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> ---
>>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 87 +++++++++++++++++--
>>  .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  1 +
>>  2 files changed, 83 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
>> index 5db5dbbbcaad..b785df45bc59 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
>> @@ -77,6 +77,7 @@ struct cdns_dsi {
>>  	bool link_initialized;
>>  	bool phy_initialized;
>>  	struct phy *dphy;
>> +	struct cdns_dsi_cfg dsi_cfg;
> 
> Is this still something necessary / useful? I think the point was to
> move dsi_cfg to the state, while this is a non-state struct.

No, this isn't necessary. This is a stray piece of code. Looks like I
missed it. Thank you! I will drop this in the next revision.

Regards
Aradhya

> 
>>  };
>>  
>>  #endif /* !__CDNS_DSI_H__ */
>> -- 
>> 2.34.1
>>
> 
