Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D1A60E18
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FC310E993;
	Fri, 14 Mar 2025 10:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QY/SVaGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779A510E993
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741946502; x=1773482502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ssdVXLgH46tCNp5vgZI7lWWdXz1whwaAJoMzKSN4mKE=;
 b=QY/SVaGmyTMKXAOO14hKR64eiK4l7EfOoc5nyaUqBfU0XZE2Ag/0xtej
 76gbHL1EnUe/f/PHEoQfbdPcOzZOY8gXGqaqIAwfKTFrufIsbWNwMhKVp
 aulhqQ7wPNq+14rU3jShlyMFOOntROQPzdI3WdTNn9FgD+Fz5k/IltWuC
 /RCHJWTuKmtA09mb3nzAEixRKlmMzXwdWlhWuDMeAIqVhA0btkNyQsPeE
 J/mgW1vBOG+uferwJCe466DWnEIn+hVHX1eEOkubniOCBPSCZY/AljD1S
 vBGFl4UUuMEJslfyS9AcEhQwMNR4J/3fTqBX6dvMU1WcR3glsH9t6mL2O g==;
X-CSE-ConnectionGUID: MXM/1oGhSiGHw7GX9lhxUw==
X-CSE-MsgGUID: aDPUD0vfSPqzp4v1LWIN3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43197142"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43197142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:01:41 -0700
X-CSE-ConnectionGUID: //I4/LOVRtmeSfvdraR8XQ==
X-CSE-MsgGUID: fvqhzmGyQ8+7cLgK3UHdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="120944855"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:01:39 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch, airlied@gmail.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] docs: driver-api: firmware: clarify userspace requirements
Date: Fri, 14 Mar 2025 11:01:36 +0100
Message-ID: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

The guidelines mention that firmware updates can't break the kernel,
but it doesn't state directly that they can't break userspace programs.
Make it explicit that firmware updates cannot break UAPI.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 .../driver-api/firmware/firmware-usage-guidelines.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
index fdcfce42c6d28..5f8f13e2ee510 100644
--- a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
+++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
@@ -42,3 +42,8 @@ then of course these rules will not apply strictly.)
   deprecating old major versions, then this should only be done as a
   last option, and be stated clearly in all communications.
 
+* Firmware files that affect the User API (UAPI) shall not introduce
+  changes that break existing userspace programs. Updates to such firmware
+  must ensure backward compatibility with existing userspace applications.
+  This includes maintaining consistent interfaces and behaviors that
+  userspace programs rely on.
\ No newline at end of file
-- 
2.45.1

