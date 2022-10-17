Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B260247E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2081510EE99;
	Tue, 18 Oct 2022 06:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1E310ED14;
 Mon, 17 Oct 2022 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665999184; x=1697535184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7DWIlBvRBPlI7C3mshKcaEtH4mYWv0nITpy5+EZ8lew=;
 b=AFAu9yFKR+W+9Ub/PyHTDF3LQvZxFE451L5OmLOUmEIaRlsXl5IOb1T0
 e+aLuZ/InWvpWHAaRqbwwkDJXoIzPICHdfYs+Qw0zI6yhiBXVX3aTq4F+
 kNqvWzkqtxxuesIjr2VGzPDjJrFaLEUnZ2RgkcCrDxiPahz5cNUSpEDoP
 ZReu8PubTpojKbW4wI5C9BdDVsa37BPmXAPgverJo41z0lnLZSw0PRmc9
 B36sIo2Rj92vpm/D/fxxBAcU9F13Dwq0RrZRoBgEkzxMivQNcM+ufvlJT
 oJXiGIxLwAcFlTxkulnxUt34afzqI36YriKvlcROs8oDnk30kPfW0TSsc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286142730"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286142730"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="717431351"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="717431351"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 02:33:00 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] x86/hyperv: Replace kmap() with kmap_local_page()
Date: Mon, 17 Oct 2022 17:37:26 +0800
Message-Id: <20221017093726.2070674-11-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhao Liu <zhao1.liu@intel.com>

kmap() is being deprecated in favor of kmap_local_page()[1].

There are two main problems with kmap(): (1) It comes with an overhead as mapping space is restricted and protected by a global lock for synchronization and (2) it also requires global TLB invalidation when the kmap's pool wraps and it might block when the mapping space is fully utilized until a slot becomes available.

With kmap_local_page() the mappings are per thread, CPU local, can take page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore, the tasks can be preempted and, when they are scheduled to run again, the kernel virtual addresses are restored and are still valid.

Since its use in hyperv/hv_init.c is safe, it should be preferred.

Therefore, replace kmap() with kmap_local_page() in hyperv/hv_init.c.

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

---
Suggested by credits.
        Ira: Referred to his task documentation and review comments.
        Fabio: Stole some of his boiler plate commit message.

---
Changelog:
v2:
- Fix wrong incoming parameters in kunmap_local();
- Add Fabio as suggester since I quoted his commit message.

---
 arch/x86/hyperv/hv_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 3de6d8b53367..72fe46eb183f 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -459,13 +459,13 @@ void __init hyperv_init(void)
                wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);

                pg = vmalloc_to_page(hv_hypercall_pg);
-               dst = kmap(pg);
+               dst = kmap_local_page(pg);
                src = memremap(hypercall_msr.guest_physical_address << PAGE_SHIFT, PAGE_SIZE,
                                MEMREMAP_WB);
                BUG_ON(!(src && dst));
                memcpy(dst, src, HV_HYP_PAGE_SIZE);
                memunmap(src);
-               kunmap(pg);
+               kunmap_local(dst);
        } else {
                hypercall_msr.guest_physical_address = vmalloc_to_pfn(hv_hypercall_pg);
                wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
--
2.34.1

