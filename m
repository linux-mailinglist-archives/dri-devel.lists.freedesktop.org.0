Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D418F6F228E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 05:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7786B10E288;
	Sat, 29 Apr 2023 03:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E2610E288
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:10:25 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a34a0b9e2so78573966b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682737821; x=1685329821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xOabGxg1/6/r8Ogfw76eL1ZGsVCCTmlPqTwzDPQA0I=;
 b=Kc+SvuwMvX2OH/Y2cYYcOx0xi8PWzH5sJDuWz0OrlZeGUjlNZ0fI2o11zgMphiUCNE
 9tqI6883Slsbae8/Fk0k1haMVFHR5DqbGHqNrWDpWl9LgXPiLpA/T/y36Q1Oq1bHeIQt
 Q4zQccvwfzS5NoTmwaPf5I8miebZMPZp73cjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682737821; x=1685329821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xOabGxg1/6/r8Ogfw76eL1ZGsVCCTmlPqTwzDPQA0I=;
 b=iD67T3ogJd6oX42JQjsdrtYW1ECnBSBhbaQyByi9Xtru+SxtkSwSGA+G4VqFQA1dqL
 f0YT4Wce9LBE5nM0A5xiHX0RhuUJdxf9OL2O5AqVe+1q9POMESWaDzrzZwH3BpSZv0cg
 oyR+Ws/OExFLFFQuc/ERxaGfvZRwFNl0KkpHvyRGu569qpHbYxxYdf1c0sU/F7pGvOHx
 ZZ7ZuwBMevPVfXRJbzXqHDX3oROjsTMLHpQOVOZ4DhWPKIvJajUZWs8bXWJqC+br21+a
 ApJnK/wVIDM2CJAV+E0lpScsPfWLOHM/itObtcNpB2spk0/8+1Y5EzLqEx6NUoG/p24J
 VE4A==
X-Gm-Message-State: AC+VfDwBjt8xrQt6DcuDM0AsZxDTL5vIafuO57UQYSIDW6ABS+qKO7E2
 SKZjwlFkEUwphxrPMgSsnmsjmTyjtTY+f9J1pCzchdFh
X-Google-Smtp-Source: ACHHUZ4WWA6QhR9pLoQRVE5t9RumA18bF6NOmIil83B7FjbCmYoOzW9BoHO83JxNUnmWhjpk27PIaA==
X-Received: by 2002:a17:907:2cc6:b0:94e:75f8:668 with SMTP id
 hg6-20020a1709072cc600b0094e75f80668mr7769865ejc.56.1682737821405; 
 Fri, 28 Apr 2023 20:10:21 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 sg9-20020a170907a40900b00959aba150c3sm7402355ejc.50.2023.04.28.20.10.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 20:10:20 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso76865266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 20:10:19 -0700 (PDT)
X-Received: by 2002:a17:907:8a01:b0:94f:5e17:e80d with SMTP id
 sc1-20020a1709078a0100b0094f5e17e80dmr7299086ejc.45.1682737819304; Fri, 28
 Apr 2023 20:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230425073012.11036-1-marius.vlad@collabora.com>
 <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
 <a2239e16-31e8-3163-b349-8fc3328f33ed@collabora.com>
 <CALWYx-ZoNU82Z2Z28uH8ZsABvZFBGtMi55x6e386QBTbDsECZA@mail.gmail.com>
In-Reply-To: <CALWYx-ZoNU82Z2Z28uH8ZsABvZFBGtMi55x6e386QBTbDsECZA@mail.gmail.com>
From: Jim Shargo <jshargo@chromium.org>
Date: Fri, 28 Apr 2023 23:10:08 -0400
X-Gmail-Original-Message-ID: <CACmi3jE=6hj21yu2ZCyA_vn-0vY==BPNBfHrxVc+Hi-oq_Cpgw@mail.gmail.com>
Message-ID: <CACmi3jE=6hj21yu2ZCyA_vn-0vY==BPNBfHrxVc+Hi-oq_Cpgw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/vkms: Add support for multiple pipes
To: Brandon Ross Pollack <brpol@chromium.org>
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
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com, yixie@chromium.org,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 tzimmermann@suse.de, Marius Vlad <marius.vlad@collabora.com>,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey, all!

I am so excited to see other folks excited about extending VKMS. I
think it's a great project and has outstanding potential!

Life stuff made me AFK for the last few months, but I'm back now and
I've been wrapping up the work on the patchset Brandon linked.

The current WIP patches are here:
https://gitlab.freedesktop.org/jshargo/compositor-kernel-explorations/-/mer=
ge_requests/4

They even come with matching IGT tests!
https://gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/commit/8375cf128f081=
1d54ecb4a0b5cf044942ffc67b9

I'm hoping to send them out again soon, hopefully next week.

As a suggestion for how to move forward: the first three patches are
little refactors that are separable from the core ConfigFS ones (which
might have more back-and-forth design iterations). With those three,
the param you're adding should be easy to put on top. I can try to get
those out sooner for review.

What do you think?


On Thu, Apr 27, 2023 at 10:51=E2=80=AFPM Brandon Ross Pollack
<brpol@chromium.org> wrote:
>
> I'm adding the original offer of those changes.  We talked recently
> and they have the intent to push forward and merge them.  I'm still
> getting up to speed a bit, but I will probably have a stronger opinion
> by early next week.
>
>
> On Wed, Apr 26, 2023 at 9:54=E2=80=AFPM Marius Vlad <marius.vlad@collabor=
a.com> wrote:
> >
> > Hi Brandon, Xie,
> >
> > Thanks for reaching out, and for the heads-up. I need to take a closer
> > look, but by glancing over it, using configFS would be really awesome.
> > Think we could really benefit from having that in our CI and being able
> > to customize the entire pipeline. I'm totally for that.
> >
> > It looks like it requires some infra work so I guess landing that might
> > require quite a bit of time. Not sure if there are recent updates for i=
t.
> >
> > My changes are quite trivial and much more focused on just having
> > multiple virtual displays, so IDK, I've submitted a version that seems
> > to work, so I guess others should or would decide if we should drop min=
e
> > and focus on the configFS series, or we should go with configFS as a
> > follow-up. Would have liked to get something in the tree so we can at
> > least have something to work with.
> >
> > Thoughts on the matter on how should we go about it?
> >
> > On 4/26/23 05:06, Brandon Ross Pollack wrote:
> > > We're doing/planning on doing similar or related work here at chromiu=
m.
> > >
> > > https://patchwork.kernel.org/project/dri-devel/list/?series=3D662676&=
submitter=3D&state=3D&q=3D&delegate=3D&archive=3Dboth <https://patchwork.ke=
rnel.org/project/dri-devel/list/?series=3D662676&submitter=3D&state=3D&q=3D=
&delegate=3D&archive=3Dboth>
> > >
> > > Here's the stuff we have now (we're currently rebasing and touching i=
t
> > > up, myself and @Yi Xie <mailto:yixie@google.com> will be taking over
> > > this work.
> > >
> > > Our plans are to add configFS changes and DRI VKMS changes to be able=
 to
> > > add and remove virtual displays at runtime (among other things needed
> > > for our own testing purposes for our Exo wayland implementation).
> > >
> > > We're still learning how this all works and comes together, but it is
> > > worth letting you know "us too"
> > >
> > > We can chat more and see where we overlap and can learn from each oth=
er :)
> > >
> > > On Tue, Apr 25, 2023 at 4:30=E2=80=AFPM Marius Vlad <marius.vlad@coll=
abora.com
> > > <mailto:marius.vlad@collabora.com>> wrote:
> > >
> > >     With multiple pipe available we can perform management of outputs=
 at
> > >     a more granular level, such that we're able to turn off or on sev=
eral
> > >     outputs at a time, or combinations that arise from doing that.
> > >
> > >     The Weston project use VKMS when running its test suite in CI, an=
d we
> > >     have now uses cases which would need to ability to set-up the out=
puts
> > >     DPMS/state individually, rather than globally -- which would affe=
ct all
> > >     outputs. This an attempt on fixing that by giving the possibility=
 to
> > >     create more than one pipe, and thus allowing to run tests that co=
uld
> > >     exercise code paths in the compositor related to management of ou=
tputs.
> > >
> > >     v3:
> > >        - Apply the series against drm-misc-next (Ma=C3=ADra Canal)
> > >        - Add a lower range check to avoid passing negative values to
> > >        max_pipes (Ma=C3=ADra Canal)
> > >
> > >     v2:
> > >        - Replace 'outputs' with 'pipes' as to use the proper terminol=
ogy
> > >          (Thomas Zimmermann, Ma=C3=ADra Canal)
> > >        - Fixed passing wrong possible_crtc bitmask when initializing =
the
> > >          write back connector which address kms_writeback failure (Ma=
=C3=ADra
> > >     Canal)
> > >        - Add a feat. note about moving overlay planes between CRTCs
> > >     (Melissa Wen)
> > >
> > >     Marius Vlad (3):
> > >        vkms: Pass the correct bitmask for possible crtcs
> > >        vkms: Add support for multiple pipes
> > >        Documentation/gpu/vkms.rst: Added a note about plane migration
> > >
> > >       Documentation/gpu/vkms.rst            |  5 +++--
> > >       drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
> > >       drivers/gpu/drm/vkms/vkms_drv.c       | 31 ++++++++++++++++++++=
+------
> > >       drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++++---
> > >       drivers/gpu/drm/vkms/vkms_output.c    |  7 +++---
> > >       drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++----------=
-
> > >       6 files changed, 53 insertions(+), 29 deletions(-)
> > >
> > >     --
> > >     2.39.2
> > >
