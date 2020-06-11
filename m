Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B495E1F82A6
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CF16E3EC;
	Sat, 13 Jun 2020 10:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0116A6E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:40:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591882814; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: Subject: From: Cc: To: Sender;
 bh=ihrRcjhW9ULLbY+ZlVGkZ/PVZKfJ2usDc73eH+pAOvY=;
 b=OVTHcpJeDZ7iNX3wsMss7yeFd9KJp+/djShpgG7dgv3KalqVsMVvQek7ebVe6bCwaOPDKI49
 +iGuSu8Uauzg5CxodHeq3a5XmUe8ozaU/GxWtMnWchz2kSty/ZE3B4Mm+67gvshp9iIAMQz4
 Mf2Bg981196Oa5ln0zRFaTepXR4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ee23432356bcc26ab0c105c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 13:40:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 539BDC433C8; Thu, 11 Jun 2020 13:40:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [183.83.143.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: charante)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 823FBC433CA;
 Thu, 11 Jun 2020 13:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 823FBC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=charante@codeaurora.org
To: Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
From: Charan Teja Kalla <charante@codeaurora.org>
Subject: [PATCH] dmabuf: use spinlock to access dmabuf->name
Message-ID: <316a5cf9-ca71-6506-bf8b-e79ded9055b2@codeaurora.org>
Date: Thu, 11 Jun 2020 19:09:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, vinmenon@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There exists a sleep-while-atomic bug while accessing the dmabuf->name
under mutex in the dmabuffs_dname(). This is caused from the SELinux
permissions checks on a process where it tries to validate the inherited
files from fork() by traversing them through iterate_fd() (which
traverse files under spin_lock) and call
match_file(security/selinux/hooks.c) where the permission checks happen.
This audit information is logged using dump_common_audit_data() where it
calls d_path() to get the file path name. If the file check happen on
the dmabuf's fd, then it ends up in ->dmabuffs_dname() and use mutex to
access dmabuf->name. The flow will be like below:
flush_unauthorized_files()
  iterate_fd()
    spin_lock() --> Start of the atomic section.
      match_file()
        file_has_perm()
          avc_has_perm()
            avc_audit()
              slow_avc_audit()
	        common_lsm_audit()
		  dump_common_audit_data()
		    audit_log_d_path()
		      d_path()
                        dmabuffs_dname()
                          mutex_lock()--> Sleep while atomic.

Call trace captured (on 4.19 kernels) is below:
___might_sleep+0x204/0x208
__might_sleep+0x50/0x88
__mutex_lock_common+0x5c/0x1068
__mutex_lock_common+0x5c/0x1068
mutex_lock_nested+0x40/0x50
dmabuffs_dname+0xa0/0x170
d_path+0x84/0x290
audit_log_d_path+0x74/0x130
common_lsm_audit+0x334/0x6e8
slow_avc_audit+0xb8/0xf8
avc_has_perm+0x154/0x218
file_has_perm+0x70/0x180
match_file+0x60/0x78
iterate_fd+0x128/0x168
selinux_bprm_committing_creds+0x178/0x248
security_bprm_committing_creds+0x30/0x48
install_exec_creds+0x1c/0x68
load_elf_binary+0x3a4/0x14e0
search_binary_handler+0xb0/0x1e0

So, use spinlock to access dmabuf->name to avoid sleep-while-atomic.

Cc: <stable@vger.kernel.org> [5.3+]
Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
---
 drivers/dma-buf/dma-buf.c | 13 +++++++------
 include/linux/dma-buf.h   |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 01ce125..2e0456c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -45,10 +45,10 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 	size_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
-	dma_resv_lock(dmabuf->resv, NULL);
+	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
-	dma_resv_unlock(dmabuf->resv);
+	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
 			     dentry->d_name.name, ret > 0 ? name : "");
@@ -335,7 +335,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	dma_resv_lock(dmabuf->resv, NULL);
+	spin_lock(&dmabuf->name_lock);
 	if (!list_empty(&dmabuf->attachments)) {
 		ret = -EBUSY;
 		kfree(name);
@@ -345,7 +345,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	dmabuf->name = name;
 
 out_unlock:
-	dma_resv_unlock(dmabuf->resv);
+	spin_unlock(&dmabuf->name_lock);
 	return ret;
 }
 
@@ -405,10 +405,10 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	/* Don't count the temporary reference taken inside procfs seq_show */
 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
-	dma_resv_lock(dmabuf->resv, NULL);
+	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
 		seq_printf(m, "name:\t%s\n", dmabuf->name);
-	dma_resv_unlock(dmabuf->resv);
+	spin_unlock(&dmabuf->name_lock);
 }
 
 static const struct file_operations dma_buf_fops = {
@@ -546,6 +546,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	dmabuf->size = exp_info->size;
 	dmabuf->exp_name = exp_info->exp_name;
 	dmabuf->owner = exp_info->owner;
+	spin_lock_init(&dmabuf->name_lock);
 	init_waitqueue_head(&dmabuf->poll);
 	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
 	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index ab0c156..93108fd 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -311,6 +311,7 @@ struct dma_buf {
 	void *vmap_ptr;
 	const char *exp_name;
 	const char *name;
+	spinlock_t name_lock;
 	struct module *owner;
 	struct list_head list_node;
 	void *priv;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
