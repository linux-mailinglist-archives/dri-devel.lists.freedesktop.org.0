Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE297D0F30
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 13:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D887810E5AC;
	Fri, 20 Oct 2023 11:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC41D10E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697802942; x=1729338942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vMAyDoGWs3HiDQNA+f4+HGuXJSvTpqjaKFbj/22vBec=;
 b=LKIy63/381W44Gwf0bfyr9qFvK5VpPcMyHImYGRmwxsXuHjAR8KiFydJ
 mPxM/6vVd7f5g/XblxeSNuw8Yw0NSuFSi4VsIzltIQM6c4MFhSZKwgJ8F
 4OREa8ujQ75RbcUmy9hucupAer5j+oZV2xP4JRRbdD93ksA55FhvCurQe
 /mGI4zlTJbGc/nyV6UrWjbmhl1z8C6jKN7Hmzo90vbLBwYvpO9lKQ8mM8
 btojKRqUwmp8+vcP+ulxqbnOkBDzufD43oTjjBXFt336iHNoMIACJXU5d
 IQwB8OFwxrEQh7zp0TqB0REmdk7Du43jzTiTVP0oJks3umR8bXvYAe5wY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366711957"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="366711957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 04:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848057789"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848057789"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by FMSMGA003.fm.intel.com with SMTP; 20 Oct 2023 04:55:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Oct 2023 14:55:37 +0300
Date: Fri, 20 Oct 2023 14:55:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [bug report] drm: Warn about negative sizes when calculating
 scale factor
Message-ID: <ZTJquc5Gtu2fg4GV@intel.com>
References: <c7f0fd2f-a48d-4120-9291-a0cc58faadce@moroto.mountain>
 <2ad54714-b1b2-4454-95d4-c46fae4c9404@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ad54714-b1b2-4454-95d4-c46fae4c9404@kadam.mountain>
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
Cc: Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
 kv-team <kv-team@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 02:39:04PM +0300, Dan Carpenter wrote:
> On Wed, Oct 18, 2023 at 05:17:42PM +0300, Dan Carpenter wrote:
> > drivers/gpu/drm/drm_rect.c
> >    134  static int drm_calc_scale(int src, int dst)
> >    135  {
> >    136          int scale = 0;
> >    137  
> >    138          if (WARN_ON(src < 0 || dst < 0))
> >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > These days, with automated fuzz testing, this WARN_ON() is problematic.
> > WARN() is considered a kernel bug, and pr_warn() is the hip new way to
> > alert the user about issues.
> 
> Btw, a lot of people (Greg claims it's the majority of Linux users)
> these days have run kernels with panic on warn enabled so that's another
> reason to avoid using WARN_ON() for stuff that it known to be possible.

This is not possible, unless there is a serious bug somewhere else.

-- 
Ville Syrjälä
Intel
