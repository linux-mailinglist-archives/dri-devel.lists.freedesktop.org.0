Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA887012F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54EC1120BB;
	Mon,  4 Mar 2024 12:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDU/P27e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6631120BB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709555105; x=1741091105;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7fm2qOLOx0If10Aa9jpAj8dYjJuoPkt4GL9F2Mu7h1U=;
 b=LDU/P27e41ywaDBa3DbtV1pyd/ZLLFtDu+LjyvOiyS/yXrKKuzzSJuTQ
 /uL4Vu/A3ToD2Sb5c41Y+jZSxMx//dJx/5hloVBIFgFpOCiLKUuOGKRiC
 bgQs2YJlS7mwHdJhenn7M5wOzRgS1GtCEfs2jqimaDJKZ3Z/fOC9XuN5n
 BsqRyDMHSpJHIi94KfT4gx0+yLaKN9mkyG1j4g0dWeR982nYwIb0eXH0t
 d3CP346t52+Z5ROOZ/dUiotzPlprlpqfSJ2B69ay3KwXaKaXiGE0OLMM1
 giQnfxNPkp3rzR65cl/XdorzBJ8fWRcNWzljpqaf8lug6HkwlQ/15xShm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3892408"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3892408"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13642847"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:25:00 -0800
Date: Mon, 4 Mar 2024 14:25:24 +0200
From: Imre Deak <imre.deak@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Fix output poll work for drm_kms_helper_poll=n
Message-ID: <ZeW9tDG49yZmsH1z@ideak-desk.fi.intel.com>
References: <20240301152243.1670573-1-imre.deak@intel.com>
 <CAA8EJppk+gA0g3Wn-e4C0CKKYHLwtU1+euez4VBKhB-qrt54rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppk+gA0g3Wn-e4C0CKKYHLwtU1+euez4VBKhB-qrt54rw@mail.gmail.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 02, 2024 at 12:55:48PM +0300, Dmitry Baryshkov wrote:
> On Fri, 1 Mar 2024 at 18:22, Imre Deak <imre.deak@intel.com> wrote:
> >
> > If drm_kms_helper_poll=n the output poll work will only get scheduled
> > from drm_helper_probe_single_connector_modes() to handle a delayed
> > hotplug event. Since polling is disabled the work in this case should
> > just call drm_kms_helper_hotplug_event() w/o detecting the state of
> > connectors and rescheduling the work.
> >
> > After commit d33a54e3991d after a delayed hotplug event above the
> > connectors did get re-detected in the poll work and the work got
> > re-scheduled periodically (since poll_running is also false if
> > drm_kms_helper_poll=n), in effect ignoring the drm_kms_helper_poll=n
> > kernel param.
> >
> > Fix the above by calling only drm_kms_helper_hotplug_event() for a
> > delayed hotplug event if drm_kms_helper_hotplug_event=n, as was done
> > before d33a54e3991d.
> >
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Fixes: d33a54e3991d ("drm/probe_helper: sort out poll_running vs poll_enabled")
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Patch is pushed to drm-misc-fixes, thanks for the report and review.

> 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> -- 
> With best wishes
> Dmitry
