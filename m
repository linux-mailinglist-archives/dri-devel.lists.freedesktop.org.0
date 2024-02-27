Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44286991D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 15:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89D510E6CB;
	Tue, 27 Feb 2024 14:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o+ZIqWP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F110E594;
 Tue, 27 Feb 2024 14:53:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8590CCE192E;
 Tue, 27 Feb 2024 14:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE1AC433C7;
 Tue, 27 Feb 2024 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709045590;
 bh=YlS+XLPkpbAB4xgj3+7khXh6HKkBzhmjNhKtEN3j9xw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o+ZIqWP2hpAAfsiYuOmt5JxabM8OEhtC/GyTaCjzvDEPL3/2n9i7cvRC/ML7XTEIw
 ADfHYc0jqxaiCOqcYPHJYZB+Obh6uQbGN6RJRN+mPDVAswyoIeO03Bhm+D8dB587Kx
 UkY3B3YyS0jPFOb7F81rZxHFFuipAbjVqXI3YpTmoVsvL4kSSEMu6A9dq0SRPBbSpn
 g0MWwv44NyZdjIk81sZt8qdWWof0z6YrayjoiTd1g93UJWZ2nQCt+WMk3P+68iVXue
 q+DzEKAjWbjcoxW1mnb1Mac80/jBEcGElBDS3pJ3dpCeFHAHGATzJ49IB13sf1xdQE
 7zP2FerHGWR5g==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d29111272eso22253221fa.0; 
 Tue, 27 Feb 2024 06:53:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVEIXpu7lQSR9u7tFUsnrk3fOJDZMUMss8Nnjk22pNxzUNzNFnLaGl5U4oL8XQMEqI0BUPw2e+KL8/7bacM2b3OB5PRjBY5AI3UYoqVvhOR/Rvt2PF9umwTt+CH2ToZQGJl6LulGpvt4vy8FbzCoPF+
X-Gm-Message-State: AOJu0YwKXxz5KSNBQhvbhEx0uToLBO4kDVCGRsLwMXryAIsPByWFvBKU
 FveZirL3K4Wfa1tWZ43PYflREinnmDJt/EIe0SneJsiv8yfv3OWOZe5IUEmmgvEYXuU9V3JYBub
 cMMHywlxsmxf3bK3JXBc5DquS/BY=
X-Google-Smtp-Source: AGHT+IFdU5+QVtAGPROXQ3gMPQ7H3jlS9Zb3pV4/rSiCMlShMF/7Qkq67XHHVbRlo7IYf5l0wDT+UNh7zTNTp0CQxA4=
X-Received: by 2002:a05:651c:2128:b0:2d2:3fac:5fdc with SMTP id
 a40-20020a05651c212800b002d23fac5fdcmr7612423ljq.10.1709045588717; Tue, 27
 Feb 2024 06:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
 <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
 <CAA8EJpqhjXjaKKhp3HGxpwN+fLnL9tC_T1ibpK4TVmgayeaQwg@mail.gmail.com>
In-Reply-To: <CAA8EJpqhjXjaKKhp3HGxpwN+fLnL9tC_T1ibpK4TVmgayeaQwg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Feb 2024 23:52:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTCNRQBG3DAFaMi4k4LUfoeU7q-JV4q8TLFqrD4YLSww@mail.gmail.com>
Message-ID: <CAK7LNASTCNRQBG3DAFaMi4k4LUfoeU7q-JV4q8TLFqrD4YLSww@mail.gmail.com>
Subject: Re: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, Feb 26, 2024 at 8:01=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 26 Feb 2024 at 08:33, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The driver might decide to put the _shipped files to the subdir.
> >
> >
> >
> > Please stop this sentence.
> >
> > This sounds like we are not learning.
> >
> > https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8=
ok+7-CQUN=3DfQ@mail.gmail.com/
> >
> >
> >
> >
> > > In such
> > > case the cmd_copy might fail because the destination directory is not
> > > present. Call mkdir -p to make sure that the destination directory is
> > > present.
> >
> >
> > There is no justification for this.
> >
> > If you need a single generated directory
> > (drivers/gpu/drm/msm/registers/, divers/gpu/drm/msm/generated/ or whate=
ver)
> > that should be super simple.
> >
> > Why does scripts/Makefile.lib need the modification?
>
> Could you please tell me how I should handle this?
> I was looking for a way to generate
> drivers/gpu/drm/msm/registers/foo.xml.h and then use it during
> compilation.
> In drivers/gpu/drm/msm/Makefile I added $(obj)/registers/foo.xml.h as
> a dependency to the corresponding object files and then added
> drivers/gpu/drm/msm/registers/foo.xml.h_shipped file.
> This way Kbuild/make will attempt to call cmd_copy to generate target
> file, which thanks to VPATH expansion boils down to `cat
> $(srctree)/$(src)/registers/foo.xml.h_shopped >
> $(obj)/registers/foo.xml.h`. However this breaks as there is no
> $(obj)/registers.
>



One simple solution is to use $(shell mkdir -p ...)
to create the output directory.

scripts/Makefile.build does a similar thing.



You can add the following to drivers/gpu/drm/msm/Makefile.



# Create output directory when CONFIG_DRM_MSM is defined.
# This avoids creating the output directory during 'make clean'
ifdef CONFIG_DRM_MSM
$(shell mkdir -p $(obj)/registers)
endif











--=20
Best Regards
Masahiro Yamada
