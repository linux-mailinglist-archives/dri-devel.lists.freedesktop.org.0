Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E15A333B1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 00:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728B10E333;
	Wed, 12 Feb 2025 23:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCUcDoYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCAB10E333;
 Wed, 12 Feb 2025 23:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739404582; x=1770940582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gF8WUDA/YTJ+dykENAH//Nob6ceU5xpiAlV5FGXbhA0=;
 b=SCUcDoYsE4Ch17B5lAOEBpJGcBfbEY4GKHAkZ7COj9DS0Pbc8mLlP3HE
 VxILxqbLNfd8tKYuscAkgmJNCn83JM3CY0duuWB7CqcGJhu7DMBEKhlQ5
 Nd7Qx7uuoOyd8+lU6nya2u2UfU3BzbgoS8cjJuEVB3dgwwjh21qVStuXM
 jG8NkkLzwo89cO/GmIEe2ep+BlMW1oHHz2+DbpqdZdW78FxfGBQ0foQ+H
 Craka0y/5rQ9Jjs4tBYxcuvXaVV08ivE9yRfMjpbbMV1iMtSSpeWEBpnS
 oPzrh0MG8hHtKw191fsBGbBEv3aRqzLQ5xGgcc7HFzRkO4bHe0B5k6E7A g==;
X-CSE-ConnectionGUID: 9EEy9zflT6eh79d4DlcVAA==
X-CSE-MsgGUID: ahwJtRaST++JIz35wt3ggw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39951907"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39951907"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 15:56:18 -0800
X-CSE-ConnectionGUID: WR4Y8srsTAiq00aeunFnKQ==
X-CSE-MsgGUID: DJiOdrRmT3K6jnGzy0pS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="113172598"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Feb 2025 15:56:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Feb 2025 01:56:12 +0200
Date: Thu, 13 Feb 2025 01:56:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <Z601HHdh2Zn62skU@intel.com>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
 <87tt9pn8uu.fsf@intel.com>
 <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
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

On Thu, Jan 23, 2025 at 01:05:47PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 12:05:29PM +0200, Jani Nikula wrote:
> > On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> > 
> > This might be one of the few places where the old functions and the old
> > return value was used in a sensible manner.
> 
> Well... Yes and no. What does it mean if we return less bytes? Is that
> still a protocol error?

AFAIK short AUX replies are perfectly legal accoding to the DP
spec, but we've not really seen them happening in any real
use cases I suppose (although I'm not sure we have sufficient
logging to tell whether something failed completely or only
partially), hence why we've never really handled them
correctly.

For aux_dev it might matter more because the common use
case is to just dump the entire DPCD, and some displays
violate the spec by having black holes inside the DPCD.
What I don't rembmer is whether those black holes actually
result in short replies, or whether the entire AUX transfer
gets rejected when it hits one even partially.

The other concern with not handling short replies correctly
is that writes (and even some reads) can have side effects.
So when a short reply arrives we may have already triggered 
some side effects while still claiming that the access
completely failed.

I suppose if someone was sufficiently motivated they could
try to handle short replies more correctly and keep retrying
the remaining bytes (assuming that is the correct way to
handle them). Although with those black holes I guess
you'd eventually have to give up anyway before having
transferred all the bytes.

-- 
Ville Syrjälä
Intel
