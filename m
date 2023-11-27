Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472267F9FFE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 13:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6493610E25C;
	Mon, 27 Nov 2023 12:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F33210E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3/lmcnUmnMK5y4nCD9l0Vh2JGe3w35CLJcHnIftpuPw=; b=lxeBA3+HabN/cj0MkSFHUtJW/l
 IqrfIPAfhlFvN/Wf2qjY6m/UxlUCYApPbbVqxoKeIboIsHMiUvAt8W15/ywsEdimYHYXBnC/8zugA
 meVVfLkbaJiQ5208TINGyf8jMTWHHFbEJsBgnCd2dtt7RsXkmVZccBRDfBZVlCt0Lq/mJf3Iq6y7e
 Le1/xWLfdF/5uN1Zty9HryKof3zMIxeXu2c4rHqR+yC8Xwxz5Hse2K6fg2JqA9HBEI37SGJKyNNkZ
 3ZLZixKElWhFbxBuSs2asPvVTbOdMG9FitnEwoVj1tDBTsvZqwulUvD7N+mdPZw3tsKbw+hhX1cSu
 /z/8kuYQ==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r7b3t-007Zby-Ah; Mon, 27 Nov 2023 13:50:05 +0100
Message-ID: <e1e1d8bd-aa26-7929-5880-5207a1c1f27e@igalia.com>
Date: Mon, 27 Nov 2023 09:50:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/17] drm/v3d: Decouple job allocation from job
 initiation
Content-Language: en-US
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20231124012548.772095-1-mcanal@igalia.com>
 <20231124012548.772095-7-mcanal@igalia.com>
 <cc668d3f010e0dbc8076c9bdc8d6dc66c4d7f579.camel@igalia.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <cc668d3f010e0dbc8076c9bdc8d6dc66c4d7f579.camel@igalia.com>
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
Cc: kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

On 11/27/23 05:12, Iago Toral wrote:
> El jue, 23-11-2023 a las 21:47 -0300, Maíra Canal escribió:
>> We want to allow the IOCTLs to allocate the job without initiating
>> it.
>> This will be useful for the CPU job submission IOCTL, as the CPU job
>> has
>> the need to use information from the user extensions. Currently, the
>> user extensions are parsed before the job allocation, making it
>> impossible to fill the CPU job when parsing the user extensions.
>> Therefore, decouple the job allocation from the job initiation.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_submit.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
>> b/drivers/gpu/drm/v3d/v3d_submit.c
>> index fe46dd316ca0..ed1a310bbd2f 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -135,6 +135,21 @@ void v3d_job_put(struct v3d_job *job)
>>          kref_put(&job->refcount, job->free);
>>   }
>>   
>> +static int
>> +v3d_job_allocate(void **container, size_t size)
>> +{
>> +       if (*container)
>> +               return 0;
> 
> Mmm... is this really what we want? At least right now we expect

Yeah, it is.

> v3d_job_allocate to always allocate memory, is there any scenario in
> which we would expect to call this with an already allocated container?

Take a look here:

   19 int
   18 v3d_submit_cpu_ioctl(struct drm_device *dev, void *data,
   17                      struct drm_file *file_priv)
   16 {
   15         struct v3d_dev *v3d = to_v3d_dev(dev);
   14         struct drm_v3d_submit_cpu *args = data;
   13         struct v3d_submit_ext se = {0};
   12         struct v3d_submit_ext *out_se = NULL;
   11         struct v3d_cpu_job *cpu_job = NULL;
   10         struct v3d_csd_job *csd_job = NULL;
    9         struct v3d_job *clean_job = NULL;
    8         struct ww_acquire_ctx acquire_ctx;
    7         int ret;
    6
    5         if (args->flags && !(args->flags & 
DRM_V3D_SUBMIT_EXTENSION)) {
    4                 DRM_INFO("invalid flags: %d\n", args->flags);
    3                 return -EINVAL;
    2         }
    1
1187         ret = v3d_job_allocate((void *)&cpu_job, sizeof(*cpu_job));
    1         if (ret)
    2                 return ret;

Here we allocate the CPU job, as we need it allocated to fill its fields
with the information in the extensions.

    3
    4         if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
    5                 ret = v3d_get_extensions(file_priv, 
args->extensions, &se, cpu_job);

So, here we filling the CPU job fields with relevant information.

    6                 if (ret) {
    7                         DRM_DEBUG("Failed to get extensions.\n");
    8                         goto fail;
    9                 }
   10         }
   11
   12         /* Every CPU job must have a CPU job user extension */
   13         if (!cpu_job->job_type) {
   14                 DRM_DEBUG("CPU job must have a CPU job user 
extension.\n");
   15                 goto fail;
   16         }
   17
   18         trace_v3d_submit_cpu_ioctl(&v3d->drm, cpu_job->job_type);
   19
   20         ret = v3d_job_init(v3d, file_priv, (void *)&cpu_job, 
sizeof(*cpu_job),
   21                            v3d_job_free, 0, &se, V3D_CPU);

Here we are initiating the job (drm_sched_job_init and syncobjs stuff).
If I don't have this condition in v3d_job_allocate, I would allocate
the container twice.

   22         if (ret)
   23                 goto fail;

Best Regards,
- Maíra

> 
> Iago
> 
>> +
>> +       *container = kcalloc(1, size, GFP_KERNEL);
>> +       if (!*container) {
>> +               DRM_ERROR("Cannot allocate memory for V3D job.\n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   static int
>>   v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>>               void **container, size_t size, void (*free)(struct kref
>> *ref),
>> @@ -145,11 +160,9 @@ v3d_job_init(struct v3d_dev *v3d, struct
>> drm_file *file_priv,
>>          bool has_multisync = se && (se->flags &
>> DRM_V3D_EXT_ID_MULTI_SYNC);
>>          int ret, i;
>>   
>> -       *container = kcalloc(1, size, GFP_KERNEL);
>> -       if (!*container) {
>> -               DRM_ERROR("Cannot allocate memory for v3d job.");
>> -               return -ENOMEM;
>> -       }
>> +       ret = v3d_job_allocate(container, size);
>> +       if (ret)
>> +               return ret;
>>   
>>          job = *container;
>>          job->v3d = v3d;
> 
