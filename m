Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21355BDE10
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9110E320;
	Tue, 20 Sep 2022 07:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772310E320
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663658669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g0uOi5qTyf/a7VXxNooee54i3U9fkVbBJzRMmloiIlw=;
 b=PtbGLyVCCPSSylLVcvvbhPAkvA1F3APC3DM+hvROFdJXiaHDXAKyfWuR5AGZP05VFoIAJx
 PlPauxGtfNWwV6auveglyxI87blm3Xp/X/z98mvxT8UpksCgnnvODSgYWLjp+lDGdo9YZB
 C05DVlwdAXdMZTHv/f0mKirUDlawgN4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-viyqUb-4MLeBLXweGj2wgw-1; Tue, 20 Sep 2022 03:24:28 -0400
X-MC-Unique: viyqUb-4MLeBLXweGj2wgw-1
Received: by mail-pf1-f197.google.com with SMTP id
 y17-20020a056a00181100b0053e8868496bso1211458pfa.21
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 00:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=g0uOi5qTyf/a7VXxNooee54i3U9fkVbBJzRMmloiIlw=;
 b=Df1PemvdWt6upbN+6/ToeQE8ULiSUP+umUY/xSMHVTCaQZIUwhkBAq8/Txcc+JMGt6
 vDDSNZVy9MoeY/R7YuhABaAM0Gh+R+RRhBUnKhaftMBWoJ8lr7KDrTrOkgtuP9ofjjKv
 Cu8fDMFLjglIlw2oRSvuOk5RPyuB12S1UkiGuKysek0+HC1iwZ63p/P6dVyrN/V6IRw5
 t7nn6m8cmkuNjbwlX+luX0pFqqQpSmK2floXdPd318gP16/AZX92347IUarUk08XnwoO
 XNuIJdpZ0085bxt/FZx578gEJZbRY/Pek+kchGNCpvHCFklG6fhmhMIh2NxLE1iDohoJ
 LutQ==
X-Gm-Message-State: ACrzQf1P/neoGTV5m3vnVuP2uEkTgckgkRRI0QreRYziKup28ZyFR/mv
 6zOt6M5mdSmWlRyZ641gNxgLUxVxB0gMFh0yfF3fmPsgcR/K35I2Xwiiy4IfadQCJRxH5fX+oEH
 7EMUwUxqnU4klw6AOdALFi4ZaBobS
X-Received: by 2002:a17:90b:4a85:b0:202:4f3f:1f65 with SMTP id
 lp5-20020a17090b4a8500b002024f3f1f65mr2381703pjb.241.1663658667121; 
 Tue, 20 Sep 2022 00:24:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM46f2cbuC7SwgzAF5mMZqdhxD22k2h84NaHeFKZh01JjTmriF5vDFbjDxwbzPGz432bmKmCFw==
X-Received: by 2002:a17:90b:4a85:b0:202:4f3f:1f65 with SMTP id
 lp5-20020a17090b4a8500b002024f3f1f65mr2381682pjb.241.1663658666811; 
 Tue, 20 Sep 2022 00:24:26 -0700 (PDT)
Received: from xps13.. ([240d:1a:c0d:9f00:94be:c13b:981e:47e6])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170903111000b001788ccecbf5sm687762plh.31.2022.09.20.00.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 00:24:26 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/gem: Avoid use-after-free on drm_gem_mmap_obj() failure
Date: Tue, 20 Sep 2022 16:24:08 +0900
Message-Id: <20220920072408.387105-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Shigeru Yoshida <syoshida@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+c512687fff9d22327436@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot reported use-after-free for drm_gem_object [1].  This causes
the call trace like below:

[   75.327400][ T5723] Call Trace:
[   75.327611][ T5723]  <TASK>
[   75.327803][ T5723]  drm_gem_object_handle_put_unlocked+0x11e/0x1a0
[   75.328209][ T5723]  drm_gem_object_release_handle+0x5d/0x70
[   75.328568][ T5723]  ? drm_gem_object_handle_put_unlocked+0x1a0/0x1a0
[   75.328965][ T5723]  idr_for_each+0x99/0x160
[   75.329253][ T5723]  drm_gem_release+0x20/0x30
[   75.329544][ T5723]  drm_file_free.part.0+0x269/0x310
[   75.329867][ T5723]  drm_close_helper.isra.0+0x88/0xa0
[   75.330305][ T5723]  drm_release+0x8e/0x1a0
[   75.330674][ T5723]  ? drm_release_noglobal+0xc0/0xc0
[   75.331138][ T5723]  __fput+0x10e/0x440
[   75.331503][ T5723]  task_work_run+0x73/0xd0
[   75.331895][ T5723]  do_exit+0x535/0x1200
[   75.332280][ T5723]  ? ktime_get_coarse_real_ts64+0x13b/0x170
[   75.332810][ T5723]  do_group_exit+0x51/0x100
[   75.333215][ T5723]  __x64_sys_exit_group+0x18/0x20
[   75.333654][ T5723]  do_syscall_64+0x37/0x90
[   75.334058][ T5723]  entry_SYSCALL_64_after_hwframe+0x63/0xcd

If drm_gem_mmap_obj() failed, it drops the reference count by calling
drm_gem_object_put().  However, drm_gem_mmap() drops the reference
count after calling drm_gem_mmap_obj() even if it failed, so it breaks
the balance of the reference count.

This patch fixes this issue by calling drm_gem_object_put() only if
drm_gem_mmap_obj() succeeds, and returns immediately if
drm_gem_mmap_obj() failed without calling drm_gem_object_put().

Link: https://syzkaller.appspot.com/bug?id=c42a72b0b3bcedd95e5f132a4ccd7cd550334160 [1]
Reported-by: syzbot+c512687fff9d22327436@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/gpu/drm/drm_gem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ad068865ba20..f345d38df50a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1115,10 +1115,12 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
 			       vma);
+	if (ret)
+		return ret;
 
 	drm_gem_object_put(obj);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_gem_mmap);
 
-- 
2.37.3

