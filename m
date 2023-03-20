Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C966C06BC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 01:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912B210E060;
	Mon, 20 Mar 2023 00:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337DE10E049;
 Mon, 20 Mar 2023 00:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679270739; x=1710806739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iYimstyp/pRnUkyJVlD+F+MoAZeB8XQ6Y5NtxxJFUlU=;
 b=deTWtKthV7BS8TsRTkCXpP37nXWeGD/oGm/gMI5HtjsJ+tibU6RHOlur
 stRSvfpB9KKd+BWiK0sf2UBIE3Ej13Bihrpuz+LGWbqC0QUIYTSefOSaE
 KO9vTLwC3JNgVKN2imtTd4xUPvjarbP8uyxY/F7XyvxiUGc1TwnWwiRj2
 4rf3fPDXrlaHLmBlR45hb/CFGt9B8Sz6UnIJqONJ4MHWbybErAEcG1oL4
 XtfRwwsIoQrdd8+iOgnmT0bPNpM+IJVWKbkDNaUewhGoh2Ljd1ppGJ11P
 fJvXU+ug5bezvqn+9q/S1/l4g0b6f5CIa5tF8yyMbguaFOYCSC5OpiOi4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="401125644"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="401125644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 17:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="711123002"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="711123002"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 17:05:34 -0700
Date: Mon, 20 Mar 2023 01:05:09 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Flush lmem contents after construction
Message-ID: <ZBejNeB9mox9kStu@ashyti-mobl2.lan>
References: <20230316165918.13074-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316165918.13074-1-nirmoy.das@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 stable@vger.kernel.org, Chris Wilson <chris.p.wilson@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Thu, Mar 16, 2023 at 05:59:18PM +0100, Nirmoy Das wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> i915_gem_object_create_lmem_from_data() lacks the flush of the data
> written to lmem to ensure the object is marked as dirty and the writes
> flushed to the backing store. Once created, we can immediately release
> the obj->mm.mapping caching of the vmap.
> 
> Fixes: 7acbbc7cf485 ("drm/i915/guc: put all guc objects in lmem when available")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.16+
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
