Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE01A7B0A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00456E0D6;
	Tue, 14 Apr 2020 12:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880DC6E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/11mAo8TGof9fElMW//bJCzL1+izMSi4fkBrEjCedo=;
 b=ALw5Ft5dgyyrPraXzC1Neg344EB8b2niHePQgfXnMXUflTbuedjCJ+RpSuNV1rRUS2TqKw
 A9i1AZVFFbJpPodGITQa8bF488DADOManm+Y296MzaYEqMbJWi5jsFIaHSn2uLpezeX2Bb
 hkwtl+ZaxQKxn2k9Qd/3A2JrI282r3s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-3TcPw2tPN7GiGaMJZ65UPQ-1; Tue, 14 Apr 2020 08:43:38 -0400
X-MC-Unique: 3TcPw2tPN7GiGaMJZ65UPQ-1
Received: by mail-wm1-f69.google.com with SMTP id f128so2557559wmf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrMq7u1iV/F4rZQEqvhQ++V9yKrw5g/LWhjcaMYuCWg=;
 b=PA6OcAm+Yx2Vh9oRKY4ItMxfy5IPx355DXmps/l/MPDTWkLyJxLeRxZGen5A1FvTCI
 GuayxzUH/rlmrx7j4KY3Azb2rh0I/t3xuSq18tICYSY/aAggqqqwxlulFgdQjLNl+AoP
 dBOOfz0dlvBI4J/PIqP8sM6p6ETcgaZ2AWCMGBzEdHnUYQRD3hEZY4pERQm6+PdarhyG
 M/rnOl7P7uDNiOqNgAUaH6BkcwWxIIxEkEcV0+PTXKwjGHF+Om40UkQD00MikNeJCjLi
 RvUeQOhtUCfneeu0XnAkWdbsJwHANR2sBIW35tnioDt3tSa3U6mJ/pc+XY2qQyvQOeCV
 +KcQ==
X-Gm-Message-State: AGi0PuarwiO1jaf7dIBtU+cPQw2ASnMXw3rteLq1wDjXRdycDHyLjdIN
 HFi1yYPpq+EG59OIl/ufvO2cJDxNCy4uGP70B0WSzI75yG/eM9N3JRzvTrAMmUdVFKX7K57dxAw
 /EiSxvo/LwfsmxHZbIHLuzEXh+DEa
X-Received: by 2002:adf:f34f:: with SMTP id e15mr18691201wrp.275.1586868217663; 
 Tue, 14 Apr 2020 05:43:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKieMHQMEHB64fOusIKVI0klz9UQdQ5a1y3lFWKhJD37VUle4YhX0YmwupcDiJWC0mdvqWDbw==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr18691124wrp.275.1586868217421; 
 Tue, 14 Apr 2020 05:43:37 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:36 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 1/8] apparmor: just use vfs_kern_mount to make .null
Date: Tue, 14 Apr 2020 14:42:55 +0200
Message-Id: <20200414124304.4470-2-eesposit@redhat.com>
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

aa_mk_null_file is using simple_pin_fs/simple_release_fs with local
variables as arguments, for what would amount to a simple
vfs_kern_mount/mntput pair if everything was inlined.  Just use
the normal filesystem API since the reference counting is not needed
here.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 security/apparmor/apparmorfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 280741fc0f5f..828bb1eb77ea 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -2525,14 +2525,14 @@ struct path aa_null;
 
 static int aa_mk_null_file(struct dentry *parent)
 {
-	struct vfsmount *mount = NULL;
+	struct file_system_type *type = parent->d_sb->s_type;
+	struct vfsmount *mount;
 	struct dentry *dentry;
 	struct inode *inode;
-	int count = 0;
-	int error = simple_pin_fs(parent->d_sb->s_type, &mount, &count);
 
-	if (error)
-		return error;
+	mount = vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
+	if (IS_ERR(mount))
+		return PTR_ERR(mount);
 
 	inode_lock(d_inode(parent));
 	dentry = lookup_one_len(NULL_FILE_NAME, parent, strlen(NULL_FILE_NAME));
@@ -2561,7 +2561,7 @@ static int aa_mk_null_file(struct dentry *parent)
 	dput(dentry);
 out:
 	inode_unlock(d_inode(parent));
-	simple_release_fs(&mount, &count);
+	mntput(mount);
 	return error;
 }
 
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
