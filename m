Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846412E4BE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6346E02C;
	Thu,  2 Jan 2020 10:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1F36E02C;
 Thu,  2 Jan 2020 10:02:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b19so5096151wmj.4;
 Thu, 02 Jan 2020 02:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=De6Z7XlByT/3y43y8ANqlsh9lPr7hWe/7UFt2ZwYqp4=;
 b=YATk5J7gbPl8aSHbGfbKvNtScL1wLi/SmbrgwfdHCFO53alDDQe6bpj3xhOaiw54fP
 iWW9bxSoChvzWwHweh5nzSHbxJgsfCG0909tt9AnIoMXLWdAM2CGWF1ecM/aPmDuSqYM
 rl3DXWMbMvWGmE/FMRzDroXXn9hHtgb9+eJITdbEAxviCn/m6LZ3q2Ot1ic3yY7pVkRF
 6xoeoOVc7ZzSRiVrGPy5GpRVGdEYiRVxJzCd2eBa/HAn/EUmoTUHOGryhojEwDjlrL9R
 Uen6nPmMmoLFIX4rDo2Gchm1gaYURR3k71bqDsAb4lc+4CZ/R9S7LnW6HDFuvBznZ0tw
 jk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=De6Z7XlByT/3y43y8ANqlsh9lPr7hWe/7UFt2ZwYqp4=;
 b=frFIBvzVAjvVTFy/faEJCGGx1gBX7wnXtNlhAHLAPDa7SLNOruagSAR+/tXpnHl5X9
 E9lPFiS/83OVr+h3mVIPks2dyt424u7TftDGm7geh98rpnkIhUcgruKLrc3HtyN3PWni
 zSJCxyNRPGgLF8lnCoXUbWadKw5+xydvxvULXPIKuXwaMTCLEe29+qVUK+qlWjmqKAHq
 na5YsviGEKzvhImf9XUay5ipjVHKWkaLrjGzmd7dwzFsUrQeZDH0XboyhAxL8Xesy6S7
 IDyld2kGS48hn7Fycn9J+lsN6KDkLdNbz849E+LkL741X/Q4s5+rI0TpjgrxBMTr3gmC
 Xa0g==
X-Gm-Message-State: APjAAAWcYlA/C246C1vtMLK1OKSfaWpsH4TWyJ/3aE44AcG+JuzXnIft
 HOR9L6CnwUd2pTRA+47F0NA=
X-Google-Smtp-Source: APXvYqywYgY1OpijhABjU9VkAhd9hds5Pl2h/firY7w1mQDLa1s7CITtTjAt+znNZtG0BnLfCiA0pw==
X-Received: by 2002:a05:600c:2318:: with SMTP id
 24mr13403333wmo.48.1577959373515; 
 Thu, 02 Jan 2020 02:02:53 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id r6sm55418683wrq.92.2020.01.02.02.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:02:52 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/etnaviv: update hwdb selection logic
Date: Thu,  2 Jan 2020 11:02:19 +0100
Message-Id: <20200102100230.420009-6-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102100230.420009-1-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Take product id, customer id and eco id into account. If that
delivers no match try a search for model and revision.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index eb0f3eb87ced..d1744f1b44b1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -44,9 +44,26 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
 	struct etnaviv_chip_identity *ident = &gpu->identity;
 	int i;
 
+	/* accurate match */
 	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
 		if (etnaviv_chip_identities[i].model == ident->model &&
-		    etnaviv_chip_identities[i].revision == ident->revision) {
+		    etnaviv_chip_identities[i].revision == ident->revision &&
+		    etnaviv_chip_identities[i].product_id == ident->product_id &&
+		    etnaviv_chip_identities[i].customer_id == ident->customer_id &&
+		    etnaviv_chip_identities[i].eco_id == ident->eco_id) {
+			memcpy(ident, &etnaviv_chip_identities[i],
+			       sizeof(*ident));
+			return true;
+		}
+	}
+
+	/* match based only on model and revision */
+	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
+		if (etnaviv_chip_identities[i].model == ident->model &&
+		    etnaviv_chip_identities[i].revision == ident->revision &&
+		    etnaviv_chip_identities[i].product_id == ~0U &&
+		    etnaviv_chip_identities[i].customer_id == ~0U &&
+		    etnaviv_chip_identities[i].eco_id == ~0U) {
 			memcpy(ident, &etnaviv_chip_identities[i],
 			       sizeof(*ident));
 			return true;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
