Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987B6D6E87
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1D810E7B9;
	Tue,  4 Apr 2023 21:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C0310E7B9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680642042; x=1712178042;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=2s1fu+EVzo4bbWI21FcjGuFcNl6YCxpOek/OVyKSbA0=;
 b=G/Fj4Fk7ZHkowBHbbrHoKV5WtBGoLkXJVZgrz7/OGICZ7o5NGkND2zMu
 IBY6mfUgKIRvlRrU8X28Gk/MERcy3v/bQCU2smtN0VS7x33SSKjUvm0p/
 oTJzXJqZOeubv4ZQRJqHZZYhK2ESfaLqiy1v3/bdy7kMofgJB5GWbnJ24
 WENNmrH+M/akzPD3rxvvxYfzty8iIyHO09sbYv1WD7VJOpTtvGVpD04uz
 ET/nUXsKqIC/XUSpjPU7tIf/wflFJefLCF6yf4OBY6d988d4jqnyR9hVp
 Wxd9Vp/2L+wYCfwSsCB1xnxtXYen4HggmFl8lDDVPmKVFFbSugzjIyIxs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344881073"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="344881073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 14:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751038181"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="751038181"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 04 Apr 2023 14:00:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 Apr 2023 00:00:23 +0300
Date: Wed, 5 Apr 2023 00:00:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/vblank: Simplify drm_dev_has_vblank()
Message-ID: <ZCyP55f2CFQqtP0a@intel.com>
References: <20230403160735.1211468-1-robdclark@gmail.com>
 <ZCyMiERvNHTP45o8@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCyMiERvNHTP45o8@phenom.ffwll.local>
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

On Tue, Apr 04, 2023 at 10:46:00PM +0200, Daniel Vetter wrote:
> On Mon, Apr 03, 2023 at 09:07:35AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > What does vblank have to do with num_crtcs?  Well, this was technically
> > correct, but you'd have to go look at where num_crtcs is initialized to
> > understand why.  Lets just replace it with the simpler and more obvious
> > check.
> 
> If you want to fix this, then I think the right fix is to rename num_crtcs
> to be something like num_vblank_crtcs. It's a historical accident back
> when vblanks without kms was a thing.
> 
> Plan B is someone gets really busy and fixes up the entire vblank mess and
> moves it into drm_crtc struct. Now that the dri1 drivers are gone we could
> indeed do that.

And easy first step could to simply wrap all the naked
&dev->vblank[drm_crtc_index()] things into a function
call with some cocci/etc. That way most of the vblank
code doesn't need to care where that thing actually lives.

-- 
Ville Syrjälä
Intel
