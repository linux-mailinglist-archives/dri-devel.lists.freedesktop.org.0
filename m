Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28F57C4C81
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63F510E2D6;
	Wed, 11 Oct 2023 08:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783AB10E249
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:00:08 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5a7e5dc8573so2427457b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697011207; x=1697616007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJXeUKTthXt8M2vbMgjrZC204wLHYXruTCm+pLMNj8I=;
 b=PCFPRCvxTjD3Z2pbotgTJ72v2LC+r7SAyTxgwwMApZJ561ix0RAXiOO+sM7+n2l0gZ
 NvAvxqWBgMVRBzUSuuJVOovITiE8gVztRbLX3TyTXgCSYn8dSzcQaCw3bTsBGVR+PlDa
 b13PTiJiG318eaXI7mz+2jN++QDWQoOPWQ2uegzMNdEydDTmaAQQJiQjsOM6/oK2s7F6
 LWi3YHDdDzGHgPE3ZRJHvLH3L5K4pOv/Yw1PWGuq4VaZPmEV1WB3EYvH2ahupF2HENaz
 Km+/Us1AbJbeO6cut0V6nAoFBaypiyDaG75OBQsgCmd14K0Cr7Pr0oP99xqaUCQCeepE
 5lfA==
X-Gm-Message-State: AOJu0Yw8wzelsEk6/Gj9zvECXACbuS0cpOlKVa2NWb8i9fFYpE5r4KFK
 /gVn1pJkWgKxgFurEOq7eBxXfSGj9mNN4g==
X-Google-Smtp-Source: AGHT+IGUvPazm3yp3bvObOMCVIwAmjQDE3lP/ilMxE45jQvlhGRRID2VaDF6BepTTsNAL8RfmSI3jQ==
X-Received: by 2002:a81:4a87:0:b0:59f:519e:3e9a with SMTP id
 x129-20020a814a87000000b0059f519e3e9amr19990729ywa.20.1697011207342; 
 Wed, 11 Oct 2023 01:00:07 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 w130-20020a814988000000b0059c0629d59csm5074480ywa.115.2023.10.11.01.00.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 01:00:07 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5a7a77e736dso29508127b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:00:07 -0700 (PDT)
X-Received: by 2002:a81:5bd5:0:b0:589:f9f0:2e8c with SMTP id
 p204-20020a815bd5000000b00589f9f02e8cmr20463475ywb.48.1697011207007; Wed, 11
 Oct 2023 01:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-5-javierm@redhat.com>
In-Reply-To: <20231009183522.543918-5-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2023 09:59:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmzUx6iOhSSfNz4NyMZ0vY6Md6cn86S0BjOjhzzPuO=g@mail.gmail.com>
Message-ID: <CAMuHMdWmzUx6iOhSSfNz4NyMZ0vY6Md6cn86S0BjOjhzzPuO=g@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/ssd13xx: Use drm_format_info_min_pitch() to
 calculate the dest_pitch
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Don't assume bpp of 1 and instead compute the destination pitch using the
> intermediate buffer pixel format info when doing a format conversion.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/solomon/ssd13xx.c
> +++ b/drivers/gpu/drm/solomon/ssd13xx.c
> @@ -148,6 +148,8 @@ struct ssd13xx_plane_state {
>         struct drm_shadow_plane_state base;
>         /* Intermediate buffer to convert pixels from XRGB8888 to HW form=
at */
>         u8 *buffer;
> +       /* Pixel format info for the intermediate buffer */
> +       const struct drm_format_info *fi;

This is really intermediate, as it is removed again in the next patch :-)

In fact 60% of this patch is changed again in the next patch.
So perhaps combine this with the next patch?

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
