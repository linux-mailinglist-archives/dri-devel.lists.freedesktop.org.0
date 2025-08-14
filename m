Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A5B279EC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 09:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895D10E35C;
	Fri, 15 Aug 2025 07:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XC2GZ+Ut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539E10E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 12:33:11 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f4cf9so1270934a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755174790; x=1755779590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBipEr1axl3SPiSJY5lAP7Is5DPeIM3LQNDYK4kl4Ks=;
 b=XC2GZ+Ut6ubb0zP4Zp7oMjTk2DjK+yYZOPsWIh8kBvJr45YuYsW1rMeVk0k9xABCZd
 AQxijUQ99dPh4cTv+b1ssZIzDJUJjsu5OOHR5VyfaHTOJgDmPKmVe/sVLwzi3XlTKeyG
 oDyuXDOEcPKZpWW4m1b9VkpCvXdG/rnhWKW21mFN+jPf/JTxOLkb8cAMrNlin2NuoTIl
 /se/jpVgGqDnSKApkZhPWT87UvBkb5MfzM0qlvcnQmgGlGICseblkdpcK8BRLkCKBgiO
 u7E8yzs9aUL8Xga97i3Xulh/BfR9zKzVBerCmxhVEq403DdSTsSjyO93lNPprbC1wiXv
 +rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755174790; x=1755779590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBipEr1axl3SPiSJY5lAP7Is5DPeIM3LQNDYK4kl4Ks=;
 b=Oa++kcUFSl8rFdbnV1DTyGHX44D1jEXAYPUWnT4MyLbt4rAxTp+l9d5pKkq09FjqfU
 3jLIV7MXT2lWvg0hVWrSuhSxKOmVDtgkg3/J1+LY4lemSOhz5m9D6jjshfiMa3FJmnJj
 CSQdIesIQWp2vZTqPKpfRZXt9m1owFu4zizwrVpUNv2QMxXsirOYlGgclQZxaqxo2Lqm
 a+mSo+/LbTwBxkduBeJ5uUCKn7ICGyL/HKvjuXBfdw3ymFh3OxPy+muu6A3DVn8VEPxu
 0WRill8+JsjbjmKY2tJc9/GrA7SD2ToWovSV09DuboQOxX4FEw82eVBUXTFlXmxSfIxE
 gJQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmoQT4qUCrUzWcgO8Yt8OfeAeAP2OkIiw7nvtlW0AJEq8OttzTaSluZTM57kaccA7MzzxG3TiXV8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWHZ+oH97yU87qxYS5LIa7/st0RIJtbFhXhHQPxdm33xnDfFKF
 EYHEZOExb7NV9hRDqmw7D0E29dPtcQKZtyx+Omt7exZ5FNwubRjL3jeBLYPOfyfZv4C4zdnlCFO
 hvTSB01WLnwctl5EqQ4Pcrp4FabAu1B8=
X-Gm-Gg: ASbGncv8U2+HWNCdPq18uEr6SlxOUcKt3mx27/owyijiNn+wbcRo+QWGt/LQ64bWpD6
 Tfg7pwnLPunTHdOi7JZa3YpC0DfXYll1S3yuHGQqn9n/bN5bkFhBF4sXIE0h/yxljSBnsF7TWRy
 vdLyj2BUth5ajnHcJYqac0mPR0f4brWZYil6C9BN7EI3GhL/Ob0jUgZS8O4lJqznuQewQxxVWlF
 eVRmKc7X4BMKCNW9AlcM7JE9+v+eQdh3ptmMZLUiA==
X-Google-Smtp-Source: AGHT+IFklPkagBi4qj9Em8Q8OOxPX4aA+yWYxdhv27/TKfOtk4iREtEx5QyBgiSxE+dfYLyY1kXX1ZHiN7oFGc1824o=
X-Received: by 2002:a05:6402:2111:b0:615:684c:c2d6 with SMTP id
 4fb4d7f45d1cf-6188b97241fmr2792152a12.22.1755174789815; Thu, 14 Aug 2025
 05:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE-K+BcU2vQPXyK9bdWTkRD_jreEcmD6zmnKrwut_7mCNv7bw@mail.gmail.com>
 <854286215216fe5242f3232032625b4fbe62074e@intel.com>
In-Reply-To: <854286215216fe5242f3232032625b4fbe62074e@intel.com>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Thu, 14 Aug 2025 18:02:58 +0530
X-Gm-Features: Ac12FXzUOxQB82Zau_F0RDkSi6XcRB_sBFTT4mgciZq-4AAy1LIvhK2KAWfOA40
Message-ID: <CAJE-K+Ca95Qx_6sbj2S=PfwXbMoaK5A97yWqQutTVN4aKQdu+Q@mail.gmail.com>
Subject: Re: PATCH[1/1] DRM_GPUVM.C : htmldoc error due to multi-line code
 inside comment
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "dakr@redhat.com" <dakr@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 15 Aug 2025 07:17:25 +0000
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

Thank you Jani
[BUG: Comment parsing error]
What I did -> Applied the patch, you referred [1]
https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.com.
What I got-> error message pasted below.
What I think might be the problem -> I believe ampersand's are being
parsed as ':c:type:' while document generation

--------ERROR MESSAGE START:---------
linux/Documentation/gpu/drm-mm:506:
./drivers/gpu/drm/drm_gpuvm.c:2434: WARNING: Lexing literal_block
'vm_bind {\n    struct drm_exec exec;\n\n    // IGNORE_DUPLICATES is
required, INTERRUPTIBLE_WAIT is recommended:\n
drm_exec_init(:c:type:`exec`, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT,
0);\n\n    drm_exec_until_all_locked (:c:type:`exec`) {\n
for_each_vm_bind_operation {\n            switch (op->op) {\n
  case DRIVER_OP_UNMAP:\n                ret =3D
drm_gpuvm_sm_unmap_exec_lock(gpuvm, :c:type:`exec`, op->addr,
op->range);\n                break;\n            case DRIVER_OP_MAP:\n
               ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, :c:type:`exec`,
num_fences,\n
op->addr, op->range,\n
obj, op->obj_offset);\n                break;\n            }\n\n
     drm_exec_retry_on_contention(:c:type:`exec`);\n            if
(ret)\n                return ret;\n        }\n    }\n}' as "c"
resulted in an error at token: '`'. Retrying in relaxed mode.
[misc.highlighting_failure]
--------ERROR MESSAGE END:---------
PS: reporting this first, to give heads up, parallely trying to debug.


On Wed, Aug 13, 2025 at 4:00=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 12 Aug 2025, Sidharth Seela <sidharthseela@gmail.com> wrote:
> > Dear Maintainers,
> > This is my first patch, please bear with me.
> > I request you to suggest if it can be better.
> > Your time is appreciated.
>
> A simpler fix is already on the list [1].
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/20250810150706.305040-1-rampxxxx@gmail.com
>
> > -----------------------------------------------------------------------=
----
> > commit 4ed9c00376c616cdbfb978b5fd76911cccd63b26
> > Author:     Sidharth Seela <sid@y740.local>
> > AuthorDate: Tue Aug 12 15:56:03 2025 +0530
> > Commit:     Sidharth Seela <sid@y740.local>
> > CommitDate: Tue Aug 12 15:56:03 2025 +0530
> >
> >     cleaned up errors stemming for multiline text
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 50 ++++++++++++++++++-------------------
> >  1 file changed, 25 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index bbc7fecb6f4a..cf49dbfcec91 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2432,31 +2432,31 @@ static const struct drm_gpuvm_ops lock_ops =3D =
{
> >   *
> >   * The expected usage is:
> >   *
> > - *    vm_bind {
> > - *        struct drm_exec exec;
> > - *
> > - *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is reco=
mmended:
> > - *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT,=
 0);
> > - *
> > - *        drm_exec_until_all_locked (&exec) {
> > - *            for_each_vm_bind_operation {
> > - *                switch (op->op) {
> > - *                case DRIVER_OP_UNMAP:
> > - *                    ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm,
> > &exec, op->addr, op->range);
> > - *                    break;
> > - *                case DRIVER_OP_MAP:
> > - *                    ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec,
> > num_fences,
> > - *                                                     op->addr, op->r=
ange,
> > - *                                                     obj, op->obj_of=
fset);
> > - *                    break;
> > - *                }
> > - *
> > - *                drm_exec_retry_on_contention(&exec);
> > - *                if (ret)
> > - *                    return ret;
> > - *            }
> > - *        }
> > - *    }
> > + * *   vm_bind {
> > + * *       struct drm_exec exec;
> > + * *
> > + * *       // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is rec=
ommended:
> > + * *       drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT=
, 0);
> > + * *
> > + * *       drm_exec_until_all_locked (&exec) {
> > + * *           for_each_vm_bind_operation {
> > + * *               switch (op->op) {
> > + * *               case DRIVER_OP_UNMAP:
> > + * *                   ret =3D drm_gpuvm_sm_unmap_exec_lock(gpuvm,
> > &exec, op->addr, op->range);
> > + * *                   break;
> > + * *               case DRIVER_OP_MAP:
> > + * *                   ret =3D drm_gpuvm_sm_map_exec_lock(gpuvm, &exec=
,
> > num_fences,
> > + * *                                                    op->addr, op->=
range,
> > + * *                                                    obj, op->obj_o=
ffset);
> > + * *                   break;
> > + * *               }
> > + * *
> > + * *               drm_exec_retry_on_contention(&exec);
> > + * *               if (ret)
> > + * *                   return ret;
> > + * *           }
> > + * *       }
> > + * *   }
> >   *
> >   * This enables all locking to be performed before the driver begins m=
odifying
> >   * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BI=
ND_OPs,
> > --
> > 2.39.5
> > signed-off-by:Sidharth Seela<sidharthseela@gmail.com>
>
> --
> Jani Nikula, Intel



--=20
Thanks,
Sidharth Seela
+91 - 8826248419
www.realtimedesign.org
