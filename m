Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A809C46F7F9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 01:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D244A10E1C7;
	Fri, 10 Dec 2021 00:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6F710E1BE;
 Fri, 10 Dec 2021 00:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639095757; x=1670631757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N+TLdPa2/ucNulcCsBDv5IHNJ3V0+AJVe1EuXnB73QQ=;
 b=GqE8C5yXu/+7/3ItHZnRppfUWfi+JxWDBgUMqwpGuawduZs4IlZa94bx
 zakCRsjkIOEuxtRLt1KzNDn75TQBLexzUcrgueH88GIygbg8ExdHv0frX
 Tgb9Bmjo6IkcbcAJQKl7qq1ClKoK/cLjSNx+PjxWjfy43pX6583ZHD/kC
 qBFIt81EK4rCzxgxlpUSy4C3y9BEBWROvhwTlvlVuDe0AAukuAB6ET8c+
 11eABC9WL8TTSSeEwYhfuccafDPMdD1127bBx27PrKpzMOQhkp3dqS+P9
 Mk09o4QnrnILX9y1hFUJP55Kjl1VhuXGO3ItKJaLKNi3of1VCMExkhHrB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="235748472"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="235748472"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 16:22:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="750529675"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 16:22:36 -0800
Date: Thu, 9 Dec 2021 16:22:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 08/11] drm/i915/pxp: Use to_gt() helper
Message-ID: <20211210002235.GZ2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-9-andi.shyti@linux.intel.com>
 <20211209235904.GV2219399@mdroper-desk1.amr.corp.intel.com>
 <YbKdoQWaVYzRUobN@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbKdoQWaVYzRUobN@intel.intel>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 02:21:53AM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> > > -static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
> > > +static  struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
> > 
> > Was dropping the inline here intentional?  It doesn't seem like there's
> > any reason to drop it, and if it was intentional the whitespace isn't
> > quite right.
> 
> No, it wasn't intentional and it's strange that checkpatch
> didn't catch it. I will resend this one.

With the 'inline' re-added, you can include

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> 
> Thanks!
> Andi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
