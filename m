Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B728A784926
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0419110E3CD;
	Tue, 22 Aug 2023 18:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6360D10E3D5;
 Tue, 22 Aug 2023 18:02:46 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68a410316a2so1799779b3a.0; 
 Tue, 22 Aug 2023 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727365; x=1693332165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuYmHdMlJJm2W9mV95yYZgg2mXFJPDcfJ3tRYlFlHrM=;
 b=gqFsS4g898zloSUsvUOxRyxm13ck+hm8PgrmGdFF5H3jcXSedee1lUl2lXxL1gcu2v
 RWXKkTldqfGm0XNCOOoSTf6/T3iV/OCF9hcOHhM5RF9anNmQKwL+EzX1otqxzjW93w3T
 iL+SFbFFpmBvIv2bKl31eb0+TPhU4dM96amBC67LQWNQ3EFxjkt/GUkm3I8AR0d2SS1h
 GRcw4uMgshDoDI6JBqCAV6owJnFssXoOk+9szBIP6tO568OCvqg7uYbcIbEGEfqlnTSG
 j6FlH4hBlV+qLudlrqHiTPvE0YwWfd2cM7CACjfG7mcSTsJyYRp36SuV3CxyEmmpMC6g
 RDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727365; x=1693332165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuYmHdMlJJm2W9mV95yYZgg2mXFJPDcfJ3tRYlFlHrM=;
 b=llDiFyPcFSHqt0CS1Ov5nf9kdYkKeIE+MIo8aBRacVko1tjkTtBbcIl835DH/Sl5p1
 RTy7SsKczfNv6R1kPBbSJ7uOtsr2BB34o7+HSd2Xt/Jg5fam/J8Wpd6Sa6fyY4JX9bTK
 pTuGanMC6KG0djFdrHZt0Lob4A8f528hCXnOF4dm81OoBVwvQmfxiNkcQxLTbQlilzZU
 U3P/q7U/nNnMqvcJfMrAm7DOyZQ4qs591EwA5omxK/xtRlHwULKK2ieHufy3W07B7aYS
 /DwZG1Ml88l3WAAtYnj4nSG6Ml0Ln3YuMp4idwxPjEyINyBqQPYsgEDolvw5K7B3kty2
 WMpw==
X-Gm-Message-State: AOJu0YypqLRjftyT++18CjEPL3aW8cDsILKg5kPVGhQbvmy6FJSyd46N
 eVx0Mvy5ZTOlNQ7KgLEGUsKv4hcUXyE=
X-Google-Smtp-Source: AGHT+IEGI5zSTja+ppqkBQ3KGECxtd60QD4ZBadZiwQVZDV8aMFXhaN30CDm1Y076HbxUUkkvQ9D7A==
X-Received: by 2002:a05:6a00:cd0:b0:66d:263f:d923 with SMTP id
 b16-20020a056a000cd000b0066d263fd923mr9211500pfv.20.1692727365270; 
 Tue, 22 Aug 2023 11:02:45 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 k5-20020aa792c5000000b0068a0922b1f0sm6226293pfa.137.2023.08.22.11.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/11] interconnect: Teach lockdep about icc_bw_lock order
Date: Tue, 22 Aug 2023 11:01:54 -0700
Message-ID: <20230822180208.95556-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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

