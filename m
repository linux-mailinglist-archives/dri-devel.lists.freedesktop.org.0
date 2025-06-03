Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F48ACC553
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8296710E5BA;
	Tue,  3 Jun 2025 11:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ASunSOly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852F710E21D;
 Tue,  3 Jun 2025 11:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D12F4A4FE98;
 Tue,  3 Jun 2025 11:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EC5C4CEED;
 Tue,  3 Jun 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748950045;
 bh=34TUZi3qOElaSed4nw9qb+k1ylFQGi/Eb0a+fyUwQac=;
 h=From:Subject:Date:To:Cc:From;
 b=ASunSOly7J4Mqj/R4Dbic+5bLYBEEJoUROtJbK5x8jsVfW/Kd2EvuqyehnhimKKFw
 Icl6K13MUvU3Ghj7B/weDMkJRr3PihA63oo2ZUxJioFvs256ktZ5d14xeQU6XFEDpI
 2x9BEZrSXsV0kENwWAmROqnftlW2D3B/yuqfciBmjSgWTb32xVq1LwjwQOEPcuto4+
 rpOJR63jlW6pTKFu9eXJu2+Jep5pPloVr7/0zGzPK8qworjMXicRlgCoaVZ1leDqcD
 GpGlPtI3veJVcHDqw7T6Q1wXvD6MMv3qOU1xpUu0Dji3qGs/DpyMN2Ig0Jih4LJbat
 QGvHuBsWl2lGw==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v13 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Tue, 03 Jun 2025 07:27:11 -0400
Message-Id: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/cPmgC/23SS07DMBCA4atUWRPksT32mBX3QCz8bKOiFiVVB
 Kp6dyaVEIZBWdnR98d2fB2WOk91GZ5212Gu67RM5xMPwDzshnyIp30dp8ITg1YalQUzzrVd5pi
 PY0n7tozGO5+MMlW3ODB65/fTx7348srjw7RczvPn/QMrbLPfKfs3tcKoxqYMEpLRWpnnY51P9
 e3xPO+HrbXq3qPwmn0CyjamAlo34U3vvfCGfTaAwWrK1JLwtvckvGWPOWL2FAJaKzx2XkuP7CG
 nVBpvnlIR3nXeKOEde3I+6xAbn2MU3v94foT32/l7yliCTzlLT72X50fsnfIefDEpBRI+9D4IH
 7b1x0RE0aK2cv+guoCWCwDFhZIRm/cKXQBZgL4gfwFsdzDYWFUCh2T/Kei+IDcB2y0ESMFklVV
 y9Vfhdrt9ARLnXiR0AwAA
X-Change-ID: 20250413-reftrack-dbgfs-3767b303e2fa
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5469; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=34TUZi3qOElaSed4nw9qb+k1ylFQGi/Eb0a+fyUwQac=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoPtwUF2tKexk0NfHIfXSZPIZOlSmCxiQ5FejrQ
 tjwBwHhzGSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaD7cFAAKCRAADmhBGVaC
 FegvD/46d+gMoksFRhuUk1ZZYj25LCaNXcygpg3KBTarN2QpiUyCaVrYEvBo/46Br+s0BXH4Dej
 3V7QT64jUWIyXkhrEgJCIPN6NGbkjyxTSFab3Ko5y8EHzrX4RutVUKZmE8s/E4DiCJil2oZBlBJ
 UKex+Wk6shlzgq1VfyPLbMRWlvuq1Hj3vAfrDqzKC4X/EyHNSnr1H0ES+I7pUV/HmGWbFr4Ljk2
 Cpy0XufVKLk5zg2B2I/4rJnQghG1EkGFdI5i1aVaqNo2XjGzfnN3Gu6tnQCwyGG+q1i6+lxElmx
 nOHDTT6dJu1WEshqYVTMNPpaofWG6gzwC4HJbp6IUc0/Oeu8j3CS03FpLGaWAutj/oKfp9RVH7e
 tBJM5bMVUrlOwjlcmXumuku8HD0rHZHtbUjXoiSNt4DRNHc2hJ4uwVyv8sU0Z+U+d2jmv3D2c7k
 EXJ50EuWx6zz1TgDWmNC/GgQiTzfher4YqWUIgG2i87KrzIEiF3b9X3pywu6njL4r791DmXVTWV
 IYWH3yDddd2FkRe9Yf622NLH6YDxM5GtFTJ6LVWldjkrrntfPh2yahNMM56GUNAqQ7PyzF3v6IB
 5XHdTu6H7Kn+HEdPqvUkV/y4e1j6fyZ4jo/3wXciWlGzStd4aP2eH+dkfxdsbmdNIbGK0Kf9um3
 PWD64hGgdJcdsIg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

For those just joining in, this series adds a new top-level
"ref_tracker" debugfs directory, and has each ref_tracker_dir register a
file in there as part of its initialization. It also adds the ability to
register a symlink with a more human-usable name that points to the
file, and does some general cleanup of how the ref_tracker object names
are handled.

This reposting is mostly to address Krzysztof's comments. I've dropped
the i915 patch, and rebased the rest of the series on top.

Note that I still see debugfs: warnings in the i915 driver even when we
gate the registration of the debugfs file on the classname pointer being
NULL. Here is a CI report from v12:

    https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_148490v8/bat-arls-6/igt@i915_selftest@live@workarounds.html

I think the i915 driver is doing something it shouldn't with these
objects. They seem to be initialized more than once, which could lead
to leaked ref_tracker objects. It would be good for one of the i915
maintainers to comment on whether this is a real problem.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v13:
- drop i915 patch
- Link to v12: https://lore.kernel.org/r/20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org

Changes in v12:
- drop redundant pr_warn() calls. Debugfs already warns when these ops fail
- Link to v11: https://lore.kernel.org/r/20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org

Changes in v11:
- don't call ref_tracker_dir_init() more than once for same i915 objects
- use %llx in format for net_cookie in symlink name
- Link to v10: https://lore.kernel.org/r/20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org

Changes in v10:
- drop the i915 symlink patch
- Link to v9: https://lore.kernel.org/r/20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org

Changes in v9:
- fix typo in ref_tracker_dir_init() kerneldoc header
- Link to v8: https://lore.kernel.org/r/20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org

Changes in v8:
- fix up compiler warnings that the KTR warned about
- ensure builds with CONFIG_DEBUG_FS=n and CONFIG_REF_TRACKER=y work
- Link to v7: https://lore.kernel.org/r/20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org

Changes in v7:
- include net->net_cookie in netns symlink name
- add __ostream_printf to ref_tracker_dir_symlink() stub function
- remove unneeded #include of seq_file.h
- Link to v6: https://lore.kernel.org/r/20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org

Changes in v6:
- clean up kerneldoc comment for ref_tracker_dir_debugfs()
- add missing stub function for ref_tracker_dir_symlink()
- temporary __maybe_unused on ref_tracker_dir_seq_print() to silence compiler warning
- Link to v5: https://lore.kernel.org/r/20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org

Changes in v5:
- add class string to each ref_tracker_dir
- auto-register debugfs file for every tracker in ref_tracker_dir_init
- add function to allow adding a symlink for each tracker
- add patches to create symlinks for netns's and i915 entries
- change output format to print class@%p instead of name@%p
- eliminate the name field in ref_tracker_dir
- fix off-by-one bug when NULL terminating name string
- Link to v4: https://lore.kernel.org/r/20250418-reftrack-dbgfs-v4-0-5ca5c7899544@kernel.org

Changes in v4:
- Drop patch to widen ref_tracker_dir_.name, use NAME_MAX+1 (256) instead since this only affects dentry name
- Link to v3: https://lore.kernel.org/r/20250417-reftrack-dbgfs-v3-0-c3159428c8fb@kernel.org

Changes in v3:
- don't overwrite dir->name in ref_tracker_dir_debugfs
- define REF_TRACKER_NAMESZ and use it when setting name
- Link to v2: https://lore.kernel.org/r/20250415-reftrack-dbgfs-v2-0-b18c4abd122f@kernel.org

Changes in v2:
- Add patch to do %pK -> %p conversion in ref_tracker.c
- Pass in output function to pr_ostream() instead of if statement
- Widen ref_tracker_dir.name to 64 bytes to accomodate unique names
- Eliminate error handling with debugfs manipulation
- Incorporate pointer value into netdev name
- Link to v1: https://lore.kernel.org/r/20250414-reftrack-dbgfs-v1-0-f03585832203@kernel.org

---
Jeff Layton (9):
      ref_tracker: don't use %pK in pr_ostream() output
      ref_tracker: add a top level debugfs directory for ref_tracker
      ref_tracker: have callers pass output function to pr_ostream()
      ref_tracker: add a static classname string to each ref_tracker_dir
      ref_tracker: allow pr_ostream() to print directly to a seq_file
      ref_tracker: automatically register a file in debugfs for a ref_tracker_dir
      ref_tracker: add a way to create a symlink to the ref_tracker_dir debugfs file
      net: add symlinks to ref_tracker_dir for netns
      ref_tracker: eliminate the ref_tracker_dir name field

 drivers/gpu/drm/display/drm_dp_tunnel.c |   2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c |   4 +-
 drivers/gpu/drm/i915/intel_wakeref.c    |   3 +-
 include/linux/ref_tracker.h             |  58 ++++++++++-
 lib/ref_tracker.c                       | 176 +++++++++++++++++++++++++++++---
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  34 +++++-
 7 files changed, 253 insertions(+), 26 deletions(-)
---
base-commit: 90b83efa6701656e02c86e7df2cb1765ea602d07
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

