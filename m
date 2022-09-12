Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB25B5E84
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 18:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2092C10E607;
	Mon, 12 Sep 2022 16:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBB810E5FC;
 Mon, 12 Sep 2022 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663001351; x=1694537351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+KidtIfsWU/A9r0npGzDVevDPIE5FievI+diWJITcn8=;
 b=eeb8l4ujvubwy77pBdYxn4YPkqEKIS8yHcsM32pLbCGiWOBuF6QDAKkQ
 6yJgp1XFvZhqK8pmcf59Nxo/1/fMB80/55xWwqJkWJbLwG92e9NNXwTwE
 mMGEiR5VUWsMyNDsIfteih7v3YU0rVsGvkH8Lp5GnnVsFk1S9HFAQxRtK
 2TvrgD9aDkdf6DD7pequ87LPQsa/Yv6SBOe0l5oM0JR+84Ak4lswwfoSU
 ZkUyRldeze1If8zSos6IXIYsbXgSNZL+h/q4y7tkS5eTQLL17vjMlt+J7
 DmiOAQG+Ad5lpE4m6PMElExi8zuZIiIhX3158l1/sqakIieiFueG4bd/u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="295501995"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="295501995"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678172190"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 12 Sep 2022 09:49:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 19:49:07 +0300
Date: Mon, 12 Sep 2022 19:49:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix display problems after resume
Message-ID: <Yx9jAwdh9rIhdmse@intel.com>
References: <20220912121957.31310-1-thomas.hellstrom@linux.intel.com>
 <Yx8pa+cZ6BIdCZA5@intel.com>
 <24a864240e0f689b30d66aeb1f978bf3aae6843f.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24a864240e0f689b30d66aeb1f978bf3aae6843f.camel@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 02:48:54PM +0200, Thomas Hellström wrote:
> On Mon, 2022-09-12 at 15:43 +0300, Ville Syrjälä wrote:
> > On Mon, Sep 12, 2022 at 02:19:57PM +0200, Thomas Hellström wrote:
> > > Commit 39a2bd34c933 ("drm/i915: Use the vma resource as argument
> > > for gtt
> > > binding / unbinding") introduced a regression that due to the vma
> > > resource
> > > tracking of the binding state, dpt ptes were not correctly
> > > repopulated.
> > 
> > Doesn't this mean all ggtt ptes weren't repopulated? So I'm
> > wondering how anything at all has been working?
> 
> ggtt ptes had a different check that was copy-pasted from the pre-vma-
> resource code and that wasn't that strict. Hence why it worked.

The ggtt one seems to want to skip if the vma is already bound 
with the other flag than what we're using this time, but doesn't
skip if it's already bound with the same flag(s). I have no idea
what it's trying to achieve there.

The dpt case skips if it's a bound at all, which seems much more
obvious but the fact that ggtt code never did that makes me
suspect it's not that clear cut.

So seems to me that the two checks are trying to do achieve
different goals, but at least I can't tell why that is.

-- 
Ville Syrjälä
Intel
