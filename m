Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF094A976D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1710F296;
	Fri,  4 Feb 2022 10:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85B710F253;
 Fri,  4 Feb 2022 10:04:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id l5so12041578edv.3;
 Fri, 04 Feb 2022 02:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZqHQbmrfkSeH45/mViZpX0rM/1+Zya9JLAfRq+Wk+m8=;
 b=UTfcjAcYMTX22h1fkYsOiRByUelnx3X3bl0rl1ikR/aJO6QvD61verYKIzZSBf9eVH
 XMqkOwE5kUkib2ogQLmu9HTN+sqxX1DA8ZPCtSCYN5iqJXLrxhoFmdQ3aNSg/D68jcQv
 sk+hn2kTdnDJHyibjVdqeJ3b5uXROQUOHxgr/rVe55bsaZEUijn8ZKNW33JUzpRjrlCk
 yLpLk8j7YMqZmdFpktDAjs/2waxkOlWZ1MBtbrrkfOmigChFnQ0dpfADIXLTo/ahqMOs
 tb2ROlq3i1TYTKTd8NNDQIXQazEVb/bLBK/xrNsifZJPasNxltUuj2JFQ2/T18LSIdhV
 Xt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqHQbmrfkSeH45/mViZpX0rM/1+Zya9JLAfRq+Wk+m8=;
 b=1y1AK5EyGPyypAf/oeYZfi1JVMpvNo1ihisO3kkIEaWwqOhy7DVcfru8NiER5rpWnG
 7D6txb2uCgN7ZtnCvxwm1cPB7xLDG4XZ+VZrL+8dUm/C1Lj/MHrHNc8r1NiNKGtYZL+C
 3ukSt3a45q3mk68BxFPlOe2XtiSncSYMGG7GoCo5jzeoJQBdcsOggE0QsNIrQFEbgboC
 +IfFcjVLH2mdJvT1C75TlRgqosOxJvbBISs3qjb5G5QSWDh+mxZPSoTGC7/m2pDXnxgN
 63LwUySVzqDzMZXWu2uzTkUUfPlUMY2j87i1tjJyVdlffuUOhBN39nDnxzYNqTOsmH77
 7LOQ==
X-Gm-Message-State: AOAM5314I6gMMtvbVmgdZ3rUOAmVZ7OTtIHY7He1L6k6OujaWmiFA9We
 /i0rdIoPIYFhNgr0bkjsy1g=
X-Google-Smtp-Source: ABdhPJzUVDomn6G0+FigRIR9w/gc5i6WBR+Ya0Sw2HySaEeAG3c5vDogUicENinZmg6AI0M2qES/dQ==
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr2158175edd.203.1643969080332; 
 Fri, 04 Feb 2022 02:04:40 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 02:04:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] dma-buf: warn about containers in dma_resv object
Date: Fri,  4 Feb 2022 11:04:27 +0100
Message-Id: <20220204100429.2049-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ee31f15d633a..b51416405e86 100644
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

