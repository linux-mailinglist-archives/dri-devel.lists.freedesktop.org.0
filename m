Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7A25E9EB
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 22:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600D26E24D;
	Sat,  5 Sep 2020 20:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28656E24E;
 Sat,  5 Sep 2020 20:03:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y6so2663353plk.10;
 Sat, 05 Sep 2020 13:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
 b=d8rJD/QaZSXKizO3GCu5CUpq+J4GmCJOqoR6otYkXn4kfaTkDvF+aBrkXOkT90Bahe
 ZbSkOQYq6ZHt/jSYiZ3sGkQoW5r8GXsXdrGnCpbeysVp5AkpCCH551tyZmse+AvyT80S
 CmH4MZF7sbeFiju6CPJrRnVWMfaBmOqcbDc66p6h+K6tCGvUGf/2pnZnvEJMjJhAKKI7
 UB3wdYStymMuX8KI39J4cj34r4fdCQ8rfL5aWLan9YNvn+yNYLhdNg0gWNkyIXBTWIDH
 r2ZxKWbLIg6aZAupdgaPn0TSs+gHDOfgVGHaUkRcGdCeOhyXiOtqGmK65todtAXFGtJd
 CuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
 b=AeVXFUD6xFy3QIE68hYuf+RK+wJbo+7q4OdnLCYsRfTP2zaVKusNLCgNnKitZozTOx
 qqmRy7wyCpvbbZzYlGkITmOJhmQ5IKTTvzE6s8VFiyB+Hk29PLRveeeTw7zGfu8nyAdq
 PDmTXkJpVonYZq9L2c9nJYaWJku+bSyiIUjRRu6NHCSRh1fYuPQUD0WcWcO6BfqKcZ8+
 d7bWO1hO475n7iXcFYLtzb76fV43Ob7CDabDjiUp2qbzp0sFOAwXhmrlW59edSMqMbCd
 mM4TXFYITlABbCllsEJFEkWIFGxPpEQPJHe8bEskBxej4SNYdyh8XGjoYrhXIL3g96x0
 OXlw==
X-Gm-Message-State: AOAM530FclTbslKjpIQnQjGNLMIYC/iDRmUWpYKCrKrqawJY0nW3kJrj
 pbqcAeDNKcxTCOQ5rLv/2Ic=
X-Google-Smtp-Source: ABdhPJxokmd9eJn1r0GSTZtkg2Dhgd5Wg4QvyB1tZpQEqAEv9hOMzQ9O0ygy2PRwuew2h0245PkdCg==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr13380689pjj.6.1599336238220; 
 Sat, 05 Sep 2020 13:03:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k4sm11254400pfp.189.2020.09.05.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:03:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 01/20] drm/msm: Remove dangling submitqueue references
Date: Sat,  5 Sep 2020 13:04:07 -0700
Message-Id: <20200905200454.240929-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
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
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
