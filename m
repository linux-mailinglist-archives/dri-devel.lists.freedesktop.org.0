Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69373CF9A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 10:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE8710E140;
	Sun, 25 Jun 2023 08:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFAD10E140
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 08:58:30 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-bfe6ea01ff5so2199779276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 01:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687683509; x=1690275509;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cHMiEoYUk1oN3PyFm+FVXDksw84RMCEjXqcP8Z1moHU=;
 b=ZJXhu9KT3tBRfffKadlv9JiIhV13PEbXDAbfRv3h8v6+p7NNphIp7DUXtzcIiJ5VYb
 Uj3rNleKJkL/SAjCkeJilOAGhTsAcRsuAR/0A1pCxE33eoLAP25vtqOyuii/xyA2AgoG
 aCwNUHCtk5fvyRNgdWXvPRWPVByjlqNVRSgfIsrNi3hckPad6Svebz1NEZJA/eb0CXmA
 UaN7lml8kURCt/bWd/UtXeQd5aijdmQ/C2NhcvLsqF64D8l5zelI1jx223TubanTyfbl
 hfHrjuOYqISaMVGBJKTLTN3fNm1Mu+7MRD5filitZwwvZkLYYJNwinLMVaZj4FBaoBVL
 sFVA==
X-Gm-Message-State: AC+VfDxU/7+Dw6k1ylmN9eJQcUoC7f1sfFeHB/sCfwU4sPZwMUy7JkQM
 UaH6/fIs8Vj9/BRJX2e2StngCRsIsBJ8CA==
X-Google-Smtp-Source: ACHHUZ6nsdAaukJc2LJHYFzLNqDaKcvC8lVWOfmdddkl/a8MTTc0UzEc4UOVUjAQUaS8JIPb77Fi6w==
X-Received: by 2002:a25:9c82:0:b0:c18:1300:6335 with SMTP id
 y2-20020a259c82000000b00c1813006335mr2000712ybo.35.1687683509403; 
 Sun, 25 Jun 2023 01:58:29 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 k81-20020a252454000000b00bad03cb9325sm672240ybk.32.2023.06.25.01.58.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 01:58:29 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so2204638276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 01:58:28 -0700 (PDT)
X-Received: by 2002:a25:1407:0:b0:b9e:e5b:14ab with SMTP id
 7-20020a251407000000b00b9e0e5b14abmr19307303ybu.55.1687683508805; Sun, 25 Jun
 2023 01:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687423204.git.geert+renesas@glider.be>
 <95c2af42a89c65ca603126e56c0423407dfc873f.1687423204.git.geert+renesas@glider.be>
 <20230623165038.GB2112@pendragon.ideasonboard.com>
 <CAMuHMdWsDHMn4P1g_EYKzXyisUOnhJ0Q1Nd5Wq9H_CwPvaSaWw@mail.gmail.com>
 <20230623185052.GR2112@pendragon.ideasonboard.com>
In-Reply-To: <20230623185052.GR2112@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 10:58:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdeRODcAa26EKuvR3yca0hVqSUR6WBHEtr9+RBKyk_Ow@mail.gmail.com>
Message-ID: <CAMuHMdWdeRODcAa26EKuvR3yca0hVqSUR6WBHEtr9+RBKyk_Ow@mail.gmail.com>
Subject: Re: [PATCH 24/39] drm: renesas: shmobile: Unify plane allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 23, 2023 at 8:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 23, 2023 at 07:55:22PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 23, 2023 at 6:50=E2=80=AFPM Laurent Pinchart wrote:
> > > On Thu, Jun 22, 2023 at 11:21:36AM +0200, Geert Uytterhoeven wrote:
> > > > Unify primary and overlay plane allocation:
> > > >   - Enhance shmob_drm_plane_create() so it can be used to create th=
e
> > > >     primary plane, too,
> > > >   - Move overlay plane creation next to primary plane creation.
> > > >
> > > > As overlay plane index zero now means the primary plane, this requi=
res
> > > > shifting all overlay plane indices by one.
> > >
> > > Do you use index zero to identify the primary plane just for
> > > shmob_drm_plane_create(), or somewhere else too ? If it's just to cre=
ate
> > > the plane, you could instead pass the plane type to the function.
> >
> > Index zero is just used for the creation.
> > I guess this sort of goes together with my question below...
> >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Perhaps it would be better to not use dynamic allocation, but store
> > > > "struct drm_plane primary" and "struct shmob_drm_plane planes[5]" i=
n
> > > > struct drm_shmob_device instead, like is done for the crtc and enco=
der?
> >
> > ... as embedding separate primary and planes[] would also get rid of
> > the need to adjust the plane indices when converting from logical to ph=
ysical
> > overlay plane indices.
>
> Do they need to be embedded for that, or could you simple keep the index
> as it is ?

If the plane type would be passed explicitly, they would not need to be
embedded for that.

Then the question becomes: does it make sense to unify primary and
overlay plane handling?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
