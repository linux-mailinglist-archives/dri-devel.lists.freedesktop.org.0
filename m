Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDB9B8A19
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 04:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7320C10E94C;
	Fri,  1 Nov 2024 03:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Y++Ha3+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EA210E94C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 03:49:19 +0000 (UTC)
Message-ID: <30fefafc-d19a-40cb-bcb1-3c586ba8e67e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730432957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aisCwM6KP9qhKb2kb76HEqZmfimYG5W48SHq8fMVq8=;
 b=Y++Ha3+Inw7JOluD44nkAOSKEmpOHi1RI6ERF950vDTo2tE4evJIgqeCCjhUGWnS3wOJLE
 KJLrcTTGP+Ayn1k31dYjysjoFgR/A1qCWb/jV/ZUx5Gngphix6NPathal7tWHsLdSmdcF/
 QK6CmqO46uFanBZJj0jAq2gK7lGlG3c=
Date: Fri, 1 Nov 2024 11:49:07 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Johan Hovold <johan@kernel.org>
Cc: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <751a4ab5-acbf-4e57-8cf4-51ab10206cc9@linux.dev>
 <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZyOvAqnuxbNnGWli@hovoldconsulting.com>
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


On 2024/11/1 00:23, Johan Hovold wrote:
> On Thu, Oct 31, 2024 at 11:06:38PM +0800, Sui Jingfeng wrote:
>
>> But I think Johan do need more times to understand what exactly
>> the real problem is. We do need times to investigate new method.
> No, I know perfectly well what the (immediate) problem is here (I was
> the one adding support for the of_node_reused flag some years back).
>
> I just wanted to make sure that the commit message was correct and
> complete before merging (and also to figure out whether this particular
> patch needed to be backported).


Well under such a design, having the child device sharing the 'OF' device
node with it parent device means that one parent device can *only*
create one AUX bridge child device.

Since If you create two or more child AUX bridge, *all* of them will
call devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0),
then we will *contend* the same next bridge resource.

Because of the 'auxdev->dev.of_node' is same for all its instance.
While other display bridges seems don't has such limitations.


> Johan

-- 
Best regards,
Sui

