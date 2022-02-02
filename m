Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90584A6D25
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE6710FABA;
	Wed,  2 Feb 2022 08:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED9810FAB6;
 Wed,  2 Feb 2022 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643791570; x=1675327570;
 h=from:to:cc:subject:date:message-id;
 bh=BKAe7KQSH7VwiS6EUKJCmx3cV1mOB34zyEioaB9aJOY=;
 b=l15YWgL1TE5nxxdMYhF465OWxVovzx3lVR0Tlsom4NWPy0fjRH4h3X24
 7flhf9JvE+PuZVsoDi3p792HUakx6kDoWq6yfeCvjr2A+anztg70HUdUO
 TR4Zhjx+uRZLSMj6HoD/z9dgJPmjfZgVq75vpa1pyvabUVPQQsJGDVg3D
 Zhv4aD+f+zOIhvMYl03IfpxVNSds0Pc7QJGXZDgFJpzIXOeHUwht4TNaJ
 Sh6V9fadmnwBa3QjDdwn4qKcOsCEOXsmQ3nU1FUC9W/8zeSuHvOUCcJan
 MMS+h+mq/hDk0ZNnvkdtNtqJCgfWAXtAAXtAg1bfzU+d6Da0n/YzZ4M1h Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228528764"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="228528764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="497674987"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 00:46:06 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm writeback connector changes
Date: Wed,  2 Feb 2022 14:24:23 +0530
Message-Id: <20220202085429.22261-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 jani.nikula@intel.com, quic_abhinavk@quicinc.com,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series contains drm_writeback_connector structure change i.e 
change of drm_connector and drm_encoder fields to a pointer the reason
for which is explained in patch(1/6) drm: add writeback pointers to
drm_connector and the accompanying changes to the different drivers that
were effected by it.
I had perviously floated a patch series but missed some of the drivers
that were effected by the change hence refloating the patch series 

Kandpal Suraj (6):
  drm: add writeback pointers to drm_connector
  drm/arm/komeda : change driver to use drm_writeback_connector.base
    pointer
  drm/vkms: change vkms driver to use drm_writeback_connector.base
    pointer
  drm/vc4: vc4 driver changes to accommodate changes done in
    drm_writeback_connector structure
  drm/rcar_du: changes to rcar-du driver resulting from
    drm_writeback_connector structure changes
  drm/arm: changes to malidp driver resulting from
    drm_writeback_connector structure changes

 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 ++-
 .../arm/display/komeda/komeda_wb_connector.c  | 11 +++++-----
 drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
 drivers/gpu/drm/arm/malidp_drv.h              |  2 ++
 drivers/gpu/drm/arm/malidp_mw.c               | 12 +++++++----
 drivers/gpu/drm/drm_writeback.c               | 19 +++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c   |  8 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                 | 20 +++++++++++++------
 drivers/gpu/drm/vkms/vkms_writeback.c         |  9 ++++++---
 include/drm/drm_connector.h                   |  3 +++
 include/drm/drm_writeback.h                   |  6 +++---
 13 files changed, 63 insertions(+), 36 deletions(-)

-- 
2.17.1

