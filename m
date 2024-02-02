Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5043847499
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAA810E7B7;
	Fri,  2 Feb 2024 16:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eO90pQXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CDC10E7B7;
 Fri,  2 Feb 2024 16:23:34 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2191b085639so431372fac.0; 
 Fri, 02 Feb 2024 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706891014; x=1707495814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+06YIBVDdULWxw5GQnDnWyMeZFXiBJGy11XybxUBgE=;
 b=eO90pQXQbMATGLJ61QMMI/gA5nWnHQvMrSbS7/d2A167krtaidxEb4u/8FrkFxktd/
 NRtM4lB3gB23RuPlcxIJw92NBDHZouARmcFTPuD5DjKtEM5Yfh/sQHP/LMlZcX5jzEuh
 LdoJCZvOBmARy4tO9UmfmlfEAsr1zs2G9Nwofjk4TQP7weKWA8IliQjddRO1jWhxrd7X
 XnpLShACeMLK3+b6BSMQsYuIoBXZdV2FMGh+EuNHcH1tdpYVmxZ5KTKDdkBsW210hSnL
 iuQaGCchzUXxGBeaqX9EDDpU8KN1iku6JdzkCo/+t86COTIHOlzPjlSpuyh3kFBLf3zI
 iGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706891014; x=1707495814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+06YIBVDdULWxw5GQnDnWyMeZFXiBJGy11XybxUBgE=;
 b=ntlie7JZuITb1vMOArXn/aoYFZxLJ/fuoAzu6xemS0fThOaquuYdjeUZELkf42ET/0
 WUEnNYntcjimMwVqUj4xZznuTO9yA5gmZIfWVBqHh8mk7+9IV0B9egvDQ27rOMayt2+c
 fOF2zBUWhArx+yeKyBQc2fLqySH/X8K2ej5rlITsUgciZTNazvf2TakGv3yH7C+O0ReQ
 UZrp1Fy35oQSiiQhk4JGdb3n+JxcHn/rJN5s8bfzt4rYG9dwZ5tBNXljtvksJErTo0cP
 Ot6VJHYSTSFY5WuwV/PXsdiMwgt3XaG7uRo0wXFrEM/jvPvMMi1BV45pMYlq/gqEPE5/
 9Ciw==
X-Gm-Message-State: AOJu0YxzsLwmMX8Ctl3UC/F7L10r0x/TV4Rza7LXQyo5f6azgWmuUm1X
 bfwFpWkZ2KL5rGaqNj88eajJ2c6zOohVNj1yWv9v+u5FBT9QxOr4QdGkeZo4h7Ox3ewUK413Vhy
 81D8cdKirno3UHUGX5oeyMuzw4FQ=
X-Google-Smtp-Source: AGHT+IGcxhNRveKxhRVkFCGKQAlFC5u0InvpGQqzsMYza8L7+a2msgAi9LHM0ZYkFHKvlpL+u301GU3524ves7Q967s=
X-Received: by 2002:a05:6870:80f:b0:214:fb4e:6184 with SMTP id
 fw15-20020a056870080f00b00214fb4e6184mr177962oab.13.1706891014071; Fri, 02
 Feb 2024 08:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20240202084726.91920-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240202084726.91920-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Feb 2024 11:23:22 -0500
Message-ID: <CADnq5_PQGSo1jzLZf7fKw5M25k_5=w+t0-y0=RjfLU5xY-m=fg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Simplify the calculation of variables
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Fri, Feb 2, 2024 at 10:13=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c:236:49-51: WARNING !A =
|| A && B is equivalent to !A || B.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D8169
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/g=
pu/drm/amd/display/dc/dml2/dml2_utils.c
> index 1068b962d1c1..f15d1dbad6a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
> @@ -234,7 +234,7 @@ static bool get_plane_id(struct dml2_context *dml2, c=
onst struct dc_state *state
>                 if (state->streams[i]->stream_id =3D=3D stream_id) {
>                         for (j =3D 0; j < state->stream_status[i].plane_c=
ount; j++) {
>                                 if (state->stream_status[i].plane_states[=
j] =3D=3D plane &&
> -                                       (!is_plane_duplicate || (is_plane=
_duplicate && (j =3D=3D plane_index)))) {
> +                                       (!is_plane_duplicate || (j =3D=3D=
 plane_index))) {
>                                         *plane_id =3D (i << 16) | j;
>                                         return true;
>                                 }
> --
> 2.20.1.7.g153144c
>
