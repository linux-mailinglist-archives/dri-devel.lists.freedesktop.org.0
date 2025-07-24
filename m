Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC848B11051
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 19:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CF110E055;
	Thu, 24 Jul 2025 17:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PmFao+ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF2F10E055;
 Thu, 24 Jul 2025 17:24:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C4C65C628B;
 Thu, 24 Jul 2025 17:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F98C4CEF9;
 Thu, 24 Jul 2025 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753377882;
 bh=5v+6sLWT2JVv2tQxwXZrtzOuzBW2sPjmsZrpfsMk3SY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PmFao+ngmTPfknfXlTtHUDjw43zXU2C2VecX+GoaPuXWjIthMyujiIT/xZOb7AG3W
 qG74RggFP2c/bNmGczzZKWkizLegCr74S92ffE/q7TFPvkMvnClUyE0gx9ZcbO5WJ+
 oiKFBhR1oP2UWthNceJ+AsbsCrdi3Cp8JkVc5VY0nsmuEUcxGWt91lxV05l4azV/ho
 +buUtxVTcmWz8zPelqNBiQoeP4rwE3YH151oiaYjR0/UGEFfYwlIpOeQ+//4aa1p4g
 B5z6ZiXQoNGSzUHvx4uH+SKVAsUeZz+zf7C9xkoYMRNVZxBRXg8HG95jagdoSCIx+3
 3bZ1l5q2gnm0w==
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-adfb562266cso196918466b.0; 
 Thu, 24 Jul 2025 10:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUU+cbUAyfRk2Vv7qfB6KVUt/DB9sduwHFYPwWqEgXfqoH/tmCxTTkVej8PLjAuLLhCxc0zDm9xt3E=@lists.freedesktop.org,
 AJvYcCVUcckbOZXUQ49tpH0akXYbKD5WqLlGXsq78anSigEFY8NLH7GQ+SZlBGni/BTwTcQlu+vMgR77gXQE@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp8I5Qpoj6SY8Y45zBOxbSRkjcXCd38Yswtn8tT3V8n+Aufn7C
 FjbMmnNDY7DvwATR3abKpPNq6ivPcBIwfK9wommru1lU0uVdBQObOZcDpSxtIhRXL/2XxRrQTiC
 VFhFR0wPx7CJOBDyY3Uu+IQhdlYxaSQ==
X-Google-Smtp-Source: AGHT+IFo55rmjjLqbcaAhGBJ/ERMN7a6ahY+65NfrJ3IaCAqER+bDUI3Z3JrteeZr+zlXqaj2XuM64IibOVOM3hwD+k=
X-Received: by 2002:a17:906:c145:b0:ae3:d0f5:d7af with SMTP id
 a640c23a62f3a-af2f8c508e7mr804806166b.48.1753377880786; Thu, 24 Jul 2025
 10:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
 <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Jul 2025 12:24:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
X-Gm-Features: Ac12FXwCDn6y_9vJ9au7o-GRGF7JsHqqOrUkXvxuG-gjRGmKFHzrUxOXk3K7DII
Message-ID: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
Subject: Re: [PATCH v6 01/14] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

On Thu, Jun 26, 2025 at 4:02=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 251 +++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/soc/qcom/ubwc.h  |  65 +++++++++++
>  4 files changed, 325 insertions(+)

> +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },

This compatible is not documented.

Rob
