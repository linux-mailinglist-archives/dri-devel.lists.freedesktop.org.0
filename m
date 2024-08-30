Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA24965CEF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EE910EA2D;
	Fri, 30 Aug 2024 09:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24F10EA26;
 Fri, 30 Aug 2024 09:32:23 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6cdae28014dso13269467b3.1; 
 Fri, 30 Aug 2024 02:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725010342; x=1725615142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imgxU4L4plsaBKuyDZ4ep2KNsaM/vp5qwWwnJwPwFlI=;
 b=gLPFR45Wq7Mp/X24mr/hC6114tsOGkjdTeOHyLWkek1sVFE2HvClNezZMKvUYx3WxL
 wqBJi0LOkrWNAz/dg1DBoWthnbWH3fw5Endtlf+tkkIS44GHXOVkqJlBoWE7RIeiJXzk
 JeSuDuccuov1jViifS0aDeIwdTjBNLNNdfHlP2A57NbIES8ePHWZwXtX/143W6nXvJN6
 CotEwOZzVJ65Mv5Nv3j/VWhJS6z5KoC6UBfVwNP0k5OPg6FfO84dzNYDOuCOOg4Qazuw
 fnT2NKWY9U0vbeEi/XtOw+7Z4KmiA5aJJTZQVmXXGYPDy3AvuCPYJhdwP8Oahsb+yLoS
 iwUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6AZj7l9JCotS+mBPN/sRbcqKhaNG7/UxJiggyg3GokGFbFOB8r9dfcxxh/iYMkcaqExa/D9oK@lists.freedesktop.org,
 AJvYcCUC3EgByBhTJZ2fUlGeZjgIDlDoOonVXQMCdEKb4Nf6Why9a1MGFCFVqeddr+X3ebBoPvzhOOg3T/k=@lists.freedesktop.org,
 AJvYcCVEA519tq/mZadl9jj+rJ7iiLN3xvCNVRdEOIWjMb1l2h7y/AW14odRhWYpAUylDjPna7AKE/lwigWg@lists.freedesktop.org,
 AJvYcCVWiUfSes7ikIfFxZj/JS7KsC5woC+MbbSr9zi6BQVaWkxmdEBMvq3/wy95Ql7Lm3ZtULKPpk7oYMBd@lists.freedesktop.org,
 AJvYcCVykGZem4Krdl1isnqu2pzGzrcHnvP/44s90b6ezvR+Rc6AJE1erDPFnqGE3RFYPf90l7BrM53iKw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVJY0kQDEsbcabC4vka8MJJavH/GBdZNhCu2R81a3n6KMMKpKE
 XA634TDpDjfPFLyj6Jv4pY1jgkZ1u3hzhjAvUVP5t2B8GEUrJE7qkSy6I/d0
X-Google-Smtp-Source: AGHT+IHohzc96UO0uZxouFSNhd5eE7y0Vn9MKDyBhB6QmeM+ANwUHtYjtXDZBWkPhKbEChtjTYb8YQ==
X-Received: by 2002:a05:690c:6a03:b0:622:c892:6ae7 with SMTP id
 00721157ae682-6d285c15418mr46016007b3.12.1725010341960; 
 Fri, 30 Aug 2024 02:32:21 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6d2d3abe246sm5668037b3.1.2024.08.30.02.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 02:32:21 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6b3afc6cd01so21079687b3.1; 
 Fri, 30 Aug 2024 02:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVD2ca9h3Uctx871el7/YN+O6Jc6k234aUMc9OvWs5x+zI6zfIH7955gFw8eUahvcDNBA4kJ9f+jg==@lists.freedesktop.org,
 AJvYcCVbPZP17Q1ryKpmPUpgVknRm6Q48U0T5/RpQTeFFkOXjG8Q4alxyhtehYWfwEG0efE5toltgpH4hV0=@lists.freedesktop.org,
 AJvYcCWVQCNWr4kLN7GUN1yfecby0K+a460eVyBcd14H91uHBn5STDlWitOShT0upDh0eF4E9BNTqkAyuAcA@lists.freedesktop.org,
 AJvYcCX2/hblPf4FjccV/65JsF1FWAAd2qbbg18zhBVU9ouly9VWSd1tWqOInpWLaIR71ngrugHxtQku@lists.freedesktop.org,
 AJvYcCX3ENGsQeVnkl6Hp7+0QtmSU715oFsxoYxzIuYCCj6FDmcbYmwxaM622evNtdKWhOjw4wpd0sn/JjFA@lists.freedesktop.org
X-Received: by 2002:a05:690c:3704:b0:61a:e979:427e with SMTP id
 00721157ae682-6d285c0e968mr48290357b3.11.1725010341431; Fri, 30 Aug 2024
 02:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-37-tzimmermann@suse.de>
In-Reply-To: <20240830084456.77630-37-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 11:32:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5cgqOH-X6CZPykPCjKCTg0uVqWQjHozb0Xqy7h5yiBg@mail.gmail.com>
Message-ID: <CAMuHMdX5cgqOH-X6CZPykPCjKCTg0uVqWQjHozb0Xqy7h5yiBg@mail.gmail.com>
Subject: Re: [PATCH v3 36/81] drm/renesas/shmobile: Run DRM default client
 setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Fri, Aug 30, 2024 at 10:45=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
