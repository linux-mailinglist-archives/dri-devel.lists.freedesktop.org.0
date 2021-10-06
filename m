Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0E423B7B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 12:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069556EDA6;
	Wed,  6 Oct 2021 10:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502916EDF5;
 Wed,  6 Oct 2021 10:28:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BC9460EE3;
 Wed,  6 Oct 2021 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633516080;
 bh=qawfkhB10636aULlGfj0MJFZ7xewkyIgRTPQnKzfUaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8K6PDCqANe+rueqei9GcS9pAK9lK5SqlSZpr5IJa7df1RRtDC9GUgpLV9JqstGaE
 hOv+YE7ztB4xynGp54GmibeyEtcSlXJfe4VW0yp12fPXQ04tLrtQxULbFnvNiXlCni
 84dp1B/2OV8sIhw8dRANOxT7aXp0XunpLk1M89S9apWB1GCZOJRB4hK3yV1x8qcyYd
 W5/1iroJG9AFHGejcamURo79ZlpVlnxYQp+Bdajqv6ShK7Cw+6sBDwfKVxAbqSpisX
 4zlrSuzVOAj1FKRQcTu1L/PAr3vp+AJHPiWGHRkExormYlgLg/57ZhNZB+m2XgH4h4
 n0mL1Vdp4VOdA==
Date: Wed, 6 Oct 2021 15:57:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 04/11] drm/msm/disp/dpu1: Add DSC support in RM
Message-ID: <YV16LKpdRiYN955Y@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-5-vkoul@kernel.org>
 <7d656b2265ade461cae993c691d31ab8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d656b2265ade461cae993c691d31ab8@codeaurora.org>
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

On 02-08-21, 16:24, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:51, Vinod Koul wrote:

> > @@ -476,6 +498,9 @@ static int _dpu_rm_reserve_intf(
> >  	}
> > 
> >  	global_state->intf_to_enc_id[idx] = enc_id;
> > +
> > +	global_state->dsc_to_enc_id[0] = enc_id;
> > +	global_state->dsc_to_enc_id[1] = enc_id;
> >  	return 0;
> >  }
> agree with dmitry again here, why are DSCs being reserved in the
> _dpu_rm_reserve_intf function?
> First, for clarity, they should be in a function of their own.
> Allocating the DSCs has to also account for the PP availability of that DSC
> and other factors need to
> be considered as well.
> I suggest checking _sde_rm_reserve_dsc() from downstream to improve the DSC
> reservation logic.

Yes I have moved to a new helper _dpu_rm_reserve_dsc(). PP availability
is already checked so no need to do that here as well

-- 
~Vinod
