Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46B344A49
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4DC6E500;
	Mon, 22 Mar 2021 16:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0406E500;
 Mon, 22 Mar 2021 16:04:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD9F06199F;
 Mon, 22 Mar 2021 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429077;
 bh=yAy/I3E6cDxsmlVnV0YJAH5ZEQIRtNmu4zak4TbdMtM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UB5shkw7Yd4R5EAaTaJbKCgGMQHdzM6i80uoGxhNLAKr58/Z+hb/X02iDZFbFM5q7
 ohBr0mnuKE2zD2dZIPp5mGV/8upXxQjJIfPGJp9PdMs6uae5VNAC7zYBRMfKWnHX2T
 dVcWKQocYTTmbDcT2P/QpYMSgUNzpEBC5mOFpZCLPDNYvMuLPWfLzgAFpKC9vWx2UV
 WcW6Gm/cjDbzo+bVOJsKrlf8DWJ6XKsV5KO6yCyvx8yAazXnd03HJIpEKsAL1WBIyL
 rctKK7FEjfv0XP7F/8O3bxyOq6H75TM+jdZPPW1bjsoXOWVbf0YQRUVNLoyOj2UQzP
 uTGmECN+tjDoA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH 06/11] cgroup: fix -Wzero-length-bounds warnings
Date: Mon, 22 Mar 2021 17:02:44 +0100
Message-Id: <20210322160253.4032422-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
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
Cc: Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, Odin Ugedal <odin@uged.al>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, Andrii Nakryiko <andriin@fb.com>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org,
 Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When cgroups are enabled, but every single subsystem is turned off,
CGROUP_SUBSYS_COUNT is zero, and the cgrp->subsys[] array has no
members.

gcc-11 points out that this leads to an invalid access in any function
that might access this array:

kernel/cgroup/cgroup.c: In function 'cgroup_addrm_files':
kernel/cgroup/cgroup.c:460:58: warning: array subscript '<unknown>' is outside the bounds of an interior zero-length array 'struct cgroup_subsys_state *[0]' [-Wzero-length-bounds]
kernel/cgroup/cgroup.c:460:24: note: in expansion of macro 'rcu_dereference_check'
  460 |                 return rcu_dereference_check(cgrp->subsys[ss->id],
      |                        ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/cgroup.h:28,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
include/linux/cgroup-defs.h:422:43: note: while referencing 'subsys'
  422 |         struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];

I'm not sure what is expected to happen for such a configuration,
presumably these functions are never calls in that case. Adding a
sanity check in each function we get the warning for manages to shut
up the warnings and do nothing instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm grouping this together with the -Wstringop-overread warnings,
since the underlying logic in gcc seems to be the same.
---
 kernel/cgroup/cgroup.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 9153b20e5cc6..3477f1dc7872 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -456,7 +456,7 @@ static u16 cgroup_ss_mask(struct cgroup *cgrp)
 static struct cgroup_subsys_state *cgroup_css(struct cgroup *cgrp,
 					      struct cgroup_subsys *ss)
 {
-	if (ss)
+	if (ss && (CGROUP_SUBSYS_COUNT > 0))
 		return rcu_dereference_check(cgrp->subsys[ss->id],
 					lockdep_is_held(&cgroup_mutex));
 	else
@@ -534,6 +534,9 @@ struct cgroup_subsys_state *cgroup_e_css(struct cgroup *cgrp,
 {
 	struct cgroup_subsys_state *css;
 
+	if (CGROUP_SUBSYS_COUNT == 0)
+		return NULL;
+
 	do {
 		css = cgroup_css(cgrp, ss);
 
@@ -561,6 +564,9 @@ struct cgroup_subsys_state *cgroup_get_e_css(struct cgroup *cgrp,
 {
 	struct cgroup_subsys_state *css;
 
+	if (CGROUP_SUBSYS_COUNT == 0)
+		return NULL;
+
 	rcu_read_lock();
 
 	do {
@@ -630,7 +636,7 @@ struct cgroup_subsys_state *of_css(struct kernfs_open_file *of)
 	 * the matching css from the cgroup's subsys table is guaranteed to
 	 * be and stay valid until the enclosing operation is complete.
 	 */
-	if (cft->ss)
+	if (cft->ss && CGROUP_SUBSYS_COUNT > 0)
 		return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);
 	else
 		return &cgrp->self;
@@ -2343,6 +2349,9 @@ struct task_struct *cgroup_taskset_next(struct cgroup_taskset *tset,
 	struct css_set *cset = tset->cur_cset;
 	struct task_struct *task = tset->cur_task;
 
+	if (CGROUP_SUBSYS_COUNT == 0)
+		return NULL;
+
 	while (&cset->mg_node != tset->csets) {
 		if (!task)
 			task = list_first_entry(&cset->mg_tasks,
@@ -4523,7 +4532,7 @@ void css_task_iter_start(struct cgroup_subsys_state *css, unsigned int flags,
 	it->ss = css->ss;
 	it->flags = flags;
 
-	if (it->ss)
+	if (it->ss && CGROUP_SUBSYS_COUNT > 0)
 		it->cset_pos = &css->cgroup->e_csets[css->ss->id];
 	else
 		it->cset_pos = &css->cgroup->cset_links;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
