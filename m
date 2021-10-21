Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DAD436A54
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 20:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94AC6ECFA;
	Thu, 21 Oct 2021 18:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA596ECE1;
 Thu, 21 Oct 2021 18:15:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="315313662"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="315313662"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="527582103"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Date: Thu, 21 Oct 2021 11:15:09 -0700
Message-Id: <20211021181511.1533377-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
there as we seek to bring the driver to other architectures, Daniel
suggested that we could finish the cleanup and remove it altogether,
through the tip tree. So here I'm sending both commits needed for that.

Lucas De Marchi (2):
  drm/i915/gem: stop using PAGE_KERNEL_IO
  x86/mm: nuke PAGE_KERNEL_IO

 arch/x86/include/asm/fixmap.h             | 2 +-
 arch/x86/include/asm/pgtable_types.h      | 7 -------
 arch/x86/mm/ioremap.c                     | 2 +-
 arch/x86/xen/setup.c                      | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
 include/asm-generic/fixmap.h              | 2 +-
 6 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.33.1

