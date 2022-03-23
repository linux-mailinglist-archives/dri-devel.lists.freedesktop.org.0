Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2F4E50CD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7310E681;
	Wed, 23 Mar 2022 10:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5EB10E67D;
 Wed, 23 Mar 2022 10:58:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 079AF60EE1;
 Wed, 23 Mar 2022 10:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC840C340E9;
 Wed, 23 Mar 2022 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648033083;
 bh=LqwU8plbtn4AIksRq4IGPu+orql0HtiebWAHYKnPuDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rITRSE/pQMHW6rMV+Ea0ZxWsSuyUUaz69aXGdoycdMJ66u9ihgXVNCL+lj1wpe4It
 Yjnal3Yxk9WiKhq5dqwWYMn06dRaGeWNLIqdqcJNVENC7fcct4ET2ymGVrf+ERNNez
 EFIIDNw96F21A3Z/HTu2Lpl855OK83YIsN0bSEc4oPogaYAA+sDwe7h9SRFJOgumqI
 7Y3Cvjc9zkUKxbwdZ3lBw4k2iju0p+ZkgAkHZbMACsUmG7zQXFwa771+kdVJE/DdbA
 esp+gCxzNJwNKrt/Y0b8OQuEqEA0/TaqBdifW4zQF8f3tYL3j9CTFOl+99sVPjkLfs
 d2WgAlIA/iw7Q==
Date: Wed, 23 Mar 2022 16:27:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [Freedreno] [PATCH v3 12/13] drm/msm/dsi: Add support for DSC
 configuration
Message-ID: <Yjr9N4DPdOyi7CO5@matsya>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-13-vkoul@kernel.org>
 <20211211000315.pavmcc7cc73ilb6l@SoMainline.org>
 <Yg4t/G3tgcmkswHg@matsya>
 <20220217151142.sbp6wslxbxeohsgf@SoMainline.org>
 <YjoEgpAZAwM8hWEa@matsya>
 <20220322185925.nszstmi5silgefd5@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322185925.nszstmi5silgefd5@SoMainline.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-03-22, 19:59, Marijn Suijten wrote:
> On 2022-03-22 22:46:50, Vinod Koul wrote:
> > On 17-02-22, 16:11, Marijn Suijten wrote:
> > > Hi Vinod,
> > > 
> > > Thanks for taking time to go through this review, please find some
> > > clarifications below.
> > > 
> > > On 2022-02-17 16:44:04, Vinod Koul wrote:
> > > > Hi Marijn,
> > > > 
> > > > On 11-12-21, 01:03, Marijn Suijten wrote:
> > > > 
> > > > > > +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> > > > > > +				  int pic_width, int pic_height)
> > > > > 
> > > > > This function - adopted from downstream - does not seem to perform a
> > > > > whole lot, especially without the modulo checks against the slice size.
> > > > > Perhaps it can be inlined?
> > > > 
> > > > Most of the code here is :)
> > > > 
> > > > This was split from downstream code to check and update dimension. We
> > > > can inline this, or should we leave that to compiler. I am not a very
> > > > big fan of inlining...
> > > 
> > > It doesn't seem beneficial to code readability to have this function,
> > > which is only called just once and also has the same struct members read
> > > in a `DBG()` directly, abstracted away to a function.  Not really
> > > concerned about generated code/performance FWIW.
> > > 
> > > Also note that the caller isn't checking the `-EINVAL` result...
> > 
> > I have made this void inline.
> 
> Perhaps there is a misunderstanding here: with inlining I am referring
> to the process of transplanting the _function body_ to the only
> call-site, not adding the `inline` keyword nor changing this to `void`.
> 
> The checks that make this function return `-EINVAL` seem valid, so the
> caller should check it instead of removing the return?

Okay somehow I misunderstood then, let me see how the code looks in this
case then
-- 
~Vinod
