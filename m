Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF19E6C6E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0146310F0AE;
	Fri,  6 Dec 2024 10:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CX3U0otR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70BE10F0AE;
 Fri,  6 Dec 2024 10:40:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B6935C53A8;
 Fri,  6 Dec 2024 10:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BCEC4CEDE;
 Fri,  6 Dec 2024 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733481633;
 bh=DK0b1dwM5LeTVWALPJmNaBBZJ8WNAFHuj6zNDiCIlhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CX3U0otRjjdQdwg2xQAqHyWfA2NLYy9NGNUO4JxAUC8zgcgMkE06OQnXt15/+ifxi
 jcvnTvdk5+Cwa6C5GiamP556Ey1sCfRdSgtTXlFqPhHzd5TvKQDsDbs1ekraS70DmU
 UmezVgplVM8XToBFn6agJbDg1l9vngvcKqBr3/2HKYCC9OJxm1d2N9LQfzcN0xLj9l
 DqivqW+PYsvnhe4G9guGZ16Rq9AwqRmGXRgfu3k2HegBV0Qhs6RwJ0fNrOJ4a5HmU9
 mOxp3X/J8naZ9q2STsLIbjcJVa2fTyYRYl15OUx1UkPBD6OSuXWI52TtO3pc3VDUh9
 ev0ZQuwhQE2ww==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tJVlB-000000000oV-1xv6;
 Fri, 06 Dec 2024 11:40:34 +0100
Date: Fri, 6 Dec 2024 11:40:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Leonard Lausen <leonard@lausen.nl>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu1: don't choke on disabling the
 writeback connector
Message-ID: <Z1LUoSobMwsQER9y@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <Zz2gP5jDr4Jq1OyP@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz2gP5jDr4Jq1OyP@hovoldconsulting.com>
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

Hi Dmitry,

On Wed, Nov 20, 2024 at 09:39:27AM +0100, Johan Hovold wrote:
> On Fri, Aug 02, 2024 at 10:47:33PM +0300, Dmitry Baryshkov wrote:
> > During suspend/resume process all connectors are explicitly disabled and
> > then reenabled. However resume fails because of the connector_status check:
> > 
> > [ 1185.831970] [dpu error]connector not connected 3
> 
> Please also include the follow-on resume error. I'm seeing:
> 
> 	[dpu error]connector not connected 3
> 	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> 
> and say something about that this can prevent displays from being
> enabled on resume in some setups (preferably with an explanation why if
> you have one).
> 
> > It doesn't make sense to check for the Writeback connected status (and
> > other drivers don't perform such check), so drop the check.
> > 
> > Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> 
> I noticed that the implementation had this status check also before
> 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
> dpu_writeback.c").
> 
> Why did this not cause any trouble back then? Or is this not the right
> Fixes tag?
> 
> > Cc: stable@vger.kernel.org
> > Reported-by: Leonard Lausen <leonard@lausen.nl>
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> 
> Perhaps you can include mine an György's reports here too.
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> With the above addressed:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

It's been over two weeks and I'm still waiting on a reply from you.

Can you please respin the patch as suggested above so that we can get
this merged ASAP to fix suspend on X1E which has been broken since at
least early summer.

Johan
