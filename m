Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A95ABC28C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431D110E0BC;
	Mon, 19 May 2025 15:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3+nWoFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9216410E0BC;
 Mon, 19 May 2025 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747668885; x=1779204885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lv1F+1TnYYwuEQ5K8FxCd1lgY1O11AM55zDRYMpMjJo=;
 b=V3+nWoFbHLmzIiwvukWGmhhq6BWrj0U2/wQvFlBEp8l5XEboqRbn5x7B
 aZzaqUL7JpUrQfrPcQfQYOHHVKKd7XAAFQ/em76iXjcwXuNA+LCPFfogZ
 qrFILSZC+r4maaR+DB1OneanZHaBwTl3OAgL3Ra/fCQgndCuYjwDbgzzg
 e6UWKm5lWxoqHrnBTqdyqEiHA7qKvnUf5jC1M2i2jbJoRiMIA/jTrtv3Q
 39dS+K66Kly85snZyqSBHzFUq5ymMlph0lCfh9jnXWn62H5M+gYDeXnPg
 MW4RG5KqiLg3YPZ/cmkrO5X2z8shIr0PXqag59RFKXxKF5AqE8qeEakZr Q==;
X-CSE-ConnectionGUID: ma/CQmHgTcmpY9gaXR+tgw==
X-CSE-MsgGUID: ffvCovUERdmdamS8xD/yMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60605754"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60605754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:34:44 -0700
X-CSE-ConnectionGUID: Xz85LbyoSzyAQVsk4garEw==
X-CSE-MsgGUID: KEM/DTpETkO/ZExzfnoj5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139905872"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:34:40 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [RFC 0/2] Introduce a sysfs interface for lmem information
Date: Mon, 19 May 2025 17:34:14 +0200
Message-ID: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Hi,

This series introduces a way for applications to read local memory
information via files in the sysfs. So far the only way to do this was
via i915_query ioctl. This is slightly less handy than sysfs for
external users. Additionally, the ioctl has a capability check which
limits which users of a system might use it to get information.

The goals of this series are:

	1) Introduce a simpler interface to access lmem information,
	2) Lift the CAP_PERFMON check on that information, OR provide
	   the administrator with a way to optionally lift it.

The first patch introduces the general mechanism without protections.
This will effectively lift a capability check on obtaining the memory
information. The second patch introduces that check back inside the
_show() functions, but also adds a sysctl parameter allowing to override
the checks, if an administrator so decides.

I'm sending this as RFC because I have a feeling that there's no
consensus whether memory information exposed in the patch should be
protected or not. Showing it to any user is strictly speaking an info
leak, but the severity thereof might be considered not that high, so I'd
rather leave it up to discussion first.

If we decide for lifting the check, the first patch is sufficient. If we
decide against it, the second patch protects the information by default,
but with a way to expose it as a conscious decision of the admin. I find
it a decent compromise.

This change has been requested in these parallel issues for i915 and Xe:

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861

Thanks
Krzysztof

Krzysztof Niemiec (2):
  drm/i915: Expose local memory information via sysfs
  drm/i915: Add protections to sysfs local memory information

 drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
 drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
 drivers/gpu/drm/i915/intel_memory_region.h |   3 +
 3 files changed, 145 insertions(+)

-- 
2.45.2
_
