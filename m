Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165466E847A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D857A10EB37;
	Wed, 19 Apr 2023 22:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB0A10EB37;
 Wed, 19 Apr 2023 22:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942657; x=1713478657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J1XMdyG2DLWGqRoD2xDrifRAoJo/+VhzemFsMDP7NIQ=;
 b=aM9+IPNhXJDEmyE279uVw7orhifmbuEsqN4OXPeMZrXlQc1kPjLLW24K
 MvB77REULrgOK77TPakX/ojOGUOmDwUFI28dHU8WCZqn1B50typ4hTZ35
 RQThgisUbjFmnSCtPJamEl+zOB8kMnY1kWBKZDv9rS3EiT0LJhcbYlY4R
 aa9TMUceqnNxiBE4l2c8vRGeSUlRMT+uesNK8MOa56JNuIKnh4KhDqA/P
 4iQGa3Jw73xhN+pzDb86kWGb966ojuSmJKzKWol56oZYHoZ0UsmLmWyJm
 Yd5tDRReYuylfBrksywfPZbe9QOZ8jkaXWo6M4WnJujDJSgYiSyIWSI91 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="343054860"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="343054860"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694237640"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="694237640"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:14:21 -0700
Date: Thu, 20 Apr 2023 00:14:18 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH 8/8] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZEBnujNRkCmEz2nn@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-9-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-9-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Wed, Apr 19, 2023 at 02:12:19PM -0700, fei.yang@intel.com wrote:
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
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

That's the last one... I think you addressed all the comments!
Please add the r-b's I updated if you are going to send another
version, if not (and I hope so) they should be added by
patchwork.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
