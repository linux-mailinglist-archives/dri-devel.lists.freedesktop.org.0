Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E8B698F3E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 10:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF85E10EB81;
	Thu, 16 Feb 2023 09:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F2410E347;
 Thu, 16 Feb 2023 09:04:11 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7E2D220417;
 Thu, 16 Feb 2023 10:04:09 +0100 (CET)
Date: Thu, 16 Feb 2023 10:04:08 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] drm/msm/dpu: Initialize SSPP scaler version (from
 register read)
Message-ID: <20230216090408.caekj2t2x6asb2jk@SoMainline.org>
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <CAA8EJpqL-Vsq7dbK7tfJAGgg2_nV463QYv5zgvRLx_8T2bsXxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqL-Vsq7dbK7tfJAGgg2_nV463QYv5zgvRLx_8T2bsXxA@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-16 05:02:32, Dmitry Baryshkov wrote:
> On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > Random inspection of the SSPP code surfaced that the version field of
> > dpu_scaler_blk was never assigned in the catalog, resulting in wrong
> > codepaths to be taken within dpu_hw_setup_scaler3 based on a 0 version.
> > Rectify this by reading an accurate value from a register (that is not
> > equal to the values represented by DPU_SSPP_SCALER_QSEEDx enum
> > variants) and deleting dead code around QSEED versioning.
> >
> > Future changes should likely get rid of the distinction between QSEED3
> > and up, as these are now purely determined from the register value.
> > Furthermore implementations could look at the scaler subblk .id field
> > rather than the SSPP feature bits, which currently hold redundant
> > information.
> >
> > ---
> > Marijn Suijten (3):
> >       drm/msm/dpu: Read previously-uninitialized SSPP scaler version from hw
> >       drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
> >       drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps
> 
> The cleanup looks good. However as you are on it, maybe you can also
> add patch 4, dropping DPU_SSPP_SCALER_QSEED3LITE and
> DPU_SSPP_SCALER_QSEED4 in favour of using QSEED3 for all these
> scalers?

I surely can!  Do you mind if I rename it to QSEED3_AND_UP for clarity?
How about the second question, dropping this redundant information from
the SSPP feature flags and only looking at the scaler_blk.id?

> As we are going to use scaler_version to distinguish between
> them, it would be logical not to duplicate that bit of information
> (not to mention all the possible troubles if scaler_version disagrees
> with the sblk->scaler_blk.id).

Note that we had a similar discussion for UBWC HW decoder version and it
was decided to go the opposite route [1].  That may have been for
technical reasons (unclocked register access), but it's an inconsistent
approach to say the least.

[1]: https://lore.kernel.org/linux-arm-msm/71f96910-e7b1-92f9-ae15-79bd1da40a0d@quicinc.com/

- Marijn
