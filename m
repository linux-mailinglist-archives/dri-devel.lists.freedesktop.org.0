Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88130D4DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9C66E9E9;
	Wed,  3 Feb 2021 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2440F6E9C0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 00:31:37 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id 134so10432537ybd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 16:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=SOXagrKaf/SGUJ0It1u1ORMjiyQ7gfGWlZufV5zUWJE=;
 b=Du2OOc57uVZ5uhkj2egHtA2wa0SFb9m9+y9NUmdFQiDq6WF2NakwTwFWFMXWVb3EBL
 6yZFOR+lPWlQVyiwF9d8puYRUFCxEGC1+R29nJZU8FOnSiKOy4numK8O9O1pWyf7m1VF
 8chND7Te/w1IUSVTEvSM8juDTdD/Y9h/tjYjVRIOVVMIrQ95XmURDbfFMzRgUhQ3iaW/
 ykaovl20AETBww7DpJLvE4T3DJlaYWWtMgd5XgGU2SXCdiQbXAqgAOVTrRqQT/IObwbO
 wz8tYr1IEZgh7+XbFH1Jf8hI3AA5tNm6TDQlfW/GVzGjDcRPqQagtp6MdCrThoU9FjSr
 Qs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=SOXagrKaf/SGUJ0It1u1ORMjiyQ7gfGWlZufV5zUWJE=;
 b=GACZjwuFQGzC9aS+Gz2ODyn8fY7UC5YTp2lM7e+Swr4APdPdPGYeStuPULAN6T66VR
 udWhPd9tu2flb1k6T+ABabz+7XcSf8VEfOp3ZXwdN1w58z6CvrENYVA4DrJZ4OXnHyIy
 G5sab2R+PtWgYh2YFfHunB0O1RVCLYcIUnGSBWjyXz+MwNcgxHstqBoKKFAT9r4hfc3b
 QrloGBmGakUocTTua2sWpUyxaGLy/vsHrXk2JyTaks/3fnQ4DSJg2PwPeua4BekwZZR5
 ksAzEd3+4oCzNvCZjK/5FJ0FaPXTWDKLTfOcqhRPWikDasq12oqg/9iWYwWCtD4EHL6b
 NNnQ==
X-Gm-Message-State: AOAM53067CAdOzHuZ4Dy3MXxr3qzGMm3LunOQbnGC9yjthbUh1m1uFVJ
 dkEevhNSGdv4PKLUiPKTYwk5H3GlTjc=
X-Google-Smtp-Source: ABdhPJx1oe0/DgxGORm9UrMRCk0QL4fxRFPA1BcJxhU6LPzwDc8fSpOWryrH8a7W+r9pJcxrhxvwKlDBtU0=
X-Received: from surenb1.mtv.corp.google.com
 ([2620:15c:211:200:9194:cd6:1ec:3e2d])
 (user=surenb job=sendgmr) by 2002:a05:6902:1025:: with SMTP id
 x5mr707532ybt.21.1612312296088; Tue, 02 Feb 2021 16:31:36 -0800 (PST)
Date: Tue,  2 Feb 2021 16:31:33 -0800
Message-Id: <20210203003134.2422308-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of an
 error
From: Suren Baghdasaryan <surenb@google.com>
To: sumit.semwal@linaro.org
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, orjan.eide@arm.com, sspatil@google.com,
 linux-mm@kvack.org, kernel-team@android.com, jajones@nvidia.com,
 surenb@google.com, linux-kernel@vger.kernel.org, lmark@codeaurora.org,
 christian.koenig@amd.com, hch@infradead.org, minchan@kernel.org,
 dri-devel@lists.freedesktop.org, cgoldswo@codeaurora.org, hridya@google.com,
 akpm@linux-foundation.org, labbott@redhat.com, robin.murphy@arm.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
WARN_ON_ONCE and returning an error. This is to ensure users of the
vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
and get an indication of an error without panicing the kernel.
This will help identifying drivers that need to clear VM_PFNMAP before
using dmabuf system heap which is moving to use vm_insert_page.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index feff48e1465a..e503c9801cd9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
 		return -EINVAL;
 	if (!(vma->vm_flags & VM_MIXEDMAP)) {
 		BUG_ON(mmap_read_trylock(vma->vm_mm));
-		BUG_ON(vma->vm_flags & VM_PFNMAP);
+		if (WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP))
+			return -EINVAL;
 		vma->vm_flags |= VM_MIXEDMAP;
 	}
 	return insert_page(vma, addr, page, vma->vm_page_prot);
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
