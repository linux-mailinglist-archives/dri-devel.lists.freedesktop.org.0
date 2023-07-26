Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936C763697
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C2510E473;
	Wed, 26 Jul 2023 12:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2420910E473
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:44:25 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-58419517920so27717227b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690375464; x=1690980264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BtIDsZqYigjrBkutXnBexqF8pwlusTK64WVbpCDs+BA=;
 b=HVhaXG8famjRCqrJ0UtfJcPkQrF80+r2mWOkkpQ11tk7jCoGNi15vfuCA//iidsgzV
 GZjBhCKDhKnId5BVab/6SygXhpU/ZYS+CpsTbqugSVflqaMB/ozA5qwCnYcY9LNUaG/0
 3jspykFtibtvlPl6Fpk4pYLFdvB8FbeTEw5DehYR1Fu8tdbuScBRCoUpLz1E3DrXx96F
 GIYV//ExsRCf6MaR5Jo9fUuPgcbOQjoui6VpVhdp1MFt7Cvkv++wHExP5fQ0swBPEsvv
 EYbkznyTICFh4zSI9I5SMZfGC+9W5+JkUkuoKisR6RpZ3DsJDtYHyG0KH0rsBsrucM/5
 zfdA==
X-Gm-Message-State: ABy/qLYQi1CipTaHUMW5eKxmNeX6dZiFKuLi+dxDzStwx3zS5dhNAW6o
 SwHNuhGjraLmTneJOQePcE4Zv/KhLWxICg==
X-Google-Smtp-Source: APBJJlH5RnvI+eRUd1KHOw2Z/BwUrnJ+znOQ42DoGj47cayry60uo6JLsmGU96sBDAqdktZX8k4usQ==
X-Received: by 2002:a81:4fd6:0:b0:577:3cd0:384 with SMTP id
 d205-20020a814fd6000000b005773cd00384mr1820807ywb.15.1690375464028; 
 Wed, 26 Jul 2023 05:44:24 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 t7-20020a815f07000000b0057a05834754sm4148640ywb.75.2023.07.26.05.44.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 05:44:22 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d1c988afebfso876182276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:44:22 -0700 (PDT)
X-Received: by 2002:a25:804f:0:b0:cb4:469e:3308 with SMTP id
 a15-20020a25804f000000b00cb4469e3308mr1498688ybn.6.1690375462709; Wed, 26 Jul
 2023 05:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230726105433.389740-1-javierm@redhat.com>
In-Reply-To: <20230726105433.389740-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jul 2023 14:44:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbOJ5_iEcV=G9ogZJ36T2qj8=tnutXcVZ=Sn-0=dqGug@mail.gmail.com>
Message-ID: <CAMuHMdUbOJ5_iEcV=G9ogZJ36T2qj8=tnutXcVZ=Sn-0=dqGug@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/ssd130x: Inline the ssd130x_buf_{alloc, free}()
 function helpers
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 12:55=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> There is only a single caller for both helper functions and these don't d=
o
> much other than allocate and free two buffers, so let's just inline them.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
