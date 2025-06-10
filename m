Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B476CAD3BF6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837F510E579;
	Tue, 10 Jun 2025 14:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F4yTioU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E485810E305;
 Tue, 10 Jun 2025 14:59:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A252E437A4;
 Tue, 10 Jun 2025 14:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A89C4CEED;
 Tue, 10 Jun 2025 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749567583;
 bh=xo8hRoQ/oJkBUi54Isd3E3U+WhZu4rxuIG3jfMNQayo=;
 h=From:Subject:Date:To:Cc:From;
 b=F4yTioU1tp/tU6D6ioYwDopq0DLPZaJlldmqJV9efokNYDCSy7QfkNYU1uBh0Vul/
 9QqiMRYEJK2z6hJWSh9jQ2pRHfwd3rcOi3QOzNA+nzM6F2CRoi/DSY7pq9PLtm5jnp
 kBAXZXQtQoqF1xiOZUJpUSlfJdXXkFzwSSQVuofTF6CByOXGKpOws2IDyoivhbasfv
 8HnaHEsLSPYID+idnQe5nvCI8ybUmCC42ZghUNdYpq5pjUzUe89vG/QwX+dB/3IeHQ
 G4dbl6wCEgiWB57pm9kbheDBBCfKoG3x9m2kzX7ND+YScrXCplbdzGMPNQRflox7HR
 sMWMK+CyJNM7A==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v14 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Date: Tue, 10 Jun 2025 10:59:20 -0400
Message-Id: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAElISGgC/23SzU7DMAwH8FeZeqYoTuLE4cR7IA753KqhDbVTB
 Zr27riTEAGjnpL290/s+josdZ7qMjztrsNc12mZzidegH3YDfkQT/s6ToU3Bq00KgtmnGu7zDE
 fx5L2bRmNdz4ZZapucWD0zu+nj3viyyuvD9NyOc+f9wNW2Ha/o+zfqBVGNTZlkJCM1so8H+t8q
 m+P53k/bFmr7j0Kr9knoGxjKqB1E9703gtv2GcDGKymTC0Jb3tPwlv2mCNmTyGgtcJj57X0yB5
 ySqVx8ZSK8K7zRgnv2JPzWYfYuI9ReP/j+RHeb/33lLEEn3KWnnov+0fsnfIefDEpBRI+9D4IH
 7b7x0RE0aK2sn5QXYCWFwDFCSUjNu8VugAyAfoE+Qtgm8FgY1UJHJL9J0H3CbII2KYQIAWTVVb
 JVZnQjaFTRiZsc+iTjpY/gFB+9/F2u30Ba2ouC7YDAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6015; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=xo8hRoQ/oJkBUi54Isd3E3U+WhZu4rxuIG3jfMNQayo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoSEhP5OfdubL0F0dOUYEw4Yw4bNQtC7hHZDhxd
 aCwfLzNcbKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaEhITwAKCRAADmhBGVaC
 FZhfEACk15nCBwd9un5khh5LXDbiSNOROqQ7HExIIdAt5Hh5JXwrhrmBVnQNbN8c8abs55HhhMW
 OjXvJ7IwnLwD0FpmiA8lyuyRJC8Pi/q64XkqZ1jUiyPro1cYnniXkWgAzRePufYQ/zCEnRnWcPq
 KEb88MqzeCo1mqNDHIK5uqYTNkBlQE2WPtgdHC3VLUknvVpvhe0yZIfsljYtVpWFozIsxi6DR25
 lL61Jl1/t/uHi3nJc7T5BoEZaCdxyvhuj+2mxFpQaRgRjgev3aOmo+dnAAhD43OnbwL4DLuNIT5
 ZWrke2gSkjlUdxmeRnuL2dsShAKG7wJyk4LhO23pZLRGb8tZPEWr7HRQTaWnveXRuIfDKDrcXrX
 bx/OGUImd2MJqQXeY0a2xMZgrKY3dNV3SPnptBcUCcNhZ2Ubv/u9GxAx5eIAEJi2MW6lJKnfoXL
 CsfA3EJ+wRDNdM/IKXmK5gu96N9CAOjTZCSqU6JWkqj5kL4vy689G6MimOWmih9GKBisaBw/Tzj
 DLdy5VF/jXtj5mYeuJDrSn1HP/9up/UwUqzMEQ2NoAmqjvy+3fIA0+rC6gOeC9ZFCnQxfrJufa4
 ggRx4RtOyqrApKD7S9HoedQAGiCiiVnba4hViqOkhnPczgaUiTUxSucUWGAf6oLHejcNaLe/4Ut
 Nal4V6v6GeVOtqA==
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

The big change in this set is in how debugfs entries get removed:

With the last set, Jakub pointed out a warning that showed it calling
debugfs_remove() from RCU callback [1].

While ref_tracker_dir_init is generally safe for sleeping operations,
the same can't be said for ref_tracker_dir_exit(). It can be called from
any context, so it's not safe to sleep in that function. The removal of
debugfs dentries has to be deferred.

This set revamps how the dentries are tracked. Instead of pointers in
the ref_tracker_dir, they are tracked in xarrays from the time they are
instantiated. ref_tracker_dir_exit() will mark the appropriate xarray
entries for deletion and kick off a workqueue job to clean them up
asynchronously.

This unfortunately necessitates some complex locking for
ref_tracker_debugfs_show(), since the debugfs dentries can now outlive
their corresponding ref_tracker_dir. It's not pretty, but it should
work.

[1]: https://netdev-3.bots.linux.dev/vmksft-packetdrill-dbg/results/149560/2-tcp-slow-start-slow-start-app-limited-pkt/stderr

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v14:
- Clean up dentries asynchronously after ref_tracker_dir_exit()
- Link to v13: https://lore.kernel.org/r/20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org

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
 include/linux/ref_tracker.h             |  50 +++++-
 lib/ref_tracker.c                       | 275 ++++++++++++++++++++++++++++++--
 net/core/dev.c                          |   2 +-
 net/core/net_namespace.c                |  34 +++-
 7 files changed, 344 insertions(+), 26 deletions(-)
---
base-commit: 8630c59e99363c4b655788fd01134aef9bcd9264
change-id: 20250413-reftrack-dbgfs-3767b303e2fa

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

