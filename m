Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B458A87E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 11:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFF6A08DC;
	Fri,  5 Aug 2022 09:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C913918BADD;
 Fri,  5 Aug 2022 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659690493; x=1691226493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VCbk/q9Wd0lGTGIEGbC69VxKX0QDmTy8SvpJ1KoCfF0=;
 b=biSEyLDpCGbC085vqq4/C7VcR++Gz//BsrGNyI6UYr4FpmOL3E1o6lR2
 TikNhO5QuSbvVNEFVIt3KNTiCwKRxvcBluqyClmMyYPHpmwrRFoX/RW+V
 LHG6mD4MDTWoUi+QO5WBxylKaYOYMmZ6VrZjCKzU2tZzrHq9ZKFgZWTuD
 obUhfGUVuGRwjMrTy5OsaY4LS/Tw66zzFebJOax3Qcx9rAylKisq2lMIt
 zdnjoxFDc3BGrF+hES5qwMEnAbaVJQw0HJYF20W9ldCk6senONYh1/dLk
 9nECiHfPoOE/fadh/BNwz0PQbZ6uqc5+kg7o0xtvw/Sp9Nl5WXIJBIg1F Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="273204375"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="273204375"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:08:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="631945398"
Received: from mborg-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.214.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:08:07 -0700
Date: Fri, 5 Aug 2022 11:08:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 3/3] drm/i915/gt: document TLB cache invalidation
 functions
Message-ID: <Yuzd9Ysc3BDQHuSW@alfio.lan>
References: <cover.1659598090.git.mchehab@kernel.org>
 <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
 <0698c5a5-3bf2-daa4-e10e-2715f9b0d080@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0698c5a5-3bf2-daa4-e10e-2715f9b0d080@infradead.org>
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
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 linux-doc@vger.kernel.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

> > +/**
> > + * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
> > + * @gt: GT structure
> 
> In multiple places (here and below) it would be nice to know what a
> GT structure is. I looked thru multiple C and header files yesterday
> and didn't find any comments about it.
> 
> Just saying that @gt is a GT structure isn't very helpful, other
> than making kernel-doc shut up.

the 'gt' belongs to the drivers/gpu/drm/i915/gt/ subsystem and
it's widely used a throughout i915.

I think it's inappropriate to describe it just here. On the other
hand I agree that a better documentation is required for the GT
itself where other parts can point to.

Andi
