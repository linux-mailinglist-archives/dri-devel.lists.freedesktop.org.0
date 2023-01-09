Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDF662C50
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 18:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4C810E4C0;
	Mon,  9 Jan 2023 17:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D5F10E4BF;
 Mon,  9 Jan 2023 17:11:01 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.190])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B36893EF10;
 Mon,  9 Jan 2023 18:10:56 +0100 (CET)
Date: Mon, 9 Jan 2023 18:10:52 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Message-ID: <20230109171052.wa43fccjh3f6wype@SoMainline.org>
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
 <20230109083417.5drdfllpm4ythy42@SoMainline.org>
 <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-09 11:22:42, Dmitry Baryshkov wrote:
> On Mon, 9 Jan 2023 at 10:34, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-01-08 23:11:13, Dmitry Baryshkov wrote:
> > > Different entries into the catalog were added quite randomly. Enforce
> > > the sorting order of some kind. It is not alphabetic to prevent the
> > > patch from growing uncontrollably.
> >
> > Why not sort these chronologically based on DPU hardware revision in the
> > match table at the end of this file?
> 
> If we keep the SoC name as part of the symbolic name, we will end up
> in another semi-random order that is a pain to verify. Would you
> remember that sm6350 comes between sm6115 and qcm2290? I would not :-(
> And changing all names to dpu_6_5_0_lms would make it easy to add but
> nearly impossible to follow.

Agreed, though I think having the version in there would make things
easier to follow.  Then everything uses the "lowest" version it is
compatible with, and we duplicate the structs when adding a feature that
is only available on newer (or older) revisions.

> > Regardless, this patch is going to
> > make it hard to properly rebase DPU additions; see for example patch 4/8
> > and 5/8 in my second round of DSC fixes.
> 
> Yes, quite unfortunate. As I wrote, it's already late to apply this patch :-(

At least we're working towards making things better, or at the very
least discussing the right way forward.

> > At the same time we should find a solution to the wishy-washy reuse of
> > structs and defines, which may appear the same initially but become
> > mismatched as more features are added (see how I had to split out
> > multiple of these in the INTF TE enablement series).
> 
> It's a slightly different problem, but yes, I share the pain.

It is quite relevant though, as sorting is very closely tied to what
structs we reuse where, considering what SoC name is used.  It is
typically "what was already there" but a "least common denominator"
would be more descriptive (e.g. based on hardware version).

> > > Thus SDM comes before SC and SM
> > > platforms and QCM is kept as the last one. There are no functional
> > > changes in this patch.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >
> > > Yes, I hate such mass-moves too. However the entries in this file are
> > > slowly becoming uncontrollable. Let's enforce some order now (while it's
> > > late already, but not _that_ late).
> >
> > I agree that something should happen, contributing to this file is
> > unnecessarily tough.
> 
> In the IRC conversation Rob suggested playing with includes, but I
> don't see a good way to implement that.

That would be nice; especially if we accept struct duplication (instead
of recursively including "earlier" versions where needed, as mentioned
in IRC that'll spiral out of control).  With that one can easily diff
two include files and understand the differences between SoCs and/or DPU
hardware revisions (or notice whether a certain configuration might be
missing/extraneous).

- Marijn
