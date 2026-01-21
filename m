Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD1UFD2YcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:11:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3BE541E0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FE210E728;
	Wed, 21 Jan 2026 09:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ny33davI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275F710E71B;
 Wed, 21 Jan 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768986679; x=1800522679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UREthQeCI198mcq0lfuPLhq2mZmaPzhXQ3nN7LIeK1k=;
 b=Ny33davI3mzA/7i8hrHySOSaBXDWCFUS0ccy898TZL1fureUF3WEuMuI
 U2ciQjhG2J1YW6BkqYGnanzlgUJuFrdz7uU/rThL9cQ3t7nl6F9gPPNcg
 8xlTDTUUIPOo3m3sRSIN6Wza4PfV+m97+k3ySKQoh/UOxjBk9R8QEROE5
 v4zHA2DFNhLUzQVRw0ATSdTHXnNCcSMsrHIvDXKxJPXQ0ughhFJRemWdo
 KxFmmprWeGLrdyBHMUlQJds5RmOtCKSJC5d1eeBM6oMgn8MSo2OOiak5y
 JCkFgOnyDjnCT1Un0S94BeIP4I+h1ObQVB0t9O5fCSf/bhmF6Ny//EIgj Q==;
X-CSE-ConnectionGUID: VkSVITTkRd68p37c12oVjQ==
X-CSE-MsgGUID: da+TCNslQ06B6E4KSG9l6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95682070"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="95682070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:11:19 -0800
X-CSE-ConnectionGUID: 8pWVPNSdTmixfwEAAuP2ZQ==
X-CSE-MsgGUID: W1zu2wqWRDa93QgtpUUktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210847870"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.245.107])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:11:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when
 DRM_XE_GPUSVM is selected
Date: Wed, 21 Jan 2026 10:10:48 +0100
Message-ID: <20260121091048.41371-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121091048.41371-1-thomas.hellstrom@linux.intel.com>
References: <20260121091048.41371-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,lists.freedesktop.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 1F3BE541E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CONFIG_DEVICE_PRIVATE is a prerequisite for DRM_XE_GPUSVM.
Explicitly select it so that DRM_XE_GPUSVM is not unintentionally
left out from distro configs not explicitly enabling
CONFIG_DEVICE_PRIVATE.

v2:
- Select also CONFIG_ZONE_DEVICE since it's needed by
  CONFIG_DEVICE_PRIVATE.
v3:
- Depend on CONFIG_ZONE_DEVICE rather than selecting it.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c34be1be155b..4d7dcaff2b91 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -80,8 +80,9 @@ config DRM_XE_GPUSVM
 	bool "Enable CPU to GPU address mirroring"
 	depends on DRM_XE
 	depends on !UML
-	depends on DEVICE_PRIVATE
+	depends on ZONE_DEVICE
 	default y
+	select DEVICE_PRIVATE
 	select DRM_GPUSVM
 	help
 	  Enable this option if you want support for CPU to GPU address
-- 
2.52.0

