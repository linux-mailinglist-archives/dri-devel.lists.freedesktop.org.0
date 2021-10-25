Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75734439B39
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 18:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4CF89E32;
	Mon, 25 Oct 2021 16:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC086E185;
 Mon, 25 Oct 2021 16:10:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB37960C41;
 Mon, 25 Oct 2021 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635178249;
 bh=Ht5CCepW+Bus8R8OY85RyRafOK9dzOlZSwh9jF1DXGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oo+Ms53iM3smAXsA/mnUJ+MEWY39MsSACEuPImhUxEj7ZuhVyGcyxGd7qfGjH6ffl
 VaRDwAB+xXYptDAGgU/7/1xTwqr4FX2Gd74JhWio8hJGgCEK5heoXY++2C2ybSEfcj
 c0Q9GiO68kysf0Tiz0wx4uGoJJ+WnY2NSdM7kXS7wbo4Daj3ke0XE+IrUphjixHJLr
 RqtbmJ5UM/stKzoS7H7RYyPtBuWAVgjNLgL2B8QDhIYrmIUDYKphXQf4IQY8bobhbe
 XwpG317IArwLw6PaUoLjAk7CfnqUFuRqm/CxKuX7fvVYyBi6mvWKAFI8DY2CAClf0U
 VT3u+amfcHaRg==
Date: Mon, 25 Oct 2021 21:40:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 06/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
Message-ID: <YXbXBTlgDRa564Ic@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-7-vkoul@kernel.org>
 <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
 <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org>
 <YW+957ZKnbf1g/89@matsya>
 <e96d1368-fe7b-cf24-82c9-99783df44b0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e96d1368-fe7b-cf24-82c9-99783df44b0d@linaro.org>
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

On 25-10-21, 17:40, Dmitry Baryshkov wrote:
> On 20/10/2021 09:57, Vinod Koul wrote:
> > On 14-10-21, 16:50, Dmitry Baryshkov wrote:
> > > On 14/10/2021 16:41, Dmitry Baryshkov wrote:
> > > > On 07/10/2021 10:08, Vinod Koul wrote:

> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > > > index 806c171e5df2..5dfac5994bd4 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > > > @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
> > > > >     * @mode_3d:               3d mux configuration
> > > > >     * @merge_3d:              3d merge block used
> > > > >     * @intf_mode_sel:         Interface mode, cmd / vid
> > > > > + * @dsc:                   DSC BIT masks
> > > > >     * @stream_sel:            Stream selection for multi-stream interfaces
> > > > >     */
> > > > >    struct dpu_hw_intf_cfg {
> > > > > @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
> > > > >        enum dpu_3d_blend_mode mode_3d;
> > > > >        enum dpu_merge_3d merge_3d;
> > > > >        enum dpu_ctl_mode_sel intf_mode_sel;
> > > > > +    unsigned int dsc;
> > > 
> > > I think this should be:
> > > enum dpu_dsc dsc[MAX_DSCS];
> > > unsigned int num_dsc;
> > 
> > hmmm, how do we go about getting the num_dsc value here.
> > dpu_encoder_phys does not know about that..
> 
> dpu_encoder_get_topology() can decide whether to use DSC or not and then set
> num_dsc. For now it will always set 2 if we are using DSC at all, but let's
> keep the decision in a single place rather than having it scattered all over
> the driver.

Yes agree, but dpu_encoder_get_topology() is private to encoder. Am not
sure how best to propagate the info into the hw_intf_cfg?
-- 
~Vinod
