Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A467699A8E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50810E353;
	Thu, 16 Feb 2023 16:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037EB10E353;
 Thu, 16 Feb 2023 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676566376; x=1708102376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xQ5jA+YAezjneh7cAmb3U3QrSDpmZtfvRMo2guCbWeI=;
 b=SQ1L4DF2n57wRpGax0UBuOI1uny3lqnVTHAZRUi0ushIai/R2qAOIkkg
 9BeDUQf2UETpw8gXDrHvb+fOovE8huxKHVkLP3HQIsOcToFxJy71BlKuZ
 am5NF+oeGySDrGl1bKVbeyFXlOQGTkyRTHUH99GEB33Gy6gZLRxI0amXW
 LehrO9IE1m/YqdU7kbsdO0tX7KTtW19OfUCuydsZ6m0aoYCIYuOLosU/P
 6NmI8Fs4QGrAPkvUPj2195W32NxUmj+XribWsBiZASfcGD88JEewZJ044
 BiJo4WSRp0J9Tshi5k0f0NMkUIo4l+sE4EANEKDiTdIav68o1aFsi6vND w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333961931"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333961931"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:49:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915738619"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="915738619"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:49:48 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] PL1 power limit fixes for ATSM
Date: Thu, 16 Feb 2023 08:49:42 -0800
Message-Id: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous PL1 power limit implementation assumed that the PL1 limit is
always enabled in HW. However we now find this not to be the case on ATSM
where the PL1 limit is disabled at power up. This requires changes in the
previous PL1 limit implementation.

v2: Dropping Patch 3 (since it is NAK'd by hwmon) so that the first two
    patches can get merged. The first two patches are sufficient to fix the
    main ATSM issue.

Ashutosh Dixit (2):
  drm/i915/hwmon: Replace hwm_field_scale_and_write with
    hwm_power_max_write
  drm/i915/hwmon: Enable PL1 limit when writing limit value to HW

 drivers/gpu/drm/i915/i915_hwmon.c | 37 ++++++++++++++-----------------
 1 file changed, 17 insertions(+), 20 deletions(-)

-- 
2.38.0

