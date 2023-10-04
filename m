Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DA7B867A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 19:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A2310E3A9;
	Wed,  4 Oct 2023 17:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C43F10E3A0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696440481; x=1727976481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Yw8aI4V48L/VI/XeS7mnXRJwEZmTqvv1XYlwZC2Y9Tw=;
 b=Xvpu1rKDpz+re8QJPpeSZmYCAPLgOsvgzfkdS0UqeBudAtY12dsBnECE
 obdcTfGCkrlLY2XbeaQoTPeBbin+xFuD44EI1gs2cUX8UHH+/8x8Uo0+q
 Wy+ZD2y2ASc3fxLc6JfI1lTMQaEQjgYbc/tK9gUIBZtPI3lPlNNIKiW72
 QLSvziUXyijQs2oori0eYYeS6OJAAC4Sb3iT2+Mr8G1hZZwtYR5NefIrE
 G7X7T2nEEw6zOcKTYzTUjipr2cP0z3c6tABHepgSKQ1/rqUy30C0BAFqT
 jl55yX3IX+cv6Ho8CpSzIRyUfkJ0Eplh32eTsDdb5X/tmMkNQM/fxjXbP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449733824"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449733824"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728105584"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="728105584"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga006.jf.intel.com with SMTP; 04 Oct 2023 10:27:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 04 Oct 2023 20:27:36 +0300
Date: Wed, 4 Oct 2023 20:27:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ray Strode <halfline@gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZR2giGixi7OqLzvs@intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZRWVpCaQUefzdZ4-@intel.com>
 <CAA_UwzJqwigNvMZ9C_tu0Hb5cLRq0u44FXa9+h3m7X05psGYhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA_UwzJqwigNvMZ9C_tu0Hb5cLRq0u44FXa9+h3m7X05psGYhQ@mail.gmail.com>
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 03:33:46PM -0400, Ray Strode wrote:
> hI,
> 
> On Thu, Sep 28, 2023 at 11:05 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> > Here's my earlier take on this: https://patchwork.freedesktop.org/series/108668/
> 
> Nice. Was there push back? Why didn't it go in?

No one really seemed all that interested in it. I'd still like to get
it in, if for no other reason than to make things operate more uniformly.
Though there are lots of legacy codepaths left that still hold the locks
over the whole commit, but those could be fixed up as a followup.

> 
> > execpt I went further and moved the flush past the unlock in the end.
> 
> Is that necessary? I was wondering about that but there's this comment
> in the code:

I'm not really sure there is any point in doing this otherwise. 
It would just change which thread executes the code but everything
else would still get blocked on the locks the same as before.

> 
> *  ... Locks, especially struct
>  * &drm_modeset_lock, should not be held in worker threads or any other
>  * asynchronous context used to commit the hardware state.
> 
> So it made me think there would be no locks held, and then I threw a
> scratch build
> at someone who reported it didn't deadlock and solved their issue.
> 
> --Ray

-- 
Ville Syrjälä
Intel
