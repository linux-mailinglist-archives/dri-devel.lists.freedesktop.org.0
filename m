Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B67F751DE9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A5F10E661;
	Thu, 13 Jul 2023 09:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA5510E661
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:56:44 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-cabf1dbafc4so473417276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689242203; x=1691834203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ky38aRztiJlAI5tJIApUzXIrtiO5iJsH9sjAfnvxdr8=;
 b=IL0e0iippAWGIW3uUk9vQ73xtKp5pvVLYCy8iQXjS++9gCI+KrQRDEsYW6PdwYOEkl
 0AQAde8jzhJDBvLZdtLLJtZHzMmdNaXtgKNr7bDMQXV6ZIdteIUcBsjhYtuK21IDOU7f
 2irELYsqNNe2CoOpGt56WD6dhj0N7pnDo6mOWXo91OsnSxtsMQEnagijoWwcK7Si5voE
 I5avaP74gBaQGsC20Re045ZxNt0ZQjJE5NrXItTbyX6bWe30N6rzTxSqmDGr+RHfgFx5
 aQ1U6rlEBoeOCP5LFqzzaTxckk8jRJbXaFfV9ItB+57Pi5qiWaz6AKl0Cpj91L4l1Jev
 yWvA==
X-Gm-Message-State: ABy/qLYNFzdOYQ1NEpsbjlDXNJKn1kFLYsmcJDW0IIx8bwfO2yriVvkv
 kgsxw5IwbXaNSlyQJkfNN1ksfb0Qpv4uCR1p
X-Google-Smtp-Source: APBJJlF7jW7w4jyLC3TjMkYabaBLsgbEVDod65CDXZr6t+1aYmhz7DnGfHzWUt+b8yg7jT245pOciQ==
X-Received: by 2002:a25:3253:0:b0:bc9:92c9:7fd1 with SMTP id
 y80-20020a253253000000b00bc992c97fd1mr983787yby.3.1689242203192; 
 Thu, 13 Jul 2023 02:56:43 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 k16-20020a25fe10000000b00c74e24a68e8sm1289876ybe.55.2023.07.13.02.56.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 02:56:42 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-577637de4beso4377267b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:56:42 -0700 (PDT)
X-Received: by 2002:a0d:eb14:0:b0:56c:f8f1:eed5 with SMTP id
 u20-20020a0deb14000000b0056cf8f1eed5mr1235965ywe.6.1689242202613; Thu, 13 Jul
 2023 02:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230713085859.907127-1-javierm@redhat.com>
In-Reply-To: <20230713085859.907127-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2023 11:56:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWfeX9EESbiSnJ-G-TuyFKt7ZnMKi2Y85HRG2695siTg@mail.gmail.com>
Message-ID: <CAMuHMdXWfeX9EESbiSnJ-G-TuyFKt7ZnMKi2Y85HRG2695siTg@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Change pixel format used to compute the
 buffer size
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 10:59=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The commit e254b584dbc0 ("drm/ssd130x: Remove hardcoded bits-per-pixel in
> ssd130x_buf_alloc()") used a pixel format info instead of a hardcoded bpp
> to calculate the size of the buffer allocated to store the native pixels.
>
> But that wrongly used the DRM_FORMAT_C1 fourcc pixel format, which is for
> color-indexed frame buffer formats. While the ssd103x controllers don't
> support different single-channel colors nor a Color Lookup Table (CLUT).
>
> Both formats use eight pixels/byte, so in practice there is no functional
> changes in this patch. But still the correct pixel format should be used.
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
