Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454F9D90F4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 05:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE8910E06B;
	Tue, 26 Nov 2024 04:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uQTECpwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F94610E06B;
 Tue, 26 Nov 2024 04:13:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F33D25C5CA1;
 Tue, 26 Nov 2024 04:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533CC4CED8;
 Tue, 26 Nov 2024 04:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732594392;
 bh=wvE1j6jYlustZGPgO4za1DJpvm8S+eQ4rSParDa6Lgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uQTECpwGCtXvgW65bmiUP/yGxJvz0r7mVGsCCqF/XcRfiIuZv42jYE+QPSuePckeG
 dVbnsZ00LE3d97xJR0ePFq8U2Yna8qZuuLQRvwb8eQI1wxd3k/KmMWjdEoDku2wqsM
 5TBjzWODkEd91uKinwhXClwNwOgrMStAMcYizAy7nilQEqoHOb5j+YoNl+se83vScv
 +42ovPaLlv1+IrKOuv6MgCjlDvHiXubKEt15Twjb9yqSSaQbJexzFs2nkEel1m063j
 NmiD8mcuO+uw07c8qlCBNtJ2U/ke+no1KjokLVaCPMMy7AyeXY4qgL1/BNNqPb5+Jm
 gINg2xT+7LbPQ==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53dde4f0f23so2304927e87.3; 
 Mon, 25 Nov 2024 20:13:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWyogsCnfoBU2DfHiiVdY33VoRoThvAAXY7ruB05L7N5mMCgAUFplmcb89+PCBenqYQwC0p0SOZI8I=@lists.freedesktop.org,
 AJvYcCXuomtRMrCF6K6MFG5QNDBcuRYoKRBWaTvj1/k1cKZeD0UrL93gabQD98nE/LYGLlCByq+jYitzyUn9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9cTx8EN1MXu/KtlUnRgV6bKUgfC8vre7h9ck69+yiAVWPjUOo
 eiPdRAYnSAP7u2nYoQfe9zkW5skrbHkjeQYgqL6Mr1HkEx89RoaiBwkUhxTbE77EdiOQC3Fk8E0
 a31RSb1lYpt5xqDmh9kDocYokz4I=
X-Google-Smtp-Source: AGHT+IGax4HC8zIQqLB8xrI0moZd82uV5VPNJpszQ12dMOodNR4A+EElpdPN8bJ83seoA/fkNz8n4WUh6BTdRHvKAZE=
X-Received: by 2002:a05:6512:b86:b0:53d:d0f0:ad0d with SMTP id
 2adb3069b0e04-53dd39b55bemr7255517e87.46.1732594390702; Mon, 25 Nov 2024
 20:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
 <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
 <20241122204157.GA125569@pevik>
In-Reply-To: <20241122204157.GA125569@pevik>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 13:12:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDWAw6Yo9HdO-Sba=G_bohr_0uXuKtgNZSr1YLeQE2ug@mail.gmail.com>
Message-ID: <CAK7LNARDWAw6Yo9HdO-Sba=G_bohr_0uXuKtgNZSr1YLeQE2ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, Nov 23, 2024 at 5:42=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Thu, Nov 21, 2024 at 10:49=E2=80=AFAM Rob Clark <robdclark@gmail.com=
> wrote:
>
> > > On Wed, Nov 20, 2024 at 5:17=E2=80=AFPM Petr Vorel <pvorel@suse.cz> w=
rote:
>
> > > > > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.c=
z> wrote:
>
> > > > > > It will be used in the next commit for DRM_MSM.
>
> > > > > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > > > > ---
> > > > > > Changes v3->v4:
> > > > > > * Move definition to the end of the file
>
>
> > > > > I prefer to not check the tool.
>
> > > > Ack.
>
> > > > > Why don't you install python3?
>
> > > > Everybody installs it when it's required, the question is how to in=
form about
> > > > the dependency.
>
> > > > There build environments are minimal environments:
> > > > * chroot (e.g. cross compilation)
> > > > * container
>
> > > > These are used by both developers and distros.
>
> > > I don't think py3 is an _onerous_ dependency, but it has come up as a
> > > surprise in minimal distro build environments at least once.. so I'd
> > > be a fan of surfacing this dependency in a predictable/understandable
> > > way (ie. I'm in favor of this patchset)
>
>
> > "once" is a keyword here.
>
> > "/bin/sh: python3: not found" provides sufficient information
> > about why the compilation failed, and you know what to do
> > to fix the problem.
> > This is good.
>
> > If you hide CONFIG_DRM_MSM silently
> > due to missing python3, you may scratch your head
> > "why drm/msm was not compiled?".
> It's not on the list, but still visible in help (via search).
>
> > This is worse.
>
> I'm ok with this being refused. Yes, it's a trivial thing to find that py=
thon3
> is not installed. I wasn't sure myself if this is really better. Having
> something like "requires $(PYTHON3)" would be best solution (e.g. not dis=
able
> the config, but exit before starting to build), but of course unless this
> feature is needed for many modules it does not make sense to have it.
> It's because kernel mostly contains everything (unless languages like pyt=
hon
> or any other dependency starts to be added). For this reason I like that
> mconf-cfg.sh warns when missing ncurses devel files (even suggesting pack=
age
> names).
>
> Just to explain what was my motivation. CONFIG_DRM_MSM in in arm64 defcon=
fig,
> thus it will affect anybody who uses the defconfig (any distro will need =
to add
> it).


arch/arm64/configs/defconfig is a multi-platform config.

If CONFIG_DRM_MSM exists in arch/arm64/configs/defconfig
and if you want to build arm64 defconfig, you need to install
all necessary tools for that.



>
> It's needed only for Qualcomm arm64 devices only. But only for these devi=
ces
> which are mainlined enough to really use CONFIG_DRM_MSM (many of them are=
n't in
> that state).
>
> postmarketOS is the distribution which supports Qualcomm. It stores kerne=
l
> config for each device and devices often have individual maintainer. E.g.=
 175x
> "once" :).


If you do not want to be bothered by unnecessary drivers,
you need to disable the relevant CONFIG option.
(e.g, scripts/config -d  CONFIG_DRM_MSM)


This is the standard way we have for many years.



--
Best Regards
Masahiro Yamada
