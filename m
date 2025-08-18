Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8AB29AB9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1239510E3DB;
	Mon, 18 Aug 2025 07:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H2SOukLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2725810E3DB;
 Mon, 18 Aug 2025 07:21:00 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-76e2ea94c7dso4344655b3a.2; 
 Mon, 18 Aug 2025 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755501660; x=1756106460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1EueC6Fubxsq0K6avHKaMHl/1DnpCdRxvVIl9pCUSY=;
 b=H2SOukLoGqAzPDYyRhlvOQB9UTdbqGvzs8pngFQAkOag8wwkgCOsI7IdR/Lws/r93U
 fDcl5club43U9nNqrR7SU98qlAF6v3NAzeikPkllllsKhYUenW2RTOkhv7C5rpAgE5rI
 vxoMkcJf5FF+ojTcAyDwkpugUJQWhvch5t1qr1nZcRGDp0/qKuqZ9AEzW+wvW3IpRS3k
 b9qN/xiyOrZhQv8YM6ou8fM+yY+0GpfrMpYRSpcuf90JN1EexVs+wvXnfRomZeiT40HY
 Za9FME1IrXbZEBo3IaE1VaiYU4Th4xzlrs1i7IWAWfmLwAux06S0o33o8BjskrlpTDGM
 FK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755501660; x=1756106460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1EueC6Fubxsq0K6avHKaMHl/1DnpCdRxvVIl9pCUSY=;
 b=c9eKri3RN7es3mI/YCMVN7JE3YJLHhvoVjragd6J/ydM2T/2sqTaMASLA9saUM71yS
 ebX7hLGeMxas+sDW6oyrCsK0ER5abFGGQOp04qmde37TByDutQ3Lag1Z2WYOryET9c73
 ja6Vv9brcxhyJ7Hzm43PMGqWumHxroBjNbpp4URN4aoKBHPyz5ZN40AHr8eYOdBDprJV
 g5iJf0vj/myl0v2RONk4dvnECG3vtAsCp4SfJAZfnbPwcCMJZv21XAZaYwckV3xAANMQ
 0kDg4IMRR3cBmFmRKC+4CwXwV2/J0YP3s1pnstCTvXjupuwV05Olmg9/fPKacCIcPXPR
 fMGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRWWD0GbBOc8UoXM2z2xflei8Yh6r9M8MnfLCBrsfrxgVjXqS35b5/Yb8ww9FeGUyp+wr0Hasi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuezbIjz3Dti8npVj01Lzymw7Yz/4N4zDbPCuC4KvyShEbCfhX
 Cg6yDMTZa6ycQLokILWXsy/iKGEU7bPQJSUBOl82KZk0IMG9AT3j/wA4
X-Gm-Gg: ASbGncswKgO4JfKVRCC4rxHxdHF1f826dKNSjBCol90aK0SbbhuWEjdTuPeb7nEf5s6
 ibP0sTfYAaF3+dw61hF7ZF2jyCwwJ9BRdhrrQFrt8lMnkSuPKNWDwn5g9gv3fENdrHc/lN8Qji/
 yUC2LyCp31LwX0sxlI12Xhv2xth53ZSXkd9Z5nsV24srG6oeNZ+nhwg9h8vTK/R5c8AjwFGpGVl
 +yFK2SU7tV0z0sr4b0rOO2tW+lC4bvtRcC7J9dnEsRukpOlNe27J4Yh6kEc2JwCCP0RIOwNSWs2
 DkPlBmX4uani4j9eYwD9DLUvfNxs6pkFuIKVS7cLe+KkHNKhuxtqYLKJl+uLAMNh3wU6utocVYI
 ptjk8lH8N39G+a2UXjVWN520aXbyeX+pEPL255hiKpywHnOk=
X-Google-Smtp-Source: AGHT+IESVrvVh+TcBYRzF9y7BmsCm/EL29AU09TeVQWqktjO8x6nSozf5mISthkeTLSWkIFc4/4GAw==
X-Received: by 2002:a05:6a00:3c94:b0:76b:e868:eedd with SMTP id
 d2e1a72fcca58-76e4481df98mr17296908b3a.24.1755501659513; 
 Mon, 18 Aug 2025 00:20:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8899:4b76:ead:acf9:f900:1070])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e45268bc5sm6480439b3a.18.2025.08.18.00.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 00:20:59 -0700 (PDT)
From: darshanrathod475@gmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] drm/nouveau: avoid assignment in if condition
Date: Mon, 18 Aug 2025 12:50:47 +0530
Message-Id: <20250818072047.376046-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Darshan Rathod <darshanrathod475@gmail.com>

Move kzalloc assignment out of the if condition to follow
kernel coding style guidelines and improve readability.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
index fd5ee9f0af36..46273e6b14ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
@@ -262,6 +262,7 @@ nvkm_falcon_init(struct nvkm_engine *engine)
 	/* upload firmware bootloader (or the full code segments) */
 	if (falcon->core) {
 		u64 addr = nvkm_memory_addr(falcon->core);
+
 		if (device->card_type < NV_C0)
 			nvkm_wr32(device, base + 0x618, 0x04000000);
 		else
@@ -341,8 +342,10 @@ nvkm_falcon_new_(const struct nvkm_falcon_func *func, struct nvkm_device *device
 {
 	struct nvkm_falcon *falcon;
 
-	if (!(falcon = kzalloc(sizeof(*falcon), GFP_KERNEL)))
+	falcon = kzalloc(sizeof(*falcon), GFP_KERNEL);
+	if (!falcon)
 		return -ENOMEM;
+
 	falcon->func = func;
 	falcon->addr = addr;
 	falcon->code.data = func->code.data;
-- 
2.25.1

