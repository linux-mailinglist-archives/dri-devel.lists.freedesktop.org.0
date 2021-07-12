Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8A3C4328
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 06:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDA689BE8;
	Mon, 12 Jul 2021 04:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976689BDB;
 Mon, 12 Jul 2021 04:36:01 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso874286pjj.2; 
 Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eqtuem0pDCqJ60ReBSt2sz2Ppq+kBwO0k3flKmvt0YI=;
 b=gpVU+Nizwy5fV7c592OCz5zlkJDtckkKHt+t8+m6hBQ3v6VktI37EJhTyrTUCRWDDJ
 b3plmZo9+FSFIt+Z+UUXPTDQ3ClQGN0xYSecEYW4uCTOTzZ38Vrj2Y1XpcH1mtoX09zX
 o5jDp4tZqaIxD77sQOOi01uTTGC+DWpf6OaNU3aCMwS+g6tjB3LsJ4ICiA0aLdqR5P6e
 WU91eDHeLOeBsm6wS+pqNydu/XtYdXjglcTrjvyxC6VZQasDQ2Ho0qe+FQJ1P8agROsb
 CPMYKT4cEoedcN2dKSZSDbZsGYojW/RAwBbsH00eF81UuyITQRI5v7uOGBTVDawQj+8c
 Y70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eqtuem0pDCqJ60ReBSt2sz2Ppq+kBwO0k3flKmvt0YI=;
 b=Vv22XwB9nkbely0xMblOP61UD8mzibli00tNZUbYfVdPZJAfHIX7F8Ijx51iworWlo
 YAOrB7lwe1tsIYsJ0ZJVJjIWa5ZvLpkRHWYHoyqQwrkwivhyOBwO1T+h37Bkg69El03Q
 nqpK6TWXUCG88ViQRwShjC67eaQqP2IFCHm1xPEm6MlOcrc8IhzAHlQ1ZYe8V9nrpw3I
 KNkgNQkrpeXGxvhkPn3UQomOl0j8GyN3+EdoGYefrQM0PonQoyPkiDEQFs8UQSHmFKPI
 rmfB/rNg8v7rYKkRD5e2yvugiurRtQl+OPb8cOecrZXwzRpE4wRgIY7FWd1X1yX+Pt6L
 pD7A==
X-Gm-Message-State: AOAM531/81Dqqbxg93HxSlNnwV8nTbrVF7obBMfUOwUEyEGS6G6Sc3jk
 KLGPpJkdog/8Q3RvtxIBK3g=
X-Google-Smtp-Source: ABdhPJycCswKA9Nno/Iq/J/lSwP8BAVU6u7omTvZ3+UDJe82eUYASx3d6Wullh/KvRQpYfU0QCH8xg==
X-Received: by 2002:a17:90a:2dce:: with SMTP id
 q14mr28029561pjm.42.1626064561464; 
 Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v8 2/5] drm: avoid blocking in drm_clients_info's rcu section
Date: Mon, 12 Jul 2021 12:35:05 +0800
Message-Id: <20210712043508.11584-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside drm_clients_info, the rcu_read_lock is held to lock
pid_task()->comm. However, within this protected section, a call to
drm_is_current_master is made, which involves a mutex lock in a future
patch. However, this is illegal because the mutex lock might block
while in the RCU read-side critical section.

Since drm_is_current_master isn't protected by rcu_read_lock, we avoid
this by moving it out of the RCU critical section.

The following report came from intel-gfx ci's
igt@debugfs_test@read_all_entries testcase:

=============================
[ BUG: Invalid wait context ]
5.13.0-CI-Patchwork_20515+ #1 Tainted: G        W
-----------------------------
debugfs_test/1101 is trying to lock:
ffff888132d901a8 (&dev->master_mutex){+.+.}-{3:3}, at:
drm_is_current_master+0x1e/0x50
other info that might help us debug this:
context-{4:4}
3 locks held by debugfs_test/1101:
 #0: ffff88810fdffc90 (&p->lock){+.+.}-{3:3}, at:
 seq_read_iter+0x53/0x3b0
 #1: ffff888132d90240 (&dev->filelist_mutex){+.+.}-{3:3}, at:
 drm_clients_info+0x63/0x2a0
 #2: ffffffff82734220 (rcu_read_lock){....}-{1:2}, at:
 drm_clients_info+0x1b1/0x2a0
stack backtrace:
CPU: 8 PID: 1101 Comm: debugfs_test Tainted: G        W
5.13.0-CI-Patchwork_20515+ #1
Hardware name: Intel Corporation CometLake Client Platform/CometLake S
UDIMM (ERB/CRB), BIOS CMLSFWR1.R00.1263.D00.1906260926 06/26/2019
Call Trace:
 dump_stack+0x7f/0xad
 __lock_acquire.cold.78+0x2af/0x2ca
 lock_acquire+0xd3/0x300
 ? drm_is_current_master+0x1e/0x50
 ? __mutex_lock+0x76/0x970
 ? lockdep_hardirqs_on+0xbf/0x130
 __mutex_lock+0xab/0x970
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 drm_is_current_master+0x1e/0x50
 drm_clients_info+0x107/0x2a0
 seq_read_iter+0x178/0x3b0
 seq_read+0x104/0x150
 full_proxy_read+0x4e/0x80
 vfs_read+0xa5/0x1b0
 ksys_read+0x5a/0xd0
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3d7182001004..b0a826489488 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -91,6 +91,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	mutex_lock(&dev->filelist_mutex);
 	list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
 		struct task_struct *task;
+		bool is_current_master = drm_is_current_master(priv);
 
 		rcu_read_lock(); /* locks pid_task()->comm */
 		task = pid_task(priv->pid, PIDTYPE_PID);
@@ -99,7 +100,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(priv->pid),
 			   priv->minor->index,
-			   drm_is_current_master(priv) ? 'y' : 'n',
+			   is_current_master ? 'y' : 'n',
 			   priv->authenticated ? 'y' : 'n',
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic);
-- 
2.25.1

