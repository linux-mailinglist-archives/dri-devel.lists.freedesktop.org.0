Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD9A622784
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D37210E51E;
	Wed,  9 Nov 2022 09:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C340D10E12B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:50:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bj12so45100677ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDAM9OYZ6MLhEgMgixpdhoeMFz5qwIi9sbQ0Mdb6c/w=;
 b=kIFKkV2CPVIB5WWdPmk4P7335+YLMf/QdwPqC2kOgyCG+dczRftHMy/lOrfOY6dKV3
 n80gzIHOufPqgEwUVBKXKG40BplrMnEj/jz+6/0VgAKRT8iovn+HViMAmWPCxes9aJo1
 ppvVjRX6ItXGWT0q0jS0InjwKpY50qBlrH/m7uQlNt0KFjVfO2zVNBEgbjElHSQJg/nP
 2KZtBNpYi62hx08Kg5/cEDNXusiQ0U6Td9Q/xiW7Yw7IMWuDKjg23IQYWu77BRglATE+
 a6Vj57cn+INzw2/Fb1WDaWPaKUlcJM71Go1yW9u3KGENnFi6GxfdSsgzjJvyKG6MeO14
 6T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDAM9OYZ6MLhEgMgixpdhoeMFz5qwIi9sbQ0Mdb6c/w=;
 b=YBcTzmQcAwisJJyeERGzCDEEoB2gW8UqY9a3XUYNT0F1gkIxHyhtLpS1GdQL8yOGbp
 9f4BvWd2bfHmKdV5ejASZvIOxahBt7vZjFVTH0oj30BQq+pkg547eIGwc6Xs8NMo13+O
 g/ipBsBC6o05m8AqVvKXOT6EAeBoFZxKKFnxDiQWiZpctSdxkGD+J46fWRp7Xb5h415u
 uO76nBYG3WCELsr0lGIg8bwEkZxn2i65Y1DZG31lSob/Jswep+hvJsJDSG8z/GUTAfkd
 rGL1LTx7heqDvslwl6fkkHFoLJaNOsAY+r49nT2UoMpkKAuwdtO2T9AtT/ZfX6AAn24p
 9a6Q==
X-Gm-Message-State: ANoB5pnLjS84B8gjjkc8s98lXR8nOwciAwZOFkZS2UxbhcFPLwv9w0jV
 J0p7TxXcYJMn5RzSpytoOkc=
X-Google-Smtp-Source: AA0mqf7M+fK1btSP5oIt562DYqL159DKWAFqMCo0IZjgYzZACdzfLFudYyhQcaeEBAHkgWx7sxdDTA==
X-Received: by 2002:a17:907:3f28:b0:7ad:88f8:7644 with SMTP id
 hq40-20020a1709073f2800b007ad88f87644mr6566507ejc.738.1667987415171; 
 Wed, 09 Nov 2022 01:50:15 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709062ecc00b00780f24b797dsm5604543eji.108.2022.11.09.01.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:50:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Subject: [PATCH 3/5] drm/amdgpu: stop resubmittting jobs in amdgpu_pci_resume
Date: Wed,  9 Nov 2022 10:50:08 +0100
Message-Id: <20221109095010.141189-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109095010.141189-1-christian.koenig@amd.com>
References: <20221109095010.141189-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As far as I can see this is not really recoverable since a PCI reset
clears VRAM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3a51c4c61833..8564d4a8e3e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5747,8 +5747,6 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 		if (!ring || !ring->sched.thread)
 			continue;
 
-
-		drm_sched_resubmit_jobs(&ring->sched);
 		drm_sched_start(&ring->sched, true);
 	}
 
-- 
2.34.1

