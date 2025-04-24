Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27923A99CA7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 02:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27310E2D0;
	Thu, 24 Apr 2025 00:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ox1L8Ojm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06310E2DA;
 Thu, 24 Apr 2025 00:17:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 51331A4CE6E;
 Thu, 24 Apr 2025 00:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65AFC4CEE2;
 Thu, 24 Apr 2025 00:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745453843;
 bh=GKemA9+yIN791fDKjS2xhXmmMfgA17FoAz9ccfBch3w=;
 h=From:To:Cc:Subject:Date:From;
 b=Ox1L8OjmZGe7yqpVdVdB46si/+gfTqdR4jeyVWs8zwCleOMo1DQoZM1S7jf+3ctor
 /jaUdHBhJtdn/S+SGJ5wfJ2yZY+nPeCoi/3/y+Eyit8YHabgiiM8IGRK+ClXz6QZDo
 F2ekWgVgQGxXZHc5QDZkNTjLeLRD3SQf6q5BS1hqe5bmUdkbzmmzDKqESkUGKzbGmJ
 lSh+3jLgnZ6Hwbg8bBc94kPBPkQqX0s3ziXuOa1tOByLRm+X64mpnEUVTE4MHzr2rW
 OAihIp5lA/XGyMt+solxdGASZkIgQ5oqtiDVlUAxk/AlmziSV8DXvV4ai14F+IOL52
 LtDSgHrldB3hg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab@kernel.org>) id 1u7kH5-0000000049Q-1q83;
 Thu, 24 Apr 2025 08:17:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v4 0/4] Don't create Python bytecode when building the kernel
Date: Thu, 24 Apr 2025 08:16:20 +0800
Message-ID: <cover.1745453655.git.mchehab+huawei@kernel.org>
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

v4:
- placed *.pyc at the alphabetical order at the final patch

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


