Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FE88A3EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02510E90F;
	Mon, 25 Mar 2024 14:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="enDOKQbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87FF10E90C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:15:11 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-78a3ca01301so182465785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711376109; x=1711980909;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COUKaK9QwWldaIvCztGeS1zsFehu8RXDmIJB95LB/cQ=;
 b=enDOKQbuVwsdJkgyR82aZj86XoI/qPpGsFUMVYLAMPUWTLtUyVraoHur/Ajr43YmMx
 1dLqhGva3D0SC5tj6gs60c8ax8wE2YDZXnuu6F4ptKA+19rf5UWPN2MTCqJQr3FVj0Wl
 rVNerKrd2N62H+54ya5GWjitKDPjDQd/43tdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711376109; x=1711980909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COUKaK9QwWldaIvCztGeS1zsFehu8RXDmIJB95LB/cQ=;
 b=pnq5TK5A1KESWM2xDxw8N9CaCpWT7X7TE7sB31D4iFHAzppCqfVWr68uyMMX0hu0Mq
 ACFzKy+mtKHbjp/hmT7mxeNkbJzTijHnCl5DpK2uq5dkRYJda66gxNgefYxbEUXl5Wkg
 GAnRMdNBDvIS4aOch73wyZni1esOzM5fuY7ow3UfymjEGBGaqTTAGltA7wadB5xeZ+i4
 dZXfzLS+nICQkxNVHsdRJM2RzX8HbC8Uaotliux6ZKrJkDvaqEngabntRTwolF1DB1Uh
 m/8oCZtG5mKhjxpEAfSz57RA4EN5FQLjXVurRUpEGNUddxgVBfkH1xtLwKy3DL1cJUFK
 8stA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgev+sKdXL9mKXPYWwYJaFu6Gwvgk/G5Sz2INGREzQMd5l7wfKq4/mnIGGbUjqBBt8jwaIGTbxArCzq2di0LNMKdXAYRaeCLx/u0Sv0bld
X-Gm-Message-State: AOJu0YwI5g78djK2iPQmwuLfY7Efm4WiVg1xrENSIwYGVP+CXUnWzLH4
 F/yLhwTgncRyRJPjgd1Q1sajslQAmAULEFn64XhTEtE+b6PGRbZXrj8s6EmJk3JUcmiqqCY7a1M
 =
X-Google-Smtp-Source: AGHT+IGDuxOGKB4DgSLonhhOntJUS9Dsk/mNvHI28J5H4K9eN8F7aKyHIm/X3NzalIWow/fY4WemeQ==
X-Received: by 2002:a05:620a:462c:b0:789:c7d3:d55c with SMTP id
 br44-20020a05620a462c00b00789c7d3d55cmr9452698qkb.15.1711376108795; 
 Mon, 25 Mar 2024 07:15:08 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 x16-20020a05620a14b000b00789eb549636sm2141478qkj.18.2024.03.25.07.15.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:15:07 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-428405a0205so485761cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 07:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsyRQIIy4yYV5TqoiO3KCnR+/Nq4JKNaV/jKW+BbEdcJJ0KKc7fZdGSscljrXyYvwHnawj8dEaSPDWF2GQpjPSAUpGAKi8ARbsIflZA3u5
X-Received: by 2002:a05:622a:2444:b0:431:4e0b:d675 with SMTP id
 bl4-20020a05622a244400b004314e0bd675mr354653qtb.18.1711376106720; Mon, 25 Mar
 2024 07:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <202403240115.1lAo588s-lkp@intel.com>
In-Reply-To: <202403240115.1lAo588s-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 07:14:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V91x_Vf=rkT_Q29eTsa13XDKZHXYYgX1of3JsE2OgxHQ@mail.gmail.com>
Message-ID: <CAD=FV=V91x_Vf=rkT_Q29eTsa13XDKZHXYYgX1of3JsE2OgxHQ@mail.gmail.com>
Subject: Re: [drm-tip:drm-tip 4/11]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73:
 error: '.bin' directive output may be truncated writing 4 bytes into a region
 of size between 2 and 31
To: kernel test robot <lkp@intel.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>, 
 Veerabadhran Gopalakrishnan <Veerabadhran.Gopalakrishnan@amd.com>,
 Leo Liu <leo.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
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

Hi,

On Sat, Mar 23, 2024 at 10:15=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> head:   657dd8fcd2f1d1205c6f98fdb8b60915228991d1
> commit: 0885186926a13c697d78f5af03f32445414b6ad5 [4/11] Merge remote-trac=
king branch 'drm-misc/drm-misc-next' into drm-tip
> config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/=
20240324/202403240115.1lAo588s-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240324/202403240115.1lAo588s-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403240115.1lAo588s-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early=
_init':
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:66: error: 'snprintf' outp=
ut may be truncated before the last format character [-Werror=3Dformat-trun=
cation=3D]
>      102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.=
bin", ucode_prefix);
>          |                                                               =
   ^
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:17: note: 'snprintf' outpu=
t between 12 and 41 bytes into a destination of size 40
>      102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.=
bin", ucode_prefix);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: error: '.bin' directiv=
e output may be truncated writing 4 bytes into a region of size between 2 a=
nd 31 [-Werror=3Dformat-truncation=3D]
>      105 |                         snprintf(fw_name, sizeof(fw_name), "am=
dgpu/%s_%d.bin", ucode_prefix, i);
>          |                                                               =
          ^~~~
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:25: note: 'snprintf' outpu=
t between 14 and 43 bytes into a destination of size 40
>      105 |                         snprintf(fw_name, sizeof(fw_name), "am=
dgpu/%s_%d.bin", ucode_prefix, i);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
>
>
> vim +105 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>
> 95d0906f850655 Leo Liu            2016-12-21   93
> 69939009bde70c Mario Limonciello  2022-12-28   94  int amdgpu_vcn_early_i=
nit(struct amdgpu_device *adev)
> 69939009bde70c Mario Limonciello  2022-12-28   95  {
> 69939009bde70c Mario Limonciello  2022-12-28   96       char ucode_prefix=
[30];
> 69939009bde70c Mario Limonciello  2022-12-28   97       char fw_name[40];
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06   98       int r, i;
> 69939009bde70c Mario Limonciello  2022-12-28   99
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  100       for (i =3D 0; i <=
 adev->vcn.num_vcn_inst; i++) {
> 69939009bde70c Mario Limonciello  2022-12-28  101               amdgpu_uc=
ode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
> 69939009bde70c Mario Limonciello  2022-12-28 @102               snprintf(=
fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  103               if (amdgp=
u_ip_version(adev, UVD_HWIP, 0) =3D=3D  IP_VERSION(4, 0, 6) &&
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  104                       i=
 =3D=3D 1) {
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06 @105                       s=
nprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  106               }
> 69939009bde70c Mario Limonciello  2022-12-28  107
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  108               r =3D amd=
gpu_ucode_request(adev, &adev->vcn.fw[i], fw_name);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  109               if (r) {
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  110                       a=
mdgpu_ucode_release(&adev->vcn.fw[i]);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  111                       r=
eturn r;
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  112               }
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  113       }
> 69939009bde70c Mario Limonciello  2022-12-28  114       return r;
> 69939009bde70c Mario Limonciello  2022-12-28  115  }
> 69939009bde70c Mario Limonciello  2022-12-28  116
>
> :::::: The code at line 105 was first introduced by commit
> :::::: 6a7cbbc267c0cafa2b027983a40276deb673c066 drm/amdgpu/vcn: enable vc=
n1 fw load for VCN 4_0_6
>
> :::::: TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
> :::::: CC: Alex Deucher <alexander.deucher@amd.com>

Not quite sure why this came to me and not the people involved with
that commit. Adding them here.

-Doug
