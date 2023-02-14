Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A869588A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 06:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B3C10E096;
	Tue, 14 Feb 2023 05:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4E110E096;
 Tue, 14 Feb 2023 05:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676352827; x=1707888827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9qrB8i6I8jOvQtnzY9iAwMDwgOWiLaQT40HUJ7CRQTU=;
 b=X3N43xTC3dMH2z5kJimMKf6vk+psJAxe4eawc+x6ty64COIMWUdICq6n
 PrmI5AmtVJFD/LtZCVGOtSzGoULjWByGtABAE1pcK3x5dcUL40tls0FH8
 xDqw30+GlWXLMyNZi/ou5YhCQrSE4fYyG1g3jnb4Rv3Q9Aq51lYgq3+ec
 7rXd98XTrqmbYYwmt19T7fYXC/WlfysMfAaCeu3C0jtV0YECJtfwvkWF2
 GG+j98czi7s45tI293rMoI/V+w8t8gtVyTlQxi7jrlnT8Y8cX8Amt9/UA
 Rg73FOXyOUqaXSGC2knu6dsyFoKfpmo653tljM1tGD+1wzVSJX8v6wQSS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491791"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="358491791"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047075"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="669047075"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] PL1 power limit fixes for ATSM
Date: Mon, 13 Feb 2023 21:33:39 -0800
Message-Id: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: linux-hwmon@vger.kernel.org, Anshuman Gupta <anshuman.gupta@intel.com>,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>, Riana Tauro <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous PL1 power limit implementation assumed that the PL1 limit is
always enabled in HW. However we now find this not to be the case on ATSM
where the PL1 limit is disabled at power up. This requires changes in the
previous PL1 limit implementation.

Submitting 3 patches for easier review but patches can be squashed if
needed.

Ashutosh Dixit (3):
  drm/i915/hwmon: Replace hwm_field_scale_and_write with
    hwm_power_max_write
  drm/i915/hwmon: Enable PL1 limit when writing limit value to HW
  drm/i915/hwmon: Expose power1_max_enable

 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 85 +++++++++++++------
 2 files changed, 68 insertions(+), 24 deletions(-)

-- 
2.38.0

