Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADB9C5DA0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 17:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9889F10E234;
	Tue, 12 Nov 2024 16:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dz6Czezm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DC710E234;
 Tue, 12 Nov 2024 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f9JaviCbLXmyeAuQ/U0n+aUYuMEEP12gJE4r6O2lA6Y=; b=dz6CzezmviA0qhKwz4iETP5x++
 60lndbluRwU2y7LIH/85fO/EIxtU0DTh93U+Loi47xtk4d5Hxt32CLMbrYemVc0eYVEz2ljYazoHw
 oI1VjVYYPwbdxUpwpB757Rn5ZlzzdK8eGro/nIUB+rBY1xqaFITK8rI9vvwYxQ2MX3ski8MVtLDMf
 v0c46+ni+C2Nm1P2Y619iYPRJB2UOnhErPAcP3S8Z3uAd7DDT5L+WID89wr9hDhGLiftrIZ89SXbq
 LNMa8ZgeGN8fpHIvQN+nFyZitDtl4aMlfFN19uO7dlCNb86S+0RjiXk/OVhjaizKOUZXi2sAJrJ4p
 qFs4H62g==;
Received: from [179.118.191.54] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tAu0X-005xVV-V4; Tue, 12 Nov 2024 17:44:50 +0100
Message-ID: <0829825f-6e6e-465e-aa3c-444d57bd115e@igalia.com>
Date: Tue, 12 Nov 2024 13:44:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 2/2] drm/amdgpu: Enable async flip on overlay
 planes
To: Harry Wentland <harry.wentland@amd.com>
Cc: kernel-dev@igalia.com, Daniel Stone <daniel@fooishbar.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, joshua@froggi.es,
 Leo Li <sunpeng.li@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simon Ser <contact@emersion.fr>, dmitry.baryshkov@linaro.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
 <20241101-tonyk-async_flip-v9-2-681814efbfbe@igalia.com>
 <3a97b828-2864-45fd-9fa1-5341bd456d3e@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <3a97b828-2864-45fd-9fa1-5341bd456d3e@amd.com>
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

Hi Harry, thanks for the reply!

Em 11/11/2024 18:10, Harry Wentland escreveu:
> On 2024-11-01 14:23, André Almeida wrote:
>> amdgpu can handle async flips on overlay planes, so allow it for atomic
>> async checks.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 495e3cd70426db0182cb2811bc6d5d09f52f8a4b..4c6aed5ca777d76245f5f2865046f0f598be342a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -1266,8 +1266,7 @@ static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
>>   	struct drm_plane_state *new_plane_state;
>>   	struct dm_crtc_state *dm_new_crtc_state;
>>   
>> -	/* Only support async updates on cursor planes. */
>> -	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>> +	if (plane->type != DRM_PLANE_TYPE_CURSOR && plane->type != DRM_PLANE_TYPE_OVERLAY)
> 
> This wouldn't just be called for flips, though, but could also be
> called for updates on a plane, right? Those could cause for problems.
> 

I see, I think you are right and can be called from a non-flip commmit.

> There's also nothing special about OVERLAY vs PRIMARY planes, other
> than that amdgpu needs a PRIMARY plane, IIRC. So updates on PRIMARY
> planes should also work (or not).
> 

Right, the PRIMARY plane type is already supported for every DRM driver 
in the API so I didn't explicitly added it here.

> Maybe this should check that we're actually dealing with a simple
> flip, i.e., a simple surface address update.
> 

Right, that makes sense to me, thanks!

> Harry
> 
>>   		return -EINVAL;
>>   
>>   	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>
> 

