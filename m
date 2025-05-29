Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8ECAC800F
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650D610E740;
	Thu, 29 May 2025 15:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UAbAMxWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C9A10E73E;
 Thu, 29 May 2025 15:21:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 154AAA4FA21;
 Thu, 29 May 2025 15:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAC3C4CEE7;
 Thu, 29 May 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532073;
 bh=caGaYPu0UkGeB7+G3TqgVtPAn9Bg5wZBX5MOByhpqpw=;
 h=From:Subject:Date:To:Cc:From;
 b=UAbAMxWfjhsYGL2H1oeRyWCTc6KqSBnkbds8AN77gD6Vrax6U6a5qnkzeKt1Bk57+
 DBxskzgUbhx8kLrQwwLRnMhSnbWNwIIigKOJ8ACwRdryje5ap7Oeq9nyffZ/ceWX/T
 UShDf74To720Yqe36JrC2Bb1C/OL7KSjh4k47jywcQ4M8CLb6sNzKmt3FfImLuCEl/
 djQctR73XJT8QUMnHorDkjXfMb0lDz6E+r+XOt9eOSo+lJr6fMd1nBJvZY5ik2SaaG
 VmnfJGgC+i/FJ4c9UfoN6tlEDqN764ktC6Gt/nnpB/hD9Pq+DCWfoJdaEhfeu7IrB6
 KX4EUMpnJNgiQ==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v12 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Thu, 29 May 2025 11:20:36 -0400
Message-Id: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAER7OGgC/2XSzU7DMAwH8FdBPVMUO3HjcOI9EId8btXQhtppA
 k17d9xJiICVUxL9/nGcXIe1LnNdh+eH67DUy7zOp6NMAB8fhryPx10d5yILAxok48COS23nJeb
 DWNKuraP1k0/W2IotDoI+ZH/+vCe+vsl8P6/n0/J1P+AC2+pPlPsfdYHRjM1YYmKLaOzLoS7H+
 v50WnbDlnXB3pPyKD4BZxdTAcSmvO29V96KzxYoOOTMLSnves/KO/GUI2XPIZBzylPnUXsSDzm
 l0uTynIryU+etUX4Sz5PPGGKTPkbl/a+Xobzf+u85Uwk+5aw99173j8VPxnvwxaYUWPnQ+6B82
 OqPiZmjI3T6/mC6ANQFgJGEkoma94amADoB+gT9BLD9weBiNQkmYvc34Xa7fQOpz2WVMgMAAA=
 =
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4718; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=caGaYPu0UkGeB7+G3TqgVtPAn9Bg5wZBX5MOByhpqpw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtgx1PtYsTdwWILvdXejRagJH/SM6YPiETyN
 kQQtLyDOzqJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7YAAKCRAADmhBGVaC
 FShSD/98v46oMoyLsz1nbbb0sS0Wpf2SN8RGm7KeIruEq1OeFZPOa+yEzJlEre/1kESGUIYBLla
 kc+zlW7irtlMgeFfMdMyPI5K2L2Q+PRY7VahnBYuxf6N1ABp7UUnk6uha9rHjX3zSY/OuGcdUCX
 ETC/3ZWUux6EL98ajdOwUytSnxA+wmnw44tnjh4jAtdxYwjrTZrGCcIiEh4+Gni5qCn8qA4PVaH
 P5fjVxaSbbUQXmGNDMfvdVcWO0p+DLYbD5h+OtpzHbWbZk9Dcgdws22jlqvEwef9lMf25B9+6w1
 /BtbclJD8QQ1X+fHiV1spwprcXX8HeWginrHOp8VontcaeNR2foXGGAuXjrKWMHnqUtH7RuQt5L
 X632574mM2kO7a66gBT6Mza/AzE6DNwSOtMAXvI0B9UlPJf1PVbEf2n4X2NNp+ACdCE2zl3Ij9b
 x4bV6ExC97ukDxlnTpPdYXtZzp7B3fIrovahOqOR6NkSdTqHmUIXskqxkT2P6OSrQ1vyWkqzV+Z
 1lpngCLVBJmxifw7JAC1Al5GS26FK0pCiBn4c/iv/bxp/Vb8Bj2/chIC+H89VaCGc1LBbiYfcdt
 1b/lQSI+9w8z5jdUSwIMaEPqll2BvKHDxwzyaja75WW19pY33RyoOhZWaxYWM17jF6tmOPfuLmW
 2pmLJKIhXnu9Pfg==
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

Sorry for the reposting, but this makes things easier with automated CI.

This posting just drops the pr_warn() calls from the new functions. We
were still seeing some warnings during (expected) times that debugfs
file creation would fail. debugfs already throws warnings when these
things fail unexpectedly, so these warnings are unwanted when dentry
creation fails before debugfs is up.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
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
Jeff Layton (10):
      i915: only initialize struct ref_tracker_dir once
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
 lib/ref_tracker.c                       | 175 +++++++++++++++++++++++++++++---
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  34 ++++++-
 7 files changed, 252 insertions(+), 26 deletions(-)
---
base-commit: 90b83efa6701656e02c86e7df2cb1765ea602d07
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

