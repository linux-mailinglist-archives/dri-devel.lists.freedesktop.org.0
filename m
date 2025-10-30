Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2759AC22A1E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 00:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7B210EA7B;
	Thu, 30 Oct 2025 23:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PliAInOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31E410EA80
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so13152535e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865482; x=1762470282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dA6vbryG5FJTzOnmpJ+a7K24uQqVYeU0GUEiTTytsg=;
 b=PliAInOqOrxQS+ImCg8kjzwaCTrWJ9pDv9fGOzI0WhAu4Uwzti5nGL0GCDcws2RPET
 6+cfEBcw2CQVg9uWr5DyE67WdhITplTm3PJBzljr1XJ8WIvngG3rLblywEM1EPZSX/Wj
 B8i2cqkyQpsRzb55gYFW3KND2QxDu7Kn5clP0eYInP7CU1BxabGWPRH9Lm7c5eSF8FK2
 H4MEQx4anaxy6pSaZpsn1eL27jCW+uOFPZWZu8l0/hwiuYuFgspV2ro5LuCofBnv/5Qv
 iO6Y2M623PNwIlAUd097+yipjs8EG4JSxZXVVeGjOi5ezmX5SaiMXvTES1XGSpE1kRW3
 WUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865482; x=1762470282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dA6vbryG5FJTzOnmpJ+a7K24uQqVYeU0GUEiTTytsg=;
 b=AB4of8rT+TQzJ0w7IbrScV6psxiyGiHVzx2l3V5gN3uQ5l2shd28/v782kMVQUQcgr
 EuNc3ZNaOZuQe3rPf1ewIX0P4xEkZqpI/E5xL/a1fHzzv8SgUczdRlCxQdO7BNONkJcH
 KoeKYfIg2T7b/uhfAZIvq7V0zGE/mLtTAEBfps1k70CzWh0mJdcN43EaLAGQs4umsTcQ
 oq10IuPbZ0x83D35Z2tHwg5UDWHtOXy18zzIEWFSlyMqolsJEa5I6p8pn3G2O2lbbQED
 klpHLYhPY9d8gfpJqtBEaHg3sgtkib2lbyaYXpOG1yBELkOyxpBNyDxILnJbIRBPKqiP
 SEIQ==
X-Gm-Message-State: AOJu0YyCMXsitKWzptHZTSRvbFDRe8i/h6Zw9Cu+LSJ8GCyn7hUOe5b6
 LZbxOZy1Zt+TJGo29Zcwh7Z1nIDb+W3uKNH+cm4iYYf6bE3MksXxYlwe
X-Gm-Gg: ASbGncu63ZEaO3DQ5fy02wA3NPMsLNP7FgfIbyxL0ugG0TkK48g6kCibg2sRBwVwq+S
 PkfrO24BdOPJ5BU8Z8Po4/21w/1QqjPIPStA8jFbXKS0uJ1Hne9UICMqrceXYJDjPfcaEtE3vHM
 Eoiw4v7nm/Q1oo1zJEDfOQx0EvAYnu/luD5bb18eiCB7NBfD+nstgNxD42+LHMvk/snuG6qJLbi
 LCJ3tJOwG+DdKw2iYAluTETyo0dpYfH7kk9vo+Xikr2IYgxfDd/EFd3a3nJ9hiBWhwZYNenZhC0
 7Id5ANGpS3SeQLHmkVA24qVW2M31A6G/KtFbHwsH8lCfEZgkpx7/+/n3VHbOzpfziLLFBNqEZjX
 ze0ad7/2ftb9j64gkZKik8Vvgh628n0CitKcu+/Nz87k8yCkuiOMPY3R3I1pZrTytIYZDSnRywr
 k5NMUcd7hy/Hp09EkGhSJ0hg==
X-Google-Smtp-Source: AGHT+IGyCOmFhRjPi1dA9EmPXnKmiW9faJgiGLkzd27O/GNIxvB0MswqzLd3bUuGjgqJLB4E+1ldgQ==
X-Received: by 2002:a05:600c:1c1d:b0:46e:39e1:fc27 with SMTP id
 5b1f17b1804b1-477307d740cmr11913775e9.5.1761865481989; 
 Thu, 30 Oct 2025 16:04:41 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:39 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v3 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Fri, 31 Oct 2025 01:03:57 +0200
Message-ID: <20251030230357.45070-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..e5de4367e2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.1

