Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B63772AEB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931A10E2C5;
	Mon,  7 Aug 2023 16:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9CB10E2C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSJyklWcOYLh1Y7SYk3LyH530BHSBws8fX+6+9YjAp4=;
 b=ec/ZqnoZGHOiijvlH0hBAudZ5q2bAGp8RMbNHebzyj0SgdPdyghAhxZ7Pow3RBzfwPJN3x
 YvOILrlKf+cve0WAC9+zvYgxm5c5tcYi2v6g+O6nycsSozA2xptjjtJBg2MRN6lnGJZBF7
 NFWaPJjc4ZJgwUlzcQoAkYruESZwuLQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-oS4t6aVONLCN-HJyo3OqxA-1; Mon, 07 Aug 2023 12:32:52 -0400
X-MC-Unique: oS4t6aVONLCN-HJyo3OqxA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe275023d4so4464406e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425971; x=1692030771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSJyklWcOYLh1Y7SYk3LyH530BHSBws8fX+6+9YjAp4=;
 b=iaxYjNKSMX3BYSvd0reFXNhtNW/CuE7wCzo7FQ+nCJvT0zQqZvH1qHW3DPcqT/evyh
 nZzAI+i7oDz8SrBdU0hB3qr2Jni8T8C/XwF/oTWkxkqmF480BU9mbTzWg3fJvs2+M9wp
 gW6Pt/w0J2c5sdUMwYBvvzbDUxqFd+uTIzyFYniPsWD6XArW3rKd30mPTpukH/J/bTyE
 GEP0by/qMUNTxL7CK31XmuCKtU7iL956gPUtf7l1AZ1+TnS3UMSoIBowLCAYw5SqVa6V
 xcgxZ/m1S6j5Qd5lnEMyH2qmxcivAc2qWPX+0IDDNjc+OymY3FuKE0nPLN7taSxyM+7j
 bAvA==
X-Gm-Message-State: AOJu0YyBGXffsi1IIO8JCxPwQGjjaiFNnAyUprPZAhh48VKqG43D8bFx
 RXpn7kplmWwB9L9oLMdFngBzlAXLaIh1AhHm7VV5/FjNxdDIS+AmIY/F62Mv/iCqtvqJLEHq7P3
 ReIn/H8fRa0V/OXONSiR4FajNqZLd
X-Received: by 2002:a05:6512:280c:b0:4fb:744e:17db with SMTP id
 cf12-20020a056512280c00b004fb744e17dbmr7711097lfb.1.1691425971022; 
 Mon, 07 Aug 2023 09:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFTmw8BlSLd66bLQQphUvYc14k91eYxq6U+Y6ebxxfanOvKoolnZuNuEXZTLdCuMfe0V95eA==
X-Received: by 2002:a05:6512:280c:b0:4fb:744e:17db with SMTP id
 cf12-20020a056512280c00b004fb744e17dbmr7711084lfb.1.1691425970741; 
 Mon, 07 Aug 2023 09:32:50 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b0051873c201a0sm5377862edr.26.2023.08.07.09.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Subject: [PATCH drm-misc-next 2/5] drm/nouveau: nvkm: vmm: silence warning
 from cast
Date: Mon,  7 Aug 2023 18:32:23 +0200
Message-ID: <20230807163238.2091-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cast the integer to a pointer-sized type first to keep the compiler
happy.

Fixes: 6b252cf42281 ("drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 38b7ced934b1..46cbd4cedb78 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -399,6 +399,8 @@ nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
 		.no_comp = true,
 	};
 	struct nvkm_memory *memory;
+	void *argv = (void *)(uintptr_t)args->argv;
+	int argc = args->argc;
 	u64 handle = args->memory;
 	u8 refd;
 	int ret;
@@ -418,8 +420,7 @@ nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
 		return PTR_ERR(memory);
 	}
 
-	ret = nvkm_memory_map(memory, args->offset, vmm, &vma,
-			      (void *)args->argv, args->argc);
+	ret = nvkm_memory_map(memory, args->offset, vmm, &vma, argv, argc);
 
 	nvkm_memory_unref(&vma.memory);
 	nvkm_memory_unref(&memory);
-- 
2.41.0

