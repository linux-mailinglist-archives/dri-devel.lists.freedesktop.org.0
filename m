Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AA1427EE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 11:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E26E89D;
	Mon, 20 Jan 2020 10:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896EC6E899;
 Mon, 20 Jan 2020 10:11:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19943394-1500050 for multiple; Mon, 20 Jan 2020 09:54:34 +0000
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: akeem.g.abodunrin@intel.com, d.scott.phillips@intel.com,
 daniel.vetter@intel.com, david.c.stewart@intel.com,
 dri-devel@lists.freedesktop.org, francesco.balestrieri@intel.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 jon.bloomfield@intel.com, joonas.lahtinen@linux.intel.com,
 mika.kuoppala@intel.com, omer.aran@intel.com, pragyansri.pathi@intel.com,
 prathap.kumar.valsan@intel.com, sudeep.dutt@intel.com, tony.luck@intel.com
References: <20200116174655.85926-1-akeem.g.abodunrin@intel.com>
 <20200116174655.85926-3-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200116174655.85926-3-akeem.g.abodunrin@intel.com>
Message-ID: <157951407310.10361.13824742770612575826@skylake-alporthouse-com>
Subject: Re: [RFC PATCH v3 2/2] drm/i915/gen7: Clear all EU/L3 residual
 contexts
Date: Mon, 20 Jan 2020 09:54:33 +0000
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

Quoting Akeem G Abodunrin (2020-01-16 17:46:55)
> +static u32
> +gen7_fill_interface_descriptor(struct batch_chunk *state,
> +                              const struct batch_vals *bv,
> +                              const struct cb_kernel *kernel,
> +                              unsigned int count)
> +{
> +       u32 *cs = batch_alloc_items(state, 32, 8 * count);
> +       u32 offset = batch_offset(state, cs);
> +
> +       *cs++ = gen7_fill_kernel_data(state, kernel->data, kernel->size);
> +       *cs++ = (1 << 7) | (1 << 13);
> +       *cs++ = 0;
> +       *cs++ = (gen7_fill_binding_table(state, bv) - state->offset) | 1;
> +       *cs++ = 0;
> +       *cs++ = 0;
> +       *cs++ = 0;
> +       *cs++ = 0;
> +       /* 1 - 63dummy idds */
> +       memset32(cs, 0x00, (count - 1) * 8);
> +       batch_advance(state, cs);

cs is not at the end of the pack here. [cs + (count - 1) * 8]

> +
> +       return offset;
> +}

All others look ok.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
