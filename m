Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367B4E99AF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3510E08C;
	Mon, 28 Mar 2022 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF3E10E08C;
 Mon, 28 Mar 2022 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478085; x=1680014085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9fzpf2XdnG4vbaPrnRyzPvgXW/cy6Lw3Pv7f1vh3Dug=;
 b=CaPI5JDTkAay0hpvEutHvIM2CcewYkjYIBHr7AZ+bnNwThhbW8tuzMD4
 51B/shxBrsfXYbR+7e3m9cI7elJJ1pzctkujJAX7FxO+Troz0HEzH1N+A
 0wBHtmGyct5VbjjT+/NlRXwgMc6fLOD683lsPWvu4qLdsmm99nCe0ElNw
 4O087393XQ0aXJNOdCUIhfiwoYQR+pAFQJrZHw3ZzHkXu0vf4CFjshiva
 18Dwie/NHK14YwK0qnc7q9WyhrcQcVjb1Sh2YvOGfKzhHd4pMWovMFlyP
 KzHUeG+uu32fKU/hz4q1j2F/5kvBeqyTgakTHJGtIeo6tHhAkNTq3DHEE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="283900567"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="283900567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:34:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563708605"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:34:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/12] drm/edid: constify EDID parsing, with fixes
Date: Mon, 28 Mar 2022 17:34:21 +0300
Message-Id: <cover.1648477901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3 of https://patchwork.freedesktop.org/series/101787/ and
https://patchwork.freedesktop.org/series/101862/

I screwed up with the struct renamings in v2, so there's some falling
back to v1 and general confusion here. Sorry.

BR,
Jani.


Jani Nikula (12):
  drm/edid: don't modify EDID while parsing
  drm/edid: fix reduced blanking support check
  drm/edid: pass a timing pointer to is_display_descriptor()
  drm/edid: pass a timing pointer to is_detailed_timing_descriptor()
  drm/edid: use struct detailed_timing member access in is_rb()
  drm/edid: use struct detailed_timing member access in gtf2 functions
  drm/edid: constify struct detailed_timing in lower level parsing
  drm/edid: constify struct detailed_timing in parsing callbacks
  drm/edid: constify struct edid passed to detailed blocks
  drm/edid: constify struct edid passed around in callbacks and closure
  drm/edid: add more general struct edid constness in the interfaces
  drm/edid: split drm_add_edid_modes() to two

 drivers/gpu/drm/drm_edid.c | 325 ++++++++++++++++++++-----------------
 include/drm/drm_edid.h     |  10 +-
 2 files changed, 185 insertions(+), 150 deletions(-)

-- 
2.30.2

