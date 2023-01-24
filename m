Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B55B1679680
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 12:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C0310E664;
	Tue, 24 Jan 2023 11:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE32C10E077
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 11:21:09 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id b1so13102191ybn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 03:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IU3DYpPA6oRQuTVTfrhplBDOkHixxEc4pPsrimOogEA=;
 b=yogG81zuajJjr5c1Veuwa+uwtkTY6Fz4jAICh4IgPn0Fa14aG3BVoPfxwgXIXtqL60
 FtdEFCp6IZJNGaf78ihEXyU1yIFD6juqd53HRM62+T6P6PW8sH1HthnSY31FBSmBb/j9
 Xxy6w0W/nqye8LJYN9xX9B/lt+YO1Qhxe+youf9UUbPNfCvTKfGrUhSnx5iLv2zlpKl4
 5Q/84eDqTAtMA7kZY5vptWdsRAto68q4oiMreYwIpEv8IiRLVm16fE67ZwwR1Gjh9DAf
 TgErCAGhck10s5nfwsWsO00DSbyZWcKPfIUqA7K6pCiNoGjIWRG9J2FQet9K8BBKhtUX
 bsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU3DYpPA6oRQuTVTfrhplBDOkHixxEc4pPsrimOogEA=;
 b=im0EKz2hNGFWzMa4UErHfmYivYXEV7Yz+6EpC5csnkjkxMCZOgtu6KS7rNV4O0UCap
 xPPvWufkvjFFCjKgxdjc5f7NtdRY6i47SsqTbVfOAy9ZDHKmQdnqLQ3A7Stv33WD0hFZ
 bze3iDs11svVMeNzD6XlbyMTwxrJeNSi2UmyumoY4jd8JTpjYHNOyEaDh56IkDh+HZF/
 uCPFaQuDNQiTRCzsmTzd9Q0JSFOstq39zZAdDffPgep9HGtITc3kH3zvbLdBdbxJQBV1
 wzOLY7vWr2ddTpkAFLWrfFFPH0MceNRDBoEvZm/bu8bRAsYvGMc2+k/qZ5a18hXjvwdK
 5rnw==
X-Gm-Message-State: AFqh2kqSFZkpVprLzoKXJLaSmy47/puVfgv0KePA5+v95K8z0K+58kIH
 tmKCuHq16dlyi7V0fMULG7H32ozy6P9K0mVqisyS/w==
X-Google-Smtp-Source: AMrXdXv4pIYhPkn5Ye0Z1R++9bj3ZCizSpJf8kb3rcuxGOTggVe9r28/jxcfp0CyCvAcV4yJwMVsU+2/ABzLBzaVdNU=
X-Received: by 2002:a05:6902:8f:b0:800:748:7d05 with SMTP id
 h15-20020a056902008f00b0080007487d05mr1875802ybs.15.1674559268784; Tue, 24
 Jan 2023 03:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
 <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
 <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
In-Reply-To: <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Jan 2023 13:20:57 +0200
Message-ID: <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 at 13:12, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-24 12:19:27, Dmitry Baryshkov wrote:
> > On 24/01/2023 11:59, Marijn Suijten wrote:
> > > On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
> > >> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
> > >> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
> > >> planes). Correct corresponding SSPP declarations.
> > >>
> > >> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> > >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > >> Cc: Jami Kettunen <jami.kettunen@somainline.org>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > >> index 0f3da480b066..ad0c55464154 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > >> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
> > >>    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> > >>            sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> > >>    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> > >
> > > Drop the _CURSOR mask here?  And the double space....
> >
> > Ack for the doublespace. By removing _CURSOR we would disallow using
> > these planes as hw cursor planes. This would switch all compositors into
> > sw cursor mode, thus damaging the performance.
>
> Doesn't that require special hardware support, or can any DMA pipe
> support "hw cursor mode/planes", whatever that means?  Sorry for not
> being well versed in this area, I'd expect DMA pipes and CURSOR pipes to
> have a different set of features / capabilities.

Yes, they have different capabilities. but DMA_CURSOR_MSM8998_MASK =
DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR). And the DPU_SSPP_CURSOR is
used internally to tell the DRM core that the corresponding plane is
going to be used as a "userspace cursor" plane.

> Commit 07ca1fc0f8a0 ("drm/msm/dpu: enable cursor plane on dpu") leads me
> to believe that it's mostly to let userspace use these DMA pipes for
> cursors (having cursor planes available in uapi) rather than requiring
> any special hardware support (though semantics do seem to change in a
> nontrivial way).

Correct.
DRM/userspace cursor planes = planes which userspace can use to draw
mouse cursor. Legacy compositors and legacy cursor IOCTLs stick to
using them
DPU/MDP5 CURSOR plane (sspp_12/13) = lightweight limited plane without
additional features, targeting HW cursor only, not present since
sdm845
DPU_SSPP_CURSOR = bit which tells DPU core to mark a plane as
'DRM/userspace cursor plane'.

>
> > >> -          sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> > >> +          sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> > >>    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
> > >> -          sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> > >> +          sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> > >
> > > Yes, msm8998_mdp defines both DMA2/3 and CURSOR0/1 clocks.  R-b after
> > > using DMA_MSM8998_MASK without the DPU_SSPP_CURSOR bit.
> > >
> > > However, my downstream sources still define cursor SSPPs that are
> > > missing here (after all, there's clk-ctrl for these already), at xin ID
> > > 2 and 10 with addresses 0x3500 and 0x37000 downstream (-0x1000 here):
> > >
> > >     SSPP_BLK("sspp_?", SSPP_CURSOR0, 0x34000, DMA_CURSOR_SM8998_MASK,
> > >             cursor sblk?, 2, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR0),
> > >     SSPP_BLK("sspp_?", SSPP_CURSOR1, 0x36000, DMA_CURSOR_SM8998_MASK,
> >
> > I think this should not be the DMA_CURSOR_MSM8998_MASK, but don't bet on
> > my words, I haven't check actual cursor plane capabilities.
>
> As we've seen in [1] (specifically [2]) there are a few more driver/hw
> changes required to properly implement/support DPU_SSPP_CURSOR?
>
> [1]: https://github.com/rawoul/linux/commits/next_20220624-msm8998-hdmi
> [2]; https://github.com/rawoul/linux/commit/7d8d739cfbfa551120868986d5824f7b2b116ac1
>
> - Marijn
>
> > >             cursor sblk?, 10, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_CURSOR1),
> > >
> > > Or should you/I send that as a separate folloup patch?
> >
> > Ideally one can add these two planes and then switch two mentioned DMA
> > planes to plain DMA_MSM8998_MASK.
> >
> > >
> > > - Marijn
> > >
> > >>   };
> > >>
> > >>   static const struct dpu_sspp_cfg sdm845_sspp[] = {
> >
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry
