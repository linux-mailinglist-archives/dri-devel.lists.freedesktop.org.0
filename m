Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C658597BD2E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6851810E5A6;
	Wed, 18 Sep 2024 13:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZI0r/9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228810E5A3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:40:01 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso6213470e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726666799; x=1727271599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F67HKGJS01CpRs61gIMCLFbQnFdt6OhKu+DWzbIPnBU=;
 b=BZI0r/9qTmpMs/+EbNy5R5/VsSuV+t1KveTu5+m7DER8KYljJWiIwbM4pMdfX9HEkA
 X5nAw0FsCrRX8wSWue9VNVtJneu/u8O8AZ7jtS449ZUDp/3BIYqkktoMg2m1GWPDsQQA
 AsO1nc9ZLivmj4rz+ETLNGvlRsNAMiB4xWNNYLgWs5yzEPhlxFRF3nReUmY4uxYz93wH
 GBs46UenG5XjZ1Ic0mifUuF8WyOaL0SdJ9TUSmH1ZFsnG8ddDtQYDh81ooMhztqmREN3
 LBW1yz39oB71h6Qu0IVVi1MvLpn2Yn7tYWNv/Aw9hmCBN5XWqY/EFbt6F177r3hMEgCQ
 MSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726666799; x=1727271599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F67HKGJS01CpRs61gIMCLFbQnFdt6OhKu+DWzbIPnBU=;
 b=qoNrpRwrcrctHUGcxNO6swpSg2uOMmlZUseU1WRE0lCG6CrN2qO+L46arKypspW0ak
 vg5/wxTZpRkZ4XwgGOP6HGzmnYMUSDCYyp/RBbW6qpydnBD1JAZ2rd43cSGL7++Kj/SL
 8UgTKvIjBCJ1YMSPifrmejwtVn9sYN1XR0payhCNW/TXt24wlQpNmkijTS7B+XEhFtG+
 xkSuyrNQVlnx/X6T0gmWFGwz8b0zhT6qfGgaN6Ax27JzFYHQqyOytjFmjffbMO0bivlH
 CEUxT0ZAtEwWjfRzrNhuqcc2zDxp/1T6wy8/MQ+r4I7CE+s078kqGnn43XiEKex3157q
 UDRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8w5sTV4Xyza2HLu/4RZiHX7B2OrSaFI7CcERpNDuuGpqZ6HwR30bt2YuFNb+1DQ4fJNWUmh3t6Kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYpU/d+J0RXH/J/oMcfNvr62kpK7Klv8rcBt9jGagvpOKBZkLq
 4nsDGxl4r0MaRUiZqSXDs7pUuS+yJsrocLMwJ9UwTevXlP0w1Huv
X-Google-Smtp-Source: AGHT+IEEPbCtGTvJHBL8f3ryjVz+3b/nTasIglynGeZ2wysez6st6hkNEiQljjIn5VEKS18L+h7p+Q==
X-Received: by 2002:a05:6512:158e:b0:52c:df8c:72cc with SMTP id
 2adb3069b0e04-5367ff24b28mr9709252e87.43.1726666798978; 
 Wed, 18 Sep 2024 06:39:58 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:155d:1400:17ae:e091:3b52:93d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096a08sm592666266b.2.2024.09.18.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 06:39:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dakr@kernel.org, pstanner@redhat.com, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com
Subject: [PATCH 2/2] drm/sched: clarify the documentation on
 drm_sched_entity_error
Date: Wed, 18 Sep 2024 15:39:56 +0200
Message-Id: <20240918133956.26557-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918133956.26557-1-christian.koenig@amd.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
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

Sima requested that in a discussion, just copy&paste my explanation from
the mail.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..571e2f2365a1 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -166,8 +166,21 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
  * drm_sched_entity_error - return error of last scheduled job
  * @entity: scheduler entity to check
  *
- * Opportunistically return the error of the last scheduled job. Result can
- * change any time when new jobs are pushed to the hw.
+ * Drivers should use this function in two ways:
+ *
+ * 1. In it's prepare callback so that when one submission fails all following
+ * from the same ctx are marked with an error number as well.
+ *
+ * This is intentionally done in a driver callback so that driver decides if
+ * they want subsequent submissions to fail or not. That can be helpful for
+ * example for in kernel paging queues where submissions don't depend on each
+ * other and a failed submission shouldn't cancel all following.
+ *
+ * 2. In it's submission IOCTL to reject new submissions and inform userspace
+ * that it needs to kick of some error handling.
+ *
+ * Returns the error of the last scheduled job. Result can change any time when
+ * new jobs are pushed to the hw.
  */
 int drm_sched_entity_error(struct drm_sched_entity *entity)
 {
-- 
2.34.1

