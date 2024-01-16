Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76E82EFCC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D723F10E48E;
	Tue, 16 Jan 2024 13:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA1410E0E5;
 Tue, 16 Jan 2024 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKDZrSr5UEaNlLwHGrAasvRdAMXTo1e2KPdcbvBvbx8=; b=FEV9NTpyCttcNbLmRy8Eh0mFAr
 vz4pkgZeWzj8JtOdMoM3GW4FzbKXDWXGlJE81hUZRcuiDRhiKX7AuIbb7jwRo4xJCuO/3mgrVPTDM
 G5wpYioIVBcmg0BRpHDI2Hep/Dm1a/BEE4ukJ3Vwg8pd7iaT9C5YLqcrgrqGWVrEi/ghHaK12aehl
 WKPiwIodYTJ2sONx/5AbjfW/1mzlhNP9MSpEUmKPDRadcHk56LS75tufAbLMdrVu1U1DwdPxKQDR3
 pIXdzWqOL/V1bhyndQs4mfQmXsXUNvnLgbHCcH5/1ZftSzBS4ArBbvPwOd4zTcjqOvaNlthgpoqnk
 PikmFWTQ==;
Received: from [177.45.63.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rPjbE-006yYK-5Y; Tue, 16 Jan 2024 14:35:28 +0100
Message-ID: <47c6866a-34d6-48b1-a977-d21c48d991dc@igalia.com>
Date: Tue, 16 Jan 2024 10:35:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
 <20240116114522.5b83d8b6@eldfell>
 <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
 <20240116151414.10b831e6@eldfell>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240116151414.10b831e6@eldfell>
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
 Joshua Ashton <joshua@froggi.es>, Daniel Stone <daniel@fooishbar.org>,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Joshua

Em 16/01/2024 10:14, Pekka Paalanen escreveu:
> On Tue, 16 Jan 2024 08:50:59 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
> 
>> Hi Pekka,
>>
>> Em 16/01/2024 06:45, Pekka Paalanen escreveu:
>>> On Tue, 16 Jan 2024 01:51:57 -0300
>>> André Almeida <andrealmeid@igalia.com> wrote:
>>>    
>>>> Hi,
>>>>
>>>> AMD hardware can do more on the async flip path than just the primary plane, so
>>>> to lift up the current restrictions, this patchset allows drivers to write their
>>>> own check for planes for async flips.
>>>
>>> Hi,
>>>
>>> what's the userspace story for this, how could userspace know it could do more?
>>> What kind of userspace would take advantage of this and in what situations?
>>>
>>> Or is this not meant for generic userspace?
>>
>> Sorry, I forgot to document this. So the idea is that userspace will
>> query what they can do here with DRM_MODE_ATOMIC_TEST_ONLY calls,
>> instead of having capabilities for each prop.
> 
> That's the theory, but do you have a practical example?
> 
> What other planes and props would one want change in some specific use
> case?
> 
> Is it just "all or nothing", or would there be room to choose and pick
> which props you change and which you don't based on what the driver
> supports? If the latter, then relying on TEST_ONLY might be yet another
> combinatorial explosion to iterate through.
> 

That's a good question, maybe Simon, Xaver or Joshua can share how they 
were planning to use this on Gamescope or Kwin.

> 
> Thanks,
> pq
> 
>>>> I'm not sure if adding something new to drm_plane_funcs is the right way to do,
>>>> because if we want to expand the other object types (crtc, connector) we would
>>>> need to add their own drm_XXX_funcs, so feedbacks are welcome!
>>>>
>>>> 	André
>>>>
>>>> André Almeida (2):
>>>>     drm/atomic: Allow drivers to write their own plane check for async
>>>>       flips
>>>>     drm/amdgpu: Implement check_async_props for planes
>>>>
>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
>>>>    drivers/gpu/drm/drm_atomic_uapi.c             | 62 ++++++++++++++-----
>>>>    include/drm/drm_atomic_uapi.h                 | 12 ++++
>>>>    include/drm/drm_plane.h                       |  5 ++
>>>>    4 files changed, 92 insertions(+), 17 deletions(-)
>>>>   
>>>    
> 
