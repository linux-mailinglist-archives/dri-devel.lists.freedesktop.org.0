Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08144DA6AB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 01:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB87B10E148;
	Wed, 16 Mar 2022 00:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9D110E148;
 Wed, 16 Mar 2022 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647389234; x=1678925234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ygjfqwp3EHt30RrjzD06RNXioZqDuAH0c1PGgaUSx28=;
 b=TeiStkNgTUh679upm3JJ7SVpo1Fopmli3C87LrfhCpAly1iFd5e+QcEr
 H5+Ptl7Nsw0XloNjzt3COXMXHm2dNS4tr4c66VxBF2wcalqirJBXHhSjI
 yg0QNl3G+7Dj0c4plq8bRpJUNSE/a+8Id5lMJIATOO89iVjHq8YIpPHWA
 XrDGbKnkFnH3fpQ7NVr+kvAtGDJREsLWXzAtVOHUzmSbdijrPOFzIPKq6
 3n6J0rwnw4Yqbme86Gf0JAphbH+V/d5q18kUuquF83BHwU3bdksnXEld3
 nZycmN8hPTG2DHUu3BI1nFlJj7iHSDH227fgGKScwKvOpPwLHXy9hYNy5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="255280074"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="255280074"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 17:07:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="512810883"
Received: from bpham-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.162.166])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 17:07:12 -0700
Date: Tue, 15 Mar 2022 17:07:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/guc: add steering info to GuC register
 save/restore list
Message-ID: <20220316000712.fbhzrj3orvho5fvt@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220314234203.799268-1-matthew.d.roper@intel.com>
 <20220314234203.799268-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220314234203.799268-3-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 04:42:02PM -0700, Matt Roper wrote:
>From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
>GuC has its own steering mechanism and can't use the default set by i915,
>so we need to provide the steering information that the FW will need to
>save/restore registers while processing an engine reset. The GUC
>interface allows us to do so as part of the register save/restore list
>and it requires us to specify the steering for all multicast register, even
>those that would be covered by the default setting for cpu access. Given
>that we do not distinguish between registers that do not need steering and
>registers that are guaranteed to work the default steering, we set the
>steering for all entries in the guc list that do not require a special
>steering (e.g. mslice) to the default settings; this will cost us a few
>extra writes during engine reset but allows us to keep the steering
>logic simple.
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
