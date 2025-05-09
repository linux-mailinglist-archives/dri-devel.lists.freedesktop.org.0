Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537CBAB1958
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8615310EA85;
	Fri,  9 May 2025 15:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ThrL/NgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430B710EA7D;
 Fri,  9 May 2025 15:54:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E3BFCA4C610;
 Fri,  9 May 2025 15:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4871C4CEEF;
 Fri,  9 May 2025 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746806066;
 bh=8ghmJZjkT+kMpamh0TbHiZN5SjGR0bvWExcS3pJiWGg=;
 h=From:Subject:Date:To:Cc:From;
 b=ThrL/NgUC60IghmNzajhR98nXzaYBy+WQylewpz22jFBQ0d4fz49eDlm3W/fP8jpZ
 5z+8LI+R4G68FPzJyJmaIam/kFVBv+UxE3vC3wYnn1fzw5NLUrcJuTpBcfZ6/hN50a
 9xlEKSFvjqvEq1Hip44F6bmFMMCs9cw6g61h6at500HuX1QcKHM+XV62jUJZBaDecv
 WtZ+LkOkezgsMHrR2FxK6EfAkif5LRN9R2dfT+4hw+G1TW5Bd5zS86RSxx0qFPNiMn
 5jvq1j/BsFrQV2/lstqB6XT9zCfhfoSQxlMOpgax/2PzEnuOYLIlmEK/PuS2pXkc/K
 iG8jF05kZF05w==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v9 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Fri, 09 May 2025 11:53:36 -0400
Message-Id: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAlHmgC/2XQzUrEMBQF4FcZsjaS3+bGle8hLvLbKSPtkA5FG
 fru3g6I0UtWJ+E7kHNna2lTWdnL6c5a2aZ1WmYM/unE0jnMY+FTxsyUUFYYqXkr9dZCuvAcx7p
 y7QYXtdBF1cAQXfF9+nwUvr1jPk/rbWlfj/5NHrc/VeZ/1Sa54FVoCxa0UkK/Xkqby8fz0kZ2d
 G2q95Z4hT5KSCbELJWqxOveO+I1+qSl9UZBghqJN70H4g16m4JNDry3xhBvO6+ot+hlijFX/Dz
 ETPzQeS2IH9DD4JLyoeKOgXj36/EQ7479HSSbvYspUQ+9p/sB+kE4J13WMXr44/d9/wZqaWvdb
 QIAAA==
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3867; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=8ghmJZjkT+kMpamh0TbHiZN5SjGR0bvWExcS3pJiWGg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoHiUqqVnEi1rMDJuEJLSpDayIBxzBNiaTNfqc8
 bcemNOYp6qJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaB4lKgAKCRAADmhBGVaC
 FXQLEACN2MZ1L+j6XswyMaJBsf8xxPlYNp/sJ7K9+J9utauwCnI+KLiYFt60XD7vSkXh3g4/1Dn
 sTTwFSbbI5zM5OiFS26Jk/4QHW8TSp6b2Mprib7HceYl8DV/FZWFPSAF+CikREPdAAiFeuDrQvz
 54NnPR84QuhAi/da7q8czhl8IWb9EM7/I8nLQnNkmj26L7s0NOROakjqSiRmLYl6c8lxpztTnHJ
 qFTHyZnncx8xw7xlb052v3J+mHS6cy9jSUmEBS+Blhrf3RxNQhH3etMcMFWIbR/ryPpnxD/oa8B
 gHbEbP/GAZC0wFX5i5ppzuGvkTGhAbDjJJtbc+VcAp0BKAjPPd3yE8WEddhscMi59WvWJn6SGwt
 mR38T52303COGiaMqoARN3R1BBHbx9kVbjAd6cNmVbi45gNYx/7wpKEHtj2JNM6q+uOOn4CMYKg
 d6/7pmq+79SrwcLv+Kzqdap36lJt05qeE4MtT+2eqkfqFoZUKoJxNWTycTs9qiC3t2hopHDKeZb
 ESjc6A0QdxFz60yCPHoTUXU6vSXRtIQLpaX3GKXbN/VMuQ0xAeUff+oFZlFPxp18GPU1RYqjwjx
 NWsEH128CrkEvz/ecScOhezWV2SoKi0nyKy9SGWXapc+ey3C+xdGfwBT1XmS3v0rW4wc3/cOU++
 L5LrGuST51FVLeg==
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

This one just fixes a typo in the ref_tracker_dir_init() kerneldoc
header. I'm only resending so the CI will pick it up.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
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
      ref_tracker: don't use %pK in pr_ostream() output
      ref_tracker: add a top level debugfs directory for ref_tracker
      ref_tracker: have callers pass output function to pr_ostream()
      ref_tracker: add a static classname string to each ref_tracker_dir
      ref_tracker: allow pr_ostream() to print directly to a seq_file
      ref_tracker: automatically register a file in debugfs for a ref_tracker_dir
      ref_tracker: add a way to create a symlink to the ref_tracker_dir debugfs file
      net: add symlinks to ref_tracker_dir for netns
      i915: add ref_tracker_dir symlinks for each tracker
      ref_tracker: eliminate the ref_tracker_dir name field

 drivers/gpu/drm/display/drm_dp_tunnel.c |   2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c |   4 +-
 drivers/gpu/drm/i915/intel_wakeref.c    |   3 +-
 include/linux/ref_tracker.h             |  58 +++++++++-
 lib/ref_tracker.c                       | 190 +++++++++++++++++++++++++++++---
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  34 +++++-
 7 files changed, 267 insertions(+), 26 deletions(-)
---
base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

