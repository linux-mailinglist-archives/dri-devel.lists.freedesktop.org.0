Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFF0244334
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C266EADF;
	Fri, 14 Aug 2020 02:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9526EADD;
 Fri, 14 Aug 2020 02:40:46 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id c10so5031885pjn.1;
 Thu, 13 Aug 2020 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
 b=C+xR5/svYbw49MY4CeW82SJXbGnX+JNhURW4NRg8W+6hzAFLpOU/my1FRJ5O0gHGWf
 VAlVdoW2esbR7vWEeQUWFH0Jq7GcD+xFsBOUjeG2U9x2SHmPNLxwcvV97RwA1l4fh+i2
 +M/34tH1Wr6XkBaaDg/Jg9eqhDsR+jDTIVk5lXr0M35SPbUSBzfRDX4MI+XsXjmJW5q3
 2sEOICZBbL04zS1AtXchQpXCRnUiNeCTzSTTANAy4nkzofNJgX+QaKLbSAkfsbvzqzyZ
 VjlfYKMGh7pJgaTph9vg4QVkl+kXKsVtraG0hRt1hw5/JDgmMZiwZUh0UUrRcksHgXH1
 Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1FUoAbvyEKIH5lQKuzluOyz2/ynwOKVUIX8AS+w28WA=;
 b=kg5xX/cK5sYN0wWIe4/kTz7+Fyjx/Ww3/5m7pTnzHJNTeeNZ2jcQ9YNV6I8tdwgn2V
 ctDyVq6p/ffkyUoW6SXVsX+jQpNh84hAwM2hyr42N0rA0Wh2BJ8Ma56ezFwnsMajkW7B
 9YoG53dSDaQefHCp8eyiTORfhUO0cfnmWiCDXe36qbVpLgXW02x639wTXYgIivCOcEik
 pVDxsq+3E2ZCpRUStGn0VC1l8yzDLXh0ZyJ6oMQOSTAVWRno7O2THTNTzgKLv3WA7jb1
 JcTjTXfua6tTcRSPhOtV8lMFrPg80WeSImSVxgjU5wjl1Fnps8HrfA5iTbj771KxTBY+
 tPhA==
X-Gm-Message-State: AOAM531sSjpbBYG0Z7QjxtqgPHkURawHPDTJFqAb88iFP/4vEDHmbpvF
 SOhCINJpjQm3UnhNL7epwC8fYAvYmRk=
X-Google-Smtp-Source: ABdhPJyTjSmkPtRA6/sXaKkEFWxaxBkZ4HL8mupIi9HzpilQYOPzsg6o2GqsZMiPbcCB0VR+sfOnTg==
X-Received: by 2002:a17:90a:6fc5:: with SMTP id
 e63mr497592pjk.200.1597372845667; 
 Thu, 13 Aug 2020 19:40:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id a19sm7294660pfn.10.2020.08.13.19.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:40:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/19] drm/msm: remove dangling submitqueue references
Date: Thu, 13 Aug 2020 19:40:56 -0700
Message-Id: <20200814024114.1177553-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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
