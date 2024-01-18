Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC812831539
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C810E736;
	Thu, 18 Jan 2024 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF7810E71D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:56:48 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5f0629e67f4so120156727b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 00:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705568208; x=1706173008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yUhp044KaG5kosWl9TplBzHfM0oWfk1S3xB5Nr0ifxs=;
 b=cImRsj39mjzVT/Ky1x2I5MBVY/AabzHyabrKkpYO8rl/5G925NGgZ0Rr+SDtlmWU71
 l4CwAfnwVYxO+ehr27pyE85CDPdHP7SCVNEDoGmybLLwEK8aMSBD6T/CCoA4crP7V2cH
 5s1e5tM1JwTjC6PL1l4zOMl0ibnb5l1Ugg+SIfE2oI5agiNMmoFAy+gdymZRpfk1a4Wu
 OAorUHnjxn/sqNBIMbqlx48TGnYOJ00nVPP4d1QPJB/D8dlOeS5T96U+NsYpf1ev3xNc
 b0kuoKBS5ASanWsP1M6dLjvoeig4+tMc0yQVj6TUpE1mtqndnYPU8H/onWG7MMVFubVZ
 fSZQ==
X-Gm-Message-State: AOJu0Yz5TUdyeKx+5OtOtOEKVqo5IXKzO1Colfnt9GPUKON0A9aYoYcc
 HSRVLkXXmrsRphGpBklZG5mm9x6+06qU8ryyWGvD1WdhWw2+zU8n4+w8ALZItUQ=
X-Google-Smtp-Source: AGHT+IFmxkge9TvYFpqnEfvXX9Y9KLrn1liE+z36pDanahN2YAr8RHL2AULBs5thbqoPA2TWUquucA==
X-Received: by 2002:a0d:cc81:0:b0:5ff:5355:6513 with SMTP id
 o123-20020a0dcc81000000b005ff53556513mr470653ywd.16.1705568207745; 
 Thu, 18 Jan 2024 00:56:47 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 d193-20020a814fca000000b005ff86af15desm337139ywb.90.2024.01.18.00.56.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 00:56:47 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc227feab99so2586108276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 00:56:47 -0800 (PST)
X-Received: by 2002:a25:86c5:0:b0:dc2:42fc:135d with SMTP id
 y5-20020a2586c5000000b00dc242fc135dmr352561ybm.62.1705568206842; Thu, 18 Jan
 2024 00:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-20-jirislaby@kernel.org>
In-Reply-To: <20240118075756.10541-20-jirislaby@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Jan 2024 09:56:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5P9v9ofeeMA9M+kbHv2fSikChZCS3=tbaAZmG8dwF6A@mail.gmail.com>
Message-ID: <CAMuHMdU5P9v9ofeeMA9M+kbHv2fSikChZCS3=tbaAZmG8dwF6A@mail.gmail.com>
Subject: Re: [PATCH 19/45] tty: vt: make init parameter of consw::con_init() a
 bool
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-serial@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiri,

On Thu, Jan 18, 2024 at 9:03=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kernel=
.org> wrote:
> The 'init' parameter of consw::con_init() is true for the first call of
> the hook on a particular console. So make the parameter a bool.
>
> And document the hook.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Thanks for your patch!

> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -367,7 +367,7 @@ static const char *vgacon_startup(void)
>         return display_desc;
>  }
>
> -static void vgacon_init(struct vc_data *c, int init)
> +static void vgacon_init(struct vc_data *c, bool init)
>  {
>         struct uni_pagedict *p;
>

Below, there is one more line to update:

    -        /* set dimensions manually if init !=3D 0 since vc_resize()
will fail */
    +        /* set dimensions manually if init is true since
vc_resize() will fail */

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
