Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B74E6637
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 16:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626AF10E8E9;
	Thu, 24 Mar 2022 15:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A2910E8E8;
 Thu, 24 Mar 2022 15:41:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9184617FB;
 Thu, 24 Mar 2022 15:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5703C340EC;
 Thu, 24 Mar 2022 15:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648136515;
 bh=doZwDOyg5aAln9B5DrZ3TY24Ms37FN+svJ7hBf9kLOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2es6RjpWpnvAYmQBArcDtITQiqCqQkxdHOTn+VLib8RpjRqoz7Bk42YaQeIkW4B+
 YV4riix7mFJO6aTCfBltJ+fHD9NcvbmSVUgVRccYTsAThnjUvTUElpQVWLkEmXn3XP
 0KARQD6J5sux0XLqkyQczgxTdKj6a0blrlIj64sjOTOnkhpG5IQOzN1na+sGcth01V
 BHerFSDNphjfIgtjIwzEyNtiuKx5MEFUnf8zYDfP5QxivQK6NnsEXMMHf83nTw7iCV
 0JmhQp4Rh9K55bYoS3LHd/KRXZDaoGGhW53QMIr6NdwapjmHHWkxiYfwY5Yfp7IlAG
 xZBPVqEuXQxJA==
Date: Thu, 24 Mar 2022 21:11:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [REPOST PATCH v4 07/13] drm/msm/disp/dpu1: Add support for DSC
 in encoder
Message-ID: <YjyRPhdoiLw4gOtD@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-8-vkoul@kernel.org>
 <20220217223239.2i256klkbjkogovz@SoMainline.org>
 <YjsxaJrvxgtO5ecC@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjsxaJrvxgtO5ecC@matsya>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-03-22, 20:10, Vinod Koul wrote:
> On 17-02-22, 23:32, Marijn Suijten wrote:
> > On 2022-02-10 16:04:17, Vinod Koul wrote:

> > > +
> > > +	slice_count = dsc->drm->slice_count;
> > > +	slice_per_intf = DIV_ROUND_UP(width, dsc->drm->slice_width);
> > > +
> > > +	/*
> > > +	 * If slice_count is greater than slice_per_intf then default to 1.
> > > +	 * This can happen during partial update.
> > > +	 */
> > > +	if (slice_count > slice_per_intf)
> > > +		slice_count = 1;
> > > +
> > > +	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> > > +				      dsc->drm->bits_per_pixel, 8);
> > > +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> > > +
> > > +	dsc->eol_byte_num = total_bytes_per_intf % 3;
> > > +	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> > > +	dsc->bytes_in_slice = bytes_in_slice;
> > > +	dsc->bytes_per_pkt = bytes_in_slice * slice_count;
> > > +	dsc->pkt_per_line = slice_per_intf / slice_count;
> > > +}
> > 
> > I've seen the same calculations duplicated twice in dsi code.  Since the
> > msm_display_dsc_config struct is available in a header, perhaps a single
> > - easily reviewable and maintainable - calculation function should be
> > available there too?
> 
> Let me try check if we can make it common..

I rechecked and we can actually remove this as we do this caln in timing
and update the dsc structure there. So this fn is dropped now

-- 
~Vinod
