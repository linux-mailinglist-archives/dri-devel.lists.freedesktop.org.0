Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B905437060F
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 08:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175726F89F;
	Sat,  1 May 2021 06:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA146F89F;
 Sat,  1 May 2021 06:56:24 +0000 (UTC)
IronPort-SDR: eA/cbPPRM3sKQ3GUve7pQQnv5ApNOQ8PKnOVipCF5ST9Q6W2U2kkweJR7Yep3Ty5l0YBCpKNYg
 DreEqNM0xHWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="197003038"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="197003038"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 23:56:22 -0700
IronPort-SDR: iISgZrEM8tXwt1gfsgqditnkkFTdoqYx1XwRNOPohiNz/ulOQE6KO8aqavxxQuH9TN5a+hBdvC
 PjisaWCbvKFw==
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="467135876"
Received: from rong2-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.36.10])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 23:56:22 -0700
Date: Fri, 30 Apr 2021 23:56:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/debugfs: Expose read mask in
 i915_wa_registers
Message-ID: <20210501065621.72pronn43ruwd6ex@ldmartin-desk2>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
 <20210429091254.855248-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429091254.855248-3-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 10:12:50AM +0100, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>In order to stop conflating the validation via readback with the
>workaround mask I need to expose the read mask separately so
>gem_workarounds IGT can continue operating correctly.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>index 8dd374691102..b9c81376a413 100644
>--- a/drivers/gpu/drm/i915/i915_debugfs.c
>+++ b/drivers/gpu/drm/i915/i915_debugfs.c
>@@ -757,9 +757,9 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
> 			   engine->name, count);
>
> 		for (wa = wal->list; count--; wa++)
>-			seq_printf(m, "0x%X: 0x%08X, mask: 0x%08X\n",
>+			seq_printf(m, "0x%X: 0x%08X, mask: 0x%08X, read: 0x%08X\n",
> 				   i915_mmio_reg_offset(wa->reg),
>-				   wa->set, wa->clr);
>+				   wa->set, wa->clr, wa->read);
>
> 		seq_printf(m, "\n");
> 	}
>-- 
>2.30.2
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
