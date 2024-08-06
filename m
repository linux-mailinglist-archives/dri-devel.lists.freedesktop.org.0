Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26033948C55
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 11:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C0810E329;
	Tue,  6 Aug 2024 09:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axkz+X4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B810E038;
 Tue,  6 Aug 2024 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722937577; x=1754473577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NHPDhAPN0+XJL4G+JDPf/Xs9gLks0egozu7I3GZZiLw=;
 b=axkz+X4b3nrtXrXh1I7B1evGuRObdllLT+CJHbVTDcBPxUQJfWGDncfm
 epv/Lh/cx1qjEnuz70awscks57ph2+7eTiSRVT5fq4eOxPMXZ8RAlIf1Y
 bvwlJGDHLCn/suYh/Sl3g0Um6tAF9tSmYKnA2CqVLkp+s+ydl5C29LrCz
 1n5sOWplar5Deo9YQx1Sp44mp4EEV1+qbVavikeF2MIxE9XyujaXhHBdd
 NTH9ZyHXToVKkgwbFQbVWao54BddNrtfkQ7ho1tznA/ZZObq6eXgxLuiL
 quOMXaH8gKAUlh3BmsCRQTWftf3g5eHq6QSHGqLVbuq2uFqP2qFI/pe+c A==;
X-CSE-ConnectionGUID: 1chGYE06QZWbCZoQoYZLvQ==
X-CSE-MsgGUID: ZFvaxtklQdS8bor8eXgPRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32094579"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="32094579"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 02:46:17 -0700
X-CSE-ConnectionGUID: H1RtYp4VQpaoEbHiu/FHEw==
X-CSE-MsgGUID: zerfwzI2SkGmbPEqnyUCZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="79719529"
Received: from johunt-mobl9.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.111])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 02:46:12 -0700
Date: Tue, 6 Aug 2024 10:46:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
Message-ID: <ZrHw3y8QKPT87LxP@ashyti-mobl2.lan>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
 <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan>
 <2024080640-landfall-doozy-e0d2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024080640-landfall-doozy-e0d2@gregkh>
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

same question without the stable mailing list not to trigger the
automatic reply.

> Andi Shyti (2):
>   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
>   drm/i915/gem: Fix Virtual Memory mapping boundaries calculation

I have forgotten to actually Cc the stable mailing list here.
These two patches need to be merged together even if only the
second patch has the "Fixes:" tag.

I could have used the "Requires:" tag, but the commit id would
change in between merges and rebases.

Is there anything I should still do here? Do you want me to
take care and send the backports for kernels starting from 4.19?

Thanks,
Andi
