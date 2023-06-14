Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C334170EFD8
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C051210E03A;
	Wed, 24 May 2023 07:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F62710E58B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684914579; x=1716450579;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aje7vWJGzd8a6fVJQZ5k8JnKqFVavdoYIlwGfuVhlN0=;
 b=mv1FJ2rG9XNqDWGlMk9xFJ40NaNd8YaERIa2HWZ+Wl2No5Al0GElZJ4G
 +dxxCSfn7y6d5QLSG7cfxZDVkBfwMFzs94udHlhaXoWBJmRnR3tWF1Rkc
 WlkOZ6VAEnDLVtON3s0XHO4DQm8l3U2EBls7I9iWSQxsTnfWfs6b4DE/A
 Z4vnX7LuI86d5sYZTyJR/3OxJAZFa1vjB7HiVaC/fXDEtUwC/WKI+qlhB
 k1mz7fF7tST3Q64cgtoeoov6nOJHsUR/ByPVUZMkCJ87FecbxGi2YHjBp
 dBfF1XLidEUrFkuZ95fH7Dg6DEw5bl/EQfGts6otA/caho2vWRANXrXVE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="381732732"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="381732732"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="774157027"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="774157027"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:37 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] accel/ivpu: Add debugfs support
Date: Wed, 24 May 2023 09:48:42 +0200
Message-Id: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
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

Add debugfs support for ivpu driver, most importantly firmware loging
and tracing.

Andrzej Kacprowski (1):
  accel/ivpu: Print firmware name and version

Krystian Pradzynski (1):
  accel/ivpu: Add fw_name file to debugfs

Stanislaw Gruszka (3):
  accel/ivpu: Initial debugfs support
  accel/ivpu: Add firmware tracing support
  accel/ivpu: Add debugfs files for testing device reset

 drivers/accel/ivpu/Makefile       |   4 +-
 drivers/accel/ivpu/ivpu_debugfs.c | 294 ++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_debugfs.h |  13 ++
 drivers/accel/ivpu/ivpu_drv.c     |   5 +
 drivers/accel/ivpu/ivpu_fw.c      |  68 ++++++-
 drivers/accel/ivpu/ivpu_fw.h      |   4 +
 drivers/accel/ivpu/ivpu_fw_log.c  | 142 +++++++++++++++
 drivers/accel/ivpu/ivpu_fw_log.h  |  38 ++++
 drivers/accel/ivpu/ivpu_pm.c      |   1 +
 drivers/accel/ivpu/ivpu_pm.h      |   1 +
 10 files changed, 563 insertions(+), 7 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h
 create mode 100644 drivers/accel/ivpu/ivpu_fw_log.c
 create mode 100644 drivers/accel/ivpu/ivpu_fw_log.h

-- 
2.25.1

