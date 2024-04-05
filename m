Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A63089A5DE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9810E87C;
	Fri,  5 Apr 2024 20:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsyLEvAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D5710E6CF;
 Fri,  5 Apr 2024 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712350629; x=1743886629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=duwOo0fb7II8vWLfDLuFnG/5jNYOBJiTcFN/PE4MEZ0=;
 b=KsyLEvAQUY1cQndoiCe16ll11/wYtr0OytkDJSjFnVyTyN5pi4XH8mdf
 +TpbGyznaT1FV9XVdwxw1r0aj8shxFU1SdReWrdKXN2bL7/yS3OMgJkJE
 AVRexFvSwkHJK7VUYK0bSWP6c5ESADKj3aZgFVtTVUeIJFbNN8J3pbwsA
 jPlApPutXnEgZwUPIin0XtjHogoOEDUZBPtPl2l95KgWs4fckIV/wuhz5
 oOMC9ak03szRkkZn8xKIq7zn8W9REZPMoOSsRlwkWadOj7xu9zugXx7I3
 ZFDJpq7tON7U/0apJsEAvDqtKrr+TlX/zTIMI01vk2BZIOoGrmGimkpAj Q==;
X-CSE-ConnectionGUID: 7UEr8n5+RHeBJoMesdV8EA==
X-CSE-MsgGUID: E8R9ngIvTdaPIewGMvEqLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18308090"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="18308090"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 13:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="827791022"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="827791022"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2024 13:57:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 23:57:05 +0300
Date: Fri, 5 Apr 2024 23:57:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 01/12] drm/client: Fully protect modes[] with
 dev->mode_config.mutex
Message-ID: <ZhBloR59z8_K2YbJ@intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-2-ville.syrjala@linux.intel.com>
 <jeg4se3nkphfpgovaidzu5bspjhyasafplmyktjo6pwzlvpj5s@cmjtomlj4had>
 <ZhBOLh8jk8uN-g1v@intel.com>
 <CAA8EJpoOzKPh1wFfgQy8bZN_jfsrgAcrxM1x1pEFbAwcY9zBUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpoOzKPh1wFfgQy8bZN_jfsrgAcrxM1x1pEFbAwcY9zBUw@mail.gmail.com>
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

On Fri, Apr 05, 2024 at 11:39:33PM +0300, Dmitry Baryshkov wrote:
> On Fri, 5 Apr 2024 at 22:17, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Apr 05, 2024 at 06:24:01AM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Apr 04, 2024 at 11:33:25PM +0300, Ville Syrjala wrote:
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > >
> > > > The modes[] array contains pointers to modes on the connectors'
> > > > mode lists, which are protected by dev->mode_config.mutex.
> > > > Thus we need to extend modes[] the same protection or by the
> > > > time we use it the elements may already be pointing to
> > > > freed/reused memory.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10583
> > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > I tried looking for the proper Fixes tag, but it looks like it might be
> > > something like 386516744ba4 ("drm/fb: fix fbdev object model + cleanup properly.")
> >
> > The history is rather messy. I think it was originally completely
> > lockless and broken, and got fixed piecemeal later in these:
> > commit 7394371d8569 ("drm: Take lock around probes for drm_fb_helper_hotplug_event")
> > commit 966a6a13c666 ("drm: Hold mode_config.lock to prevent hotplug whilst setting up crtcs")
> >
> > commit e13a05831050 ("drm/fb-helper: Stop using mode_config.mutex for internals")
> > looks to me like where the race might have been re-introduced.
> > But didn't do a thorough analysis so not 100% sure. It's all
> > rather ancient history by now so a Fixes tag doesn't seem all
> > that useful anyway.
> 
> Well, you have added stable to cc list, so you expect to have this
> patch backported. Then it should either have a kernel version as a
> 'starting' point or a Fixes tag to assist the sable team.

It'll get backported just fine without either.

-- 
Ville Syrjälä
Intel
