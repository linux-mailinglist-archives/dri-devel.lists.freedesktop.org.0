Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA876F1088
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D03310E376;
	Fri, 28 Apr 2023 02:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F54610EC49
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 02:51:32 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so7433173e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682650290; x=1685242290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+a7t7bYdubbCs06sWQEIres1nE+7iY6p+mgkpz9+kQ=;
 b=B9/53MXWla6W6NE1l+IG/RBNTaKUFK1XOTUC1d7mGDhQKnw5KdDso2cF8uZPsVdZK8
 iNDn9khoVwjTseHBwuoybWE2VNK5TWalhdFCAP5pddqZM6vZ9QIhVKZXS9wRIjrDhmwT
 P4rBXbLepLlBgdHCIdDONp7pP3lkc/Nw8g5r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682650290; x=1685242290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+a7t7bYdubbCs06sWQEIres1nE+7iY6p+mgkpz9+kQ=;
 b=BGm0bEvtYMOXbFt3Tki+43fuBvYDwuP4K66liD1yTD9YkNfKGZyq+J8QFixXpjHzPn
 K+EsHuXgbVWzglFgUxHFzZXmtDjKjpVAVpKbvfjtg98YdRsyeuEujCOnci/SA9L1Xuw2
 eZ7sK9glGBqNi0NObdIwN5KpK6MXxuvWBp7Bsps+DbrCCjYaehznDs5QzsmlLSP2DJHn
 ZS0mzmB/YtWAE3vPiudYq0qEfUPXHgbwAQjGRudYZbCHYF1y4AONEs8LofV0ToyQ5RkB
 xFb6r3KbgMxwNOOinNfPVaYFXyQ/VCGnt0TJhiPjCD3Ue73UZy+RmWX1iqjD9QUWeuTI
 5y9A==
X-Gm-Message-State: AC+VfDwZut5eLVZVhp6Konvua2EG9EUac/RCzohRXn0KZHedYnI6dAf2
 rHGKY8usXqoKKR1waIujQWKYElvIWUyRUsTEwvc=
X-Google-Smtp-Source: ACHHUZ457laWT10IIaPRFEv+vKvqTtNI223XWmlajlOUflt/9Epb1THXHayznINKzav4TVAWGGlYdg==
X-Received: by 2002:a2e:9d4a:0:b0:2a7:6b40:7ea2 with SMTP id
 y10-20020a2e9d4a000000b002a76b407ea2mr1063839ljj.14.1682650289907; 
 Thu, 27 Apr 2023 19:51:29 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 q4-20020a2e84c4000000b002a9ee18e9c7sm2891184ljh.69.2023.04.27.19.51.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 19:51:29 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4edc63e066fso15797e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:51:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3c8d:b0:4ed:b131:3449 with SMTP id
 h13-20020a0565123c8d00b004edb1313449mr71928lfv.7.1682650288277; Thu, 27 Apr
 2023 19:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230425073012.11036-1-marius.vlad@collabora.com>
 <CALWYx-a90Zee0_js5h=53bxsN-BXxumiGid-qc=9405ZkUE-gg@mail.gmail.com>
 <a2239e16-31e8-3163-b349-8fc3328f33ed@collabora.com>
In-Reply-To: <a2239e16-31e8-3163-b349-8fc3328f33ed@collabora.com>
From: Brandon Ross Pollack <brpol@chromium.org>
Date: Fri, 28 Apr 2023 11:51:16 +0900
X-Gmail-Original-Message-ID: <CALWYx-ZoNU82Z2Z28uH8ZsABvZFBGtMi55x6e386QBTbDsECZA@mail.gmail.com>
Message-ID: <CALWYx-ZoNU82Z2Z28uH8ZsABvZFBGtMi55x6e386QBTbDsECZA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/vkms: Add support for multiple pipes
To: Marius Vlad <marius.vlad@collabora.com>, Jim Shargo <jshargo@google.com>
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
 tzimmermann@suse.de, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm adding the original offer of those changes.  We talked recently
and they have the intent to push forward and merge them.  I'm still
getting up to speed a bit, but I will probably have a stronger opinion
by early next week.


On Wed, Apr 26, 2023 at 9:54=E2=80=AFPM Marius Vlad <marius.vlad@collabora.=
com> wrote:
>
> Hi Brandon, Xie,
>
> Thanks for reaching out, and for the heads-up. I need to take a closer
> look, but by glancing over it, using configFS would be really awesome.
> Think we could really benefit from having that in our CI and being able
> to customize the entire pipeline. I'm totally for that.
>
> It looks like it requires some infra work so I guess landing that might
> require quite a bit of time. Not sure if there are recent updates for it.
>
> My changes are quite trivial and much more focused on just having
> multiple virtual displays, so IDK, I've submitted a version that seems
> to work, so I guess others should or would decide if we should drop mine
> and focus on the configFS series, or we should go with configFS as a
> follow-up. Would have liked to get something in the tree so we can at
> least have something to work with.
>
> Thoughts on the matter on how should we go about it?
>
> On 4/26/23 05:06, Brandon Ross Pollack wrote:
> > We're doing/planning on doing similar or related work here at chromium.
> >
> > https://patchwork.kernel.org/project/dri-devel/list/?series=3D662676&su=
bmitter=3D&state=3D&q=3D&delegate=3D&archive=3Dboth <https://patchwork.kern=
el.org/project/dri-devel/list/?series=3D662676&submitter=3D&state=3D&q=3D&d=
elegate=3D&archive=3Dboth>
> >
> > Here's the stuff we have now (we're currently rebasing and touching it
> > up, myself and @Yi Xie <mailto:yixie@google.com> will be taking over
> > this work.
> >
> > Our plans are to add configFS changes and DRI VKMS changes to be able t=
o
> > add and remove virtual displays at runtime (among other things needed
> > for our own testing purposes for our Exo wayland implementation).
> >
> > We're still learning how this all works and comes together, but it is
> > worth letting you know "us too"
> >
> > We can chat more and see where we overlap and can learn from each other=
 :)
> >
> > On Tue, Apr 25, 2023 at 4:30=E2=80=AFPM Marius Vlad <marius.vlad@collab=
ora.com
> > <mailto:marius.vlad@collabora.com>> wrote:
> >
> >     With multiple pipe available we can perform management of outputs a=
t
> >     a more granular level, such that we're able to turn off or on sever=
al
> >     outputs at a time, or combinations that arise from doing that.
> >
> >     The Weston project use VKMS when running its test suite in CI, and =
we
> >     have now uses cases which would need to ability to set-up the outpu=
ts
> >     DPMS/state individually, rather than globally -- which would affect=
 all
> >     outputs. This an attempt on fixing that by giving the possibility t=
o
> >     create more than one pipe, and thus allowing to run tests that coul=
d
> >     exercise code paths in the compositor related to management of outp=
uts.
> >
> >     v3:
> >        - Apply the series against drm-misc-next (Ma=C3=ADra Canal)
> >        - Add a lower range check to avoid passing negative values to
> >        max_pipes (Ma=C3=ADra Canal)
> >
> >     v2:
> >        - Replace 'outputs' with 'pipes' as to use the proper terminolog=
y
> >          (Thomas Zimmermann, Ma=C3=ADra Canal)
> >        - Fixed passing wrong possible_crtc bitmask when initializing th=
e
> >          write back connector which address kms_writeback failure (Ma=
=C3=ADra
> >     Canal)
> >        - Add a feat. note about moving overlay planes between CRTCs
> >     (Melissa Wen)
> >
> >     Marius Vlad (3):
> >        vkms: Pass the correct bitmask for possible crtcs
> >        vkms: Add support for multiple pipes
> >        Documentation/gpu/vkms.rst: Added a note about plane migration
> >
> >       Documentation/gpu/vkms.rst            |  5 +++--
> >       drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
> >       drivers/gpu/drm/vkms/vkms_drv.c       | 31 +++++++++++++++++++++-=
-----
> >       drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++++---
> >       drivers/gpu/drm/vkms/vkms_output.c    |  7 +++---
> >       drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++-----------
> >       6 files changed, 53 insertions(+), 29 deletions(-)
> >
> >     --
> >     2.39.2
> >
