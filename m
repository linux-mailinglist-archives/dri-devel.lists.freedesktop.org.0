Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHEEN/Ofb2ktKAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CC461D4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCD310E5C5;
	Tue, 20 Jan 2026 11:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBe+gkR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B2510E5C1;
 Tue, 20 Jan 2026 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768908830; x=1800444830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhxnxuOoxyZGOi8RAXbRXFB8qkC32U1/C9CPE7t9UrU=;
 b=mBe+gkR2gJFlMuW3GOC+JyX0kwQfXetWcEsbLlYcrE7ib5lvKLkDKSgV
 FMsgq5BURx26NRKJe6hMAIUb0+IY1ALqz9+UdzMd6Vb12bo1Q9nDh3tct
 +SyqU8bBSITMc8QQjkrpHD9KMR6TC+tGagAZgvU+Bqp/29amrR6wCeY+R
 hYJPS5Ws/uPUrVXJMpXHTiSArYeOSj2mEtv1CDb0SUPKPa8uQilBZTRaE
 lNDb2IXsXN2C3oNDPcVLDgidnf08TNoiyhAfl9vAE0Y/YBoeZimnR3h4q
 XziuFmc7vsGFEPjCF3p23HuzBmsqNPvMYW4aD0St1jRIJmZT1+JZ7s9JF Q==;
X-CSE-ConnectionGUID: xRo/TJpMS8+r/SHCAXJrLQ==
X-CSE-MsgGUID: YEK1IqSfTCSd+4NvJzZ93w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73969539"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73969539"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:33:49 -0800
X-CSE-ConnectionGUID: gldhrQrSRBe3YG6GObKfwQ==
X-CSE-MsgGUID: gkCezs7tQJ260cnKH8drBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206449902"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.250])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:33:46 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm, drm/xe: Fix xe SVM configs
Date: Tue, 20 Jan 2026 12:33:20 +0100
Message-ID: <20260120113322.97654-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Queue-Id: 593CC461D4
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DNSWL_BLOCKED(0.00)[198.175.65.14:received,131.252.210.177:from,10.60.135.150:received];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DWL_DNSWL_BLOCKED(0.00)[intel.com:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.60.135.150:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,intel.com:dkim]

The first patch fixes the problem of xe userptr not being enabled if
CONFIG_DEVICE_PRIVATE is missing.

Second patch explicitly selects CONFIG_DEVICE_PRIVATE if DRM_XE_GPUSVM
is enabled, which is probably what most distros want. This patch is
not Fixes: tags since some configurations may actively exclude
CONFIG_DEVICE_PRIVATE and it's undesirable if a stable update breaks
those.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org

Thomas Hellström (2):
  drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
  drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected

 drivers/gpu/drm/Kconfig    | 2 +-
 drivers/gpu/drm/xe/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.52.0

