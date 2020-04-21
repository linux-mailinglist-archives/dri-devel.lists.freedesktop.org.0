Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484D1B28A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAB16E989;
	Tue, 21 Apr 2020 13:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D970F6E988
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKUiLQ5ZuIL+bTIy/EMQv4vQmlAvPOSAZZePSFtw9GI=;
 b=MEoI1U4FWZaWi7JAP7sRYwBFyAC0oLu1lXtnX3asJautGTnWuF9OnRB6IHUI3lWi/9Z5QK
 YgsOcY+XGBYfqQwfa/L6Z1Qn+xJu5C6U3X7ZcMcN1KeOiWj5tWWCG7+z1CrBxfDLJX/9qA
 njdSpaKcKkLjQwKvGVuEegBz10BVdvo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-p-ZJiexhNDmfPpvK-kIr6Q-1; Tue, 21 Apr 2020 09:57:47 -0400
X-MC-Unique: p-ZJiexhNDmfPpvK-kIr6Q-1
Received: by mail-wr1-f70.google.com with SMTP id p16so7522856wro.16
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wRD9FPTWKMzxCyWJGhqpm27rg8NjVNjjKx55UL7gOU=;
 b=HE8HM11u+jBhYdk7ebooNzaOsBnn6ImLSnNOJ8ffCPzRq9qT+7rmLYI0oSZXBXuvWD
 ZrOcRHKRhVaSaahaBFjRt5Jf2vTwc2FlUmG57tHlXl61/Fv4gXj/99VgPgOcvPb+XeRC
 vddTAR4z1t77WchmRchqKkQJa7KAgRajgQwBhJ/nWkAGKStoitrk3SBbI5p9KrHhxmBr
 O9j4R1z0nNEa2so7rRyRwbjKn7B6jXDY5dfUvYMcy3TFw5QyHx8kzwH7sYaJFjK+Nu0J
 JGQzf8/T2wcrF4Vzg6caBdq/dS6gJJdYVx58Q6CKiDp5OxI/Tc8xQkTVk6513GLmEUzG
 d/Hw==
X-Gm-Message-State: AGi0PuYHhe6bGyw7SrBu9KeqhAYWuJ/HRKEDwbvq8TNU0lgBVhuOIZCI
 NCl/mdvgE9TpLaVz5BIqU/N/OJk/BLfakf68ga+M1PwmkGZE35dyv28pZOAJBRin59KWty3Z3OJ
 bAfi966DdbW0RGmcoCL8bTWKKAIDm
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr4993975wmj.130.1587477466574; 
 Tue, 21 Apr 2020 06:57:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypIdMbj9yLvuLA4LwwjCRX8ejEQ6n8RjZ/wI7HQOlXPSbSe/l8j+NErdfsIjBeaz5nCZl4whdg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr4993944wmj.130.1587477466378; 
 Tue, 21 Apr 2020 06:57:46 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id f23sm3562989wml.4.2020.04.21.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:57:45 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 3/7] libfs: introduce new_inode_current_time
Date: Tue, 21 Apr 2020 15:57:37 +0200
Message-Id: <20200421135741.30657-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421135119.30007-1-eesposit@redhat.com>
References: <20200421135119.30007-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is a common special case for new_inode to initialize the
time to the current time and the inode to get_next_ino().
Introduce a core function that does it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/libfs.c         | 20 ++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 54e07ae986ca..3fa0cd27ab06 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -594,6 +594,26 @@ int simple_write_end(struct file *file, struct address_space *mapping,
 }
 EXPORT_SYMBOL(simple_write_end);
 
+/**
+ * new_inode_current_time - create new inode by initializing the
+ * time to the current time and the inode to get_next_ino()
+ * @sb: pointer to super block of the file system
+ *
+ * Returns an inode pointer on success, NULL on failure.
+ */
+struct inode *new_inode_current_time(struct super_block *sb)
+{
+	struct inode *inode = new_inode(sb);
+
+	if (inode) {
+		inode->i_ino = get_next_ino();
+		inode->i_atime = inode->i_mtime =
+			inode->i_ctime = current_time(inode);
+	}
+	return inode;
+}
+EXPORT_SYMBOL(new_inode_current_time);
+
 /*
  * the inodes created here are not hashed. If you use iunique to generate
  * unique inode values later for this filesystem, then you must take care
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a3691c132b3a..de2577df30ae 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3088,6 +3088,7 @@ extern void clear_inode(struct inode *);
 extern void __destroy_inode(struct inode *);
 extern struct inode *new_inode_pseudo(struct super_block *sb);
 extern struct inode *new_inode(struct super_block *sb);
+extern struct inode *new_inode_current_time(struct super_block *sb);
 extern void free_inode_nonrcu(struct inode *inode);
 extern int should_remove_suid(struct dentry *);
 extern int file_remove_privs(struct file *);
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
