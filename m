Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BEA6F12C4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 09:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5D110EC6A;
	Fri, 28 Apr 2023 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5A10EAD1;
 Thu, 27 Apr 2023 07:44:53 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso1207363166b.3; 
 Thu, 27 Apr 2023 00:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682581491; x=1685173491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yN4Wi6us9tqsW8wES8TfgapwiSQM5W3hLxG1tm9HFuk=;
 b=Z/MeeZiHBqR8BxiSLLgHCC/EH/QJKBpmBB+s+TiEbkHjNHGfQk8bgl3fEdk6cTAb8s
 i5Rgr7ATOP4iz9wyQn6Aecx1h53Y7H/iWCEF3Xs1jE6x40FOT7R87qeSkCvdCDsnX3oM
 o7J6sMW/R47q/Q95xro8n92wplp3kDXiWD2xJr75vZTJrwQUwzjwYHPZkolBOMlHwZC6
 LeTwzxCIf4xH76inLIaInXPJhcTfXWNcXkwUyGxuN7+aEVNRnjZhgEnXr73M0Vyo7AoP
 XYXo7mO5TFHAHW606Dt5BMF5OXx3j7KHPy0Q5SU2Njjve624+FyCJcm5dvnNRJ2HorOy
 4yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581491; x=1685173491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yN4Wi6us9tqsW8wES8TfgapwiSQM5W3hLxG1tm9HFuk=;
 b=A80gGCMLNXPI9ZEkAbJo+tDV/wyB10r79dQ49irn/G5//2XqY/R+aA5pbqYtY/Ndbo
 vvgffKHOr5WCObkwIyWZLQUGp+xpKjht6VfZ/b9p4BiIa4SD6OReF+iBCQ/RQXvtMQ6g
 xv3DBcN3T9Aiy0QODcy4PUht94XgJ+0CTB6eJiIsS5xLsE/Golnq9B5spE1PxlddkjQO
 X5RnhOJdjY2i74GZ5oxismcXT4U1AITMMKSMY6YfvIusMzh/lJ26fZCwU/NIH2g29Aig
 ECauaccqu+1feAVFJx+0Gz6dH2oqzXnbvB8lhGJ8VQs2wFqWmRUAKoZYXQRZa4v2Gbs1
 klqA==
X-Gm-Message-State: AC+VfDzEFRKeRSI5Is9bKlFbpnAwLwqA6BLgCBXwT3P17+KgrbrlZFjE
 cuJmhelvjbrU/yT0RvaCSSXKPbFP+zNlRhIk4rQ=
X-Google-Smtp-Source: ACHHUZ7Ivm3w6KJmjlpirXR7ZF+N4Jh+ldZEPc5yzcTHChvJ2LMc/imtrzBOL4rDvKcbf9E6AyOGILa+jzdbdHALb4Q=
X-Received: by 2002:a17:907:961b:b0:94e:6a24:9463 with SMTP id
 gb27-20020a170907961b00b0094e6a249463mr909190ejc.28.1682581491617; Thu, 27
 Apr 2023 00:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230419122233.3440-1-hackyzh002@gmail.com>
In-Reply-To: <20230419122233.3440-1-hackyzh002@gmail.com>
From: whitehat002 whitehat002 <hackyzh002@gmail.com>
Date: Thu, 27 Apr 2023 15:44:39 +0800
Message-ID: <CAF6NKda1Jy_wfxaVqWt-o75f1BO-o4JXHY9HS9_JtJ2FHztMmQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
To: alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Apr 2023 07:47:34 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hello
What is the current status of this patch, has it been applied?


hackyzh002 <hackyzh002@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8819=E6=97=
=A5=E5=91=A8=E4=B8=89 20:23=E5=86=99=E9=81=93=EF=BC=9A
>
> The type of size is unsigned int, if size is 0x40000000, there will
> be an integer overflow, size will be zero after size *=3D sizeof(uint32_t=
),
> will cause uninitialized memory to be referenced later.
>
> Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 08eced097..89bcacc65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p=
,
>         uint64_t *chunk_array_user;
>         uint64_t *chunk_array;
>         uint32_t uf_offset =3D 0;
> -       unsigned int size;
> +       size_t size;
>         int ret;
>         int i;
>
> --
> 2.34.1
>
