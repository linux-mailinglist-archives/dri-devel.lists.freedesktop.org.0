Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8146CE9F11
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7B710E63B;
	Tue, 30 Dec 2025 14:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pJ3v6inr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF510E8FC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:32:39 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-78fccbc683bso68379617b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767105158; x=1767709958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSkwRLVE9VrSjR+5xR92dNYRiZIVMosiuZNfExME9q0=;
 b=pJ3v6inrs5abvIVc2vsNLG0OKU48xw2tDHTTNtzaHhysTjwv1k4K0gsuTzH5HVjT47
 Cfv0e1J78GdOeJsF7YFaWTeYCcM7hP+GqA8AvwHajhpE0q9U6ggtkIslJd49+CiB9NLO
 ZTLzDHodwkPnWi50WfBeGUB/RsSMODV92ZyZkW4RcP0wspyxSEP53r5Qw49oowhM95y4
 Q4hZQ3Pbq6dMIj3LlsdfAyEw7YQng3QLxBnFtIdlnOZG4QnjlyHEAT9yMLjxTpA9Ixqi
 7jQv+VOU3qKrHRrrhGEQhjAZWE28mxfx82J4jpBMVtkP+p99FB/tfZSA4vCBajEBRAlE
 BIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767105158; x=1767709958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mSkwRLVE9VrSjR+5xR92dNYRiZIVMosiuZNfExME9q0=;
 b=ns65xxKej4gat0iFKdSycVHK+V/sMSb7OFKqHNWEf1+R2oFW1XvDrJKf9QgPcyrNNs
 9WLyD1DoPwUwNe+2xw9OnLPvsOkyv1P5OxJSDstuugVbvFqT8fjtUr5dXeFI89tEGJdJ
 6+3TgUK8hd2a7Bl4CBpWMWhHEooLb28HFRTPvQBE/oNMB8CfY1DxOY+ubkGTuIoQmZ3E
 zP/iGod6ds/1RgjHfkklsHSBdo5Gf7YyJcZK9raKoOyv8qMS4O1Sd5/eAldpl/GBdhFw
 xCvun96VxRTYlS0DAxNvQyIEHcDZP1KmJp4YZeBhqh6KH2Tjtl7x8HIMQ8ZpLimjI/EQ
 SisQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ4XnIVRvJKJ7xUv2g5Zwna6+m8tp/sNf948wGcC5chXNaAw7ojhrapiM2KNMWRWp40xE3U+aEjEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvt+KzdmN/xybuRtf8KKURd2v0G8tcHAFe/ms9uF+dwunOnhGk
 Mn7va3dFj+VGaAltgdXxYASMFgYx1y8jpcfqN28X9TJ/NKRmC1gX9ysDuWkj5ubUQXgwafefDks
 Ok78r/q9p0hg4K5qDBMQr5dwRNujJicRi7Oxt71j9DQ==
X-Gm-Gg: AY/fxX70UlLZLgkhBtIfJ3Z8+VczPV+xam1ip4iOGZhZXgaN594rnQ73qDbs45fh+jC
 XxdisJOH0SBtsRcsZJQopXyZf8QAGi/6PgwJfYBiVITZRe0V5/9ClCaQA2aZ9scKguIJIOH1NNv
 gaoi64zydnUzkXRJs5JUimmemCKpNK15RMQyLwLRpxbPRVZNRqJDl9Iu4QZqLyLgp8pWSjUwCd4
 Wx9VsquAEitU8Sz2qtZYtVA/YgbDEI6Q37wh9FUxTUNBhx6pWwHlIwNpKQSglxyHukSjy5EcoR4
X-Google-Smtp-Source: AGHT+IHR18VvsLs1nl1FI/8Mizrat+UAk6qQegi51DyfihMb2zEmH8+U+TFvduNyE9VI1PkTzsqEJR/Kv2BRtdYEd1A=
X-Received: by 2002:a05:690c:4906:b0:786:8a25:9967 with SMTP id
 00721157ae682-78fb4055f74mr328748247b3.50.1767105158254; Tue, 30 Dec 2025
 06:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 30 Dec 2025 22:32:26 +0800
X-Gm-Features: AQt7F2pder1aDAXyO4fWmBxO47QfPmM7UldDpCc1-yoDXdXmkNxifwGcHw_nm4g
Message-ID: <CABymUCPi6e0NUKcmf6ArY1qtMj29BU91kzyb31_RHqXNffxoCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Abel Vesa <abel.vesa@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B412=E6=9C=8819=
=E6=97=A5=E5=91=A8=E4=BA=94 18:39=E5=86=99=E9=81=93=EF=BC=9A
>
> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
>
> At least on Hamoa based devices, there are IOMMU faults:
>
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0x0=
0000000, fsynr=3D0x3d0023, cbfrsynra=3D0x1c00, cb=3D13
> arm-smmu 15000000.iommu: FSR    =3D 00000402 [Format=3D2 TF], SID=3D0x1c0=
0
> arm-smmu 15000000.iommu: FSYNR0 =3D 003d0023 [S1CBNDX=3D61 PNU PLVL=3D3]
>
> While on some of these devices, there are also all sorts of artifacts on =
eDP.

Hi Abel,

Could you help check what's the pipe topology of your eDP case? I need
to reproduce the issue.
Or could you help share the content of
/sys/kernel/debug/dri/ae01000.display-controller/state?
Thanks!

Regards,
Jun
