Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224E21676C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3976E5CC;
	Tue,  7 Jul 2020 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAAB6E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 04:21:20 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id b92so17953809pjc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 21:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rA0pTLbz2yV97PI9QjZPbhkvN6NsH5N4XMsxnYByM4A=;
 b=IWF8TgvMnhf3Mo0IbR6wpRZ0EO9kZsj3WlanDiw11B+HbFIvFYtFcEEdAVEVQiXWj2
 8HeC7Vy5YdTkYECd9+QEYwxCEfT6EQnVlS0jU2aC7qxsCMGsgUWq/m1CPgrblJ3TgEv5
 10OcWjxk/Y2v84f/DboKdvT5V6oPQidCVCugnxiVLk4DL9/Dus2afZKkijANlEX8Cqb5
 2LhtwpzIbcF6NpQeqIeUJsob/TiXagfIb/53zsZ10AsRgc5F3ABDVixHNs/fVInJK5z/
 4eUxRTIl/CN2CsdDFhTB1OxNWpSlNoUFEybtTgzOJdhWrDEAadyBMjYj28bHJ6N9oYg8
 2KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rA0pTLbz2yV97PI9QjZPbhkvN6NsH5N4XMsxnYByM4A=;
 b=KxYgmVFCQcec9svf43K4khhLGm900g6E/k4RUvm5sz9+LACZnNaR0pOmh1POZk2crV
 bHwrhYRdiH11T4bxb5TwTkl/rJO+8IHpasaPa1FF6yGoq1QEbjgoeIwV3/37dYruGtxi
 qYtXxTvtQEz+Ijslyh+MznJQ83RGvyrYySJJzoUeTWbuyA6JQ8mtHrZxhw3uyZyGrPDn
 dIR0TMzmc1P09zIyycRqPPd/csMnNAvMoi+rUeBBjcsuuhjA3/LZCuuWlyGuZmVBFkSj
 wvG27eleKqMyYcAfNVR3QDi+WSDUA7BqglDJE4QGUvakWZTxHokNVfJDZPoyAXTmT5xY
 IGVw==
X-Gm-Message-State: AOAM533Lkq8+05aHTQPAsHkr33TWzsEdTC6VHBSfmGxCeFVSPAaB4/4I
 SopOmU1SAElgDUJBFrrVvR8=
X-Google-Smtp-Source: ABdhPJyim/FWOJbvYS2d4m67nzgaWNSmYruomWldGJwRdglFugdPB9NvHUMAbGnklIvc/44AsURmGA==
X-Received: by 2002:a17:90a:8082:: with SMTP id
 c2mr2290466pjn.204.1594095679795; 
 Mon, 06 Jul 2020 21:21:19 -0700 (PDT)
Received: from paxos.mtv.corp.google.com
 ([2620:15c:202:201:4a0f:cfff:fe5d:61cb])
 by smtp.gmail.com with ESMTPSA id 9sm21068484pfx.131.2020.07.06.21.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 21:21:19 -0700 (PDT)
From: Lepton Wu <ytht.net@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/vgem: Don't use get_page in fault handler.
Date: Mon,  6 Jul 2020 21:21:00 -0700
Message-Id: <20200707042100.2550260-1-ytht.net@gmail.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
Cc: christian.koenig@amd.com, Lepton Wu <ytht.net@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For pages which are allocated in ttm with transparent huge pages,
tail pages have zero as reference count. The current vgem code use
get_page on them and it will trigger BUG when release_pages get called
on those pages later.

Here I attach the minimal code to trigger this bug on a qemu VM which
enables virtio gpu (card1) and vgem (card0). BTW, since the upstream
virtio gpu has changed to use drm gem and moved away from ttm. So we
have to use an old kernel like 5.4 to reproduce it. But I guess
same thing could happen for a real GPU if the real GPU use similar code
path to allocate pages from ttm. I am not sure about two things: first, do we
need to fix this? will a real GPU hit this code path? Second, suppose this
need to be fixed, should this be fixed in ttm side or vgem side?  If we remove
"huge_flags &= ~__GFP_COMP" from ttm_get_pages, then get_page in vgem works
fine. But it's there for fix another bug:
https://bugs.freedesktop.org/show_bug.cgi?id=103138
It could also be "fixed" with this patch. But I am really not sure if this is
the way to go.

Here is the code to reproduce this bug:

unsigned int WIDTH = 1024;
unsigned int HEIGHT = 513;
unsigned int size = WIDTH * HEIGHT * 4;

int work(int vfd, int dfd, int handle) {
	int ret;
	struct drm_prime_handle hf = {.handle =  handle };
	ret = ioctl(dfd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &hf);
	fprintf(stderr, "fd is %d\n", hf.fd);
	hf.flags = DRM_CLOEXEC | DRM_RDWR;
	ret = ioctl(vfd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &hf);
	fprintf(stderr, "new handle is %d\n", hf.handle);
	struct drm_mode_map_dumb map = {.handle = hf.handle };
	ret = ioctl(vfd, DRM_IOCTL_MODE_MAP_DUMB, &map);
	fprintf(stderr, "need map at offset %lld\n", map.offset);
	unsigned char * ptr = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, vfd,
			  map.offset);
	memset(ptr, 2, size);
	munmap(ptr, size);
}

int main()
{
	int vfd = open("/dev/dri/card0", O_RDWR); // vgem
	int dfd = open("/dev/dri/card1", O_RDWR); // virtio gpu

	int ret;
        struct drm_mode_create_dumb ct = {};

	ct.height = HEIGHT;
	ct.width = WIDTH;
	ct.bpp = 32;
	ret = ioctl(dfd, DRM_IOCTL_MODE_CREATE_DUMB, &ct);
	work(vfd, dfd, ct.handle);
	fprintf(stderr, "done\n");
}

Signed-off-by: Lepton Wu <ytht.net@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index ec1a8ebb6f1b..be3d97e29804 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -87,9 +87,8 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 
 	mutex_lock(&obj->pages_lock);
 	if (obj->pages) {
-		get_page(obj->pages[page_offset]);
-		vmf->page = obj->pages[page_offset];
-		ret = 0;
+		ret = vmf_insert_pfn(vmf->vma, vmf->address,
+				     page_to_pfn(obj->pages[page_offset]));
 	}
 	mutex_unlock(&obj->pages_lock);
 	if (ret) {
@@ -263,7 +262,6 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
 
 static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
 {
-	unsigned long flags = vma->vm_flags;
 	int ret;
 
 	ret = drm_gem_mmap(filp, vma);
@@ -273,7 +271,6 @@ static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
 	/* Keep the WC mmaping set by drm_gem_mmap() but our pages
 	 * are ordinary and not special.
 	 */
-	vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
 	return 0;
 }
 
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
