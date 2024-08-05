Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789E948541
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 00:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AB210E2CD;
	Mon,  5 Aug 2024 22:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mt0eA8uO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098C610E2CE;
 Mon,  5 Aug 2024 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722895531; x=1754431531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZD14Eo0suUZ0QIzkvHNR5rVSu5F4tZx+GiFNaMloX0w=;
 b=Mt0eA8uOttHADHEvRjKcy8lW8XLV7jKWitm84AJOINrdCTc2WHHv2ohU
 91+1gHJsnRr0g6NrAh8BX641u2LPVUXpBJGrNCe0emKU2K2FAzMx2gTjx
 1Cw+9LDrZiGkS0L4sHPQ54A5LUAWXT4+PoVAOpCVA0Kit8k3mPda0ainj
 UBDHMdcx+ez15quoyAzmlpHdvBQV+KAfLPdGNsFU6f9gHrS+lL1YovW62
 HuSzm9edi8q6KRYLIrO3RED5RI4MDP2RuNC+g5ZOMCPemweCE4U0itMUP
 IoDNTsaaZiNIv3yhwif9NWSVJZS5MWvLaXihMZl836UXBH5pOcM9wZ/hA A==;
X-CSE-ConnectionGUID: vS45oVJGTy+pvxf/KZ6syQ==
X-CSE-MsgGUID: kjstL9vBRSa2ywbJ/DbMEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="43412699"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="43412699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 15:05:31 -0700
X-CSE-ConnectionGUID: lJ16Q2MzSuePMsvgjCL0zQ==
X-CSE-MsgGUID: 1qoiBIVjR/SHwxlLjUalEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="60445817"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.45])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 15:05:26 -0700
Date: Mon, 5 Aug 2024 23:05:22 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
Message-ID: <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805102554.154464-1-andi.shyti@linux.intel.com>
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

Hi Greg,

> Andi Shyti (2):
>   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
>   drm/i915/gem: Fix Virtual Memory mapping boundaries calculation

I have forgotten to Cc the stable mailing list here. These two
patches need to be merged together even if only the second patch
has the "Fixes:" tag.

Is there anything I should still do here?

I could have used the "Requires:" tag, but the commit id would
change in between merges and rebases.

Andi
