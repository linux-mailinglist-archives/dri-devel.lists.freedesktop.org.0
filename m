Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF8AEE8A2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 22:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF16410E4C4;
	Mon, 30 Jun 2025 20:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HhKs9WPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A94A10E4C4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 20:56:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0928961126
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 20:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FDDC4CEF8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751316975;
 bh=PO44svPAYFFi6GiqbWS4Fm1Ty0ssVHLymeJlTxwzafk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HhKs9WPSntjrnVGvwtUXKtRXfRp7ZFQTMeoh2xdI+oPDKiaU8VWwMUVyewuWLutRg
 thNMMLiVjeUeK8jrFPHKkQyxzP2F2NksS+Un0A8qTqqrV8pBLyPcDk6KCv22zCVQYV
 qZ4FU2CVCJSancybT61fdQYX+fdRJEBBnLKiCvNU1+Q4l7zPtuANNbD94XMmClnpQc
 fl1gtL8ERG1fIzjVoe5OuU8vLVx1bKu7M3+zBmUIMmzC0EA6hJf/Xnu2pCN/sSbiII
 ck22XgFecXDsY2l7lnuGZhGrb+5aQiMIxfvnxQbH95E1q4CaoZnFLDAqHjLiwO3N5f
 WnRbpWKBx5XlA==
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-60c93c23b08so4889931a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:56:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUlm8oLDAucf/VsdY+bKUOIk5/Toyv4F2JYZQNAFHT3i0dWgboFXO7olsSTWhVVIXVkgiCoCZei6QI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIRX9vJiATIMF/qSRdi1SKTm/FmalWtk6szYgW09/iTpnyHj5o
 dAm+yrXSQVIoBXaabCpGtjpNfueLvbcYjoFikhU6WNrdVnz7k3rctv4qdApbHihBAW2ZPOIg1aS
 i24AaPcHfLLphVDK5G7E09ZRpcjGikg==
X-Google-Smtp-Source: AGHT+IHN6KYVrLpEyM//LpRHGQ3ciilHAEEns6c2p0uRqrws7WdVXCCQfCRU6orJIR5QnGKwW7fUExXvkMdYX3eTq8k=
X-Received: by 2002:a17:907:868b:b0:ad9:db54:ba47 with SMTP id
 a640c23a62f3a-ae350190c99mr1589912566b.43.1751316973962; Mon, 30 Jun 2025
 13:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Jun 2025 15:56:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJtKCXE0MLaBN5-r+w+2jVwt8UMwHtr-nP0PoBmfNodpg@mail.gmail.com>
X-Gm-Features: Ac12FXy8hWxpEFoW3ELH4IZXVQDuQYuBeJxvmHd6gayxY_Y6diMDIDxJ1A0GBAM
Message-ID: <CAL_JsqJtKCXE0MLaBN5-r+w+2jVwt8UMwHtr-nP0PoBmfNodpg@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
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

On Fri, Jun 6, 2025 at 1:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
>
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
>
> The job submission code was initially based on Panfrost.
>
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
>
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
>
> v6:
> - Use mutexes guard (Markus Elfring)
> - Use u64_to_user_ptr (Jeff Hugo)
> - Drop rocket_fence (Rob Herring)
>
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

[...]

> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -12,8 +12,10 @@ extern "C" {
>  #endif
>
>  #define DRM_ROCKET_CREATE_BO                   0x00
> +#define DRM_ROCKET_SUBMIT                      0x01
>
>  #define DRM_IOCTL_ROCKET_CREATE_BO             DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
> +#define DRM_IOCTL_ROCKET_SUBMIT                        DRM_IOW(DRM_COMMA=
ND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
>
>  /**
>   * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> @@ -37,6 +39,68 @@ struct drm_rocket_create_bo {
>         __u64 offset;
>  };
>
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +       /** Input: DMA address to NPU mapping of register command buffer =
*/
> +       __u64 regcmd;
> +
> +       /** Input: Number of commands in the register command buffer */
> +       __u32 regcmd_count;
> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into accoun=
t its
> + * dependencies with other jobs. All tasks in the same job will be execu=
ted
> + * sequentially on the same core, to benefit from memory residency in SR=
AM.
> + */
> +struct drm_rocket_job {
> +       /** Input: Pointer to an array of struct drm_rocket_task. */
> +       __u64 tasks;
> +
> +       /** Input: Pointer to a u32 array of the BOs that are read by the=
 job. */
> +       __u64 in_bo_handles;
> +
> +       /** Input: Pointer to a u32 array of the BOs that are written to =
by the job. */
> +       __u64 out_bo_handles;
> +
> +       /** Input: Number of tasks passed in. */
> +       __u32 task_count;
> +
> +       /** Input: Number of input BO handles passed in (size is that tim=
es 4). */
> +       __u32 in_bo_handle_count;
> +
> +       /** Input: Number of output BO handles passed in (size is that ti=
mes 4). */
> +       __u32 out_bo_handle_count;
> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to =
the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency or=
der.
> + */
> +struct drm_rocket_submit {
> +       /** Input: Pointer to an array of struct drm_rocket_job. */
> +       __u64 jobs;
> +
> +       /** Input: Number of jobs passed in. */
> +       __u32 job_count;

Isn't there a problem if you need to expand drm_rocket_job beyond
using the 1 reserved field? You can't add to the struct because then
you don't know the size here. So you have to modify drm_rocket_submit
to modify drm_rocket_job. Maybe better if you plan for that now rather
than later by making the size explicit.

Though etnaviv at least has similar issues.

Rob

> +
> +       /** Reserved, must be zero. */
> +       __u32 reserved;
> +};
