Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D53439B3F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 18:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA66889A0E;
	Mon, 25 Oct 2021 16:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DA289A0E;
 Mon, 25 Oct 2021 16:12:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 135C660EBD;
 Mon, 25 Oct 2021 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635178321;
 bh=syAB+df5IPHsjUcZpMOSy08OXq0IujFncL8KFiRTvOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xv0TWdNFBiGEZc6TVChr42vVbecdpKFm5RmxXTuNhOwnMLXqmxR1cqYo12ZbSwXB0
 msnNoBFZ8d8U2DpJjuGSTJ+p4I/TgpHN5u/Z6fl8l5cSlqMk2dH7VSWtCOUNDPduWn
 ck4Rha2Vu4jyMMkE2oR5GR+727+cnPyJeb5Q6xk6egjQur+wRi0VL+cvaIhqZYPCAJ
 jTVJhuAspF86jNPGq4HxLm9SdWN9URB6fqFMNVzC4SVn41v2NvRholBSapP5DCKxCe
 Sbh4UVcWxFa30kZQRgT7nKdbbuS/dLQ3YvUTFujPmGP25oDJQ55yycRYfNiaH3uhCB
 O6Lb1cZ1vkijA==
Date: Mon, 25 Oct 2021 21:41:57 +0530
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
Subject: Re: [PATCH v2 09/11] drm/msm/disp/dpu1: Add support for DSC in
 topology
Message-ID: <YXbXTRZZFLKYsqnC@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-10-vkoul@kernel.org>
 <020ab810-c975-d58b-a572-57eb3010d6c0@linaro.org>
 <7ba115c8-16e6-54c4-b151-e69eedcb47d2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ba115c8-16e6-54c4-b151-e69eedcb47d2@linaro.org>
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

On 25-10-21, 17:37, Dmitry Baryshkov wrote:
> On 14/10/2021 17:13, Dmitry Baryshkov wrote:
> > On 07/10/2021 10:08, Vinod Koul wrote:

> > > @@ -572,8 +574,22 @@ static struct msm_display_topology
> > > dpu_encoder_get_topology(
> > >       topology.num_enc = 0;
> > >       topology.num_intf = intf_count;
> > > +    drm_enc = &dpu_enc->base;
> > > +    priv = drm_enc->dev->dev_private;
> > > +    if (priv && priv->dsc) {
> > > +        /* In case of Display Stream Compression DSC, we would use
> > > +         * 2 encoders, 2 line mixers and 1 interface
> > > +         * this is power optimal and can drive upto (including) 4k
> > > +         * screens
> > > +         */
> > > +        topology.num_enc = 2;
> > > +        topology.num_intf = 1;
> > > +        topology.num_lm = 2;
> > 
> > So, here you'd set the topology.num_rm.
> 
> I meant 'num_dsc', please excuse the typo.

No worries, i had assumed such and made it num_dsc

-- 
~Vinod
