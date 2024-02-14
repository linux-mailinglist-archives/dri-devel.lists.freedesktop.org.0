Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB385534D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 20:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2604C10E127;
	Wed, 14 Feb 2024 19:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKSdR4mD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279BA10E038;
 Wed, 14 Feb 2024 19:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707939575; x=1739475575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2EAkeIHx/DubrSAXO/8xl23uuz2upTGiChI+ff2sm8s=;
 b=iKSdR4mD+pTiStIcC9bnwz04CZKcUIS4TLTXKLxQKh16jnaPXk2uv/2N
 SjAEBzwtaEPJwTO8i2HmeA7ykumpjK+PIYPdVyxn4a+pwsjSnG5EzcsEu
 7DoRnMOadjt0arH0Wn3hfDwHBQguxF690z76pgWvxRrEdQskoDRHW3P4A
 YcsoMTucyEOdCxfpmqAOA7oaC3KqTo4ehgoUS0GAhPT7vSYyyQnmCx/jd
 STQfinbdHn7GqPuXBm0C640fuGKUmzpm0SRnfOUwXDZBS4AVe1r9+Dj3B
 GEWduIHOywIhsm2csRG8y+OnhTysG8SQ76AlW2+ngdoaciFWTYilucPX6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2149816"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2149816"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 11:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369732"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369732"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 11:39:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 14 Feb 2024 21:39:29 +0200
Date: Wed, 14 Feb 2024 21:39:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Message-ID: <Zc0W8TjigrryOPil@intel.com>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
 <Zc0ITrmhQ8CWMXMq@intel.com> <Zc0KsfrI57XL7Efk@intel.com>
 <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
X-Patchwork-Hint: comment
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

On Wed, Feb 14, 2024 at 09:17:06PM +0200, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 20:47, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Wed, Feb 14, 2024 at 08:37:02PM +0200, Ville Syrjälä wrote:
> > > On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> > > > The helper drm_atomic_helper_check_plane_state() runs several checks on
> > > > plane src and dst rectangles, including the check whether required
> > > > scaling fits into the required margins. The msm driver would benefit
> > > > from having a function that does all these checks except the scaling
> > > > one. Split them into a new helper called
> > > > drm_atomic_helper_check_plane_noscale().
> > >
> > > What's the point in eliminating a nop scaling check?
> >
> > Actually, what are you even doing in there? Are you saying that
> > the hardware has absolutely no limits on how much it can scale
> > in either direction?
> 
> No, I'm just saying that the scaling ability depends on the rotation
> and other plane properties. So I had to separate the basic plane
> checks and the scaling check.
> Basic (noscale) plane check source and destination rectangles, etc.
> After that the driver identifies possible hardware pipe usage and
> after that it can perform a scaling check.

Hmm. We have sport of similar situation in i915 where we pick a scaler
much later and so don't know the exact scaling limits at the time when
we do this check. But we opted to pass the lower/upper bounds of the
scaling limits instead. That will guarantee that at least completely
illegal values are rejected as early as possible, and so we don't have
to worry about running into them later on.

-- 
Ville Syrjälä
Intel
