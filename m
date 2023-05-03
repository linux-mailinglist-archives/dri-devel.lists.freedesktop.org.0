Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0DB6F554A
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 11:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418B710E24F;
	Wed,  3 May 2023 09:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEBE10E234
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 09:51:24 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-559f1819c5dso59922287b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 02:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107483; x=1685699483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkwA2SG4jNMgczQ03V/PwVcxgOK6BA7kr8exPJlpnkE=;
 b=GH8E8ZqojuqnFEEy+pg+aczFW8j7ZH60WX3f0J8yxmLrm/bxDupnnwNqTCqbT+DA9a
 96g4/KQwgu9A/AXM6NJJw4+u8kr+tnrXRRoe3Fw3bcnRcVNxr5CLWZzIVdnD7lqBDn31
 2jfaapUvB40/Ih1MzaMQfKO26EI3OesBbXB8Mm4BFZAjQt/01FrBhyoCKRAxXKgWZfSG
 GNw5GgzTk8D/Ld8AfYDpzV5bH0pTUxcRG/o3QmeJdchOWKft3f/FRcPBn6jzYH4OZtMq
 51ENPFNH1/QczUxxVPdOzXZM+0+LOQVDANNqvKq+GTM63QRtdQuyGlgYZFB8ordhHAtW
 JnsQ==
X-Gm-Message-State: AC+VfDzrlSHFYx1smW4JCAKictg3oOzsgBpA0MwVmm9o/i/QKoVx7R//
 3syZy5hWwU4FY9HK/JU2sfIx6X9xvuX+PA==
X-Google-Smtp-Source: ACHHUZ4XLxuAFI5Jj3lnAKq7tUS2yHCbiuscoKzJSx4rSjSWImzz0xBOQpz9H6yJjftHI5COYWYZxg==
X-Received: by 2002:a81:9254:0:b0:55b:497e:d72a with SMTP id
 j81-20020a819254000000b0055b497ed72amr2155124ywg.35.1683107483279; 
 Wed, 03 May 2023 02:51:23 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 x128-20020a818786000000b00545a08184bdsm7083269ywf.77.2023.05.03.02.51.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:51:22 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-b9e66ce80acso2697315276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 02:51:22 -0700 (PDT)
X-Received: by 2002:a25:4c84:0:b0:b9e:5006:42af with SMTP id
 z126-20020a254c84000000b00b9e500642afmr5825920yba.58.1683107482458; Wed, 03
 May 2023 02:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-18-tzimmermann@suse.de>
In-Reply-To: <20230428122452.4856-18-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 11:51:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
Message-ID: <CAMuHMdUgsUsNaCvSA+jUNrOvZU3O2xF0b=MnA_GyL-HvAeZy5Q@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 2:26=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Push the test for info->screen_base from fb_read() and fb_write() into
> the implementations of struct fb_ops.{fb_read,fb_write}. In cases where
> the driver operates on info->screen_buffer, test this field instead.
>
> While bothi fields, screen_base and screen_buffer, are stored in the

both

> same location, they refer to different address spaces. For correctness,
> we want to test each field in exactly the code that uses it.

Not a direct comment for this patch: and later the union can be split
in two separate fields, to protect against misuse?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
