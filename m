Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A361270CDB2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C5F10E2C1;
	Mon, 22 May 2023 22:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFD710E2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:19:01 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A8B913EAF5;
 Tue, 23 May 2023 00:18:59 +0200 (CEST)
Date: Tue, 23 May 2023 00:18:58 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Message-ID: <dfezntyt7rfoqmmhpqwqzgbldzgki5ykeqizgig7t3gqwdzo6h@3xavmyqzxzjm>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
 <a93c3c36-f262-b89d-8452-98120cffb491@quicinc.com>
 <CAA8EJpqzj-_fVLXfCrLeTUcwPHE-fb-kNP=SgbVM7U5fQT8p-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqzj-_fVLXfCrLeTUcwPHE-fb-kNP=SgbVM7U5fQT8p-w@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-23 01:14:40, Dmitry Baryshkov wrote:
> On Tue, 23 May 2023 at 00:45, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> >
> >
> > On 5/22/2023 1:44 PM, Marijn Suijten wrote:
> > > On 2023-05-22 13:30:20, Jessica Zhang wrote:
> > >> Currently, when compression is enabled, hdisplay is reduced via integer
> > >> division. This causes issues for modes where the original hdisplay is
> > >> not a multiple of 3.
> > >>
> > >> To fix this, use DIV_ROUND_UP to divide hdisplay.
> > >>
> > >> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >
> > > Nit: probably these should go in the opposite order.  And if they're
> > > all supposed to be chronological, I think it is:
> > >
> > >      Suggested-by:
> > >      Fixes:
> > >      Signed-off-by:
> > >      Reviewed-by:
> > >
> > > But unsure if that's a hard requirement, or even correct at all.
> >
> > Hi Marijn,
> >
> > I don't see any explicit documentation on the order of R-b tags. FWIW, I
> > see in the git log that S-o-b always goes at the bottom of the commit
> > message.
> >
> > I would prefer the S-o-b to always be at the bottom (as it helps me
> > avoid duplicate S-o-b's when doing `git commit -s`), though I can flip
> > the order of the R-b and suggested-by tags.
> 
> I'd second Jessica here. Consider these tags as a history or a transcript:
> 
> I would not vote on the particular order of the Suggested-by/Fixes
> tags, I don't think that is important. These come first. Then the
> patch goes through different cycles. of reviews, which gain
> Reviewed-by tags.
> 
> In the same way Link/Patchwork/whatever other tags are added in the
> historical order.
> 
> By having the submitter's S-o-b at the bottom, the submitter adds the
> final signature under everything else being stated/recorded.

Correct, so the s-o-b can always be kept / moved back to the bottom on a
resend, stating that they sign off on "all that was written previously"
including picking up reviews.

However, for the rest of your reply about "history / transcript", you
seem to agree exactly with my point of keeping (or rather, simply
appending) these in chronological order?

- Marijn

> 
> Of course, in a more complicated story, there might be other
> developers taking part (Co-Developed-By + Signed-off-by), etc.
> 
> Note: all described is just my perception and might differ from the
> BCP regarding the tags.

<snip>
