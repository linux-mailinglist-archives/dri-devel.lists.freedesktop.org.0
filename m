Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B965C3C9DF
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4467A10E96E;
	Thu,  6 Nov 2025 16:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QkzvN7T0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F58510E966
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:56:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-640bd9039fbso2048291a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 08:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762448178; x=1763052978;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1d33Qfkr/UySDlVInSW41vMX+/10XV70RYaxgiV9H4=;
 b=QkzvN7T0i6Akr3G6dOi+8O/jQNvMo2mREOK34EoKRxskozp7XPhbqkHuZMedohNzE0
 tTvH3WlgOqnDnwsiW1NeTm3Km1W/+1+Qq8LWBQYoqEREWhY6Zr+NAio6wss56VLx1VUN
 uNmTPjhF2omLA8L9TvQIBvf8WHfw7kLUfgOj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762448178; x=1763052978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y1d33Qfkr/UySDlVInSW41vMX+/10XV70RYaxgiV9H4=;
 b=G2GpGSm1A+p2+sVr/lWn7a+8mq86ci0Qe+F43N18q9xVnMS714kwJUz/c+j1b59zvv
 1wz41fLA8nuzpbRkgoGSUXwjs2T8WVE19HaHIdNnDU6/hQ8olaRwBRDRFrKuCjJDC+Me
 P9IkLdpsc2qN0TUkuYEjddbiYCKZGQpJ46GZv2cWIpe4exUTsG6UpkgLmYURk2lVEkMm
 DBsyhg3HOylKHpOh6uckD6weRXqE1SW9UoHZywQLZtMOO6e+8uwZAI7ldtE7KS0SQ/LJ
 xouAwzPBjVSp/K5HT+WJly5Bv2HBm1cXDMi+/+he56jtZXxEPJm0Ey4/3xpbJudNC8AM
 XShQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs5zfLquXFfAkUJ+OXz6z4/d3xnv4Vuv02X2fyL7yUwPMmnw2ScDV/OwveR9uCN3NhdSQ347eu17E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQy9bOtvAZsJ+tyfGoF73AI4783KNWlW2UFdT3hDV3ie4NCL2P
 uqq7cL1LpErP/IdGp51rrRkNkwMcJtsludNKgp9Ye0gJIA+GLANXSRtaNO3AXF0V5GQvAeJVHG8
 Yfjs=
X-Gm-Gg: ASbGncvcNsXDWW1K4L9gAgl2c4rn9tF4OSHdmAm8Ss/JC0pMR6/4EIglFSHjs7bq3Xj
 Le+OQviHlEgd+O/2oO8ktzuZmWIPhQm3TU52bvePCw4mQF9IdiX47sGxDP3cBjLqLj5SX4L1Gnm
 ZMCKynIuyAEGWD4qiRRg41eZ14oqL7ipSQ272kqTrcc+tueZ7lbwSQE/dwpEDphlCHdi+gySqCL
 4FhjSMDqq6mvhezTuJ+6EgY2FDUaknYLfSED5CMDil6V5xjAa1kgysZ2bh2CrXGl5IJS8EG5uXL
 W6D4JwgV3FKPE4DZW5nKL/PWQYjewm2DblKw/6kmIBnNLixQSUgZ15UWFf7CeosMHFpixsZS/Qw
 LkwOoyJj3c/NBTcHZ5bL4FLK4jORMhYaOM2CbWOfv0/usQ52uZ/VjWI8dro+ysUI5s5ca9CLdPe
 brzPLqlBuKjbTHH4aKoD1HDrKYK/1AuQUN2kLZwTjdl/nppQGfpg==
X-Google-Smtp-Source: AGHT+IEuEFvMyAygIde9XFTZfOd5DQJJxWysDFeEatShsMjbvIDIhtXGT2QqTNv1gEgCxyHsLqMnNg==
X-Received: by 2002:a05:6402:210f:b0:640:9d56:50a7 with SMTP id
 4fb4d7f45d1cf-6413f070524mr40625a12.9.1762448177608; 
 Thu, 06 Nov 2025 08:56:17 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f8578dfsm2261066a12.24.2025.11.06.08.56.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 08:56:15 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-429b895458cso694347f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 08:56:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYjdUngBv2q24St8ZXAAA8X5sJy+lykXR1th7QdBuOVLUxGXPl/F9FXrnmAlB856xGJ90YDEU40+g=@lists.freedesktop.org
X-Received: by 2002:a5d:5887:0:b0:429:c505:99d0 with SMTP id
 ffacd0b85a97d-429e32e4484mr7115033f8f.25.1762448175160; Thu, 06 Nov 2025
 08:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20251101040043.3768848-1-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=XqgkgLLOeozooypbwiO-8j0ZNy_GJ1UD2sXL1EKzC=Fw@mail.gmail.com>
In-Reply-To: <CAD=FV=XqgkgLLOeozooypbwiO-8j0ZNy_GJ1UD2sXL1EKzC=Fw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Nov 2025 08:56:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UoiSAhHOs=HUoGU-kX_ARc_EJP5p7_Ozo7u5vcY33GSg@mail.gmail.com>
X-Gm-Features: AWmQ_bkJiA0NM5kHBq2AiPq1aBIwz3sEY3uTcdzu4ZMGksAVclFhXHwVsuamfP4
Message-ID: <CAD=FV=UoiSAhHOs=HUoGU-kX_ARc_EJP5p7_Ozo7u5vcY33GSg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com
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

Hi,

On Mon, Nov 3, 2025 at 8:38=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Oct 31, 2025 at 9:01=E2=80=AFPM Ajye Huang
> <ajye_huang@compal.corp-partner.google.com> wrote:
> >
> > The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
> > but it will happen display noise in some videos.
> > So, limit it to 6 bpc modes.
> >
> > Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> > ---
> > changes from v1->v2:
> > * Change EDID_QUIRK_FORCE_6BPC to BIT(EDID_QUIRK_FORCE_6BPC)
> >
> >  drivers/gpu/drm/drm_edid.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> There was some extra testing and summarization on the internal
> discussion about this problem that cleared up my confusion and I agree
> that this is the right fix. While the panel does properly link train
> at 8bpp and generally displays images OK, showing certain images on
> the screen displays consistent corruption on just this panel (other
> 8bpp panels are fine). It seems like there's some sort of subtle bug
> in the panel at 8bpp. Limiting it to 6bpp, which is what the panel was
> originally tested with, is the right thing to do.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
      commit: f23e40e378a0858da26e8d5a6f09f82ecd95e247
