Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEXhGt9vjGlmngAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433571240CF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A18B10E05D;
	Wed, 11 Feb 2026 12:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8mGIsaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1710E04C;
 Wed, 11 Feb 2026 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811350; x=1802347350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=orxGU1IV06kku76XzaeSp9NB1JgHF7tKCfTxHz9R3dA=;
 b=c8mGIsaCwL/cE2rsU/OMcEb6eLAy5sN8GopXW9Wky7aGIld6vANmSnvk
 D0p8IZLI8RVq+JxpQZdCcik4IymS+J5GtbDKhcbUcunkpJFXMwQ/reovi
 z7DVJkUF5OkqmppWkW9ljQcEOt9UadvLWppt1ZpGqPTrm3TkHOGQHR7uA
 RngeJFhZU5iGCOV9YtnoPFNPi7RyoQhx79rmxYZrvsK5erHFOYa3i1nQR
 zRxyHHblDaRTpmh/ch8FiKBA+o0C72qo8AghM3P2AQj+aXOs20nnm/Mb5
 qhM5ICi2AJfJy33Tm6qdzSXQDH6mvYO39HNS0ADXpSxB5zQ3y6UMNu4jw Q==;
X-CSE-ConnectionGUID: 337jyqGJTi28uwo7WqM9JA==
X-CSE-MsgGUID: E37vfM6MTr2L9mgGY0muww==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71854610"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71854610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:01:46 -0800
X-CSE-ConnectionGUID: 1vEdujQoQJCQkXTscnmyhQ==
X-CSE-MsgGUID: vLAXqlZ8QtiIGM5MeHEUtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="235210671"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 04:01:41 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH 0/4] Add cold reset recovery method for critical errors
Date: Wed, 11 Feb 2026 17:29:47 +0530
Message-ID: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mallesh.koujalagi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[christian.koenig.amd.com:query timed out,mripard.kernel.org:query timed out,simona.vetter.ffwll.ch:query timed out,airlied.gmail.com:query timed out];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 433571240CF
X-Rspamd-Action: no action

This RFC patch series introduces a new DRM wedge recovery method
'DRM_WEDGE_RECOVERY_COLD_RESET' for handling critical errors
that cannot be recovered through existing software-based mechanisms.

Background
----------
Current recovery methods (driver rebind, bus reset, FLR) are effective
for most error scenarios. However, certain critical errors
affect device-level persistent state that survives warm resets and
software recovery attempts. These errors require complete device power
cycling to restore functionality.

Proposed Solution
-----------------
This series adds DRM_WEDGE_RECOVERY_COLD_RESET (BIT(4)) as a new
recovery method to the DRM wedging framework. When this method is set,
it signals to userspace that only a complete device cold reset (power
cycle) can restore normal operation.

Example uevent received:
  SUBSYSTEM=drm
  WEDGED=cold-reset
  DEVPATH=/devices/.../drm/card0

Testing
-------
The debugfs interface allows testing the cold reset recovery path:

  echo 1 > /sys/kernel/debug/dri/N/trigger_critical_error

This triggers the critical error handler, wedges the device with
cold reset method, and sends the appropriate uevent to userspace.

Cc: André Almeida <andrealmeid@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>

Mallesh Koujalagi (4):
  drm: Add DRM_WEDGE_RECOVERY_COLD_RESET for critical error
  drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
  drm/xe: Add handler for critical errors which require cold-reset
  drm/xe/debugfs: Add interface to trigger critical error handler

 Documentation/gpu/drm-uapi.rst   | 73 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c        |  2 +
 drivers/gpu/drm/xe/xe_debugfs.c  | 38 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.c | 28 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 include/drm/drm_device.h         |  1 +
 6 files changed, 142 insertions(+), 1 deletion(-)

-- 
2.34.1

