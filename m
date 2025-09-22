Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA996B91780
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C067510E492;
	Mon, 22 Sep 2025 13:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fGiHjBm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A1D10E47B;
 Mon, 22 Sep 2025 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBRNeatQ8GsKGcgsGMDKNH9WeRh2EhN4RgXkh6irPNg=; b=fGiHjBm39wS3dYVx1FGashf7bA
 LYGvo8OXqUsUS8IFrputdEj2jOPCeIungfnm+9DKnQM6SJW1hLiCQieBRh8tqscKxAQv/t2YXeFwz
 SgN7GDn/xrhLjGfVqpP1KMnALPitNqFIChE4bTAz07ntR/ZdYr2NerCtKWIb21WvEmfGxQHb7lCyh
 r8lPZnFSqpW9TgTDcp6HRIuxkun5gJzcjNNEd9/dIEbL3vOjmbHA/Dnm2UOXRCxyOvsZ76Ywv9PTx
 SAGUHXigZeyg+wdBqIRPMF3fJFEX4tMmJTySfGNOYD+YWiHaYWfqYrMlOsZPd9LOSJcLOXa+VGZo+
 pFEQ/99w==;
Received: from [193.52.24.5] (helo=[10.40.32.26])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v0goq-00FleW-Ry; Mon, 22 Sep 2025 15:43:04 +0200
Message-ID: <9c150f20-71d1-4af3-ba90-02a0a5b98330@igalia.com>
Date: Mon, 22 Sep 2025 10:42:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert the remaining commits about dma_buf
 handling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <6da0bdd3-0b93-45d8-a178-1fc202bd49c7@suse.de>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <6da0bdd3-0b93-45d8-a178-1fc202bd49c7@suse.de>
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



On 22/09/2025 08:54, Thomas Zimmermann wrote:
> Hi Melissa
>
> Am 19.09.25 um 17:54 schrieb Melissa Wen:
>> Hi all,
>>
>> I just talked with Thomas that these two patches are preventing amdgpu
>> driver to be unloaded:
>>
>> `modprobe: FATAL: Module amdgpu is in use.`
>>
>> and there is no process using the driver.
>
> What's the exact STR for this problem? After Christian's comments, I 
> tried to reproduce the issue, but it works on my system. I do
>
> - boot up with amdgpu in text mode (multiuser.target)
> - login by serial console
> - 'rmmod amdgpu'
>
> That last step turns my test system's display off and unloads amdgpu. 
> The kernel is a recent drm-tip at v6.17-rc6.

- I booted up in graphical.target;
- Connected via ssh, dropped the graphical interface to text mode 
(multiuser.target), and tried to remove the module with `modprobe -r amdgpu`

The issue happened in the latest 6.16 kernel version from Debian (I 
don't have the machine with me atm to check the exact version), but also 
with mainline kernel from last week.

I bisected kernel from 6.16 and 6.15 and IIRC git bisect pointed to 
`drm/framebuffer: Acquire internal references on GEM handles`, but as it 
triggers another trace and AFAIU fixes `drm/gem: Acquire references on 
GEM handles for framebuffers`, I reverted both pacthes and amdgpu 
loaded/unloaded as expected.

IGT amdgpu-specific tests for loading and unloading are also failing 
because it's not able to unload the module.
I didn't run the generic test.

I'm using an AMD Cezanne laptop with a touch-screen capable display (hp 
envy x360 convertible) with Debian + Gnome.
I looked for process using the modules, but I didn't find any.

BTW, I don't discard that this work uncovered a preexist problem, for 
example.
Since those patches are addressing other issues, as mentioned by 
Maarten, I'll debug the amdgpu driver further and check the points raised.

Best Regards,

Melissa

>
> Best regards
> Thomas
>
>>
>> We agreed that the best approach now is to completely revert the work
>> done for improving DMA bug handling to avoid any loose ends. With these
>> reverts we are just back to the old behavior and amdgpu loading and
>> unloading will return to normal.
>>
>> Best Regards,
>>
>> Melissa
>>
>> Melissa Wen (2):
>>    Revert "drm/framebuffer: Acquire internal references on GEM handles"
>>    Revert "drm/gem: Acquire references on GEM handles for framebuffers"
>>
>>   drivers/gpu/drm/drm_framebuffer.c | 31 +--------------
>>   drivers/gpu/drm/drm_gem.c         | 64 +++++--------------------------
>>   drivers/gpu/drm/drm_internal.h    |  2 -
>>   include/drm/drm_framebuffer.h     |  7 ----
>>   4 files changed, 11 insertions(+), 93 deletions(-)
>>
>

