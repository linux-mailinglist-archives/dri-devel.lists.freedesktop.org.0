Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61206A15024
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 14:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38710EAE6;
	Fri, 17 Jan 2025 13:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="pArEjGXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D1A10EAF1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 13:07:55 +0000 (UTC)
Message-ID: <f34a0c76-cb61-4c5a-b16c-e6f715f1d048@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1737119272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vk+L5/wjKvymhB96CaUuZqmjix8B8veXegV3r8yTl50=;
 b=pArEjGXs1VyXklZzkySQMIBcjU0P2r6bmEo+gY0UK3jRfi0ol3d7NaTEm1DoEWEEQ1xRw6
 xrXDq5/iYKGxCKa7MQ+8rbjOP0jEpTLzpgAFL4fex0qO+fYPvBxjVPhyVpOE/zGThkQeOV
 699uNkpp4WKsn7oc5REDjRzI9cwNRYk=
Date: Fri, 17 Jan 2025 18:37:00 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
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
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
 <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
Content-Language: en-US
In-Reply-To: <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
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

Hi Dmitry,

On 14/01/25 16:54, Dmitry Baryshkov wrote:
> On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
>> Move the bridge pre_enable call before crtc enable, and the bridge
>> post_disable call after the crtc disable.
>>
>> The sequence of enable after this patch will look like:
>>
>> 	bridge[n]_pre_enable
>> 	...
>> 	bridge[1]_pre_enable
>>
>> 	crtc_enable
>> 	encoder_enable
>>
>> 	bridge[1]_enable
>> 	...
>> 	bridge[n]_enable
>>
>> And, the disable sequence for the display pipeline will look like:
>>
>> 	bridge[n]_disable
>> 	...
>> 	bridge[1]_disable
>>
>> 	encoder_disable
>> 	crtc_disable
>>
>> 	bridge[1]_post_disable
>> 	...
>> 	bridge[n]_post_disable
>>
>> The definition of bridge pre_enable hook says that,
>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>> will not yet be running when this callback is called".
>>
>> Since CRTC is also a source feeding the bridge, it should not be enabled
>> before the bridges in the pipeline are pre_enabled. Fix that by
>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> 
> The patch contains both refactoring of the corresponding functions and
> changing of the order. Please split it into two separate commits.
> 

I assume that you already understand this, so this is just for the
record -

There is no trivial way to do this. Initially, this is what I had in my
mind - about what the split patches would look like.

#1
 * refactoring of entire loops into separate functions.
 * Separate out the pre_enable and enable operations inside the
   encoder_bridge_enable().
 * call them in their (seemingly) original sequences
	- crtc_enable
	- encoder_bridge_enable(pre_enable)
	- encoder_bridge_enable(!pre_enable)

#2
 * rearrange the calls to re-order the operation
	- encoder_bridge_enable(pre_enable)
	- crtc_enable
	- encoder_bridge_enable(!pre_enable)

This would have made the patch#2 seem quite trivial, as patch#1 would
take the brunt of changes, while keeping the functionality intact.


What I have now realized is that, the above isn't possible,
unfortunately. The moment we separate out pre_enable and enable into 2
different calls, the overall sequence gets even changed when there are
multiple pipelines in the system.

So to implement the split properly, the first patch would look like this

#1
 * refactoring of entire loops into separate functions.
 * The calling sequences will be as follows -
 	- crtc_enable()
	- encoder_bridge_enable()
		- this will do both pre_enable and enable
		  unconditionally.

The pre_enable and enable operations wouldn't be separated in patch 1,
just that the crtc enable and encoder bridge pre_enable/enable loops
would be put into individual functions.

The next patch will then introduce booleans, and separate out pre_enable
and enable, and implement the new order -

#2
 * pre_enable and enable operations will be conditionally segregated
   inside encoder_bridge_enable(), based on the pre_enable boolean.
 * The calling sequences will then be updated to -
	- encoder_bridge_enable(pre_enable)
	- crtc_enable()
	- encoder_bridge_enable(!pre_enable)

This wouldn't be all that much trivial as I had imagined it to be earlier.

It would also *kind of* like these patches in a previous revision,
v5:11/13 [0], and v5:12/13 [1]. The only differences being,

1) these older patches separated out only the bridge/encoder operations
into a function, and not the crtc operations, and

2) An enum is being used instead of the booleans.


I believe this is what you are looking for? If I have misunderstood
something, do let me know.


Regards
Aradhya


[0]: v5:11/13
drm/atomic-helper: Separate out Encoder-Bridge enable and disable
https://lore.kernel.org/all/20241019200530.270738-4-aradhya.bhatia@linux.dev/

[1]: v5:12/13
drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
https://lore.kernel.org/all/20241019200530.270738-5-aradhya.bhatia@linux.dev/

