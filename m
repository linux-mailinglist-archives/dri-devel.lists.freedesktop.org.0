Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9C6B6B44
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF1810E153;
	Sun, 12 Mar 2023 20:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DA910E153
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 20:42:52 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so15005097pjb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTj6lDaB879i6vS4ZDrKb4b2c9OODf1NGI0zVIt2OIQ=;
 b=KC3a1z9EFBAXvyyxFRBFqNe8y53x3UcUyQeZSEkxdXoFUAJoXRMW5x12S3KgDohLCq
 HgPllXDe0L7d4jpa0swkH8xEUPkFw+qkPtFiETd3slsVUSiYo1BMGyXc78dOVy4xIsa/
 iQz7mHAZKXq1dPOkNL0Budytd+6487+pbd6M9552NaGPYaDjcY0OoL/Kg3JCLgUOfw1j
 VKsL6McmgvXWpcQP5dDkT0F/Lf8ekwYWTnQmW8G5vhEJFBvpzPwqbXsO+AWYZohCOO6R
 EWELqpscPHrGPQKL7eMTq4bDp1G+IKNbckzIV0LI00pT4l33/MvugcwF0S7AKAFr/dJ+
 +U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTj6lDaB879i6vS4ZDrKb4b2c9OODf1NGI0zVIt2OIQ=;
 b=TW176eMAseEB70mDD57o9wN5G5ocsBwpn8Coxv6lerYllboJFW3eVvw50ZSeSfPpkU
 COSxDueGq4fo14WxwLM+FRUqqXl/XoDUwI/LqObteBQQlqxfAU8qaQ3iClL+cihpfh1P
 Pu17YAscDVfWKh3lMhV+OXGTZ60J0fY0PiqBhO1KwkJT6dJ3pF7q5/pYgpqlPLk9CHb2
 PMGcrFPdzrM0ezXE/N7Onbh4M9++PxoG6VBBih+qOVYDDMDtYry5JTYH6m1w1m/wQRBi
 3sNfCEc+hZzQykLqI54NgNZPF21kwG1Pt66rldrdW5rgxkdGz91wY6gosMBwD2shyixl
 jmqw==
X-Gm-Message-State: AO0yUKVGgAL0YTWhu3MMcuYNjyy/V3QBU5Dah+i/TcGzrNQmmf7+bpdC
 cXIaBYr7NTgpjGL7Du8dClwKPqJJxv4=
X-Google-Smtp-Source: AK7set8LS5r2Un4ozPG4+s7BFDawLVgaX+1P9ahu9XWoxUwBD1fydMV+4TYjTw5igtEd4Yq+x4LEeg==
X-Received: by 2002:a17:90b:368c:b0:23c:8ee2:bc14 with SMTP id
 mj12-20020a17090b368c00b0023c8ee2bc14mr2702243pjb.24.1678653771444; 
 Sun, 12 Mar 2023 13:42:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 it14-20020a17090afb0e00b0023530b1e4a0sm3158971pjb.2.2023.03.12.13.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/13] interconnect: Teach lockdep about icc_bw_lock order
Date: Sun, 12 Mar 2023 13:41:41 -0700
Message-Id: <20230312204150.1353517-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Teach lockdep that icc_bw_lock is needed in code paths that could
deadlock if they trigger reclaim.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/interconnect/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index f7251784765f..5619963ee85c 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1127,13 +1127,21 @@ void icc_sync_state(struct device *dev)
 			}
 		}
 	}
+	mutex_unlock(&icc_bw_lock);
 	mutex_unlock(&icc_lock);
 }
 EXPORT_SYMBOL_GPL(icc_sync_state);
 
 static int __init icc_init(void)
 {
-	struct device_node *root = of_find_node_by_path("/");
+	struct device_node *root;
+
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&icc_bw_lock);
+	fs_reclaim_release(GFP_KERNEL);
+
+	root = of_find_node_by_path("/");
 
 	providers_count = of_count_icc_providers(root);
 	of_node_put(root);
-- 
2.39.2

