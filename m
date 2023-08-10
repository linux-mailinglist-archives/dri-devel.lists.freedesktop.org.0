Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C97772CD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 10:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3670710E163;
	Thu, 10 Aug 2023 08:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EBF10E509
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 08:23:33 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d479d128596so924450276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691655812; x=1692260612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FSQOxCgo47VmIjcYi/njGt347ahAIyw5h4v3LyUWu0=;
 b=eIW4Fs5A42B2jvHBg7u7h7ZH53RGKE9aq6BXQT/kJuJA7pwmgm8ERy9rF371C7gjl8
 HmXYa19Fo2AgBFTzm3z1ESM+b7kgLu9yVwHF9ZQx07oFflmNZzqH2KWlhXCBMm359YqE
 xIiZTXdBwjkcXqziCH3qy10kCKRTn2dDujpAl+nUkpZee4tgmO5VrEeUHM7Z7M5qHLMD
 xS1tC/uqJ+fe9i7rrZ61v9lsjdmdmbaRkJAvdm1ZWegU47VzYUAGqU5jUBfJ8EyzHaYN
 2MzP2BPJWj61L9ts1B9NKbD7KPY+8Np/9Zl8oJPBsWAntVhfuV/q8NhZNF1pjRjmyWab
 stOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691655812; x=1692260612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FSQOxCgo47VmIjcYi/njGt347ahAIyw5h4v3LyUWu0=;
 b=Er9THBZyBLsM6SnxSN0LLgQJApSDMG+MchPClNgy1bwiuMYWsy60q5qSuwbkg8WI3W
 Fe8250bxfUS5M+vuCbldivHsRkpvQdybiV+aqnvWJihaN/hq5DikKbrEDO9d+hvyC31a
 fRIyPcMCxixPK06cF+CkevI8Zr3zj91LDixOu2KzEZ84g7Sw52Tabdu1FUNbOvJPrVlY
 ZcZ8ev/O23d5m59WpPYhxZNya1kWdrJ8AT66K0InCVK4nWFxus/BVcoM8s4j1TZw+sfu
 WcVieKPR4SofJnBs6Hn1YrxBMCIpPad0CUhV0Ezusirjk6K6BXvPdcJM99AfvzYX06IA
 fRYQ==
X-Gm-Message-State: AOJu0YxtJNtnlIE8jFCBj6vE1IHy0mkEzVWDD9pyeMGwEXySXfiSblUA
 BJ6u8FeGlr/1SsgIyyJt0Z8IOqJ0NpdGlTf7kkr2Gg==
X-Google-Smtp-Source: AGHT+IGvMAyo4iVUK0KCiOuLVtXH4HFq8epNfYNz2HxnUTtMcuEIenQ0cd01eohWWTH+rLFqJyxWQRkAuz/SPRd4vxs=
X-Received: by 2002:a25:e6d4:0:b0:d47:7448:81a with SMTP id
 d203-20020a25e6d4000000b00d477448081amr1662391ybh.23.1691655812036; Thu, 10
 Aug 2023 01:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
In-Reply-To: <20230804210644.1862287-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:23:21 +0200
Message-ID: <CACRpkdaF4GqHtdJeBed0JGVXNkpA9dvbPgGMK=Qy0_RZyvOtNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Ondrej Jirman <megous@megous.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org,
 Stefan Mavrodiev <stefan@olimex.com>, Jianhua Lu <lujianhua000@gmail.com>,
 dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>,
 Ondrej Jirman <megi@xff.cz>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 11:07=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> This series attempts to do just that. While the original grep, AKA:
>   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> ...still produces a few hits after my series, they are _mostly_ all
> gone. The ones that are left are less trivial to fix.
>
> One of the main reasons that many panels probably needed to store and
> double-check their prepared/enabled appears to have been to handle
> shutdown and/or remove. Panels drivers often wanted to force the power
> off for panels in these cases and this was a good reason for the
> double-check. As part of this series a new helper is added that uses
> the state tracking that the drm_panel core is doing so each individual
> panel driver doesn't need to do it.
>
> This series changes a lot of drivers and obviously the author can't
> test on all of them. The changes here are also not completely trivial
> in all cases. Please double-check your drivers carefully to make sure
> something wasn't missed. After looking at over 40 drivers I'll admit
> that my eyes glazed over a little.
>
> I've attempted to organize these patches like to group together panels
> that needed similar handling. Panels that had code that didn't seem to
> match anyone else got their own patch. I made judgement calls on what
> I considered "similar".
>
> As noted in individual patches, there are some cases here where I
> expect behavior to change a little bit. I'm hoping these changes are
> for the better and don't cause any problems. Fingers crossed.
>
> I have at least confirmed that "allmodconfig" for arm64 doesn't fall
> on its face with this series. I haven't done a ton of other testing.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please send out a non-RFC version, this is clearly the right thing to
do.

Yours,
Linus Walleij
