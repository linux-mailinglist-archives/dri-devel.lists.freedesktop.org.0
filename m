Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9676733B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856A10E20C;
	Fri, 28 Jul 2023 17:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01CF10E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:24:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5221c6a2d3dso3051090a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690565092; x=1691169892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OksjTSbasaKDlLBRiSbrJQqC1q20sr1fdGQKMyKb9RQ=;
 b=ioM7av1YzBaFvfjIOPF/f2zM1OSDbDtHwJBng+JaV3GrX8NcGb39/dabdNWrq1XyrR
 Y4Ex/6wFZL21InBLOLzmmb6ATsrs5s1cfyqmE4MY8MAdNypLB0nDvVs7DRepi9KvJc61
 mod6RIUS8zYoTctpxzT2aoNAVqUm409uFPR/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690565092; x=1691169892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OksjTSbasaKDlLBRiSbrJQqC1q20sr1fdGQKMyKb9RQ=;
 b=BFUbazgaBzmjWQwkmoR1oq5cRu6KH4xJUUVtmONOtUSXFxzXS6YWSphjMF/s8cZN56
 9aM2Y2gYHNJUmiWA/hB8Vjxvl+Rohjbj6WSVm31bjnQqpXU/lCYw/yscrRGSNkGebR8c
 iVeWdV/F3gvw/7Tw2hGLi+dp89Y+6joRrzqycJz6cEFieAoXBpD172k+IZgMIeFkWyUt
 dy9atfz4QYIlXxLTpzH7sBZS0+BzDTK0Ge/t7p8mC7hPC0hC/BEqHa+Sc8q6hyS/uJhl
 MsQIHNYKV7fP5XoRLCWKL5hAZnu2hGbG3PpXO/jdd61caHbyEeiwrIEk4myIRW57lU4O
 ji0w==
X-Gm-Message-State: ABy/qLaZHNvmiKH9iRYPcb9K2Jb8wp3oxKJCDiZ+Ikb5QjCTXuahbona
 Ph8usj9MrG3LBuIAOw5554JbGl/5jHyukGkQBSZH/A==
X-Google-Smtp-Source: APBJJlHVD7WlsaeVE4+WyAYR4v0N5I035ztuymOJ+6TMbBY/uY0ISx7Bu3K8QyN6zNZmsBH95+hiyg==
X-Received: by 2002:aa7:d995:0:b0:521:77dd:c8d3 with SMTP id
 u21-20020aa7d995000000b0052177ddc8d3mr2352343eds.27.1690565092497; 
 Fri, 28 Jul 2023 10:24:52 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7db4a000000b00522584bb58esm1973251edt.24.2023.07.28.10.24.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 10:24:52 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3fe0e132352so5345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:24:52 -0700 (PDT)
X-Received: by 2002:a05:600c:690f:b0:3fd:e15:41e3 with SMTP id
 fo15-20020a05600c690f00b003fd0e1541e3mr5980wmb.2.1690565071086; Fri, 28 Jul
 2023 10:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230727171750.633410-1-dianders@chromium.org>
 <nn6cs4zvf27cxmtd3qcficyoyalcxi2iry6kgszb5oraplgaxy@sryeyseucdb3>
In-Reply-To: <nn6cs4zvf27cxmtd3qcficyoyalcxi2iry6kgszb5oraplgaxy@sryeyseucdb3>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 28 Jul 2023 10:24:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wo5H-XohCz_sLnV=oT5cRm2tFrSAG9kpCGzK7pjSW_Xg@mail.gmail.com>
Message-ID: <CAD=FV=Wo5H-XohCz_sLnV=oT5cRm2tFrSAG9kpCGzK7pjSW_Xg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
To: Benjamin Tissoires <bentiss@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 28, 2023 at 8:31=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> On Jul 27 2023, Douglas Anderson wrote:
> >
> > The big motivation for this patch series is mostly described in the pat=
ch
> > ("drm/panel: Add a way for other devices to follow panel state"), but t=
o
> > quickly summarize here: for touchscreens that are connected to a panel =
we
> > need the ability to power sequence the two device together. This is not=
 a
> > new need, but so far we've managed to get by through a combination of
> > inefficiency, added costs, or perhaps just a little bit of brokenness.
> > It's time to do better. This patch series allows us to do better.
> >
> > Assuming that people think this patch series looks OK, we'll have to
> > figure out the right way to land it. The panel patches and i2c-hid
> > patches will go through very different trees and so either we'll need
> > an Ack from one side or the other or someone to create a tag for the
> > other tree to pull in. This will _probably_ require the true drm-misc
> > maintainers to get involved, not a lowly committer. ;-)
> >
> > Version 4 of this series adds a new patch that suspends i2c-hid
> > devices at remove time even for non panel-followers to make things
> > consistent. It also attempts to isolate the panel follower code a bit
> > more as per Benjamin's feedback on v3 and adds an item to the DRM todo
> > list as per Maxime's request. As per Maxime's response to my v3 cover
> > letter, I added his Reviewed-by tag to all 10 patches that were part
> > of v3 (but left it off of the new i2c-hid patch in v4).
> >
> > Version 3 of this series was a long time coming after v2. Maxime and I
> > had a very long discussion trying to figure out if there was a beter
> > way and in the end we didn't find one so he was OK with the series in
> > general [1]. After that got resolved, I tried to resolve Benjamin's
> > feedback but got stuck [2]. Eventually I made my best guess. The end
> > result was a v3 that wasn't that different from v2 but that had a tiny
> > bit more code split out.
> >
> > Version 2 of this patch series didn't change too much. At a high level:
> > * I added all the forgotten "static" to functions.
> > * I've hopefully made the bindings better.
> > * I've integrated into fw_devlink.
> > * I cleaned up a few descriptions / comments.
> >
> > As far as I can tell, as of v4 everyone is on the same page that this
> > patch series looks like a reasonable solution to the problem and we
> > just need to get all the nits fixed and figure out how to land it.
>
> Thanks a lot for the new version. I like it much more on the HID side:
>
> for the HID part:
> Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
>
> I wouldn't mind having this series taken from the drm tree if that is
> easier. i2c-hid is a low patch rate driver, so having it updated through
> DRM should not be an issue.
>
> In that case:
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Thanks for your reviews and your help getting this whipped into shape.

Lading through drm makes sense to me. I'm a drm committer, so with
your Ack I believe it should be fine for me to land the series (minus
the dts) in drm-misc-next. This series has been around for a while,
has been reviewed by relevant folks, and the last few changes haven't
fundamentally changed anything about the design, so I'm not going to
twiddle my thumbs too long. That being said, I'll still plan to wait
until early next week (Tuesday?) before landing to allow for any last
minute shouts.

Given how drm-misc works [1] and the fact that mainline is currently
at v6.5-rc3 (it will be -rc4 when I land it), I'd expect that these
commits will find their way into v6.6.

[1] https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
