Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784DA13DB36
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 14:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEE86ECF8;
	Thu, 16 Jan 2020 13:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C896ECF8;
 Thu, 16 Jan 2020 13:12:50 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x184so10212394pfb.3;
 Thu, 16 Jan 2020 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Si4Zq9w66PO1usnc9EmHvCYW3Nb7Vl/0SFRUNNmEaOg=;
 b=b14qUdghVjE3MMqd5NiT+dAHrac4bP1apD5hCkkOzQviwUOsXYTv5vb32KP19EJAPI
 2g8VWIjM4mN0Nnuo3EbrtS2uMtsCauJlddIerMPZ3seIjyquU0UC2Ua8ZdH2wI+G2z4Q
 SZ93RZvBDVLc4vewfA9EA0Ulv8mHp5lOMyo2jothhzNwTlOXlxiFhYza12YQ/h+3RfVx
 npvO38kZwi+d2/gQU8BYF9+CrJzMjd/U/0jdJTRhXLcWuqLlVtOPH4YCS99xTbjT/Mv6
 L8Irz0zzLSqxcmm8YlroyWql+gDjWXJ/mMgCjqciOl1eCjSrrlChvXP6Apck3kTcYO6Y
 jtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Si4Zq9w66PO1usnc9EmHvCYW3Nb7Vl/0SFRUNNmEaOg=;
 b=FQm5CcY49408t0Cj+kDOIZul00sjpf2IWXcD7lze/aCF/W2ImD1GA0FDuhZz0Dy/UI
 enxKEfCYW2bJCdJ+pr/vsP5TZZxvKCZ7EiKfIRdrFBsqZzIyvHom7p2XFlErXfzsyZbg
 ddox/BhacF9HyGcp+ghlQzTlHFl1MLkpITdmjA4gSLLZb+5P83aPm0DtWKK8Mp9c30NG
 lHJjjVUOeZOPwiI/q+UDA3FLYCM6FGlJNrjjW6lIXJzoyC/AmSP8GhG50+xOIXILsGgG
 mUdLVg98O/JP4BeuPC8+KLZbi/fvKCt8iE3Wd7ojU1Hunp0TtGZNqNaU/jHzGdEpSKSY
 iFmQ==
X-Gm-Message-State: APjAAAU0jrhDF1ubt+K6rXOExUBvGeUN6IhSMGKlTlEFPQ/auvf1F4nV
 hvX+Z1R4TXKOUho05OR7OPymdgmp
X-Google-Smtp-Source: APXvYqwXzXpJFunuoon/ZQ8U848Xzv7f3mNHboMa08m4YurRMDE9JjnsJiVyQEqerM/In5k94Mk0Zw==
X-Received: by 2002:a63:3484:: with SMTP id b126mr38099261pga.17.1579180369569; 
 Thu, 16 Jan 2020 05:12:49 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id v9sm25945877pfi.37.2020.01.16.05.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:12:49 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/lima: add lima_vm_map_bo
Date: Thu, 16 Jan 2020 21:11:54 +0800
Message-Id: <20200116131157.13346-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
References: <20200116131157.13346-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For dynamically mapping added backup memory of lima_bo to vm.
This is a preparation for adding heap buffer support.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_vm.c | 40 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_vm.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
index 840e2350d872..d46f2a69ab42 100644
--- a/drivers/gpu/drm/lima/lima_vm.c
+++ b/drivers/gpu/drm/lima/lima_vm.c
@@ -277,3 +277,43 @@ void lima_vm_print(struct lima_vm *vm)
 		}
 	}
 }
+
+int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
+{
+	struct lima_bo_va *bo_va;
+	struct sg_dma_page_iter sg_iter;
+	int offset = 0, err;
+	u32 base;
+
+	mutex_lock(&bo->lock);
+
+	bo_va = lima_vm_bo_find(vm, bo);
+	if (!bo_va) {
+		err = -ENOENT;
+		goto err_out0;
+	}
+
+	mutex_lock(&vm->lock);
+
+	base = bo_va->node.start + (pageoff << PAGE_SHIFT);
+	for_each_sg_dma_page(bo->base.sgt->sgl, &sg_iter, bo->base.sgt->nents, pageoff) {
+		err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter), base + offset);
+		if (err)
+			goto err_out1;
+
+		offset += PAGE_SIZE;
+	}
+
+	mutex_unlock(&vm->lock);
+
+	mutex_unlock(&bo->lock);
+	return 0;
+
+err_out1:
+	if (offset)
+		lima_vm_unmap_range(vm, base, base + offset - 1);
+	mutex_unlock(&vm->lock);
+err_out0:
+	mutex_unlock(&bo->lock);
+	return err;
+}
diff --git a/drivers/gpu/drm/lima/lima_vm.h b/drivers/gpu/drm/lima/lima_vm.h
index e0bdedcf14dd..22aeec77d84d 100644
--- a/drivers/gpu/drm/lima/lima_vm.h
+++ b/drivers/gpu/drm/lima/lima_vm.h
@@ -58,5 +58,6 @@ static inline void lima_vm_put(struct lima_vm *vm)
 }
 
 void lima_vm_print(struct lima_vm *vm);
+int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff);
 
 #endif
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
