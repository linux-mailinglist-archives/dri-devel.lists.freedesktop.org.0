Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E9173599
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1866F3EA;
	Fri, 28 Feb 2020 10:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84A6F3EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582886852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=00MGnjRDI5JRv7cqaP4rjNmxgXAO4VHyJnftjqTSbpw=;
 b=Y0ZYSY0ZzCDxMtcbq+1SgG/WvUfR4YY+G0icsGY9nfJ3KSLct2qjw5FMNcW8Eik4Kn9WVD
 XcRLMDt6CXi2ikJ1bSWsILaZh1q9ByykEBoLnph+wEDekx6944XEdAf/lKp00rZ7wMK/hl
 Ttk9nhHy2FzIylDJqqs4Ju1aH6J3Hjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-LwESe7lgNf-XGOqzFVLeYQ-1; Fri, 28 Feb 2020 05:47:28 -0500
X-MC-Unique: LwESe7lgNf-XGOqzFVLeYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC7A1100550E;
 Fri, 28 Feb 2020 10:47:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECB1B101D48A;
 Fri, 28 Feb 2020 10:47:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4BA2E17447; Fri, 28 Feb 2020 11:47:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem: drop pgprot_decrypted()
Date: Fri, 28 Feb 2020 11:47:23 +0100
Message-Id: <20200228104723.18757-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, thomas_os@shipmail.org,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Was added by commit 95cf9264d5f3 ("x86, drm, fbdev: Do not specify
encrypted memory for video mappings"), then it was kept through various
changes.

While vram actually needs decrypted mappings this is not correct for
shmem gem objects which live in main memory not io memory, so remove the
call.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index aad9324dcf4f..df31e5782eed 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -548,7 +548,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (!shmem->map_cached)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	vma->vm_ops = &drm_gem_shmem_vm_ops;
 
 	return 0;
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
