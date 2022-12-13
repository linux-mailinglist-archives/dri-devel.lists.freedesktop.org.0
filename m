Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A626764B448
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 12:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C0510E1B9;
	Tue, 13 Dec 2022 11:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5069110E1B9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670931375; x=1702467375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=heKDNBPZhPEpIYGyk0skyCaB8Rq9txJBmgJkUvBpvNs=;
 b=Jz2QN6DS/qk3VJCQajz8gLk/zF522laPomMgvzYT5lRN4h+iTIgmc9dI
 bo4rvGzhtTQllQO9ZqVuPG/qgSevrLeB/fB7d1Jsp7XUTS4Wdn3HQ+8yH
 Rknenqy01Qk4svkUX+VU1xjbEQM/8sq8V7F6HNgseMHWZbUhJhtyv5EBi
 LM0VP2TWVLc9yCHBk5SSWd4nlEe5zjBAg7B8FXbDkfIN27qf7Vfg/BXn1
 VZPJWV4q/8+vAs9n2dOFU4eAUpqfkA+1kIiWMTfyW2XYwRqPlRsfP7ycR
 v+Nld1961f3tkxuy+R0PWSDQSUVsaJNR6yXxitICPLWbwZOyhoavy9d6A w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315745737"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="315745737"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 03:36:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="977427278"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="977427278"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 03:36:12 -0800
Date: Tue, 13 Dec 2022 12:36:10 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com
Subject: [PATCH v4 8/7] accel/ivpu: Add depend on !UML to Kconfig
Message-ID: <20221213113504.GA958172@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VPU is integrated x86_64 device and the driver utilizes various CPU
architecture specific functions that don't exits on ARCH=um, so disable
build on UML.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
index 110a6b921135..9bdf168bf1d0 100644
--- a/drivers/accel/ivpu/Kconfig
+++ b/drivers/accel/ivpu/Kconfig
@@ -3,7 +3,7 @@
 config DRM_ACCEL_IVPU
 	tristate "Intel VPU for Meteor Lake and newer"
 	depends on DRM_ACCEL
-	depends on X86_64
+	depends on X86_64 && !UML
 	depends on PCI && PCI_MSI
 	select FW_LOADER
 	select SHMEM
-- 
2.25.1
