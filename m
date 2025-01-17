Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A5FA15055
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 14:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0705A10EAFA;
	Fri, 17 Jan 2025 13:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="xxoaM2gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEABE10EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 13:13:03 +0000 (UTC)
Message-ID: <8757b595-e1f3-4a04-b201-621237709e3c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1737119582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kEmfvKGroG6EGG4ETw82Z+RqEAdG6vteEmzk4A6OrM=;
 b=xxoaM2ggG6CVzwTzh24CKOUNQghhK40xRzcO4Mu0AQ9K+yC4Ydqlh3EnJDbEXZJWHNvXhv
 zJvakx4rQog5BpZgP+E7WHi5ggWhKjlqy1aKGP2Ou2AspA0E7+RmT6SWnHRLRtucK9U60S
 LUCh/Yu6vsqvbbiYEiyzwPu5F+fgZT4=
Date: Fri, 17 Jan 2025 18:42:11 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v7 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-4-aradhya.bhatia@linux.dev>
 <84ca02de-9788-4e16-bf24-1651bd365ebd@ideasonboard.com>
 <7cfc1561-a229-43e7-b4bf-23ad258733c6@linux.dev>
 <0e0ee18e-28f6-4c57-a47d-cd7ace84fa70@ideasonboard.com>
 <6f7bafba-9b40-491f-bf6b-00094840089c@linux.dev>
 <0157aa47-9901-4f3d-b238-5b0ebeba78be@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <0157aa47-9901-4f3d-b238-5b0ebeba78be@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Tomi,

On 15/01/25 13:47, Tomi Valkeinen wrote:
> Hi,
> 
> On 14/01/2025 18:32, Aradhya Bhatia wrote:
> 
>>> But generally speaking, yes, it's good to keep fixes simple, and do
>>> cleanups later on top. Keeping that in mind, maybe this current patch is
>>> fine as it is. Although... if the init is done in pre_enable, shouldn't
>>> the deinit be done in post_disable?
>>
>> Yes, I will move the deinit to _bridge_post_disable().
>>
>>
>> So, if we keep the fix limited to deinit in _bridge_post_disable(), then
>> the cleanup would involve dropping the init calls from _bridge_enable().
>> And then the patch-12 would do 3 things -
>>
>>     1. Drop older _bridge_pre_enable()
>>     2. Rename old _bridge_enable() to _bridge_pre_enable()
>>     3. Since the _old_ _bridge_enable() has the calls dropped in the
>>        cleanup patch, add those calls again in the _new_
>>        _bridge_pre_enable() (which are really the same function
>>        bodies).
> 
> I would think patch-12 differently: it doesn't do what you list above,
> but rather combines the current pre_enable() and enable() into a new
> pre_enable().

Right, yes!

> 
>> Do you think we can instead skip the cleanup patch, as well as #3 from
>> patch-12?
> 
> Yes, I think the cleanup patch can just be dropped. It's not really
> relevant.
> 
>> Fun fact: We already have patch-4 which fixes the order of init calls in
>> _bridge_enable()! =)
> 
> Right. And I guess that fix doesn't fix anything in practice, as those
> init calls are no-ops in the bridge_enable()...

Yeah, it doesn't do anything... until patch-12 comes back in picture.
So, I shall drop patch-4 too as there's no point in getting that patch
backported. And I will let patch-12 take care of the correct ordering.

> 
> It's a bit difficult to make meaningful fixes when things are so badly
> messed up =).
> 
> So, maybe try to arrange the series so that the obvious "makes-sense"
> fixes for stable are in the beginning. So... patches 1, 3, 5? And then
> work towards the patch 12.
> 

Yes, this sounds good.


Regards
Aradhya

