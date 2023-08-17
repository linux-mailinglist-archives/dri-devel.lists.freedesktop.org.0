Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD6780134
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8F210E1A8;
	Thu, 17 Aug 2023 22:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B9610E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:43:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe2a116565so15705e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692312178; x=1692916978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flLL963OZO6MKJl1cOQ/x7lYi72IoXCt4AG7n6UpQJE=;
 b=TTBApXBmE6mxK+ldLEaOyXK1ktIMX8Ll3lLmp6rL4nIHKnK1rAjNjlQyERzLT9MCDd
 sv7MldySXOJj8moWvQol6Jto4duZFtD1Wwm3gyq4MIL0jU16aKLIFmn/p69iNC64yP3x
 Ng2fO9YHyIpX05r29GEaFbswdrFS5XrD3cflAmgMgPYM9Bp+ZKfU1zGNqq2irB3Bo17t
 oy8RLqHQBCt81qzV5N5x7Um/cZ1K3F2XLGDO0POZXfokkgp5ckH847XVVHf0Q1XjBY2t
 BUHq1dNtKEFh18M8JIVFBBWsQcK+bKVO8pLSHLDyNWgrHkxFIV232JhwGSVVoM952Q0s
 n5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692312178; x=1692916978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flLL963OZO6MKJl1cOQ/x7lYi72IoXCt4AG7n6UpQJE=;
 b=NBTT4euVt8WbpaL9yBWrQ/9Kq7XUVk6v1mzEmXWA3u4MxDiulU5V74LaFAYPZJ43nm
 tMSJUhu7Iwv4oTUGs1LeYytXSkjPqoVgP0XvkvRB+bidJx+h1L/Klrm4J7IUysDjZqd4
 0x0wNuPL40dz80uGrOcx9/RvDdQWUkK1cr7qc6RNL3+uswE/zG+cRLAXNczilr1jFdx3
 C/MXTLRBnxBp3ms5YBW9BDM4iqb94dhxpwGqqMm581XbVne92fgYbc2H8Qm/+1k7nEUS
 WdnbkHlomM+idIF9TlDEYYf1MZ/GI/LUOVd37tGI2EHhriIXf+afzXMYZlIGssb2DvrG
 BxLA==
X-Gm-Message-State: AOJu0Yz7wIxaJ0dkL4one/KOh91NgX+UivSUvGaqhSNj7/+5zo3JsEx2
 2TDnQLebiGEkFP+dLX7WXxAc8DJBtGhnWu3Hh0YuGA==
X-Google-Smtp-Source: AGHT+IEz4VrA6B0r/0qbrYh7/rbK8tRJiH424JE9aDodokgMGzo2sPKW8swxWTuYM/YpZy4qbDciJbY9zb5h2KFCPtA=
X-Received: by 2002:a1c:770b:0:b0:3f1:70d1:21a6 with SMTP id
 t11-20020a1c770b000000b003f170d121a6mr46988wmi.0.1692312178730; Thu, 17 Aug
 2023 15:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-15-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-15-sarah.walker@imgtec.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 18 Aug 2023 00:42:21 +0200
Message-ID: <CAG48ez3_ye3jp9Aqn5yi+bjVGWvCJt89TSLW1EOgX_RisXYNBA@mail.gmail.com>
Subject: Re: [PATCH v5 14/17] drm/imagination: Implement job submission and
 scheduling
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 10:25=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.=
com> wrote:
> Implement job submission ioctl. Job scheduling is implemented using
> drm_sched.
[...]
> +/**
> + * pvr_job_data_fini() - Cleanup all allocs used to set up job submissio=
n.
> + * @job_data: Job data array.
> + * @job_count: Number of members of @job_data.
> + */
> +static void
> +pvr_job_data_fini(struct pvr_job_data *job_data, u32 job_count)
> +{
> +       for (u32 i =3D 0; i < job_count; i++) {
> +               pvr_job_put(job_data[i].job);
> +               kvfree(job_data[i].sync_ops);
> +       }
> +}
> +
> +/**
> + * pvr_job_data_init() - Init an array of created jobs, associating them=
 with
> + * the appropriate sync_ops args, which will be copied in.
> + * @pvr_dev: Target PowerVR device.
> + * @pvr_file: Pointer to PowerVR file structure.
> + * @job_args: Job args array copied from user.
> + * @job_count: Number of members of @job_args.
> + * @job_data_out: Job data array.
> + */
> +static int pvr_job_data_init(struct pvr_device *pvr_dev,
> +                            struct pvr_file *pvr_file,
> +                            struct drm_pvr_job *job_args,
> +                            u32 *job_count,
> +                            struct pvr_job_data *job_data_out)
> +{
> +       int err =3D 0, i =3D 0;
> +
> +       for (; i < *job_count; i++) {
> +               job_data_out[i].job =3D
> +                       create_job(pvr_dev, pvr_file, &job_args[i]);
> +               err =3D PTR_ERR_OR_ZERO(job_data_out[i].job);
> +
> +               if (err) {
> +                       *job_count =3D i;
> +                       job_data_out[i].job =3D NULL;
> +                       goto err_cleanup;

I think this bailout looks fine...

> +               }
> +
> +               err =3D PVR_UOBJ_GET_ARRAY(job_data_out[i].sync_ops,
> +                                        &job_args[i].sync_ops);
> +               if (err) {
> +                       *job_count =3D i;
> +                       goto err_cleanup;

... but this bailout looks like it has an off-by-one. We have
initialized the job pointers up to (inclusive) index i...

> +               }
> +
> +               job_data_out[i].sync_op_count =3D job_args[i].sync_ops.co=
unt;
> +       }
> +
> +       return 0;
> +
> +err_cleanup:
> +       pvr_job_data_fini(job_data_out, i);

... but then we pass i to pvr_job_data_fini() as the exclusive limit
of job indices to free? I think this will leave a leaked job around.


> +
> +       return err;
> +}
