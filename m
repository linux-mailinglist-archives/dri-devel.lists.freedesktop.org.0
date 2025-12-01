Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D034C98F60
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5D810E482;
	Mon,  1 Dec 2025 20:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDWlv1Wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92D10E481
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 20:07:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7ae1c96ece1so313817b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 12:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764619655; x=1765224455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFlkh0x1NbS1t8t4BD8VPVaskiHRE+O0jVwyL6SlPB8=;
 b=gDWlv1Wh+VI8Ehuqqx4SWsx113s+XlMuQJa48+YlvJ5BmlKBA8aXcPoa3EgxMiWk+D
 zTWhRwzjn6DBzQtx3NO5plj5F316+CQh+m6fegj71Fc7d5xatU3ePmEGv3wDA6dsO3mK
 g4/HHzCaP65nYMUkTgV5vVAC4XtjdDjJdd3BXVHJwHtL//IME7HWUNc6z3ALCTIdXMV3
 KvNvJukJKfhwArnx6eqrUj9Rqnys1dtrDc5Rhh7/wcECWcpiwWW4lcJ23pLlvaDisnrN
 SYdfBPG/3RJ5PEBJoRj8+Il+m5kP7fvAL7NuURpK+xJOj2VxvPYAkC9KTtXszDN+rdPA
 Zr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764619655; x=1765224455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BFlkh0x1NbS1t8t4BD8VPVaskiHRE+O0jVwyL6SlPB8=;
 b=BgAigXr1UKRNpxIT+zgH/scSz28JvcPyUqVSbSbCg1vY3bVkRMLKE/xwk/Xtm4sXoE
 46OPRkqcU2G4Mj8lx+R6tYs8Sa58GKy4hFUjM+DkxnlXzha+dgOmTie8nujIVaGNbI3w
 JqPAu86AqmoP8axmPoESRaXQqmy5cmnJuwgj/06w90YnVyHgz5ZVG8sfGZmxymC7mJSV
 7D6RBOaOhBy0rlhXFXRysJ0Q/JGB7eY8VBDioHywhXrCcCCUNQpyBOXNLQmhJ8b0twp+
 XzXCfiJ28EQtJxiJGPRFhlUDviW0eEpYp0gBEIH2fDfxt2BeSfe5UOQ9quHUYL8fTLRV
 UYPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU++BUd+vQ8+Ov0CHI5jQoSwbz751EaKwTLHA667rPkOmfhDKayRivA6keDzLqENukfoFQp8DOv/KA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywFKjK2IDgDw8pAYiVC+4DGE4NuGhWrt+aQTt1uEG/msMwNmCH
 kCVQWq5GvHrqfTiBZNcFcRbJ5EZ8DJTh1wGuTgezQ+3vNFJZYEut78iJJn9sJsXdRzZX/GrYXca
 5xJVBFPiWMldUwpuUn7pI4B7/RRFEy0o=
X-Gm-Gg: ASbGncvaSc8HLgW2uu8bzHRqTFtKUqcGCpRhcj+DYxBnPisB/+RDxHvPuGECPeVUoZq
 WG5jf3xWTYktaKoE/jGwJbUMZlRNl6PV+XaMg7mCfDwRnOJdYIucQ0wME44Eo/B7AZ/TpHoTZ5M
 KAKBawR0+siJ/n8HO5jBkQ/pe6Ta3w+YqUGPW2i11boXSUotnwP78G8yqGwX1tzhMVCTEZB7dvm
 iy6Vz2I6kyxhNiqtrBLEKKhPekmAzh2Ab1AGVREBNQ68rxJ4Sfqf7guCbjcf4+K3USv3eI=
X-Google-Smtp-Source: AGHT+IFjpTqQA/iVKOmnPlXFftG449Zgj2MyZF1V2Usatcen0jqoEPFaxyLMnJPN79+d1UKCZT1eRBJWm/HIcRCi2Ok=
X-Received: by 2002:a05:7022:ea48:10b0:11b:aff2:4cd5 with SMTP id
 a92af1059eb24-11c9d717ef2mr17763072c88.2.1764619654777; Mon, 01 Dec 2025
 12:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
 <20251201-vram-carveout-tuning-for-upstream-v4-5-9e151363b5ab@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-5-9e151363b5ab@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Dec 2025 15:07:23 -0500
X-Gm-Features: AWmQ_bmEAiYSVqdTHhyDGqmv5Ses8SmGqN4749Kj9liHcOpiVpdUt9DVbmJ1CX8
Message-ID: <CADnq5_M6MVRi8SBjtQvnsR1hZU9qRYEPXQ2vc92x3nQPY-QHcA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] Documentation/amdgpu: Add UMA carveout details
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>, 
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
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

On Mon, Dec 1, 2025 at 6:19=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.c=
om> wrote:
>
> Add documentation for the uma/carveout_options and uma/carveout
> attributes in sysfs
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/amdgpu/driver-misc.rst | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 29 ++++++++++++++++++++++++++=
+++
>  2 files changed, 55 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu=
/amdgpu/driver-misc.rst
> index 25b0c857816e..cd6f044bea85 100644
> --- a/Documentation/gpu/amdgpu/driver-misc.rst
> +++ b/Documentation/gpu/amdgpu/driver-misc.rst
> @@ -128,3 +128,29 @@ smartshift_bias
>
>  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: smartshift_bias
> +
> +UMA Carveout
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Some versions of Atom ROM expose available options for the VRAM carveout=
 sizes,
> +and allow changes to the carveout size via the ATCS function code 0xA on=
 supported
> +BIOS implementations.
> +
> +For those platforms, users can use the following files under uma/ to set=
 the
> +carveout size, in a way similar to what Windows users can do in the "Tun=
ing"
> +tab in AMD Adrenalin.
> +
> +Note that for BIOS implementations that don't support this, these files =
will not
> +be created at all.
> +
> +uma/carveout_options
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +   :doc: uma/carveout_options
> +
> +uma/carveout
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +   :doc: uma/carveout
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 2c0405cdc436..58f6000f4e54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1248,6 +1248,24 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device =
*adev, int xcc_id,
>         return -ENOENT;
>  }
>
> +/**
> + * DOC: uma/carveout_options
> + *
> + * This is a read-only file that lists all available UMA allocation
> + * options and their corresponding indices. Example output::
> + *
> + *     $ cat uma/carveout_options
> + *     0: Minimum (512 MB)
> + *     1:  (1 GB)
> + *     2:  (2 GB)
> + *     3:  (4 GB)
> + *     4:  (6 GB)
> + *     5:  (8 GB)
> + *     6:  (12 GB)
> + *     7: Medium (16 GB)
> + *     8:  (24 GB)
> + *     9: High (32 GB)
> + */
>  static ssize_t carveout_options_show(struct device *dev,
>                                      struct device_attribute *attr,
>                                      char *buf)
> @@ -1278,6 +1296,17 @@ static ssize_t carveout_options_show(struct device=
 *dev,
>  }
>  static DEVICE_ATTR_RO(carveout_options);
>
> +/**
> + * DOC: uma/carveout
> + *
> + * This file is both readable and writable. When read, it shows the
> + * index of the current setting. Writing a valid index to this file
> + * allows users to change the UMA carveout size to the selected option
> + * on the next boot.
> + *
> + * The available options and their corresponding indices can be read
> + * from the uma/carveout_options file.
> + */
>  static ssize_t carveout_show(struct device *dev,
>                              struct device_attribute *attr,
>                              char *buf)
>
> --
> 2.43.0
>
