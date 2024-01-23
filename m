Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F257883886C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 09:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82210EDBC;
	Tue, 23 Jan 2024 08:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDF810EC57
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 08:02:07 +0000 (UTC)
Message-ID: <c999fed3-b6bd-4499-b508-cf524372fbdb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705996896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67l2M1HaeJ+asThnndVHn1G09ODvFjMH6pEAjXPnAkg=;
 b=doQx0DWesFQKU/CE1PDURDBvCPxCb7YfllzioaQOBRIsFdY397G2ZWkKxHSaXTuqeVM5s8
 aIvjbLok1ldH19qjGp73DIBiZ3cTqysEVZAIHBlyZar5pQ+ugoepzakApSyGTadLiBuGUe
 WYD72Jv4zZg0Kcy93h4vdPjAtTA6Of4=
Date: Tue, 23 Jan 2024 16:01:28 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] drm/bridge: Add drm_bridge_find_by_fwnode() helper
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-2-sui.jingfeng@linux.dev>
 <20240123011710.GA22880@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240123011710.GA22880@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Thanks a lot for your review :-)


On 2024/1/23 09:17, Laurent Pinchart wrote:
> Hi Sui,
>
> Thank you for the patch.
>
> On Tue, Jan 23, 2024 at 12:32:16AM +0800, Sui Jingfeng wrote:
>> Because ACPI based systems only has the fwnode associated, the of_node
>> member of struct device is NULL. To order to move things forward, we add
>> drm_bridge_find_by_fwnode() to extend the support.
>>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Could we switch completely to fwnode, instead of maintaining the fwnode
> and OF options side-by-side ?


The side-by-side approach allow us to migrate smoothly,
the main consideration is that the OF approach has been
works very well, it is flexible and very successful in
the embedded world.

It seems that the fwnode API could NOT replace the OF
options completely. For example, the'of_device_id' and 'of_match_table' related things are always there, there
are large well-established helpers and subroutines and
already formed as a standard. Some part of it may suffer
from backward compatibility problems.

So I want to leave some space to other programmers.
Maybe there are other programmers who feel that using
OF alone is enough for a specific problem(domain).

