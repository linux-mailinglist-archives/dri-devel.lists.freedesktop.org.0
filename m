Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE187F05F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB6D10E3C5;
	Mon, 18 Mar 2024 19:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="mikmlv6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A9610FDEB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:24:05 +0000 (UTC)
Message-ID: <9d894bd2-c92e-4d08-8643-be88a203879c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710789843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BI/HR4kmZi9eYYX3fHtixI9MLag8g+58iGjeaGFJliE=;
 b=mikmlv6l59xdwDI+K3W4JMFjCmjyhCthwimWorGvm3wtWONQ6R499oW56ByIit2kuJquik
 AGyltIo6L4rU7njDzYDmJUdNU2kKYu67RxbKdvjVGqJ1yxkv8J3BdkDzFMgv2qHdX2olOT
 4qzmqCRgUXjvHEMFFTqFFJnb2PyL6po=
Date: Tue, 19 Mar 2024 03:23:54 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
 <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
 <20240318180420.GP13682@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240318180420.GP13682@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,


On 2024/3/19 02:04, Laurent Pinchart wrote:
> Improving core helpers is certainly a good idea, and if we do so, we can
> simplify drivers. What I'm concerned is that commit 00084f0c01bf creates
> a silent probe failure path,


No, I can't agree here. It doesn't creates a silent probe failure path.

Simply because

1) It is NOT silent.
2) It should be exist at product level kernel.


> which didn't exist before it.


Again, it shouldn't be exist.

Otherwise it hints us that there is ill-behavior-ed DT in the mainstream kernel
or a specific product(or development board). If I were you, I would like to fix
the boot failure first.

In the earlier stage of my attempt to contribute, I also would like to enable
debug output as much as possible. Just like you, the benefit is obvious: It really
eliminate the pain on developing stage and when bugs happens.

But I was told many many times that mainstream kernel is not for debug, it is
for sound products. I bet you have seen some product level drivers print very less.
I'm not understand why in the past, but I think I could understand something now.
Probably because professional programmers really confident about what they have
wrote. As they have been tested and/or reviewed thousands or ten thousands times.

Enable this debug output by default can only prove to the community that you are
not confident about something, either the community's reviewing power on DTS or
your debug techniques.


> This is why
> this patch references it in the Fixes: tag, making sure that this patch
> will get backported to any stable kernel that includes commit
> 00084f0c01bf.


No, I keep insist on my judgement. A fixes tag is only meant for cases where your
patch fixes a bug. The bug should really be happened. All of the discussion ongoing
here are just things imaginary about the *debug* phase and development phase.


>   As far as I understand, this is business as usual. There's
> nothing personal here, and no judgement on the quality of your code.
>
Please don't misunderstanding, I do cares the quality of my code.
If it is really introduce a bug, I will responsible and help to solve.
But this is not the case. Sorry.


>>> Signed-off-by: Laurent Pinchart<laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>    drivers/gpu/drm/bridge/thc63lvd1024.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
>>> index 5f99f9724081..674efc489e3a 100644
>>> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
>>> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
>>> @@ -125,8 +125,11 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>>>    
>>>    	remote = of_graph_get_remote_node(thc63->dev->of_node,
>>>    					  THC63_RGB_OUT0, -1);
>>> -	if (!remote)
>>> +	if (!remote) {
>>> +		dev_err(thc63->dev, "No remote endpoint for port@%u\n",
>>> +			THC63_RGB_OUT0);
>>>    		return -ENODEV;
>>> +	}
>>>    

An side effect of this patch is that we will add one more extra error message in the console.
As the of_graph_get_remote_node() function already print one for us if I add '#define DEBUG 1'
on the top of this source file. What's worse, it does not really tell us what's really the
error is.

It could be no valid endpoint or no valid remote node because of bad coding in DT, or It is
also simply because the remove node(or device) is being disabled intentionally by adding
'status = "disabled"' clause. Therefore, the error printing code added here is very confusing
in practice. It cannot really help for locating the root cause of the problem.

After think about this more than twice, either help to improve the core of_graph_get_remote_node()
function or just to drop this. This what I can tell as a ordinary reviewer. Despite you and/or
other more advanced programmer & reviewer could override what I said though.

-- 
Best regards,
Sui

>>>    	thc63->next = of_drm_find_bridge(remote);
>>>    	of_node_put(remote);
>>>
>>> base-commit: 00084f0c01bf3a2591d007010b196e048281c455

-- 
Best regards,
Sui

