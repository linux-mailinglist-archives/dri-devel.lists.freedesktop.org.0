Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED776AC6BC0
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D4810E641;
	Wed, 28 May 2025 14:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qmjn/eJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CA410E605;
 Wed, 28 May 2025 14:34:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A6914A74B;
 Wed, 28 May 2025 14:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC51C4CEE3;
 Wed, 28 May 2025 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442888;
 bh=la70WX+ZHL0nPCFtUsmvxU0TbQDjoteqMB0xVg2UTpo=;
 h=From:Subject:Date:To:Cc:From;
 b=qmjn/eJ8MyNPMizk1BpxNT4BSJ5d8cWdaFq1rS427rcoeOpAmw7i4Ooxu45hBdelx
 xDD3IaO6jOgfoYgjkxOhCrq6yRuCKhK158MJWgGwRu6AIsebHZhm+xK+TXht41ldqx
 m3LWt+2BXGqM+V5v6SnrPZiC4wFULOsmdsQJu6RP+k8xoVPGo9J7RhWR54/+07foML
 MVyMX1BSaVj2ZYuR4Hf2Xz+agj9RJCQaG21o3lpl2muq/IWeBkGwjXZp9XtQ6WJUtz
 hbhk/oxhQFD15hnqUYPcCvvPDtnRyeWbLXcl87e35p269vfMUoedaIrflxIGdDnn7Y
 NLA9Q0g3KcdoQ==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v11 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Wed, 28 May 2025 10:34:32 -0400
Message-Id: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgeN2gC/2XQS2oDMQwG4KuEWXeKXxrJXfUepQs/kyElCZ4wt
 ITcvZpAqVvhlWy+35Juw1LaXJbhZXcbWlnnZT6fuND6aTekQzjtyzhnvhiMMqCctmMr9dpCOo4
 57usyWpwwWmWLqWFgdOH3+fOR+PbO9WFeruf29fhg1dvtT5T7H7XqUY1VWSAga4yyr8fSTuXj+
 dz2w5a1mt6D8IZ91JRciFkbU4W3vUfhLftkNXhnKFGNwrvek/COPaQACcl7cE546LyRHtjrFGO
 uPDzFLPzUeauEn9jThMn4UHmPQXj89XyEx23/SAmyx5iS9NR7uT9iPylEjdnG6El433svvN/6D
 5GIggPj5PxadQFGNqAVJ+QEUBEVTF7/Sbjf798wo54L8AIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4580; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=la70WX+ZHL0nPCFtUsmvxU0TbQDjoteqMB0xVg2UTpo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx7/6/eA3upt3zeE4DWP2UU17Ec+usxykPRIq
 ef5IGth2byJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDce/wAKCRAADmhBGVaC
 FT1WD/4hg4MqOVwhf66jaDEuhZ+DfRLZx83XT+w0cGXI5pG4f3e9TndsQV38W5/Kxrpdgk2Ni2Z
 Qye+uNd/Ww93OBsrB57zk4oMD2qzStmB9fCm3MzOEn57/+/zV64UEoUgFU+jEywVyTgF+sWqW0s
 cbKH5JvnSsY8v480OMPPV/i3P5XjUeiIdCvMQLF3cMvFoVOCxNgBATH/6JRrVxN880H9UqO298h
 4AnOyicPD3xwzP7CwbHXtoUKlSgD9g0TGwYmEFY5+SUA3cFBVODGI8Q/Q3XWLMeTzSbRmnl0Spq
 8Pgae+GF9lqD34HF8+EAEpig3Hq1iatLSl0nXzY9Av+XfPc7dsS0UgWdy12lMCjtoEd6j/P0wUW
 BcUNW0cVF4OrmGUR6ihEpjbl2LIyL3UUV/fGXTQb+pcpfS3XPRDqUuquuAmzbANoujA3kdfhfQ+
 8CKcHLt9K7Gs3l/S8vTOedKx4+bFmQZYXiRja+K7C71+fcTqwY52EJKj928jor+bnYbi5bslxOI
 JoetmyOxsaG0jAcLsXzAvwKY49bdWH4FQWijTEI/Ai2fvV4jD7z/rtxxLsM5zJmcS02zjZUqPjH
 HfgI4qsS6X7ZqMx4eZSp6vdmszjqoHxLRJIHXkHiYnfWDK/JbBjKoji/tBwXOalABiHKaCMJoTl
 nzY+9z8sSlGvQKg==
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

More CI reports [1]. This time it showed what I consider to be an
existing bug in the i915 driver. It can call ref_tracker_dir_init() more
than once on the same dir object, which could cause reference tracking
objects to leak.

The first patch in the series ensures that this doesn't happen. The rest
is basically identical to v10 aside from a small format cleanup.

[1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_148490v6/index.html

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
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
 include/linux/ref_tracker.h             |  58 +++++++++-
 lib/ref_tracker.c                       | 190 +++++++++++++++++++++++++++++---
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  34 +++++-
 7 files changed, 267 insertions(+), 26 deletions(-)
---
base-commit: fefff2755f2aa4125dce2a1edfe7e545c7c621f2
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

