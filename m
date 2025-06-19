Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F75ADFD44
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4E510E201;
	Thu, 19 Jun 2025 05:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnQFxrXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674010E201
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750312344; x=1781848344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kc9iHWOTgIyamZMSgsXNsmgvoo2qBtnD9yutC/j1C7Y=;
 b=JnQFxrXc3NKm9FTtD6SlsrTcA22HEH5RzjgnAbBMZOS0BwuB0IgIa0vU
 exzj1DgKuDCnLW9lEZjkbESwhUM8wL9C8BmsCEd9zw1DW6h5HK5fVyOoQ
 7ZtaJN7fmODFgVaXDAwKEh4aIn28pBw4/u+1fAR9TEDy8Be9Fr6khzlp3
 vO5NhfWs+A8ooKadeCmoux/GjJ8rmY3mjxj0DCIWSoPd02CqyDhP+/H5T
 SIx1nr96zJlNRV92Ar7XaKHVYOJ3LHm64xTX3SSo+Nxvsp1TKg6saP5Po
 XEkc+otOcvH6svSInCnqkYO+G05o4MBZiCQfTk+H4UisXaWds6HyPkF06 g==;
X-CSE-ConnectionGUID: gnj8ZJ2PSi2kYzsSsuKkIQ==
X-CSE-MsgGUID: JajGjSb3R8+1V4d+yHshEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63984730"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="63984730"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:52:24 -0700
X-CSE-ConnectionGUID: NBnyr+FNTCibP1AKIZk+HQ==
X-CSE-MsgGUID: ggTQWJ63QPmslLBeu+LZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="149996168"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP; 18 Jun 2025 22:52:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 2E7EF12D; Thu, 19 Jun 2025 08:52:18 +0300 (EEST)
Date: Thu, 19 Jun 2025 08:52:18 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, Marko Kiiskila <marko.kiiskila@broadcom.com>, 
 Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: Fix guests running with TDX/SEV
Message-ID: <gb6pm7leba4ayhh2f6wjirq4ytmemadqeij6cbnak6r22e3c5b@uyakvi62fqfd>
References: <20250618192926.1092450-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618192926.1092450-1-zack.rusin@broadcom.com>
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

On Wed, Jun 18, 2025 at 03:29:26PM -0400, Zack Rusin wrote:
> From: Marko Kiiskila <marko.kiiskila@broadcom.com>
> 
> Commit 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as
> encrypted by default") changed the default behavior of
> memremap(MEMREMAP_WB) and started mapping memory as encrypted.
> The driver requires the fifo memory to be decrypted to communicate with
> the host but was relaying on the old default behavior of
> memremap(MEMREMAP_WB) and thus broke.
> 
> Fix it by explicitly specifying the desired behavior and passing
> MEMREMAP_DEC to memremap.
> 
> Fixes: 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default")
> Signed-off-by: Marko Kiiskila <marko.kiiskila@broadcom.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
