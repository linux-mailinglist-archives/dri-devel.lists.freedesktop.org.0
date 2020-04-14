Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F341A7B0F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295D6E0E9;
	Tue, 14 Apr 2020 12:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD866E0E9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9wIrHVinFRSeVONZeGXFdqOI8q2utXHS+EEeF0TTJI=;
 b=BTdtUjAqy1FRBBPspP63M7cIavPpa6piwwPUl4PqEclulNV7OEtzZo3tXvqp8yzOiH+KIe
 sPedXn0uzGKNrMZeNh7bgw1qi3ACSnGLMx8NlmdW2VIyUcbZrdmOAdlRcErWqS9YrAA468
 qgh1fSvsFmRZFSnLk0J1QAOHa3ivA68=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-BBhclH6OPlenRmmYCQZHBQ-1; Tue, 14 Apr 2020 08:44:10 -0400
X-MC-Unique: BBhclH6OPlenRmmYCQZHBQ-1
Received: by mail-wm1-f71.google.com with SMTP id y1so4180080wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mAvbLYZ1WspWPQXapCuzllPQbpAxrl5aHgH6Qcvv5U=;
 b=AiZDufBDjl05MLn2pjosKr7bMVrr1g8UxpctubVV3Kn4IqgCpSXjW0To+A3R1BH8F1
 9jxHSBYS+vxtmyM0UpLYUo5G/e7O1IXemd6Uwv57SVS72iPRmY3Ym2c0lAGnPhO+USfS
 bhC3OpL23e00mSr4VHcr4mCAk4/bwplj5toDXXQDqddDAtPuLPCfMGBB4Xn27Mkefhi1
 UuKNRus0Ee1bb0W4vIk4gKTSbEr7KKKOVQM79myFdUVCK0kbIIdW4Jqd916EMFUfMHoz
 fi35dDk6FTbgKu+U76l/4UaDmbKTo27w3pz/AE428yxOtF1QrMCbfpThwhZRixHUXiWY
 trlw==
X-Gm-Message-State: AGi0PuZw1682z/CFfvSG6AOJF6p+rD77ElRmQzpcTRrD+0UwoghjL1KB
 Sh5A8oyOGWEqfj0MYhUXtOv6eKE6z8LwUIqbHWifcq0jrREZNNSTWH1CSKB6iz8ZlvuPCI+Zam7
 kG8AnyYBSVmxx1gCm3oHHKUMmUDpU
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr23619875wrp.227.1586868249731; 
 Tue, 14 Apr 2020 05:44:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmn+iVub//R53RRjXLyRt+ACg08A2ZCc/3baWUs4xE6lZVfbX64aNN39fLKTr4PRsrHS5+Eg==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr23619862wrp.227.1586868249542; 
 Tue, 14 Apr 2020 05:44:09 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:08 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 5/8] simplefs: add alloc_anon_inode wrapper
Date: Tue, 14 Apr 2020 14:42:59 +0200
Message-Id: <20200414124304.4470-6-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 linux-s390@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 oprofile-list@lists.sf.net, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 netdev@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Uma Krishnan <ukrishn@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Colin Cross <ccross@android.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start adding file creation wrappers, the simplest returns an anonymous
inode.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/drm_drv.c       | 2 +-
 drivers/misc/cxl/api.c          | 2 +-
 drivers/scsi/cxlflash/ocxl_hw.c | 2 +-
 fs/simplefs.c                   | 6 ++++++
 include/linux/simplefs.h        | 2 ++
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index b4b357725be2..4e4ea1bf312c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -539,7 +539,7 @@ static struct inode *drm_fs_inode_new(void)
 		return ERR_PTR(r);
 	}
 
-	inode = alloc_anon_inode(drm_fs.mount->mnt_sb);
+	inode = simple_alloc_anon_inode(&drm_fs);
 	if (IS_ERR(inode))
 		simple_release_fs(&drm_fs);
 
diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index 6c6566d8bc17..a3d2682eb3a7 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -73,7 +73,7 @@ static struct file *cxl_getfile(const char *name,
 		goto err_module;
 	}
 
-	inode = alloc_anon_inode(cxl_fs.mount->mnt_sb);
+	inode = simple_alloc_anon_inode(&cxl_fs);
 	if (IS_ERR(inode)) {
 		file = ERR_CAST(inode);
 		goto err_fs;
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index 23afde0c6c0e..770fdf186028 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -86,7 +86,7 @@ static struct file *ocxlflash_getfile(struct device *dev, const char *name,
 		goto err2;
 	}
 
-	inode = alloc_anon_inode(ocxlflash_fs.mount->mnt_sb);
+	inode = simple_alloc_anon_inode(&ocxlflash_fs);
 	if (IS_ERR(inode)) {
 		rc = PTR_ERR(inode);
 		dev_err(dev, "%s: alloc_anon_inode failed rc=%d\n",
diff --git a/fs/simplefs.c b/fs/simplefs.c
index 790d8beb9cc3..c59eb8d996be 100644
--- a/fs/simplefs.c
+++ b/fs/simplefs.c
@@ -36,3 +36,9 @@ void simple_release_fs(struct simple_fs *fs)
 	mntput(mnt);
 }
 EXPORT_SYMBOL(simple_release_fs);
+
+struct inode *simple_alloc_anon_inode(struct simple_fs *fs)
+{
+	return alloc_anon_inode(fs->mount->mnt_sb);
+}
+EXPORT_SYMBOL(simple_alloc_anon_inode);
diff --git a/include/linux/simplefs.h b/include/linux/simplefs.h
index 18010414a16f..c62ab526414e 100644
--- a/include/linux/simplefs.h
+++ b/include/linux/simplefs.h
@@ -12,4 +12,6 @@ struct simple_fs {
 extern int simple_pin_fs(struct simple_fs *, struct file_system_type *);
 extern void simple_release_fs(struct simple_fs *);
 
+extern struct inode *simple_alloc_anon_inode(struct simple_fs *fs);
+
 #endif
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
