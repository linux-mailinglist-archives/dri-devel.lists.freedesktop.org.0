Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7F868562
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 02:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6895E10EF65;
	Tue, 27 Feb 2024 01:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nqtHga9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C410EF65
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 01:00:30 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a3e7f7b3d95so415365866b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708995626; x=1709600426;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xlhrIQ+W/f+848er0yzcAblrCEsNA61Nvlr2TS/B7n4=;
 b=nqtHga9aP2/r91y2tVZEU1mWDd5aaFuaIhfs31crfumIxUpM5LstIlGGZfHe/kU7c0
 Vc4LC+gl1ybxEeIY4WQtUQ4iKHjmordkaXqNcijomBK4ddtHKYvIRyku8x9otmn/9o/m
 A+zkB/LZIf+g8WQRSLspkYoEIODXlaT3nftMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708995626; x=1709600426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xlhrIQ+W/f+848er0yzcAblrCEsNA61Nvlr2TS/B7n4=;
 b=pvyOeTXDdmzqQDP8wk1gHt6AHudd2xBXWNSLrn8LFvIr35Xu9t1UIou7u8bzbcQRMh
 Hg4mUU4s1bruR2lLOanu34Ty6X2Yu1EY+g1C6Mk04GXqLIZbDF1N8/ohSEs00cwVjI/H
 ZRrYOm2jM3iiH+DSoSNIk+FqA5jydhf2tKfWr55Vpm+e9DuJ9ytBqGp7ud0KEpWOacmf
 OKyzlCSIqelxW7eVk1JMpxGPHZVtHlLd38I9tj5KSAWamyg/6POaVFUPoI1Y+HT77Pig
 MagNt8jkYQgZ1id2X3gi1mFRY4tF654XxowLD4Xro7rWD1pH7erCrLIRqcj0kJ2A7Z5u
 OP4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0BDbkA9lCkF98y9vBJQ+R0dXNJwA202KTjlqEOLg1z51Uyc0d8bHl0L/DtfhtXGkJicSxhfDCXF/B+vrmuaNG5fImPaaFtNWokcMVmDUM
X-Gm-Message-State: AOJu0Yy4WB6dyj/OEewaM3a4yFsKiG3oca+1K8ltTHeXr/RFPqSlVNAq
 5ldBzb4YQ+d6lP+oo8oCbYuvwO+BNxEqusWbgWjcgewr1Zu4u9A7WCHpWFVKulh/3qcTEsGP++j
 VqOXh
X-Google-Smtp-Source: AGHT+IE3tNlscUrBN2DCT2FrnTZLW7wCfHHKYBMm/Of38wvoAp8P3oA+dtiYhohk/g2qZfCsQOu12g==
X-Received: by 2002:a17:906:c7d4:b0:a43:20ae:9123 with SMTP id
 dc20-20020a170906c7d400b00a4320ae9123mr4162744ejb.50.1708995626414; 
 Mon, 26 Feb 2024 17:00:26 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 i25-20020a1709063c5900b00a3f596aaf9dsm247359ejg.26.2024.02.26.17.00.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 17:00:25 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-565223fd7d9so2511a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:00:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/36KCaiZj78AJwNXbRm2F6apIVPRCnz8zYKnOriVPPfGhbrPJidCATItXFVc9DhfwEF0rZ0cCHI4dXtGc05m4QUASnYx7l2CZHS4BS2Et
X-Received: by 2002:a50:d650:0:b0:566:1390:6329 with SMTP id
 c16-20020a50d650000000b0056613906329mr59190edj.1.1708995625011; Mon, 26 Feb
 2024 17:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
In-Reply-To: <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 17:00:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WjZZfHBdMVG3R_iT9bskP3AyHrRsSK6Hfw9h4tEZBHFg@mail.gmail.com>
Message-ID: <CAD=FV=WjZZfHBdMVG3R_iT9bskP3AyHrRsSK6Hfw9h4tEZBHFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Match panel hash for overridden mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Feb 26, 2024 at 4:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 24 Feb 2024 at 00:40, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Ad=
d
> > auo_b116xa3_mode""). It's found that 2 different AUO panels use the sam=
e
> > product id. One of them requires an overridden mode, while the other sh=
ould
> > use the mode directly from edid.
> >
> > Since product id match is no longer sufficient, EDP_PANEL_ENTRY2 is ext=
ended
> > to check the crc hash of the entire edid base block.
>
> Do you have these EDIDs posted somewhere? Can we use something less
> cryptic than hash for matching the panel, e.g. strings from Monitor
> Descriptors?

We could try it if need be. I guess I'm worried that if panel vendors
ended up re-using the panel ID for two different panels that they
might also re-use the name field too. Hashing the majority of the
descriptor's base block makes us more likely not to mix two panels up.
In general it feels like the goal is that if there is any doubt that
we shouldn't override the mode and including more fields in the hash
works towards that goal.

I guess one thing that might help would be to make it a policy that
any time a panel is added to this list that a full EDID is included in
the commit message. That would mean that if we ever needed to change
things we could. What do you think?

That being said, if everyone thinks that the "name" field is enough,
we could do it. I think that in the one case that we ran into it would
have been enough...

-Doug
