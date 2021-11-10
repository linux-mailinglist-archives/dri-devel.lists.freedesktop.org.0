Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E556044BDEE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6586E877;
	Wed, 10 Nov 2021 09:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9716FF9D;
 Wed, 10 Nov 2021 07:12:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232462127"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="232462127"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 23:12:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="491988144"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.217])
 ([10.254.212.217])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 23:12:19 -0800
Message-ID: <6e8c55a7-45b6-57ab-35f7-d522401efccb@linux.intel.com>
Date: Wed, 10 Nov 2021 15:12:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Use per device iommu check
In-Reply-To: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 10 Nov 2021 09:38:52 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On 2021/11/9 20:17, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
> 
> On igfx + dgfx setups, it appears that intel_iommu=igfx_off option only
> disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
> and probe presence of iommu domain per device to accurately reflect its
> status.
> 
> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
> Cc: Lu Baolu<baolu.lu@linux.intel.com>
> ---
> Baolu, is my understanding here correct? Maybe I am confused by both
> intel_iommu_gfx_mapped and dmar_map_gfx being globals in the intel_iommu
> driver. But it certainly appears the setup can assign some iommu ops (and
> assign the discrete i915 to iommu group) when those two are set to off.

diff --git a/drivers/gpu/drm/i915/i915_drv.h 
b/drivers/gpu/drm/i915/i915_drv.h
index e967cd08f23e..9fb38a54f1fe 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1763,26 +1763,27 @@ static inline bool run_as_guest(void)
  #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
  					      IS_ALDERLAKE_S(dev_priv))

-static inline bool intel_vtd_active(void)
+static inline bool intel_vtd_active(struct drm_i915_private *i915)
  {
-#ifdef CONFIG_INTEL_IOMMU
-	if (intel_iommu_gfx_mapped)
+	if (iommu_get_domain_for_dev(i915->drm.dev))
  		return true;
-#endif

  	/* Running as a guest, we assume the host is enforcing VT'd */
  	return run_as_guest();
  }

Have you verified this change? I am afraid that
iommu_get_domain_for_dev() always gets a valid iommu domain even
intel_iommu_gfx_mapped == 0.

A possible way could look like this:

static bool intel_vtd_active(struct drm_i915_private *i915)
{
         struct iommu_domain *domain;

         domain = iommu_get_domain_for_dev(i915->drm.dev);

         if (domain && (domain->type & __IOMMU_DOMAIN_PAGING))
                 return true;

	... ...
}

Actually I don't like this either since it checks the domain->type out
of the iommu subsystem. We could refactor this later by export an iommu
interface for this check.

Best regards,
baolu
