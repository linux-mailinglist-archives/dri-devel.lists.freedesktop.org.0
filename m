Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3384603D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 19:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90610F1DB;
	Thu,  1 Feb 2024 18:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bxu9L7ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B4410F038;
 Thu,  1 Feb 2024 18:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=H2N1LRFRb5K1bZEyZiUexexQH3bssy46zqFCMiG0Q8c=; b=bxu9L7ar1fY4SwmcfQVQl368HJ
 JXUaJDADNMchZOlitOhwgj0SsbeVw4C7YqZXJqS2GQ/L8WHN8Gzekv/3gbGXQrrZVqePrlZPjqi/N
 WCCgRDT7Nuqwm1ZLuZ/T2aX1tRxLaxy/BEOWKtvXHNn7upW90BjIcfi4sSxi8zayXqAORtIbJQj8e
 OOH9AtLkrU3nlYrGQ1+kc62GQEn7fMhAnLp81Nc8rqEac7/nraqIZghAf4oCIkuLKo4IEyYAVFoH9
 ME/cYzNNN4D3I6T4fOBlSmUkU0xzDrlu4l4W1xBAl3KU1MJWOWBDr51fTpcmKivOfnlTQ26Z9GoNt
 jEtlNM6g==;
Received: from [189.110.59.13] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rVc4P-00Ch1g-G0; Thu, 01 Feb 2024 19:45:53 +0100
Message-ID: <203d7768-2e54-4d89-9a1d-ef61e6da6d89@igalia.com>
Date: Thu, 1 Feb 2024 15:45:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/amdgpu: Implement check_async_props for planes
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240128212515.630345-1-andrealmeid@igalia.com>
 <20240128212515.630345-4-andrealmeid@igalia.com>
 <ZbjVyI_AnTBHACT8@phenom.ffwll.local>
Cc: kernel-dev@igalia.com, Xaver Hugl <xaver.hugl@gmail.com>,
 ville.syrjala@linux.intel.com, Joshua Ashton <joshua@froggi.es>,
 Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com,
 alexander.deucher@amd.com, =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?=
 <maraeo@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <ZbjVyI_AnTBHACT8@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Sima,

Em 30/01/2024 07:56, Daniel Vetter escreveu:
> On Sun, Jan 28, 2024 at 06:25:15PM -0300, André Almeida wrote:
>> AMD GPUs can do async flips with changes on more properties than just
>> the FB ID, so implement a custom check_async_props for AMD planes.
>>
>> Allow amdgpu to do async flips with overlay planes as well.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v3: allow overlay planes
> 
> This comment very much written with a lack of clearly better ideas, but:
> 
> Do we really need this much flexibility, especially for the first driver
> adding the first few additional properties?
> 
> A simple bool on struct drm_plane to indicate whether async flips are ok
> or not should also do this job here? Maybe a bit of work to roll that out
> to the primary planes for current drivers, but not much. And wouldn't need
> drivers to implement some very uapi-marshalling atomic code ...

Right, perhaps I can first write in the way you suggest, and later 
expand to the form I have proposed here if/when new properties arise.

> 
> Also we could probably remove the current drm_mode_config.async_flip flag
> and entirely replace it with the per-plane one.
> -Sima
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 116121e647ca..ed75b69636b4 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -25,6 +25,7 @@
>>    */
>>   
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_blend.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane_helper.h>
>> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
>>   	drm_atomic_helper_plane_destroy_state(plane, state);
>>   }
>>   
>> +static int amdgpu_dm_plane_check_async_props(struct drm_property *prop,
>> +					  struct drm_plane *plane,
>> +					  struct drm_plane_state *plane_state,
>> +					  struct drm_mode_object *obj,
>> +					  u64 prop_value, u64 old_val)
>> +{
>> +	struct drm_mode_config *config = &plane->dev->mode_config;
>> +	int ret;
>> +
>> +	if (prop != config->prop_fb_id &&
>> +	    prop != config->prop_in_fence_fd) {
>> +		ret = drm_atomic_plane_get_property(plane, plane_state,
>> +						    prop, &old_val);
>> +		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
>> +	}
>> +
>> +	if (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY &&
>> +	    plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY) {
>> +		drm_dbg_atomic(prop->dev,
>> +			       "[OBJECT:%d] Only primary or overlay planes can be changed during async flip\n",
>> +			       obj->id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_plane_funcs dm_plane_funcs = {
>>   	.update_plane	= drm_atomic_helper_update_plane,
>>   	.disable_plane	= drm_atomic_helper_disable_plane,
>> @@ -1438,6 +1466,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>>   	.atomic_duplicate_state = amdgpu_dm_plane_drm_plane_duplicate_state,
>>   	.atomic_destroy_state = amdgpu_dm_plane_drm_plane_destroy_state,
>>   	.format_mod_supported = amdgpu_dm_plane_format_mod_supported,
>> +	.check_async_props = amdgpu_dm_plane_check_async_props,
>>   };
>>   
>>   int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>> -- 
>> 2.43.0
>>
> 
