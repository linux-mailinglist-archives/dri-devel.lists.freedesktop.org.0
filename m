Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC8CB0455
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF0C10E604;
	Tue,  9 Dec 2025 14:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DwJa3OG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057D210E62F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:25:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b73545723ebso960905866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765290346; x=1765895146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tczTAGf+NRaPH/lcY4iGZ+jG9JiJwZWejZNNrAcawA=;
 b=DwJa3OG/LuvRqXOjwYolp8XIZVll0T6isnX6qlXx4+t0rmjcbX4uP+/xeb/WAcYr3L
 BsXBu/jIIagN8qPpEbXKmmGX2fw4FQBOhrNrpORHadWozIwLjiZr7UnxHJu3WwntZJNy
 jox26l55pkS2RsdmvwXSdtxNyzoYqzT7Tqctgm5lDXTZYmKFrUKXAioJ7JdOXmnlow18
 KADJcuUtgsPnOrh1NQpt2O1bma0QjIn/uhh9zNrVDKluHpojajVtSny11dy9aisVi3Rd
 go7xrwzJcAEQSRAQkLxWU4pLNhxF/kNnKSZyksHY0/B6+6QH3N89G8YXQzGJzhzgv5qX
 6Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765290346; x=1765895146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7tczTAGf+NRaPH/lcY4iGZ+jG9JiJwZWejZNNrAcawA=;
 b=SrZRK1s/cBHRwZqBE9elfp3UwENigz0ibI2epGRTqdOZtzhhN9DO57G6eDQni5/ddc
 T0wAz9XxjVhzPa7S6eJOdMDm+9Lt7O9iYfAAiK9+VQ6J1jD14JVqH9Gq30eA3c1pTkYm
 F9tdzKByC4EjTkGziQJ6l8B4QqnprmQab/ut7Tge2U3fnIIBgHZgOrRb5+6e6J+78Zgz
 xSe8MYFM7H+SBnkFkZAkNUbHEVR/iaNJlgnn4oCVjZpPOmwZ3JWImcHP5Veit/bWSKzn
 /zu5KOtnLLWYGQr9QaK+M9Z5cjXFubkVLrrRyDAbBEPwIVY1ufPWO7eOi/y0l8X9q1a1
 d78Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0SvWauS12VuSe/bnCflPLrOHWRNhFg46vYx3krt2BkiyPWVBD/eCBaBROOe4lrr22WLLiD8ny3Pk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTlj+SE63DXlEtRoMqW+KAv380AHR8onoApHiPrAam3zqcYuGN
 /bxOWLdpTIacNjGuDTsBR/m28v66FXWltKefeYUN0u4wOVfzv/iePboEH7aa22vCnuxTdpy69On
 7MVIkmny5R6RjdgtRBen5ny6VxuGzK8U=
X-Gm-Gg: ASbGncuCU9omb4qAZHH5dT2tuAPe7kIqK3ViKUyc6lsiGOnwz8ciP+vyXnz54RU0W4l
 NAbFEzvdU/U7kSynKqGGVtH/wuCQanLOcLrprEptLVPnWcmUg8efrCNIjIf8smi0LOXTOEj8ojQ
 AuKrR8UsG7uP8h/cCjAeEaQX7tmPKKnglAKDWPa+h/BdtULJvP2RwyM/1SMESafurOjfqL+sG3P
 pACq2TTl7Ki8RY/V44dDCy/sHR0AkHh74RQMRq6jyb52V1fcyIDXuEEwyryxPeQudghL89dSVda
 JOWqy4BA5XGUqM5N1BudFHgl0fc1G8MMjKLzYMH4oMEYoUbXY/xEKPNjJDRz+nzBRWh5Zg4=
X-Google-Smtp-Source: AGHT+IEUDyZqURELnRBTzjTZuETiToxli9ABhMGm4/e9CoRb3wfwUJvgUlRqDbyn79ps6rpZIghHoUYB7oNXT7FULvM=
X-Received: by 2002:a17:907:720b:b0:b7a:1b3:5e5d with SMTP id
 a640c23a62f3a-b7a242be82bmr1105272266b.8.1765290346242; Tue, 09 Dec 2025
 06:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
 <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
In-Reply-To: <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:25:09 +0200
X-Gm-Features: AQt7F2oJ-HAqvTo7dPHCW2Uqr5UaQh_WR7_Bb48h-O510S-3IyA861WvQJm_2eQ
Message-ID: <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Chintan Patel <chintanlike@gmail.com>, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, andy@kernel.org, gregkh@linuxfoundation.org
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

On Tue, Dec 9, 2025 at 10:23=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
> On 12/9/25 08:27, Thomas Zimmermann wrote:

...

> This whole series adds a whole lot of ifdef'ery, which I think is the
> worst approach. It makes the code less readable and leads to two code
> paths, which may trigger different build errors depending on the config.
>
> I'm sure it must be possible to do the same without adding more #ifdefs,
> e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
> simply returns NULL for the FB_DEVICE=3Dn case.  Then, that value can be =
tested
> like
>         if (dev_of_fbinfo(fbinfo))
>                 {...do-the-things...}
> For the FB_DEVICE=3Dn case this will then be optimized out by the compile=
r,
> while you still have full compiler syntax checking.
>
> Thoughts?

I second you. I am also not a fan of ifdeffery when it can be avoided.

--=20
With Best Regards,
Andy Shevchenko
