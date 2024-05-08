Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E988C061B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 23:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EC01129CC;
	Wed,  8 May 2024 21:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YzjWdeHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383ED1129CC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 21:14:43 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43df14d8a27so739041cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715202881; x=1715807681;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buSNW1rXJ5tp0mHF2b1c12zxGyNSJnH+cWUgnRIBSqA=;
 b=YzjWdeHarJsY1pHqmkkyjs74n9dBmVqy2e/lvQyw4WL5qS9iyRtsJ5CjoArjNtBqXL
 njGXfCt2phHxx7saOUgOxaPK6HfPYf9Su/q/NhOvvV1emSLGcoUnKmssPaEdQSkx4QRc
 pJSisdQgMqYpysaU6NaRfSVQJtTKHtGJQ3/A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715202881; x=1715807681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buSNW1rXJ5tp0mHF2b1c12zxGyNSJnH+cWUgnRIBSqA=;
 b=BDsn691hxBs7ut4ywn+zFVco5xzGCP9nSwGEHNbbr5KdOiq/8Bbk4PZutFL9VHK4bz
 lAlZdQ6O06zYw0OASRKoh8QxQD19XV7JLCJrBOIz37aENiqtDSTCm7DGsqk1i+7naxbi
 28Uryij4hGRUzSPe+1p77lelqZcbCUDKfR7u9YNxYCKsfE0OXUM6mM2rMaim5DW0p3yZ
 GE+oA/57BKwq/w928KNF4vK5kTVn3Bxy1IHIleSAgbzdn0cXyzoNwLr6zIXmJWPhNVKd
 izMJZVyyQo3xWv/KFaFTi758+JSkDVOLP7uVPu+dcBdBJJROr3Jc4/eABUUC0gHsAfYV
 e7QA==
X-Gm-Message-State: AOJu0Yw9SQlgjfr+Aqsu9B/0ehU1K9yw4uIbaMLisJ202b38JdBY4ISv
 t1EK6m0Ux8Phw50TYWFc8I+RvzI72m4xFR8e+wxU1fzUUWa+Y+e44IAAeWoYP5FIV8JMJZb/wgU
 =
X-Google-Smtp-Source: AGHT+IGhIdHCKHUdpFoIg0+2Qs+xzjObn1kXDgYPjIOxYFP9hEgV9ZfwCk+vKHe9OnopI86jP3GDgQ==
X-Received: by 2002:a05:622a:1ba4:b0:43a:6226:db5 with SMTP id
 d75a77b69052e-43dbec04e00mr44614291cf.13.1715202881387; 
 Wed, 08 May 2024 14:14:41 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 t13-20020ac8738d000000b0043de59d1a11sm530565qtp.18.2024.05.08.14.14.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 14:14:39 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43ae23431fbso57541cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 14:14:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:43a:c1cd:2f4c with SMTP id
 d75a77b69052e-43df44dc04cmr169931cf.5.1715202879034; Wed, 08 May 2024
 14:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
In-Reply-To: <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 14:14:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
Message-ID: <CAD=FV=WoYm43SzrdrSZ1Np58iQ4nMwF0u6uamOAnZc4pqmBpsg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
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

On Sun, May 5, 2024 at 11:52=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, May 3, 2024 at 11:36=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
>
> > As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> > prepared/enabled in drm_panel"), we want to remove needless code from
> > panel drivers that was storing and double-checking the
> > prepared/enabled state. Even if someone was relying on the
> > double-check before, that double-check is now in the core and not
> > needed in individual drivers.
> >
> > This series attempts to do just that. While the original grep, AKA:
> >   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> > ...still produces a few hits after my series, they are _mostly_ all
> > gone. The ones that are left are less trivial to fix.
> >
> > One of the main reasons that many panels probably needed to store and
> > double-check their prepared/enabled appears to have been to handle
> > shutdown and/or remove. Panels drivers often wanted to force the power
> > off for panels in these cases and this was a good reason for the
> > double-check.
> >
> > In response to my V1 series [1] we had much discussion of what to
> > do. The conclusion was that as long as DRM modeset drivers properly
> > called drm_atomic_helper_shutdown() that we should be able to remove
> > the explicit shutdown/remove handling in the panel drivers. Most of
> > the patches to improve DRM modeset drivers [2] [3] [4] have now
> > landed.
> >
> > In contrast to my V1 series, I broke the V2 series up a lot
> > more. Since a few of the panel drivers in V1 already landed, we had
> > fewer total drivers and so we could devote a patch to each panel.
> > Also, since we were now relying on DRM modeset drivers I felt like we
> > should split the patches for each panel into two: one that's
> > definitely safe and one that could be reverted if we found a
> > problematic DRM modeset driver that we couldn't fix.
> >
> > Sorry for the large number of patches. I've set things to mostly just
> > CC people on the cover letter and the patches that are relevant to
> > them. I've tried to CC people on the whole series that have shown
> > interest in this TODO item.
> >
> > As patches in this series are reviewed and/or tested they could be
> > landed. There's really no ordering requirement for the series unless
> > patches touch the same driver.
> >
> > NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> > really possible to generate automatically. That means it's entirely
> > possible that my eyes glazed over and I did something wrong. Please
> > double-check me and don't assume that I got everything perfect, though
> > I did my best. I have at least confirmed that "allmodconfig" for arm64
> > doesn't fall on its face with this series. I haven't done a ton of
> > other testing.
> >
> > [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46=
d6b234f89613b5cec0f14@changeid
> > [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium=
.org
> > [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium=
.org
> > [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromiu=
m.org
>
> This is the right thing to do, thanks for looking into this!
>
> As for the behaviour of .remove() I doubt whether in many cases
> the original driver authors have even tested this themselves.

Yeah, I'd tend to agree.


> I would say we should just apply the series as soon as it's non-RFC

It's not actually RFC now, but "RFT" (request for testing). I don't
_think_ there's any need to send a version without the RFT tag before
landing unless someone really feels strongly about it.


> after the next merge window

With drm-misc there's not really any specific reason to wait for the
merge window to open/close as we can land in drm-misc-next at any time
regardless of the merge window. drm-misc-next will simply stop feeding
linuxnext for a while.

That all being said, I'm happy to delay landing this until after the
next -rc1 comes out if people would prefer that. If I don't hear
anything, I guess I'll just wait until -rc1 before landing any of
these.


> and see what happens. I doubt it
> will cause much trouble.

I can land the whole series if that's what everyone agrees on. As I
mentioned above, I'm at least slightly worried that I did something
stupid _somewhere_ in this series since no automation was possible and
with repetitive tasks like this it's super easy to flub something up.
It's _probably_ fine, but I guess I still have the worry in the back
of my mind.

If folks think I should just apply the whole series then I'm happy to
do that. If folks think I should just land parts of the series as they
are reviewed/tested I can do that as well. Let me know. If I don't
hear anything I'd tend to just land patches that are reviewed/tested.
Then after a month or so (hopefully) I'd send out a v2 with anything
left.


> The series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

-Doug
