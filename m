Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C04AFBA6A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 20:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B05B10E06B;
	Mon,  7 Jul 2025 18:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g88gCdnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750C910E50E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751911934; x=1783447934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bi87rG7P6CoGETad06/zHCA3P/bOiDeC70D5OgT60Rk=;
 b=g88gCdnDkgpB860yEN96HPwS8cZTW8nBHrN0C+yFiZKzTN1Voiqeppdp
 F6xWaOMA3CKLhjGfq8m4nYKAxtJkpSVWlRMIXiPBKGLzJzs1PD2RAf+r2
 coms/u79OdQiWwtEJD1dgdYNVK1aqEjhwNoIK51zSIvTYhtZ8WokUwk+v
 PRucP81VtGIAyzzz9J04dlNeMwZbfHaXfylwqcQoLvrUmdVBOVawN+Wba
 BIFBiYZ98u4k2+jdZISiXaODiRB7W4t74MVMV1hCbctbGAz47bj90un6D
 YmeOeLozmH7YJXjGqviHSxnaXqqpNQHsS5iLI+Q/d442dZb1gGSaL5NbQ w==;
X-CSE-ConnectionGUID: gwAqcgkqTKKjvSfK66H4jQ==
X-CSE-MsgGUID: inN3LcVXRXSrfDeEJbZMsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57941691"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="57941691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:12:13 -0700
X-CSE-ConnectionGUID: atyyDk3JQ4SM5XTabQgF0A==
X-CSE-MsgGUID: kjUKosZ8RDqo9TLVCcPb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154679400"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:12:13 -0700
Date: Mon, 7 Jul 2025 11:12:11 -0700
From: Andi Kleen <ak@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Lukas Wunner <lukas@wunner.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] agp/amd64: Remove support for probing unlisted PCI
 devices
Message-ID: <aGwN-0-wC25534q7@tassilo>
References: <20250707173710.313701-1-hansg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707173710.313701-1-hansg@kernel.org>
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

On Mon, Jul 07, 2025 at 07:37:07PM +0200, Hans de Goede wrote:
> Hi all,
> 
> As discussed in this thread:
> 
> https://lore.kernel.org/dri-devel/b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de/
> 
> The amd64_agp driver's support for trying to probe unsupported devices does
> not make sense anymore given that no new AGP devices have been produced for
> a while now.

It's not about AGP devices. By the time the K8 existed it was already
PCI only.

The K8 CPU integrated northbridge uses PCI AGP enumeration to expose its
integrated IOMMU, but it's not real AGP, just uses a mechanism similar
to the AGP aperture.

But you still have to probe the chipset hostbridge, and for these CPUs there
were multiple third party chipsets with different PCI IDs, so it needed
an own ID for each of them.

The reason why it's not needed is that there are no new third party K8
chipsets anymore.


-Andi
