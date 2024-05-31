Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3C8D63F9
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E310E250;
	Fri, 31 May 2024 14:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="dcdxt/2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E09810E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 14:04:45 +0000 (UTC)
X-Envelope-To: sam@ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1717164282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/qvTrH1SiQj3MlmnfxDD66NKPm741DV2Sf6ZGRQjq0=;
 b=dcdxt/2vKtqS3mvkvS2XwUo4rVK/Gi3jVopqG04THr1VzIf7XXW6pasFPOGn1fuDJAZp3Z
 pM86B8Jg1dR0SbpIP0CqPk90+ackIQKmtNnD+v+Pq8GQ+jUZuXT6gB8/+9qgOksy9sYsAa
 NrKgSHKf79u9c0ljICkoi5d5I1JCESU=
X-Envelope-To: j-choudhary@ti.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: andrzej.hajda@intel.com
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: rfoss@kernel.org
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: a-bhatia1@ti.com
X-Envelope-To: dri-devel@lists.freedesktop.org
Message-ID: <955a6d94-9a4c-4f7d-974c-819261579f14@linux.dev>
Date: Fri, 31 May 2024 22:04:29 +0800
MIME-Version: 1.0
Subject: Re: [v4,1/2] drm/bridge: sii902x: Fix mode_valid hook
To: Sam Ravnborg <sam@ravnborg.org>, Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com,
 dri-devel@lists.freedesktop.org
References: <20240530092930.434026-2-j-choudhary@ti.com>
 <e5ce13e6-1007-41c9-bedc-2045d6f75480@linux.dev>
 <20240531133324.GA1715839@ravnborg.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240531133324.GA1715839@ravnborg.org>
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

Hi, Jayesh


On 5/31/24 21:33, Sam Ravnborg wrote:
> Hi Jayesh,
> 
>>> +
>>>    static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>>>    	.attach = sii902x_bridge_attach,
>>>    	.mode_set = sii902x_bridge_mode_set,
>>> @@ -516,6 +529,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>>>    	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>>    	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
>>>    	.atomic_check = sii902x_bridge_atomic_check,
>>> +	.mode_valid = sii902x_bridge_mode_valid,
> 
> As you have the possibility to test the driver, it would be nice with a
> follow-up patch that replaces the use of enable() / disable() with the
> atomic counterparts.
> 
> enable() / disable() are deprecated, so it is nice to reduce their use.

I agree with Sam.

Please using atomic uniformally with a follow-up patch, the mixed
using of atomic API and non atomic API is a little bit confusing IMO.


> 	Sam
