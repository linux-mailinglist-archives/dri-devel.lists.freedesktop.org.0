Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B26878A4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D5310E0AA;
	Thu,  2 Feb 2023 09:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920C10E0AA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675329697; x=1706865697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wzSrJUUsbCEdfX8yOZakCGTwlkkIrhcRVIsON5LFy2k=;
 b=O+NRVhZ6/oCmSKyAoxro5vIP4VFGOS1PnrtYfmd/i4c3b1NErLFYIX52
 mJG01RP12ee2SgVxiDGJC1FMmZRXcuIRx+dtamzbgefelhRsTmgO+D58A
 Pt+U70nNmimkA4SrB0tx1iBcfG4UdPO3LTd9i60Lfmftl3X/q1PKaG0yN
 x7qMhLruwc381xskSZK/NsHE0LrxYO6vlsfCb2aD7/VXtXU0GWOCYbRN3
 UuUsgzTgeBCIqxz85uqIH4GBerP6DzD8I0Ja+4U4ZsuB0WwolMhNE/Ws1
 zNSFvD0TcFaBLiPKxr83tOqC5NjsOS/TZF3dkBjQtPl6t7aJ2nX3dr9YJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390791405"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="390791405"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665216042"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="665216042"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:35 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] accel/ivpu: Fixes for 6.3
Date: Thu,  2 Feb 2023 10:21:10 +0100
Message-Id: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few fixes intended for 6.3.

Andrzej Kacprowski (2):
  accel/ivpu: Fix FW API data alignment issues
  accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context

Stanislaw Gruszka (2):
  accel/ivpu: Set dma max_segment_size
  accel/ivpu: Fix old dma_buf api usage

 drivers/accel/ivpu/ivpu_drv.c     |  2 +
 drivers/accel/ivpu/ivpu_fw.c      | 37 +++++++++++------
 drivers/accel/ivpu/ivpu_gem.c     |  8 +---
 drivers/accel/ivpu/ivpu_job.c     |  5 ++-
 drivers/accel/ivpu/ivpu_jsm_msg.c | 11 +++++
 drivers/accel/ivpu/ivpu_jsm_msg.h |  2 +-
 drivers/accel/ivpu/vpu_jsm_api.h  | 67 ++++++++++++++++++-------------
 7 files changed, 81 insertions(+), 51 deletions(-)

-- 
2.25.1

