Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06449B8E549
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 22:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB9010E16C;
	Sun, 21 Sep 2025 20:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iawZIsK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921E10E004
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 18:39:59 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-271d1305ad7so12545175ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 11:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758479999; x=1759084799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoB7cKQN4+UN4qFZ4riutgjHBwdWBXWlGksmHEe4AKI=;
 b=iawZIsK5JjpwtNOsaUwFCKeXydGYG+LGWBHVMgY7tDX1xU95uw0cdMdmKPycwQWxa0
 lzdi3oubSbU3mv+4EBSSi1VqwAJpHBEgWrcDVhd4zZX0YGPytxNhk5vL3zVuEsAZ+Shc
 CX1AHFle7upP8KAkXoZZ1NNUN/OqKHaZWeNBN3Gg8MGKGCbphxm5w8CHsavPKJJFNKEG
 GTtzFnpMCECoh4lShfF0QIHYIWpaEb5coCLN9nDO85bSjSt+udxoAiAux1uB4oFRwHDe
 V3DtWhz6P91/liw/o7MOFJowZ9L3X/QARHFkBbuqnrakARj9Cjn15Ar/GfMHxbJ93R4Z
 AoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758479999; x=1759084799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VoB7cKQN4+UN4qFZ4riutgjHBwdWBXWlGksmHEe4AKI=;
 b=gPOu0HPv74rTo6A2cKY1e6/HN2WricZvbAinosIWYX7v/q/Kr3syEZ4oo2vw6OjQjg
 VWdt57hJo7ri2mijBXXyFfoHp30dDYQt2IOO0TU+sO/ngsCSItHiU07pIaBHCRXpqWpN
 DvpYGnkzfwdCb1HsENDGM3VqkNH48/G3MpmyxhqyxcsxcbuvhrUX+PHuX+POMqs4BhGT
 xy1NiKfUa1TJj/Oz2tCSm7OvcBVhA9etHX9BFU8d9IMA7MbjJTejoIzojjAeHPeV56dt
 ho00D92EZPPz5DBuHdOHvd7T9Qh2rPzZOCjXe3kIsUZXiU8CCOiQxMaG7WF5IDU4VB49
 JjsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmtQpVzqH6PgBq3ESE3SNWlLCi+ibYtyFh+9Dwb1RcXV7Q+FTtgKKetuaSVwHEREbywjhHqjdqou8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpI7z0Sig7fn/+cR/pWGmGPeu/y0ymEimA1F69/eLALrD7k5Mw
 M559mvYUzzi7umXDojPamS0z0RZE4o5ECCW7qJtuCmdh8bdoR+tE5Chm
X-Gm-Gg: ASbGncvVkfS+88a4L4dqI59epm4piCE73ogZVLl9PhdE5IWrzHIjkgh12q5W0IAmoDe
 140PhTjyQrqioxi2X5Zz7X9gZX0PyETyWbEPFG78SChlYWzYtgObDk+kvD+Jm73CNDNxBmhKOky
 EUi9/A0NuNoRBGLCr5oBKiEAbV1Yedu+VQ5MQ30ErhkIylBvzievutb0zETYMDFpQFTZDR9dm2o
 tyyRTeELXEhQEkJ2UV9VmatIfIORvVEYApfLPvUmFFHU67zSDbho5fakXFldLLd/6e3cnHkvmTt
 MxgDfXKsfqZSRKOhtvlikiRuTY0Y4IDEmHaoX9X9B+4xs19voi3ZgRwJCgdzu+RYrkKmDJ7bFOV
 SJCUKg4YkfmP5RcYhQQ==
X-Google-Smtp-Source: AGHT+IGHyO6EN3VS1Dx3b+5swr3ajzqvhmea+cALQsD7c13Q589dV7pWvt5n7lRWNnlqSlv2oFO2+g==
X-Received: by 2002:a17:902:fc4b:b0:26f:7db2:3e1e with SMTP id
 d9443c01a7336-26f7db2410cmr91789895ad.47.1758479999035; 
 Sun, 21 Sep 2025 11:39:59 -0700 (PDT)
Received: from fedora ([45.116.149.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 11:39:58 -0700 (PDT)
From: rtapadia730@gmail.com
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jessica.zhang@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net,
 Rajeev Tapadia <rtapadia730@gmail.com>
Subject: [PATCH 3/4] drm/mipi-dsi: remove deprecated
 mipi_dsi_dcs_write_buffer_chatty
Date: Mon, 22 Sep 2025 00:07:22 +0530
Message-ID: <20250921183720.237761-6-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
References: <20250921183720.237761-2-rtapadia730@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Sep 2025 20:27:20 +0000
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

From: Rajeev Tapadia <rtapadia730@gmail.com>

The mipi_dsi_dcs_write_buffer_chatty() helper is redundant and
non-intuitive. It has been removed in favour of
mipi_dsi_dcs_write_buffer_multi(), which handles multiple DSI writes with
proper error accumulation.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 32 ++------------------------------
 include/drm/drm_mipi_dsi.h     |  2 --
 2 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index bc847ab5c822..c2fcc219cb58 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -926,40 +926,12 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer);
 
 /**
- * mipi_dsi_dcs_write_buffer_chatty - mipi_dsi_dcs_write_buffer() w/ an error log
- * @dsi: DSI peripheral device
- * @data: buffer containing data to be transmitted
- * @len: size of transmission buffer
- *
- * Like mipi_dsi_dcs_write_buffer() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
-				     const void *data, size_t len)
-{
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
-	if (ret < 0) {
-		dev_err(dev, "sending dcs data %*ph failed: %zd\n",
-			(int)len, data, ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
-
-/**
- * mipi_dsi_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_chatty() w/ accum_err
+ * mipi_dsi_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer() w/ accum_err
  * @ctx: Context for multiple DSI transactions
  * @data: buffer containing data to be transmitted
  * @len: size of transmission buffer
  *
- * Like mipi_dsi_dcs_write_buffer_chatty() but deals with errors in a way that
+ * Like mipi_dsi_dcs_write_buffer() but deals with errors in a way that
  * makes it convenient to make several calls in a row.
  */
 void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index e4d26ed7a62a..cda981a41bc6 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -326,8 +326,6 @@ enum mipi_dsi_dcs_tear_mode {
 
 ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
 				  const void *data, size_t len);
-int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
-				     const void *data, size_t len);
 void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 				     const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
-- 
2.51.0

Test patch
