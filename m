Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC079B0A08
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB24A10EB1C;
	Fri, 25 Oct 2024 16:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AX/AvqIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62110EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:35:40 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fc968b3545so23364281fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729874138; x=1730478938;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eq3fXe6qq3ix8jve6B/lCKB6fSeKNV8aFXZ8E3BzHv4=;
 b=AX/AvqIH5FENwl4p5snuR0ubFxPGEvARQ9pnT8Bc8QikOPlxwJAowK4QQpIt897vIA
 UCZBsRgeeH+zoaCHDaJIl31Aesdr9WdqxcYLbgeCdldqXxOIzGvFnF7SrHXjn/Ggp7ks
 VVRZJp5L4PJa/BqNdWI99wzYYxVlpfzSqpjFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729874138; x=1730478938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq3fXe6qq3ix8jve6B/lCKB6fSeKNV8aFXZ8E3BzHv4=;
 b=RhjQwaEehvfNMYGTMPD71ulacfDErZtcN7lFQY6ipjiPARO9ZueFYz67M1rud9nH2h
 E7wGG+FM6LN5nKoAH5Yh7NDA74wLlxlBsxdxHzbfc62FQOdWJo83Gbq0INNVRzKEO6PN
 ZRQbkzlxQi04/5apfM5cUIAE7/cv+d0stqtu3+JzjJP4bcyV6XU6CiCSzE2v+NgmMt3z
 YEnKYAUEAtCIjOVP4GtMhM2MUV7ZmaXad9QqiykQDJWnuOTb3CPfcKUElVW5bvsp1gJV
 8AbD8VW1DiEKFtlEXXgkfENvgKmLNVdwb1MI3Kn7lpcYlHvPZPEZohkEIj7vY6VsNNX/
 o1AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4y2yFhDzx0UjXCFd29iP8Urq43352m5MDUj8OmPgY6aYvBHcSqHqEd5vd8tjgOiSWW+FBpyGqv/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrlIu8C+VLtGnb0JaRDjwXevikqZNIz1AaTzHT37U4dyWymm/4
 ddu7aevAotLsbiyP3a+ZtqAdcak6AE8j6OgB3wHtjOism8IBy/0N/0ROTA5p6leGX9NgwZlZTyI
 yuo/Y
X-Google-Smtp-Source: AGHT+IHgY9BYK4+WsG6j3kVFFbWnrYvXlvBobcHVjQYTIr0Wvxm1fHDrr9eihDnSusKh2Lw196+nrg==
X-Received: by 2002:a2e:b88b:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fc9d1dbb59mr56011861fa.0.1729874138216; 
 Fri, 25 Oct 2024 09:35:38 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb4508173sm2403081fa.15.2024.10.25.09.35.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 09:35:37 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso22250431fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUsp+GGEaseaA2vO+RohcJIxdw/clfeYiekgzaNmV4bgQPl8BUHEzN8ujPLzudgv0WweSUDM29wjUk=@lists.freedesktop.org
X-Received: by 2002:a05:651c:2210:b0:2fa:beb5:11cc with SMTP id
 38308e7fff4ca-2fc9d582d71mr53240501fa.40.1729874137392; Fri, 25 Oct 2024
 09:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
 <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
 <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
 <b75276ff8dc2f73818ccd132530c0d3825e17888.camel@mediatek.com>
In-Reply-To: <b75276ff8dc2f73818ccd132530c0d3825e17888.camel@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 09:35:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSD9p61ePKXVOcUBGktRJkUx+KbiJXF-9QUtWE8zDt0A@mail.gmail.com>
Message-ID: <CAD=FV=WSD9p61ePKXVOcUBGktRJkUx+KbiJXF-9QUtWE8zDt0A@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation
 property
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 =?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 =?UTF-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "littlecvr@chromium.org" <littlecvr@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>,
 "zwisler@chromium.org" <zwisler@chromium.org>
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

Hi Shawn,

On Thu, Oct 24, 2024 at 6:32=E2=80=AFPM Shawn Sung (=E5=AE=8B=E5=AD=9D=E8=
=AC=99)
<Shawn.Sung@mediatek.com> wrote:
>
> Hi Doug,
>
> On Thu, 2024-10-24 at 13:47 -0700, Doug Anderson wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi,
> >
> > On Wed, Jun 19, 2024 at 9:39=E2=80=AFAM Hsiao Chien Sung via B4 Relay
> > <devnull+shawn.sung.mediatek.com@kernel.org> wrote:
> > >
> > > From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > >
> > > Always add DRM_MODE_ROTATE_0 to rotation property to meet
> > > IGT's (Intel GPU Tools) requirement.
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > MT8173.")
> > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
> > >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
> > >  drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
> > >  3 files changed, 11 insertions(+), 14 deletions(-)
> >
> > FWIW, this patch got into ChromeOS's 5.15 branch via stable merge and
> > apparently broke things. As a short term fix we've reverted it there:
> >
> > https://crrev.com/c/5960799
>
> Thank you for reporting this issue. We are currently investigating the
> bug.
>
> Since I am unable to access the Google issue tracker [1], could you
> please provide more details about this bug? The message in the revert
> commit mentions "hana/sycamore360" (MT8173) and it appears that there
> is a rotation issue in tablet mode.

Thanks for the followup. I've only been peripherally involved in the
problem, but I can at least copy the relevant bits over.

It looks as if the problem is somehow only showing up when running
Android apps on those devices, so whatever the problem is it's subtle.
The report says that the apps work OK when the device is in tablet
mode and in one rotation but the problem shows up when rotated 90
degrees. The report says that "Screen content appears inverted". To me
it also sounds _possible_ that the problem is somewhere in our
userspace.

I think Hsin-Yi and Ross are continuing to dig a bit more. Maybe once
they've dug they can add any details they find or can loop in others
as it makes sense?


> > ...apparently the patch is fine on newer kernels so maybe there is a
> > missing dependency? Hopefully someone on this list can dig into this
> > and either post the revert to stable 5.15 kernels or suggest
> > additional backports.
> >
>
> There are known issues [2] regarding forward compatibility. Could you
> confirm whether this patch is unable to resolve the mentioned problem?
> Thanks.
>
> [1] https://issuetracker.google.com/issues/369688659
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D896964

The patches in [2] look related to alpha blending but I think they are
seeing issues related to rotation. ...so I'm going to assume it's
different? I don't have this hardware in front of me, so I'm just
going by the report.

-Doug
