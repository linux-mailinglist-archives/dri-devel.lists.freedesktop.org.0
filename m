Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144267C832A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A3110E5D4;
	Fri, 13 Oct 2023 10:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E3510E073;
 Fri, 13 Oct 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697193321; x=1728729321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dRD1R6Bcz0Q2LAjc9mqGk0QA/wUXw3PBDTNmpI6pe/I=;
 b=mYnAWd2JRyNxFpoVdKqnJzG5P5X5/gJWqyK2BG1pt9tuZuK6t9iokQVv
 UL7kGgCBUqFU6Th0lgarUm1iFk2fJuDq5BKWL5in9dWafUZYA0JJhCp2f
 Jhl9h6PpoSxbDmfEuEl1azLAVecNKTl8t/JRzQx+XwWwqg2PQ57e9toul
 ShhAje6UBk+noIhATabt1+QGUkOL7n7w/Pfq3u03JJx9knf8fZmpaH9wm
 MYa+F+1ePPzKX5PWa4ZOXAEVWym3tFaak60cw3t6qVnTKyIBnh7mPhD1z
 oXlarUPDu+TL7lQhzRj7vGMDjfpXi+tZDdtqlVZDFvNXPgQ+jA+wyu18j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375502105"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="375502105"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731321136"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731321136"
Received: from kesooi-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.215.155.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:35:13 -0700
Date: Fri, 13 Oct 2023 12:35:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <ZSkdXLTqGY0z/PCI@ashyti-mobl2.lan>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013103140.12192-1-nirmoy.das@intel.com>
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
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
> gen8_ggtt_invalidate() is only needed for limitted set of platforms

/limitted/limited/

> where GGTT is mapped as WC otherwise this can cause unwanted
> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
> valid.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
