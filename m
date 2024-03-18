Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC587EDC0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A1010FBE7;
	Mon, 18 Mar 2024 16:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="AX63a+kB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091D010FBE7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:42:50 +0000 (UTC)
Message-ID: <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710780167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mFJhectMKyyv+mDkyCwQ1wrH9WhYP//U5v/xFlBL90=;
 b=AX63a+kByNR2kqUjV2BuBBwSAe5K8vqrPqtF3Ew914/yjt3YvpguXUdYvyYr3SUpFjC8zo
 uuv9qASDYtjqjs5U9gx3Q8PTAH2Dz4JLP9HODhxI1PqAcOPiM3TpUGOcbjjwucSDAJjlnh
 rf5TtVp/I3HLy7SGD5vmz8WCGmFWV6s=
Date: Tue, 19 Mar 2024 00:42:41 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,


On 2024/3/19 00:06, Laurent Pinchart wrote:
> Commit 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use
> of_graph_get_remote_node()") simplified the thc63lvd1024 driver by
> replacing hand-rolled code with a helper function.


[...]


> While doing so, it
> created an error code path at probe time without any error message,

If this is a reason or a concern, then every drm bridges drivers will suffer from
such a concern. Right?


> potentially causing probe issues that get annoying to debug.

Sorry, let's keep it fair enough, it creates nothing annoyed.

If there is a probe issues, then, it is caused by ill-behavioral DT.
*NOT* my patch. And should be found during review stage.

If the of_graph_get_remote_node() function is not good enough,
I suggest to improve the of_graph_get_remote_node() function,
then all callers of it will benefits.

Well, the strong word here just terrifying new programmers to call
core function helpers. Please use more *soft* description in the
commit message.


> Fix it by
> adding an error message.
>
> Fixes: 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()")


Please drop the fixes tag at here, append the tag to a real bug-fix patch will make more sense imo.
I suggest to improve the of_graph_get_remote_node() function, then all callers of it will benefits.
NOT a single implement like this.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/bridge/thc63lvd1024.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index 5f99f9724081..674efc489e3a 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -125,8 +125,11 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>   
>   	remote = of_graph_get_remote_node(thc63->dev->of_node,
>   					  THC63_RGB_OUT0, -1);
> -	if (!remote)
> +	if (!remote) {
> +		dev_err(thc63->dev, "No remote endpoint for port@%u\n",
> +			THC63_RGB_OUT0);
>   		return -ENODEV;
> +	}
>   
>   	thc63->next = of_drm_find_bridge(remote);
>   	of_node_put(remote);
>
> base-commit: 00084f0c01bf3a2591d007010b196e048281c455

-- 
Best regards,
Sui

