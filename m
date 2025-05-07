Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F3AAEC15
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4610E880;
	Wed,  7 May 2025 19:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QPblTw3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC3F10E880;
 Wed,  7 May 2025 19:18:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B8B2F629DA;
 Wed,  7 May 2025 19:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DC8C4CEE2;
 Wed,  7 May 2025 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746645479;
 bh=DCZi3XO0F+/kU4KNVocM08wcTKdcxjH7Jm0mP/3gZP4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QPblTw3dUWdBnvdaq0izKafCuCBm01Xk5wtBaCX6WEUf76mAdlMlLqYlPZY3/rMLJ
 3IAHdxgrETvdab3o7MVP/ofXiuf0yOBRrrqa1LUYbpfiwI+Wr1pzfWJhCm/a4YxLE1
 WYQvYWhhsI/Dc2w0A4DSQn0sY1NC6Ll0FFp/SX30t6YEdhB1Nvncrzs7kCUfLwE8p1
 jz3IVgAewRb6ZeY5HV6SfJvLTgiHBlbFnyPmIYIckAJ56CYDMzcNgj2HDMLIQhbNCa
 ++3yAYeLE9mFvPuEMOCnjkKiTqUqGgC0SHHZ/mAtpkEeHgOXIRkfLqsr//TEUZq1gR
 upOyAoQze5P2Q==
Message-ID: <98d527c6-a185-40f9-8ce3-46f5d7a67e81@kernel.org>
Date: Wed, 7 May 2025 14:17:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/2] drm/amd: Use suspend and hibernate post freeze
 notifications
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
References: <20250501211734.2434369-1-superm1@kernel.org>
 <20250501211734.2434369-3-superm1@kernel.org>
 <CAJZ5v0jwO9nv+mnuHy7fbdf4rNW1VW-zLp611ywppzFt3vzy1w@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAJZ5v0jwO9nv+mnuHy7fbdf4rNW1VW-zLp611ywppzFt3vzy1w@mail.gmail.com>
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

On 5/7/2025 2:14 PM, Rafael J. Wysocki wrote:
> On Thu, May 1, 2025 at 11:17 PM Mario Limonciello <superm1@kernel.org> wrote:
>>
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> commit 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification
>> callback support") introduced a VRAM eviction earlier in the PM
>> sequences when swap was still available for evicting to. This helped
>> to fix a number of memory pressure related bugs but also exposed a
>> new one.
>>
>> If a userspace process is actively using the GPU when suspend starts
>> then a deadlock could occur.
>>
>> Instead of going off the prepare notifier, use the PM notifiers that
>> occur after processes have been frozen to do evictions.
>>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4178
>> Fixes: 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification callback support")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 7f354cd532dc1..cad311b9fd834 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4917,10 +4917,10 @@ static int amdgpu_device_pm_notifier(struct notifier_block *nb, unsigned long mo
>>          int r;
>>
>>          switch (mode) {
>> -       case PM_HIBERNATION_PREPARE:
>> +       case PM_HIBERNATION_POST_FREEZE:
>>                  adev->in_s4 = true;
>>                  fallthrough;
>> -       case PM_SUSPEND_PREPARE:
>> +       case PM_SUSPEND_POST_FREEZE:
>>                  r = amdgpu_device_evict_resources(adev);
>>                  /*
>>                   * This is considered non-fatal at this time because
>> --
> 
> Why do you need a notifier for this?
> 
> It looks like this could be done from amdgpu_device_prepare(), but if
> there is a reason why it cannot be done from there, it should be
> mentioned in the changelog.

It's actually done in amdgpu_device_prepare() "as well" already, but the 
reason that it's being done earlier is because swap still needs to be 
available, especially with heavy memory fragmentation.

I'll add more detail about this to the commit for the next spin if 
you're relatively happy with the new notifier from the first patch.
