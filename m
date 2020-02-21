Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5791680B4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 15:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BC56F464;
	Fri, 21 Feb 2020 14:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1061D6F464;
 Fri, 21 Feb 2020 14:48:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 06:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="230451573"
Received: from cwilso3-mobl.fi.intel.com (HELO localhost) ([10.251.87.71])
 by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2020 06:48:30 -0800
MIME-Version: 1.0
From: Chris Wilson <chris.p.wilson@intel.com>
User-Agent: alot/0.6
To: akeem.g.abodunrin@intel.com, d.scott.phillips@intel.com,
 daniel.vetter@intel.com, david.c.stewart@intel.com,
 dri-devel@lists.freedesktop.org, francesco.balestrieri@intel.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 jon.bloomfield@intel.com, joonas.lahtinen@linux.intel.com,
 mika.kuoppala@intel.com, omer.aran@intel.com, pragyansri.pathi@intel.com,
 prathap.kumar.valsan@intel.com, sudeep.dutt@intel.com, tony.luck@intel.com
References: <20200220230023.18905-1-akeem.g.abodunrin@intel.com>
 <20200220230023.18905-2-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200220230023.18905-2-akeem.g.abodunrin@intel.com>
Message-ID: <158229650841.6499.5335926375673137684@skylake-alporthouse-com>
Subject: Re: [PATCH v4 1/2] drm/i915: Add mechanism to submit a context WA on
 ring submission
Date: Fri, 21 Feb 2020 14:48:28 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akeem G Abodunrin (2020-02-20 23:00:22)
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> 
> This patch adds framework to submit an arbitrary batchbuffer on each
> context switch to clear residual state for render engine on Gen7/7.5
> devices.
> 
> The idea of always emitting the context and vm setup around each request
> is primary to make reset recovery easy, and not require rewriting the
> ringbuffer. As each request would set up its own context, leaving it to
> the HW to notice and elide no-op context switches, we could restart the
> ring at any point, and reorder the requests freely.
> 
> However, to avoid emitting clear_residuals() between consecutive requests
> in the ringbuffer of the same context, we do want to track the current
> context in the ring. In doing so, we need to be careful to only record a
> context switch when we are sure the next request will be emitted.
> 
> This security mitigation change does not trigger any performance
> regression. Performance is on par with current mainline/drm-tip.
> 
> v2: Update vm_alias params to point to correct address space "vm" due to
> changes made in the patch "f21613797bae98773"
> 
> v3-v4: none
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Balestrieri Francesco <francesco.balestrieri@intel.com>
> Cc: Bloomfield Jon <jon.bloomfield@intel.com>
> Cc: Dutt Sudeep <sudeep.dutt@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@intel.com>
-Chris
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
