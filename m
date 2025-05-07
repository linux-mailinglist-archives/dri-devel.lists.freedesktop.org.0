Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54532AAE009
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB02410E05D;
	Wed,  7 May 2025 13:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SoANQq3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7B410E05D;
 Wed,  7 May 2025 13:06:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D9DA5C5B0A;
 Wed,  7 May 2025 13:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F45C4CEE7;
 Wed,  7 May 2025 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746623212;
 bh=wyAYYd84JBmoBLFkIu08Qe55Uogwnq+GwPkJ9/VYoFg=;
 h=From:Subject:Date:To:Cc:From;
 b=SoANQq3hHJQV9KgS9Z7XVfwsP/Meoxu9SvgyKX2su5wlTjqCpq2mB0G3424QgeutE
 Rwh1usS7XyEIKcO0zfl4dqCzVumxGUHm9shInbxDlDP7RjWuu+4kJ0HC9PL5ag+Q7t
 6KyjQYupU045CQgfirq6BRe+Em7esBmHnkdA7Qjati5cUHP1SczOx7/4kyNk0/MuCn
 jQzthBilyIpTHP7DQ5nzHChFDrq8D505lRamWrT+vjYCny8fjkQLPa5CaNfyNKSjUm
 Tix58VokwMdSl9frxL+ju9rhrED9SWNehYaLJ7l9Z8I1tI7tQXkliZPMn0EIMFVm7x
 8lggBaOdwZmrw==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v8 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Wed, 07 May 2025 09:06:25 -0400
Message-Id: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFaG2gC/2XQwWrEIBAG4FdZPNeio0bTU9+j9KCjZmVLsugSW
 pa8eycLpWnF0+/w/TBzZy3Vkhp7Od1ZTWtpZZkpuKcTw7Ofp8RLpMxAgBFaKl5TvlWPFx7DlBt
 XdrBBCZUge0boSvPy+Sh8e6d8Lu221K9H/yr3358q/b9qlVzwLJRxxikAoV4vqc7p43mpE9u7V
 jh603kgH6RD7UOUALnz6uht5xV5VNKMGhy6HDqvj951XpM36A1aN45G686bg4feG/ISQ4iZlnc
 hdn44eCU6P5B3g0UYfaY7+s7bX0+v83a/v3Vo4mgD4l+/bds3wXPUIy0CAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3668; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=wyAYYd84JBmoBLFkIu08Qe55Uogwnq+GwPkJ9/VYoFg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoG1rhBJ9llmbY3ne2ZbTEU+iAzAWhkr9X5Nag1
 ifMlVoU+BKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBta4QAKCRAADmhBGVaC
 FVDzEACJu1HeohOGr7I/rjrFlmMFPaLjCvxlvM0mu2GfDxiaiQALRxoA8pWoxjyz4oomP3zlG4X
 6N+WX/N4lryaaX6zqwy0LVD6eBf9R8y7GBtlvHhWBSwPMqmRu1/UPhJw0jh7irTVwgSbQSn3DBz
 KLdE6TkOx7jSSC1TukYfgHlHham+i3OQSOsjKMypJ7FlrOyAERyQTVdS5kzJTfbYMUx8jbfdr2X
 /0N8kSYtWA0vQLC8AOEPzeDjm5TdohIbunFFp+kSYlQV79h0kP35B7JFb77hKXn5zBNvEND8Ha1
 nvbdM6qhMrd1a6zGeAsmLM3rBAbl/kpQCIcd8Yj4dhlZ+LKAPSAkdw8hMZts98vFlFx1OcKdH7U
 tSOHBoOYPQ6uAKCE6xplxsnVE9LLzdJfaSJYiAVoK59J/NG2IO2JEzQUi+NTVwYTxW8BmOy5u6o
 qT/zMuztogcTyYaLIEMjzDhIsH/p+x8fsOwHogamDIzcizB6r894cHXrQ4DnNkBe+/zCVXvrflT
 lY9JFgDYfXQ3I/RFzwjaITNu4Jezf3OcYL2nqdyRyZEeOQLH7mpsHaehPWz+tkBz8caLWQcEzRW
 sOeV6gHrVs/Wwy50337BwAW+pTaeTgR1p+FB2Hr37aXSTTPc2amYEf4yR/DEsvymeKfYf0F6u/v
 2OEnPYtZ/HjBn2Q==
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

Minor update to fix up the build and some compiler warnings with more
esoteric Kconfigs.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
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

