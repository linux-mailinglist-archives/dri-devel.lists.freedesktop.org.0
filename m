Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F04161C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 17:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8906E0F5;
	Thu, 23 Sep 2021 15:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE616E0A6;
 Thu, 23 Sep 2021 15:10:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="223904164"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="223904164"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 08:10:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="551160791"
Received: from lloh-mobl.ger.corp.intel.com (HELO localhost) ([10.249.35.91])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 08:10:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Akira Yokosawa <akiyks@gmail.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/guc,
 docs: Fix pdfdocs build error by removing nested grid
In-Reply-To: <4a227569-074f-c501-58bb-d0d8f60a8ae9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <4a227569-074f-c501-58bb-d0d8f60a8ae9@gmail.com>
Date: Thu, 23 Sep 2021 18:10:23 +0300
Message-ID: <87czozba5c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 20 Sep 2021, Akira Yokosawa <akiyks@gmail.com> wrote:
> Nested grids in grid-table cells are not specified as proper ReST
> constructs.
> Commit 572f2a5cd974 ("drm/i915/guc: Update firmware to v62.0.0")
> added a couple of kerneldoc tables of the form:
>
>   +---+-------+------------------------------------------------------+
>   | 1 |  31:0 |  +------------------------------------------------+  |
>   +---+-------+  |                                                |  |
>   |...|       |  |  Embedded `HXG Message`_                       |  |
>   +---+-------+  |                                                |  |
>   | n |  31:0 |  +------------------------------------------------+  |
>   +---+-------+------------------------------------------------------+
>
> For "make htmldocs", they happen to work as one might expect,
> but they are incompatible with "make latexdocs" and "make pdfdocs",
> and cause the generated gpu.tex file to become incomplete and
> unbuildable by xelatex.
>
> Restore the compatibility by removing those nested grids in the tables.
>
> Size comparison of generated gpu.tex:
>
>                   Sphinx 2.4.4  Sphinx 4.2.0
>   v5.14:               3238686       3841631
>   v5.15-rc1:            376270        432729
>   with this fix:       3377846       3998095
>
> Fixes: 572f2a5cd974 ("drm/i915/guc: Update firmware to v62.0.0")
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Pushed to drm-intel-gt-next, thanks for the patch.

This makes the HTML output arguably worse, but there were no comments
from anyone and the pdf build needs to work.

BR,
Jani.



> ---
> Hi all,
>
> I know there is little interest in building pdfdocs (or LaTeX) version
> of kernel-doc, and this issue does not matter most of you.
>
> But "make pdfdocs" is supposed to work, give or take those tables
> with squeezed columns, and at least it is expected to complete
> without fatal errors.
>
> I have no idea who is responsible to those grid-tables, so added
> a lot of people in the To: and Cc: lists.
>
> Does removing those nested grids look reasonable to you?
>
> Any feedback is welcome!
>
> Note: This patch is against the docs-next branch of Jon's -doc tree
> (git://git.lwn.net/linux.git).  It can be applied against v5.15-rc1
> and v5.15-rc2 as well.
>
>         Thanks, Akira
> --
>  .../gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h | 10 +++++-----
>  .../drm/i915/gt/uc/abi/guc_communication_mmio_abi.h    | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> index 99e1fad5ca20..c9086a600bce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> @@ -102,11 +102,11 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>   *  |   +-------+--------------------------------------------------------------+
>   *  |   |   7:0 | NUM_DWORDS = length (in dwords) of the embedded HXG message  |
>   *  +---+-------+--------------------------------------------------------------+
> - *  | 1 |  31:0 |  +--------------------------------------------------------+  |
> - *  +---+-------+  |                                                        |  |
> - *  |...|       |  |  Embedded `HXG Message`_                               |  |
> - *  +---+-------+  |                                                        |  |
> - *  | n |  31:0 |  +--------------------------------------------------------+  |
> + *  | 1 |  31:0 |                                                              |
> + *  +---+-------+                                                              |
> + *  |...|       | [Embedded `HXG Message`_]                                    |
> + *  +---+-------+                                                              |
> + *  | n |  31:0 |                                                              |
>   *  +---+-------+--------------------------------------------------------------+
>   */
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
> index bbf1ddb77434..9baa3cb07d13 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
> @@ -38,11 +38,11 @@
>   *  +---+-------+--------------------------------------------------------------+
>   *  |   | Bits  | Description                                                  |
>   *  +===+=======+==============================================================+
> - *  | 0 |  31:0 |  +--------------------------------------------------------+  |
> - *  +---+-------+  |                                                        |  |
> - *  |...|       |  |  Embedded `HXG Message`_                               |  |
> - *  +---+-------+  |                                                        |  |
> - *  | n |  31:0 |  +--------------------------------------------------------+  |
> + *  | 0 |  31:0 |                                                              |
> + *  +---+-------+                                                              |
> + *  |...|       | [Embedded `HXG Message`_]                                    |
> + *  +---+-------+                                                              |
> + *  | n |  31:0 |                                                              |
>   *  +---+-------+--------------------------------------------------------------+
>   */
>  
>
> base-commit: 242f4c77b1c8cebfdfa0ad5b40e2e4ae0316e57d

-- 
Jani Nikula, Intel Open Source Graphics Center
