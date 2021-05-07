Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622ED376BAF
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690C76EE89;
	Fri,  7 May 2021 21:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550D6EE8F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:25:09 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id h11so8999273pfn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7qU0L4Ghb4CDxo7QXwP01EaDZwAPCg8iNdM0vaFanE=;
 b=XdgUX9BU0EfF9iq2Mk1qPxb4M/jFLVcOTOOyxD2foBPY44oz9rXJk3Kq3i89V2iGLW
 8XxDpYb/vIFYQbe8Njb7uHTHqUE6JheauBLmHiUbew7fMZS/gEb6x7z3iUt8NhloLm38
 9DLvJNyuY8XNbfbVPV+jjpAP8P8w2RSRkAeNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7qU0L4Ghb4CDxo7QXwP01EaDZwAPCg8iNdM0vaFanE=;
 b=e1bS45V73+r/jbG1HXQq1yajlV+bjtB0Tu3qtOG7ZnxmTK/JMGDhIsrXAtDOooiBq/
 cr3At1joBzvzx5dNg29Ui/d3L7tw0v7a7yO0/OTwXsf2Y0PjwxchGiKSg87QL78gQaY/
 1wf8GuZqYWhMa6zi5bvOgHiOdjGo6QkztRSOky+JEWblSdr400WAY2hDmjz7qfjDwPRL
 4w0/XflaOwTToFLE74qWCeM0TXCAozizVlX/ZQ/oXBwXKiZ994gUGIaCQa2XxLTHw7r2
 XnomrrtI5yS2kBLebfwwrnv3J+d0IRHiqqaPdXdWIvkcfxlyUko1jFTP/rFpjhPNfd4I
 OXnw==
X-Gm-Message-State: AOAM530ufGRZ27nfPJLN5mraouKWcDZJulB4fPhTHVGFvwWVPEl62Qub
 v59LxB/VyHG3q4aXhIqkYPVpjA==
X-Google-Smtp-Source: ABdhPJzuXnkaex5EPKxyYb3+tGce0cj1UnpTZAtXkCnSy3u/dQq7nXNraVXLIaMKOLAN0jEAZSUr7w==
X-Received: by 2002:a63:a64:: with SMTP id z36mr12037116pgk.342.1620422709512; 
 Fri, 07 May 2021 14:25:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:25:09 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/3] drm/msm/dp: Shrink locking area of dp_aux_transfer()
Date: Fri,  7 May 2021 14:25:04 -0700
Message-Id: <20210507212505.1224111-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't need to hold the lock to inspect the message we're going to
transfer, and we don't need to clear the busy flag either. Take the lock
later and bail out earlier if conditions aren't met.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 91188466cece..b49810396513 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -329,30 +329,29 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ssize_t ret;
 	int const aux_cmd_native_max = 16;
 	int const aux_cmd_i2c_max = 128;
-	struct dp_aux_private *aux = container_of(dp_aux,
-		struct dp_aux_private, dp_aux);
+	struct dp_aux_private *aux;
 
-	mutex_lock(&aux->mutex);
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
 	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
 
 	/* Ignore address only message */
-	if ((msg->size == 0) || (msg->buffer == NULL)) {
+	if (msg->size == 0 || !msg->buffer) {
 		msg->reply = aux->native ?
 			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
-		ret = msg->size;
-		goto unlock_exit;
+		return msg->size;
 	}
 
 	/* msg sanity check */
-	if ((aux->native && (msg->size > aux_cmd_native_max)) ||
-		(msg->size > aux_cmd_i2c_max)) {
+	if ((aux->native && msg->size > aux_cmd_native_max) ||
+	    msg->size > aux_cmd_i2c_max) {
 		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
 			__func__, msg->size, msg->request);
-		ret = -EINVAL;
-		goto unlock_exit;
+		return -EINVAL;
 	}
 
+	mutex_lock(&aux->mutex);
+
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
-- 
https://chromeos.dev

