Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1D92C312
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 20:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFF410E60C;
	Tue,  9 Jul 2024 18:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AVjGncWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABB610E60C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 18:06:42 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-25e397c51b2so2709617fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720548401; x=1721153201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WzBDhpjO1TzmBMf6LfzhCg/YH/Iw6PGOmuPK9+lkbGc=;
 b=AVjGncWbD/htHAVweYUnM4+3vlkZaNomtLNmv50fpaDI1D425Yd9J4ZmNLLvTPou42
 r8Kuwa6mTgGCous7kfhgDJosl5tPhqb6Wxhfewln1PbVyvunq7kuOtFxNwaCYCmsMiWk
 BGTGW2Ig8jzxCj7a1yNIYksvyw7JF/AVORq9NRfG34X8N8jXohNSGDfsUT/G6lbNeRkB
 a62agc/uD0HONOcrxB/7nQoICEozCaO8+6+ydlpkPEIcl5+ajTKzhA2ZKJ4zK+VbV41j
 hcZe/WdpWVngFDdqM3B8JXdO3UTYE68Zwb1kmYgeM0JFeq8Op444iuJq2yxRYDOsmWEN
 vsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720548401; x=1721153201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WzBDhpjO1TzmBMf6LfzhCg/YH/Iw6PGOmuPK9+lkbGc=;
 b=n/x+OZbQBAxL5NxFQSNPdFIAwqe+sF7c2fmONU2nvuKjBJh0N2S3rq0TGQUzz8wVBM
 d6eU/HmpwNANEitsHQeyXLNVnpsWJURF8r+SPzlIv0DyFhpl7q2pGzfat9axzItsvnct
 Rot2XC4wZC2Q+upLtIy8kLFmps5RHlpnKYPmJj1WKsVXvzLYaZtvgERVe/2pD5X8PCZ5
 jJhjmEMy1oPIQUYTS+SLwhYAdOR03sAavtvxueCyQPoAbhXuAtbmgeao2aJcGenzclu0
 WkyVdMLTjkPv+HtaHnby/5AMecK7eAOkTaph2p6DGIzyU3jd/3YbyZB5j9ntfQsIV2Hw
 FnmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk5IoKX5BpqKqmdXbp+D+l3WCv17ihrsBfUX/2LqhOvZ03+tORKlvjEhdn2Ul/FlT3PVJB5TKm7kl5WB3gNYX4rnF7E4XOfQmlfxhjO8Oa
X-Gm-Message-State: AOJu0YyQGC1DqLt/JvD9cKpSZ6XlpwUCUUKZ693mpymnPrFrxSEDGVCW
 F3Qqp6V6BKloXiKtDjJo+hPDRVMrkZ3BhXGD4diMh0BACA2Q52wJZjlkambC2Hrm75Lf45EAXRp
 czbANDPYZaGrqenkmetQSSyCac6U=
X-Google-Smtp-Source: AGHT+IEGUcQKJ9mnpyPVQXQ1pNx23mMBnkpqX5kngam5zoBvxP51NVErbJOzJhsbwWiQjadnpg0LnTkMyAlCadX5jSY=
X-Received: by 2002:a05:6870:ec87:b0:254:ccac:134d with SMTP id
 586e51a60fabf-25eae7575dcmr2838916fac.2.1720548401179; Tue, 09 Jul 2024
 11:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240709085916.3002467-1-make24@iscas.ac.cn>
In-Reply-To: <20240709085916.3002467-1-make24@iscas.ac.cn>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 9 Jul 2024 20:06:30 +0200
Message-ID: <CAMeQTsa4eYwPW=ut4yheZD0od3Yc9hGc1W3N=Ns7BKuYugcunw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
To: Ma Ke <make24@iscas.ac.cn>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, alan@linux.intel.com, akpm@linux-foundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Tue, Jul 9, 2024 at 10:59=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:
>
> In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). Add a check to avoid npd.
>
> Cc: stable@vger.kernel.org
> Fixes: 6a227d5fd6c4 ("gma500: Add support for Cedarview")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Thanks for the patch!
Pushed to drm-misc-fixes

-Patrik

> ---
> Changes in v3:
> - added the recipient's email address, due to the prolonged absence of a
> response from the recipients.
> Changes in v2:
> - modified the patch according to suggestions from other patchs;
> - added Fixes line;
> - added Cc stable;
> - Link: https://lore.kernel.org/lkml/20240622072514.1867582-1-make24@isca=
s.ac.cn/T/
> ---
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gm=
a500/cdv_intel_lvds.c
> index f08a6803dc18..3adc2c9ab72d 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -311,6 +311,9 @@ static int cdv_intel_lvds_get_modes(struct drm_connec=
tor *connector)
>         if (mode_dev->panel_fixed_mode !=3D NULL) {
>                 struct drm_display_mode *mode =3D
>                     drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
> +               if (!mode)
> +                       return 0;
> +
>                 drm_mode_probed_add(connector, mode);
>                 return 1;
>         }
> --
> 2.25.1
>
