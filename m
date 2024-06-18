Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2890E037
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEBE10E02A;
	Tue, 18 Jun 2024 23:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ss9hO6ss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9AA10E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:53:03 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3d518cdb252so452301b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718754782; x=1719359582;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSMpbX3YjY+n1K6XdU7KZ18fAHLxIUowLHHewo9pUPw=;
 b=Ss9hO6ssmSwCWK2cnrVmBuRsXfEWhQPdM4z0OO9SqUPTgpuEqDtRFNYEmQqtprrnOp
 iO3urByfbWwb35+6nkyuNx+yLLvoUJc1hxogDyovJTElJfaLe4vyT4kCo+OIK4O6J7VC
 GduFyhd0TEow25vJvL9JNOKe0P0EviaabHYPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718754782; x=1719359582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSMpbX3YjY+n1K6XdU7KZ18fAHLxIUowLHHewo9pUPw=;
 b=wgqT1Na2+sCTJi+56ZB0kN0JreSHa8tiziEGK+tsBLGj/pHWbLrPk1b/Pxyb3B5iTE
 dZPCT7XMc2fwE2L+smAFSAXDz/HbQR6j4ZYwNfab0Y5T00oUiv1cXyvCLInASFTI1qUz
 NZQH+aulSRKUe01oFpd2Q2p29bfibB7utoW/l+uaEy43a5ZUs6Hkx71xR5vdpy/tLY4/
 cYRdRucsS3QZnb6HMXgk6Vi4epSKtw/Nj3pOl0yfkWAYxPBxErGn7X5bXDxI4eb5Rrkm
 diHqdzDQvbDeOV+mc455B23Ep37mZY5pjwjduneSYUkQyQTu2gI9rkwY4NBmScqra7Yq
 EcZw==
X-Gm-Message-State: AOJu0YzU6Urfj4NDYncorFFMCljc5zEfk7Ren9rMlyfwEqnoxlxRLKJX
 5/1Ee1L60jr4gSfcrxURVNCRIvC3uWwiTA5V1RrQ0n01O3bdR1l3fhhgx1bwyD+h0sRRuuGkedg
 =
X-Google-Smtp-Source: AGHT+IFcmO94JeLsvjWFpd7CTWjcBJ38P11F4D2NlCc/Hunsm4xG5dIB8A8P7jdO584fohbWRlnwgA==
X-Received: by 2002:a05:6808:2225:b0:3d2:cba0:f902 with SMTP id
 5614622812f47-3d51b9ba000mr1213139b6e.25.1718754782145; 
 Tue, 18 Jun 2024 16:53:02 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798c0342aa0sm547379885a.76.2024.06.18.16.53.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 16:53:02 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44056f72257so149781cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:53:01 -0700 (PDT)
X-Received: by 2002:a05:622a:14cc:b0:444:9ac8:7 with SMTP id
 d75a77b69052e-444a8e53305mr1522311cf.16.1718754781471; Tue, 18 Jun 2024
 16:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
 <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
 <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
In-Reply-To: <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 16:52:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
Message-ID: <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Candice Li <candice.li@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Victor Lu <victorchengchi.lu@amd.com>, amd-gfx@lists.freedesktop.org, 
 chenxuebing <chenxb_99091@126.com>, linux-kernel@vger.kernel.org
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

On Tue, Jun 18, 2024 at 3:00=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Jun 18, 2024 at 5:40=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> >
> > On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> > >
> > > On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <dianders@ch=
romium.org> wrote:
> > > >
> > > > Based on grepping through the source code this driver appears to be
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > > time. Among other things, this means that if a panel is in use that=
 it
> > > > won't be cleanly powered off at system shutdown time.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se
> > > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > > instance overview" in drm_drv.c.
> > > >
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > > This commit is only compile-time tested.
> > > >
> > > > ...and further, I'd say that this patch is more of a plea for help
> > > > than a patch I think is actually right. I'm _fairly_ certain that
> > > > drm/amdgpu needs this call at shutdown time but the logic is a bit
> > > > hard for me to follow. I'd appreciate if anyone who actually knows
> > > > what this should look like could illuminate me, or perhaps even jus=
t
> > > > post a patch themselves!
> > >
> > > I'm not sure this patch makes sense or not.  The driver doesn't reall=
y
> > > do a formal tear down in its shutdown routine, it just quiesces the
> > > hardware.  What are the actual requirements of the shutdown function?
> > > In the past when we did a full driver tear down in shutdown, it
> > > delayed the shutdown sequence and users complained.
> >
> > The "inspiration" for this patch is to handle panels properly.
> > Specifically, panels often have several power/enable signals going to
> > them and often have requirements that these signals are powered off in
> > the proper order with the proper delays between them. While we can't
> > always do so when the system crashes / reboots in an uncontrolled way,
> > panel manufacturers / HW Engineers get upset if we don't power things
> > off properly during an orderly shutdown/reboot. When panels are
> > powered off badly it can cause garbage on the screen and, so I've been
> > told, can even cause long term damage to the panels over time.
> >
> > In Linux, some panel drivers have tried to ensure a proper poweroff of
> > the panel by handling the shutdown() call themselves. However, this is
> > ugly and panel maintainers want panel drivers to stop doing it. We
> > have removed the code doing this from most panels now [1]. Instead the
> > assumption is that the DRM modeset drivers should be calling
> > drm_atomic_helper_shutdown() which will make sure panels get an
> > orderly shutdown.
> >
> > For a lot more details, see the cover letter [2] which then contains
> > links to even more discussions about the topic.
> >
> > [1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@chromiu=
m.org
> > [2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders@chromiu=
m.org
>
> I don't think it's an issue.  We quiesce the hardware as if we were
> about to suspend the system (e.g., S3).  For the display hardware we
> call drm_atomic_helper_suspend() as part of that sequence.

OK. It's no skin off my teeth and we can drop this patch if you're
convinced it's not needed. From the point of view of someone who has
no experience with this driver it seems weird to me that it would use
drm_atomic_helper_suspend() at shutdown time instead of the documented
drm_atomic_helper_shutdown(), but if it works for everyone then I'm
not gonna complain.

-Doug
