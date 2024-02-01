Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC684602B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 19:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07E310EEAD;
	Thu,  1 Feb 2024 18:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l4Q1wIE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A44810EEAD;
 Thu,  1 Feb 2024 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ex/8JouqRMpIKRvJ6xx0/vd1ATPxG3ZxEx1H8eQh0+c=; b=l4Q1wIE0JWRulV/Ug7r3ssNTto
 53QQtjPCW7I09vWPRH6O803wXDqSmNmxocukZu6wLEPByeSsZl026MFHqtC1kBO2SsH97JfSFf24e
 LwfeSJnZCBYc5u4pmYCtJSW4bq2k/sapgdaCe1LDpyZnDVzWo7jpV3Md9A/djQ/JLQYoF4pJVm3hl
 wJlqLMX3D5c5G8P7ctORhHtbgV0pBItHcbH2X3zHKx3DfmlLKwPC8Xuh1w86dJ19DQ4xLGQN1h6OF
 JTj0QkZgaIwKQsgIoIvWEDwITncgDjEuzBSFAEplLC9LclLCWwO5tNt4hHNZWC9yyAFt3jwMR/Qu0
 TAUvOXIw==;
Received: from [189.110.59.13] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rVc1X-00Cgwx-SA; Thu, 01 Feb 2024 19:42:56 +0100
Message-ID: <a382b75d-4254-419c-aab5-a01eed845df1@igalia.com>
Date: Thu, 1 Feb 2024 15:42:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/atomic: Allow drivers to write their own plane
 check for async flips
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, daniel@ffwll.ch,
 Daniel Stone <daniel@fooishbar.org>, =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?=
 <maraeo@gmail.com>, Dave Airlie <airlied@gmail.com>,
 ville.syrjala@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>
References: <20240128212515.630345-1-andrealmeid@igalia.com>
 <20240128212515.630345-2-andrealmeid@igalia.com>
 <20240129104934.0b887ec7@eldfell>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240129104934.0b887ec7@eldfell>
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

Hi Pekka,

Em 29/01/2024 05:49, Pekka Paalanen escreveu:
> On Sun, 28 Jan 2024 18:25:13 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
> 
>> Some hardware are more flexible on what they can flip asynchronously, so
>> rework the plane check so drivers can implement their own check, lifting
>> up some of the restrictions.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v3: no changes
>>
>>   drivers/gpu/drm/drm_atomic_uapi.c | 62 ++++++++++++++++++++++---------
>>   include/drm/drm_atomic_uapi.h     | 12 ++++++
>>   include/drm/drm_plane.h           |  5 +++
>>   3 files changed, 62 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index aee4a65d4959..6d5b9fec90c7 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -620,7 +620,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>>   	return 0;
>>   }
>>   
>> -static int
>> +int
>>   drm_atomic_plane_get_property(struct drm_plane *plane,
>>   		const struct drm_plane_state *state,
>>   		struct drm_property *property, uint64_t *val)
>> @@ -683,6 +683,7 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>>   
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL(drm_atomic_plane_get_property);
>>   
>>   static int drm_atomic_set_writeback_fb_for_connector(
>>   		struct drm_connector_state *conn_state,
>> @@ -1026,18 +1027,54 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
>>   	return ret;
>>   }
>>   
>> -static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
>> +int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
> 
> Hi,
> 
> should the word "async" be somewhere in the function name?
> 
>>   					 struct drm_property *prop)
>>   {
>>   	if (ret != 0 || old_val != prop_value) {
>>   		drm_dbg_atomic(prop->dev,
>> -			       "[PROP:%d:%s] No prop can be changed during async flip\n",
>> +			       "[PROP:%d:%s] This prop cannot be changed during async flip\n",
>>   			       prop->base.id, prop->name);
>>   		return -EINVAL;
>>   	}
>>   
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL(drm_atomic_check_prop_changes);
>> +
>> +/* plane changes may have exceptions, so we have a special function for them */
>> +static int drm_atomic_check_plane_changes(struct drm_property *prop,
>> +					  struct drm_plane *plane,
>> +					  struct drm_plane_state *plane_state,
>> +					  struct drm_mode_object *obj,
>> +					  u64 prop_value, u64 old_val)
>> +{
>> +	struct drm_mode_config *config = &plane->dev->mode_config;
>> +	int ret;
>> +
>> +	if (plane->funcs->check_async_props)
>> +		return plane->funcs->check_async_props(prop, plane, plane_state,
>> +							     obj, prop_value, old_val);
> 
> Is it really ok to allow drivers to opt-in to also *reject* the FB_ID
> and IN_FENCE_FD props on async commits?
> 
> Either intentionally or by accident.
> 

Right, perhaps I should write this function in a way that you can only 
lift restrictions, and not add new ones.

>> +
>> +	/*
>> +	 * if you are trying to change something other than the FB ID, your
>> +	 * change will be either rejected or ignored, so we can stop the check
>> +	 * here
>> +	 */
>> +	if (prop != config->prop_fb_id) {
>> +		ret = drm_atomic_plane_get_property(plane, plane_state,
>> +						    prop, &old_val);
>> +		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> 
> When I first read this code, it seemed to say: "If the prop is not
> FB_ID, then do the usual prop change checking that happens on all
> changes, not only async.". Reading this patch a few more times over, I
> finally realized drm_atomic_check_prop_changes() is about async
> specifically.
> 

I see that the lack of the async word is giving some confusion, so I'll 
add it to the functions.

Thanks,
	André

>> +	}
>> +
>> +	if (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> +		drm_dbg_atomic(prop->dev,
>> +			       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
>> +			       obj->id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>>   
>>   int drm_atomic_set_property(struct drm_atomic_state *state,
>>   			    struct drm_file *file_priv,
>> @@ -1100,7 +1137,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   	case DRM_MODE_OBJECT_PLANE: {
>>   		struct drm_plane *plane = obj_to_plane(obj);
>>   		struct drm_plane_state *plane_state;
>> -		struct drm_mode_config *config = &plane->dev->mode_config;
>>   
>>   		plane_state = drm_atomic_get_plane_state(state, plane);
>>   		if (IS_ERR(plane_state)) {
>> @@ -1108,19 +1144,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>>   			break;
>>   		}
>>   
>> -		if (async_flip && prop != config->prop_fb_id) {
>> -			ret = drm_atomic_plane_get_property(plane, plane_state,
>> -							    prop, &old_val);
>> -			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
>> -			break;
>> -		}
>> -
>> -		if (async_flip && plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> -			drm_dbg_atomic(prop->dev,
>> -				       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
>> -				       obj->id);
>> -			ret = -EINVAL;
>> -			break;
>> +		if (async_flip) {
>> +			ret = drm_atomic_check_plane_changes(prop, plane, plane_state,
> 
> Should there be "async" somewhere in the name of
> drm_atomic_check_plane_changes()?
> 
> 
> Thanks,
> pq
> 
>> +							     obj, prop_value, old_val);
>> +			if (ret)
>> +				break;
>>   		}
>>   
>>   		ret = drm_atomic_plane_set_property(plane,
>> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
>> index 4c6d39d7bdb2..d65fa8fbbca0 100644
>> --- a/include/drm/drm_atomic_uapi.h
>> +++ b/include/drm/drm_atomic_uapi.h
>> @@ -29,6 +29,8 @@
>>   #ifndef DRM_ATOMIC_UAPI_H_
>>   #define DRM_ATOMIC_UAPI_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct drm_crtc_state;
>>   struct drm_display_mode;
>>   struct drm_property_blob;
>> @@ -37,6 +39,9 @@ struct drm_crtc;
>>   struct drm_connector_state;
>>   struct dma_fence;
>>   struct drm_framebuffer;
>> +struct drm_mode_object;
>> +struct drm_property;
>> +struct drm_plane;
>>   
>>   int __must_check
>>   drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
>> @@ -53,4 +58,11 @@ int __must_check
>>   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>   				  struct drm_crtc *crtc);
>>   
>> +int drm_atomic_plane_get_property(struct drm_plane *plane,
>> +				  const struct drm_plane_state *state,
>> +				  struct drm_property *property, uint64_t *val);
>> +
>> +int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t prop_value,
>> +				  struct drm_property *prop);
>> +
>>   #endif
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index c6565a6f9324..73dac8d76831 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -540,6 +540,11 @@ struct drm_plane_funcs {
>>   	 */
>>   	bool (*format_mod_supported)(struct drm_plane *plane, uint32_t format,
>>   				     uint64_t modifier);
>> +
>> +	int (*check_async_props)(struct drm_property *prop, struct drm_plane *plane,
>> +				 struct drm_plane_state *plane_state,
>> +				 struct drm_mode_object *obj,
>> +				 u64 prop_value, u64 old_val);
>>   };
>>   
>>   /**
> 
