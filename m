Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA76DD510
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4188210E4DE;
	Tue, 11 Apr 2023 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24410E4DE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:20:14 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id z9so7176812ybs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681201213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOXdqLxEHLBZ7hy/2mM/9REbA1X5ZreSZtF+7etv6Sw=;
 b=6KSrM7wGNNFsRBXlr9CnTu6vm/od9jbEf/XTAJO/Mku84d6Zy3VhVrbEYHIMyTkpkA
 temuTzcHmSTTTWM8VH+3xwJANOamd1mnd85YpfKFUP5RUKqd5L5GXFa8Ze3xOw+KjacW
 GeRJER3ApQMq/ykcEi6vwaKUHznNPM/nDIf2D/CAx+NilxvL354qaQmPtTcvwq1hWtLH
 5drpsgfFgiEVFeEuPHkY58JCOMzllT1QVkRFvXSbqqePampyjVF48EZuGm2rtne4/YoK
 pvZPH17rPpKPlVFSjXqp+b79OB2ImFd3XPCtHyMb4IKv+svgAuaxTsiJvTf6+p8ur8OG
 9MFA==
X-Gm-Message-State: AAQBX9eZnCVpeDiqtplaG3Pz9mgmb43b4M65gEeONVIc3tUhg724LpKQ
 6SyXqFtDhYG8C1/on+/HfHrSJ+sbRcAm5A==
X-Google-Smtp-Source: AKy350bA7wIDOxqf/FqfVlh3uVsytt3DJX4qur2ViGliLoZJZPJZIJ6Jk4AeXawwUHXSZfSUMgXPPQ==
X-Received: by 2002:a25:c7c5:0:b0:b72:9470:2234 with SMTP id
 w188-20020a25c7c5000000b00b7294702234mr1315533ybe.46.1681201213506; 
 Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 a5-20020a056902144500b00b8ed4bee6absm2040605ybv.48.2023.04.11.01.20.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id a13so7227061ybl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
X-Received: by 2002:a25:d447:0:b0:b75:9519:dbcd with SMTP id
 m68-20020a25d447000000b00b759519dbcdmr960089ybf.12.1681201212819; Tue, 11 Apr
 2023 01:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-9-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-9-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] arch/m68k: Implement <asm/fb.h> with generic
 helpers
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, x86@kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, daniel.vetter@ffwll.ch, deller@gmx.de,
 linux-mips@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 gregkh@linuxfoundation.org, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> v2:
>         * provide empty fb_pgprotect() on non-MMU systems
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
