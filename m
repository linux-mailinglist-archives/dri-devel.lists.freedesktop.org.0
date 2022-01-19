Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A19493B4D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 14:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793E610E2D9;
	Wed, 19 Jan 2022 13:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC70710E284
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 13:43:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f17so3299614edw.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/RyGnK1GOVV7mP2i6NUyL8dXTOp5mSU0ausD8jObPM=;
 b=pVinbeY9LHg95yEKahv8g20gbCh1BdN4nWVUNdHsg+Pi7vXMs7N2GB4+sLUsB4rsUg
 y/+M947KC1OlC3mGcqiIs8LRAHHVwr98JEqW6NRQw2F6Vy/1KJi07x/DFBPsb2QC+n/V
 V3FdSFUIqBfQNiY6aoimqXHksG39jj/AvaMF7Xt6hyubaqlKmNxlcVEvx3W2O6fT2q4X
 QT5eoUkU/xpo21Wveo2E3YK2AWcVVWrEdXeSDL62ggUKkKSB+tpmWyRDIbdpwptp8mhP
 NRrA0ef94fYDJRJgN5CHcL0SnLD/aNcyKCZFjdfLT2jkO146+Ty80EATuNp2RuHR81yF
 sQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/RyGnK1GOVV7mP2i6NUyL8dXTOp5mSU0ausD8jObPM=;
 b=W1gwubogcBnw+QFo9pu488kt4W1NE5BOkDA53Fj94uDr4RKKOL+1300SGYKDEru+eY
 AP/YdZ4N+1KU1GQ2SW4Qt2lLcHVe7Egqb1k4+9A8nQ1t7spH4wCgq9qJw2OhJYCekTiY
 nlUZEr0FdQzhtYvrX/Gq8uRTgtqUWRqlzmkBB6ql0PIVcXByuvxQbKj5FU/Iq7bVaj7Z
 KsVgW+hPJCkIJz4KpoxxM4D20IHcoKTJmKp+ixM0YmInfpTQl8w3WSKKebVqB/IGRUsr
 3L/q29LhrXo8ixRVprXFuZYtQjLJJ+rGfPe2ckSxzjSEmey8xX6wJA8hD6uaziRyfl5N
 H6Cw==
X-Gm-Message-State: AOAM533zFH0SyDw2tceJDRRc8/qn1SqV8MxJeH4yQeg21IqLovtiFZB+
 EwdJ3fnLPDP74zFE25qz8hQ=
X-Google-Smtp-Source: ABdhPJyRkjh8/psx0CRmEPXxOUN/B1pOuBL36LxzwXxNBKNTIJUgRDrIKqquQcrZosFF3bO3uS8Y/A==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr17658023wrp.295.1642599824450; 
 Wed, 19 Jan 2022 05:43:44 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g15sm19733583wrm.2.2022.01.19.05.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 05:43:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 4/4] dma-buf: warn about containers in dma_resv object
Date: Wed, 19 Jan 2022 14:43:39 +0100
Message-Id: <20220119134339.3102-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119134339.3102-1-christian.koenig@amd.com>
References: <20220119134339.3102-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6dd9a40b55d4..e8a0c1d51da2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
+	/* Drivers should not add containers here, instead add each fence
+	 * individually.
+	 */
+	WARN_ON(dma_fence_is_container(fence));
+
 	fobj = dma_resv_shared_list(obj);
 	count = fobj->shared_count;
 
-- 
2.25.1

