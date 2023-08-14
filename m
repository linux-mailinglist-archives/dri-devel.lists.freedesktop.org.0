Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEE77BF8A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 20:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3CD10E229;
	Mon, 14 Aug 2023 18:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F2C10E229;
 Mon, 14 Aug 2023 18:07:25 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1c4dd644cf8so1088297fac.0; 
 Mon, 14 Aug 2023 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692036444; x=1692641244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WslgAa7j4kIJuwFKnVUBEY95Upxt26FSni2PjqaEns=;
 b=YAhE5dyMly+M2Cyvo13TgOhecBARql1bU4ETz09fa4f1d6iaIxBNXw9ZDFPgEgAg8z
 TGKAOCSLWfc8AAAkDlhQswv5mm+6qHKYchvOrb7e3cNYx23SrgXcuMDfgbRbIihjVSfv
 f1hWP79VCrue3vqCQ63igNHPYKGXA1wRFQtsvY4gZnxfTpvq3dYojCkN+JoIjQk9eqzZ
 yKXyyVPH0m2GKLmNbjAIHdmEP8EOX1pbtCA9gVVcldcao6scbGuCMCspriwoSgqS1Dj7
 FKOB8ob/onoEuJ6Xi3zSj0d8Nh0dXDHeoD1YBuD0K5oXnn9WhPN4eqt9G09FdZB9CeCe
 q0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692036444; x=1692641244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WslgAa7j4kIJuwFKnVUBEY95Upxt26FSni2PjqaEns=;
 b=GuHDSw+djmyJ7vp1OfpHfu+16mYlO4ta80iz5VnX4EEJgxsDh4afYJIGXNXfZcZM7L
 2hqz6eT99qyngJpnbA9Jyk/Hz5UGK/NKPxhLvmqwpezhk61yqTntFFlgScsYdpNSRfot
 FIXWYcYz4i5UFjAb5fKnNfnyccH0JeoQaP4zJGXc1YSEf/JXNYjJ6/pqS8rMeSqFnigY
 Ycq1LIdEygUPba0XRzGxhQh00MRsagNY5+WVriCVstNXgzB1LAYBmZveG2Xm2Cny/+06
 O7xsf3NYbUn4hb5ydUDnJG6rFXl30AId220sxcZ6ochWKs0iJCuMXlOq9bV5IAMGmgYs
 2MQg==
X-Gm-Message-State: AOJu0YzwlyhFHqvFFPqvRYANWYw2+/aE8WZfVGfcnFn8TBuX1blW8syM
 mbEZnZTz1u6DwTv1eWI76hqTpVzcQ0w3U1RW7I8=
X-Google-Smtp-Source: AGHT+IH5HgGJWtIo9vC++wLekhh87GWkUDz6io167f7XrD0LnWQ/8ywGMUAFlO+183ZFSbYynyfMczIkh15lIhdQfz8=
X-Received: by 2002:a05:6870:1717:b0:1b0:653a:af92 with SMTP id
 h23-20020a056870171700b001b0653aaf92mr11705205oae.8.1692036444745; Mon, 14
 Aug 2023 11:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230811102549.18492-1-zhengzengkai@huawei.com>
In-Reply-To: <20230811102549.18492-1-zhengzengkai@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Aug 2023 14:07:13 -0400
Message-ID: <CADnq5_OEzijOrT3nX_DX5g4qVB2nn-ipJg_iUgwS9Q0OKha=7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Use pci_dev_id() to simplify the code
To: Zheng Zengkai <zhengzengkai@huawei.com>
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 wangxiongfeng2@huawei.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Aug 11, 2023 at 9:45=E2=80=AFAM Zheng Zengkai <zhengzengkai@huawei.=
com> wrote:
>
> PCI core API pci_dev_id() can be used to get the BDF number for a pci
> device. We don't need to compose it mannually. Use pci_dev_id() to
> simplify the code a little bit.
>
> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
> ---
>  drivers/gpu/drm/radeon/radeon_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeo=
n/radeon_acpi.c
> index 5771d1fcb073..603a78e41ba5 100644
> --- a/drivers/gpu/drm/radeon/radeon_acpi.c
> +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
> @@ -618,7 +618,7 @@ int radeon_acpi_pcie_performance_request(struct radeo=
n_device *rdev,
>
>         atcs_input.size =3D sizeof(struct atcs_pref_req_input);
>         /* client id (bit 2-0: func num, 7-3: dev num, 15-8: bus num) */
> -       atcs_input.client_id =3D rdev->pdev->devfn | (rdev->pdev->bus->nu=
mber << 8);
> +       atcs_input.client_id =3D pci_dev_id(rdev->pdev);
>         atcs_input.valid_flags_mask =3D ATCS_VALID_FLAGS_MASK;
>         atcs_input.flags =3D ATCS_WAIT_FOR_COMPLETION;
>         if (advertise)
> --
> 2.20.1
>
