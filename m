Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D11B2870
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8096E97F;
	Tue, 21 Apr 2020 13:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79186E97F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P6M8RIkxrhewWamSGvitx0rzqPZ7fkCVr5z1emQQAj8=;
 b=NavDfz3wLeImWy+vxcT7wNqKTpMLI0/WTswOvJfkGUlK3x8nVEAH93h5uun/wmA2OkOPuF
 ZwU21PBTEd+4J0VzXygHTyXzfyqD6oj473Vlm4WRSuvWup/wxmnbXSFQLg0eOatMjT5iTT
 EDJ/Ba/Kod8firpQTRt2aBmWQhZhBf0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-jZOZ8onPPp-2ITn2it27iA-1; Tue, 21 Apr 2020 09:51:42 -0400
X-MC-Unique: jZOZ8onPPp-2ITn2it27iA-1
Received: by mail-wm1-f71.google.com with SMTP id h22so1484671wml.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IInilyB2ckeUfP1pJZsdQY8G2HWtqy1MvibEpjmv5kQ=;
 b=XcUV1vlAIpoZkwnHXQ5LzbW7/sXKX3v6tfcFZgvGABs6l+AXYE5JSisrkg6GMWMDI3
 uqp/irLXJn1KvZYz/cdGGw3ch40VwwMn63No6+J7KrT76sL9V2IY2ueAtTNCh1SanYhy
 vHxmC+3bcTAmy8q4zGIfrbfyiDEJsptot0FjQvGRu8a42tpFBuMhckerTfiB1U5p9Lam
 ESrcAPQOpYZfkthLM0Z+7W3W4CHSkVWXqEvoZwwTUXWM/oQ+KUvutI7lL/0Qook6vi7F
 3nHtPKiGbKBPKZd1PAb9L6gQjfTOYX2l1cA5FwB8xAQLMG0Y5f7mw/yd1UzeIZT4LtYp
 EkOg==
X-Gm-Message-State: AGi0PuZiZfcBKYlB8/PeyT7zjreyFjqh5+sSNuODCw2uenbHuZE96shh
 opfJNj6KMTRj0eKAOx8z7C5ztNn0eIYtmm22d6q0z7+71cq91XkskIUsYA4UmCVV9zWUSIchpqB
 77EmzzagYUYmZkMPyc17pAm8PhE/X
X-Received: by 2002:a1c:bd89:: with SMTP id n131mr4916129wmf.3.1587477100743; 
 Tue, 21 Apr 2020 06:51:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypL9ml34u2SXsT4cym73Fj9YcZ5gNZl/Vlb+iTik+1IYxflheOGQshudBA/kLdh/qIi+ct+15w==
X-Received: by 2002:a1c:bd89:: with SMTP id n131mr4916110wmf.3.1587477100572; 
 Tue, 21 Apr 2020 06:51:40 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id a187sm3565830wmh.40.2020.04.21.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:51:40 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 0/7] libfs: group and simplify linux fs code
Date: Tue, 21 Apr 2020 15:51:12 +0200
Message-Id: <20200421135119.30007-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
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

libfs.c has many functions that are useful to implement dentry and inode
operations, but not many at the filesystem level.  As a result, code to
create files and inodes has a lot of duplication, to the point that
tracefs has copied several hundred lines from debugfs.

The main two libfs.c functions for filesystems are simple_pin_fs and
simple_release_fs, which hide a somewhat complicated locking sequence
that is needed to serialize vfs_kern_mount and mntget.  In this series,
my aim is to add functions that create dentries and inodes of various
kinds (either anonymous inodes, or directory/file/symlink).  These
functions take the code that was duplicated across debugfs and tracefs
and move it to libfs.c.

In order to limit the number of arguments to the new functions, the
series first creates a data type that is passed to both
simple_pin_fs/simple_release_fs and the new creation functions.  The new
struct, introduced in patch 2, simply groups the "mount" and "count"
arguments to simple_pin_fs and simple_release_fs.

Patches 1-4 are preparations to introduce the new simple_fs struct and
new functions that are useful in the remainder of the series.  Patch 5
introduces the dentry and inode creation functions.  Patch 6-7 can then
adopt them in debugfs and tracefs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

v1->v2: rename simple_new_inode in new_inode_current_time,
more detailed explanations, put all common code in fs/libfs.c

Emanuele Giuseppe Esposito (7):
  apparmor: just use vfs_kern_mount to make .null
  libfs: wrap simple_pin_fs/simple_release_fs arguments in a struct
  libfs: introduce new_inode_current_time
  libfs: add alloc_anon_inode wrapper
  libfs: add file creation functions
  debugfs: switch to simplefs inode creation API
  tracefs: switch to simplefs inode creation API

 drivers/gpu/drm/drm_drv.c       |  11 +-
 drivers/misc/cxl/api.c          |  13 +-
 drivers/scsi/cxlflash/ocxl_hw.c |  14 +-
 fs/binfmt_misc.c                |   9 +-
 fs/configfs/mount.c             |  10 +-
 fs/debugfs/inode.c              | 158 +++--------------
 fs/libfs.c                      | 299 ++++++++++++++++++++++++++++++--
 fs/tracefs/inode.c              |  96 ++--------
 include/linux/fs.h              |  31 +++-
 security/apparmor/apparmorfs.c  |  38 ++--
 security/inode.c                |  11 +-
 11 files changed, 399 insertions(+), 291 deletions(-)

-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
