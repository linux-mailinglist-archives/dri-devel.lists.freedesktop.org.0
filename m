Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09399A220F0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 16:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6FA10E103;
	Wed, 29 Jan 2025 15:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="siP0MbSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6984710E103;
 Wed, 29 Jan 2025 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N5mhjj4C724jR9Tjgt0jzsPyLjPer8dLoUH3kOj7Cp8=; b=siP0MbSZBgYja2oTQjeubN1ptb
 S8sEI5aBpvF1SaCPI80tzHsdNbLHXgARTCZi+WzaVQTuuAl8hoheebcaDf1lS3Ja+GVNCZw5s7Prg
 vBjcXtZ34kFfiYwymlmmX4uzxT9++I9mf6j+yFOwX5IumKikntzjW6TC9pVn6dI/uj9HcBCLDdDLk
 PBUkqaXpSn9jGwkyVrELQN6UNmVxYbeVPHY+VXWP9Dftc3QhA6q0uF8UjsgPbEepzFa1/2GCGQ41o
 2un6w2UNyS++/9QmUDP3SHWyOM57lWDFRzqkjUVYvFtWFg7zviVHiDTz3sIWPvHAmtJTTM0eeXwPh
 NNzMyGpA==;
Received: from 189-68-33-219.dsl.telesp.net.br ([189.68.33.219]
 helo=[192.168.15.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tdANG-000e2Q-FO; Wed, 29 Jan 2025 16:53:12 +0100
Message-ID: <59b06cd5-979d-47a7-b955-c565b23ae21b@igalia.com>
Date: Wed, 29 Jan 2025 12:53:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] drm/amdgpu: Enable async flip on overlay planes
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org,
 Simon Ser <contact@emersion.fr>, joshua@froggi.es,
 Daniel Stone <daniel@fooishbar.org>, ville.syrjala@linux.intel.com,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
 <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
 <CAFZQkGwG7FLU1Lw8aRo20ox3ccJbEntSB=iZZURrXEJKLQoyhw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAFZQkGwG7FLU1Lw8aRo20ox3ccJbEntSB=iZZURrXEJKLQoyhw@mail.gmail.com>
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

Em 29/01/2025 11:36, Xaver Hugl escreveu:
> Am Mo., 27. Jan. 2025 um 21:00 Uhr schrieb André Almeida
> <andrealmeid@igalia.com>:
>>
>> amdgpu can handle async flips on overlay planes, so allow it for atomic
>> async checks.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 774cc3f4f3fd9a964fe48c66eb596d2f6dfee602..6bfed3d1530e6610eea025b477f409ee505870da 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -1258,21 +1258,23 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
>>   }
>>
>>   static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
>> -                                             struct drm_atomic_state *state)
>> +                                             struct drm_atomic_state *state, bool flip)
>>   {
>>          struct drm_crtc_state *new_crtc_state;
>>          struct drm_plane_state *new_plane_state;
>>          struct dm_crtc_state *dm_new_crtc_state;
>>
>> -       /* Only support async updates on cursor planes. */
>> -       if (plane->type != DRM_PLANE_TYPE_CURSOR)
>> +       if (flip) {
>> +               if (plane->type != DRM_PLANE_TYPE_OVERLAY)
>> +                       return -EINVAL;
>> +       } else if (plane->type != DRM_PLANE_TYPE_CURSOR)
>>                  return -EINVAL;
> 
> This changes the logic for cursor updates, flipping on the cursor
> plane allowed async updates before. Is that intentional?
> 

It's not the intention of this patch to disable async updates on cursor 
planes... but I don't think it's happening here? Async plane updates and 
async page flips are different things.

Any function that used to call amdgpu_dm_plane_atomic_async_check() for 
an async update on a cursor plane will continue to being able to do that.

For callers of _atomic_async_check() from a page flip path (like 
drm_atomic_set_property()), those couldn't flip a cursor plane, and will 
continue to be like that for now.

At least this is my analysis, please let me know if I got something wrong.
