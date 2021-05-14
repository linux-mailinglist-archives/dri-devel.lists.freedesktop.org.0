Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332A3811FE
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF596E24E;
	Fri, 14 May 2021 20:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A676E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:49:14 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d16so560577pfn.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 13:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDysTlpzs+D22rykgOWjRnciGLgVayF2amTTq4U60PA=;
 b=b4msMTbszsV65KLkXVR2Ip8FPunIOUmVmzdYU4dOybg6ChAG3rSc4nCr/TBXX8asCE
 hWrb+fYltTLlhXwRYb9yJN6v4kXr6vyhbAKJ8sDHyutC3oRTYi9KZXz3fUrv8GyyFd/8
 ZCfFYl8SJnNvcOoZY9Z9amCmlqxwMS4GQZM4gdgdBU4Q4gLDwReXrbJE1myg8GdRY8Hs
 pgA/mKL6/3PMtMcdKkASeAWTkWYqiLvxloNRKudAQO/XpM4rWRrF5u2nZyVF6UFu/qDj
 w7KaJjCw2qvSfVU6k+RiS6elnjSyAkTWme9vSYyYaJdxp7NkKfQwBc4kvI+bJl5vxiXh
 zNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDysTlpzs+D22rykgOWjRnciGLgVayF2amTTq4U60PA=;
 b=CRRCAljqUKMEjfTjWeGqkEOwAiDP5+rw/wwoO8GRT99OIDbrTANz7y0PpEpi35KSZi
 kszEBqGVhX2tyuWThWczEqDL+gHc8KL8UcAbreeNzgFpVcOKMvq5kpZV5cLp6hUESbCD
 o190Dx4dcYy0Q3uRMdjw+Pm21ShIfOz/tEfZ6C86anfrE/xKF4RA3iYZt+ZUH4n7TfXd
 HR1tEADtCqXD+xvo1yV98G5YTRLUNdaXq1l5/DdgW9+EuWu+G8NJNJ6RAmw1LpL/xo7l
 crbnDWzg2mP3BUQbQJbyhm19m3w2Tk/Ccoz7PYeXqW7rv9bW5DA7Lr/TkkcgjJK5ulC3
 1pmw==
X-Gm-Message-State: AOAM532nQDh0/2GWEcoQkj7oAKxvMzp/Pu+kU8w00VaXZ56HFmOO5A7w
 IC03LKFrBNfRbwHpbJ5Jkeg=
X-Google-Smtp-Source: ABdhPJxfyQARvv4CDhE80rrI0z2ohmaMgktH5uGUvlwbvmIlzDHp2gtRz1bpW3u8YOElcZDZgvykgA==
X-Received: by 2002:a63:215a:: with SMTP id s26mr29612600pgm.134.1621025353792; 
 Fri, 14 May 2021 13:49:13 -0700 (PDT)
Received: from localhost.localdomain (097-094-025-122.res.spectrum.com.
 [97.94.25.122])
 by smtp.gmail.com with ESMTPSA id t21sm4641416pfe.82.2021.05.14.13.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 13:49:13 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm: drm_legacy_addbufs_pci(): fix return without cleanup
Date: Fri, 14 May 2021 13:48:36 -0700
Message-Id: <20210514204836.793539-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YJ6BJBgS0HnPgzsJ@mwanda>
References: <YJ6BJBgS0HnPgzsJ@mwanda>
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch 70556e24e18e: "drm: remove usage of drm_pci_alloc/free" leads
to the following static checker warning:

    drivers/gpu/drm/drm_bufs.c:1090 drm_legacy_addbufs_pci()
    warn: inconsistent returns '&dev->struct_mutex'.
      Locked on  : 988
      Unlocked on: 938,944,951,959,973,1005,1042,1060,1090

Fix the return without cleanup by removing the early return and taking
the original return path on allocation failure, including the intended
unlocks.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 94bc1f6049c9..ea3ca81be9dd 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -984,17 +984,18 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 
 	while (entry->buf_count < count) {
 		dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
-		if (!dmah)
-			return -ENOMEM;
-
-		dmah->size = total;
-		dmah->vaddr = dma_alloc_coherent(dev->dev,
-						 dmah->size,
-						 &dmah->busaddr,
-						 GFP_KERNEL);
-		if (!dmah->vaddr) {
-			kfree(dmah);
-
+		if (dmah) {
+			dmah->size = total;
+			dmah->vaddr = dma_alloc_coherent(dev->dev,
+							 dmah->size,
+							 &dmah->busaddr,
+							 GFP_KERNEL);
+			if (!dmah->vaddr) {
+				kfree(dmah);
+				dmah = NULL;
+			}
+		}
+		if (!dmah) {
 			/* Set count correctly so we free the proper amount. */
 			entry->buf_count = count;
 			entry->seg_count = count;
-- 
2.31.1

