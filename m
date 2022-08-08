Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7358CC37
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 18:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7CB10E9AC;
	Mon,  8 Aug 2022 16:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0777010E3B9;
 Mon,  8 Aug 2022 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659976699; x=1691512699;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZdtKQDr/7hNuJqSsyBjbXL9BpkN6bXL5MCwDsuiI8z4=;
 b=ZuZzv9coZa3TfZLliNsJn9KtBerX3l9ilTnPBkwYoQu5ly0CjMLHCZcn
 sKBpYSWnee77jth0Ck8CxVGqd+mU0XbStW6kRW4W5qmWRno7lTYL++48K
 UZSMLgOvzlj9miTld7+RVF4K71joIcxNL3h+rRieZjtsXiRacqg0xiE/b
 VXnrN5YSwqcuCmXrJ2qPbNnvU44v2QouA6GcFDiZ3/lMecfVEbvUe00L5
 v8CYlwEjH3LcG/2FPPCrriOBlgdzvMitG5F+yM4Q7T+m+4xCRm8P0y5GD
 bL1yDIXWzmZ9PwPmzRzM1imIIopI0alg7GrPfF5i2zDTmrDB7S2nKHPTM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="290645220"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="290645220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 09:38:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="664030714"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.40.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 09:38:00 -0700
Date: Mon, 8 Aug 2022 18:37:58 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 1/3] drm/i915: pass a pointer for tlb seqno at
 vma_invalidate_tlb()
Message-ID: <YvE75o0uOtDGayNK@alfio.lan>
References: <cover.1659598090.git.mchehab@kernel.org>
 <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
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
 Michael Cheng <michael.cheng@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Thu, Aug 04, 2022 at 09:37:22AM +0200, Mauro Carvalho Chehab wrote:
> WRITE_ONCE() should happen at the original var, not on a local
> copy of it.
> 
> Fixes: 5d36acb7198b ("drm/i915/gt: Batch TLB invalidations")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Are you going to send it to the stable mailing list?

Andi
