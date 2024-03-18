Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D987EFA2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 19:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687DA10F81F;
	Mon, 18 Mar 2024 18:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Gqkr84Fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F79A10F7F7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 18:18:54 +0000 (UTC)
Message-ID: <f3dc3c95-4346-44dd-9e16-3f07a48d4cda@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710785933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/otQP9wuQ97ObgcgvkglDZ4OyfbGb/JcoUbzn/6kn4=;
 b=Gqkr84FwcfkJcaPUYoc6FmB/sxCkr+K2LW3AoDAebeI0ZVVXALJCOItwgYMDreQnoi1Dca
 OoY8tEtf/4q1ZVXJ+8w1dWBm10b2nO1rYBab1+g3V7EcITEsC8V8n9gniw2U1ZXkYXAayf
 LPtfT6CXq5w8nHgsWauwEOfnmnuJPVA=
Date: Tue, 19 Mar 2024 02:18:41 +0800
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


On 2024/3/19 02:04, Laurent Pinchart wrote:
> Hi Sui,
>
> On Tue, Mar 19, 2024 at 12:42:41AM +0800, Sui Jingfeng wrote:
>> On 2024/3/19 00:06, Laurent Pinchart wrote:
>>> Commit 00084f0c01bf ("drm: bridge: thc63lvd1024: Switch to use
>>> of_graph_get_remote_node()") simplified the thc63lvd1024 driver by
>>> replacing hand-rolled code with a helper function.
>> [...]
>>
>>> While doing so, it
>>> created an error code path at probe time without any error message,
>> If this is a reason or a concern, then every drm bridges drivers will suffer from
>> such a concern. Right?
> Yes, bridge drivers (or any driver, really) should avoid failing probe
> silently.


Yes, I agree with you that bridge drivers should avoid failing probe.

But the real problem that deserve to discuss is that is it really *silently* ?

The of_graph_get_remote_node() function do have debug prints on failure:


   - pr_debug("no valid endpoint (%d, %d) for node %pOF\n", port, endpoint, node);
   - pr_debug("no valid remote node\n");
   - pr_debug("not available for remote node\n");

So it is not really *silently*.


