Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B863A8F1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 14:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD5C10E1C5;
	Mon, 28 Nov 2022 13:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C1B10E1C5;
 Mon, 28 Nov 2022 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669640916; x=1701176916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0mI3CupUv+FkZ+g4dWt/8iqgKcnzWmAafzdVcmvJiQg=;
 b=Jb0yJzNqSXKbwlKgSdrSclYWHvtFzHF9Cl1SF9G8oxlDeD1C6Cjkj2dQ
 kFXFYYrhI9bvvWb+ZureQid7DOJEqLPvnpgz6/eBnhQe8UDUV+x13omN9
 iVRz/+VAgZsl4R2xYVy0eyZ0aMGu2kTZJsiaE9bx5nQ3CGERRLTIlUyM8
 ga3ps50jRd2iXHTwxlYgoXuWMMrenbAgZ0Qwn9DxYdtIDasPrU3zau0Au
 H8Apmb7QVfjhi0Xpo+W031xuCmQs/fzXBM3tbH+IN4yD6i4fhubk8WYEg
 Rf87O7+0tS2aSwtAjf+eIooqffxyg7WcAjmC72HGgGunbqD76MJBkD8VH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="379083590"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="379083590"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 05:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="643380467"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="643380467"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 28 Nov 2022 05:08:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Nov 2022 15:08:31 +0200
Date: Mon, 28 Nov 2022 15:08:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence
 on driver unload
Message-ID: <Y4Syz9kXp1JPal4I@intel.com>
References: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
 <Y4DI+gq1rVQXDRbg@intel.com>
 <119a95f9-9c54-d811-8c2f-f3ecd52258c9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <119a95f9-9c54-d811-8c2f-f3ecd52258c9@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 01:10:58AM -0800, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 11/25/2022 5:54 AM, Ville Syrjälä wrote:
> > On Thu, Nov 10, 2022 at 04:56:51PM -0800, Daniele Ceraolo Spurio wrote:
> >> The fence is always initialized in huc_init_early, but the cleanup in
> >> huc_fini is only being run if HuC is enabled. This causes a leaking of
> >> the debug object when HuC is disabled/not supported, which can in turn
> >> trigger a warning if we try to register a new debug offset at the same
> >> address on driver reload.
> >>
> >> To fix the issue, make sure to always run the cleanup code.
> > This oopsing in ci now. Somehow the patchwork run did not
> > hit that oops.
> 
> Can you point me to the oops log? I opened a few recent runs at random 
> but I wasn't able to find it.

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html

-- 
Ville Syrjälä
Intel
