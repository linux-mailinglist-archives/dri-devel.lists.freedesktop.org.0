Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33552B555F4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69F510ECC1;
	Fri, 12 Sep 2025 18:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MlN4GEGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F3410E1D6;
 Fri, 12 Sep 2025 18:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757701192; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fWUgVXY2fXaxmJ5tmkJiwJtkdl2C/cmsw6groSymnYMduJpfFTP31y+Kw27muoVlhNh1YyqlSdZAdED6zZpiw5eP3nouDjQmn1tXHDhnWMmIo2ia/Fd7sMadGr3brNhnOcJVAKhzz+SlzEfuBImPnFZ+oHVYXF0Pzu2xI9Hcz64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757701192;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gbdSeCQ+uB77f9gTJlvphN2wT1lLAE8z5CkvIFLj3zc=; 
 b=Bhbtsmbvpm8eMUA2UYWzoXMnlyopNtl3kv22gTpa/Eir/Rkz8TCse0wZzC9+A4L5/AY12RaW2nbTav55YCMml/PZJP65LRSOmZqj3GXTnrHlPCqmz2MlWNcNbvNNlHUCI6pt8EMdr0GgD/+PIUmPvWa9tO/6SLpTVGIIq9wd4iY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757701192; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=gbdSeCQ+uB77f9gTJlvphN2wT1lLAE8z5CkvIFLj3zc=;
 b=MlN4GEGXAKwFuc96NgEC6wR1VjmqiuPf0lbAFb0JEhwpJTMXp0Xu+FhkArXNqiFr
 rdVlxEtcXmDYEb3+Amuk3muL4JZnTHpB4kbIolSbWJ1h7f6jdl4aWrylRF4/TmkhYCj
 8BpComHRnfGjgiXmC1nqQAU7S64GnDSgYegnuBwE=
Received: by mx.zohomail.com with SMTPS id 1757701189582949.9220119829977;
 Fri, 12 Sep 2025 11:19:49 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/3] Add initial Panthor tests
Date: Fri, 12 Sep 2025 15:19:27 -0300
Message-ID: <20250912181931.3738444-1-daniel.almeida@collabora.com>
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
 lib/igt_panthor.c             | 229 ++++++++++++++++++++++++++++
 lib/igt_panthor.h             |  30 ++++
 lib/meson.build               |   1 +
 meson.build                   |   8 +
 tests/meson.build             |   2 +
 tests/panthor/meson.build     |  15 ++
 tests/panthor/panthor_gem.c   |  66 ++++++++
 tests/panthor/panthor_group.c | 276 ++++++++++++++++++++++++++++++++++
 tests/panthor/panthor_query.c |  25 +++
 tests/panthor/panthor_vm.c    |  80 ++++++++++
 12 files changed, 734 insertions(+)
 create mode 100644 lib/igt_panthor.c
 create mode 100644 lib/igt_panthor.h
 create mode 100644 tests/panthor/meson.build
 create mode 100644 tests/panthor/panthor_gem.c
 create mode 100644 tests/panthor/panthor_group.c
 create mode 100644 tests/panthor/panthor_query.c
 create mode 100644 tests/panthor/panthor_vm.c

-- 
2.51.0

