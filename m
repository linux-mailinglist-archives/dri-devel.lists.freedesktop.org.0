Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0661680F0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 15:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B586E356;
	Fri, 21 Feb 2020 14:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931216E356;
 Fri, 21 Feb 2020 14:56:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 06:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="259639700"
Received: from cwilso3-mobl.fi.intel.com (HELO localhost) ([10.251.87.71])
 by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2020 06:56:21 -0800
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
 <20200220230023.18905-3-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200220230023.18905-3-akeem.g.abodunrin@intel.com>
Message-ID: <158229697947.6499.9383893602491436028@skylake-alporthouse-com>
Subject: Re: [PATCH v4 2/2] drm/i915/gen7: Clear all EU/L3 residual contexts
Date: Fri, 21 Feb 2020 14:56:19 +0000
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

Quoting Akeem G Abodunrin (2020-02-20 23:00:23)
> +static void emit_batch(struct i915_vma * const vma,
> +                      u32 *start,
> +                      const struct batch_vals *bv)
> +{
> +       struct drm_i915_private *i915 = vma->vm->i915;
> +       unsigned int desc_count = 64;
> +       const u32 urb_size = 112;
> +       struct batch_chunk cmds, state;
> +       u32 interface_descriptor;
> +       unsigned int i;
> +
> +       batch_init(&cmds, vma, start, 0, bv->cmd_size);
> +       batch_init(&state, vma, start, bv->state_start, bv->state_size);
> +
> +       interface_descriptor =
> +               gen7_fill_interface_descriptor(&state, bv,
> +                                              IS_HASWELL(i915) ?
> +                                              &cb_kernel_hsw :
> +                                              &cb_kernel_ivb,
> +                                              desc_count);

Negligible in the grand scheme of things, but there was a
STATE_CACHE_INVALIDATION flush just prior to this batch.

> +       gen7_emit_pipeline_flush(&cmds);
> +       batch_add(&cmds, PIPELINE_SELECT | PIPELINE_SELECT_MEDIA);
> +       batch_add(&cmds, MI_NOOP);

What's the reason for the noop here?

> +       gen7_emit_state_base_address(&cmds, interface_descriptor);
> +       gen7_emit_pipeline_flush(&cmds);

And iirc, this is recommended for SBI. Does this flush require a
CS_STALL?

> +       gen7_emit_vfe_state(&cmds, bv, urb_size - 1, 0, 0);
> +
> +       gen7_emit_interface_descriptor_load(&cmds,
> +                                           interface_descriptor,
> +                                           desc_count);
> +
> +       for (i = 0; i < bv->max_primitives; i++)
> +               gen7_emit_media_object(&cmds, i);
> +
> +       batch_add(&cmds, MI_BATCH_BUFFER_END);
> +}

I can't comment on the efficacy of the kernels, but the code is finally
passing CI and the batch takes long enough that it has to be doing
something! Just running a giant loop mostly.

Acked-by: Chris Wilson <chris.p.wilson@intel.com>
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
