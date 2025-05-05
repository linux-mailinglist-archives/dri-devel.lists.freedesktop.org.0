Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28626AA9AA2
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDC210E410;
	Mon,  5 May 2025 17:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YoeKViSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B6110E40C;
 Mon,  5 May 2025 17:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 645F15C049D;
 Mon,  5 May 2025 17:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE76C4CEE4;
 Mon,  5 May 2025 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466409;
 bh=A9nqwk4EU2CFq+nYXobdwXRr84cWRlfVQ+QuUpCQ57U=;
 h=From:Subject:Date:To:Cc:From;
 b=YoeKViSMJjyBioYn99YJcg3fMmlpvnFk07JFGSXKQ7BMS6WLhry76wkKFwm+Te3zK
 Z71iIh9W3IXczAYGrLCvJ9+hCpUtVKEz8hkO8MlgmsHnRuFASy0wt+9tuTjfhmrHVi
 qf4YvlWWPcEUGT+y3uNYIvHNIfKoQhWaQYvTVM0IFXmLaEPAvbg5yOvPgkfWXsBZ8V
 64SKDanLsPeG0jLRRk6ur4Ytj48W4P+yskRDRLStUlqJUGNx4vaQyMzhgRrRPETi0C
 3gQc91Ay6UYK8zSJXx9m/efjZ4Wq9JNxTyPegfsTMysq9Hf6OT9VMkeJH8cRL56ma2
 qUiSANJIAPxzg==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v7 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Mon, 05 May 2025 13:33:14 -0400
Message-Id: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFr2GGgC/2XQzWoDIRSG4VsJrmvRc3R0uup9lC78nUjKTNEwt
 IS5954ECrYuP+V5QW+spVpSYy+nG6tpL61sKw3zdGLh7NYl8RJpMxCghZLIa8rX6sKFR7/kxtF
 MxqPABNkxQp90X74ewbd32ufSrlv9fvR3eT/9Tan/qV1ywbNAbbVFAIGvl1TX9PG81YXdWzv0X
 g8eyHtpg3I+SoA8eOy9GTySDyj1rMAGm/3gVe/t4BV5HZwOxs6zVmrwuvMwek1eBu9jpsdbHwc
 /dR7F4CfydjIBZpfpH90ffxzHD58iwrztAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4332; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=A9nqwk4EU2CFq+nYXobdwXRr84cWRlfVQ+QuUpCQ57U=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZh/zwOU78oskuy2Fq8nW/14U1t/GlL8FSf6
 h60UEe1S3yJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2YQAKCRAADmhBGVaC
 FUaQEACzDsUMhzfWXRnGuD2PzW5co2ALVUNLJFKiiKpZ6s2KReXJbAezpqTZ+/JlLuzDA17wpYI
 oC1gQEjE6XYOIIqK8xUjtWtRRHkCDwvBWRlufftwWeDsnozbJEE4ArrIXTxC7DMOUaneZEBj9so
 IA/wSOgsoGbaGpKkbxC97e9VS3UyU5ZHJmcsSZg61lIgl3azV1QCn1oCPvX5e5YMV2F0FZTGFfh
 82ufKlOMz+t5MXA9AQXuwCQuiwdLI/CuAcWrq3zzez3RXWvKaemsPVZSQhZzVMRmgBEgv5Ns3Vh
 LDcuAPHQFWushXiHjOcIo3jx7bqM6xVQP9lRwhcZ47fMqaQ7m0i1WwVnvsnD3fhB6OOqd1LlV9G
 4/oqQHL5r5ECqrDyucKIOdyYUk1h4YH2CVSYvyH9iozOO6AHo1TDshp1K1tQ6Jhr1AiP0/JTgB0
 9d7JjyoqBINB4kkpKu0b4DWsjUcQ/cCR2X0Iyv93b2qOFBCRhXSUatU1nAIZz+Lhi4yK05xsIl1
 EqNgnGDUo06UfwkCp2OUfyE6w5BbJbQyk4PQ9H1r0+7wtggTxU5gPjd5bqnljXxK8Fw3kFvWIQq
 tcK1HpwNh4XieC+gHV5PSIr4lWs4her4hq7MJZ0tfnaXTDfinwi5IlfRkOPAlc4Qff87IUYTHt6
 wsjJl2rCqp4LvEg==
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
 include/linux/ref_tracker.h             |  46 +++++++-
 lib/ref_tracker.c                       | 190 +++++++++++++++++++++++++++++---
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  34 +++++-
 7 files changed, 255 insertions(+), 26 deletions(-)
---
base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

