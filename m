Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C308666644
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9310E2C8;
	Wed, 11 Jan 2023 22:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D957A10E2C4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:33:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7731D3EEF4;
 Wed, 11 Jan 2023 23:33:06 +0100 (CET)
Date: Wed, 11 Jan 2023 23:33:05 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Message-ID: <20230111223305.hrullhtvtpkrxgfq@SoMainline.org>
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
 <20230109083417.5drdfllpm4ythy42@SoMainline.org>
 <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
 <20230109171052.wa43fccjh3f6wype@SoMainline.org>
 <91254914-39a1-d11c-5e53-b35448253e22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91254914-39a1-d11c-5e53-b35448253e22@linaro.org>
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

On 2023-01-09 20:30:01, Dmitry Baryshkov wrote:
<snip>
> The usual problem is that there are two dimensions: with each 
> generations there are new (and removed) features, but on the other hand 
> within each generation there are units that are feature-rich and the 
> ones that are feature-deprived. qcm2290, sm6115, etc.

Yes, in that case (as we currently already do) have to duplicate an
existing struct and give one of the two a new feature bit.

> >>>> Thus SDM comes before SC and SM
> >>>> platforms and QCM is kept as the last one. There are no functional
> >>>> changes in this patch.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>
> >>>> Yes, I hate such mass-moves too. However the entries in this file are
> >>>> slowly becoming uncontrollable. Let's enforce some order now (while it's
> >>>> late already, but not _that_ late).
> >>>
> >>> I agree that something should happen, contributing to this file is
> >>> unnecessarily tough.
> >>
> >> In the IRC conversation Rob suggested playing with includes, but I
> >> don't see a good way to implement that.
> > 
> > That would be nice; especially if we accept struct duplication (instead
> > of recursively including "earlier" versions where needed, as mentioned
> > in IRC that'll spiral out of control).  With that one can easily diff
> > two include files and understand the differences between SoCs and/or DPU
> > hardware revisions (or notice whether a certain configuration might be
> > missing/extraneous).
> 
> Let's see what kind of binary growth does it bring. In the end it well 
> might be that the compiler is smart enough.

Curious as well, it might overlap identical structs (identical byte
sequence) similar to string interning?

- Marijn
