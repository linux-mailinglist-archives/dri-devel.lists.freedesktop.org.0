Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE7B03C1E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F2310E1F2;
	Mon, 14 Jul 2025 10:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UIChaCXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8216110E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752489881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNUt6/bURNRe9U6oU/7WSlTHdeKZKLnldCNgh0UMvWk=;
 b=UIChaCXlbWDhhYsiCkVGkxx1lnb51WtQCPBl03vfmMEhfvEE42G9Gho5tqy4qDGgYVFYon
 OYIYtgQKkdFEh8bHMkNr9C8ewyr7C3ei+KP2sTeDdXDjQWREm/VRmxwdnS1GJurPTmMhtG
 eu3MdPrGB7I+h9npdAOtN+YbNMEgPG4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-QIAuLu8VPxGWdU1UadA-3g-1; Mon, 14 Jul 2025 06:44:40 -0400
X-MC-Unique: QIAuLu8VPxGWdU1UadA-3g-1
X-Mimecast-MFC-AGG-ID: QIAuLu8VPxGWdU1UadA-3g_1752489879
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f8192e2cso2382218f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489879; x=1753094679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNUt6/bURNRe9U6oU/7WSlTHdeKZKLnldCNgh0UMvWk=;
 b=pHLNoxmoOV4PQ9CY6sO7nRQIYSyaZC/6GdvP5rLB3pb76fKm65WxzKIxEP2tC79sGb
 Bj37g/Dt5GIKHh+srBWq7UaFuB+m2lWzS9XswuKIk8VOcQ0Rwz99aBR5cQNIqwRbGYOO
 2WG3hn5++3MhfnyPbPWVzj5FElZkndUJcK5M9H6R8W1hota6/D0ZJtxpPc5LAuXOg2it
 N0LxcpqTOTy9XFlditaBoyPEwNdGJsRVz8VRcnhgxE3HQPnuZLREvKQcGOE+h0cNU+DU
 DrV/cOWdbtNBtC2piK6vUzasQ9HnFADrR4qjTuLm+Kyb3fpIhn24LcgvXXDmCPauZL8l
 zUaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaewtVFGfRiGpGfeRg+CSH6ZjyBGWeu07bbymt2YH0vrY2RvcA4N7D+cjzRdO/m3QjMvkjPfWGl4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvNM/tfbC0YHxtfBNVo+BoVd7Evi34D+tRm4qR2T4W0GUWU90U
 DYDYSv5AkTiFnA2jhJmiE06YEIiFqIvVte3mtOFKzEJ96SQFsMt0cgZ5LJEQqCHtUcxeUdvMO8P
 7HH2TmFaajMgnKptW6dN9zulHy0C0y06JWVURR4quD2jgBp4IFcIvbp4h+clu68cHPFbu7w==
X-Gm-Gg: ASbGncs6BQIJSfZGvBQ4Q54GRpk8A1sfxY3CGIbXx70pDgN8nyzfluw8ERNf4LQ84pt
 YDoLRw12eq6W0mAfbg/ikZig5h52rdTYTxN+RBBz3zoc42Z4ssmGac+wzFR4pPR8mtRRmk+uoVn
 aGeUFECMZLsbWonRKTAHBsrLMLoSrrcz7TykO4KscGQzvl3OfEf5P9JUpiHJI8SVnwy4es1xny1
 tI59pRZx7753hPbpvorGIwJz3PwjhK+KKPJElMDo555EVVdSvuKDKjUF+XGMYU8jr+7zj2yO6/W
 Pz++DJMJ2TXRJOZiejlfb8Jfzx03bloR
X-Received: by 2002:a05:6000:2f81:b0:3a3:7baf:f06a with SMTP id
 ffacd0b85a97d-3b5f2dfdd45mr9421887f8f.37.1752489878893; 
 Mon, 14 Jul 2025 03:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2W3lgSoiGCAE5rXtFzBHRvbFoJu2axAL5r6zaGdYjc6OVX8whs77OvmSuJ9iTy/37bnR2pA==
X-Received: by 2002:a05:6000:2f81:b0:3a3:7baf:f06a with SMTP id
 ffacd0b85a97d-3b5f2dfdd45mr9421846f8f.37.1752489878111; 
 Mon, 14 Jul 2025 03:44:38 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1f4edsm11880604f8f.83.2025.07.14.03.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:44:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/sitronix/st7571-i2c: Fix encoder callbacks
 function names
Date: Mon, 14 Jul 2025 12:44:00 +0200
Message-ID: <20250714104421.323753-2-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714104421.323753-1-javierm@redhat.com>
References: <20250714104421.323753-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2SNNJ-dTeaF8PKwrlHGvEohaw7Cyc7pQCu6N55U7TVI_1752489879
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

It seems the driver took some inspiration from ssd130x and some of the
functions (encoder callbacks) were not renamed to use a st7571_ prefix.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/sitronix/st7571-i2c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index eec846892962..634b426e2874 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -550,8 +550,8 @@ static const struct drm_crtc_funcs st7571_crtc_funcs = {
  * Encoder
  */
 
-static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
-					  struct drm_atomic_state *state)
+static void st7571_encoder_atomic_enable(struct drm_encoder *encoder,
+					 struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
 	struct st7571_device *st7571 = drm_to_st7571(drm);
@@ -565,8 +565,8 @@ static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
 	st7571_send_command_list(st7571, &command, 1);
 }
 
-static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
-					   struct drm_atomic_state *state)
+static void st7571_encoder_atomic_disable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
 	struct st7571_device *st7571 = drm_to_st7571(drm);
@@ -581,8 +581,8 @@ static const struct drm_encoder_funcs st7571_encoder_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs st7571_encoder_helper_funcs = {
-	.atomic_enable = ssd130x_encoder_atomic_enable,
-	.atomic_disable = ssd130x_encoder_atomic_disable,
+	.atomic_enable = st7571_encoder_atomic_enable,
+	.atomic_disable = st7571_encoder_atomic_disable,
 };
 
 /*
-- 
2.49.0

