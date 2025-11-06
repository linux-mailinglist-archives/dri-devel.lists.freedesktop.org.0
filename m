Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014CC3ABC5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 12:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE1410E02D;
	Thu,  6 Nov 2025 11:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="amZ8NpDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6FB10E02D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 11:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762430300; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GLU+yPjWzPCHNrP59F7og91n9DQKniPyr4Lk6HB+Rjqj3MFMJ7oCOgItZjSX2+5/qNmDz2/4UfAu8Coq6fk/x8NjzShZS32bGCJgQMFV2mC3TbIkwBXBs+rebAXs1rJA8VaneTMz7Q/J/BEK+Zi/U55LL23ElRe/nyuzkp1PePk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762430300;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=M8n0aQ10eU0brSJLhUmlmMrWDBNLzJdjRN+o/yEcUwg=; 
 b=ecbQgUx2rCjh456rvI4mb+TGZqXwtW6qW+BjHPV/27xB0RRm/vPZTikxyCB49uAoE4yW0rnStmHsgfw8/MnxVR0df+q3WhY/QNtoKTsRqu+W9f7g/NZHcWjkC1ureyMcoT3LGDl7E3ZzBbUAVl/8racYV/jT+8EQVpmAGN0J8/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762430300; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=M8n0aQ10eU0brSJLhUmlmMrWDBNLzJdjRN+o/yEcUwg=;
 b=amZ8NpDBCGGcJVJM/4rTS7pIH0rIEBqF5OZWFj3pIrNXtRrwaW3dco0d/42WGVeH
 MbrH5UcBY8mza9kD/Bxue/FAMwQbnVGu+8ZvcZdI33PV3dzMUIvwua3EikDAHRg7e4c
 VHYG1agaCCBzMsYvCH99TdlQHfPbEUiir6qBoiEM=
Received: by mx.zohomail.com with SMTPS id 1762430298281809.5098721653134;
 Thu, 6 Nov 2025 03:58:18 -0800 (PST)
Message-ID: <986f8dcf-9eb6-40a3-bd3b-163df8d29e43@collabora.com>
Date: Thu, 6 Nov 2025 14:58:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
 <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b54f8527-5ce3-449a-ac96-6b4686d1b108@collabora.com>
 <CH3PR11MB7177B04D32239354CD6A609EF8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <f99e94e2-2357-4645-8d6e-2d234d7d2e12@collabora.com>
Content-Language: en-US
In-Reply-To: <f99e94e2-2357-4645-8d6e-2d234d7d2e12@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/6/25 14:49, Dmitry Osipenko wrote:
> On 10/31/25 08:04, Kasireddy, Vivek wrote:
>> Hi Dmitry,
>>
>>> Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
>>> external sync
>>>
>>> On 10/29/25 08:47, Kasireddy, Vivek wrote:
>>>> I applied this patch and tested 3 different scenarios:
>>>> 1) blob=true + imported buffers
>>>> root@localhost:weston_upstream/weston# ./build/clients/weston-simple-
>>> egl -o &
>>>> Using config: r8g8b8a0
>>>> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
>>>> has EGL_EXT_surface_compression
>>>> 245 frames in 5 seconds: 49.000000 fps
>>>> 236 frames in 5 seconds: 47.200001 fps
>>>> 279 frames in 5 seconds: 55.799999 fps
>>>> 240 frames in 5 seconds: 48.000000 fps
>>>> 244 frames in 5 seconds: 48.799999 fps
>>>> 283 frames in 5 seconds: 56.599998 fps
>>>> 274 frames in 5 seconds: 54.799999 fps
>>>>
>>>> 2) blob=true
>>>> root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-
>>> egl -o &
>>>> Using config: r8g8b8a0
>>>> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
>>>> has EGL_EXT_surface_compression
>>>> 167 frames in 5 seconds: 33.400002 fps
>>>> 208 frames in 5 seconds: 41.599998 fps
>>>> 203 frames in 5 seconds: 40.599998 fps
>>>> 252 frames in 5 seconds: 50.400002 fps
>>>> 180 frames in 5 seconds: 36.000000 fps
>>>> 219 frames in 5 seconds: 43.799999 fps
>>>> 176 frames in 5 seconds: 35.200001 fps
>>>> 220 frames in 5 seconds: 44.000000 fps
>>>
>>> Thanks for the testing.
>>>
>>> For the second scenario I'm getting better result, it's 55-60fps for me.
>>> Given that this is a SW rendering, curious whether that's because you're
>>> testing on a lower end machine(?)
>> I am testing with a dGPU (B60) on the Host where I am running Gnome Xorg
>> but I am running Gnome Wayland in the Guest. What compositors are you
>> running on the Host and Guest? Kwin? Also, could you please share your
>> Qemu launch parameters as well so that we can try to figure out the reason
>> for the performance discrepancy?
> 
> Did further testing on older IvyBridge machine and getting comparable
> result to yours on it.
> 
> I'm using exactly same QEMU setup as you do with nothing special in the
> cmdline. Tested with both KDE and Gnome on host.
> 
> On IvyBridge getting:
> 
> - 46-55fps jittery with GTK display + blob + vblank_timer
> - 46-55fps jittery with GTK display + blob + vblank_timer +
> vblank_mode=1 to disable vsync on host
> - constant 60fps with GTK display without blob + vblank_timer
> - constant 60fps with GTK display + blob without vblank_timer
> - constant 60fps with SDL display + blob + vblank_timer
> 
> So, discrepancy of the results is directly tied to CPU performance + GTK
> oddity when SW+blob rendering is used on guest.
> 
> Why SDL performs much better than GTK I don't know.
> 

Forgot to mention that I'm testing using my [1] QEMU branch.

[1] https://gitlab.freedesktop.org/digetx/qemu/-/commits/native-context-v14

-- 
Best regards,
Dmitry
