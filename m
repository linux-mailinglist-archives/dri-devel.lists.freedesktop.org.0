Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB4D1B997
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 23:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB86410E55F;
	Tue, 13 Jan 2026 22:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lWirji+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927210E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 22:34:20 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8710c9cddbso432204166b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768343659; x=1768948459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCjGNZYzF+uQyqn73WJNSUS0xs7xih2Got5mg0iTccU=;
 b=lWirji+qgp8Z0oBFMfQNJXPor7H/UAJ43p5mdbvF1xaYAaNS7TWi5Pq/+9frPhNeRN
 yRZyfT2a5G95eGlRfJm1eGR/k7HtqjYGRl230XjQfH/+LMtfKgSXwYf7kjEE5dGzIKJn
 E0PWlpr8HxWAnjpGw7PLMuQ+3dpQk6b+Ax8dW8WxvSF2CrwbBfhfHqpuHDEiOGgRG+TF
 vW1vHUKqMYTvp236NMw6mjkiumYcxKdeousaoE6QqCjbza3jiqraMZQtM5B/Q1g+Ou6F
 ZehrnVApzRudVjp2YehQAHzvPDiNqp+QR3RhV4P2pkUOrnKtr8QfpNHVXaKs9LwxgQNm
 Wsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768343659; x=1768948459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KCjGNZYzF+uQyqn73WJNSUS0xs7xih2Got5mg0iTccU=;
 b=o0Yv/tkrOSOmF48W2lXYe9UDwjQyvJiT9A0qcT6SWr2mhh3qbmRUn/tPL4mULsQPLA
 YK3Skfs6PoQcc4/FDsuhwsk6w06H+PVdCwH+PguqhnxmJfJ/nYxsfNbHoxbipm3RJNY9
 K5AVIJTXnMd8sVLzGBZHtz7WeCUrrevlIQRskm9HJkx3X++Sl19F77O6DAK0qajDZHDe
 1wL1zQEel1qsRtWbaEMJBAEeQgw/MB09Ie/86EpwujNhDWv+I4OFRj4eVAOjQd+ezi2V
 MYTPz1JH16jnpta4eV/SGo9DNTLQpF0ZHh/wm0jm2zsEtx1WIZTOlhbrjI79FhyT1IXu
 +iuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiav+Vwxp+fUHnEZU1eW2yG2Xax9DdSlm1wZoqNPIe1S/xAW9JJRdiH3iwXJDyk+X5zReDCYlSbWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3NGnqEzsmpAjkcKcD+OV6ImzvX67/BIMWLDfDdowuhzaiwaEq
 tW22cMqiEwQiFEpwmJFuklDJm8mz2R47PTPIFlF2pU24bvzuepT9+PSx70MVFXbusw2aXH0LUgi
 lQCxPz9ke5Wky45psRUGqGlrTlRfwYFc=
X-Gm-Gg: AY/fxX7tntbOmnDadY2EtklyfXSKfihWkvyzoSQNxeAb8lVODr/1WOeTJGao+wRAP0/
 5XjnxgDDX6rjAtzYgLsmc8z12KiV7e8BVmGL42a/k1HX89UwTq5YzW4V4wgCjes0ht0pRWJdBPa
 PiANocA5NyMjoCrfew1I/cSD6KrVU8NtLaopHK0tfHnGtg2V9z3JtJZVGKRYvXPG9H0rBpheeMN
 tCJOCnQvi5LE8YCTHuQj610L8kfTZfamNV0YTNHngWdVX7mHzOBFPPoqXstuhY+yKhj7Ly7vtiz
 Dt6kNfRv8djbf4s6r/dwdVFnNqwvSaUmvAipWqNlxiTWRHOBRTgplXjuUvBAGhz5+MB4Urg=
X-Received: by 2002:a17:906:6a07:b0:b87:2e8a:e256 with SMTP id
 a640c23a62f3a-b8761139c37mr65177666b.31.1768343658499; Tue, 13 Jan 2026
 14:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
In-Reply-To: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Jan 2026 00:33:42 +0200
X-Gm-Features: AZwV_Qg-KjGT__tA_wPvwToo0BjLz68_JM46Yv5Ai0wR3NAD2NC4cBQyUjLnf7g
Message-ID: <CAHp75Ved+zhACJ9CYLYnkzW6Z52fmZT0VY+0NWKYk6O38HCkdg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abdun Nihaal <abdun.nihaal@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>, Matthew Wilcox <willy@infradead.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Wed, Jan 14, 2026 at 12:17=E2=80=AFAM Gideon Adjei <gideonadjei.dev@gmai=
l.com> wrote:
>
> Replace udelay() calls >=3D 100us with fsleep() to avoid busy-waiting.
>
> The delays are used in init_display() callbacks. These callbacks are
> invoked by fbtft_probe_common() during the driver's probe path. The
> probe path runs in process context which already uses sleeping APIs.
> This makes fsleep() safe to use in these situations.

You forgot to add a changelog...

> Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
> ---

...somewhere here.

No need to send v4 because of this, just reply with the changelogs for
v1->v2 and v2->v3.

Also note, it's assumed that even for such a simple patch the time
between versions is at least 24h.

>  drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
>  drivers/staging/fbtft/fb_upd161704.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

--=20
With Best Regards,
Andy Shevchenko
