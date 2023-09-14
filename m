Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4DE7A0F31
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 22:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9B810E582;
	Thu, 14 Sep 2023 20:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55F410E19C;
 Thu, 14 Sep 2023 20:45:35 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1d577c89a4fso735375fac.1; 
 Thu, 14 Sep 2023 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694724335; x=1695329135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYFkx59s2xs5GUhtqs0B2NG56CjyPAmSZL2SFzjSb1A=;
 b=Q0TT/6MriI6cDv5FZfcTzA/RRKNMlAxOMuJfj7u1xz0FjiEUpVzW/G+SfZnSFKaiUN
 rWaegKFqxEK94Zy2mhzZJnkqpW/A+uSYUPYGx5ppg4g2WPA8w950t584Lu9hAAAyJVdR
 rw8L++fspXLjz3lQpWiHsDETUmajcvpO7KpwWxeru6gLf9HQh1Izl7OOjReiJ5RAMGzk
 gqrnS1M0uzjcZ81dLuy9nzpB7oBxTNkd7h96yR+PNgmLLyeQsnELs3ZyiPE3lyj+R86T
 rXyLNZWna1OafMuJcb5D60v0DbUZrvahCX3NF0WpZWcrU9YjfzfP95a3hJCv+qNx9Pf8
 xnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694724335; x=1695329135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYFkx59s2xs5GUhtqs0B2NG56CjyPAmSZL2SFzjSb1A=;
 b=prrEgXjv/yoYKvWs82+sKh7q/szz/+kcKd12PEzG5OANBoTzOV3VNDNKmrvcc0rjrr
 8RZEbYkdp7Nq8JYKbwP0iWScCEZNBmVEj4r2IKYdr4KR3/+b/h6TA4MwsBLCf1ye5uy1
 wHiss5uZV0jyYyyZFZ1Gzg3XTU+W808rylDwUvMo05rQUny6qjDaNAWLFp6nznfyTUss
 TxOoHhnzw5Xy0oVTssA3eKYnwuvozDcEGWwqPcreCG47MueE247lgKvi9ntamJHbAqeS
 e3sNdw0jO5Nd/icxH3pQtId10b5UdobtPbPM7Fkup5N3enyk+VqV9nyIoqsHC1ANj61J
 heRw==
X-Gm-Message-State: AOJu0YxCZFdowbbMqiBG2SDZG6hX8DbbNOPZlfBqaK6U0sPlVX0bqNH5
 kaWFk+DeyllSWqySUGQwamXXCnS0DIa+GnSQR4U=
X-Google-Smtp-Source: AGHT+IF0ninFMuKfFQj4R5kEyD2TqpllZdJ07TUZpeOjkb7E2DciQ4ukpmEmeloHGp0094kz4pau7MLErnTAD7pMk9o=
X-Received: by 2002:a05:6870:3412:b0:1ad:5317:1f7d with SMTP id
 g18-20020a056870341200b001ad53171f7dmr6949318oah.39.1694724334982; Thu, 14
 Sep 2023 13:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230914094533.213548-1-liucong2@kylinos.cn>
 <BN9PR12MB52574EE1CDCCD04336E963FFFCF7A@BN9PR12MB5257.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB52574EE1CDCCD04336E963FFFCF7A@BN9PR12MB5257.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Sep 2023 16:45:23 -0400
Message-ID: <CADnq5_Oaw6Cm+oUb_TpfPwTt_euA85CB1aY6dxcW=r2hjp_Aig@mail.gmail.com>
Subject: Re: [PATCH] fix a memory leak in amdgpu_ras_feature_enable
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Cong Liu <liucong2@kylinos.cn>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Yang, Stanley" <Stanley.Yang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Sep 14, 2023 at 5:53=E2=80=AFAM Zhang, Hawking <Hawking.Zhang@amd.c=
om> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
>
> Regards,
> Hawking
> -----Original Message-----
> From: Cong Liu <liucong2@kylinos.cn>
> Sent: Thursday, September 14, 2023 17:46
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <ai=
rlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Yang, Stanley <Stanley.Y=
ang@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
> Cc: Cong Liu <liucong2@kylinos.cn>; amd-gfx@lists.freedesktop.org; dri-de=
vel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] fix a memory leak in amdgpu_ras_feature_enable
>
> This patch fixes a memory leak in the amdgpu_ras_feature_enable() functio=
n.
> The leak occurs when the function sends a command to the firmware to enab=
le or disable a RAS feature for a GFX block. If the command fails, the kfre=
e() function is not called to free the info memory.
>
> Fixes: bf7aa8bea9cb ("drm/amdgpu: Free ras cmd input buffer properly")
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index 8eb6f6943778..b4a8ea946410 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -802,6 +802,7 @@ int amdgpu_ras_feature_enable(struct amdgpu_device *a=
dev,
>                                 enable ? "enable":"disable",
>                                 get_ras_block_str(head),
>                                 amdgpu_ras_is_poison_mode_supported(adev)=
, ret);
> +                       kfree(info);
>                         return ret;
>                 }
>
> --
> 2.34.1
>
