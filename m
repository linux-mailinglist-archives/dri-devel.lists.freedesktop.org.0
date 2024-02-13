Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07190854431
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D8010E15F;
	Wed, 14 Feb 2024 08:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LWwkF2tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144E510E8FC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 18:33:07 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55f0b2c79cdso6557708a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 10:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707849185; x=1708453985; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B+PKDVGpsuB7nKSWQah+oYoMU6sDZbj7wuhtnl88f78=;
 b=LWwkF2tP8KkjH+9URFUDyOPDCHeQKd36GUIEmty8XwXBbmTE2TYinWFdrK9OcRtW50
 cjEoS1e6nOuJnR9C7Z7OTD8zoSB2pBBJ5XY39PqkPmYsQIRkoM0KToEdy9h1Nxt+TvpC
 Jl3yj6WzuMRgEgp/WnqDSFlvr7IgAZIdkEfDd2YuDMu0zWQuIF9IXY4wm5fqr0DQmzyq
 eSNOa5Y7rTFsUXSpI2JiCrSqlM7/9jawrtvbhAXeD6wnHNixUPPw+GrRYIWp2wE+lYcB
 /e49hv0KeUWpU1bSzu9tTRrpU3iINirXEpLPOZRzq/ksUX0bPQ/FUeUKfMtolWz6D1T9
 mNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707849185; x=1708453985;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+PKDVGpsuB7nKSWQah+oYoMU6sDZbj7wuhtnl88f78=;
 b=vQmIffjuI4Ar5BWNXu4Yavpy6lXCLSr2aJ/ErjdfpH22kaqkEfebl2anAiGrpTonCc
 zpBTRjBRygvMpVZ0AZKkKf5uswzCVTpIc7fcpLYLFET5g7nkSVvKLHV+JIXtleHTRBIy
 ehmvMkyQVSsn6X52NsN976UqBSMofDTll0lHuYsDvZ++Klw9FqzFde2RygL3bygsqiQo
 jUa2ijV9sMHPQA5Eli+2/Gl/kZh9kP122L5HSJwH8Y+1OFyn55+LVaxvcVPqV/w8azGP
 fX/5dD2iyt8sZi9GWmbVPkganyaJvztkxZrXtvhx3ABCIKxCA9IFj8uUZmTDDGQ1OT8j
 ZFaw==
X-Gm-Message-State: AOJu0Yy8icKZ8tKxEgfRAXUBcGLo8WHkUKXHUgnLy8OY1IqZxn+t530V
 xrN3wJe6xh25w354dWgb2Pc7CRkC3+ZhV3xz3+QuAGtRfOEruaiE
X-Google-Smtp-Source: AGHT+IGUs4TucCGfmD5ueF97+M1k8oOPVOqap+bz5i+YMzT3KIZDvbFd5xlNZtAj908r6TpXF2eLFg==
X-Received: by 2002:a17:906:c44a:b0:a3d:14cd:f5a7 with SMTP id
 ck10-20020a170906c44a00b00a3d14cdf5a7mr116597ejb.24.1707849184936; 
 Tue, 13 Feb 2024 10:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxKPneMdwPQnliJ/gUlhKG9r4ipF2STxArjZuwsHs2tzXcEZM8Qz+eP+bsl5azng37Z77u1C6pwdTcpQ184oPIfgZrJuj8f273xGM0ZyfUQbvijMqomJRx/7mAIgEUTZTkWy17pBUc7J5I0NgoCYLzUaUgaeIcTiKqEJubv0i8o7dChwwE9FP8F03EYe2YmFJNjio7RaEZA4h+Znj0IYWWUGsrJk67UwfvZ/CbnHEJutctNoyB9uKKvBu0+P0818k=
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 th8-20020a1709078e0800b00a3d1897ab68sm526708ejc.113.2024.02.13.10.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 10:33:04 -0800 (PST)
Content-Type: multipart/signed;
 boundary=0a9fa848bf13dc3f6d68d18f6c155adc6a5a027ae555b6806e8a7e69f548;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Tue, 13 Feb 2024 19:33:03 +0100
Message-Id: <CZ460BUC6Y7D.1BJ8X9RRVRVPE@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] gpu: host1x: bus: make host1x_bus_type const
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240213-bus_cleanup-host1x-v1-1-54ec51b5d14f@marliere.net>
In-Reply-To: <20240213-bus_cleanup-host1x-v1-1-54ec51b5d14f@marliere.net>
X-Mailman-Approved-At: Wed, 14 Feb 2024 08:45:22 +0000
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

--0a9fa848bf13dc3f6d68d18f6c155adc6a5a027ae555b6806e8a7e69f548
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 13, 2024 at 3:44 PM CET, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the host1x_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/gpu/host1x/bus.c | 2 +-
>  drivers/gpu/host1x/bus.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to drm-misc-next, thanks.

Thierry

--0a9fa848bf13dc3f6d68d18f6c155adc6a5a027ae555b6806e8a7e69f548
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXLteAACgkQ3SOs138+
s6FRzhAAgolp6TG5UNvoKNh0Qhzl1mr99uhsEB1A4oLSmdi7Z2KUPwmzs9FJGZRj
2GwJBb12PzksSMOE3xIBNu3EK45diHi/00lPKjPY3jiaR08AtLaMcrPmy/O472fW
d+JiyHMgne/SLoOuJvxRryx+MPZMrrUoAgIM574jxLOaWbNV7aCKjQVNoLhPsL0/
ZKmvowbL6NTUVprnL0NvmblY4bz98JSxWXAN2f6EO34lo7gVhqDyk1IZuIWU4RBZ
SD1VaVldr0g3PULLH6VVJe0hH/Mxoi7V/I4zlI+jagKpHdF6Brr9ViD+R/AE/tFo
G+HOWjmC/OhJvBiW0/DXd51JyhwJVVqNYN+Qcbrdze6L4EsrxLAaab7L2rzrc1Bu
3mWIRZ2jCQpNjEe0exAf1FQHddT+R/5gvLWAZr6szDD4uSV8crXgiEJl9dBssu0S
z29PO+JNbnlvq5DcDi2iDtNoy9IAEdfCQk7v76IhXqBH7uZAEDfWVDF20CtNmk+/
alfvn+nNEXzldW9+UPs40uYV88GfcbP6EIqN/SN4MxFXxtK3TQe7hKHjOVlXIT8E
1f06zctOOTWczqXO26JwF5ObQh5tV8CPMwTXhP2n8WzeDcDuAQx7VHRe4/UuHisC
L5n+7+GHCQdYDCWr8V920HmYiiB0/KBODHeeZXmkIE9JWDukODo=
=aI8z
-----END PGP SIGNATURE-----

--0a9fa848bf13dc3f6d68d18f6c155adc6a5a027ae555b6806e8a7e69f548--
