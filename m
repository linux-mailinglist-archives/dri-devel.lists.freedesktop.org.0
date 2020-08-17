Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C98247971
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 00:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902789FEC;
	Mon, 17 Aug 2020 22:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C16289F69;
 Mon, 17 Aug 2020 22:02:00 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x6so8753676pgx.12;
 Mon, 17 Aug 2020 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
 b=h6YW9JuqbTq3TVlabwhWg4aAs/38VC0PkSQiYw06ptTsQl3LD5i77zZ+MuC3Pl0b3D
 MKzgD/leyspk69W2ODEpbH7hnzzoSWLmb/ybePpwsl359AQQN7Hb/yV2qgLPnZCrIo4K
 pQbagMAISi+rGuZeV9gGyVKBf3hqVW8hNFkAbcoGs5xWfz6MmEQYRt/vfhiGnW1gbQps
 SqcMH6r+kTFmgfpgUm2HlNhlpLJjfOLZGCSsPtVXizkudwJi6QfH73qJdSeR0H4Thl80
 PW1sQ23avxHUkoq/c+5W5Xh5UwZno0uOtf+ivkbhFSQU/VR5+PtvY2IRX9Who+KKY6Eu
 Nt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
 b=gGkAuHzuksuNw1hnHhU0pa4FNwGt/2S7NyYtn+2VroZvCE9mxevx48CVeTv158/TNF
 CUPXmxu+lSJWZ+IL9FtW/R3R8UzqxPBm7CZA0fGV4CxRVAax0lEkujjMQbj8Is0XpOJ9
 HrNfhOBgvlOLnx87kY3xe69aCjyiTan6s/t+sU+l40j1TSTDB0MEDQQVV2gG3OU3B3Di
 FiOV7Mvj4GAbkiRE8/Kp5z1zvBt+PnO24m5TkSU2YoSSkCOrl13SCbq5kk1L6cemd3ye
 4PEJjn8Nym59C6SGcdQHNcdVJeS2f1qvSuv2xn/tT6iv2TQh5mxOjrnb05sbAnsEdbBZ
 8nWA==
X-Gm-Message-State: AOAM530MbSUuADRC19zYxvBNjYP3HDoDA1On0o3eQIQbwcNjGzdLohZG
 WO+sFd0rXvY317FOeY9gtRQhKpx0uKekyIXo
X-Google-Smtp-Source: ABdhPJwfBXHxP+FFJVxeGXrje9tQpj2dyq/Q74AQSixL9Uv0RglMKQZR9H8ViHvx/RDZCaxe40EtUw==
X-Received: by 2002:a62:fc08:: with SMTP id e8mr12486387pfh.208.1597701718956; 
 Mon, 17 Aug 2020 15:01:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j8sm21721753pfh.90.2020.08.17.15.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:01:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/20] drm/msm: remove dangling submitqueue references
Date: Mon, 17 Aug 2020 15:01:26 -0700
Message-Id: <20200817220238.603465-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently it doesn't matter, since we free the ctx immediately.  But
when we start refcnt'ing the ctx, we don't want old dangling list
entries to hang around.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a1d94be7883a..90c9d84e6155 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
+	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
+		list_del(&entry->node);
 		msm_submitqueue_put(entry);
+	}
 }
 
 int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
