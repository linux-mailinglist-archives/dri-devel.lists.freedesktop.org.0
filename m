Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B96yOPOfb2k2KAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5F461DE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDD310E5C8;
	Tue, 20 Jan 2026 11:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9On2HK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAB810E5C7;
 Tue, 20 Jan 2026 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768908833; x=1800444833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3LuSw09FFu0hnIG/N4ioU5Rci4nRxk89LHAlAJ7Lbo=;
 b=k9On2HK6M0ZVvZLt8Xu5ioVLUD7h0rwth5Qoruv2/cT9ZYFqJPOvS7u3
 IsP+vnNNebJG5Lz3bwlgW8n+3UYEyQINa/XnzFeJ/AptwxGko5Z5xfwX6
 4rlfo82KMGhyQR83ny3uJeqvBL1dX/eVqIlRR11o/oyiFDYlTO+KrCmmb
 jzD0cSvqgkBjh/0OwkgCk544xYfd14xkMZ0rmD1LKR97G1czPQaiMLSx2
 hEoPDlLonnIr0T0u5TvfaFk9WYi0Gj0CVc7a3sT9GWBphPG4gmGL2pnqi
 Aye4050dujQrGLZsASmFQmHj7f33tkGaqWslCFiVWFphcw22kT3RnFcGy A==;
X-CSE-ConnectionGUID: 6WA2oRY8Q2aD9hkR3VE0IQ==
X-CSE-MsgGUID: YyCyYvCHQxWi7J5ZUQoPFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73969543"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73969543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:33:53 -0800
X-CSE-ConnectionGUID: 9goTH4RDQnWSHxuFhzuzrg==
X-CSE-MsgGUID: usjcfKBDQw6nkspDFMHrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206449914"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.250])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:33:51 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM
 is selected
Date: Tue, 20 Jan 2026 12:33:22 +0100
Message-ID: <20260120113322.97654-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120113322.97654-1-thomas.hellstrom@linux.intel.com>
References: <20260120113322.97654-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 7EB5F461DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,intel.com:dkim];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DNSWL_BLOCKED(0.00)[10.60.135.150:received,131.252.210.177:from,198.175.65.14:received];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DWL_DNSWL_BLOCKED(0.00)[intel.com:dkim];
	TAGGED_RCPT(0.00)[dri-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.60.135.150:received];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from]

CONFIG_DEVICE_PRIVATE is a prerequisite for DRM_XE_GPUSVM.
Explicitly select it so that DRM_XE_GPUSVM is not unintentionally
left out from distro configs not explicitly enabling
CONFIG_DEVICE_PRIVATE.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c34be1be155b..c510f47f7a16 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -80,8 +80,8 @@ config DRM_XE_GPUSVM
 	bool "Enable CPU to GPU address mirroring"
 	depends on DRM_XE
 	depends on !UML
-	depends on DEVICE_PRIVATE
 	default y
+	select DEVICE_PRIVATE
 	select DRM_GPUSVM
 	help
 	  Enable this option if you want support for CPU to GPU address
-- 
2.52.0

