Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F2A9406B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 01:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6440210E2E8;
	Fri, 18 Apr 2025 23:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GV65kiKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3605C10E2E8;
 Fri, 18 Apr 2025 23:50:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F32C344E92;
 Fri, 18 Apr 2025 23:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B280C4CEE2;
 Fri, 18 Apr 2025 23:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745020238;
 bh=c5ICYBvBMQAPVgTj8nFGD8PU7cVGL/PCYMCLPDiK5Gc=;
 h=From:To:Cc:Subject:Date:From;
 b=GV65kiKFF+X9GzT4JIT/UUSoxT3SpDas8hBEq8A4jTKyqArNe7tVul4mT4qqajI8y
 yxdKRIosYX8ZBTP85HhUG5gLGKXtM6o/d47jM2eykngbIDxmTO7gTbMWGpNDD5d7Hm
 rmfXGWRhP9u3xj7GLRQsoICOKRRHe1XZbDtqtHwOnyN/045lHQCqPonn2j4K7GRRne
 1yTjqGNpWgJGuZ++Dmbnjky05UP+nkGF7Ki01h5D+LYlmuaTiNn8ETcR5vmMMfxaJO
 vBrmzVCVnfSSnYfbtTxg/ifnifCNTlELVhjtIIFy8C3kPli7Ono4m/edreGrXjXbcN
 7+nKBaVrmUd/Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab@kernel.org>) id 1u5vTL-00000003KF5-36VJ;
 Sat, 19 Apr 2025 07:50:15 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/4] Don't create Python bytecode when building the kernel
Date: Sat, 19 Apr 2025 07:50:01 +0800
Message-ID: <cover.1745019660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
when W=1. Due to Python's normal behavior, its JIT compiler will create
a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
O= and even having the sources on a read-only mount point, disable its
creation during build time.

This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
where the script is called within Kbuild and when called via another script.
 
This only solves half of the issue though, as one may be manually running
the script by hand, without asking Python to not store any bytecode.
This should be OK, but afterwards, git status will list the __pycache__ as
not committed. To prevent that, add *.pyc to .gitignore.

This series contain 4 patches:

- patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
- patch 2moves scripts/kernel-doc location to the main makefile
  and exports it, as scripts/Makefile.build will need it;
- patch 3 disables __pycache__ generation and ensure that the entire Kbuild
  will use KERNELDOC var for the location of kernel-doc;
- patch 4 adds *.pyc at the list of object files to be ignored.

---

v3:
- move KERNELDOC to the main Makefile;
- get rid of the badly-named KERNELDOC_CONF var.

v2:
- added a .gitignore file;
- add PYTHONDONTWRITEBYTECODE=1 to the places where kernel-doc
  is called.

Mauro Carvalho Chehab (4):
  docs: Makefile: get rid of KERNELDOC_CONF env variable
  Makefile: move KERNELDOC macro to the main Makefile
  scripts/kernel-doc.py: don't create *.pyc files
  .gitignore: ignore Python compiled bytecode

 .gitignore                    | 1 +
 Documentation/Makefile        | 5 ++---
 Makefile                      | 5 +++++
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/Makefile.build        | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 8 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.49.0


