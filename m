Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4829903CA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 15:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52E710E9F1;
	Fri,  4 Oct 2024 13:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqiFQCX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF210E190
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728047965; x=1759583965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ofQmXf3Kd0GIafTMFOqkvR6T9KtpWvu3RyxXVvUM3NQ=;
 b=CqiFQCX1R3dyD70dqzVQCy7WrtaDdfhMj9TaZXDaRztslEQkKQkstY8d
 qpivfvjatAelry2jkvyvEj2GJWqFMVC5EMv5zL5y4+K7cAdbNzqjFfPb3
 xW7BWNhaVvyUW1eoka5UaF3oExNnNNtQYQv6qTGBrf84C49k8FPs09zSO
 1MrpSQQseE1wK2tfsz7grWHtHKtr14iyIJj16wxmC2VWKDETrBjlDSiCy
 aesdvG7yQh6DMFhqAUhKZLb6ZnSUpSqLYsevtnm3O3yKq59kMDxBMI7aF
 Xguinsy5c9Pcml+w3T7Fg95YEYYhQDzkU+YLqSizLj+CPdb7Ga8/x/iF7 g==;
X-CSE-ConnectionGUID: ko/auMSdSRWSt6PiTUVIPw==
X-CSE-MsgGUID: 9azmeaHTSA+QoQKIbX7nGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27149258"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27149258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:19:25 -0700
X-CSE-ConnectionGUID: xrTHzVPWSe2EMCI88EI/Ng==
X-CSE-MsgGUID: 6nlh2EqaRgCM0SsE1it6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74694796"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:19:24 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 0/2] accel/ivpu: Intel NPU Panther Lake support
Date: Fri,  4 Oct 2024 18:25:03 +0200
Message-Id: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

This patchset adds initial support for 5th generation Intel NPU
that is going to be present in the upcoming Panther Lake CPUs.

Maciej Falkowski (1):
  accel/ivpu: Add initial Panther Lake support

Wachowski, Karol (1):
  accel/ivpu: Update power island delays

 drivers/accel/ivpu/ivpu_drv.c         |  1 +
 drivers/accel/ivpu/ivpu_drv.h         | 10 ++++--
 drivers/accel/ivpu/ivpu_fw.c          |  3 ++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  2 ++
 drivers/accel/ivpu/ivpu_hw_ip.c       | 49 +++++++++++++++++----------
 5 files changed, 45 insertions(+), 20 deletions(-)

-- 
2.34.1

