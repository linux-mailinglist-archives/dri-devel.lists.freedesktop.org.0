Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FA9B7794
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 10:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14E110E853;
	Thu, 31 Oct 2024 09:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IEB9B1Sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E294510E853
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:34:31 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539f53973fdso651589e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730367270; x=1730972070;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=InN1xFa4g9RMlT4oK3tOjutPsAyzphU02LuhXMsZALM=;
 b=IEB9B1SqXj3CHOMjfFfyeGdHJsyFWIQSZ/ni7CMVipdVIxjoBeQS1prrP6VoFOKVZO
 Yoe/PNen8zQH3Bc5o9snMsZ5w84c7qs4G3e2B5YGOHi29rYpVtYomaXLCbfB7bOvGIJl
 /im9UtQV9LmqMuYxYzuoR3rlL1SUnQDZint5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730367270; x=1730972070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InN1xFa4g9RMlT4oK3tOjutPsAyzphU02LuhXMsZALM=;
 b=Ox78A3S5RCUD7P+tJi2mVvWr6i8c5fWA1RHrBb+fn+XDqWouQbzUz1zVXW9fB0AlNN
 UzHhEcrgoZJORve9koczL8oWn5W7FBPiuEvWA7SzGXqgbOEFnvKNmh0r+OAO2eukdm8g
 IUtHmn0pPWNZ0f5yU8jZe/FvAlePitsc59aLrqoUFNXcz0DUlYdUSZP/N4KGrFKGD4b3
 0x0uY89QXOsEWZKatjc5uktF6BDMUS6YjXfnu/NEbp5CWHxXBfQC/LIoDRbRHs2a9uMt
 vltlf1ikyCMRr+5BH0N8eC/XWe0GntsBGOADYnaqlszNKHF9+65JXvO4e3BHUJz0fheO
 UVzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAJ/0260gGT/anwTPzN3Hg5dbVFwP0YhGaSuIuUlO1mE3YZDl01uylrDWKzrtvWRv7MrdM6ljdlYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEgbzEnf955guEmtuUI4uMZqcaiPHuB5lrZP5mBqINKd6hFYiv
 kuzmre6vQenoOJd9CGFDTPpi897PpELtZwJ8JXrpYhetHgiw42wHxKNSdPO08sVNHB4J797TKZ2
 oKpccwCFNijgE6V+5xgrqqdDs+9SkZxDMnbAL
X-Google-Smtp-Source: AGHT+IHX8IaTSony3Ug7y1qw915U2fjctGRizSyZJqMGGKqXUXcFSb5o6pqwOsBeJtryiF2PWRQTbhcS2j/8glKC0bU=
X-Received: by 2002:a05:6512:3d10:b0:539:fd75:2b6c with SMTP id
 2adb3069b0e04-53c7bc369b8mr554550e87.21.1730367269718; Thu, 31 Oct 2024
 02:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241029111309.737263-1-wenst@chromium.org>
 <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
 <20241030-hot-peridot-falcon-57bdbb@houat>
 <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
 <CAGXv+5EWyGGKYo+NNQ3Ykd3QUUO2cOManSnhZQaVhhCnupNx=Q@mail.gmail.com>
 <20241031-turkey-of-astonishing-reputation-d1de20@houat>
In-Reply-To: <20241031-turkey-of-astonishing-reputation-d1de20@houat>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Oct 2024 17:34:18 +0800
Message-ID: <CAGXv+5HkxbjTH6oidYMYo9vQafev2S+a-+Yrs=+TNqs9sSUtZg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
To: "mripard@kernel.org" <mripard@kernel.org>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>
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

On Thu, Oct 31, 2024 at 5:30=E2=80=AFPM mripard@kernel.org <mripard@kernel.=
org> wrote:
>
> On Wed, Oct 30, 2024 at 04:52:17PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Oct 30, 2024 at 4:48=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) <ck.hu@mediatek.com> wrote:
> > >
> > > On Wed, 2024-10-30 at 09:25 +0100, mripard@kernel.org wrote:
> > > > On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=
=E5=85=89) wrote:
> > > > > Hi, Chen-yu:
> > > > >
> > > > > On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > > > > > External email : Please do not click links or open attachments =
until you have verified the sender or the content.
> > > > > >
> > > > > >
> > > > > > The recent attempt to make the MediaTek DRM driver build for no=
n-ARM
> > > > > > compile tests made the driver unbuildable for arm64 platforms. =
Since
> > > > > > this is used on both ARM and arm64 platforms, just drop the dep=
endency
> > > > > > on ARM.
> > > > >
> > > > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > > >
> > > > > I find this days ago, but I don't know there is someone who apply=
 it.
> > > > > Let this patch go through drm-misc tree which already has the bug=
 patch.
> > > >
> > > > If you are ok with this patch, why didn't you apply it yourself?
> > > >
> > > > I think that's very much the expectation, so it's probably took a w=
hile to merge.
> > >
> > > That's ok for me to apply it if drm-misc has no plan to apply it.
> >
> > I'm confused. The culprit patch is already in drm-misc. So this one has
> > to go in drm-misc as well.
> >
> > I can try to apply it to drm-misc myself, or have a colleague assist wi=
th
> > that. I'll let it sit for another day in case anyone has something to s=
ay
> > about it.
>
> Sorry, I was under the assumption that CK had drm-misc commit rights? It
> should go through drm-misc indeed.

CK has always maintained a separate tree on git.kernel.org, so I don't know
if drm-misc commit rights were ever granted?

ChenYu
