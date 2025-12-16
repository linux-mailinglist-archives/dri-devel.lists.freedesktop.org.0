Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE298CC3FEA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7010E973;
	Tue, 16 Dec 2025 15:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D5Iw8MRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E82910E973
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:38:22 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29ec714c68cso8691765ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765899502; cv=none;
 d=google.com; s=arc-20240605;
 b=ANnxPguN3a0Kd9IhyA+i6d+ZLea9aTQ2JvJyST29epxkDllWivsefeIQAU/8NanT51
 RP7yjgOmXQV8n/61Lp10Ay8lp0HePt59Jfj8L7ijiasWr081SNNhr1cSGOvNEgq1F1tB
 S+jegmRWOIAWKKnqDJnZa8jqg2GB9ZDaiMR4M8wybO1/n5bvEvAYacafwfQufFStRlCV
 bKzX5gIkq+Dh0WesT9oNNtbf4jKj/bIZi8KdtNbGPfYaawr7vTKZPbOoUoMxsoCszCLh
 7r5SGDenWjKNflpJUyycYW8Y01R+pNlEeb565wHYa2SWCA697ccp3hCMzqvBklTcmUcy
 SoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Rm7OrcTnLs71zOQFz0RJNAZTC78yB8x0knojFOZrTuc=;
 fh=RsMUtTOsrkArVzQljUdHW1agCjcWRN1vQe6yfiTQZGI=;
 b=XMeN5qSgbitiC8djvHyhTila4ZeiJb2T8pTXqqu9E3Z3QuOtfs/5CiS/ep8vVf5IkP
 3qWMbuJWXY29H4kkBzNxbB8eduMpo+UBykxEhdD2XLMEjmPhQq6bwg0vE/BspjdBleei
 Lr85LCv6FdGE4Dd/gB9zOeQVuTR5cZ39ON8XL/SIVBdz+d9bD4nhqclG5lUzy2EIfuZm
 UPGRXIHFnFx6hI88fUMlyNQib9UTVz0ePFfrpazyGrorAGlEDD00nhn9U10nzFBgw+0m
 aHpHFKNOjpAx87aDEZFXl3LDl+kWi66rfa92VHGKJsnCjtLUsTTBgLceHa3OrjvxlwRC
 l63w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765899502; x=1766504302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rm7OrcTnLs71zOQFz0RJNAZTC78yB8x0knojFOZrTuc=;
 b=D5Iw8MRF9bLGp8lhnM9V9Qp+jFiCuK6Ikp+LZBJF/1+rk6U9b79XRNKPTHkPl2n7aO
 Oz96xRHuOapQoj3SUSiGQWlBtbwhoXiYXgZaCTQlJqNhKiWpksfSKWR9siiSQgLXOdyU
 WM++WQVqJx6Zr0ZgWTVQXYE1KXAhPFtXxlPWLYUlIRGnIzhgT2FgTU5Yz953QF+ILjoE
 2Vbjf9r+OCKv975u/PWDO1fMymFzjR4S5h7L3uctuZ6kF4n35WUb5H8vJSdFW+9+DXzl
 5KtjPFhF3gnWjcCAia4kdjrVYZ/b12lh8+WsdwddqzjMhswwB0xYNOSzfjidEv3aeU3F
 9ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765899502; x=1766504302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rm7OrcTnLs71zOQFz0RJNAZTC78yB8x0knojFOZrTuc=;
 b=Gik9I00Ob6Zb7aXPfoScCn4DLyvx3m7DkdJUegHkiWg6b4R7mZ6jifzYXWgY+vNuPE
 62PbcKG/8wEk924Y4FVd9ZsAzdwPHyHeZkVgvCGzJIOL1lt4ffY2AG+eDAlebAQBzwE6
 D2ru6spQeTk4ANp/Rt54/f8j2ZzfvQaLRHv8+sKXuXsALfoaTONlcCrjmKOti9BcQB5D
 lRJ5YiPO4fde79PHRbLeJ/fz47yoCqsRn5uyg+XfFrchp8PnAJ1MxFs/TWwHHwRe1NOT
 REygfT4Xnbvx29PQ2OrnPHcitHHxMPDQC5hrkUqqOs2wo6e9LCcS8v1Cmb5E4V04pNDF
 CjkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhP9eCBK6nsi/uOjCk/pDOg6dVsOVPPPy1DPApb98zPJQnxRLg5ZH7TjgdiAB88umVzNfhPOs0OfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQyYeGB2Pv50+fNNRjWdIz5d1gFLJNVzjZIWM3VRF8ZYr9fApT
 ZQYcF6j0lQLR/owIyBqB1ZuMocra72+YWL3HLOlojTifbBIBsummRnp0y+OJemI+lqB1u0umH2p
 uxojp1FlIJcruaxEGzQkEF5t2Csk7Q4E=
X-Gm-Gg: AY/fxX4BZXsASPYT1FKEzlQOH1+hDDL+ofHGoZJnMws/+5s6syQ6W4HCJa379Ly2bHe
 N1Ze25Fy5VIIOCu4VCwzZkPuj3V0DnkxP9FsVcR5k9KA6FZN0ONhBBBXR/1uDZ0ImZCg27hPoTz
 Xs5IxDxbPwKqkhaMsRuBDAtx5K7Khh2Z5S2R0SoSaZPnYo+anJA4tmCiZM9D4AcvGno7m76EgOX
 TFbG9Iw7uqpLBECMWGR+okgqJT0V8xc4JsADZbE01JTJG9PDqdApDh2eL6j09Y26pTKIoc+
X-Google-Smtp-Source: AGHT+IFw562O38mZEGeClFXH2zMvDFvApIAlMxnUt/aJdHfSLFrdgXroskIRI3NdFPMbEMWMy2zIEu3Qz4UcLkQzaEQ=
X-Received: by 2002:a05:701b:2513:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-11f34c3a335mr4489341c88.5.1765899501988; Tue, 16 Dec 2025
 07:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20251211085923.737742-1-karanja99erick@gmail.com>
In-Reply-To: <20251211085923.737742-1-karanja99erick@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:38:10 -0500
X-Gm-Features: AQt7F2pYMcVO6GY7EKKTm18qf4WJNZ6vpQXfBa2A3A3LiP85et9YQoK2Kt1sz8c
Message-ID: <CADnq5_OryE-DU9tfJAD-cZtUtWtKAHQ_0YZ1tdSencR1c8MXkw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon : Use devm_i2c_add_adapter instead of
 i2c_add_adapter
To: Erick Karanja <karanja99erick@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Thu, Dec 11, 2025 at 3:59=E2=80=AFAM Erick Karanja <karanja99erick@gmail=
.com> wrote:
>
> Replace i2c_add_adapter() with devm_i2c_add_adapter() and remove all
> associated cleanup, as devm_i2c_add_adapter() handles adapter teardown
> automatically.
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/gpu/drm/radeon/radeon_i2c.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon=
/radeon_i2c.c
> index 1f16619ed06e..f3ba4187092c 100644
> --- a/drivers/gpu/drm/radeon/radeon_i2c.c
> +++ b/drivers/gpu/drm/radeon/radeon_i2c.c
> @@ -931,7 +931,7 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_=
device *dev,
>                 snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
>                          "Radeon i2c hw bus %s", name);
>                 i2c->adapter.algo =3D &radeon_i2c_algo;
> -               ret =3D i2c_add_adapter(&i2c->adapter);
> +               ret =3D devm_i2c_add_adapter(dev->dev, &i2c->adapter);
>                 if (ret)
>                         goto out_free;
>         } else if (rec->hw_capable &&
> @@ -972,15 +972,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm=
_device *dev,
>
>  }
>
> -void radeon_i2c_destroy(struct radeon_i2c_chan *i2c)
> -{
> -       if (!i2c)
> -               return;
> -       WARN_ON(i2c->has_aux);
> -       i2c_del_adapter(&i2c->adapter);
> -       kfree(i2c);
> -}
> -
>  /* Add the default buses */
>  void radeon_i2c_init(struct radeon_device *rdev)
>  {
> @@ -999,10 +990,8 @@ void radeon_i2c_fini(struct radeon_device *rdev)
>         int i;
>
>         for (i =3D 0; i < RADEON_MAX_I2C_BUS; i++) {
> -               if (rdev->i2c_bus[i]) {
> -                       radeon_i2c_destroy(rdev->i2c_bus[i]);
> +               if (rdev->i2c_bus[i])
>                         rdev->i2c_bus[i] =3D NULL;
> -               }
>         }
>  }
>
> --
> 2.43.0
>
