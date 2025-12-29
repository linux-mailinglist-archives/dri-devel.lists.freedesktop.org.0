Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3F4CE6295
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 08:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ADF10E349;
	Mon, 29 Dec 2025 07:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WxJHG8n0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059A10E349
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 07:41:38 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so1944784166b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766994097; x=1767598897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CA0M70EsX+ac4/joS2XDMeJK6N5Tfgg4wZNTxTHbv4=;
 b=WxJHG8n0O7iPa2I7QoDZsKt8I6RB4ZMfLuh8wBzRTZu9kTrrBv/Rf09yc1OYMP5nHc
 autZOCmgdMaij+eIyZJbNAc2v4ICEgtqG+bo4U1X8loUdmNwTIrTSunrePixi7sLhgf7
 ywr6sKoWV5Wvnl12Z/nnElvg9YB6AVH/XS3ulD3I9u3i132z+v+i4TiGTvsoRyMaLyhZ
 S4D/cUQILha5mlKFh6bHPFz0fAeYBccU2l29f5yDAEja0ZLqIgwTwFvZhGrotWA78tbT
 AKiX5M0d2jAMyJXL0gq8RQ+rtbkcI9HJDO3FFzmUALfy+C57CuXlFP9njsdsNCnoCOiP
 PRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766994097; x=1767598897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7CA0M70EsX+ac4/joS2XDMeJK6N5Tfgg4wZNTxTHbv4=;
 b=ETiksPCLh14qJwhCmLzBBFmQhFoXDEX4PR2AlzgKRWD9HVl31aK/efvxycUUc0+01H
 ysPMvXawVuU5Up8fLAQo3Q7deg1kod8S6nSEqClABgIptKHcK5q8vHOLgXz+6AInJf7c
 JAFEs9CJ0Ng3KPSC3hqEEkXi0SvyvnyUJ/cHRHafMizKV5J6hS/3tywXjPD4cDtkbEBn
 sGkz1ZKUpjhuH9bRrLDOUye/3SG8SBxJlURdggQVL4GSxwxN7+IuF2mz730SQMd9lqiK
 z8uQHn40YA3C33AMQ2cDKhGNLq0p2CfCFTILqrtXGf7j11FO3vM4mW+ajLO94wTYkVUW
 Nuvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZj2riZpnlZnsX+Jro2G5F3tO44Y+wQEMTFy1UQ9znbsbXFJWMKLS9ls4KJ74Q7QkdeqeWLQJMuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv5aPj6HR3Y/Oktv+LxNMzoU8HXhgxsFp887T6X/A0l2OyqSF8
 eA2wVHDzLPj9XfANGxeOI9dv9TDN7/86VOedNRM4xHpd8Irk1/ysvsn6SFTzMeNZxCC6QqkyhgL
 i9A5hAmpi942CM4949Ii9+h47zV7hwMI=
X-Gm-Gg: AY/fxX7Df8kg0UTd7XNGQt3y4SCYylCcO+Opz5mQLE5JokuT1o1Xe9rfQ0BRlktR8IO
 8BFEtxbq/qrKftcvxQsf9Q7bSRovWAXTjo0gEbFapnBDhwBrNJf0uuWQve7wPv2g/2TpOMbmWhF
 +YdIWIYozMW/pk+0pef5wW4oalX6CG2lClXJzYdmYQWSYT46KCC0orKsX0JMGvSCnZlOc75oMIj
 /UO2YI9hIeutYfzgP9b7KJJw5Cj50AJBTL+5xyKnaqR8c0rcU3PXD+Z6PskJRyUKAiAgCRsq79h
 /sXavwnnbtBUqOEEF0B9nvxxUFmEOdbFgr4ri5OhNxeVX6JL7CVWFn0vnFPqXcU72fsZZvXymR1
 wzvNPmZU=
X-Google-Smtp-Source: AGHT+IFsiw3jWtdQEDQH/mXP+tcbghOYcPeWqAbdVDVv7o7/abPtivB78goQWZ0idTFYi+CcJ/7gCrJl+TRRu/MiPwo=
X-Received: by 2002:a17:907:9809:b0:b71:ea7c:e4ff with SMTP id
 a640c23a62f3a-b8036ec9e3emr2773470266b.6.1766994096979; Sun, 28 Dec 2025
 23:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20251229010814.94255-1-spxxky.dev@gmail.com>
In-Reply-To: <20251229010814.94255-1-spxxky.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Dec 2025 09:41:00 +0200
X-Gm-Features: AQt7F2r1dDWzOTpFWamMt3UW53SPeTfq7dsNRjTugzb_U_DAnDoUbownyn-BlB8
Message-ID: <CAHp75Vc9fnuMb3s-KtX5r+nmOH5BztP=d+h9FXpn2i34sCv2-Q@mail.gmail.com>
Subject: Re: [PATCH] Replace udelay() with usleep_range() in PLL
 initialization code. According to Documentation/timers/timers-howto.rst,
 usleep_range() is preferred for delays "10us - 20ms"
To: Alexandru Costin <spxxky.dev@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
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

On Mon, Dec 29, 2025 at 3:09=E2=80=AFAM Alexandru Costin <spxxky.dev@gmail.=
com> wrote:
>
> Resolves checkpatch warnings:
>   WARNING: usleep_range is preferred over udelay

First of all, fix checkpatch to point to a newer API, i.e. fsleep().

...

> @@ -210,7 +210,8 @@ static void write_reg8_bus8(struct fbtft_par *par, in=
t len, ...)

> -       udelay(100);
> +       usleep_range(100, 120);

> @@ -231,7 +232,7 @@ static void write_reg8_bus8(struct fbtft_par *par, in=
t len, ...)

> -       udelay(100);
> +       usleep_range(100, 120);

This is an IO function for the hardware in question. Have you tested
it? How do you know that this is a non-atomic context?

--=20
With Best Regards,
Andy Shevchenko
