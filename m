Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24497DE8EC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CA510E7E4;
	Wed,  1 Nov 2023 23:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78C10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToQKAQ1y1PRH/3OVIpCvIaQCyxCqcVrO+cdPlLKjGls=;
 b=gbYWOWKb68qI0A4HNr0EY/5/03Wz9jOUCGI3JUvm3Z4ZeD+rmDakZV3BQWkgY6AFYt0Aw5
 5319P6isVB7q3CSqX51xBsmGzC+2c74cA2Azy85SRCqD0EPQG7ZJy3BzK/f5SkE2SNnyJg
 vfP/eMIIQu3kMrFHNpUQFr67MwUPBFM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-K8htCTh9PdS3IpQnetAkLw-1; Wed, 01 Nov 2023 19:31:34 -0400
X-MC-Unique: K8htCTh9PdS3IpQnetAkLw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-53dfe3af1b9so190225a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881494; x=1699486294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ToQKAQ1y1PRH/3OVIpCvIaQCyxCqcVrO+cdPlLKjGls=;
 b=Ac5DtXOPoPyPXZCmgFeY3/PgtDOWoG7LYuakXVmiRX8ET8akb3BRm2VyDliH8I4ely
 ycDrB/QH6tVjCIaEeZJjIz5a+F/iWFevaCfkDcmwYggtHmFmADfcDu60th9yNopHKraB
 Vq0jqszRHRBGfoNgq2FfQZZCr96q60Rh0dOm3LMJhPXLdDnQDsEvPZbKIWCBurduGqpx
 rn5bWnzXXwCsdmmBdJ/csTwGB/WbpmEwTd0jiBP3xQXANoPnRLe8PQpLa1tj6r+O8CWA
 3+5zXDgIKYXG2AOLYhaLbbHFcuKBPRaK9f+YiGQsHzNrbsZurM/+LMbUIihyxOgdjrU8
 ao2Q==
X-Gm-Message-State: AOJu0Yy1Mp5wQMiE/0j7kaGM9V93q87LgzcdWLnzwifKk34KDh5ahqQn
 vFQqSxFpqv5SJvgpg4Yw48ttk82V8qOm6op/yy4M39NPc3XYmmTz8v+32Eht+vox+Ct9vJAOOlr
 V6TXT58xgVzr8kKxnyOjF9j1l6yWh
X-Received: by 2002:a17:907:2d88:b0:9bf:60f9:9b7f with SMTP id
 gt8-20020a1709072d8800b009bf60f99b7fmr3588034ejc.4.1698881493766; 
 Wed, 01 Nov 2023 16:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8VXTjVmx2ScEY9zyfvtwm9s6xZPaZj87Oi885o90gLsjCTQH8aVAE6ZRQgz+nv+ASvdFvfQ==
X-Received: by 2002:a17:907:2d88:b0:9bf:60f9:9b7f with SMTP id
 gt8-20020a1709072d8800b009bf60f99b7fmr3588018ejc.4.1698881493503; 
 Wed, 01 Nov 2023 16:31:33 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a1709063a0a00b009ad778a68c5sm465904eje.60.2023.11.01.16.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 04/12] drm/nouveau: make use of
 drm_gpuvm_range_valid()
Date: Thu,  2 Nov 2023 00:30:56 +0100
Message-ID: <20231101233113.8059-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_gpuvm_range_valid() in order to validate userspace requests.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 17 +----------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  3 ---
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aaf5d28bd587..641a911528db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -929,25 +929,13 @@ nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
 static int
 nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
 {
-	u64 end = addr + range;
-	u64 kernel_managed_end = uvmm->kernel_managed_addr +
-				 uvmm->kernel_managed_size;
-
 	if (addr & ~PAGE_MASK)
 		return -EINVAL;
 
 	if (range & ~PAGE_MASK)
 		return -EINVAL;
 
-	if (end <= addr)
-		return -EINVAL;
-
-	if (addr < NOUVEAU_VA_SPACE_START ||
-	    end > NOUVEAU_VA_SPACE_END)
-		return -EINVAL;
-
-	if (addr < kernel_managed_end &&
-	    end > uvmm->kernel_managed_addr)
+	if (!drm_gpuvm_range_valid(&uvmm->base, addr, range))
 		return -EINVAL;
 
 	return 0;
@@ -1834,9 +1822,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	uvmm->kernel_managed_addr = kernel_managed_addr;
-	uvmm->kernel_managed_size = kernel_managed_size;
-
 	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index a308c59760a5..06a0c36de392 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -14,9 +14,6 @@ struct nouveau_uvmm {
 	struct mutex mutex;
 	struct dma_resv resv;
 
-	u64 kernel_managed_addr;
-	u64 kernel_managed_size;
-
 	bool disabled;
 };
 
-- 
2.41.0

