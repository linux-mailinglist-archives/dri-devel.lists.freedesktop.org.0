Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1C4979A9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 08:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5C10E716;
	Mon, 24 Jan 2022 07:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9E610E170
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:40:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so27102023wme.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 23:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
 b=JHN6/biYR6rsgSz3WyO//6PDm/q/8LQIvmA3YasHnIKZrFL3TjAcTmyMNuKT5Bi3/G
 7954P/l9i9zNlzCuS2wFA9Dh2+v9wc8Lf6uHKRMuF+9tJEpWb26Bdo14y8e9A4PehBn7
 WDJDCE5RvXOG+3OV4tlFEnGS7uFDdB68WtNYP4K6rDa/lS8RGlQ2OKmo9u5qMfY4kshp
 O3XPkzBTi5NXPmYW5gMRLVqAtc5sNbWAjJFq11XQURfuCZ3WvxoZ+OVlhtw086htTd+I
 MDyjnCvI+m7FyB0H0kudzDdLh+JMxhAypoklvualZoGpO1pJgIJXyB0S7jioNJhUZZtr
 eZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
 b=Rr9PhaLd9JenPOmlzsJrhy9awgNAyDVBwI9+1Bo99wwIDFwvLTlkjRNSRWduVHsvgj
 hWk17eCGfkxizNZD38YStOkSV3+NGviEAEPoJB4cujTe0gg4ZO65Xj4/kUU6EocdqqRO
 D5CEERVvRFJdcKhKy46IyDixbNEorQnJL/UfSrJiiDbvWdZtTe9+2TYtWKhIE0UgFMeF
 AezRXJxKeKKRcY8zRaQtcbzf+wkq2yny8j9Ykyx36LhHqtbySby+Xtj1ajwYPmpmXux1
 iUBM/9osXCFXnm9XgyjiK5UiKTGcCfbakEk+BEzkVsTOsSGKogzxsxM4ugHdlItJx6RW
 DTWQ==
X-Gm-Message-State: AOAM5327d30VHhoCwlp3sRXOrtZFsbYvACo1uMv02hGq1F3lCoU5HK33
 bRuZrIbtP/a1jpSqGusWa1M=
X-Google-Smtp-Source: ABdhPJzcv7lRZbMGhd+k7E1Cx+likm9kmGU8+1pG9V8vLBdZv+Wbt7kpy3IymkIZyESK+zh4ET2BFQ==
X-Received: by 2002:a05:600c:1da2:: with SMTP id
 p34mr611776wms.97.1643010048736; 
 Sun, 23 Jan 2022 23:40:48 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:40:48 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: warn about dma_fence_array container rules v2
Date: Mon, 24 Jan 2022 08:40:39 +0100
Message-Id: <20220124074046.4865-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

v2: fix comment style and typo in the warning pointed out by Thomas

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..cb1bacb5a42b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/*
+	 * dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (num_fences--)
+		WARN_ON(dma_fence_is_container(fences[num_fences]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

