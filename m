Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0E7B1CAF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7EA10E628;
	Thu, 28 Sep 2023 12:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227D710E628;
 Thu, 28 Sep 2023 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695904809; x=1727440809;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ljpq8vQLpLon+2CPFDXiBe0t2jxRx4Bnd3wbjk4pqUc=;
 b=J2M4rBc5phTyoi0CBn89+rs58p/ynVpr28QyhW/LNSFtZJ/Y7e0xMvBv
 1rV9/e5lb2nlmrdxlV41cQD4cdADDpJ11RVCRe3f+CFmfCIHXdMOQTgJW
 sHaQKBhR+yb5IoNJ4AaWSn1Xk4kiSMxr3F9TzCuBOfyJkzWy2KjQDyy4C
 Bk2ehNchWPxU0mSs3fRuZbiD7cGtQCP3/QFwb0hpORqG2MIcwnQqLnaFY
 I7oiK7YfyNiUIg4RT6Dn+Ou1/n/6TIjSJRqqzNn+Q95Agu0yLRydQ/c7J
 iWoYu8mP4zh3rtIjRymSddsIdm9TrCjk/2kcwvif6DjBb+iffi278An6M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361417914"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="361417914"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892997134"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="892997134"
Received: from mnazleas-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.37.197])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 05:38:32 -0700
Date: Thu, 28 Sep 2023 14:39:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v6 3/4] drm/i915: Reset steer semaphore for media GT on
 resume
Message-ID: <ZRV0BGVuMdJdrNvJ@ashyti-mobl2.lan>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-3-nirmoy.das@intel.com>
 <ZRUpDcKowRXpWjD9@ashyti-mobl2.lan>
 <cd2a314a-a98a-fe20-3852-d12ae6979d3b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd2a314a-a98a-fe20-3852-d12ae6979d3b@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > During resume, the steer semaphore on GT1 was observed to be held. The
> > > hardware team has confirmed the safety of clearing the steer semaphore
> > > during driver load/resume, as no lock acquisitions can occur in this
> > > process by other agents.
> > > 
> > > v2: reset on resume not in intel_gt_init().
> > > v3: do the reset on intel_gt_resume_early()
> > > 
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > In the previous version I added my r-b here.
> I moved code to different function so wanted to be sure :)
> >   Please consider it
> > for the next version:
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > 
> > Even though there are still some quesions coming from Matt.
> 
> I will make it generic for all GT in the next version.

uuhh... yes, didn't think of it... thanks!

Andi
