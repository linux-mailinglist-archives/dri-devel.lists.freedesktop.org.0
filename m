Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC47F6585
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9970B10E324;
	Thu, 23 Nov 2023 17:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E768710E32A;
 Thu, 23 Nov 2023 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700760908; x=1732296908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bZiC9hG+uUPXjnWXM4F9oabwUgq9tzES6IaqRI3F+SQ=;
 b=BIYXpS0Y0nxVC5eOH6BIeJRNWokqM508jOFEPl3FcqqidRJDVB4xHJzn
 5Y+b9zZfzBNPdDMs91Uz4VM6jSuCLjHPU/hVp00Pwe3Tr8nkQtzoff4IN
 E4uCpnXgYcdxkl5xwLwgIm5kw1voIRZdoJvn1Twuya9e1g/9OyxHxhUtl
 /ZY5io6MtQvO6N22dS6tnWEU28li4M7f4dYTz+jwPgPAn30n69751wvrS
 4tp+h1OllkUnPGTUo5UOqFRbA8gHGaWlgrpSclefeCmDIB3ZKI9Mice12
 JuWP1W3y8HUVbeN6xGpwgecUevZspZG0p+tP0pbvtx/AsmWrkEE8t73P5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423441693"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="423441693"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 09:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760721243"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; d="scan'208";a="760721243"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 23 Nov 2023 09:35:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Nov 2023 19:35:03 +0200
Date: Thu, 23 Nov 2023 19:35:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/4] drm/i915: Fix LUT rounding
Message-ID: <ZV-NR4TrIg_AUfun@intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <ZVttnXE_P9xzXlZT@intel.com>
 <sdfpsfvpvllzzmgndrl7ln4x23mzv34ajy34g2spqhlo6i6dub@qvrdixxylmko>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sdfpsfvpvllzzmgndrl7ln4x23mzv34ajy34g2spqhlo6i6dub@qvrdixxylmko>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 11:51:10AM +0100, Maxime Ripard wrote:
> On Mon, Nov 20, 2023 at 04:30:53PM +0200, Ville Syrjälä wrote:
> > On Fri, Oct 13, 2023 at 04:13:58PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > The current LUT rounding is generating weird results. Adjust
> > > it to follow the OpenGL int<->float conversion rules.
> > > 
> > > Ville Syrjälä (4):
> > >   drm: Fix color LUT rounding
> >     ^
> > I'd like to merge this via drm-intel-next as needs to match
> > the rounding done in the readout path in i915.
> > 
> > Maarten,Maxime,Thomas can I get an ack for that?
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks. Series pushed to drm-intel-next.

-- 
Ville Syrjälä
Intel
