Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46B702C60
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 14:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7760410E1B5;
	Mon, 15 May 2023 12:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2CA10E1B4;
 Mon, 15 May 2023 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684152740; x=1715688740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/tQXku2nSDWOQXYob0SDaOI/jjzVm1MPYEyd7ym45KA=;
 b=Z9ynp3oK5avR6MCUgYy8b+oZcrrKvF4rGCYEz9JCh2+Pba2fsFSCCqaJ
 WCSXgnW2iszoS5CH4Uco3VrEWv+2O342mLxzBJrIWFvuvxlEOQbiFwjrH
 rEc3xW5qibVaP6y907jzh37cFq+YTDuvo44cfBYBMbQTSf97vNzXOaA7R
 s5cLTbZOy44P7QDuRZr7KlQgtSuNNuTfq6VKPMo/4fiNTP+cwvpz5MULZ
 86hSF2ctcniDKZYsLKFHmNSxekZQe7jUCSXOM9hKkiBgC1TZ0tRemAhZm
 XGtT0zPx+f4X3TGsazGi9QgkbhKHWCQZy0x+qkpB9jTEgwZ4b8YhHi5YO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="330802884"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="330802884"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 05:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="765899327"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="765899327"
Received: from dkanafee-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.48.254])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 05:12:17 -0700
Date: Mon, 15 May 2023 14:12:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH v8 2/2] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZGIhngPeHyKiTsGn@ashyti-mobl2.lan>
References: <20230512232825.1253644-1-fei.yang@intel.com>
 <20230512232825.1253644-3-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512232825.1253644-3-fei.yang@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Fri, May 12, 2023 at 04:28:25PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> 
> IGT posted at https://patchwork.freedesktop.org/series/117695/

Test gem_create@create-ext-set-pat

> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> 
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>

we need here an explicit ack to have the paper work in place. So
that I still have to ask Jordan and Mesa folks to give an ack if
things look right.

Thanks!
Andi

> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

PS:

nitnitnitpick: the tags need to come in chronological order. So
that:

 - first you wrote it (Sob: Fei...)
 - then you sent it (Cc: ...)
 - then it has been reviewd (R-b)
 - finally tested (T-b)

I see that many people put the "Cc:" before the "Sob:" and I
consider it a matter of taste (which might mean "I first prepare
the mail (Cc:) and then I send it (Sob:)").

But... don't mind too much at these things.

Andi
