Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF8A32691
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 14:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158F110E25D;
	Wed, 12 Feb 2025 13:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="E7+/qYMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4710510E25D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KEpE0FMHR9s83tqOyaTmRK/SOVT0BOcNNCrqDLe9+RY=; b=E7+/qYMVmY33UCToNXTd4qgMKw
 TWGVJHXwtNcbqH4v61Z1OUR7Pzid25PTbP7P2HRvcGscoD107OW4RfcX7p2RWacnlANB7VgHlHjHV
 4Rt9M5N944/ZM8soC3yCvd3ZSMGocsRlRemsRbHPgySs8TCt/7eWqbdjXa167kH18gmtqWwN5eiGS
 ilnKzkyT8MMLdWajCOUtoQhDjKJD9YvCZHz5B4s0o/051nDyj6qUvoMEmR+BYQB/3VRJDit75dcu2
 ngPThVUTVr/1lmtRTGx+p4RtJyALdwbckJ5DUBU5/zbHIDD1dnVrr7kdlL6ZWdAl6pm5dFM655H+O
 SJ9f1MEQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tiCSs-008H5v-Qv; Wed, 12 Feb 2025 14:07:48 +0100
Message-ID: <6d9e1af2-912b-460c-a278-b142c8bd2d79@igalia.com>
Date: Wed, 12 Feb 2025 10:07:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Add clock handling
To: Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com
References: <20250201125046.33030-1-wahrenst@gmx.net>
 <e1bd620c-a5d7-47f8-bc07-c41418c0c34c@igalia.com>
 <29a5d5a4-7671-41c3-8317-07eb9589c16e@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <29a5d5a4-7671-41c3-8317-07eb9589c16e@gmx.net>
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

Hi Stefan,

On 10/02/25 10:27, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 10.02.25 um 13:23 schrieb Maíra Canal:
>> Hi Stefan,
>>
>> Thanks for your patch!
>>
>> On 01/02/25 09:50, Stefan Wahren wrote:
>>> Since the initial commit 57692c94dcbe ("drm/v3d: Introduce a new DRM
>>> driver
>>> for Broadcom V3D V3.x+") the struct v3d_dev reserved a pointer for
>>> an optional V3D clock. But there wasn't any code, which fetched it.
>>> So add the missing clock handling before accessing any V3D registers.
>>
>> Actually, I believe we should remove `v3d->clk`. In the past, we used
>> `v3d->clk` for PM management, but we removed PM management a while ago
>> (it was somewhat broken).
> I disagree. Clock handling and power management are not the same things.
> Btw the brokeness partly based on the missing clock handling, but this
> not my point here. The DT binding of the Broadcom V3D GPU describe an
> optional clock, so the Linux kernel should ensure that before accessing
> any V3D registers, the relevant clock must be enabled. Please compare
> with VC4, which does the same thing.
> 
> At the end we had just luck because the GPU firmware enabled the clock
> at boot?

I see your point now, thanks for taking your time to send this patch!

Applied to misc/kernel.git (drm-misc-next) [1]

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4dd40b5f9c3d89b67af0dbe059cf4a51aac6bf06

Best Regards,
- Maíra

>>
>> I believe the best move would be to remove `v3d->clk`. If we decide to
>> use the clock at some point, we can reintroduce the variable to the
>> struct. Right now, it doesn't make sense to add clock handling if we
>> don't use it.
> clk_prepare_enable() / clk_disable_unprepare() is actually using the
> clock. There is no need to set some kind of rate, in case you expecting
> this.
> 
> Best regards

