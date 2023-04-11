Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53B6DD4CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A70B10E4DB;
	Tue, 11 Apr 2023 08:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792C210E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:10:20 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5491fa028adso467559267b3.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681200619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BKyKsR4WjWkIQ4662w2UQ58EahuI+KkHYModkQblq2M=;
 b=VgvqbpXbEA550Vv2QG8xLVtbehEh1MDmEkF2Nl389JMkGk3Bmyd/sd87iZaW371RYG
 XrQqHUKAR6vkCHKZR0t86wuM22r21b88rzbFMJ/IFIPS6BqyQwuC1R58eLg6ZppjiPbp
 Wb9aBKdLzCNtAPKewbX5FConDUVcnWs+fJTWTEkYPJgCwTmMwSMFMyVJ1gvgviUSCLvu
 k0o78fXpqYnszDW4bKt8q4bReo1buJSdPJ9PBT8IBxSFSjOCeDZqLtBmtwwNEXCSdM4Y
 3sUNvTn4cRCS5EpQYh1jJKkCK8KbE7XbrxZR3P4WFdngEASAyXBIoOaZqMQp+B/GsoOT
 2beA==
X-Gm-Message-State: AAQBX9cS5JHOyWKQqN36nvZJidMJ5Elzdykpuk9ikd1F7mLCVhOzfdqC
 mQQ9T0rbsT+V2XL6iykgV/K6qI/ckOIZLA==
X-Google-Smtp-Source: AKy350bFz85jv0w3LRsawKsnOHOhUKRaJB5ZqZmN5ePISlHLtMtuAWMgBUbHYNbv4mODgtIc81vIhg==
X-Received: by 2002:a0d:cc93:0:b0:54d:38c8:403e with SMTP id
 o141-20020a0dcc93000000b0054d38c8403emr6492188ywd.50.1681200619450; 
 Tue, 11 Apr 2023 01:10:19 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 u19-20020a0deb13000000b0054c14c91ec9sm3288774ywe.33.2023.04.11.01.10.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-54ee0b73e08so146731857b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 01:10:16 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1216128ywi.4.1681200616792; Tue, 11 Apr
 2023 01:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-8-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-8-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:10:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] arch/m68k: Merge variants of fb_pgprotect() into
 single function
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
> Merge all variants of fb_pgprotect() into a single function body.
> There are two different cases for MMU systems. For non-MMU systems,
> the function body will be empty. No functional changes, but this
> will help with the switch to <asm-generic/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
