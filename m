Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD7A77FAE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA12A10E5FB;
	Tue,  1 Apr 2025 15:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMCmmo/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FF110E5FB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743523164; x=1775059164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rbfvpmvIClacQyR9EwvtiveDAJSpptipu/JzXiubYlw=;
 b=dMCmmo/BjrQLGiVJg9Mic4Ylwaqr+1hY5jokDl2MdDT3u+1+pbD4kJqZ
 yjn+CT9v22MFRUQxjjAVAVAxMUz1d9s/+IY1I9Sdjl1rs2OnJaxRpcdt0
 szuKuuZ2z8KJGOWtEOkUCFhmFV5nvAK57X6W3nn1dhmS9hW9d3jsOK0EL
 gOGPZokUNu/pUWCkZl5vDYaaXKA04urlNv2kv2ZLTElmf43n686TNTvJy
 fsUwW0aLkbeF2oTkzrOI7SmU7xaamrwSxueL97Tted64/dDXjQkUfuU2g
 ridh4sdu2DAHNHYa5E+ACgmiXqeHNnn4zUogbu8DWlXCXbAev5h4RQZO9 w==;
X-CSE-ConnectionGUID: I8wig8XTRoGh4obifwcwgg==
X-CSE-MsgGUID: J6hEFi7KTliGdMR/8xKlKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44108597"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44108597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:59:23 -0700
X-CSE-ConnectionGUID: BQNZ2bxDR9SHk/sGtWeofg==
X-CSE-MsgGUID: I2/nbP9cTgGNSZvyLfxoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="157413734"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:59:22 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 0/2] accel/ivpu: Expose NPU frequency into userspace
Date: Tue,  1 Apr 2025 17:59:10 +0200
Message-ID: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This patchset introduces the capability to measure the NPU frequency
and makes it accessible to a userspace via sysfs. The initial patch in the series
addresses the inconsistency in retrieving the clock frequency from
the device across the Meteor Lake and Lunar Lake generations.

Subsequently, the latter patch exposes the driver's frequency
through sysfs to facilitate frequency sampling.

Andrzej Kacprowski (2):
  accel/ivpu: Fix the NPU's DPU frequency calculation
  accel/ivpu: Show NPU frequency in sysfs

 drivers/accel/ivpu/ivpu_drv.c     |   4 +-
 drivers/accel/ivpu/ivpu_fw.c      |   3 +-
 drivers/accel/ivpu/ivpu_hw.h      |  14 ++--
 drivers/accel/ivpu/ivpu_hw_btrs.c | 134 ++++++++++++++----------------
 drivers/accel/ivpu/ivpu_hw_btrs.h |   7 +-
 drivers/accel/ivpu/ivpu_sysfs.c   |  49 ++++++++++-
 include/uapi/drm/ivpu_accel.h     |   4 +-
 7 files changed, 127 insertions(+), 88 deletions(-)

-- 
2.43.0

