Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4F6D6327
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8240E10E321;
	Tue,  4 Apr 2023 13:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4C510E326
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:37:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bi9so42397796lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5oq7n3GlIXktxJklhqgcT1TTB67yDatIC7dGkiiCuI=;
 b=Prch8UaAhqsRUguFgokYtu4ZlvLNEsRd6K2Vrw7uxkQNIVYPkjgyGrWCxpzsM2vQpJ
 F6VLAKorjbP6tZ0DSBo+2OwOxnVwxi8uAzX0gxmZ04S4FP2jRvT/TtQPzFGwQs/dz5F0
 dnJbBAAMfFw4ms2vK//LVrhGFCFIdUs3FxlHDt8YRbqTKEW+FPFVj6p4i2DaoS89k21T
 xImxjV9yck56veLlnNP3haMIplnf2T5ONU0cvwRoPtwQTmfti+stxI8BxYBp4KgeRtzM
 bRgEsI9QYrV/gHGCXJPcXo1vm3asVJJvyoaS9VP6NGSPRbjH6/tdKasKCqnCIEvPCrQQ
 7seg==
X-Gm-Message-State: AAQBX9eSDCx1/kL1yQebs6r1sxOqTuptJkr8lBNDVpUtNM/D5qIu5VKI
 SzzhwmvshRFdeNFDpkRCQvEl+KYNbIclpxbV
X-Google-Smtp-Source: AKy350bJIjywKQQkjlnr/IIne2vbTj/44ILFBOIRVVjwmqX7O1xlIbIpuK7oK4/athSdXxnt/nesSQ==
X-Received: by 2002:a05:6512:31c7:b0:4eb:4258:bf62 with SMTP id
 j7-20020a05651231c700b004eb4258bf62mr1630830lfe.8.1680615461479; 
 Tue, 04 Apr 2023 06:37:41 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 j25-20020ac25519000000b004dc2dae457asm2328881lfk.119.2023.04.04.06.37.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:37:40 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id bi9so42397607lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:37:40 -0700 (PDT)
X-Received: by 2002:ac2:5a01:0:b0:4db:266c:4337 with SMTP id
 q1-20020ac25a01000000b004db266c4337mr749742lfn.1.1680615459983; Tue, 04 Apr
 2023 06:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230403160314.1210533-1-robdclark@gmail.com>
In-Reply-To: <20230403160314.1210533-1-robdclark@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 15:37:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUph5ADYcC0EnEEMDjTLC5TQrTzRXmTDOOOZ0SAjxPV0Q@mail.gmail.com>
Message-ID: <CAMuHMdUph5ADYcC0EnEEMDjTLC5TQrTzRXmTDOOOZ0SAjxPV0Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vblank: Fix for drivers that do not
 drm_vblank_init()
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 3, 2023 at 6:07=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
> From: Rob Clark <robdclark@chromium.org>
>
> This should fix a crash that was reported on ast (and possibly other
> drivers which do not initialize vblank).
>
>    fbcon: Taking over console
>    Unable to handle kernel NULL pointer dereference at virtual address 00=
00000000000074

Thanks, this fixes a crash seen with the ssd130x DRM driver.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
