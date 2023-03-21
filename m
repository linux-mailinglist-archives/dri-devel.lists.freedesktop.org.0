Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD86C3467
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9DC10E0AC;
	Tue, 21 Mar 2023 14:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D13410E0AC;
 Tue, 21 Mar 2023 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679409466; x=1710945466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J/XC+56ZvVhpCDHtjZ3Zv6cNu86xF7Nt4L/iCBL6sCc=;
 b=GdREs637ocfLzT+PQ+uRwsuE/JfauGA/etCBYWnvkTxiBjoxrTMrgHz/
 p9H8U5Q3Kwx/4F7SBUs2L2+yCScyUQEoupzNQeXasCkxiHvLzPw4iRwok
 LaMcZQpXbm3BXajB/GYe2Z3tUKXDf71EUrXA6qD4RVwq/F3uiZxlkojZd
 JOoFJm0P4dRJAPr0TvkxOZ8/ktgJN+/o0RDlV1LXWw3NHK5OyqkaeYcRF
 tfUZpL0aSMJRgtEH9aEdo1PQ97dd5aRYJC0JCgQBju7JFk3tmQ/l3HbFt
 EEs4i5N9iMIgZ6CoV3gr+9Fmp/qdsq8Hco2S0M+TBChLMGBrXVqjMVLEM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403832726"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="403832726"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674851694"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674851694"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 21 Mar 2023 07:36:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Mar 2023 16:36:43 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH v2 0/3] drm: Add plane SIZE_HINTS property
Date: Tue, 21 Mar 2023 16:36:40 +0200
Message-Id: <20230321143643.26676-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I was pondering how I'd be able to do non-square cursor
sizes without have a massive list of them in the SIZE_HINTS
blob.

So I came up with this idea of having a 2D bitmap in
there to indicate support for (mostly) POT non-square
sizes..

What does everyone think? Is this just getting too
complicated and should we just go with the original
"a list of suppored sizes" approach?

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>

Ville Syrjälä (3):
  drm: Introduce plane SIZE_HINTS property
  drm/i915: Adjust cursor_size_ok() func calling convention
  drm/i915: Add SIZE_HINTS property for cursors

 drivers/gpu/drm/drm_mode_config.c           |  7 ++
 drivers/gpu/drm/drm_plane.c                 | 96 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 96 ++++++++++++++-------
 include/drm/drm_mode_config.h               |  5 ++
 include/drm/drm_plane.h                     |  6 ++
 include/uapi/drm/drm_mode.h                 | 29 +++++++
 6 files changed, 208 insertions(+), 31 deletions(-)

-- 
2.39.2

