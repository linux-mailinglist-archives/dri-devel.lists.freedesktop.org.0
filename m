Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FDAB3A93
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAC210E191;
	Mon, 12 May 2025 14:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XJUJ/dyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437E10E191
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ShlYCAlpUj0EG4BFFQGzIlfptjTPq6gwYXAUM0H4Ork=; b=XJUJ/dydz3VlhW90lBogldLNUj
 8ADonzlkFcuGd4guYD5B54jwooOTJAoaD7v9jw6aelUwd1q0UyptqECq4s28nQjxVzlFvsazZTm8Y
 7wqAaW7zyqc+Y4GBHZ1g+3gDCYdDIDO4Ub0oqD75vdodIvwFCOfDGale5vuOj+WvkRrN2rH0WYJ7P
 Hv4c5Hmd9duMC+T4b+863YtmsYd8iT7cqzZQLz3nPYIZXPLqRG2BX2oLAx/cnp8cIekdbDjXwbljr
 pg2OlCQurfrhuwynRN/DCd1PmzUTaSDWyuYISEK9/viI6c7PjCkFBAcU/HUApSApeMSIY9MizQ6La
 3ATQvYcg==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEU2w-0077TL-6e; Mon, 12 May 2025 16:27:43 +0200
Message-ID: <86103c8d-0cdf-4fc8-aa79-5a03b299d26e@igalia.com>
Date: Mon, 12 May 2025 11:27:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_auth: Convert mutex usage to guard(mutex)
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250509142627.639419-1-andrealmeid@igalia.com>
 <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
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

Hi Thomas,

Thanks for the feedback.

Em 12/05/2025 03:52, Thomas Zimmermann escreveu:
> Hi
> 
> Am 09.05.25 um 16:26 schrieb André Almeida:
>> Replace open-coded mutex handling with cleanup.h guard(mutex). This
>> simplifies the code and removes the "goto unlock" pattern.
>>
>> Tested with igt tests core_auth and core_setmaster.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> but with questions below
> 
>> ---
>>
>> For more information about guard(mutex):
>> https://www.kernel.org/doc/html/latest/core-api/cleanup.html
> 
> This page lists issues with guards, so conversion from manual locking 
> should be decided on a case-by-case base IMHO.
> 

Sure, agreed. The places that I have converted to guard(mutex) here 
looks like a good fit for this conversion, where the scope of the mutex 
is well defined inside a function without conditional locking.

>> ---
>>   drivers/gpu/drm/drm_auth.c | 64 ++++++++++++++------------------------
>>   1 file changed, 23 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 22aa015df387..d6bf605b4b90 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -95,7 +95,7 @@ int drm_getmagic(struct drm_device *dev, void *data, 
>> struct drm_file *file_priv)
>>       struct drm_auth *auth = data;
>>       int ret = 0;
>> -    mutex_lock(&dev->master_mutex);
>> +    guard(mutex)(&dev->master_mutex);
> 
> These guard statements are hidden variable declarations. Shouldn't they 
> rather go to the function top with the other declarations? This would 
> also help to prevent the problem listed in cleanup.html to some extend.
> 

The guard statements should go exactly where the lock should be taken, 
as it not only declares anonymous variables but also really takes the 
lock. The lock is then release when the mutex goes out of scope. File 
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c has some usage of 
guard(mutex) as well, where Mario did a similar cleanup:

f123fda19752 drm/amd/display: Use scoped guards for handle_hpd_irq_helper()
aca9ec9b050c drm/amd/display: Use scoped guard for 
amdgpu_dm_update_connector_after_detect()
f24a74d59e14 drm/amd/display: Use scoped guard for dm_resume()


> Best regards
> Thomas
> 
