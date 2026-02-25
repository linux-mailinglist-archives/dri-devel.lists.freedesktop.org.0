Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMveJWhVnmnyUgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:50:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826918FFF4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 02:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82010E688;
	Wed, 25 Feb 2026 01:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMMc4CRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199E110E66B;
 Wed, 25 Feb 2026 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771984223; x=1803520223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ToM1AWpnOkAnrFR4PhXPIyPZqBXaSP+ujBoibchazBk=;
 b=RMMc4CRUhN4la9KdSystvh8exww3q59wCqB9NChSMATn4ffLsQw6jf08
 xZMWEPTLKZ3ufOdNv6Tpdhtcog++nm0MwoBYkYq0LhejmjjVDORMYXwr/
 kO1AcVFEjoezMCWA+7qfL6NVkNSLPxehpg9QRhxGb1ZeMpQWRuQ9dobwi
 5XHQ9wCgycNaPbyEFCKV7ljZ4Dzh04Zdv/mresMTlerTkqpoOh4JvQh8r
 dfOVnbIpz0BchZJp9Wwm09yEZe5RWn7l2SG6jIqFgV3CvMIsMjGpM7ckp
 hrhwEsDkiia7NKgcdnrc173Z7N6383uztgHvpWmSFazhQdo5R9j2SeldZ A==;
X-CSE-ConnectionGUID: d5gtZapeRMOWKbaxHYU41g==
X-CSE-MsgGUID: 593WDsx7QPi9GK3Z6S51bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76622900"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="76622900"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 17:50:21 -0800
X-CSE-ConnectionGUID: LkH3MAMCTYqyBVWbaT0u/g==
X-CSE-MsgGUID: qDsATcnZQ4OvGznHE1A2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="216096171"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 17:50:20 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Tue, 24 Feb 2026 17:50:06 -0800
Message-ID: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 4826918FFF4
X-Rspamd-Action: no action

This series updates intel_vsec to improve const-correctness, decouple
helper APIs from PCI, enhance error handling, and plumb ACPI-based Intel
Platform Monitoring Technology (PMT) discovery through the vsec layer. It
is preparatory infrastructure for follow-on PMT core/telemetry and
PMC/SSRAM series that add ACPI discovery and support for new platforms.

The series is organized as follows:

Patches 1-2 refactor and improve const-correctness of base_addr handling.
Patch 1 makes base_addr an explicit parameter throughout the call chain,
clarifying ownership and removing conditional logic. Patch 2 then makes the
platform info data structure read-only, preventing unintended modifications
to shared driver data.

Patches 3-4 decouple the vsec layer from PCI-specific types, updating
helper APIs and data structures to use generic struct device instead of
struct pci_dev.  This enables vsec to work with both PCI and ACPI parent
devices.

Patch 5 enhances error visibility by returning meaningful error codes from
the registration path instead of collapsing to boolean success/failure.

Patch 6 adds infrastructure for ACPI-based PMT discovery, allowing client
drivers to consume discovery data from either PCI or ACPI sources.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>

David E. Box (6):
      platform/x86/intel/vsec: Refactor base_addr handling
      platform/x86/intel/vsec: Make driver_data info const
      platform/x86/intel/vsec: Decouple add/link helpers from PCI
      platform/x86/intel/vsec: Switch exported helpers from pci_dev to devi=
ce
      platform/x86/intel/vsec: Return real error codes from registration pa=
th
      platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c                  |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                    |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                     |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                     |   4 +-
 drivers/platform/x86/intel/pmc/core.c            |   4 +-
 drivers/platform/x86/intel/pmc/ssram_telemetry.c |   2 +-
 drivers/platform/x86/intel/pmt/class.c           |   8 +-
 drivers/platform/x86/intel/pmt/class.h           |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c       |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c       |  13 +--
 drivers/platform/x86/intel/pmt/telemetry.h       |  12 +--
 drivers/platform/x86/intel/sdsi.c                |   5 +-
 drivers/platform/x86/intel/vsec.c                | 121 ++++++++++++++-----=
----
 drivers/platform/x86/intel/vsec_tpmi.c           |  10 +-
 include/linux/intel_vsec.h                       |  39 ++++++--
 15 files changed, 144 insertions(+), 94 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
--=20
