Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD76F0C26
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 20:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB90E10E395;
	Thu, 27 Apr 2023 18:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C8310E081;
 Thu, 27 Apr 2023 18:51:10 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5475e0147c9so2611061eaf.1; 
 Thu, 27 Apr 2023 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682621469; x=1685213469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yj/UQ4EcbnPYX5rdQ2FvYxfbgSOOZ5uRyKBmHlffxD0=;
 b=feWpeKjy4Sm9WZ7b/pmiLnFFZIGc9T7VUaULKfCt+h8y00oglLNWZnO1AUj/v3GvTg
 RJx94X1q0Y2oaGd496aUHH52PdWa7vtZDDj/j+ywnG8msPz0EzD64GmJqd0/zajrF/TQ
 ZAQr/tw0N0lAR+CdrS6TXNzM4L5mZyjiOVTmc7nemSJlZ2NYh2WJfeCKj+fn1fA64Otq
 bflm1HlReI7Zk3+9tfrzvJLs8iZ2H5MuA8N3/uyTvaXRNf9lHJ9LkrGFQpwBXwfwHmJl
 41QLwgUBiPS8CA/obC//N88K3/zQA5V1elhBb3/0noB0bohqB7iV/osY6KEq6+30smYJ
 VL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682621469; x=1685213469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yj/UQ4EcbnPYX5rdQ2FvYxfbgSOOZ5uRyKBmHlffxD0=;
 b=b/8Y08sXsD9APbYko9P3JaZ/Q1l1mW/oEbO0dCk10ZNH+p9moT2JqU3g5oFtCZDSrq
 PUUuofMv1XokNLo9tn/zotq2RW9Kjz0ezMkhBlNIN+gDSRi85Zq1WMP84tW1L3Oq5Zi4
 iRKqX/j/irZI/cYzDeLQ2vfg5+htwQ4lmVtIeRbMBvdqIJksOTwECl+HWJoB7Ig5sYdA
 TZ11zWvT2veWEzdizCOWxbnSwXltA25zioxBE5njSP4AlVmmkPIRFawuhem+4p3ywRY1
 bu/ViQts9iDj4agRhKpfG0qPr9ZELYZ5tWGLCDLrwNcPC2V+DGky3tlc8blNK5gqbyaf
 sBLA==
X-Gm-Message-State: AC+VfDwjNmq47Pa15RU2Ow6Q3UhVCm10fTinEdGBlwnBa9R4G/tgzutF
 BQO1hHjfSuS8beBCDcQKSFCrc06mFb28gM7Nt4o=
X-Google-Smtp-Source: ACHHUZ4eZ4DAEDIK0HbrjPaPpejSm+oDIFgpiHFoT+ZzsqnI11a4sHlFLxDUZdwYEQ9bI1gMnrKuuC4PpWSFm0URrco=
X-Received: by 2002:a05:6808:1cf:b0:38c:25e3:d9d2 with SMTP id
 x15-20020a05680801cf00b0038c25e3d9d2mr1130277oic.57.1682621469037; Thu, 27
 Apr 2023 11:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230426225458.877481-1-olvaffe@gmail.com>
In-Reply-To: <20230426225458.877481-1-olvaffe@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Apr 2023 14:50:57 -0400
Message-ID: <CADnq5_MEc_YAfts-wWEZVsm=bJLv5CT65qNX8c-qj_VZsxnS5A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: add a missing lock for AMDGPU_SCHED
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andres Rodriguez <andresx7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Apr 26, 2023 at 6:55=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> mgr->ctx_handles should be protected by mgr->lock.
>
> v2: improve commit message
> v3: add a Fixes tag
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 52c6a62c64fac ("drm/amdgpu: add interface for editing a foreign pr=
ocess's priority v3")
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_sched.c
> index e9b45089a28a6..863b2a34b2d64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> @@ -38,6 +38,7 @@ static int amdgpu_sched_process_priority_override(struc=
t amdgpu_device *adev,
>  {
>         struct fd f =3D fdget(fd);
>         struct amdgpu_fpriv *fpriv;
> +       struct amdgpu_ctx_mgr *mgr;
>         struct amdgpu_ctx *ctx;
>         uint32_t id;
>         int r;
> @@ -51,8 +52,11 @@ static int amdgpu_sched_process_priority_override(stru=
ct amdgpu_device *adev,
>                 return r;
>         }
>
> -       idr_for_each_entry(&fpriv->ctx_mgr.ctx_handles, ctx, id)
> +       mgr =3D &fpriv->ctx_mgr;
> +       mutex_lock(&mgr->lock);
> +       idr_for_each_entry(&mgr->ctx_handles, ctx, id)
>                 amdgpu_ctx_priority_override(ctx, priority);
> +       mutex_unlock(&mgr->lock);
>
>         fdput(f);
>         return 0;
> --
> 2.40.1.495.gc816e09b53d-goog
>
