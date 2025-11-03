Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF7C2D845
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E65A10E4AB;
	Mon,  3 Nov 2025 17:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D/EJDKWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB26F10E4AB;
 Mon,  3 Nov 2025 17:45:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 823AE41A66;
 Mon,  3 Nov 2025 17:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09D4C4CEF8;
 Mon,  3 Nov 2025 17:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762191914;
 bh=W+qr5DwMeVjhNwTz4GD8p3W4iUptYbkU5ExtMChr/xo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D/EJDKWk966ytiAE0+j5TuPyzBCXXDpboYv3OUu2QbF7sd8Ee5gkdzs9sS1n8zWSk
 vK1mdIM1LCd2RxmfwB/X0UwPPwBQR/UIFyddjyGJcGcgJWTAM11cf24B1QlNtADpT1
 y9WR+I8EtyRz/fiomZ9jwWKv6uI2nuWgOije/uYCeUIqRTTu3tBHClKPW88zgmG+/t
 OSxgWAwzyEqm9DEP9/x0D1byujZlePfo3lL0LyOTjWj0rs9OxtSsbBrcOFDDB8Y3l8
 YTMpthcTueMGrU11TO4d59WlF7c5j7oDsg5267Koxw/yaQs6fbhVO0pp44ZgVwR7pf
 pkWR85TYbXAzg==
Message-ID: <a0802bd3-2998-4149-8035-4fbd73ce911f@kernel.org>
Date: Mon, 3 Nov 2025 11:45:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Documentation/amdgpu: Add UMA carveout details
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, anson.tsao@amd.com
References: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
 <20251103-vram-carveout-tuning-for-upstream-v1-5-17e2a72639c5@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-5-17e2a72639c5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 11/3/2025 1:51 AM, Yo-Jung Leo Lin (AMD) wrote:
> Add documentation for the uma_carveout_options and uma_carveout
> attributes in sysfs
> 
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>   Documentation/gpu/amdgpu/driver-misc.rst     | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 +++++++++++++++++
>   2 files changed, 43 insertions(+)
> 
> diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
> index 25b0c857816e..5a71fa9c6782 100644
> --- a/Documentation/gpu/amdgpu/driver-misc.rst
> +++ b/Documentation/gpu/amdgpu/driver-misc.rst
> @@ -128,3 +128,29 @@ smartshift_bias
>   
>   .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>      :doc: smartshift_bias
> +
> +UMA Carveout
> +============
> +
> +Some versions of Atom ROM expose available options for the VRAM carveout sizes,
> +and allow changes to the carveout size via the ATCS function code 0xA on supported
> +BIOS implementation.
> +
> +For those platforms, users can use the following file to set the carveout size,
> +in a way similar to what Windows users can do in the "Tuning" tab in AMD
> +Adrenalin.
> +
> +Note that for BIOS implementations that don't support this, these files will not
> +get created at all.
> +
> +uma_carveout_options
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +   :doc: uma_carveout_options
> +
> +uma_carveout
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +   :doc: uma_carveout

How do you feel about adding some sample output from a test system for 
both files?  This might make it easier for userspace to implement 
parsing it.

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> index 1ebfd925b761..e9f71888ce57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> @@ -1855,6 +1855,17 @@ const struct attribute_group amdgpu_vbios_version_attr_group = {
>   	.is_visible = amdgpu_vbios_version_attrs_is_visible,
>   };
>   
> +/**
> + * DOC: uma_carveout
> + *
> + * This file is both readable and writable. When read, it shows the
> + * index of the current setting. Writing a valid index to this file
> + * allows users to change the UMA carveout size to the selected option
> + * on the next boot.
> + *
> + * The available options and their corresponding indices can be read
> + * from the uma_carveout_options file.
> + */
>   static ssize_t uma_carveout_show(struct device *dev,
>   				 struct device_attribute *attr,
>   				 char *buf)
> @@ -1904,6 +1915,12 @@ static ssize_t uma_carveout_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(uma_carveout);
>   
> +/**
> + * DOC: uma_carveout_options
> + *
> + * This is a read-only file that lists all available UMA allocation
> + * options and their corresponding indices.
> + */
>   static ssize_t uma_carveout_options_show(struct device *dev,
>   					 struct device_attribute *attr,
>   					 char *buf)
> 

