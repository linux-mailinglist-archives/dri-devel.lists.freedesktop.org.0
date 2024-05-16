Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E928C7598
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD8510EC88;
	Thu, 16 May 2024 12:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Jz9KZL3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256310EC88
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:05:09 +0000 (UTC)
X-Envelope-To: mripard@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715861107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nP/VHvPc3dOf0DXV1qkgdupWxw+oXTk4mGe1+/VX3u8=;
 b=Jz9KZL3JoC1wxLxUDF0DniOrSN6Oa9QtCy8RPs5S5soJpsPCmqRdDOvVw0gPZyU3tmxlJX
 9RzPCDxidH1qUL6VBA23b6Pyc64uAZzyvAiookDGWlxz/O/kUoNr/D9lVLbaB6+nysBb7U
 NMA0E9gKcB/+hvfVff+X+Vt9LMktlKk=
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <07b931d9-b11f-4829-a6c4-d5025fc071b5@linux.dev>
Date: Thu, 16 May 2024 20:04:59 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
 <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
 <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
 <20240516-intrepid-uptight-tench-0df95e@penduick>
 <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
Content-Language: en-US, en-AU
In-Reply-To: <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
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



On 5/16/24 18:40, Sui Jingfeng wrote:
> use 'to_i2c_client(bridge->dev)' to retrieve the pointer

to_i2c_client(bridge->kdev).

Besides, this also means that we don't need to add the fwnode
pointer into struct drm_bridge as member. Relief the conflicts
with other reviewers if the work of switching to fwnode is still
needed. As for majorities cases (1 to 1), of_node and fwnode can
be retrieved with 'struct device *' easily. The aux-bridge.c and
aux-hdp-bridge.c can also be converted too easily.

of_node, fwnode, swnode and device properties are all belong to
the backing device structure itself. It can be more natural to use 
device_proterty_read_xxx() APIs after init time, Which in turn
avoid the need to acquire and duplicate all properties another
time in the driver private structure.

We could do the programming around the 'struct device *.', remove
a batch of boilerplate.
