Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D76C3917
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 19:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5510E26A;
	Tue, 21 Mar 2023 18:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2453A10E26A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679423063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1knlGgYN2VT/JtfLiS27/wQuiH/G9YJjnb0AMKUk5yM=;
 b=Zh6WQYmJGu+2l/xfhtO4ELN1fV0qW1iaujbHbVUMnJs8K5rrPj/TP6UNAEMQydJeDMoxX0
 AdZqWqEUiqBkZTMzggX93CY/UUu8zfnlV7b/inhlZezLLZsCY/PbWcAROyyW1UX30gzN+Z
 HhuCiCuIz6DHtZmi69m2FYnc+bSBTC8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-gpKG8yfnOo6rXS9GHR_79Q-1; Tue, 21 Mar 2023 14:24:20 -0400
X-MC-Unique: gpKG8yfnOo6rXS9GHR_79Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 dl18-20020ad44e12000000b005a4d5420bc6so8052702qvb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679423060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1knlGgYN2VT/JtfLiS27/wQuiH/G9YJjnb0AMKUk5yM=;
 b=QZlUfFXwQG4IPh6pH6Gg4SfNA5PmvmMkb1Ltf/KIS9gTxoiTHVKhlZGzpHHQov9pw2
 EnV3j/7EZLTdOWxhh7ZtM+r9xZxjKn9EC1lXxuHdIF4qp9U2wy9EZNtWrKnhc9zwVA7o
 yq1OZqEco5y4zjvhgdUU5Sj4z9hIVnMG3RqpyGs7X3RpqLQfWXcoUF8+V9j4sSXCvpDx
 g2NNhZ0zf+E/AEoZ09Z7Ndgv5l+7TDKFKElqK+dACLlHMKBgcdh/pHcp1mH3FrLioDts
 45q6dNq51z9i87Mpz6IMag6kS2Pwu5onUgCfgMpZU8n9piGWvtGYLxjfXnmc0iMXQbls
 oHuw==
X-Gm-Message-State: AO0yUKX/f/zUjIuIf3SjxvBdjCQJ6r8gahz5ptGNv++6p65ukjqnyuam
 vj2pjIHQ3uTUemAjvo924t4WIG6BYrRGLCJ1NV1HwfRD/E1wIyXxPIKPRmLAcFw7ujuAHDVflcC
 oIgurucm3cDanxRHEmtF0ZsiC9j8K
X-Received: by 2002:ac8:5a13:0:b0:3e3:8392:a20e with SMTP id
 n19-20020ac85a13000000b003e38392a20emr1818989qta.11.1679423059991; 
 Tue, 21 Mar 2023 11:24:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set+dI/AIvwoRVUqT1YTTXfDAONNxagr+5GYbKtG20x4g1N6bckO9liMnHnzF2jPTXjsqnR44fA==
X-Received: by 2002:ac8:5a13:0:b0:3e3:8392:a20e with SMTP id
 n19-20020ac85a13000000b003e38392a20emr1818956qta.11.1679423059754; 
 Tue, 21 Mar 2023 11:24:19 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d18-20020ac86692000000b003e386bb1566sm822618qtp.31.2023.03.21.11.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 11:24:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
Subject: [PATCH] drm/vmwgfx: remove unused vmw_overlay function
Date: Tue, 21 Mar 2023 14:24:14 -0400
Message-Id: <20230321182414.1826372-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:56:35: error:
  unused function 'vmw_overlay' [-Werror,-Wunused-function]
static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
                                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index 8d171d71cb8a..7e112319a23c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -53,12 +53,6 @@ struct vmw_overlay {
 	struct vmw_stream stream[VMW_MAX_NUM_STREAMS];
 };
 
-static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
-{
-	struct vmw_private *dev_priv = vmw_priv(dev);
-	return dev_priv ? dev_priv->overlay_priv : NULL;
-}
-
 struct vmw_escape_header {
 	uint32_t cmd;
 	SVGAFifoCmdEscape body;
-- 
2.27.0

