Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE9CDFD36
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB1810E0D9;
	Sat, 27 Dec 2025 14:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jpDFIBXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9691B10E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 14:20:03 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7277324054so1258903966b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766845202; x=1767450002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3rVAXM2uA2BUpYCLCItwXy4Hyvoocs+aIR9WcWlcsk=;
 b=jpDFIBXxrDKXg5+ErN02mLeb5syawqCpWcEb89w7K/EgeJ0N8iT5hPC82W4hjvBHrG
 VBbfTRYkiV+BDqfrjW3+88qWkiGxWrWf3U0lYZvsL0QP++zFV6z7sfNQB0BdEs+6VcaL
 eAAPN4OWCtXOYory0VfICYH2Bndv5HjOD4RZwc6ryLwrZVXmF0Wr4rWA+zEDks7SsJy9
 3FfBib3DMO6Yhb71t4OQ6Lc3qLO26cp1lYE6uRa7w7yzPWKzsqoCEL91HhGbe8tfqOhZ
 EdxXgjGRKSrTh5M6+UsfiYA+auI0Pny0hv1/FDX2LHWylz7nXQWqdoshUtjS7IUSjR8x
 ciyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766845202; x=1767450002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e3rVAXM2uA2BUpYCLCItwXy4Hyvoocs+aIR9WcWlcsk=;
 b=tCN634L6BX25/qocE7xYJPmxt8FUHftR1YN8spQ8FeHf71kXZnSpKrN7kY170baCpw
 OWLFpLvD8rNk/t4mQ3913Dm90II0icf6zkweWGcu9YEc7hHkVNApVa+03cTr/kyhGeZU
 /b4xWfY+bEt8TxveXZYokfK4FJa7KkCYsCMnVWaW+IRh5/LcmgNQhav0szpWvz9oMWnq
 TgLcha/UPbYFj2oUspjDtrJD/hN3KJcGtVkXEMSJ58TlG8Mkgh4zV7KFy4bm56gnP2TJ
 a31amEyM8eFaS4DuarsghyqU1OaGZAZZDFCPWg6uk8k75qCsaZ/kG2mgm3/L1wZ7xKTw
 y7/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU54QVwje6S1rQz+1tMhMbk+Ef7Y6Wx7Q9t4Ye9c/8a9QWLx28yIbp+ELHRWhWR8NcoRCEaxGKBn40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzNCM+3WJ1hcwwv606QOKjuJg0FCIdRTZigJ0e6hGksteFvk5i
 N1uKqjatXc7fRNBgZu8L29G2a62Wr30XWLHp9ww6kO90FyqNuC7N+IWgUfuFFdW9IF6PcMS1y6y
 9I3tTfWmb4QcUnhakx8SsRG4gMbBBMBg=
X-Gm-Gg: AY/fxX4BuYEOJNMpDJbvRTDWMq/YFqgQLZiZ77C2emTztNnENpRKq/2YcBmW1Lzzgq9
 bCAKLoTs88CmtVo5J2O6L/MnUq9C1+7Kz1Q0DFbnRQvbtqYmGic0W2vZswRMLV1YZ8qHuWV9iKX
 FWqeyxKL7rcZ25WzDRf/joRmEGMzZ4VJpMlVYevxUYJC+0TgB1Cn1jPD7jHf6TGMO9TIm7/kWio
 ppyF15DW5P4eBJUkBCOQSI9N6d2+L7EL13mXqqYZwyUZbuiBiwayg66ztF/xQqV2PW6z/gLZVwV
 8Db4iP9RbJdWPwgIHiH1Yd0VwMnXamNkoHc7iKxDJgimEZBda5UXzPEhNBVpb3vErw6CAtw=
X-Google-Smtp-Source: AGHT+IF8S2vZ7+R+gmMHpDxIPniiRhAY4GhOubuUewd59zPB/hHlKmS5S1gCB4cVMV+kZ1atbDLTB1f1Uuy9kvPPTQ4=
X-Received: by 2002:a17:906:7315:b0:b73:398c:c5a7 with SMTP id
 a640c23a62f3a-b80371a7253mr2621691866b.41.1766845201824; Sat, 27 Dec 2025
 06:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-3-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-3-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:19:25 +0200
X-Gm-Features: AQt7F2qzW7hXhSkhTQqqZrlX5yqv6kNuSTsnbNk-OS8FE2UIntKjLzVunWTLcHw
Message-ID: <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
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
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
>
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.

> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
> - Use dev_of_fbinfo() to guard sysfs creation and removal

The place for the change log is either a cover letter, or...

> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---

...a comment block here. It's not so important to be in the Git
history since we have a lore.kernel.org archive.

>  drivers/staging/fbtft/Kconfig       |  5 ++++-
>  drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----

...

>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
> -       device_create_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;


The better way is to decouple the definition and the assignment in the
cases when it's followed by a conditional (validation check). In this
case any new code added in between doesn't affect readability and
maintenance efforts.

       struct device *dev;

       dev =3D dev_of_fbinfo(par->info);
       if (!dev)
               return;

> +       device_create_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_create_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_create_file(dev, &gamma_device_attrs[0]);
>  }

Ditto for the rest.

--=20
With Best Regards,
Andy Shevchenko
