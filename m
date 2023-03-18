Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899206BFB69
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 17:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA97510E0FB;
	Sat, 18 Mar 2023 16:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745610E0CA;
 Sat, 18 Mar 2023 16:07:46 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y184so5955581oiy.8;
 Sat, 18 Mar 2023 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679155666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRd8rMIKBhZVRtYAEJZJKErtUMesSi+Qq3quQoKizSc=;
 b=K0fe5QN6EwCE4L5tsvTwoqD8NAUsQuAs82LxK64mfIHjIPw+1RfOCbmgbss+vZQ3kG
 hnjsvg48F2sR7CBr8wbU2Ria1kZfUEo9ixTuCR8G54bljq4uaXWeGpx+ZliTpbUv88EF
 AU/xaqMrtLx8MfTIXm2yPCM7FZLMKX/tADZsUFtAw8BjxzPPteKA/fFiJM8ZPy83R8xT
 /YZ4eiR9qYY5sjcy8hqeeQ8q0FE9XUouXATvYT1NuxurD0ziDQizmOzPJM/UVLmWqWhq
 Gv4xV1BIkcGIZhVQzCUR6bll3q871he5HoaEmmON2knVYCyZDfHgmvJZQSkNE9L97OM+
 bI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679155666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRd8rMIKBhZVRtYAEJZJKErtUMesSi+Qq3quQoKizSc=;
 b=prjJ7v8j0cifI3DdCJaXrW0eqQhi1cuMdPSvx8qmMAE1q6ardW8O3SMD5fqiBEeAFV
 rbQArpI39WoFSOsIb3wpqxbTsHaiiqgjkstQWGcs5hGycz3HEwO97TMYdsuvGBEDeEZm
 6KowQozMjO+F4sjAloEfPtyLIgeZ370nIz2rXu9yb6YLalU0Isl5vIcGqBYRTRBpcYBF
 522DSQgG5OkjQUPhxegWbX94VVsz6OJ6F4sEVaoMf8vimtkRTgIg0u8LZOe0NGdBURuY
 GXTUSBz6RY+RviGEJ1r88vGCesnh96EehpQyHq1M8jrwBUDJ04P3tW6eI9oNvR6WznYA
 hZsw==
X-Gm-Message-State: AO0yUKWWLXMOmyuiTu835CfVUohmWfvXQAOLrV7CqcfXhU2lHisUOS/i
 YJWSC/iBwLDj/gYd4Rtw0d85G3tTF/Ub+yILp4U=
X-Google-Smtp-Source: AK7set/g2cBdSlkSL6yFkgoFNK4mVOZBj/6q3tfTUhQUfIwTLvYEcOGKTGOqV7w2a9EpEFATaG2pHAXSd8gu9s8eOPU=
X-Received: by 2002:aca:654b:0:b0:384:1cf9:912e with SMTP id
 j11-20020aca654b000000b003841cf9912emr4262735oiw.5.1679155665989; Sat, 18 Mar
 2023 09:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-10-robdclark@gmail.com>
 <CAOFGe944_xJOJ3a-uJDVyca_1_+aYTqat4=Qc3CC1wUubxw3XQ@mail.gmail.com>
In-Reply-To: <CAOFGe944_xJOJ3a-uJDVyca_1_+aYTqat4=Qc3CC1wUubxw3XQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 18 Mar 2023 09:07:35 -0700
Message-ID: <CAF6AEGuE3hP=QTVS01PxndnC6kWW3HJe8JfPHZ3C6K6kkip5pQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v10 09/15] drm/syncobj: Add deadline support
 for syncobj waits
To: Faith Ekstrand <faith@gfxstrand.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Matt Turner <mattst88@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 12:08=E2=80=AFPM Faith Ekstrand <faith@gfxstrand.ne=
t> wrote:
>
>
> On Wed, Mar 8, 2023 at 9:54=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Add a new flag to let userspace provide a deadline as a hint for syncobj
>> and timeline waits.  This gives a hint to the driver signaling the
>> backing fences about how soon userspace needs it to compete work, so it
>> can addjust GPU frequency accordingly.  An immediate deadline can be
>> given to provide something equivalent to i915 "wait boost".
>>
>> v2: Use absolute u64 ns value for deadline hint, drop cap and driver
>>     feature flag in favor of allowing count_handles=3D=3D0 as a way for
>>     userspace to probe kernel for support of new flag
>> v3: More verbose comments about UAPI
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 64 ++++++++++++++++++++++++++++-------
>>  include/uapi/drm/drm.h        | 17 ++++++++++
>>  2 files changed, 68 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj=
.c
>> index 0c2be8360525..a85e9464f07b 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -126,6 +126,11 @@
>>   * synchronize between the two.
>>   * This requirement is inherited from the Vulkan fence API.
>>   *
>> + * If &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE is set, the ioctl will also=
 set
>> + * a fence deadline hint on the backing fences before waiting, to provi=
de the
>> + * fence signaler with an appropriate sense of urgency.  The deadline i=
s
>> + * specified as an absolute &CLOCK_MONOTONIC value in units of ns.
>> + *
>>   * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncob=
j
>>   * handles as well as an array of u64 points and does a host-side wait =
on all
>>   * of syncobj fences at the given points simultaneously.
>> @@ -973,7 +978,8 @@ static signed long drm_syncobj_array_wait_timeout(st=
ruct drm_syncobj **syncobjs,
>>                                                   uint32_t count,
>>                                                   uint32_t flags,
>>                                                   signed long timeout,
>> -                                                 uint32_t *idx)
>> +                                                 uint32_t *idx,
>> +                                                 ktime_t *deadline)
>>  {
>>         struct syncobj_wait_entry *entries;
>>         struct dma_fence *fence;
>> @@ -1053,6 +1059,15 @@ static signed long drm_syncobj_array_wait_timeout=
(struct drm_syncobj **syncobjs,
>>                         drm_syncobj_fence_add_wait(syncobjs[i], &entries=
[i]);
>>         }
>>
>> +       if (deadline) {
>> +               for (i =3D 0; i < count; ++i) {
>> +                       fence =3D entries[i].fence;
>> +                       if (!fence)
>> +                               continue;
>> +                       dma_fence_set_deadline(fence, *deadline);
>> +               }
>> +       }
>> +
>>         do {
>>                 set_current_state(TASK_INTERRUPTIBLE);
>>
>> @@ -1151,7 +1166,8 @@ static int drm_syncobj_array_wait(struct drm_devic=
e *dev,
>>                                   struct drm_file *file_private,
>>                                   struct drm_syncobj_wait *wait,
>>                                   struct drm_syncobj_timeline_wait *time=
line_wait,
>> -                                 struct drm_syncobj **syncobjs, bool ti=
meline)
>> +                                 struct drm_syncobj **syncobjs, bool ti=
meline,
>> +                                 ktime_t *deadline)
>>  {
>>         signed long timeout =3D 0;
>>         uint32_t first =3D ~0;
>> @@ -1162,7 +1178,8 @@ static int drm_syncobj_array_wait(struct drm_devic=
e *dev,
>>                                                          NULL,
>>                                                          wait->count_han=
dles,
>>                                                          wait->flags,
>> -                                                        timeout, &first=
);
>> +                                                        timeout, &first=
,
>> +                                                        deadline);
>>                 if (timeout < 0)
>>                         return timeout;
>>                 wait->first_signaled =3D first;
>> @@ -1172,7 +1189,8 @@ static int drm_syncobj_array_wait(struct drm_devic=
e *dev,
>>                                                          u64_to_user_ptr=
(timeline_wait->points),
>>                                                          timeline_wait->=
count_handles,
>>                                                          timeline_wait->=
flags,
>> -                                                        timeout, &first=
);
>> +                                                        timeout, &first=
,
>> +                                                        deadline);
>>                 if (timeout < 0)
>>                         return timeout;
>>                 timeline_wait->first_signaled =3D first;
>> @@ -1243,17 +1261,22 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, v=
oid *data,
>>  {
>>         struct drm_syncobj_wait *args =3D data;
>>         struct drm_syncobj **syncobjs;
>> +       unsigned possible_flags;
>> +       ktime_t t, *tp =3D NULL;
>>         int ret =3D 0;
>>
>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>>                 return -EOPNOTSUPP;
>>
>> -       if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
>> -                           DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
>> +       possible_flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
>> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
>> +
>> +       if (args->flags & ~possible_flags)
>>                 return -EINVAL;
>>
>>         if (args->count_handles =3D=3D 0)
>> -               return -EINVAL;
>> +               return 0;
>
>
> Did you intend this change? If so, why? What does waiting with no handles=
 gain us? I mean, it's probably fine but it seems unrelated to this change.
>
>>         ret =3D drm_syncobj_array_find(file_private,
>>                                      u64_to_user_ptr(args->handles),
>> @@ -1262,8 +1285,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, vo=
id *data,
>>         if (ret < 0)
>>                 return ret;
>>
>> +       if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
>> +               t =3D ns_to_ktime(args->deadline_ns);
>> +               tp =3D &t;
>> +       }
>> +
>>         ret =3D drm_syncobj_array_wait(dev, file_private,
>> -                                    args, NULL, syncobjs, false);
>> +                                    args, NULL, syncobjs, false, tp);
>>
>>         drm_syncobj_array_free(syncobjs, args->count_handles);
>>
>> @@ -1276,18 +1304,23 @@ drm_syncobj_timeline_wait_ioctl(struct drm_devic=
e *dev, void *data,
>>  {
>>         struct drm_syncobj_timeline_wait *args =3D data;
>>         struct drm_syncobj **syncobjs;
>> +       unsigned possible_flags;
>> +       ktime_t t, *tp =3D NULL;
>>         int ret =3D 0;
>>
>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>                 return -EOPNOTSUPP;
>>
>> -       if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
>> -                           DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>> -                           DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
>> +       possible_flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
>> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
>> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
>> +
>> +       if (args->flags & ~possible_flags)
>>                 return -EINVAL;
>>
>>         if (args->count_handles =3D=3D 0)
>> -               return -EINVAL;
>> +               return -0;
>
>
> Did you intend this change? -0 is a pretty weird integer.

It balances out the positive zero in the other ioctl :-P

j/k .. I've fixed that typo locally, and renamed deadline_ns to
deadline_nsec to better match timeout_nsec.  But will hold off
re-sending for now unless there are any less cosmetic changes

BR,
-R

>>
>>         ret =3D drm_syncobj_array_find(file_private,
>>                                      u64_to_user_ptr(args->handles),
>> @@ -1296,8 +1329,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device=
 *dev, void *data,
>>         if (ret < 0)
>>                 return ret;
>>
>> +       if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
>> +               t =3D ns_to_ktime(args->deadline_ns);
>> +               tp =3D &t;
>> +       }
>> +
>>         ret =3D drm_syncobj_array_wait(dev, file_private,
>> -                                    NULL, args, syncobjs, true);
>> +                                    NULL, args, syncobjs, true, tp);
>>
>>         drm_syncobj_array_free(syncobjs, args->count_handles);
>>
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 642808520d92..bff0509ac8b6 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
>>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time=
 point to become available */
>> +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence dead=
line based to deadline_ns */
>>  struct drm_syncobj_wait {
>>         __u64 handles;
>>         /* absolute timeout */
>> @@ -895,6 +896,14 @@ struct drm_syncobj_wait {
>>         __u32 flags;
>>         __u32 first_signaled; /* only valid when not waiting all */
>>         __u32 pad;
>> +       /**
>> +        * @deadline_ns - fence deadline hint
>> +        *
>> +        * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
>> +        * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
>> +        * set.
>> +        */
>> +       __u64 deadline_ns;
>>  };
>>
>>  struct drm_syncobj_timeline_wait {
>> @@ -907,6 +916,14 @@ struct drm_syncobj_timeline_wait {
>>         __u32 flags;
>>         __u32 first_signaled; /* only valid when not waiting all */
>>         __u32 pad;
>> +       /**
>> +        * @deadline_ns - fence deadline hint
>> +        *
>> +        * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
>> +        * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
>> +        * set.
>> +        */
>> +       __u64 deadline_ns;
>>  };
>>
>>
>> --
>> 2.39.2
>>
