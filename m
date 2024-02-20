Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43785C4F3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06AF10E544;
	Tue, 20 Feb 2024 19:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9lP/VT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A806210E54C;
 Tue, 20 Feb 2024 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708458093; x=1739994093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DfJFKhyZQ/N2e0vgOg52j7ksnYxhMPQZuRpCjJttMhE=;
 b=M9lP/VT1c2bnJBiYkdxmLdWe50miSLqpGZdKXkNf59g34eCWFThboBnZ
 MNCBPJuG1j5l/LhWz7Hch7Ygkq8s1RtKLgLuqK1QGNY3kZRLX6abuMjEM
 VcN2hDL0ic+YsLrhT9VfFF/M+Xx4RrIVuRniTvpHnXfPIzn+jVMzLPCrQ
 lwzMxqteR8BSIF2NRS7cFVTifWcyOMM4ldpNnUuYjZAIG5lATOYgRw48o
 72/ziEx+liVNW0RE3g0QFCzSfdyNqo03LW5T6Zki5LWX/x6CDGN5vQOnc
 8a1GrOgsoECACOrj4WkxrvV3QX/v0mpJ3ax+khYg+F0ukgiqSzgsZDfzG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13704394"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13704394"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 11:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827202660"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="827202660"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 20 Feb 2024 11:41:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 21:41:25 +0200
Date: Tue, 20 Feb 2024 21:41:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 robdclark@gmail.com, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
Message-ID: <ZdUAZZIO5Zk2Y8Wm@intel.com>
References: <20240215190834.3222812-1-quic_abhinavk@quicinc.com>
 <CAA8EJppQquHgSgCrxKZHPHk248Pxg7Q8mvmmjbcpUxpreQkcuA@mail.gmail.com>
 <d3674c10-5c29-d917-44f5-758d90d9e679@quicinc.com>
 <CAA8EJpqaG+fBA_FO-L7Bimtjqqg3ZDQtyJL0oPFEueb-1WxjUw@mail.gmail.com>
 <CAA8EJpoeb63QRddxawm2J0s8O0XrLQBrDuYXOB=ZtzDG7mu2PQ@mail.gmail.com>
 <ec5ee910-469e-4224-28ca-336c9f589057@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5ee910-469e-4224-28ca-336c9f589057@quicinc.com>
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

On Tue, Feb 20, 2024 at 11:27:18AM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/20/2024 11:20 AM, Dmitry Baryshkov wrote:
> > On Tue, 20 Feb 2024 at 21:05, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Tue, 20 Feb 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>
> >>>
> >>>
> >>> On 2/20/2024 10:49 AM, Dmitry Baryshkov wrote:
> >>>> On Thu, 15 Feb 2024 at 21:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>>
> >>>>> intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
> >>>>> Lets move this to drm_dp_helper to achieve this.
> >>>>>
> >>>>> changes in v2:
> >>>>>           - rebased on top of drm-tip
> >>>>>
> >>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>
> >>>> v1 had an explicit comment before the ack:
> >>>>
> >>>
> >>> Yes, I remember the comment. I did not make any changes to v2 other than
> >>> just rebasing it on drm-tip to get the ack from i915 folks.
> >>>
> >>>>>      From my side, with the promise of the size fixup.
> >>>>
> >>>> However I observe neither a second patch removing the size argument
> >>>> nor it being dropped as a part of this patch.
> >>>>
> >>>
> >>> Yes, now that in v2 we got the ack for this patch, I can spin a v3 with
> >>> the addition of the next patch to remove the size OR as another series
> >>> so as to not block the main series which needs this patch.
> >>>
> >>> I would prefer the latter.
> >>
> >> It doesn't work this way. The comment should have been fixed for v2.
> > 
> > This probably deserves some explanation. Currently there is only one
> > user of this function. So it is easy to fix it. Once there are several
> > users, you have to fix all of them at the same time, patching
> > different drm subtrees. That complicates the life of maintainers.
> > 
> 
> Yes, understood. Its easier to fix it now if its really needed.
> 
> Actually, I think the reason the size was passed was to make sure
> a valid struct dp_sdp *sdp was being passed.

The size is supposed to be the size of *hardware* buffer where this
gets written into. But looks like this wasn't done correctly when
the code was copy-pasted from the HDMI inforframe code.

-- 
Ville Syrjälä
Intel
