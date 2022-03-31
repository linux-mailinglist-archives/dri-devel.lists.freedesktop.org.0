Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A74EE0DA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AD110E417;
	Thu, 31 Mar 2022 18:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D021D10E417;
 Thu, 31 Mar 2022 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752315; x=1680288315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YjVsaNFKHk8+3DPuWAzuz8WuZX+QeJN8sxUKmmTcpsw=;
 b=aKynu6JQoiSlCLT9YW3QPGheb8AY3uAM8TJQ9cjZLpdQKwu+4ltmrYJe
 8rOy9QERcF8V5i69PgMm3c4tmBUTXyTEODGcHP5//GtGatg4k8s+pW0Bp
 tTE2KU7ucoqLA5s8NEq1wghTIlMtAtEco09Cos3kG3skiFm8IxsOi1P90
 eP+n+GCDACJkGoJ5bqAQw8TEh13Kjha/k4tZyr7UfCvU0VE9oR/5fln5f
 Jc/M89Fej+gE7mfreTaXxbmnxs9TLNBUwpOaeUT2qVsZ+D8atohICrJok
 RC14Q/buUfNJQlSPYBNXu0N5wjv6IQdec/1jIL8bl0UOK1vYPTnIdKCBS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="239847763"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="239847763"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="566724857"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/12] drm/edid: cleanup and refactoring around validity
 checks
Date: Thu, 31 Mar 2022 21:44:57 +0300
Message-Id: <cover.1648752228.git.jani.nikula@intel.com>
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

v2 of https://patchwork.freedesktop.org/series/101931/

Rebased, review comments addressed.

BR,
Jani.



Jani Nikula (12):
  drm/edid: use struct edid * in drm_do_get_edid()
  drm/edid: clean up EDID block checksum functions
  drm/edid: add edid_block_tag() helper to get the EDID extension tag
  drm/edid: make drm_edid_header_is_valid() accept void pointer
  drm/edid: clean up edid_is_zero()
  drm/edid: split out edid_header_fix()
  drm/edid: split drm_edid_block_valid() to check and act parts
  drm/edid: use a better variable name for EDID block read retries
  drm/edid: simplify block check when filtering invalid blocks
  drm/edid: split out invalid block filtering to a separate function
  drm/edid: track invalid blocks in drm_do_get_edid()
  drm/edid: reduce magic when updating the EDID block checksum

 drivers/gpu/drm/drm_edid.c | 295 +++++++++++++++++++++----------------
 include/drm/drm_edid.h     |   2 +-
 2 files changed, 173 insertions(+), 124 deletions(-)

-- 
2.30.2

