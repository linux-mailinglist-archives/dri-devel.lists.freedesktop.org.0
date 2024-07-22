Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022A193925D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 18:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAF410E0C1;
	Mon, 22 Jul 2024 16:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WFhigfO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DF410E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 16:12:51 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3993f5d75bbso10627335ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721664770; x=1722269570;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4INEQmSnM7kqm2imq9xjeA+11nYffi0tKfMBiA4YWB8=;
 b=WFhigfO+BZR8CMkjPSKIafjI0YzH6EcmxW9tFuwvVbs/9GwtRu+XGiGriVlZgEAYKQ
 wR7rcNZwLnWslJsjqJmofHskCF2khS9N5j8fj+8D9SNgJfwoPNpUjseTLYPPse+Zx6gr
 6PSOHf9KsdJ3l3Uqmc0clVwV4UnZkbuDnENgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721664770; x=1722269570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4INEQmSnM7kqm2imq9xjeA+11nYffi0tKfMBiA4YWB8=;
 b=bu5gJXVWzQDfMw5X58iGwVjTrLeoGnm38E/ercitQ/W7fZGkyM8721rpi0r3c+Z13W
 9uSlqcd7EOqlP7gJO9XxBqWLh8nGdG+Aq9ofQz/fFznXjNLLQ2HaUu4MKI40O1iL8TCP
 1l2l5YtDsMarKtOKGUhKIBFjTBsJsQN0gQlSHqtrGdLkuv8s+9wE8hTd/1zowAdhcjPz
 64wzeFby+pqsy3SRDXTwQLLaQKK6WcG9uJ+28W8Uqe0LKDEBV7AT38WxvBA7MEXHjxaZ
 mxKDsG5T8TkKa4tvDor/guuGiry+Z05nxec0gkIap7i7/yo4CZT93C0aXhVVUjPeFdkW
 rJew==
X-Gm-Message-State: AOJu0YwAuHnnFEIzyZao6KIIvhv4b//bXh7n8kvknS5UG+N5LSCDThaR
 0nYtijBCQ7gnaSOIyah0Y5mn3jEVuADW9rL2J54VYwITfYwEu2Cn6OI/29rgbeWz+ZA0x1bd5Fc
 =
X-Google-Smtp-Source: AGHT+IHi3k3LHyIu/yYFVX4uesbXwpzHyrlfVrpPeMVrQjZQrknA3ZeIH+22HqsNVHSekMgjmW0SPQ==
X-Received: by 2002:a92:c542:0:b0:383:290e:6937 with SMTP id
 e9e14a558f8ab-398e51906famr106759455ab.11.1721664770078; 
 Mon, 22 Jul 2024 09:12:50 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7efbac3sm25915405ab.80.2024.07.22.09.12.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 09:12:49 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3993fddea13so299345ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:12:49 -0700 (PDT)
X-Received: by 2002:ac8:5d55:0:b0:447:e6c6:bd3 with SMTP id
 d75a77b69052e-44faaa60cb7mr4844271cf.21.1721664290605; Mon, 22 Jul 2024
 09:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240621134427.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <CAD=FV=VwebY8F3XjeVt6kvKwB7QZ8Khn5oJJoDThuemiGx9y+g@mail.gmail.com>
 <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
In-Reply-To: <CAD=FV=UdsuEiyPK2K3sYdQm50WNukA5pxD=wUaEAVQStNnNA_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 09:04:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6hjNkzD-_4m4B8GaKP+gJK2jKMp+jeqtLdBnx69==jw@mail.gmail.com>
Message-ID: <CAD=FV=W6hjNkzD-_4m4B8GaKP+gJK2jKMp+jeqtLdBnx69==jw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Jul 15, 2024 at 9:40=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jun 21, 2024 at 1:46=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 21, 2024 at 1:45=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > >
> > > At shutdown if you've got a _properly_ coded DRM modeset driver then
> > > you'll get these two warnings at shutdown time:
> > >
> > >   Skipping disable of already disabled panel
> > >   Skipping unprepare of already unprepared panel
> > >
> > > These warnings are ugly and sound concerning, but they're actually a
> > > sign of a properly working system. That's not great.
> > >
> > > We're not ready to get rid of the calls to drm_panel_disable() and
> > > drm_panel_unprepare() because we're not 100% convinced that all DRM
> > > modeset drivers are properly calling drm_atomic_helper_shutdown() or
> > > drm_helper_force_disable_all() at the right times. However, having th=
e
> > > warning show up for correctly working systems is bad.
> > >
> > > As a bit of a workaround, add some "if" tests to try to avoid the
> > > warning on correctly working systems. Also add some comments and
> > > update the TODO items in the hopes that future developers won't be to=
o
> > > confused by what's going on here.
> > >
> > > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > This patch came out of discussion on dri-devel on 2024-06-21
> > > [1]. NOTE: I have put all changes into one patch since it didn't seem
> > > to add anything to break up the updating of the TODO or the comments
> > > in the core into separate patches since the patch is all about one
> > > topic and all code is expected to land in the same tree.
> > >
> > > Previous versions:
> > > v0: https://lore.kernel.org/r/20240604172305.v3.24.Ieb287c2c3ee3f6d3b=
0d5f49b29f746b93621749c@changeid/
> > > v1: https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f=
49b29f746b93621749c@changeid
> > >
> > > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-dev=
el&date=3D2024-06-21
> > >
> > >  Documentation/gpu/todo.rst           | 35 +++++++++++++-------------=
--
> > >  drivers/gpu/drm/drm_panel.c          | 18 ++++++++++++++
> > >  drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++-------
> > >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++-------
> > >  4 files changed, 68 insertions(+), 37 deletions(-)
> >
> > Ugh! I realized right after I hit "send" that I forgot to mark this as
> > V2 and give it version history. Sorry! :( Please consider this to be
> > v2. It's basically totally different than v1 based on today's IRC
> > discussion, which should be linked above.
> >
> > If I need to send a new version I will send it as v3.
>
> Is anyone willing to give me a Reviewed-by and/or Acked by for this
> patch? ...or does anything want me to make any changes? Given all the
> discussion we had, it would be nice to get this landed before we
> forget what we agreed upon. :-P

Landed in drm-misc-next with Neil and Linus W's tags.

[1/1] drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
      commit: f00bfaca704ca1a2c4e31501a0a7d4ee434e73a7

-Doug
