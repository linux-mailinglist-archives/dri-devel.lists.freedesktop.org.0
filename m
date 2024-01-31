Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CE9843F9D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 13:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858AE10E424;
	Wed, 31 Jan 2024 12:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9CC10E424;
 Wed, 31 Jan 2024 12:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706705312; x=1738241312;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LHxgBsIVm0RclFZoJgPndKYmsJfhaKktS+NsG0ubaD8=;
 b=nEhVpq0Dh00VnYxXK1VmK2w33Q4JrssC2SkeXxdUiPNiEwankKR0OJh/
 uv3PTno9zrV/7muI0LHVMvfTtjJKyykOt0e1OfgUyl7km/H0319gw8xxw
 9gt9HT/+mzmxzylkhO+GNEaSyF0nnwOkaxdbSwJNMT0XCtSUMM4JFlOEi
 ssbtS3/LExY/RNcn5S1SPnKomct6vl13Lp7O4BA4sHURr/25qKWAvvUew
 lxKpdvWhPih0ZajK+7ZbCvgufWnH0SZiSdeIMlwJZEsgASp5Qc6GGSy9T
 k3hTyD1rrmkMjLgxjPNE6ZWGY3ttFYH08RO9yK+T8g8AORaXNtnbHg1Xz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403212836"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="403212836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931830646"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931830646"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:48:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
In-Reply-To: <CADnq5_MZuVDx2VeErcOXSqkgRrnFsrn1=N8Y-K47Woar-aeAyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
 <CADnq5_MZuVDx2VeErcOXSqkgRrnFsrn1=N8Y-K47Woar-aeAyw@mail.gmail.com>
Date: Wed, 31 Jan 2024 14:48:26 +0200
Message-ID: <87eddxis85.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Pan@freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Jan 2024, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Wed, Jan 10, 2024 at 12:39=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> This will trade the W=3D1 warning -Wformat-overflow to
>> -Wformat-truncation. This lets us enable -Wformat-overflow subsystem
>> wide.
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Feel free to take this via whichever tree makes sense.

Thanks, pushed this one patch to drm-misc-next as prep work.

BR,
Jani.

>
> Alex
>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_gfx.c
>> index b9674c57c436..82b4b2019fca 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -329,7 +329,8 @@ int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *a=
dev,
>>
>>         ring->eop_gpu_addr =3D kiq->eop_gpu_addr;
>>         ring->no_scheduler =3D true;
>> -       sprintf(ring->name, "kiq_%d.%d.%d.%d", xcc_id, ring->me, ring->p=
ipe, ring->queue);
>> +       snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
>> +                xcc_id, ring->me, ring->pipe, ring->queue);
>>         r =3D amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_=
DRIVER0,
>>                              AMDGPU_RING_PRIO_DEFAULT, NULL);
>>         if (r)
>> --
>> 2.39.2
>>

--=20
Jani Nikula, Intel
