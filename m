Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467A985ED8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 15:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF64A10E09B;
	Wed, 25 Sep 2024 13:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LePPNrmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8293710E09B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 13:45:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53653ff0251so7751663e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727271903; x=1727876703; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7nmcWlKoFTNATwfWOn0UALVMJO3SjuirbjxhHbXLIAU=;
 b=LePPNrmSln15/WwiW5MCJB2hC9L8OJtMR9HutfckzSBz93LA2mCxWo3BHpfg6287I6
 ApwhmkiMncefK9bJrhUvvbo+AtF+YpW3V8cZ+YmFv9TR1C7qRoFCH8iYLDiWaQPHCbXP
 VqOhLA28CrpE17yA2E8jFofRhUVsvn4KEjVmi0Xk7FtzLALrKm3i9J8CYd4q8flkR1It
 LS1b44vIiwNb3jqn95NId6sSBFy5XAywIIimurKrlS6SumTMyz+RtMs6TNgCqGWp6Ax7
 /VSBUk9Uu0YENtR9l5Rz4olJhVMjMUnzLLK3LnrbTg7u3xslbI3g6jVGS9/s+Q7HP6bq
 E97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271903; x=1727876703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nmcWlKoFTNATwfWOn0UALVMJO3SjuirbjxhHbXLIAU=;
 b=VXkD8wB8qAAnoGXED1NItSTYnhJkj3KAD4SA9xborZ9KZYUlWxbvPDogcRNU0zy/Mn
 kfxzCLpj28pgk0HacWvsVD76mHdUSSo2XIvSdW3IOvZ7c5OdGdIbjh1v7YN2ThEP4FZP
 HJPFxCGW2L099I0HAlPyctZZa+XlA4qP71I2h5DF6Qukulparepw15M8E5oKCstY01tm
 k05M1DdtrTjlNrEZI5LjqEquVvBvf+ZeOFCTE4YZc5H+XG/VLLKce9ZZbwjygwT3dwbW
 /LxViNOQK9KtQ32FngHflTRfUQkz1GpNwbJ4DFczu8ceA6t4k8Ehg/da7VZavZw2DLUw
 PwIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2vebtxseZV0+u7HohUdKe4/nMCSj75JlBaEjTy//4cGHqKqG1Qad7ij93j3gFT2ETvEkjYIozOEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOAr5zGRlCWTKvWBNyF/QAZeDd9bKzwurHhfYZb9yQHvMyk7n4
 I+UPTMEPtVpgBJSI82BTXZSfpbRnt9F4GAKMYk4atBkUjFkfXoot
X-Google-Smtp-Source: AGHT+IEzMxdjhz1ppV735VD0V6py6Nlw4kQc29/A2thQmfr+trRK/o13J4rcG1IMACMG4yHcu+/a8g==
X-Received: by 2002:a05:6512:e89:b0:535:665f:cfc0 with SMTP id
 2adb3069b0e04-53877533876mr1821591e87.32.1727271903253; 
 Wed, 25 Sep 2024 06:45:03 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d79a8sm1853694a12.86.2024.09.25.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:45:02 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:45:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liao Chen <liaochen4@huawei.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 linus.walleij@linaro.org, mperttunen@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH -next 2/3] drm/tegra: Enable module autoloading
Message-ID: <n3ydihjvwboq2dlby7sknpccbah6jape4c3y7gvuyt72yb4ame@xvejzzaxtyqe>
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-3-liaochen4@huawei.com>
 <3ttycjomydslmaqtwnhjehrj7pa7m2i2daqd46kwd2tsxynr2t@jo24br66tz7b>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kzp52tnoqabifusm"
Content-Disposition: inline
In-Reply-To: <3ttycjomydslmaqtwnhjehrj7pa7m2i2daqd46kwd2tsxynr2t@jo24br66tz7b>
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


--kzp52tnoqabifusm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 07:21:21AM GMT, Dmitry Baryshkov wrote:
> On Mon, Sep 02, 2024 at 11:33:19AM GMT, Liao Chen wrote:
> > Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> > on the alias from of_device_id table.
> >=20
> > Signed-off-by: Liao Chen <liaochen4@huawei.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 03d1c76aec2d..1a12f2eaad86 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1390,6 +1390,7 @@ static const struct of_device_id host1x_drm_subde=
vs[] =3D {
> >  	{ .compatible =3D "nvidia,tegra234-nvdec", },
> >  	{ /* sentinel */ }
> >  };
> > +MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);
>=20
> I don't think it is correct. See how subdevs are handled in
> host1x_device_parse_dt(). I'll pick up two other patches though.

Agreed. This shouldn't be needed since all of these compatible strings
should show up in the OF device ID table of their corresponding drivers,
which is where the export should happen.

Thierry

--kzp52tnoqabifusm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0E90ACgkQ3SOs138+
s6HM6hAAslMbf3A5fl+jfDpdUqk/FK5nGyc1hHza2bcFNWadYg45qtAl5trpka38
4hHeOi/6iOYr+KwPXjfd0o/deduoOaKdmXWiuwScqh5dKqMbCUktMqw+VWYsjZRe
BvqfEnqJQnB6kStu8JswuRCUGqXs06Sm5MRDY/pVL7Uvbbh5m+DdlwTI6IjjY5BX
3TTnrBCEjzwYVeB6WYODbRmsfZ2xemtKqX11Llp8yGkkngSwGGPK+tU8veFMET6Y
Xegc48CFR2U52GqLBhbdFK+nb85SSXeMBMBNSi4KKlTaP+sb9WTcl9G1TpdxrE57
OH++4wBoVnzPakLkmm7dDgIIoCC+SVhGi15y8RBqZ0LvduIyzjaOnkJow1Hc+67Z
87qqUQVdqCck+VNaaD+K339bPNVgA8ioyZ2Uy79vnGemazmSc+DLMUDvnOk8DSzD
JYat/dsCVnU1ZaJRKYQHHNZQGbA32tur3V0Z7WhHuwk+VJ31JcSiMgQnhL+UOTQM
/qRRBa/oXqeezeH+ny45p9RT0q2+S7XSMta4kSENX/EKxd1Taez0Z7WhSpoGU0Y4
l/Xw0wwj/C2LEaVfE6ZyT9aEd5xkWC8TE/0MnznVINJYWgOxftvEuG07QUbj+GxV
0WLBNT0FhMZiknSqoO+UTiEYGluifadLN7Po+vT/71CUNq31cc0=
=cv60
-----END PGP SIGNATURE-----

--kzp52tnoqabifusm--
