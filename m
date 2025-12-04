Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF9CA38BB
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2D10E898;
	Thu,  4 Dec 2025 12:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O/NL346l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00A610E931
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 12:08:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2980d9b7df5so10232445ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764850111; x=1765454911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9KaknhTYA7we8L7tbWOYdBApVf4+OuKI4DN15w2EF0=;
 b=O/NL346llEEJ3l11qc4fYxr6+2NcOsGOIdNbF3aKc1o3o4ShBQJ8XUs9ixmx4whyy0
 7OnBz/NyH/yMiq7HDyhLVOM+jSRC1lRKLofPj5BVTvTBEeXfaJAB3ruzWr6B9FdDmM7Q
 WMUTUbeghO2LWPr72aUqKgE62V75CRHjW5bd6R8Eb2i3/MhiJOZAS1C7HsI5V6PsQIgh
 9B0tbi6ArA9SWNvs35wqBGdecFE59b66zfv2qj2jqc8sZJhKcIcD0mi8Q6JpM5OLDAB3
 PrUcxs7teJstegh6W5dy59gEESIYDf1AzuUb8XZsuh+YBold4oevvFzB4vZTedlrTyhB
 ElfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764850111; x=1765454911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b9KaknhTYA7we8L7tbWOYdBApVf4+OuKI4DN15w2EF0=;
 b=EJ3PbNC5H4gfUNgZ32ApGmHcqY+WmhERc1zHz0yBP3WiWI3ge0NUicN6XQG+DzLm+X
 FSX6Dy8uRnI9UvB/QSYoh+BokQv+zxCCmn3src4afD90GfY2lKKW9NwgDQBXwkUhnt6Y
 UVM39JBb8+HHbvcjuHUnzOJiuBMHyhpcvK3bRkt4g5JKZ3UyTtLfQHntpnvH6wYScJcY
 WRuyYrGOYQkan/Ju1rkGjMldvrcxc+e0Rdk/QYx2/bUzpS4nc0TUkwnNFUQPnK7bMG6n
 HV4HXNJtvP8IkosRy0Sxj+U8qBP8q77wagKdmECCvaQOjJBLorSbrXkRAmKwUfZh2+Cu
 MLHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7X7RJzdOl99mjpET3+1qv47VL151c1kuIWatiNhDqIzsNpaICBOqD6LQKf39/zdp2alT+raq9Y3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeP2aGAlEMrYqhtX88LW6R5G2BfYfsTKOXjhj7ZO//09voB4ms
 tv2IQeymiXlUVt7xJXrxHhl4rGzXE0n0HcPuSxKE2HR+8gXyPC6chPEE
X-Gm-Gg: ASbGnctAf0wMcFHm3/kLtHrbcoAo1Grc+8s+sR9tdck0SUuC1yY9ACwKKwS2QE2IAfl
 +wbo26g6Tr6ZlE1acWDL+F6gRT4j11+Zf/+3EI/KsCbBtF1oggAzQerheRSM8e+QJSLSxP0kH3E
 kA6uIkJsetLXCKSu9j7YgTcOkDSBEB3bhsYlMkihgTxRbGaDlXI1qbbnRbVVQ/OfdEenk24vZv0
 JxqIBy173taIsAK3wMepJAWIiIHnr+jE/HLK7GEQkQqM0zuDNbbHcnjaUiDnCeWeGgUoZImUhSm
 PlPsTZB2P+vBmAVmRMdD3WVAw4wCmjmut2Y6mzl2pmRI3iPGIbKauDel8JyWuvTaAeKj2RC7AC4
 pqcE5yi/+KTV5iv1nvREM6JjnCpHwnXGaRVAwZ8YiNqA6t37hqoUIQkinJFUtKskkh0aVOYkHTQ
 rt9Ae+6q0DAEFN
X-Google-Smtp-Source: AGHT+IGgnfLkR8h/ZDEH0zcyut45P3flGlGTcJqAlGQmerA42Y/lhM13y2pCi+VHgv7Q5gX7l8a4rQ==
X-Received: by 2002:a17:903:1ae8:b0:295:7b8c:661c with SMTP id
 d9443c01a7336-29d683131e9mr77831675ad.26.1764850111169; 
 Thu, 04 Dec 2025 04:08:31 -0800 (PST)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeaaba2dsm18586635ad.69.2025.12.04.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 04:08:30 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH v2] drm/nouveau : refactor deprecated strcpy
Date: Thu,  4 Dec 2025 17:38:22 +0530
Message-ID: <20251204120822.17502-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204114021.36719-1-madhurkumar004@gmail.com>
References: <20251204114021.36719-1-madhurkumar004@gmail.com>
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

strcpy() has been deprecated because it performs no bounds checking on the
destination buffer, which can lead to buffer overflows. Use the safer
strscpy() instead.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
changes in v2:
 - Remove the size parameter from strscpy

 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..4a193b7d6d9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -183,11 +183,11 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	fctx->context = drm->runl[chan->runlist].context_base + chan->chid;
 
 	if (chan == drm->cechan)
-		strcpy(fctx->name, "copy engine channel");
+		strscpy(fctx->name, "copy engine channel");
 	else if (chan == drm->channel)
-		strcpy(fctx->name, "generic kernel channel");
+		strscpy(fctx->name, "generic kernel channel");
 	else
-		strcpy(fctx->name, cli->name);
+		strscpy(fctx->name, cli->name);
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.52.0

