Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF9D0D94C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 17:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E010E1FF;
	Sat, 10 Jan 2026 16:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="yIzxQM/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C6410E1FF
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 16:55:01 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-78e7ba9fc29so56432297b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1768064100;
 x=1768668900; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DH27E3fj/H9b1O0Jslm4hH4409cv9B3uymq5ylaIDJA=;
 b=yIzxQM/pCazS6pZOKePwcUeQonLpjkMz8eCX4jesWObhH59ZAPadYGNIoK0qLPSXqG
 Z2zKfcIuORQBpDZnyDZM6/gSW7khPndr9Du+BUkPhpZLWYe7uRnknK5U2yv8C2T+K0Bg
 x1ty6UC4k6/kXRgIg4+Wk1CHhQZrl9BAg+0GnxrxoK0QA/n7IB4uArdlkScU8Mv5Fcai
 It8FXEOkj8h9upJW9RCOhMDTz2Te0tvdV7B78551alibBqrm94DT0fa9HFAG2lXCHZcE
 XZTMs8Q7Ne0EnbJ3/ZW7iSARO67ib+tkzIKgPZcK23/uxmKw+54fOv4Os2rJjP5J3yLS
 tkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768064100; x=1768668900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DH27E3fj/H9b1O0Jslm4hH4409cv9B3uymq5ylaIDJA=;
 b=mGe8os8cr5B+f4wHiJsJ76BsH/fS4ML3rd23GWc+TNKTuYKJVFV6alnGQ6AIPY2lhu
 i5aDADfX3Z9RhfXq8wdWE63innWpuSDKKyMgtICjm8O2jwQriIlOa8dTE30UKM5LYwOS
 k+AF5AiT1xvXeQKOWzv6clHrg/A0xGBP3MxLebMVbj1RBGkONgGVPwis5rtL0HmT31J/
 cxj6JloOiLRyHFqdChK5LqYqTD+jJC2dGQaLny0DLnWzbTFE1f4dYcGdIob8UN46+5N7
 XW8v7QGRRGqIOeJuU1eLGMbg7mFMmlbSwa80T699i0ahe/fs0tYJp8CGSaqn+rnJ2pz+
 ToPg==
X-Gm-Message-State: AOJu0YycKKT/znxLxVFOvwcRz85CxkB2OW7w7QDMs/QLhcXSfRiL9YJ3
 VZse7icnQQp9N97REaIfNyvXZOGXLltE/JYq7Y+aD8zxq79MuYKyeSFh9Zp1/S/KDpOSG/gKeln
 SXzhXcBg=
X-Gm-Gg: AY/fxX7LuOQk3zXb97ZISD/gj0AwtJitjg58Nx4PaGnfo55Axe9Xyvm9D/FFxHl3OrR
 sAntnPOB6KyMy2eiFOBK6EN8YrdBTnn5ywTbURFYadCZXsVnJz+xRrBnFfmJPNc+CB7Ob+cgtY9
 4vD2SfxTAlwzVQbdJZBWS01rNFljUCkDllhd5lSOrqroMrFV1cIyUvV9yFkYM+xawMFgb6czokV
 Fc++5bXMIOSCwwHqdVRu3yskCrASbiYexCuuwEydljLRm2hm42JihosO7SZaUAFEruuKKlEeyFu
 tgp5O1Z88LTqSJubINC805KiS3hHux8EhL8394wdm1n268gFpVDC7nmkKdRc5JinQn3xGF7RkBH
 fMbuXxyXLCTNzJRFFc140kg82qiSQUF6CDLw9GqL91nkCGPQKMZT0iuIBqmCeCBzO232bT1+Pcg
 2ED1Tnj0bItxNBanWDepgrbTmwa2y7YVPYstWDYe1Rub9HOrFe9MngcQ==
X-Google-Smtp-Source: AGHT+IFy8Ix4UROEH/njSsHt7fdBxSjr/0uIhneiaaJp2HyI7got/X4RLSbk7GYQd5mXNQ4cH1RTGA==
X-Received: by 2002:a05:690c:2605:b0:78f:9b43:7dc9 with SMTP id
 00721157ae682-790b56d610cmr132634247b3.70.1768064100274; 
 Sat, 10 Jan 2026 08:55:00 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-790aa6e389esm52052217b3.55.2026.01.10.08.54.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jan 2026 08:54:59 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-79275e61c2cso3636477b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:54:59 -0800 (PST)
X-Received: by 2002:a05:690c:6289:b0:787:d188:525f with SMTP id
 00721157ae682-790b55afdc8mr111872927b3.3.1768064099493; Sat, 10 Jan 2026
 08:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20251023062440.4093661-1-rdunlap@infradead.org>
In-Reply-To: <20251023062440.4093661-1-rdunlap@infradead.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 10 Jan 2026 17:54:48 +0100
X-Gmail-Original-Message-ID: <CAAObsKAwwkaJMw8kc3HejhmgUAotONpR20opTh2=Lz-=wBGKCQ@mail.gmail.com>
X-Gm-Features: AQt7F2rcRZGuxi3eu-zvbiR3kQI9p4cUVJvimTyhmt4c0xp-yit9jWK1H739zYk
Message-ID: <CAAObsKAwwkaJMw8kc3HejhmgUAotONpR20opTh2=Lz-=wBGKCQ@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: rocket_accel.h: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Oded Gabbay <ogabbay@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 23, 2025 at 8:24=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Fix all kernel-doc warnings in rocket_accel.h:
>
> Warning: include/uapi/drm/rocket_accel.h:35 Incorrect use of kernel-doc
>  format:  * Output: DMA address for the BO in the NPU address space.
>  This address
>
> and 22 warnings like these:
>
> Warning: include/uapi/drm/rocket_accel.h:43 struct member 'size'
>  not described in 'drm_rocket_create_bo'
> Warning: include/uapi/drm/rocket_accel.h:60 struct member 'handle'
>  not described in 'drm_rocket_prep_bo'
> Warning: include/uapi/drm/rocket_accel.h:73 struct member 'handle'
>  not described in 'drm_rocket_fini_bo'
> Warning: include/uapi/drm/rocket_accel.h:86 struct member 'regcmd'
>  not described in 'drm_rocket_task'
> Warning: include/uapi/drm/rocket_accel.h:116 struct member 'tasks'
>  not described in 'drm_rocket_job'
> Warning: include/uapi/drm/rocket_accel.h:135 struct member 'jobs'
>  not described in 'drm_rocket_submit'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thank you, pushed it to drm-misc-next.

Best regards,

Tomeu Vizoso

> ---
> Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/uapi/drm/rocket_accel.h |   98 ++++++++++++++++++++++--------
>  1 file changed, 74 insertions(+), 24 deletions(-)
>
> --- linux-next-20251022.orig/include/uapi/drm/rocket_accel.h
> +++ linux-next-20251022/include/uapi/drm/rocket_accel.h
> @@ -26,20 +26,27 @@ extern "C" {
>   *
>   */
>  struct drm_rocket_create_bo {
> -       /** Input: Size of the requested BO. */
> +       /**
> +        * @size: Input: Size of the requested BO.
> +        */
>         __u32 size;
>
> -       /** Output: GEM handle for the BO. */
> +       /**
> +        * @handle: Output: GEM handle for the BO.
> +        */
>         __u32 handle;
>
>         /**
> -        * Output: DMA address for the BO in the NPU address space.  This=
 address
> -        * is private to the DRM fd and is valid for the lifetime of the =
GEM
> -        * handle.
> +        * @dma_address: Output: DMA address for the BO in the NPU addres=
s
> +        * space.  This address is private to the DRM fd and is valid for
> +        * the lifetime of the GEM handle.
>          */
>         __u64 dma_address;
>
> -       /** Output: Offset into the drm node to use for subsequent mmap c=
all. */
> +       /**
> +        * @offset: Output: Offset into the drm node to use for subsequen=
t
> +        * mmap call.
> +        */
>         __u64 offset;
>  };
>
> @@ -50,13 +57,19 @@ struct drm_rocket_create_bo {
>   * synchronization.
>   */
>  struct drm_rocket_prep_bo {
> -       /** Input: GEM handle of the buffer object. */
> +       /**
> +        * @handle: Input: GEM handle of the buffer object.
> +        */
>         __u32 handle;
>
> -       /** Reserved, must be zero. */
> +       /**
> +        * @reserved: Reserved, must be zero.
> +        */
>         __u32 reserved;
>
> -       /** Input: Amount of time to wait for NPU jobs. */
> +       /**
> +        * @timeout_ns: Input: Amount of time to wait for NPU jobs.
> +        */
>         __s64 timeout_ns;
>  };
>
> @@ -66,10 +79,14 @@ struct drm_rocket_prep_bo {
>   * Synchronize caches for NPU access.
>   */
>  struct drm_rocket_fini_bo {
> -       /** Input: GEM handle of the buffer object. */
> +       /**
> +        * @handle: Input: GEM handle of the buffer object.
> +        */
>         __u32 handle;
>
> -       /** Reserved, must be zero. */
> +       /**
> +        * @reserved: Reserved, must be zero.
> +        */
>         __u32 reserved;
>  };
>
> @@ -79,10 +96,15 @@ struct drm_rocket_fini_bo {
>   * A task is the smallest unit of work that can be run on the NPU.
>   */
>  struct drm_rocket_task {
> -       /** Input: DMA address to NPU mapping of register command buffer =
*/
> +       /**
> +        * @regcmd: Input: DMA address to NPU mapping of register command=
 buffer
> +        */
>         __u32 regcmd;
>
> -       /** Input: Number of commands in the register command buffer */
> +       /**
> +        * @regcmd_count: Input: Number of commands in the register comma=
nd
> +        * buffer
> +        */
>         __u32 regcmd_count;
>  };
>
> @@ -94,25 +116,44 @@ struct drm_rocket_task {
>   * sequentially on the same core, to benefit from memory residency in SR=
AM.
>   */
>  struct drm_rocket_job {
> -       /** Input: Pointer to an array of struct drm_rocket_task. */
> +       /**
> +        * @tasks: Input: Pointer to an array of struct drm_rocket_task.
> +        */
>         __u64 tasks;
>
> -       /** Input: Pointer to a u32 array of the BOs that are read by the=
 job. */
> +       /**
> +        * @in_bo_handles: Input: Pointer to a u32 array of the BOs that
> +        * are read by the job.
> +        */
>         __u64 in_bo_handles;
>
> -       /** Input: Pointer to a u32 array of the BOs that are written to =
by the job. */
> +       /**
> +        * @out_bo_handles: Input: Pointer to a u32 array of the BOs that
> +        * are written to by the job.
> +        */
>         __u64 out_bo_handles;
>
> -       /** Input: Number of tasks passed in. */
> +       /**
> +        * @task_count: Input: Number of tasks passed in.
> +        */
>         __u32 task_count;
>
> -       /** Input: Size in bytes of the structs in the @tasks field. */
> +       /**
> +        * @task_struct_size: Input: Size in bytes of the structs in the
> +        * @tasks field.
> +        */
>         __u32 task_struct_size;
>
> -       /** Input: Number of input BO handles passed in (size is that tim=
es 4). */
> +       /**
> +        * @in_bo_handle_count: Input: Number of input BO handles passed =
in
> +        * (size is that times 4).
> +        */
>         __u32 in_bo_handle_count;
>
> -       /** Input: Number of output BO handles passed in (size is that ti=
mes 4). */
> +       /**
> +        * @out_bo_handle_count: Input: Number of output BO handles passe=
d in
> +        * (size is that times 4).
> +        */
>         __u32 out_bo_handle_count;
>  };
>
> @@ -122,16 +163,25 @@ struct drm_rocket_job {
>   * The kernel will schedule the execution of these jobs in dependency or=
der.
>   */
>  struct drm_rocket_submit {
> -       /** Input: Pointer to an array of struct drm_rocket_job. */
> +       /**
> +        * @jobs: Input: Pointer to an array of struct drm_rocket_job.
> +        */
>         __u64 jobs;
>
> -       /** Input: Number of jobs passed in. */
> +       /**
> +        * @job_count: Input: Number of jobs passed in.
> +        */
>         __u32 job_count;
>
> -       /** Input: Size in bytes of the structs in the @jobs field. */
> +       /**
> +        * @job_struct_size: Input: Size in bytes of the structs in the
> +        * @jobs field.
> +        */
>         __u32 job_struct_size;
>
> -       /** Reserved, must be zero. */
> +       /**
> +        * @reserved: Reserved, must be zero.
> +        */
>         __u64 reserved;
>  };
>
