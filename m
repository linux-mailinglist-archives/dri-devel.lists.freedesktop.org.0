Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C560A2A90A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC7110E2EE;
	Thu,  6 Feb 2025 13:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApPAn2Lp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76F010E2EE;
 Thu,  6 Feb 2025 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738847198; x=1770383198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OZmGqMNbL8n4gDzlvdwSF3mBzpZ5AeQcngrVp9YIMv4=;
 b=ApPAn2Lpe997VnDgqSyCfH4oVHcOVIoI7hiAI7unhHaic/ebvxJpCUcq
 1Eskaf1IYt8tc7BH7UYTazIHEA+uFwb0L93g3o3TeZd2HKf3YPlaxbKdm
 gq9TiVf7aanYgrazceYlswCFufTGKcwtTQ+ZmS3Bj2tdt27/ZPnmc6jSI
 0D4/7wpd9I3tfeJNIRLI8jEQEaqclvNInigkm4IgERaMAIInBQ6sdNcRj
 kz0xWB6dQDnqju6N8ZDQ6HKPj1lpMhcJLXGQ4oWWoG62jUmqh5JZ13ybA
 z3K16TJuTsAObgvtLj/rprT/VcBBj4UcnxpoMoz9Zfb8hPvA3I7DW7dkz g==;
X-CSE-ConnectionGUID: nVYJL/qERjqIEZzX+fCpHg==
X-CSE-MsgGUID: IeZ99s9vTcq5o53LbB1tRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43202411"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43202411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:06:38 -0800
X-CSE-ConnectionGUID: dbJHs1gLQJ+Tc4MUPDFZjQ==
X-CSE-MsgGUID: GNkOetnpTVmH8iT4ZSM3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111736436"
Received: from carterle-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.42])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:06:35 -0800
Date: Thu, 6 Feb 2025 14:06:31 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Mikolaj Wasiak <mikolaj.wasiak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/selftests: avoid using uninitialized context
Message-ID: <Z6Sz11meZQianUjS@ashyti-mobl2.lan>
References: <iuaonpjc3rywmvhna6umjlvzilocn2uqsrxfxfob24e2taocbi@lkaivvfp4777>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iuaonpjc3rywmvhna6umjlvzilocn2uqsrxfxfob24e2taocbi@lkaivvfp4777>
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

Hi Krzysztof,

On Thu, Jan 30, 2025 at 09:19:31AM +0000, Krzysztof Karas wrote:
> There is an error path in igt_ppgtt_alloc(), which leads
> to ww object being passed down to i915_gem_ww_ctx_fini() without
> initialization. Correct that by only putting ppgtt->vm and
> returning early.
> 
> Fixes: 480ae79537b2 ("drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal")
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>

reviewed and merged.

Thanks,
Andi
