Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6AC6D0E7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A042010E58E;
	Wed, 19 Nov 2025 07:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YPpWVRqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B46A10E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:17:12 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso11868046a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763536631; x=1764141431; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/EJ+O+/tQ6vW+24H3RZKmxUGOMkY2b8gAhqMukrgBCU=;
 b=YPpWVRqRWdTJhGpf5PO3CU7OOfpAr9OvpZXRYGcbf/2fRRnj8jj40//iFhNT9pdFuQ
 V9T6nDQhvT0Ciq+V2zL1a9a2TWizWF/c//btwDjkJ5xE0aNlirfGNS2k6l2axgeilMNC
 i3ztXHhLBezoqBTUYkE2DuId+zjQcIeGsTPGWSCUnOLriU+tvHQbuMjqwkkp5uAXjTze
 6Vykl3U+p+vWMH903mhfGJW54XGvHYzZaR0DiiTMGJoZtCX0aiY8jUbY/RAaPiWPvWbU
 Ozox8EJJS8kyCBrbsDTP8Aczuoi232SnfL8BSVor/hmVJ8TR+7tJPXBDFJciHN2szZpZ
 yytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763536631; x=1764141431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EJ+O+/tQ6vW+24H3RZKmxUGOMkY2b8gAhqMukrgBCU=;
 b=Omv0IDPpCk2xIDGoeASxGWbZ3VUeJEtrf/h9NKRhYFVFw99DPkxNWi59U5qMAwPPFv
 XFTu9zBDCX+yHFfmx6TbL2oXaQsZO9l1+K4ii/F/h+9JiiF5iZqOzDcPjwLc+VoMeWRb
 2bIg8GnG1Iyw7c5IqUtz8Di2od4vpo62V7QsInN9UNe0UTma8URjQ28c4cxCSc+If7rM
 ExOzLe9GhT3QEsHMFeQ1UbUO01kNVwh6ieSjftLF7k6u/mlVPtot0H0mf24mQrWJ5Wd3
 BMDvbbLXKoit2e/To2CkItAd12eguByMBGkwRr00ZSUo+FlypaMp3lLmhsUt+bxP9bR8
 dj6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVOlejcbvRb9dbKjJqfZcg4BscDnfpLuqCxa4RxqyhDEFmyTkdm0wvg6U0e3mbF0Y0No6DpwkfsUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFa6QCbFbO31zZ5mFinU3yW7/u4HqMBmrpNGveNMWyoGO3owwJ
 73AkeMb/1okfN4ukR+EyXX28c9FFxlABtjkIvAqIBzeSMV22JJkVFSzlJRkGo0BSdmy+W6s27ae
 TE31T0vs6ygZXzFbJBpzQZA3b3LjT56g=
X-Gm-Gg: ASbGncsNXjYg1arJGNiOjDqGrAvLygPe+C3PoGshgN2KV84obOfWu6fAB5dinMs7GIR
 VnPaUJ0PswICPCSPLwAqgFwsLnQhA/jQSKvWrBxfvvie1BDaEhPs1MLDcL6E8fPNa9CH2Zq3wFi
 8v7n70kbJqJWoYeaMaVBhli84EGtG+X6bCacFsL9vfR56ne5OmqSuwYRW43S0j4j9FrdA2YFkwh
 OW4zNP0UavStpuYCeWy4tfHtl9r/iy0CgHP+9Ek9Ac9Mn0Yl+YrdkBFP7JuxEPTCNGdIGe14hKe
 1KhkmU/lGataY4p8lrIH0MvW
X-Google-Smtp-Source: AGHT+IE9uQZLBFdQDPsVLkSPNjmAX4yph6y8DZKHX9lDmrbOkhEeQZJx2xhnAtV5cyCcH5NeKJmBDDc5Ze+fOVNVM3M=
X-Received: by 2002:a05:6402:4310:b0:640:3210:6e48 with SMTP id
 4fb4d7f45d1cf-64350e046fcmr17282325a12.4.1763536630884; Tue, 18 Nov 2025
 23:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20251115125701.3228804-1-rampxxxx@gmail.com>
In-Reply-To: <20251115125701.3228804-1-rampxxxx@gmail.com>
From: Javier Garcia <rampxxxx@gmail.com>
Date: Wed, 19 Nov 2025 08:16:58 +0100
X-Gm-Features: AWmQ_bmzv8l-KX59QSz0MNOTxclz8UMiBbVuiOxbVwWiFfQ6NOwXKoAwcySw9Pg
Message-ID: <CABPJ0vjy1ccb4DCd5Q1B=LQPMdpAQN+hhWd39tk9y6TbepZoSw@mail.gmail.com>
Subject: Re: [PATCH] fbdev/tridentfb: replace printk() with dev_*() in probe
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Deller,

Any comments on this patch?,

Thanks!

---
Javier Garcia

On Sat, 15 Nov 2025 at 13:57, Javier Garcia <rampxxxx@gmail.com> wrote:
>
> - Replace in `trident_pc_probe()` printk by dev_* fn's
> - Delete the prefix `tridentfb:` from msg strings, not needed now.
>
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>  drivers/video/fbdev/tridentfb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
> index 516cf2a18757..17b7253b8fbe 100644
> --- a/drivers/video/fbdev/tridentfb.c
> +++ b/drivers/video/fbdev/tridentfb.c
> @@ -1631,7 +1631,7 @@ static int trident_pci_probe(struct pci_dev *dev,
>         }
>
>         if (noaccel) {
> -               printk(KERN_DEBUG "disabling acceleration\n");
> +               dev_dbg(&dev->dev, "disabling acceleration\n");
>                 info->flags |= FBINFO_HWACCEL_DISABLED;
>                 info->pixmap.scan_align = 1;
>         }
> @@ -1693,7 +1693,7 @@ static int trident_pci_probe(struct pci_dev *dev,
>         info->var.activate |= FB_ACTIVATE_NOW;
>         info->device = &dev->dev;
>         if (register_framebuffer(info) < 0) {
> -               printk(KERN_ERR "tridentfb: could not register framebuffer\n");
> +               dev_err(&dev->dev, "could not register framebuffer\n");
>                 fb_dealloc_cmap(&info->cmap);
>                 err = -EINVAL;
>                 goto out_unmap2;
> --
> 2.50.1
>
