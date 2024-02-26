Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDD866D26
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB69F10EF83;
	Mon, 26 Feb 2024 08:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i9WkFSey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8D10EF7E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:52:37 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-7d6a772e08dso677348241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708937556; x=1709542356;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHx8fqSvvCXlCRS96cOi6NcuQX1k76UHUWB26clPB70=;
 b=i9WkFSeyepPwffTAvFrm6LyAkkX0jVYqZtthwL0Cvr+moezXYZgRrH5+PKxPdXqzml
 A4B4JVVd0tTsCeYhangiaYWeVDCjsoTpUeTinnORyvhG8S968e1YvjLvK+Fl6KM++SdL
 Cc482R2C8TPhxqzR1IWxkawnn0TnS2vd01hq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708937556; x=1709542356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHx8fqSvvCXlCRS96cOi6NcuQX1k76UHUWB26clPB70=;
 b=ti8KQ53Y4pLzobXKzcHu1Iz9sLS7ExODzwhC9ykL9/dabd8++xm/pOhrIfJWD0Oa0i
 rQ9Vtnd/vcE5SX8x+Mfi+XzPUGxIfsa8guiPhWy3mZVNLx9z20NU4T13+QJOl0qt+4uQ
 yVNGWkM3RsHM1UiBMiGC9+2yzn/i9dbLCpbW4Obvl3d9mdbTkrc05IrNDq1PuAN+QxYw
 ExmDYrfwtQ99l4udaBpVFINFB6LWa/HblevFfNrVWJr9/HV2FVX/8iHxI7rW6LbT72mj
 lO4//wg9hwnDhw1obJ4mgf+ipRnkBrA5QM80uwfstQc9VY2H7kLQKi1KRr9May61FUwf
 nuXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLzNxOpjs7zLSnPv2mKT339cE0PIKMdXknVfuSxCWoYsFuztBYKlrEYu+Av1/vHS3cAvOtAPnN0KPmoG8PQ2gsoRG7rNb3QoZS6LiC62nc
X-Gm-Message-State: AOJu0YybMuACuXiej9O067Br3K85AI+lHs2nQ75LkG3zgIZknEO8ttsU
 2+f5bxuhMgWiIP9RuHm7/G1BM0fpwXJw0dSLJMqfsIBymuv8b4jqWmIUqERtg/CcVsAjx0O/yM4
 hzw==
X-Google-Smtp-Source: AGHT+IGg9rjO+7mCEepmEDrmg1goCbsuBCuYW8RXU/vw3lpiCItIHDFVnApyOFZcd6f2qj/BpJZ8wg==
X-Received: by 2002:a1f:c4c2:0:b0:4cd:44db:b24b with SMTP id
 u185-20020a1fc4c2000000b004cd44dbb24bmr2562725vkf.5.1708937556348; 
 Mon, 26 Feb 2024 00:52:36 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 cb4-20020a056122408400b004cc4f2df3edsm587597vkb.31.2024.02.26.00.52.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:52:35 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-46d745c4fa6so232610137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 00:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUDRp9KEfh25lrkkz4+d1yKfKMUE+F7mooypojgc61mTY/6gRq98h9Uajyamor1kaXaVVof6RWu8wVCRjVt+qKE5i57SB34mxuB0JTBpxgs
X-Received: by 2002:a05:6102:3234:b0:471:b7ed:e112 with SMTP id
 x20-20020a056102323400b00471b7ede112mr2376132vsf.1.1708937554848; Mon, 26 Feb
 2024 00:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20240221165643.1679073-1-greenjustin@chromium.org>
 <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
 <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
 <c4814e25-42c9-4604-b86a-8ef0bd634f78@collabora.com>
In-Reply-To: <c4814e25-42c9-4604-b86a-8ef0bd634f78@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 26 Feb 2024 16:51:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngRerkkopcQqvA6s9Fs2u_23rLmxf8n_hzz=R7yO2bfOw@mail.gmail.com>
Message-ID: <CAC=S1ngRerkkopcQqvA6s9Fs2u_23rLmxf8n_hzz=R7yO2bfOw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org
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

On Mon, Feb 26, 2024 at 4:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/02/24 09:21, Fei Shao ha scritto:
> > On Thu, Feb 22, 2024 at 4:43=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 21/02/24 17:56, Justin Green ha scritto:
> >>> Add MT8188 overlay driver configuration data. This change consequentl=
y
> >>> enables 10-bit overlay support on MT8188 devices.
> >>>
> >>> Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 a=
nd
> >>> BA30 overlays are confirmed to work from modetest.
> >>>
> >>> Signed-off-by: Justin Green <greenjustin@chromium.org>
> >>> Tested-by: Justin Green <greenjustin@chromium.org>
> >>
> >> Hello Justin,
> >>
> >> I'm 99.9% sure that you don't need this, you can just use compatibles
> >>
> >> compatible =3D "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
> >>
> >> as they *are* indeed compatible, and MT8188 does support AFBC as well.
> >
> > Hi,
> >
> > I confirmed that I can lit up the MT8188 display with that plus a
> > follow-up patch [1].
> > Otherwise a compatible sequence of mt8188, mt8195 and mt8192 would be
> > needed, but that would be somewhat redundant.
> >
>
> Actually, that wouldn't be MT8192, but MT8183 - following MT8195's device=
tree,

Ah yes, you're right.

>
> so it would be
>
> compatible =3D "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl",
>               "mediatek,mt8183-disp-ovl";
>
> And yes that could be redundant, but I'm not sure that adding a compatibl=
e
> string to the mtk_drm_drv matches is a good idea.
>
> I'd be more for using the triple compatible strings in there instead, as =
it'd
> be like that for only *one* node and not more than that - IMO, that is to=
tally
> acceptable and it's also the best (and lightest) solution.

I see, I'm also fine with this approach. Thanks for the feedback!

Regards,
Fei

>
> Cheers,
> Angelo
>
> > [1]: https://lore.kernel.org/all/20240226080721.3331649-1-fshao@chromiu=
m.org/
> >
> > Regards,
> > Fei
> >
>
