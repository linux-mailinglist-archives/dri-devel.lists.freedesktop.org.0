Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB78C9F52
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DEA10E782;
	Mon, 20 May 2024 15:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsq4SDPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354DF10E77F;
 Mon, 20 May 2024 15:07:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1ec4dc64c6cso72844535ad.0; 
 Mon, 20 May 2024 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716217669; x=1716822469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IhwVQj77q9WsVa/PNIbqf67vLZaFOrT0DXfZ5Ha2VXE=;
 b=bsq4SDPCUpE8TmIx0RqMfexF/upHCKS411B5nGAppZGZThA2fKa8MjYRIH6s6wMcVs
 OUqgixcWCpX3j9CgwAohHtDxeRP89AFZ1rw8TI0gZ7T7X8mC8RY0m53Hmx6OfHlzv+Jz
 PCWuO/+hPt9s05Bd36PyMr7uPXmBLg0zgaw4W2HBinQcSyy8H+jUnbsZe2dkUfoy3TXj
 p09RvPF1SWAeFj5ZuvFYQhhGosplE8Du67EwZ8FMY5Z1gKpDU5HfNq1Niy+0ld8catBS
 UzcypeF8yXHEyfZdLLh+ZhLu74rlvd/cutL+Cabk9QzYLuBfA4pnqtVe9f4tO77ezMGC
 eLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716217669; x=1716822469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhwVQj77q9WsVa/PNIbqf67vLZaFOrT0DXfZ5Ha2VXE=;
 b=OsuF0CHS3jmsyuOAFy9rBfzv992ZSbvflqFxixl5IspmaP72yzvLJVA1AUKi8A8qwl
 wzMOxidaH0b3MebLI2GCkd7bAieEZvJtn/04Eu1xeiJKLiC+6s7X9W8aTE60pn9DUX3r
 UwktvYeg1e37O3YyFr6io35Tfa9DItuTLLTvbNsO5+I7ihiaGQmLPOt1vK+oGIlSOy0s
 WFGlsKCL/e6sxbE6mf64RZeka1dLNOA/KSonEwwURzOVAqKR38W3wRBra/LX/ITCD9g3
 3bN9AYKq9fb7a1WgzA07fG873k6nqykt8yq5D7u21IBNLtRdUrD/KoGyI7d+7VCiLRxP
 RZ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPZFnu+3gOt6TLYW2sdq1yhm0N/6NxX8A/dogbT8m5GoWX7ZHVMbGwvsehW0cXIl3E/6nIY5n4TPyqnYxRIFru8viEjFiO4KGAql2eavN8X47n/FRYCWSxMUYkSAljCUU8GMnkGlOcp8ObEllYmQ==
X-Gm-Message-State: AOJu0YxaMECFQ7Sc3/pyErtyt2tW53y+pyswdBm+2sro2UBNzH/B0o90
 RpJ3PV5ogbiSxISr6BVMEIkF0jPUxzy9Z7LIgci4crC5ZxANbaFFHPIFWg10oHi/C4ic5GvoUeo
 QUih/WdsscGMSKHtVFESLlsiNPl0=
X-Google-Smtp-Source: AGHT+IFPFW/F5D24m94Tz0YHdPMZG54zKWfl02ijEGW9135nYPbQuliZTHA0+CJ4LJGqGqLCQ22PggF4KPszeIb267g=
X-Received: by 2002:a17:90a:e389:b0:2af:2be3:89c5 with SMTP id
 98e67ed59e1d1-2b6cc76d2bamr26474648a91.29.1716217669551; Mon, 20 May 2024
 08:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240517082637.69928-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20240517082637.69928-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 May 2024 11:07:37 -0400
Message-ID: <CADnq5_MTOUOdesLtSY_8X5kHVmGvXxSCY3Lh54RwGutysj=p1g@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Update optc35_set_odm_combine doc
 to match kernel-doc spec
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

On Fri, May 17, 2024 at 4:42=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> This patch updates the function documentation comment for
> optc35_set_odm_combine to conform to the kernel-doc specification.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks for the patch.  Srini already fixed this last week.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/dri=
vers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
> index 7c9faa507ec2..1f8516e5ce68 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
> @@ -50,7 +50,9 @@
>   * @optc: Output Pipe Timing Combine instance reference.
>   * @opp_id: Output Plane Processor instance ID.
>   * @opp_cnt: Output Plane Processor count.
> - * @timing: Timing parameters used to configure DCN blocks.
> + * @segment_width: Width in pixels of each segment in a horizontal direc=
tion.
> + * @last_segment_width: Width in pixels of the last segment if it differ=
s from
> + *                     other segments.
>   *
>   * Return: void.
>   */
> --
> 2.20.1.7.g153144c
>
