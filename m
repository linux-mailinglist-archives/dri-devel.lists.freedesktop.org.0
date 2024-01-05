Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7C82511A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE50A10E59C;
	Fri,  5 Jan 2024 09:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5375110E59C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704447942; x=1735983942;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Ipngyt99PQBot25YTtxsZ8y9PD4Q1alyU7StkGQNfLY=;
 b=L/lZCcm36ooQhwRvxEAisJ/Af8feo3UqfCPQiO0XCZ+4B5AcCiij9w9N
 e36oXygj4NhsS49YrPkXHbcvdj57GML2Vx8cH6j09ojXdpZ3aBMiK8cDh
 jvXCA1grDU3/RavkeSNk2ECimzwRIyguU5tLw0P0O5VHSX52rAsWUbil3
 MPm/cAyEtSE8Ez82skK8ePb1zqkUZ2GVldmzJEY1eQbGhxAA6oFNu3ABL
 13crwYsm7PbozliiXfoJx0Q40yUekjz27/j8Ba7s/hy53NGKMpdhtEQje
 obSl2OEoz4lTDnD/AE24R1s8jF7kvyR4TLMwkv1v0hkNTNNS9hmGilLh/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10959503"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="10959503"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784158335"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="784158335"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:45:36 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] KVM: selftests: Set KVM_MEM_NON_COHERENT_DMA as a
 supported memslot flag
Date: Fri,  5 Jan 2024 17:16:24 +0800
Message-Id: <20240105091624.24822-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240105091237.24577-1-yan.y.zhao@intel.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
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
Cc: wanpengli@tencent.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 maz@kernel.org, joro@8bytes.org, zzyiwei@google.com, jgg@nvidia.com,
 yuzenghui@huawei.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 suzuki.poulose@arm.com, alex.williamson@redhat.com, yongwei.ma@intel.com,
 zhiyuan.lv@intel.com, jmattson@google.com, zhenyu.z.wang@intel.com,
 seanjc@google.com, ankita@nvidia.com, oliver.upton@linux.dev,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update test_invalid_memory_region_flags() to treat KVM_MEM_NON_COHERENT_DMA
as a supported memslot flag.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 075b80dbe237..2d6f961734db 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -335,6 +335,9 @@ static void test_invalid_memory_region_flags(void)
 
 #if defined __aarch64__ || defined __x86_64__
 	supported_flags |= KVM_MEM_READONLY;
+
+	if (kvm_has_cap(KVM_CAP_USER_CONFIGURE_NONCOHERENT_DMA))
+		supported_flags |= KVM_MEM_NON_COHERENT_DMA;
 #endif
 
 #ifdef __x86_64__
-- 
2.17.1

