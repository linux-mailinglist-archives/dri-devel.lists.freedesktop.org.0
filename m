Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF576F562
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7B610E68D;
	Thu,  3 Aug 2023 22:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE39C10E68C;
 Thu,  3 Aug 2023 22:02:33 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-26824c32cfbso1004758a91.1; 
 Thu, 03 Aug 2023 15:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100153; x=1691704953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuYmHdMlJJm2W9mV95yYZgg2mXFJPDcfJ3tRYlFlHrM=;
 b=K12ls+5nEVl36ytG8cbp2yL75TIL1947X1Gv+ztaa5Hs1nzv+rsT75oXjLTWThiuvm
 NMIvk4kaDD61ZhpuSH4+0g7aEkyWAZ/NEZTx3b93Z5VyIeAHAGSJ8qqNK0CegT54Y9Np
 UDlfQNqA52YALXkFjv+uRLcBVhMD+GzpiiYGUdLFL45VVymD2Aw5Q1JMBgkcfV7HYERO
 s/Bua6mD4cUkMEn8l8w1lpFEQczncgzXSTSGm7o+2SfFS4f7l+hEasQgu9bzjwDbRl8n
 jgWdy9tyjFvrcQnH6g/FvYmmDOjY/JYPESrbt2yArlBGFnSp7h1A14npTAFYtwyvKfBb
 t2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100153; x=1691704953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuYmHdMlJJm2W9mV95yYZgg2mXFJPDcfJ3tRYlFlHrM=;
 b=SeVh0CNFPwSr7oKTfkVZ4BYS63fZHjfEKv23ZEm3xvjfQtLpl2EcIMs0sO612FgDQ/
 rAv66aDAZsum73CLKMnuPfl/CCqosvbmPfTZT6VldWm4QCzbOxJUzrAwl2sKqzR6uEd6
 qNjslt7mxZEaS8/IyVUGAroMYA6jV+612CVMz9Ga3fdM05YUqLLZ4Vr32MYx2OaLykLg
 RFALLPLYONppv9eftULTRbxj7M6OGpcyWyAJAaocmxXVwSN9CaMrYrVoqAxOq1iZLpHU
 3o+uxQYYnXYssZGU3yfRwtKEi8DXI6KSzZZcVZ1Byl3aVc1J+BRr/Uzz0gq5L2nLPvlJ
 NVFQ==
X-Gm-Message-State: AOJu0YwVUsnbYSVehO0HlF6PQs2C9vSz0sZnslahAZw4eoBNtfZkyWe/
 0hDFwnyfBQa50qFL3JjEAxKlWsfBJ7U=
X-Google-Smtp-Source: AGHT+IG3YFvsDLwStkO1uqHxjVFxeObDGmEDiHO59o2QB19zWFMW8tsvoWzHpEa0C01KLQGzwYn+Hg==
X-Received: by 2002:a17:90a:6f23:b0:268:f2e:b480 with SMTP id
 d32-20020a17090a6f2300b002680f2eb480mr27686pjk.11.1691100152708; 
 Thu, 03 Aug 2023 15:02:32 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090a654300b002641a9faa01sm2946592pjs.52.2023.08.03.15.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/9] interconnect: Teach lockdep about icc_bw_lock order
Date: Thu,  3 Aug 2023 15:01:55 -0700
Message-ID: <20230803220202.78036-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Georgi Djakov <djakov@kernel.org>, freedreno@lists.freedesktop.org
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
index e15a92a79df1..1afbc4f7c6e7 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1041,13 +1041,21 @@ void icc_sync_state(struct device *dev)
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
2.41.0

