Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB8A2C9C4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D7910EB85;
	Fri,  7 Feb 2025 17:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="sVzyMsw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8761410EB85
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:06:36 +0000 (UTC)
Message-ID: <5f05d772-5d25-4b94-8759-95db3e283a6f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738947989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLksYmtV/LGt/QTVyUj/Eiqdx1WVJtDb2zhhPRveb5w=;
 b=sVzyMsw+PCLFyI241R6uxQ3C1W6cBpXLiQUfQFbDCzlMAi4VjyoHKX/YOL5/cMk4dM9GA5
 8a4QS7E4snoI1vvGguhgu14FD7fjN9KNLFEAvL1Cds7x+k2hj2FKrcDt6BhCqOARffRXQZ
 JtmxmwZ4DbHEGjiPY8B7/plBkC4rUIE=
Date: Fri, 7 Feb 2025 12:06:25 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bart Van Assche
 <bvanassche@acm.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-3-sean.anderson@linux.dev>
 <20250207164446.GB24886@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250207164446.GB24886@pendragon.ideasonboard.com>
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

On 2/7/25 11:44, Laurent Pinchart wrote:
> Hi Sean,
> 
> Thank you for the patch.
> 
> On Fri, Feb 07, 2025 at 11:25:28AM -0500, Sean Anderson wrote:
>> Convert most mutex_(un)lock calls to use (scoped_)guard instead. This
>> generally reduces line count and prevents bugs like forgetting to unlock
>> the mutex. I've left traditional calls in a few places where scoped
>> helpers would be more verbose. This mostly happens where
>> debugfs_file_put needs to be called regardless. I looked into defining a
>> CLASS for debugfs_file, but it seems like more effort than it's worth
>> since debugfs_file_get can fail.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - Convert some conditional return statements to returns of ternary
>>   expressions.
>> - Remove unnecessary whitespace change
>> 
>>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
>>  1 file changed, 50 insertions(+), 97 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> index 189a08cdc73c..63842f657836 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> @@ -1534,10 +1534,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
>>  	}
>>  
>>  	/* Check with link rate and lane count */
>> -	mutex_lock(&dp->lock);
>> -	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> -				  dp->link_config.max_lanes, dp->config.bpp);
>> -	mutex_unlock(&dp->lock);
>> +	scoped_guard(mutex, &dp->lock)
>> +		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> +					  dp->link_config.max_lanes,
>> +					  dp->config.bpp);
> 
> Could we use curly braces even for single-statement scopes ?
> 
> 	scoped_guard(mutex, &dp->lock) {
> 		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
> 					  dp->link_config.max_lanes,
> 					  dp->config.bpp);
> 	}
> 
> I think this would make the scope clearer.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

FWIW around 25% of existing scoped_guards use this style, and it seems
to be idiomatic for short scopes:

$ git grep scoped_guard | wc -l
523
$ git grep 'scoped_guard[^{]*$' | wc -l
156
$ git grep -A2 'scoped_guard.*{' | grep } | wc -l
25

--Sean
