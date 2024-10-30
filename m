Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268EA9B6977
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 17:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262E510E10C;
	Wed, 30 Oct 2024 16:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="nFJ/Pnzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6A210E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 16:45:40 +0000 (UTC)
Message-ID: <f2119a4d-7ba3-4f11-91d7-54aac51ef950@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730306737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IImZ1cZVsIXJIGIFBIuoTjHne0xPtt9XDcxUzdxcbs=;
 b=nFJ/PnzuiZtjPkvI0PKl64gdNlEDUbL7oSAq78a1QvDclqZGoe1La2Ah6XdSp1vzNooun7
 bCwWvVAvHmL8gchTeI60zfM3b/WoGPP/2zLD0EmFLUI0Odu5eYChun3lBUKye2a73LAIIs
 yadQopyWqNnFMUSZFHBPqPAtYd1KtN8=
Date: Thu, 31 Oct 2024 00:45:24 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ux2lfkaeoyakulhllitxraduqjldtxrcmpgsis3us7msixiguq@ff5gfhtkakh2>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ux2lfkaeoyakulhllitxraduqjldtxrcmpgsis3us7msixiguq@ff5gfhtkakh2>
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

On 2024/10/18 23:43, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
>> The assignment of the of_node to the aux bridge needs to mark the
>> of_node as reused as well, otherwise resource providers like pinctrl will
>> report a gpio as already requested by a different device when both pinconf
>> and gpios property are present.
>> Fix that by using the device_set_of_node_from_dev() helper instead.
>>
>> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
>> Cc: stable@vger.kernel.org      # 6.8
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>> Changes in v2:
>> - Re-worded commit to be more explicit of what it fixes, as Johan suggested
>> - Used device_set_of_node_from_dev() helper, as per Johan's suggestion
>> - Added Fixes tag and cc'ed stable
>> - Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
>> ---
>>   drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Technically speaking, your driver just move the burden to its caller.
Because this driver requires its user call drm_aux_bridge_register()
to create an AUX child device manually, you need it call ida_alloc()
to generate a unique id.

Functions symbols still have to leak to other subsystems, which is
not really preserve coding sharing.

What's worse, the action that allocating unique device id traditionally
is the duty of driver core. Why breaks (so called) perfect device driver
model by moving that out of core. Especially in the DT world that the
core knows very well how to populate device instance and manage the
reference counter.

HPD handling is traditionally belongs to connector, create standalone
driver like this one *abuse* to both Maxime's simple bridge driver and
Laurent's display-connector bridge driver or drm_bridge_connector or
whatever. Why those work can't satisfy you? At least, their drivers
are able to passing the mode setting states to the next bridge.

Basically those AUX drivers implementation abusing the definition of
bridge, abusing the definition of connector and abusing the DT.
Its just manually populate instances across drivers.

  

-- 
Best regards,
Sui

