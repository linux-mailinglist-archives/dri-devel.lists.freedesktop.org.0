Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63845AD4E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2BC6E185;
	Tue, 23 Nov 2021 20:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A267A6E15A;
 Tue, 23 Nov 2021 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PX6DFmuLauFsaWJNNGOxexZiiMzG6E0BCx21ecGYmG8=; b=p4mf9rgotBvhOXxYctzEKxvkuw
 zrpJ9fPlUIXVJjH6FTSFS2v21dS1rJtBCGpWwgC+2YpOrxzIL9CRSvnh8wCIitMFaz2Tr3v74iCZp
 DwTogfRlUVv5pysKD/6AWlrVTu+2R2h9FNL/BFNf67UR/7tF+9a+49vgov0vRXz1xRC7sEEJIdbpK
 FduY1Wskwp/rVQKTpAVa9EUlLTDJar/pqmQsZRuiTc6uGjVRoX9rbM4XwSKe4G4vyfQU2JZarWXQD
 oHTenr2J3guLvmo+5BMr2z1ZEWwZ2CqI7k7bmkUMTMNRM/xXyTnzLqkL98/Ad3oYhfZgKJsQu3z5Y
 1bLwPwfQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mpcL1-003R5B-67; Tue, 23 Nov 2021 20:24:23 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: akpm@linux-foundation.org, keescook@chromium.org,
	yzaikin@google.com, nixiaoming@huawei.com, ebiederm@xmission.com,
	clemens@ladisch.de, arnd@arndb.de, gregkh@linuxfoundation.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	airlied@linux.ie, "daniel@ffwll.chairlied"@linux.ie,
	benh@kernel.crashing.org, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, jack@suse.cz, amir73il@gmail.com,
	phil@philpotter.co.uk, viro@zeniv.linux.org.uk, julia.lawall@inria.fr
Subject: [PATCH v2 0/8] sysctl: second set of kernel/sysctl cleanups
Date: Tue, 23 Nov 2021 12:24:14 -0800
Message-Id: <20211123202422.819032-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the 2nd set of kernel/sysctl.c cleanups. The diff stat should
reflect how this is a much better way to deal with theses. Fortunately
coccinelle can be used to ensure correctness for most of these and/or
future merge conflicts.

Note that since this is part of a larger effort to cleanup
kernel/sysctl.c I think we have no other option but to go with
merging these patches in either Andrew's tree or keep them staged
in a separate tree and send a merge request later. Otherwise
kernel/sysctl.c will end up becoming a sore spot for the next
merge window.

Changes in this v2:

 * As suggested by Eric W. Biederman I dropped the subdir new call
   and just used the register_sysctl() by specifying the parent
   directory.
 * 0-day cleanups, commit log enhancements
 * Updated the coccinelle patch with register_sysctl()

Luis Chamberlain (6):
  hpet: simplify subdirectory registration with register_sysctl()
  i915: simplify subdirectory registration with register_sysctl()
  macintosh/mac_hid.c: simplify subdirectory registration with
    register_sysctl()
  ocfs2: simplify subdirectory registration with register_sysctl()
  test_sysctl: simplify subdirectory registration with register_sysctl()
  cdrom: simplify subdirectory registration with register_sysctl()

Xiaoming Ni (2):
  inotify: simplify subdirectory registration with register_sysctl()
  eventpoll: simplify sysctl declaration with register_sysctl()

 drivers/cdrom/cdrom.c            | 23 +----------------------
 drivers/char/hpet.c              | 22 +---------------------
 drivers/gpu/drm/i915/i915_perf.c | 22 +---------------------
 drivers/macintosh/mac_hid.c      | 24 +-----------------------
 fs/eventpoll.c                   | 10 +++++++++-
 fs/notify/inotify/inotify_user.c | 11 ++++++++++-
 fs/ocfs2/stackglue.c             | 25 +------------------------
 include/linux/inotify.h          |  3 ---
 include/linux/poll.h             |  2 --
 include/linux/sysctl.h           |  1 -
 kernel/sysctl.c                  | 28 ----------------------------
 lib/test_sysctl.c                | 22 +---------------------
 12 files changed, 25 insertions(+), 168 deletions(-)

-- 
2.33.0

