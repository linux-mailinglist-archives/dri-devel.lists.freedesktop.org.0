Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13746AFCE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 02:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC77573BEE;
	Tue,  7 Dec 2021 01:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4504B73BEE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 01:32:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o13so26020575wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 17:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ov6NmFfn2KOdbrAOSyyJhZZ3QFfk7XcAFTsXrWKZIFk=;
 b=hNXGWtgrTIt0EBrLBJry9rtHevgDCGyN5WKpj8eLt42+KR2R71Ttf8BfNdS1Ta4YXK
 3xFHWL24f+Pd6nkip0Dmxf2t4AzP9I8YeBHdhMQJn44OdPLy5rip9VVMQ7c/KK/JAJQz
 IEew6xJTnv9FN8f+iVRTwqMC8RoRnZWiS02UweW+aJjI5sXlEiKhOaZR16qZZPU+5LXZ
 16lztObWuPKNOYfep5z2dM5mE4KJggZXoXJVOClkbIbCiWTiSKpMQ4GSBI8BLoTIMHO0
 DTJvy7T+xS34hHqcEjSjlEV1fMe4/fB85z/pGU765iO9dqym+P1bOpzsUqZu+H/WN2Ng
 XLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ov6NmFfn2KOdbrAOSyyJhZZ3QFfk7XcAFTsXrWKZIFk=;
 b=Ov6+ii7X/ukXlwAn+z/3oB6is9zPPqlcbYDayWL6oxEaxdmuS9gP/3L96IAsa++GbG
 wZOPWd/S9tUGUgV5SoEMSxxrYpXw/AzZL2xdcx45YAjdYe0mUPt6cOn0l5oY58YL6FbP
 fmGnrpaAhZNjqNG1pGrHYyILJu/FT2k0yaR87idfK5qaX1Mn8Im1ef+IzyhghZbLs0WZ
 h3MTjadLr1+iZRlAsfR/PgdjPmwbHRFE7Z1ROCPQC6kMT1+2bw07CWcPdk2+MQ0BkGCc
 rlwXI0r6iDIeJ0UrwTKBB+r6eqUdj/3EPFhPpB4mf+9YHQ9hUoGs2jCApdHnu1sGX55d
 yEXw==
X-Gm-Message-State: AOAM533AHIxXOciBWi0CrKicNJM41dEqcyTcq5H4Q+v4eW/Ozw4Ikt8G
 gU/Qiw4tyBJW+4Vswvj9tYoIVMIeoaumMA==
X-Google-Smtp-Source: ABdhPJz1v2UhAoPvMz7BxrFH9hPP7mcUYPVRgsZ3GGZ39+iG4CaJSv/xlTKE429w9hs98RBfBpYGYA==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr46741229wrn.472.1638840758785; 
 Mon, 06 Dec 2021 17:32:38 -0800 (PST)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id g198sm1010018wme.23.2021.12.06.17.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 17:32:38 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: Deal with signalled fences in transfer.
Date: Tue,  7 Dec 2021 02:32:35 +0100
Message-Id: <20211207013235.5985-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: david1.zhou@amd.com, stable@vger.kernel.org, christian.koenig@amd.com,
 lionel.g.landwerlin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

See the comments in the code. Basically if the seqno is already
signalled then we get a NULL fence. If we then put the NULL fence
in a binary syncobj it counts as unsignalled, making that syncobj
pretty much useless for all expected uses.

Not 100% sure about the transfer to a timeline syncobj but I
believe it is needed there too, as AFAICT the add_point function
assumes the fence isn't NULL.

Fixes: ea569910cbab ("drm/syncobj: add transition iotcls between binary and timeline v2")
Cc: stable@vger.kernel.org
Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/drm_syncobj.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index fdd2ec87cdd1..eb28a40400d2 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -861,6 +861,19 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 				     &fence);
 	if (ret)
 		goto err;
+
+	/* If the requested seqno is already signaled drm_syncobj_find_fence may
+	 * return a NULL fence. To make sure the recipient gets signalled, use
+	 * a new fence instead.
+	 */
+	if (!fence) {
+		fence = dma_fence_allocate_private_stub();
+		if (!fence) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
+
 	chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
 	if (!chain) {
 		ret = -ENOMEM;
@@ -890,6 +903,19 @@ drm_syncobj_transfer_to_binary(struct drm_file *file_private,
 				     args->src_point, args->flags, &fence);
 	if (ret)
 		goto err;
+
+	/* If the requested seqno is already signaled drm_syncobj_find_fence may
+	 * return a NULL fence. To make sure the recipient gets signalled, use
+	 * a new fence instead.
+	 */
+	if (!fence) {
+		fence = dma_fence_allocate_private_stub();
+		if (!fence) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
+
 	drm_syncobj_replace_fence(binary_syncobj, fence);
 	dma_fence_put(fence);
 err:
-- 
2.34.1

