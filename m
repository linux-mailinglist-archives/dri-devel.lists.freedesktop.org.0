Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A63AA4F96
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA96810E7D5;
	Wed, 30 Apr 2025 15:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XIBabOrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A7810E2F2;
 Wed, 30 Apr 2025 15:07:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E49875C4C19;
 Wed, 30 Apr 2025 15:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EABC4CEE7;
 Wed, 30 Apr 2025 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746025622;
 bh=r4W7UK6VId5X4X90Hb+OqrSmtTfxJkdDYqm0TdhLa44=;
 h=From:Subject:Date:To:Cc:From;
 b=XIBabOrtGfQ5dXjam4puFKGo0A1cokvNqVVd/6fPd75felZY1iZoX6dILL7u4MaQe
 4n1BcCD6PFZFVm/d65Lyjf0vnzdDcxaGKOLNXoDuGH3uAvaYZkpe9uxSwhsKaQaXDQ
 V4rDJFpuahAN3hOEOO1R0Q5ye9rH58uW8j6QJ1oIpxWQLcdZbJ4jfjfD6bEIoq9dYv
 K2mjMrlPIospSRVQMyEPvOhNRUmlwMoID1vpyU4punxNkicYXnibYnJHqKMyW6nH0Y
 F6M39u5iqCGvMH1pHrAhnhbUrZVPBPWKK7ziDzckDSEsPrOPCr4396X31GQLDVI//s
 Xb4JHaeUxrtmg==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v6 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Wed, 30 Apr 2025 08:06:46 -0700
Message-Id: <20250430-reftrack-dbgfs-v6-0-867c29aff03a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIc8EmgC/2XPTWrDMBCG4asErasizWhiuaveo3ShX0ek2EUKJ
 iH47p0ECm61/EY8L+guWqolNfF2uIua1tLKMvM4vhxEOLl5SrJE3gIUkDIaZU35Ul04y+in3CQ
 Ox8GjwgTZCUbf/F6uz+DHJ+9TaZel3p79VT+uvynzP7VqqWRWSJYsAih8P6c6p6/XpU7i0Vph7
 6nzwN5rG4zzUQPkzuPeD51H9gE1jQZssNl33uy97bxhT8FRGOw4kjGdp52H3hN7HbyPmT9vffz
 jt237AXIsOHCtAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4062; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=r4W7UK6VId5X4X90Hb+OqrSmtTfxJkdDYqm0TdhLa44=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoEjyNXqxw6nyk1FblIzq6mWVlgjFIA87b77jll
 3HAH9RlaWOJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBI8jQAKCRAADmhBGVaC
 FQ3pD/0TsmOcqqHioqrgnl/qIAaObykbwezcD1n1j9iShimAwdpVaTgKiAKUEHOvUOWjq52FBrY
 O61pcSpM9GiOKsLOlpHh9uHW4V9kyk4VPhqGKZnGYMbi3V/luArvxHHWWJozwx1inFFD5SUZVlj
 n0NxfRaaf34LRjer2ubDDQDE+Q1E7Ra0EaSJ0Z/ebbwx3yMRazgv/KBJi9gfjftfmvKQjQT+kud
 VspuBs9dxXzDqCrEJynPctx3lwh/9luRZye4P7PmJjN5DH6e/KaluYJKajBUicIUhcoEvkpLsGq
 J2sHhkBILX/6CZSSGvCLjZoE5eJC7CELz6yuESNnl1AWKi4u570Vf+EsZhxcZK6j2E9nlvl8l94
 +kdkzGWLxLAnfy/X0svb8VhbRCFCAOAfzUzCwDiB9kBLnZEUylU+vr1L8TO/JzKhN/tcskredMx
 oYiCUKv+b9chnVXeA7xLjb14iU6IkQxXxDqVgVE7GkC4WvP2+Ix/lnFzm9JCYKnUW+kmsCVqC9x
 5dfKY5vHwjNTNWuep7qrAF27E2vA93B6P4sjW3l8UXUagbraBEZoBdfmyoaHxpaHLEGMHArtKu8
 ZS+p69ShkwccQK+194r0ZpR5chzZVdauAWtk4MTKlSXBsCqf61Gs6Jr6/R2OSMC/2UqHYXcyNen
 N5ezk9bbbIhCilg==
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

This one is quite a bit of a change from the last set. I've gone back to
auto-registering the debugfs files for every ref_tracker_dir. With this,
the callers should pass in a static string as a classname instead of an
individual name string that gets copied. The debugfs file is given a
name "class@%px" The output format is switched to print "class@%p"
instead of "name@%p".

To allow for human-readable names, I've added the ability to add a
symlink in the debugfs dir that can be set to an arbitrary name. This is
optional. I've only added them to the netns and i915 trackers in this
series.

Finally, with the above changes, we can eliminate the "name" field in
the ref_tracker_dir which shrinks it by 16 bytes on a 64 bit host.

The original plan was to merge this via the networking tree. That's
probably still doable but there are some display port and i915 changes
in here too. Note that those are untested, mostly because I don't have
the necessary hardware handy.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
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
 include/linux/ref_tracker.h             |  44 +++++++-
 lib/ref_tracker.c                       | 192 +++++++++++++++++++++++++++++---
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  32 +++++-
 7 files changed, 253 insertions(+), 26 deletions(-)
---
base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

