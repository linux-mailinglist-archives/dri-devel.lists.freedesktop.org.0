Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF184220E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEEE10F791;
	Tue, 30 Jan 2024 10:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17631112EB7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:57:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5586764bd0aso1308803a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706612171; x=1707216971; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2TXZDGxev8OVEdUa3u269z2er2UYx76tbkrvbJh7/+Q=;
 b=HjqbBurquqk++e7s58n9PO1w/QNaX7yTXrsHkXTFn0AQtngUe7fQKvxvJW5yNAcvIn
 qMM3rIaxehEc2yQwY8MVv5KdBTmj8WcYpiEh3el1D5UE6YYjOSQOj1eyi9fSyJrhhr00
 nokfliN2qpdw5+PeA67f5VvWlnUHT3qNKbmjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706612171; x=1707216971;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2TXZDGxev8OVEdUa3u269z2er2UYx76tbkrvbJh7/+Q=;
 b=X5yLgaahIv2cbjiXx7grZFq84gr80ohgRfuAnCGXGoidHnTRU/S+u//a3ORZJo60uX
 EO3eHiiIHdni//jJGrB8ZgpHafZfdRUusrL4pNc0IrXUiTe9/KvmvcbZ6coMXy75e/TL
 GlVj1hAzsir7tJJcK0nt9w8209pMnCZc6+QDE3I7bGyrUjK0a5um5B9LNtnEtpmSq7du
 vAB7ZYWoBxVZDN78yQiG3bshkRg7UZI69cV0bs71PAT82S0c7PTewAEezThN0gD7Wo23
 0FkO4bOm08LeyfOS79YcV66bHVq4NxPZFW32DCYI1c6PMwp2678MvKtz2HJAeRWU//KN
 /Fqg==
X-Gm-Message-State: AOJu0Yy7lC4ZIsrHtehTanZH6xQFZtLdoBBCK4ng3LxtoFS7KFmL6HQf
 xg9Pv7LLY8ZIlel45DgBRaW/bQvGO28hweAoq1N8XbEA96t4g/lpyOaNy6Kqnvs=
X-Google-Smtp-Source: AGHT+IEmRvzVfbJKZFBWvLCAjNWV62XCb3c1qog+KmIBbatVe/zixV4QihWOh0gfeKEzA4K+n1J4xQ==
X-Received: by 2002:a17:906:3e05:b0:a36:3e9b:c77e with SMTP id
 k5-20020a1709063e0500b00a363e9bc77emr235076eji.0.1706612171272; 
 Tue, 30 Jan 2024 02:56:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ss6-20020a170907c00600b00a3535b76c42sm4058309ejc.15.2024.01.30.02.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:56:10 -0800 (PST)
Date: Tue, 30 Jan 2024 11:56:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v3 3/3] drm/amdgpu: Implement check_async_props for planes
Message-ID: <ZbjVyI_AnTBHACT8@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
References: <20240128212515.630345-1-andrealmeid@igalia.com>
 <20240128212515.630345-4-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240128212515.630345-4-andrealmeid@igalia.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: daniel@ffwll.ch, 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Joshua Ashton <joshua@froggi.es>,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 28, 2024 at 06:25:15PM -0300, André Almeida wrote:
> AMD GPUs can do async flips with changes on more properties than just
> the FB ID, so implement a custom check_async_props for AMD planes.
> 
> Allow amdgpu to do async flips with overlay planes as well.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3: allow overlay planes

This comment very much written with a lack of clearly better ideas, but:

Do we really need this much flexibility, especially for the first driver
adding the first few additional properties?

A simple bool on struct drm_plane to indicate whether async flips are ok
or not should also do this job here? Maybe a bit of work to roll that out
to the primary planes for current drivers, but not much. And wouldn't need
drivers to implement some very uapi-marshalling atomic code ...

Also we could probably remove the current drm_mode_config.async_flip flag
and entirely replace it with the per-plane one.
-Sima
> 
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 116121e647ca..ed75b69636b4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -25,6 +25,7 @@
>   */
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
>  	drm_atomic_helper_plane_destroy_state(plane, state);
>  }
>  
> +static int amdgpu_dm_plane_check_async_props(struct drm_property *prop,
> +					  struct drm_plane *plane,
> +					  struct drm_plane_state *plane_state,
> +					  struct drm_mode_object *obj,
> +					  u64 prop_value, u64 old_val)
> +{
> +	struct drm_mode_config *config = &plane->dev->mode_config;
> +	int ret;
> +
> +	if (prop != config->prop_fb_id &&
> +	    prop != config->prop_in_fence_fd) {
> +		ret = drm_atomic_plane_get_property(plane, plane_state,
> +						    prop, &old_val);
> +		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> +	}
> +
> +	if (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY &&
> +	    plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY) {
> +		drm_dbg_atomic(prop->dev,
> +			       "[OBJECT:%d] Only primary or overlay planes can be changed during async flip\n",
> +			       obj->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_plane_funcs dm_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> @@ -1438,6 +1466,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>  	.atomic_duplicate_state = amdgpu_dm_plane_drm_plane_duplicate_state,
>  	.atomic_destroy_state = amdgpu_dm_plane_drm_plane_destroy_state,
>  	.format_mod_supported = amdgpu_dm_plane_format_mod_supported,
> +	.check_async_props = amdgpu_dm_plane_check_async_props,
>  };
>  
>  int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
