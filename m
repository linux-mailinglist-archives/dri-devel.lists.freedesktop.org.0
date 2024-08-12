Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD394F126
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 17:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCB610E251;
	Mon, 12 Aug 2024 15:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="E8VhV+T/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816F10E251
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JEG7CXQrByJ2zAU7Xtg8h1r7MNyhJ6AcP7wHsUOam+U=; b=E8VhV+T/PU8pVgF2MdknOQE0CE
 VGJcf1AJGE922fpu4D3VSAOET+XEpZ5Y1zt4rM7IiJ7GWZQJReisnM2IhhZWGUbjZRwQRqJntl0/b
 pwr6GTrobY6xtLrbn8SoLfNf106rB/FUoVSmJOI0jXkC1XZRYH3Un3wQEfj0/O9LRwB3vJ2tX1rcb
 gyKfIXJlYZCe8dHDtR4QDi1F4OhsUiZwO+yEaK11hONvmutBkqboM+YOI+0rvHervbokY2HCjecAg
 bjvMjElukgifz5vFKWm8Kody20v9eK6UWk+ywrq7/Upr6+shMlYnq6aPRilADHhTkscL/GxU55kYe
 3HfozTlw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sdWYW-00BYTl-Os; Mon, 12 Aug 2024 17:01:57 +0200
Message-ID: <89ca0e8c-2ec1-49a7-9a48-ee3575a49105@igalia.com>
Date: Mon, 12 Aug 2024 12:01:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Fix out-of-bounds read in `v3d_csd_job_run()`
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240809152001.668314-1-mcanal@igalia.com>
 <55db35d72c6da92572e09334dad1382846222892.camel@igalia.com>
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
In-Reply-To: <55db35d72c6da92572e09334dad1382846222892.camel@igalia.com>
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

Hi Iago,

On 8/12/24 04:01, Iago Toral wrote:
> El vie, 09-08-2024 a las 12:18 -0300, Maíra Canal escribió:
>> When enabling UBSAN on Raspberry Pi 5, we get the following warning:
>>
>> [  387.894977] UBSAN: array-index-out-of-bounds in
>> drivers/gpu/drm/v3d/v3d_sched.c:320:3
>> [  387.903868] index 7 is out of range for type '__u32 [7]'
>> [  387.909692] CPU: 0 PID: 1207 Comm: kworker/u16:2 Tainted: G
>> WC         6.10.3-v8-16k-numa #151
>> [  387.919166] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
>> [  387.925961] Workqueue: v3d_csd drm_sched_run_job_work [gpu_sched]
>> [  387.932525] Call trace:
>> [  387.935296]  dump_backtrace+0x170/0x1b8
>> [  387.939403]  show_stack+0x20/0x38
>> [  387.942907]  dump_stack_lvl+0x90/0xd0
>> [  387.946785]  dump_stack+0x18/0x28
>> [  387.950301]  __ubsan_handle_out_of_bounds+0x98/0xd0
>> [  387.955383]  v3d_csd_job_run+0x3a8/0x438 [v3d]
>> [  387.960707]  drm_sched_run_job_work+0x520/0x6d0 [gpu_sched]
>> [  387.966862]  process_one_work+0x62c/0xb48
>> [  387.971296]  worker_thread+0x468/0x5b0
>> [  387.975317]  kthread+0x1c4/0x1e0
>> [  387.978818]  ret_from_fork+0x10/0x20
>> [  387.983014] ---[ end trace ]---
>>
>> This happens because the UAPI provides only seven configuration
>> registers and we are reading the eighth position of this u32 array.
>>
>> Therefore, fix the out-of-bounds read in `v3d_csd_job_run()` by
>> accessing only seven positions on the '__u32 [7]' array. The eighth
>> register exists indeed on V3D 7.1, but it isn't currently used. That
>> being so, let's guarantee that it remains unused and add a note that
>> it
>> could be set in a future patch.
>>
>> Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D
>> 7.x")
>> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_sched.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>> b/drivers/gpu/drm/v3d/v3d_sched.c
>> index fd29a00b233c..e1565cf84abd 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -317,7 +317,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>>   	struct v3d_dev *v3d = job->base.v3d;
>>   	struct drm_device *dev = &v3d->drm;
>>   	struct dma_fence *fence;
>> -	int i, csd_cfg0_reg, csd_cfg_reg_count;
>> +	int i, csd_cfg0_reg;
>>   
>>   	v3d->csd_job = job;
>>   
>> @@ -337,9 +337,17 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>>   	v3d_switch_perfmon(v3d, &job->base);
>>   
>>   	csd_cfg0_reg = V3D_CSD_QUEUED_CFG0(v3d->ver);
>> -	csd_cfg_reg_count = v3d->ver < 71 ? 6 : 7;
>> -	for (i = 1; i <= csd_cfg_reg_count; i++)
>> +	for (i = 1; i <= 6; i++)
>>   		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, job-
>>> args.cfg[i]);
>> +
>> +	/* Although V3D 7.1 has an eighth configuration register, we
>> are not
>> +	 * using it. Therefore, make sure it remains unused.
>> +	 *
>> +	 * XXX: Set the CFG7 register
>> +	 */
>> +	if (v3d->ver >= 71)
>> +		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, 0);
>> +
> 
> Since we know we want to write CFG7 I'd suggest that we just write that
> directly (csd_cfg0_reg + 4 * 7), instead of making it depend on the
> value of 'i' exiting the previous loop. I think that makes it more
> robust against future changes. Either way:
> 
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

I decided to go with:

V3D_CORE_WRITE(0, V3D_V7_CSD_QUEUED_CFG7, 0);

to make sure that we are writing the CFG7 register.

I pushed the patch to drm/misc/drm-misc-fixes! Thanks for the review!

Best Regards,
- Maíra

> 
> Iago
> 
> 
>>   	/* CFG0 write kicks off the job. */
>>   	V3D_CORE_WRITE(0, csd_cfg0_reg, job->args.cfg[0]);
>>   
> 
