Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146DA1A2A6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CAF10E7D2;
	Thu, 23 Jan 2025 11:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N8+etfwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1310E7D2;
 Thu, 23 Jan 2025 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9lBrwvrvwnBKB2UGwpPVeuf/hT7Rag2nWolvnU4A/UQ=; b=N8+etfwDMmqS+gD9DfogntFxZm
 URtu0Wo1qGGEc7NT+HPmrOz71vTwEEBEuxqwIgJYJM4iI9vRe30/Vh1aubFGjfdDPKSCvaMsyV8JP
 PkNtAw7H1+WL9qLDE0tYMyXUd5q71FpQUZW8vhQMFxFSYpHsUq2WMek3E/uvcVXfHgryIxvzYGXk5
 4G13UU5xf9JS1iRJSXXD/0Q0c4b8jGFKcspUKSfNvV32tUh3FrtcR+OF2AOKwWBHmrQaoBZw06dbx
 WZ/RBAKtat0k5/xCZNzS/bueUCbKIfXV0lbkH7jb7xY7/9tiiXn4hlMalVhYIsKLiiRamNz88aepP
 eqf9EoeQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tav6K-001ASW-M5; Thu, 23 Jan 2025 12:10:20 +0100
Message-ID: <ec4bb0f6-c366-40e7-a1df-332458b08eec@igalia.com>
Date: Thu, 23 Jan 2025 08:10:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
 <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
 <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
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

Hi Philipp,

On 23/01/25 05:10, Philipp Stanner wrote:
> On Wed, 2025-01-22 at 19:07 -0300, Maíra Canal wrote:
>> Hi Philipp,
>>
>> On 22/01/25 11:08, Philipp Stanner wrote:
>>> drm_sched_init() has a great many parameters and upcoming new
>>> functionality for the scheduler might add even more. Generally, the
>>> great number of parameters reduces readability and has already
>>> caused
>>> one missnaming in:
>>>
>>> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
>>> nouveau_sched_init()").
>>>
>>> Introduce a new struct for the scheduler init parameters and port
>>> all
>>> users.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>

[...]

>>
>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>>> b/drivers/gpu/drm/v3d/v3d_sched.c
>>> index 99ac4995b5a1..716e6d074d87 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>> @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
>>> v3d_cpu_sched_ops = {
>>>    	.free_job = v3d_cpu_job_free
>>>    };
>>>    
>>> +/*
>>> + * v3d's scheduler instances are all identical, except for ops and
>>> name.
>>> + */
>>> +static void
>>> +v3d_common_sched_init(struct drm_sched_init_params *params, struct
>>> device *dev)
>>> +{
>>> +	memset(params, 0, sizeof(struct drm_sched_init_params));
>>> +
>>> +	params->submit_wq = NULL; /* Use the system_wq. */
>>> +	params->num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>> +	params->credit_limit = 1;
>>> +	params->hang_limit = 0;
>>> +	params->timeout = msecs_to_jiffies(500);
>>> +	params->timeout_wq = NULL; /* Use the system_wq. */
>>> +	params->score = NULL;
>>> +	params->dev = dev;
>>> +}
>>
>> Could we use only one function that takes struct v3d_dev *v3d, enum
>> v3d_queue, and sched_ops as arguments (instead of one function per
>> queue)? You can get the name of the scheduler by concatenating "v3d_"
>> to
>> the return of v3d_queue_to_string().
>>
>> I believe it would make the code much simpler.
> 
> Hello,
> 
> so just to get that right:
> You'd like to have one universal function that switch-cases over an
> enum, sets the ops and creates the name with string concatenation?
> 
> I'm not convinced that this is simpler than a few small functions, but
> it's not my component, so…
> 
> Whatever we'll do will be simpler than the existing code, though. Right
> now no reader can see at first glance whether all those schedulers are
> identically parametrized or not.
> 

This is my proposal (just a quick draft, please check if it compiles):

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c 
b/drivers/gpu/drm/v3d/v3d_sched.c
index 961465128d80..7cc45a0c6ca0 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -820,67 +820,62 @@ static const struct drm_sched_backend_ops 
v3d_cpu_sched_ops = {
         .free_job = v3d_cpu_job_free
  };

+static int
+v3d_sched_queue_init(struct v3d_dev *v3d, enum v3d_queue queue,
+                    const struct drm_sched_backend_ops *ops, const char 
*name)
+{
+       struct drm_sched_init_params params = {
+               .submit_wq = NULL,
+               .num_rqs = DRM_SCHED_PRIORITY_COUNT,
+               .credit_limit = 1,
+               .hang_limit = 0,
+               .timeout = msecs_to_jiffies(500),
+               .timeout_wq = NULL,
+               .score = NULL,
+               .dev = v3d->drm.dev,
+       };
+
+       params.ops = ops;
+       params.name = name;
+
+       return drm_sched_init(&v3d->queue[queue].sched, &params);
+}
+
  int
  v3d_sched_init(struct v3d_dev *v3d)
  {
-       int hw_jobs_limit = 1;
-       int job_hang_limit = 0;
-       int hang_limit_ms = 500;
         int ret;

-       ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-                            &v3d_bin_sched_ops, NULL,
-                            DRM_SCHED_PRIORITY_COUNT,
-                            hw_jobs_limit, job_hang_limit,
-                            msecs_to_jiffies(hang_limit_ms), NULL,
-                            NULL, "v3d_bin", v3d->drm.dev);
+       ret = v3d_sched_queue_init(v3d, V3D_BIN, &v3d_bin_sched_ops,
+                                  "v3d_bin");
         if (ret)
                 return ret;

-       ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-                            &v3d_render_sched_ops, NULL,
-                            DRM_SCHED_PRIORITY_COUNT,
-                            hw_jobs_limit, job_hang_limit,
-                            msecs_to_jiffies(hang_limit_ms), NULL,
-                            NULL, "v3d_render", v3d->drm.dev);
+       ret = v3d_sched_queue_init(v3d, V3D_RENDER, &v3d_render_sched_ops,
+                                  "v3d_render");
         if (ret)
                 goto fail;

[...]

At least for me, this looks much simpler than one function for each
V3D queue.

Best Regards,
- Maíra

> P.
> 
> 
>>
>> Best Regards,
>> - Maíra
>>

