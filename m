Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA77AD606A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 22:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2A310E732;
	Wed, 11 Jun 2025 20:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaMypwD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324B410E71A;
 Wed, 11 Jun 2025 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749675289; x=1781211289;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eKmSOkzdxVVul/hPeQ8DgKIeSjxZ8vSw2NWi03EzGs0=;
 b=WaMypwD8yVEp9tmaEJ6q0p/UrOBwZSLKRgLvoYdVrwdDEDh5RVWGeGjh
 mfi6ynDJ5GxLVjd3TFouhK15HcmDTygZRpWAIw2IKJ8jbNMq6inw0mapA
 TuiuvpOC3evd3B91tPcEfvGryLFD1rTx7MXJJwIF0H57tDH52P+z0nBvb
 Yab0uas5tPBlayU50K1E6sFRKb6F8zZ3HVeEkMxEoeXS5IOc3b3HubnNu
 Gl4VZWgs6STnWeTnBDYZJ9Jdftyeps8CeVL2gGRj43fh50rVx5jnUv5Ot
 eu9HuUaMA/v56dUZgA2wH52Znc25HLYRYBxAfP6u58DYTSutNiM8oYFM+ A==;
X-CSE-ConnectionGUID: f0PiZjD+RAG74Oh+COUgtA==
X-CSE-MsgGUID: auRFgrqsSD2p0NctNbjaWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69395097"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="69395097"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:54:48 -0700
X-CSE-ConnectionGUID: pMDvgjCaQ7G27MRwXMMN1Q==
X-CSE-MsgGUID: JjozI0owS7e5vv/exMOANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="178216137"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.195])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:54:43 -0700
Date: Wed, 11 Jun 2025 22:54:40 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>,
 "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Message-ID: <aEntEHqvZ10SaE8u@ashyti-mobl2.lan>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
 <IA3PR11MB89873936B6D887A59ABD909CD075A@IA3PR11MB8987.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA3PR11MB89873936B6D887A59ABD909CD075A@IA3PR11MB8987.namprd11.prod.outlook.com>
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

Hi Nitin,

On Wed, Jun 11, 2025 at 03:45:30PM +0000, Gote, Nitin R wrote:
> [...]
> > Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA alloc
> > error
> >
> 
> Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ring_submission:"  file name in the commit title.

good observation, I missed it. I agree with Nitin on this, it can
be fixed before merging.

Andi
