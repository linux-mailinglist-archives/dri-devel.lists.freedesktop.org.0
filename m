Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0210CDFD45
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CB010E232;
	Sat, 27 Dec 2025 14:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bX7TCQJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317410E232
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 14:22:29 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b7636c96b9aso1427005666b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766845348; x=1767450148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wsY2YPUX+wtykoq8K3+fTG9jA80ktVPXe78RbmtQw8Y=;
 b=bX7TCQJeRBE1KfsdUDntGh2xIo2dQY9J6zIbf/TG3vAg+/VTwa04VQN0NsVa/G2RFS
 uBk+Wa8Q6BH28IDp6ZmdKAxUwYYBIVc6EKMNLdx3Iv79hVsuclvcrDrZ74kbhoXv8Hd1
 dZ+wYBbEX2BRI4sMoDfFrdv8uNdwqtfFqrDngF5XdUZnTiCa3OZffpnCq8q4iHubCClb
 r4CvXaRqujdx5YDDbNjk4jkBm33beHTy61SxIIpOhBwV3CP9L62heETzt4B6arExyreh
 BDZDqZz5VHliv3reIR446qEE6cH3wmfW0F7RphkRuwYDhoG7oYBrPq+4OZDJFpCfbegm
 VwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766845348; x=1767450148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wsY2YPUX+wtykoq8K3+fTG9jA80ktVPXe78RbmtQw8Y=;
 b=kOUoVHmQjLcpY9dvoE7ABPelul1y5eO+qD+ZDbB+quDSMNI8eapV3y9ERRbTkvh3rk
 OXMBHccc9jsbAdnomzUvm4iz1DzRcPld8VY9G/rN6r+wk5e1X3fHd4oxf6d7tUgGhd1p
 X3TCOk5EvKfSU9Fmxt2AK9Qzsux7kXcFFdyBOVFud5q8QszzRWOGiqDXVDI/LZCrw5/c
 1MXHSGyGoCf7cdzFY35iZVAZx03plD9KmpCR7yx4AMUQyEAV1/nVgfuds5E51yjP33Mu
 TjZSp+gEslRuS3r24/NAP/3loy1M2ebSX0fmN71783PzcI7Xe4mW6UIGxTYU3dtoOPs7
 C2QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFqjWzn2+i/p90cs5oANXyzlzeKS6/j+k+d7Y9ZI4n7VnOyfu4o7MYV6vQXtTjgVTx1eoVsnW1tgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzrf4gSQaAI6bUNP/953gfH4iOy9ixebLpN5htajIRdnuarvLfj
 TXJtJd5KnIhJGiTorGA/6me5PDjvMEG+NbDgvJ99ipEoG5tZv4UKmmPBmJp32sfBiYW6IHy7Ht+
 v4m57EViU+jeef8owlX1N3+KKR867j0Q=
X-Gm-Gg: AY/fxX4OqwPwJPW6OwC6L43O6J2GAJITUmsxwbIaR5PrAszQDOtrDLDJpYsQAkWJ6Lj
 YCtBN60XqXTJhIbrIyjSqMJeu7tgIPqzQm5Jlm2fuSSqRVbdGSQnYIWzBaLvb0vIVX96gSkOo8j
 oYQirxCYl2zQ7UPXUdICM8D0mkf9xpmn31zSoxbaFqo2ZsH/P/pDdI9MSggVx0BBzyUYy54mHIg
 0UUWZ/tmpeVr9uVxDgJ9SMK7T6LOno+8XDEyCyQ0VOr4gdIrj/54zmww4ca1gAf4XrC01W2wo2Z
 UZKea6/0wD3ysnTiaIpsldpAoWUIelUR9dUtMX6STFlHSy/+5A4jlXAwDGLAHCw17fPY4M0=
X-Google-Smtp-Source: AGHT+IFueBeZlh5SVe0yz+/yxQv364cBzdkglW+0ZdQCwGpAc3nvuAc182enll5nZikPEvfIE1pSBxl7zDgGxVvO12k=
X-Received: by 2002:a17:907:2d0e:b0:b76:bcf5:a38a with SMTP id
 a640c23a62f3a-b8036a924ffmr2886902566b.0.1766845347379; Sat, 27 Dec 2025
 06:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-5-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-5-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:21:51 +0200
X-Gm-Features: AQt7F2pBB7tF8rd4vW2CaPeAEaMHCh3Al7Dq6z2gzKKZ-tCgBNcws0oMLkjEaOA
Message-ID: <CAHp75VfTki7r-BMadsmOWudr2nc2f2VYgL9y6xR64usQB70ZAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
 deller@gmx.de, gregkh@linuxfoundation.org
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

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but th=
e
> core driver does not require CONFIG_FB_DEVICE.
>
> Make sysfs support optional by defining overlay_sysfs_groups as NULL when
> FB_DEVICE is disabled. The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.

> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with NULL overlay_sysfs_groups
> - Always populate .dev_groups

Same comment about the changelog in the commit messages.

...

> +#ifdef CONFIG_FB_DEVICE
>  ATTRIBUTE_GROUPS(overlay_sysfs);
> +#else
> +/*
> + * When CONFIG_FB_DEVICE is disabled, define overlay_sysfs_groups as NUL=
L.
> + * The compiler will optimize out the sysfs code paths when dev_groups i=
s NULL.
> + */
> +static const struct attribute_group *overlay_sysfs_groups[] =3D { NULL }=
;
> +#endif

Hmm... I'm wondering if PTR_IF() can anyhow help here.

--=20
With Best Regards,
Andy Shevchenko
