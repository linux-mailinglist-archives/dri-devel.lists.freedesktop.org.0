Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA70F798994
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D218910E8FF;
	Fri,  8 Sep 2023 15:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385A110E8F3;
 Fri,  8 Sep 2023 15:07:05 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so1683514fac.0; 
 Fri, 08 Sep 2023 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694185624; x=1694790424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWiQIDttL2OGM1T9s0mfq0PqM64VbXI9XuBxObgq3WM=;
 b=bY2HBCR82nE16ocE7Xeu1CZ2d2Ke2vdJhdolfTN1TpBPY2bh4gyYgnNnYOtkheNSKd
 3N/TPeWxo0wOcv9HrEMuA+4aHUcez8WVZDw3Fo04jgz1nJ9mamIBDPtTZCjo6ZWWQMyt
 eYULWlmNsc/o/lbFtHVJRgwVvl2uEmK5MLeHDItd3yC7zKHMz+3sKRLFfGVp86cnIUK4
 I/riMpid7xLtvTj+DETWFu6GnRtOPXKtQKSkDsQw4/aR1L8CTQXUZ4uuqVtq4bkPg1T9
 Nich3E3QezRz7eh4+tg0LzhE6kVtQUavRGguyHW6ZV+vvrk5aHEmHE4AX5wjUm5voI9G
 clsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694185624; x=1694790424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWiQIDttL2OGM1T9s0mfq0PqM64VbXI9XuBxObgq3WM=;
 b=tiHgqQ1QxMC9YI93UO+bEQy8nwFL1Mc02cW89zMP/PbEdIjojsSakcuioSrZxDKoks
 CPY/7wppjuIMAHla5+BmFajNblt8q5FD3j+VDhDL5r2IcxLYB+SyhVaQIpfZKY7c+hMl
 T60Ddoy+u0O9ArO+ydGIwfM6ly9AD6jH7Y3ZMYRX4l84J6JAd1gjBA/7HHQOu0Bvj3z+
 NORVL3bqP5w3ZgPsEq8CRGspYLfll2xg3NS71EXn/JnCHekDiuUrSUW5njN4iwCJAdwE
 cVE4gozR2Z7vNOU/ff+vXmPLbFP0+NHg0qFgO8yzd6wZK+RvGnG+jF4toHfwkb93iU+w
 j92A==
X-Gm-Message-State: AOJu0Yxgu1EYkZmYUThcjywr/0WKOlPlqcCyJWZvw9AHEIDIfNm9DYaL
 N0iE3M0IUfvlHMIKuh65g5H0WXIRQZfOdF02Ej4NxKph
X-Google-Smtp-Source: AGHT+IF0E37hZoCh63iuI5mxUajpuAnMjnY78v4uV+t3y1JIviJL8DKuBKMgl7W0zFbRBJIldu3BjZp/o3b6WwUIflk=
X-Received: by 2002:a05:6870:24aa:b0:1bb:8040:24e1 with SMTP id
 s42-20020a05687024aa00b001bb804024e1mr3333783oaq.28.1694185624141; Fri, 08
 Sep 2023 08:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230908145521.39044-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230908145521.39044-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Sep 2023 11:06:52 -0400
Message-ID: <CADnq5_MZt-sFrJSy9UKo-DL18LCEuBcf1-jnd1MocqHCh_QS5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/amd/display: fix the white screen issue when
 >= 64GB DRAM
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Victor Zhao <Victor.Zhao@amd.com>,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Le Ma <le.ma@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Candice Li <candice.li@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Fri, Sep 8, 2023 at 10:56=E2=80=AFAM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> From: Yifan Zhang <yifan1.zhang@amd.com>
>
> Dropping bit 31:4 of page table base is wrong, it makes page table
> base points to wrong address if phys addr is beyond 64GB; dropping
> page_table_start/end bit 31:4 is unnecessary since dcn20_vmid_setup
> will do that. Also, while we are at it, cleanup the assignments using
> upper_32_bits()/lower_32_bits() and AMDGPU_GPU_PAGE_SHIFT.
>
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2354
> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)=
")
> Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: use upper_32_bits()/lower_32_bits() and AMDGPU_GPU_PAGE_SHIFT
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1bb1a394f55f..5f14cd9391ca 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1283,11 +1283,15 @@ static void mmhub_read_system_context(struct amdg=
pu_device *adev, struct dc_phy_
>
>         pt_base =3D amdgpu_gmc_pd_addr(adev->gart.bo);
>
> -       page_table_start.high_part =3D (u32)(adev->gmc.gart_start >> 44) =
& 0xF;
> -       page_table_start.low_part =3D (u32)(adev->gmc.gart_start >> 12);
> -       page_table_end.high_part =3D (u32)(adev->gmc.gart_end >> 44) & 0x=
F;
> -       page_table_end.low_part =3D (u32)(adev->gmc.gart_end >> 12);
> -       page_table_base.high_part =3D upper_32_bits(pt_base) & 0xF;
> +       page_table_start.high_part =3D upper_32_bits(adev->gmc.gart_start=
 >>
> +                                                  AMDGPU_GPU_PAGE_SHIFT)=
;
> +       page_table_start.low_part =3D lower_32_bits(adev->gmc.gart_start =
>>
> +                                                 AMDGPU_GPU_PAGE_SHIFT);
> +       page_table_end.high_part =3D upper_32_bits(adev->gmc.gart_end >>
> +                                                AMDGPU_GPU_PAGE_SHIFT);
> +       page_table_end.low_part =3D lower_32_bits(adev->gmc.gart_end >>
> +                                               AMDGPU_GPU_PAGE_SHIFT);
> +       page_table_base.high_part =3D upper_32_bits(pt_base);
>         page_table_base.low_part =3D lower_32_bits(pt_base);
>
>         pa_config->system_aperture.start_addr =3D (uint64_t)logical_addr_=
low << 18;
> --
> 2.41.0
>
