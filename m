Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09183ABE4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 15:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF610E6B6;
	Wed, 24 Jan 2024 14:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1074 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jan 2024 14:32:47 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C72510E6B6;
 Wed, 24 Jan 2024 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KSCRQ8Cern7/I4IZd68USYEPrfyEIj1eh/gSvT2+TPU=; b=erz5NwxgWEGVusRpKvzE5vQ4b8
 bE/65fMuNzDQuoHMN3o9guy3LZnX59cNLY7KzL2HIs0BCIOLcsUi0TMcJ7VunM/NdyJQOlR4biefv
 OyKRB2k8vjp743kGgWu7a4uRAt1+BTrrmqG6Wlq5MHeruGJyOV8jztHPHCPTKVcx82WAcpASXzPiV
 VdxrePLiP5Ctm91ERBezXhxF1hQGrHMGHQtXrfa/rHMY20B2L1IJStm7Dxie7vxEfvRTlS0OSVG86
 5934s8EqhWI9hcJZG1vUDABwx2kPXAPraixPlQx0pfSfNX5jxMfo5U4KeEI8ZDqx2cc9vYJsXUVQk
 T195PLjQ==;
Received: from 201-42-129-194.dsl.telesp.net.br ([201.42.129.194]
 helo=[192.168.1.111]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rSe1e-009f2o-84; Wed, 24 Jan 2024 15:14:46 +0100
Message-ID: <68171ce1-3ccb-4699-8577-434d9b717acf@igalia.com>
Date: Wed, 24 Jan 2024 11:14:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Implement check_async_props for planes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240119181235.255060-1-andrealmeid@igalia.com>
 <20240119181235.255060-3-andrealmeid@igalia.com> <Zaq-r7UZpEy7_Rrn@intel.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <Zaq-r7UZpEy7_Rrn@intel.com>
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
Cc: daniel@ffwll.ch, =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

Em 19/01/2024 15:25, Ville Syrjälä escreveu:
> On Fri, Jan 19, 2024 at 03:12:35PM -0300, André Almeida wrote:
>> AMD GPUs can do async flips with changes on more properties than just
>> the FB ID, so implement a custom check_async_props for AMD planes.
>>
>> Allow amdgpu to do async flips with IN_FENCE_ID and FB_DAMAGE_CLIPS
>> properties. For userspace to check if a driver support this two
>> properties, the strategy for now is to use TEST_ONLY commits.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v2: Drop overlay plane option for now
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 116121e647ca..7afe8c1b62d4 100644
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
>> +	    prop != config->prop_in_fence_fd &&
> 
> IN_FENCE should just be allowed always.

Do you mean that the common path should allow IN_FENCE_FD for all drivers?
