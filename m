Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D06C460F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE9210E8D0;
	Wed, 22 Mar 2023 09:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C954A10E8D0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476751; x=1711012751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wtnif+r4zxyPzY+Lj12vVSoqZ4EiShJM7Fd2coFKrEE=;
 b=ZuIgSL8sEYW7Ju34EdI5BJDPHleMQdvwwlWX0KZQi4qttG6LVgq0xwz/
 jTS5wXYC/kPLiBHx+I28VAO5HwFqqmqUJPp0WSA271Dl8UcBpSG2FtxUw
 y48eSQKas2zzTWqWOhNS85JkgYlsLr+FWCjtRQfOLw/lIlI5bsZB6Q+p4
 01m8XKBfWdY5A7DZ22Ixy/xxx2L7eeYrz7T91qj1TR7OO7E+bbWtQVJsk
 M/fY3onHO8pT7xFXybcnNsamNpEsSrN5/+rqzcRwU04uJ2GI4z+CPUim3
 D/R+8oQtAqF5BTd2YaRY3vTk5zTY4xJd79BR0SfoaBlxbDFA/NW+YKmW6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904247"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229746"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229746"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:09 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] acell/ivpu: Fixes for 6.3
Date: Wed, 22 Mar 2023 10:18:53 +0100
Message-Id: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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

Various fixes intended for linux 6.3 relase.

Patch 6 is dependency for patch 7.

Stanislaw Gruszka (7):
  accel/ivpu: Do not access HW registers after unbind
  accel/ivpu: Cancel recovery work
  accel/ivpu: Do not use SSID 1
  accel/ivpu: Fix power down sequence
  accel/ivpu: Disable buttress on device removal
  accel/ivpu: Remove support for 1 tile SKUs
  accel/ivpu: Fix VPU clock calculation

 drivers/accel/ivpu/ivpu_drv.c    |  18 +++--
 drivers/accel/ivpu/ivpu_drv.h    |   7 +-
 drivers/accel/ivpu/ivpu_hw_mtl.c | 113 ++++++++++---------------------
 drivers/accel/ivpu/ivpu_job.c    |  11 ++-
 drivers/accel/ivpu/ivpu_pm.c     |  15 +++-
 drivers/accel/ivpu/ivpu_pm.h     |   1 +
 6 files changed, 78 insertions(+), 87 deletions(-)

-- 
2.25.1

