Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B3077EB0C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 22:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3068E10E3BE;
	Wed, 16 Aug 2023 20:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B709310E3BD;
 Wed, 16 Aug 2023 20:53:37 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1a1fa977667so5302171fac.1; 
 Wed, 16 Aug 2023 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692219217; x=1692824017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIGT6OAj0mzc2nkSC81/vi+6gJHIm4hDaa2CtM6vDTc=;
 b=jAt76ss7cehgq1Dn5iOREr+cxVG88QaqkvEhHuTilA5zdE8+5EztxLpVfrxuKabZpL
 5EDhUl00fL16E+qJysUnVI4gSQpsXTNU2i12+O//pK4ZiaRlgdHgKwVRpPHkYKQzhOW7
 0WyozT8FtOJU/lXgUDgzKB38HWhzwCI/WnYsUKH1AnM7D5pY5/talOzf1tRh1JscDnBJ
 HixAi78lHnYFj+cg6pXxodQOrJY8UV6nqUMB4bwyiAi8On3oF0uRRL3rDeUJpZCU9Uiu
 XJJQbN24wn2Q3i16H85yTZfOztbdbVjai6ZasP8wvReeT1Gac+yshCp3eFhK2rHKjrGg
 SGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692219217; x=1692824017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIGT6OAj0mzc2nkSC81/vi+6gJHIm4hDaa2CtM6vDTc=;
 b=I1he64accmzQYBdaDLsDlV0AlUptuu6NayJgwqNHAUW3Lf2N79CQZJx1ge/bVD1+4B
 /6YObOjzigV8m9I9i0py+wdVgnKklBIiNu39OJIYUD4a29TJT6wUaG3NUREn50g7en84
 +1IYsEZAvPi9fQrkMLLRN/8+jho7+Jwh5BXJNLmdRTFm431Di5Yr6RgdvPmfcqe1jhdn
 MX5OJPvQ8QC1i47XHXuv1kqcf8L28aO5qArpcXI7TFOyQQEJmRLq7MsAzkivdrdI6X3+
 WWrATYgXX8ZEIix0GQlA9YIaKHTxVYWEWVYXEnf0pCPzUzKdkiO0X0CSbbfAEtN+5dUK
 mL9A==
X-Gm-Message-State: AOJu0YzOSEge70ccAX2WSLjA70B0/qCHuVuKnTvvHvZdqbIXTt/t7CUZ
 yhpdgGktoPSXbkzfZdrQosgA47dzLMedLJCC3hQ=
X-Google-Smtp-Source: AGHT+IEHByZDoeR4EN4tKZmePnJQvlusqIFsy11WBSSJOGEA8538DdR6m/+/HXE/O6AAXqy9FNy4znBTsYvuvRZZo3o=
X-Received: by 2002:a05:6870:b295:b0:1bb:583a:db4a with SMTP id
 c21-20020a056870b29500b001bb583adb4amr3879233oao.44.1692219216975; Wed, 16
 Aug 2023 13:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230816021958.1921084-1-chenjiahao16@huawei.com>
In-Reply-To: <20230816021958.1921084-1-chenjiahao16@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Aug 2023 16:53:26 -0400
Message-ID: <CADnq5_M51bEAhofMsFPeMi9abcg7OVggUDdR2BUbxX9OUc9bzg@mail.gmail.com>
Subject: Re: [PATCH -next v3] drm/amd/amdgpu: Use kmemdup to simplify kmalloc
 and memcpy logic
To: Chen Jiahao <chenjiahao16@huawei.com>
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
Cc: srinivasan.shanmugam@amd.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, javierm@redhat.com,
 hongao@uniontech.com, luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, xurui@kylinos.cn, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Aug 15, 2023 at 10:20=E2=80=AFPM Chen Jiahao <chenjiahao16@huawei.c=
om> wrote:
>
> Using kmemdup() helper function rather than implementing it again
> with kmalloc() + memcpy(), which improves the code readability.
>
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.c
> index d34037b85cf8..7473a42f7d45 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -264,16 +264,9 @@ struct edid *amdgpu_connector_edid(struct drm_connec=
tor *connector)
>  static struct edid *
>  amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
>  {
> -       struct edid *edid;
> -
>         if (adev->mode_info.bios_hardcoded_edid) {
> -               edid =3D kmalloc(adev->mode_info.bios_hardcoded_edid_size=
, GFP_KERNEL);
> -               if (edid) {
> -                       memcpy((unsigned char *)edid,
> -                              (unsigned char *)adev->mode_info.bios_hard=
coded_edid,
> -                              adev->mode_info.bios_hardcoded_edid_size);
> -                       return edid;
> -               }
> +               return kmemdup((unsigned char *)adev->mode_info.bios_hard=
coded_edid,
> +                              adev->mode_info.bios_hardcoded_edid_size, =
GFP_KERNEL);
>         }
>         return NULL;
>  }
> --
> 2.34.1
>
