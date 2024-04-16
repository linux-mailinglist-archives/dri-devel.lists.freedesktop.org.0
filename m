Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5008A6797
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7990C10F685;
	Tue, 16 Apr 2024 10:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ELDlnPf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4065510F686
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SIZu/rQbO8ZSwNtR8RXVSAt8bPpbsDq76thZBZ+9VBY=; b=ELDlnPf6kxtEvx5RVpeVj1jZKZ
 kmgqOdtQ6fVsZobrqcetQgNH0c/R8r26Ccu60q4cU/j9HNbj7hG4otq3FpN2oUgwC5P+R9kziFwCV
 1eODsOFFgjGFl6/14wzYwyU9F5GFBgGV45T/QqWX4he3+Mk06bMKhtBisVN77+Qc8ZMafA471sz/S
 4U/ThktIueIr3YZLoA+LbTZU0wAjNRVZaV+KD7dpEVtTwbhOZRZb7ooi1EjPn9n4Qw+cyPoCu+K9g
 u7yHK4KNvLYt3OXpVjxzf07Fx3ojBwSw9OqO0IDgNiSjSQKgnjCCOGJWhKuYyO+WMZFGX52ZwHkq0
 H7serCkw==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwfck-0055sS-QN; Tue, 16 Apr 2024 12:01:10 +0200
Message-ID: <4e620644-b991-4a3f-9a43-3cb8b5c93cc8@igalia.com>
Date: Tue, 16 Apr 2024 11:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/v3d: Don't increment `enabled_ns` twice
Content-Language: en-GB
To: Chema Casanova <jmcasanova@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240403203517.731876-1-mcanal@igalia.com>
 <20240403203517.731876-2-mcanal@igalia.com>
 <6a2f8a3e-bc69-4168-89dd-94654d9695d0@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <6a2f8a3e-bc69-4168-89dd-94654d9695d0@igalia.com>
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


Hi,

On 15/04/2024 12:17, Chema Casanova wrote:
> El 3/4/24 a las 22:24, Maíra Canal escribió:
>> The commit 509433d8146c ("drm/v3d: Expose the total GPU usage stats on 
>> sysfs")
>> introduced the calculation of global GPU stats. For the regards, it used
>> the already existing infrastructure provided by commit 09a93cc4f7d1 
>> ("drm/v3d:
>> Implement show_fdinfo() callback for GPU usage stats"). While adding
>> global GPU stats calculation ability, the author forgot to delete the
>> existing one.
>>
>> Currently, the value of `enabled_ns` is incremented twice by the end of
>> the job, when it should be added just once. Therefore, delete the
>> leftovers from commit 509433d8146c ("drm/v3d: Expose the total GPU usage
>> stats on sysfs").
>>
>> Fixes: 509433d8146c ("drm/v3d: Expose the total GPU usage stats on 
>> sysfs")
>> Reported-by: Tvrtko Ursulin <tursulin@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_irq.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c 
>> b/drivers/gpu/drm/v3d/v3d_irq.c
>> index 2e04f6cb661e..ce6b2fb341d1 100644
>> --- a/drivers/gpu/drm/v3d/v3d_irq.c
>> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
>> @@ -105,7 +105,6 @@ v3d_irq(int irq, void *arg)
>>           struct v3d_file_priv *file = 
>> v3d->bin_job->base.file->driver_priv;
>>           u64 runtime = local_clock() - file->start_ns[V3D_BIN];
>> -        file->enabled_ns[V3D_BIN] += local_clock() - 
>> file->start_ns[V3D_BIN];
>>           file->jobs_sent[V3D_BIN]++;
>>           v3d->queue[V3D_BIN].jobs_sent++;
>> @@ -126,7 +125,6 @@ v3d_irq(int irq, void *arg)
>>           struct v3d_file_priv *file = 
>> v3d->render_job->base.file->driver_priv;
>>           u64 runtime = local_clock() - file->start_ns[V3D_RENDER];
>> -        file->enabled_ns[V3D_RENDER] += local_clock() - 
>> file->start_ns[V3D_RENDER];
>>           file->jobs_sent[V3D_RENDER]++;
>>           v3d->queue[V3D_RENDER].jobs_sent++;
>> @@ -147,7 +145,6 @@ v3d_irq(int irq, void *arg)
>>           struct v3d_file_priv *file = 
>> v3d->csd_job->base.file->driver_priv;
>>           u64 runtime = local_clock() - file->start_ns[V3D_CSD];
>> -        file->enabled_ns[V3D_CSD] += local_clock() - 
>> file->start_ns[V3D_CSD];
>>           file->jobs_sent[V3D_CSD]++;
>>           v3d->queue[V3D_CSD].jobs_sent++;
>> @@ -195,7 +192,6 @@ v3d_hub_irq(int irq, void *arg)
>>           struct v3d_file_priv *file = 
>> v3d->tfu_job->base.file->driver_priv;
>>           u64 runtime = local_clock() - file->start_ns[V3D_TFU];
>> -        file->enabled_ns[V3D_TFU] += local_clock() - 
>> file->start_ns[V3D_TFU];
>>           file->jobs_sent[V3D_TFU]++;
>>           v3d->queue[V3D_TFU].jobs_sent++;
> 
> Thanks for fixing this. I see that I included this error in my first 
> refactoring of
> the original patch.

Not sure if it would be worth creating a simple test like 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/2f81ed3aed873c7cc2f6d0e1117fa4fb02033246 
for i915? Just a thought.

Regards,

Tvrtko
