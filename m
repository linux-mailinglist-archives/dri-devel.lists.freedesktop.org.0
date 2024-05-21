Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82D8CAD83
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983FE10E4E4;
	Tue, 21 May 2024 11:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cuTapScY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C7510E4E4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+OspcpXi0rcbYhqjwxOvRsRXkb1mkJoKcRphuDKgYoQ=; b=cuTapScYPI/CBFDZeJUG3MKR7Z
 Rp+d1h35rF5LO8zt4XaFa7SojVK0Hyi1LCMTW0Q7QFWPMew0TrvbbNKvztDby1N+CMOdEt/8Rdwnv
 BL4Z34lpj3FPHV5g0uPN/k2mzNZAW1HCGgig4FNGWHKU9qu6h50FpuiQjRelGgJ2vcH/RHyWBJoqA
 Xyh8RxLwHRL5ML0ac2btnYwfBxrelScVLj4WePaiAjxUUl15hIzNefjiB2pM7HtzAw2Tl5GCd+fDB
 wbckPotUXBZ02My/+xO6GOs+yIlTPzD4bFSbuBuOGQr/DyW3ceY5/H7pASDJfi5rO6pA9lVSWroIx
 EDXe4Gkg==;
Received: from [187.36.172.14] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s9NwJ-00AcfT-PP; Tue, 21 May 2024 13:45:56 +0200
Message-ID: <8a86f1a3-f59e-41f9-a6ea-17526944e0ac@igalia.com>
Date: Tue, 21 May 2024 08:45:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] drm/v3d: Improve Performance Counters handling
To: Jani Nikula <jani.nikula@linux.intel.com>, Melissa Wen <mwen@igalia.com>, 
 Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?Q?Juan_A_=2E_Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240512222655.2792754-1-mcanal@igalia.com>
 <8702e7f7-0f3f-4ee6-b2f3-e44217dbed36@igalia.com> <87msojqv89.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <87msojqv89.fsf@intel.com>
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

Hi Jani,

On 5/21/24 08:07, Jani Nikula wrote:
> On Mon, 20 May 2024, Maíra Canal <mcanal@igalia.com> wrote:
>> On 5/12/24 19:23, Maíra Canal wrote:>
>>> Maíra Canal (6):
>>>     drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
>>>     drm/v3d: Different V3D versions can have different number of perfcnt
>>>     drm/v3d: Create a new V3D parameter for the maximum number of perfcnt
>>>     drm/v3d: Create new IOCTL to expose performance counters information
>>>     drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
>>>     drm/v3d: Deprecate the use of the Performance Counters enum >
>>>    drivers/gpu/drm/v3d/v3d_drv.c                 |  11 +
>>>    drivers/gpu/drm/v3d/v3d_drv.h                 |  14 +-
>>>    drivers/gpu/drm/v3d/v3d_perfmon.c             |  36 ++-
>>>    .../gpu/drm/v3d/v3d_performance_counters.h    | 208 ++++++++++++++++++
>>>    drivers/gpu/drm/v3d/v3d_sched.c               |   2 +-
>>>    include/uapi/drm/v3d_drm.h                    |  48 ++++
>>>    6 files changed, 316 insertions(+), 3 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
>>>
>>
>> Applied to drm-misc/drm-misc-next!
> 
> What compiler do you use? I'm hitting the same as kernel test robot [1]
> with arm-linux-gnueabihf-gcc 12.2.0.

I use clang version 17.0.6.

> 
> In general, I don't think it's a great idea to put arrays in headers,
> and then include it everywhere via v3d_drv.h. You're not just relying on
> the compiler to optimize it away in compilation units where its not
> referenced (likely to happen), but also for the linker to deduplicate
> rodata (possible, but I'm not sure that it will happen).
> 
> I think you need to move the arrays to a .c file, and then either a) add
> interfaces to access the arrays, or b) declare the arrays and make them
> global. For the latter you also need to figure out how to expose the
> size.

I'll write a patch to fix it. Sorry for the disturbance, I didn't notice
it with clang.

Best Regards,
- Maíra

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/202405211137.hueFkLKG-lkp@intel.com
> 
> 
