Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF0498055
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3C310EA82;
	Mon, 24 Jan 2022 13:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB14010EA82;
 Mon, 24 Jan 2022 13:03:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h29so10817364wrb.5;
 Mon, 24 Jan 2022 05:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
 b=k4LocfeKqgCiOSb/bFkVIe+Ku658A7zBja842FU5zGdTH4NyJvvfBvfC1rpFFs/N9/
 Dz+5WYB/YSi4WC1+4LkgurAiJyl+Ru/4fkgqNb3xGwpZdaDJwD7gjOKTUwopixnAKqn4
 iSCVjbdzTeGr4092nLs7seeDslt4C2M6A7kFCdCvePJtVUcIhx+hFdOmVcEVrykssxmJ
 Beh7uRJ+R6fz4YBEwJlnyF7nk2PsAr2V2oc1+3P8wI58BHuzqHoBknI6IldOXNgAzr41
 hzBUWmho+twZ4l0H7oJUgIFpgP0rpopfmrHJkhaGpiMJFm9NaXimRQVpNtQ82+mf2OtL
 kUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
 b=0v8uwIRygD/Dgp3I5AiIuC1XpFdFKua6IXwSlstHEqZuIAHY069funSkqGh9cW5Qbm
 lk66paZfXE2MRQiAMLHbsLa7K6GII/iPcJp3j5jrgsJs3QOY4SYgb06xuFa282vqzoZM
 xKi2+ST0G+Rv6RJWQCTCuspiGvj01e6lQXPPs8NgXslG5uf6DdIxL8GYkXPV22IxaoKb
 sk1pf60QrReI/5Owq1k6CdhJAfOTWM14CPrz9VKgRaw3jikr2EaCdoA/BriwZbLNBVde
 Qczb5YBCJTVy2d+8ZQOauV1gO01Dv8YuxlvZX5s5Q+w5LkfFrB1xyLpa9hFMyHJpvnW9
 PdRQ==
X-Gm-Message-State: AOAM530s7Djq6fXUGgBTHjq9JTOSm87KjAO+14Jw1SpBe0WUjXPKVuQC
 NhuvV47w9uDeFPSuZw4I4Us=
X-Google-Smtp-Source: ABdhPJxQFRSIdOY815uMIjIuICHy/VNW3E4LthwsrDEXVnYnOzu387vE+YAzcwllAcmtblw8wKBGmA==
X-Received: by 2002:a5d:6510:: with SMTP id x16mr5230197wru.613.1643029417626; 
 Mon, 24 Jan 2022 05:03:37 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/11] dma-buf: warn about containers in dma_resv object
Date: Mon, 24 Jan 2022 14:03:23 +0100
Message-Id: <20220124130328.2376-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

