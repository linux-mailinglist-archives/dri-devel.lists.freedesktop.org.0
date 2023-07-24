Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1775EED5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4AC10E296;
	Mon, 24 Jul 2023 09:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FBB10E295;
 Mon, 24 Jul 2023 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690190073; x=1721726073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q9VW+kxIEMRkkLyl4DqyG1uVPVD+dhO/5CYN521JQtQ=;
 b=RKA4f5hK7rriNAuX6BlGco96O/4uw0xQ4EAGOgEJ1w4hngjAmy43q8v8
 wsdFCirriXD9Od6ojECrPCzx+KtNfUz67qmuuz9Vyobn0Q32E3ut36Hy4
 hXCKbU4Lj4GU1Kh7ivCuFrCklo+gecr8ePRoRK17sj6ec6s6R4zvJnMol
 5OGzNmmoksoxYX+kAvPq1wksNPijuyKuDnTFLYRL90TZJWAaH8FFqe8kB
 qkut1xvkW4sm85Wz9Gt+H+qM+KBGKT1L7MTFy7Y5h0R/zHFmcNV4MyhTc
 NEMfEnLZGlmS7FTZrsykecaKzvLlB1ywGWs4XrEi7ek/xZ4oU6isezsmj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="431186927"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="431186927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="839379527"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="839379527"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.166])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:14:30 -0700
Date: Mon, 24 Jul 2023 11:14:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v8 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Message-ID: <ZL5A82eugN0hbFjr@ashyti-mobl2.lan>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-8-andi.shyti@linux.intel.com>
 <3b7e1781-ca2b-44b3-846d-89e42f24106e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b7e1781-ca2b-44b3-846d-89e42f24106e@intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-stable <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

> >   	intel_engine_mask_t aux_inv = 0;
> > -	u32 cmd, *cs;
> > +	u32 cmd_flush = 0;
> > +	u32 cmd = 4;
> > +	u32 *cs;
> > -	cmd = 4;
> > -	if (mode & EMIT_INVALIDATE) {
> > +	if (mode & EMIT_INVALIDATE)
> >   		cmd += 2;
> > -		if (gen12_needs_ccs_aux_inv(rq->engine) &&
> > -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> > -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> > -			aux_inv = rq->engine->mask &
> > -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> > -			if (aux_inv)
> > -				cmd += 4;
> > -		}
> > +	if (gen12_needs_ccs_aux_inv(rq->engine))
> > +		aux_inv = rq->engine->mask &
> > +			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> 
> Shouldn't we remove BCS check for MTL? And move it inside
> gen12_needs_ccs_aux_inv?
> Btw aux_inv is used as bool, make better is to make it bool.

Both the cleanups come in patch 9. I wanted to move it initially
before, but per engine check come later in the series.

I think would need to re-architecture all the patch structure if
I want to remove it :)

Are you strong with this change?

Andi
