Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726AC32E73
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 21:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E08210E32C;
	Tue,  4 Nov 2025 20:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="RCdaiekm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BA310E2C2;
 Tue,  4 Nov 2025 20:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762288154; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IlqRTj5vMIIIQC8hPvwoznm+nXnGblwjxW8OHx6+vRJzi/Mfw4CvvOPFrfXwYs0dSOCzYYkoOBfg1cTisnlv1hvUkKNnyKWKbrG/QFiBzi29FUbb+AubCQwdjQCRWfYGLIJ9jPr1Da0cUxT/9FSLpgoVLdYhWLepUlz6XglpuXo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762288154;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qy+8VGQUEM524MCht5wR5SFs4Lz0Ob0zxBjYPRSi7lQ=; 
 b=TZjm3gud4ISslGWOU02T80l6aX5gNle4sUOjbCkrEhqqXRQLiFHjYiTvsih9V8QKBqoIe+AN5fzzzX7Dk8rbggzbF8V3HMfQDqxd5dT/JKj9+gMGaX1TBUAEOW9kmpNAqiYg3mAHCi69Vi2idpHSjTniGz4anzpOGOmonup5NiU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762288154; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qy+8VGQUEM524MCht5wR5SFs4Lz0Ob0zxBjYPRSi7lQ=;
 b=RCdaiekmHhjmdbQRiv+54MFsvS6eRrwapSRLdF83sQZDeKwmhtccanxANuyisPCA
 z6ckiAT9xcuymjrNrLMox0x0OJsUoDJi3nSnj669T3lAla0wp+y0BBr3YfhND5vcOpy
 KdxqjKnV2uJrbS05lbHojP1nc6Ok7rcaegZqgg5s=
Received: by mx.zohomail.com with SMTPS id 1762288149012925.0226041957134;
 Tue, 4 Nov 2025 12:29:09 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/3] Add initial Panthor tests
Date: Tue,  4 Nov 2025 17:28:40 -0300
Message-ID: <20251104202845.2879460-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This series adds basic Panthor tests. In particular, these are being
used to test both Panthor[0] and Tyr[1], i.e.: the new Rust GPU driver
that implements Panthor's uAPI (i.e.: panthor_drm.h). Most of the
initial tests were chosen in order to have something to test Tyr with,
but this series lays the groundwork so that more interesting tests can
be added to test more of Panthor itself.

This work is being tested on a RockPi 5, featuring an rk3588 SoC and
Mali-G610 Valhall.

Note that there's a few (less than five?) remaining checkpatch.pl
comments about long lines. IMHO there's no way to format them better so
I hope we can live with this.

[0]: https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com
[1]: https://lore.kernel.org/dri-devel/aMLB0Vs0dJ_AkU4z@google.com/

Changes from v2:

Thanks, Boris {
  - New helpers for command stream manipulation (see "struct cs_instr")
  - Reworked bad indentation and formatting
  - Removed BE support (UMD doesn't care about this either)
}

Thanks, Daniel Stone {
  - Introduced igt_panthor_get_first_core(), which correctly computes
    the first available core using ffs()
  - Stopped hardcoding the page size and switched to getpagesize()
    instead,
  - Switched to more specific versions of igt_assert as appropriate (like
    igt_assert_neq(), etc)
  - Simplified panthor_group.c considerably by relying on the helpers in
    igt_panthor.[ch]
  - Switched to the syncobj_create() and syncobj_destroy() helpers.
}

- Added group creation helpers with sensible defaults (see
  igt_panthor_group_create_simple(), for example)
- Picked up tags

- Link to v2: https://lore.kernel.org/dri-devel/20250912181931.3738444-1-daniel.almeida@collabora.com/

Changes from v1:
- Rebased on top of the latest master
- Squashed patch 3 from v1 into patch 2.
- Switched to /* */ comments in headers
- Initialized padding fields to 0 as applicable in group_destroy and
  vm_destroy
- Removed wrong assert(gpu_rev != 0)
- Changed indentation to use tabs
- Rework igt_panthor_mmap_bo to take an offset (so we don't call the
  mmap_offset ioctl twice)
- Added igt_describe and docs to the functions igt_panthor.c
- Linked to the driver in the cover letter and patch 1.
- Improved the commit message for patch 1.
Link to v1: https://lore.kernel.org/dri-devel/20250828130402.2549948-1-daniel.almeida@collabora.com/



Daniel Almeida (3):
  lib: add support for opening Panthor devices
  panthor: add initial infrastructure
  tests/panthor: add panthor tests

 lib/drmtest.c                 |   1 +
 lib/drmtest.h                 |   1 +
 lib/igt_panthor.c             | 372 ++++++++++++++++++++++++++++++++++
 lib/igt_panthor.h             | 221 ++++++++++++++++++++
 lib/meson.build               |   1 +
 meson.build                   |   8 +
 tests/meson.build             |   2 +
 tests/panthor/meson.build     |  15 ++
 tests/panthor/panthor_gem.c   |  72 +++++++
 tests/panthor/panthor_group.c | 123 +++++++++++
 tests/panthor/panthor_query.c |  29 +++
 tests/panthor/panthor_vm.c    |  84 ++++++++
 12 files changed, 929 insertions(+)
 create mode 100644 lib/igt_panthor.c
 create mode 100644 lib/igt_panthor.h
 create mode 100644 tests/panthor/meson.build
 create mode 100644 tests/panthor/panthor_gem.c
 create mode 100644 tests/panthor/panthor_group.c
 create mode 100644 tests/panthor/panthor_query.c
 create mode 100644 tests/panthor/panthor_vm.c

-- 
2.51.0

