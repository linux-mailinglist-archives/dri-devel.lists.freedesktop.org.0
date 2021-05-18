Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A771388220
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 23:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B796ECAF;
	Tue, 18 May 2021 21:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01FA6ECAF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 21:29:21 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id t21so5857695plo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LvqNGxCVW/9Rsmck9fE71rVRgniSpFmLmPVeh24a7uM=;
 b=MAbFBVCXmYfoPlB+Ev0iONU8THBkxNjrjpluDH5idcnGU4Eje9Ebew+SJadNV41AJ2
 FU5v2Jpqu7U3dmFAchTPVpfFOUuGW4J88NFIb5wKsO4HruaDWW+GRFMosBdL+LWxBVZP
 4BVkIIjoWvCmMVZLOFX+smGDGsy+1r0pVTRYDv46G/vwXDO8j9KYfOUCuPGkmw3kfQKT
 gG8NQy5fOd6nnErQf3NWgGTK3quIEKKcarg9PIRbeOjVkCNjwaEOxIzH7MVbV0cID1DF
 mY4xvvCmscD9EI0/OvZm1pyk4BGHAMkBcyZvTLM0cS7/eNvJdikT3pQ0OL4FQZ189V5m
 7iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LvqNGxCVW/9Rsmck9fE71rVRgniSpFmLmPVeh24a7uM=;
 b=Uc3zcxlIisUJhib42Wo60+XZKNC0Jo0DyjEAdrzDkiYEDT6tHEnglrM1rGpU62EPVi
 uEfWx1Bcl3/GvnP/5tfmUuRASvEdU+9VF+uZ8qd3gHKrbVhr1+2Az4ho+cJloWJ1qYdM
 XGoEb161KMMwthVJ7Ty77TxqvXkw2aXbagK76OdC+9fKqa4hOAgz2vFfAxa62TcRFNcG
 5pxnp3Ba1IUYPfTAP8KAXQHZWvhk5KOm6+DIvNNGfcRrsFaJSfTI7uoAP+HTgCrymwHg
 gsXSX8+al3/SQw7lFroIzcTMllV/lJzuDuaBCuFcu4PsKsNUcjzc8TCsPT+5GMqIFeQe
 uijQ==
X-Gm-Message-State: AOAM532uoez+9rR9tQ24Zvl5sth8SG9M1WcM/8IHQ+xcEpva9J8Qq97Z
 /W0YC3jJmXrzMZ0wxDzrheM=
X-Google-Smtp-Source: ABdhPJzmxx2l3sPDD/So5W7RjjYuu9yqTy7CkS5gstgO4SLQn6khxI4WNDLJtK7/dotHJxJrdvA6ng==
X-Received: by 2002:a17:90a:4285:: with SMTP id
 p5mr7374915pjg.138.1621373361460; 
 Tue, 18 May 2021 14:29:21 -0700 (PDT)
Received: from localhost.localdomain (097-094-025-122.res.spectrum.com.
 [97.94.25.122])
 by smtp.gmail.com with ESMTPSA id j3sm13090071pfe.98.2021.05.18.14.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:29:21 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: fix leaked dma handles after removing drm_pci_free
Date: Tue, 18 May 2021 14:28:59 -0700
Message-Id: <20210518212859.4148903-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removing drm_pci_alloc/free, some instances where drm_pci_free()
would have kfreed the dma handle were skipped.

Ensure these handles are freed properly.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 drivers/gpu/drm/drm_bufs.c         | 1 +
 drivers/gpu/drm/r128/ati_pcigart.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index ea3ca81be9dd..7eb3baed9a70 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -685,6 +685,7 @@ static void drm_cleanup_buf_error(struct drm_device *dev,
 						  dmah->size,
 						  dmah->vaddr,
 						  dmah->busaddr);
+				kfree(dmah);
 			}
 		}
 		kfree(entry->seglist);
diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
index fbb0cfd79758..04408f372f74 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.c
+++ b/drivers/gpu/drm/r128/ati_pcigart.c
@@ -71,6 +71,8 @@ static void drm_ati_free_pcigart_table(struct drm_device *dev,
 	drm_dma_handle_t *dmah = gart_info->table_handle;
 
 	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr, dmah->busaddr);
+	kfree(dmah);
+
 	gart_info->table_handle = NULL;
 }
 
-- 
2.31.1

