Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6F50B3E7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 11:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740D910FB07;
	Fri, 22 Apr 2022 09:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDF810FB00
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 09:20:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id be20so1349148edb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uWyIgVVe0I3r2fyHwEhxD4fmZRAFCjVlSB7T2J0KxS8=;
 b=ZNCEv6H9yY0dnsLF/BHHUXyws0ugubhOGvxgr+vKzPFbdvPIoLwSn/+RiEugfaIhXv
 vXsBaYer6kelwX44d/2PGjvVHj3HZhhsKOmS0r3sLZQr4BsdXOCApu+4pP8uh15AOYX3
 wrR3NPrQPtUrZr/7RNZDsZDG9niXJsruBKEE9MGEv9s4ToXVKLUGhrlYChIkKpSnBzf0
 t4EdQdAvdXd04R5BhdOEaplibTjN0h+QHPyuWRrof/wTLxyXUcoNuU6nIkmDJCSdktYQ
 xlRSISIEy2jF0Qgnuz63i6xgI8o17IDndnvkSlnMFBuzaaOD35/8g1KU+fzPum3Abgv9
 np0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uWyIgVVe0I3r2fyHwEhxD4fmZRAFCjVlSB7T2J0KxS8=;
 b=QB6YeBbg/dgHdx6sVAl5o4NkRPtaNLXKnpslu//cNGwWi8KTs4OjvavpsdLUlpQabT
 FkmpmpsEZXTV//nJBVHAKvKkIPYA2rd0qnpmvgZUVRbaDxc7lglqbnWOqC6kNFH4TRAH
 4+mfKEj4Ukqg9OFyo6S0tCLer0Usk4mg/ywbM+nIlK2qhLZ7kD896/ElVon1gGhi7y5Y
 BvxyvcmjHQ68W72cTU6vUB/Yk+l9E2t9xW04Qqo3Kgz2oGXOJTEYhbSjtjn7M2aCDS4U
 iNZWd+1YVP3mwwilBaXBBvNJg2gBT2un5W8emSoWQHibezywS3CTdYoCqDM3wrPegR+1
 ROOQ==
X-Gm-Message-State: AOAM532/PZ3WUNeb5nNnaAM50zsmYqUkINvAhNY7RPPSDctPfDdXUGNv
 K9Vjx31oHBviC+eJ8uqeNoE=
X-Google-Smtp-Source: ABdhPJzWiMA5EHMk4XqFaTizedNJYRbNEplc59WaOyURZGPpPbLVu/L+dwgmItGcMhsTGwa7CNgTug==
X-Received: by 2002:a05:6402:2789:b0:423:fe09:c252 with SMTP id
 b9-20020a056402278900b00423fe09c252mr3895678ede.11.1650619205016; 
 Fri, 22 Apr 2022 02:20:05 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906504f00b006efce2155e8sm560266ejk.173.2022.04.22.02.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 02:20:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: reserve fence slots on new resources
Date: Fri, 22 Apr 2022 11:20:02 +0200
Message-Id: <20220422092002.32427-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

When resources are allocated dynamically during an IOCTL we need to make sure
that a fence slot is reserved so that the resulting fence can be added in the
end.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot mandatory v4")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index a7d62a4eb47b..edce228f737c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -399,6 +399,10 @@ static int vmw_resource_do_validate(struct vmw_resource *res,
 		ret = func->create(res);
 		if (unlikely(ret != 0))
 			return ret;
+
+		ret = dma_resv_reserve_fences(res->backup->base.base.resv, 1);
+		if (unlikely(ret))
+			goto out_bind_failed;
 	}
 
 	if (func->bind &&
-- 
2.25.1

