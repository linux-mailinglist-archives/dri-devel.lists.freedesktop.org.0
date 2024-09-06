Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8EC96FE8F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 01:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4D810EAF5;
	Fri,  6 Sep 2024 23:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mkuoqnOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE3310E98C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:01:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42c7bc97423so17623815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725609710; x=1726214510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hkyikhZMpOT8gzw/xg+wgtlCLgPqat5O+1E0+bcDLIQ=;
 b=mkuoqnOTTlCjHkCuT/9V+XQUNbHePmEijU3YXzQYs03SyZ8s+5LcocVGUGZW2z+/nv
 0IRSFk5AKXmz1QwypKDiRIwZ2vCyIiH5yikf0p3eGB8nvpUdg9IMVema4xkzCZAdZGCg
 eRxGPCHL5efHuqVgtl0IlqFA329fJkm9dBLOrjmdz5vQtq7jLsT1Kr7vK3jAtphxN04o
 poEH5c2fMo7ZG513a00c9BcW6eb+gfF6E9Nq2BjETipd2UtZIVBlvYxYgACNFwNDs2aG
 gFHWnv5i4pCK1U8flAeTP1FDdMuVObzW72YSyLgAo496WWqs2WJPZm+9pKmmUryoAwrN
 hDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725609710; x=1726214510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hkyikhZMpOT8gzw/xg+wgtlCLgPqat5O+1E0+bcDLIQ=;
 b=X+pH7vqUfbgfkp0aTZsY434noOwoQRevUm1FMnFo440YUgvZTqj5/b1Al8yxryr/IG
 hsw7kCgMFUZhnWn+C0B2m/02HTn5haljMO+U8NEQnSDCaCuDw0aCSXjB+UNz3C5DGoLC
 tS58iGlQq7IyGxewaxNweRWcEHnKcqpLPEHmrDkdKOU1WEBXbpjNPtbh5RJSHvT38ma6
 c08B+u1JFwwx+LryvGU9Tnk6fEC3ixy1JMwSqmHIsiyf3vbTVWY2mXU1lRUaDx5wYy3k
 /Ua0CsjFb+oTiChONIJApljTl/2xjSpSsD96W0Sl9Qn1WJpvEjJXgeuW0KuvPn72QjgL
 6Xdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWArT90HyqkvvSAeHAanE7MrXCqjdILKyzrBxFzmTOhBzDGs8jJ3llRA6AfDiFA32LR52/E9GNzwd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMHvmCucqtcvdcxn8mrpPWwAnFD4jSgcYUC+rkxQLYeX/RsX8D
 IansvIKwYpkR6CBL2NiVdewjRuqiJAzkJ0djHzZru6iBLFxXUuMn
X-Google-Smtp-Source: AGHT+IE9zvSX1pGjBvhr0lwumfMe5aPctcurwZt1TsZp7JV2U5tLPlrVh/c7rhSvpwdty9ypTHJMZw==
X-Received: by 2002:a05:600c:510e:b0:426:545b:ec00 with SMTP id
 5b1f17b1804b1-42c9f98b589mr14070935e9.19.1725609709052; 
 Fri, 06 Sep 2024 01:01:49 -0700 (PDT)
Received: from void.void ([141.226.13.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05c29bfsm11954555e9.5.2024.09.06.01.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 01:01:48 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] accel/qaic: Fix a typo
Date: Fri,  6 Sep 2024 11:00:59 +0300
Message-ID: <20240906080136.4423-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Sep 2024 23:45:00 +0000
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

Fix a typo in documentation.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 Documentation/accel/qaic/qaic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index efb7771273bb..628bf2f7a416 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -93,7 +93,7 @@ commands (does not impact QAIC).
 uAPI
 ====
 
-QAIC creates an accel device per phsyical PCIe device. This accel device exists
+QAIC creates an accel device per physical PCIe device. This accel device exists
 for as long as the PCIe device is known to Linux.
 
 The PCIe device may not be in the state to accept requests from userspace at
-- 
2.46.0

