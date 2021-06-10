Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D73A29E9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6766D6E4C5;
	Thu, 10 Jun 2021 11:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0B6E1DE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:10:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so6200051wmq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUI62iOUljGBICelPT/HeQgi8+XFwHWZxTIpml7ykIY=;
 b=r6xevSU6lzB8tJxNHC5dQZMiQZ6fVIuiOkCN+UHyg5Tqoke4zatOQoiFzlxBxquG4m
 PyXhg1Qh5CJoBHu+w0dE6hdJhYmUfjY2MjEJ9I/U8m8td9Z24g6EVcDF1EJzHPo+epPd
 CeNtC67cUjNyx6YhkaQDFxvm3Q7RV1yo1hcUh7JbghFE4rUMMrh12+e9sVg4kU54pD2S
 3aRMTQ1xEGyBlPCUxAqF3VCYJzaLwHEhSin35o/dXl11+qt57w1eOsSM4ougW5lljLo3
 W09Fm2LdLzwnhiiXw/e0L3cEUR5xkwELGhNksqDifiQHJ5gJHBN0e37QQUl/lwQPHQEV
 ZemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUI62iOUljGBICelPT/HeQgi8+XFwHWZxTIpml7ykIY=;
 b=CJthOAS4nTfJMCk4+3ksJtKJ/G3Wq/Av7+eBCX9WMxknJYTyaS6rAI812AANNeWmvD
 wwPNh+zGwwmVyKJlKHQ0Jo3oqOmOqQOEb9s+JmZXQh6uGZ9Uj6es/Yu1Kssv+QvC3XZ3
 eNCsU97qsAVw0yfJ14A1HlT9bKwk1n++x/nYNw7+9zDPzYQYP7cOjRnA5xRcTGqEmd4c
 fkfuiRKQeQT8L9tLlsAVkD0ojLpwoO+xZnbyuCALT6K7/bGTz0GBi8d5jyIi+9n14Wmx
 WUyHTYVkZRLjjAue/Dy8pvmzOZDp1NoyZjcFZuHaIWSgte8YtDV0iStnDPTZjmPhq9iA
 cqpQ==
X-Gm-Message-State: AOAM5328OCdP3r6rt04CikL09+GrnPTKjj9oh2oNCuDCGnOd8qVyk9I3
 nDDr3oQ3fesSFfiTOmzYFHw1gsI0yG4=
X-Google-Smtp-Source: ABdhPJwKsLXN9vZI6DHgytzqOkPrbnNEtBROxLr2MuWq6NEcTnFmqnAIyb4erOeUfXdXYtykFuEwAA==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr14580625wmc.96.1623323456894; 
 Thu, 10 Jun 2021 04:10:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id w11sm3021474wrv.89.2021.06.10.04.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:10:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/fourcc: Add macros to determine the modifier vendor
Date: Thu, 10 Jun 2021 13:12:34 +0200
Message-Id: <20210610111236.3814211-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

When working with framebuffer modifiers, it can be useful to extract the
vendor identifier or check a modifier against a given vendor identifier.
Add one macro that extracts the vendor identifier and a helper to check
a modifier against a given vendor identifier.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f7156322aba5..36771d8ffc4a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -373,6 +373,12 @@ extern "C" {
 
 #define DRM_FORMAT_RESERVED	      ((1ULL << 56) - 1)
 
+#define fourcc_mod_get_vendor(modifier) \
+	(((modifier) >> 56) & 0xff)
+
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	(fourcc_mod_get_vendor(modifier) == DRM_FORMAT_MOD_VENDOR_## vendor)
+
 #define fourcc_mod_code(vendor, val) \
 	((((__u64)DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
 
-- 
2.31.1

