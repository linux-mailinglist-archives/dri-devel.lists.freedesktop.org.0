Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBAB3793C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 06:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE5F10E0BE;
	Wed, 27 Aug 2025 04:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpn9XpM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CFE10E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:47:33 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-61c325a4d18so6873288a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756270052; x=1756874852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8TCMaff2/OOBuiGXhxSyW4vUb1EhEINJOzc43HDpiqA=;
 b=gpn9XpM/c5/sViJCNm1A6cdndQDOrOuhDeSpNqicwHRmps5wgTlZeMaP97seXXyZ+Y
 Dc2PNYvbO0uqteO6/3Zv5VAGJGs6m07CTw/X9OfE5SbyR0EQXvEOjADjJYasr/fwLHnf
 xShgxIBU568R0Hkjrw74bFHHkF10MOp3jfin0JGTkFptV0/EldxI7wxKAg1C96MkaaYK
 cWtbMtw2IeYqrCAP0acg+LXL1ev3CF37gZmzaHif6H0KCJZimSAlq/gSWcTpLs/0UPXV
 yq4irquAbl0aSXGzDwWQ8LoS6TxVyGEx6Xv9na5I/HAAk8lyVjX0C7SzcZPbr6KtY+UQ
 x5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756270052; x=1756874852;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8TCMaff2/OOBuiGXhxSyW4vUb1EhEINJOzc43HDpiqA=;
 b=Rzf/B1laKUqObgJY+NaRNwWKKQIHaVB58F91wyaeeNfHHX05fk2ildWC/UU7rUDUBd
 BUuN0NwA88eDmpiJD98iQR05zqWpaswgKbGHcbRGPpXF8YAmwhptXqfBruo8LpDFDyUr
 RgNoSGM+krUuHV/VPwYxoous1HT3uJ6/60k02tGWsIgm8PeNyT7/mQStkS3EqPsPPgIU
 khRAmvbZ2TwDzyrrjY/JIIp/1fDk+cD5xFvUMbgSVqGR4z0G9EmoDURTZsDrPNPMD3D3
 Ck5+AKzF/vw9yQlhIAZGy2sFIcon42exYihWI14oJqQbkQE4mrJnlz0cTKUTYnsLDAK0
 K6ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEwNXnk/ENIbeUZVcjvtE6wqNMiFxWNMTsXFm72mxsuezBn33Te8GsKC9GqtHp7Mt3t7l+QatA8LI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxUC5jTIPZ2OH1sfoOtU+hvd7bVJLfeGRz59vWUkZCFLzDt4RZ
 Zd0zZ23ZLURqG1PpGty9uBoEwfyR1cR3fTPXwlFYmFw8GKutW+p8Vdmp
X-Gm-Gg: ASbGncshgrC9SHTCU75AKtsLUByExCnCLfGGPFE1xADeillx1rqlNB9OxCX73ixl5/e
 6hZN17U76knkhwqcnQIe08n84u8qSufsz234aQ5AVEEgp5JR2yT+OtaEpqpVebDcTt1eCaM8PkQ
 kfjAQVQL8enXTdi+GnswJYHXi2wiGyJWex/GcTAZge+cnNonDVQtBgkgoohNg5b14SFaplksA7q
 LD/iXMdQ3lNBIAcDbRgJSBwRad1mCRWUA/6msqPYf4wdZ7N6HBFjKLkAf01caeyP55PrBd4QgAU
 tOYf7thvzccm3/Qh+9r8MJKeEdGgC6GnfVfBHXYt0jGcd3ka2nJFERdjpQaUkH4iJlhZ29n5U23
 eUObEJzrTfIG+zr6E8hPE7uRb
X-Google-Smtp-Source: AGHT+IG9JdOvxAI0JpZC7UN53cppIId0lE2cbYaF9wAYpBd5bYrwqo7A7y/TJvWUTacmrbOk5BBATg==
X-Received: by 2002:a05:6402:44d2:b0:618:fe3:f4c with SMTP id
 4fb4d7f45d1cf-61c1b6f1fbemr12637501a12.29.1756270051831; 
 Tue, 26 Aug 2025 21:47:31 -0700 (PDT)
Received: from [127.0.0.1] ([5.248.55.4]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c90ffd677sm2710258a12.46.2025.08.26.21.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 21:47:31 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:47:29 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
CC: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_05/19=5D_staging=3A_media=3A_tegra-?=
 =?US-ASCII?Q?video=3A_expand_VI_and_VIP_support_to_Tegra30?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2271797.NgBsaNRSFp@senjougahara>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-6-clamor95@gmail.com> <2271797.NgBsaNRSFp@senjougahara>
Message-ID: <4BD9010B-3F5B-4EE3-B57C-A20DFAEC5276@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 07:29:40 GM=
T+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=
:
>On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
>> Exisitng VI and VIP implementation for Tegra20 is fully compatible with
>> Tegra30=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  drivers/staging/media/tegra-video/Makefile | 1 +
>>  drivers/staging/media/tegra-video/vi=2Ec     | 3 +++
>>  drivers/staging/media/tegra-video/vi=2Eh     | 2 +-
>>  drivers/staging/media/tegra-video/video=2Ec  | 4 ++++
>>  drivers/staging/media/tegra-video/vip=2Ec    | 5 ++++-
>>  5 files changed, 13 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/staging/media/tegra-video/Makefile
>> b/drivers/staging/media/tegra-video/Makefile index
>> 6c7552e05109=2E=2E96380b5dbd8b 100644
>> --- a/drivers/staging/media/tegra-video/Makefile
>> +++ b/drivers/staging/media/tegra-video/Makefile
>> @@ -6,5 +6,6 @@ tegra-video-objs :=3D \
>>  		csi=2Eo
>>=20
>>  tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  +=3D tegra20=2Eo
>> +tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  +=3D tegra20=2Eo
>>  tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210=2Eo
>>  obj-$(CONFIG_VIDEO_TEGRA) +=3D tegra-video=2Eo
>> diff --git a/drivers/staging/media/tegra-video/vi=2Ec
>> b/drivers/staging/media/tegra-video/vi=2Ec index c9276ff76157=2E=2E71be=
205cacb5
>> 100644
>> --- a/drivers/staging/media/tegra-video/vi=2Ec
>> +++ b/drivers/staging/media/tegra-video/vi=2Ec
>> @@ -1959,6 +1959,9 @@ static const struct of_device_id
>> tegra_vi_of_id_table[] =3D { #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra20-vi",  =2Edata =3D &tegra20_vi_soc=
 },
>>  #endif
>> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vi",  =2Edata =3D &tegra20_vi_soc=
 },
>> +#endif
>>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra210-vi", =2Edata =3D &tegra210_vi_so=
c },
>>  #endif
>> diff --git a/drivers/staging/media/tegra-video/vi=2Eh
>> b/drivers/staging/media/tegra-video/vi=2Eh index 1e6a5caa7082=2E=2Ecac0=
c0d0e225
>> 100644
>> --- a/drivers/staging/media/tegra-video/vi=2Eh
>> +++ b/drivers/staging/media/tegra-video/vi=2Eh
>> @@ -296,7 +296,7 @@ struct tegra_video_format {
>>  	u32 fourcc;
>>  };
>>=20
>> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_=
SOC)
>>  extern const struct tegra_vi_soc tegra20_vi_soc;
>>  #endif
>>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>> diff --git a/drivers/staging/media/tegra-video/video=2Ec
>> b/drivers/staging/media/tegra-video/video=2Ec index
>> 074ad0dc56ca=2E=2Ea25885f93cd7 100644
>> --- a/drivers/staging/media/tegra-video/video=2Ec
>> +++ b/drivers/staging/media/tegra-video/video=2Ec
>> @@ -127,6 +127,10 @@ static const struct of_device_id host1x_video_subd=
evs[]
>> =3D { { =2Ecompatible =3D "nvidia,tegra20-vip", },
>>  	{ =2Ecompatible =3D "nvidia,tegra20-vi", },
>>  #endif
>> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vip", },
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vi", },
>> +#endif
>>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra210-csi", },
>>  	{ =2Ecompatible =3D "nvidia,tegra210-vi", },
>> diff --git a/drivers/staging/media/tegra-video/vip=2Ec
>> b/drivers/staging/media/tegra-video/vip=2Ec index 5ec717f3afd5=2E=2E00e=
08a9971d5
>> 100644
>> --- a/drivers/staging/media/tegra-video/vip=2Ec
>> +++ b/drivers/staging/media/tegra-video/vip=2Ec
>> @@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_devi=
ce
>> *pdev) pm_runtime_disable(&pdev->dev);
>>  }
>>=20
>> -#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_=
SOC)
>>  extern const struct tegra_vip_soc tegra20_vip_soc;
>>  #endif
>>=20
>>  static const struct of_device_id tegra_vip_of_id_table[] =3D {
>>  #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
>>  	{ =2Ecompatible =3D "nvidia,tegra20-vip", =2Edata =3D &tegra20_vip_so=
c },
>> +#endif
>> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
>> +	{ =2Ecompatible =3D "nvidia,tegra30-vip", =2Edata =3D &tegra20_vip_so=
c },
>>  #endif
>>  	{ }
>>  };
>
>If tegra30-vip is compatible with tegra20-vip, we don't need to add the=
=20
>compatible string into the driver=2E Just mark it as 'compatible =3D=20
>"nvidia,tegra30-vip", "nvidia,tegra20-vip";' in the device tree (and as R=
ob=20
>alluded, have this compat string pair as an option in the device tree sch=
ema)=2E
>

While I am fine with using fallback but it may be a good idea to have a se=
parate compatible so in case tegra30 would need a specific set of ops (tegr=
a20 and tegra30 VIs are not exact match) no additional changes into schema =
would be required=2E

>Cheers,
>Mikko
>
>
>
