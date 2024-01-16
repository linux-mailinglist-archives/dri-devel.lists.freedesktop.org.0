Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44F82EE7B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 12:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18EC10E4BA;
	Tue, 16 Jan 2024 11:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6348910E49D;
 Tue, 16 Jan 2024 11:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RK8HhUL7/mSLlRQcfu0FfBwVC2fqWvwSpORs6uHkzQ=; b=s0aFfV17JvR2ozhnpfGP5R2701
 MqtQfq04Kn9eNo5CmFEYE6JLRGcextvHOveZ9/7kcn1NfSIlcBcK8KtaQKUf1Q5VKcrLc8O3ZRDt2
 kmiLcGSE1XDVlMIaKLwhIgehEicZSZ7MZPQtWhtlvmfTpewH8d2mTIETlqME6nx8kZugNzZGm7269
 rQMOTShleb/Xk2d7KRvMW3dDdHSWmt+bRRa7fV1rMnLp1hUG4Ihd7fbPobVEcJfxwuH3Dhx3EhqNC
 3CP+0GBy4N8CliUiTmCabDjXGe1fhNvON1YjNlId8WBdMRQ9UqalvsBgEdwhd4yb68DDry1bpq8kj
 ChwaY3VQ==;
Received: from [177.45.63.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rPhyF-006woJ-M6; Tue, 16 Jan 2024 12:51:07 +0100
Message-ID: <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
Date: Tue, 16 Jan 2024 08:50:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
 <20240116114522.5b83d8b6@eldfell>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240116114522.5b83d8b6@eldfell>
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Daniel Stone <daniel@fooishbar.org>, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

Em 16/01/2024 06:45, Pekka Paalanen escreveu:
> On Tue, 16 Jan 2024 01:51:57 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
> 
>> Hi,
>>
>> AMD hardware can do more on the async flip path than just the primary plane, so
>> to lift up the current restrictions, this patchset allows drivers to write their
>> own check for planes for async flips.
> 
> Hi,
> 
> what's the userspace story for this, how could userspace know it could do more?
> What kind of userspace would take advantage of this and in what situations?
> 
> Or is this not meant for generic userspace?

Sorry, I forgot to document this. So the idea is that userspace will 
query what they can do here with DRM_MODE_ATOMIC_TEST_ONLY calls, 
instead of having capabilities for each prop.

> 
> 
> Thanks,
> pq
> 
>> I'm not sure if adding something new to drm_plane_funcs is the right way to do,
>> because if we want to expand the other object types (crtc, connector) we would
>> need to add their own drm_XXX_funcs, so feedbacks are welcome!
>>
>> 	André
>>
>> André Almeida (2):
>>    drm/atomic: Allow drivers to write their own plane check for async
>>      flips
>>    drm/amdgpu: Implement check_async_props for planes
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
>>   drivers/gpu/drm/drm_atomic_uapi.c             | 62 ++++++++++++++-----
>>   include/drm/drm_atomic_uapi.h                 | 12 ++++
>>   include/drm/drm_plane.h                       |  5 ++
>>   4 files changed, 92 insertions(+), 17 deletions(-)
>>
> 
