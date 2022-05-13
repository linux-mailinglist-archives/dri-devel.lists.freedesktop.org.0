Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16130525EBB
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 11:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8700110E259;
	Fri, 13 May 2022 09:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1768110E259
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652434741; x=1683970741;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Ez+FQiFpOQTlhI+vyJS9Bue8ypwJicksZwlgEN+UBjg=;
 b=PHVMjXtE7ORS91Vrwn6oLah1vGO8ZAPY5PazCBTI8Jy8aLG4iRDdkjua
 qgGd++ocslOdZiiSzXyWx+NsbPnCaFO9J17V4XfnJCEZKabbnu49mt6MW
 BxKwNf6kzNACrwfCO28KVtez+LDX0sxOy6lNuguxfidT2QiP1v1djKxcU 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 13 May 2022 02:39:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:39:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 02:38:59 -0700
Received: from hu-charante-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 02:38:55 -0700
From: Charan Teja Kalla <quic_charante@quicinc.com>
To: <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
 <gregkh@linuxfoundation.org>, <hridya@google.com>, <daniel.vetter@ffwll.ch>,
 <tjmercier@google.com>
Subject: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Date: Fri, 13 May 2022 15:08:09 +0530
Message-ID: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linaro-mm-sig@lists.linaro.org, Charan
 Teja Kalla <quic_charante@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
alloc_anon_inode()) to get an inode number and uses the same as a
directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
used to collect the dmabuf stats and it is created through
dma_buf_stats_setup(). At current, failure to create this directory
entry can make the dma_buf_export() to fail.

Now, as the get_next_ino() can definitely give a repetitive inode no
causing the directory entry creation to fail with -EEXIST. This is a
problem on the systems where dmabuf stats functionality is enabled on
the production builds can make the dma_buf_export(), though the dmabuf
memory is allocated successfully, to fail just because it couldn't
create stats entry.

This issue we are able to see on the snapdragon system within 13 days
where there already exists a directory with inode no "122602" so
dma_buf_stats_setup() failed with -EEXIST as it is trying to create
the same directory entry.

To make the dentry name as unique, use the dmabuf fs specific inode
which is based on the simple atomic variable increment. There is tmpfs
subsystem too which relies on its own inode generation rather than
relying on the get_next_ino() for the same reason of avoiding the
duplicate inodes[1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=e809d5f0b5c912fe981dce738f3283b2010665f0

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
---
Changes in V3:
  -- Used the atomic64 variable to have dmabuf files its own inodes.
  -- Ensured no UAPI breakage as suggested by Christian.

Changes in V2:
  -- Used the atomic64_t variable to generate a unique_id to be appended to inode
     to have an unique directory with name <inode_number-unique_id> -- Suggested by christian
  -- Updated the ABI documentation -- Identified by Greg.
  -- Massaged the commit log.
  -- https://lore.kernel.org/all/1652191562-18700-1-git-send-email-quic_charante@quicinc.com/

Changes in V1:
  -- Used the inode->i_ctime->tv_secs as an id appended to inode to create the
     unique directory with name <inode_number-time_in_secs>.
  -- https://lore.kernel.org/all/1652178212-22383-1-git-send-email-quic_charante@quicinc.com/

 drivers/dma-buf/dma-buf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a6fc96e..0ad5039 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -407,6 +407,7 @@ static inline int is_dma_buf_file(struct file *file)
 
 static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
 {
+	static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
 	struct file *file;
 	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
 
@@ -416,6 +417,13 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
 	inode->i_size = dmabuf->size;
 	inode_set_bytes(inode, dmabuf->size);
 
+	/*
+	 * The ->i_ino acquired from get_next_ino() is not unique thus
+	 * not suitable for using it as dentry name by dmabuf stats.
+	 * Override ->i_ino with the unique and dmabuffs specific
+	 * value.
+	 */
+	inode->i_ino = atomic64_add_return(1, &dmabuf_inode);
 	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
 				 flags, &dma_buf_fops);
 	if (IS_ERR(file))
-- 
2.7.4

