Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I0jLivicmkyrAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:51:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D816FD0B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 03:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DCD10EADB;
	Fri, 23 Jan 2026 02:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ8/bnJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A4110EA66;
 Fri, 23 Jan 2026 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769136677; x=1800672677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kYkrBV3y12sWkz8psJia5at7cYNKv3VHa7vF+hcQfZI=;
 b=YQ8/bnJpDh5apSYiD9mdneQOSiUAsmt+1GkAZMsRGi635rEHPLeCXIwC
 7t+9IrmCIKS/ysMGrylzV6uN5D9kzSgiTbRjoOWZINDlExtFbjrhfEAjg
 LVbcq4dq6BvDvdTsf7F6LsAvsJoSVwlM+t8pmnZrOOzsFH4dzRsIBkqDK
 M7KHFZfcghwB/f9AnXbTSnHjBIZxW2a57q3lYNCWizb5vTZ6GiKhb9k+4
 nmTEC7JJQs/s5VL7OTyDBUJlHFkJFqJb7xtksaNq68KdjJoUWAEbRpGux
 133GxLcW1QMGGLopxi3sNIJjmQr5iSkAuE8hK8wd4sKGw3+cm6G/yuOz/ Q==;
X-CSE-ConnectionGUID: ALcxaGmKTvO6cL7+7nv7RQ==
X-CSE-MsgGUID: rA35fOTNS1GF7VpIbX1P5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81016448"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="81016448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:51:16 -0800
X-CSE-ConnectionGUID: sS1h9xVbTkazYlHhPVz5pw==
X-CSE-MsgGUID: ySo2gyYbRTqLktr+Wzai8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="211773085"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:51:16 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/6] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Thu, 22 Jan 2026 18:51:01 -0800
Message-ID: <20260123025108.3772255-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 69D816FD0B
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

David E. Box (6):
  platform/x86/intel/vsec: Refactor base_addr handling
  platform/x86/intel/vsec: Make driver_data info const
  platform/x86/intel/vsec: Decouple add/link helpers from PCI
  platform/x86/intel/vsec: Switch exported helpers from pci_dev to
    device
  platform/x86/intel/vsec: Return real error codes from registration
    path
  platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   2 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  12 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 121 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |  10 +-
 include/linux/intel_vsec.h                    |  39 ++++--
 15 files changed, 143 insertions(+), 93 deletions(-)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
--=20
2.43.0

