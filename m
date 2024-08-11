Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DA94E1A1
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2024 16:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0517E10E037;
	Sun, 11 Aug 2024 14:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fieRzKew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2404D10E010
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 10:26:13 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7a1843b4cdbso2410366a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 03:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723371972; x=1723976772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/VrMQAl2Hs8NqoMzMBNb3FrFT3TtFUbe/Zaju8CjWfw=;
 b=fieRzKeww1QprmSe5a+WFCfnGGAfCJLhL2BY3cfEwuNqxQxAG7hdMwVUSUugsiwRyr
 dXVuVzbGVtVXoH/37dxyRCiYziAPE1co3k5Dp49I9AD5pX3b+5FQ0lbueHxOCf10aQbq
 jUmOo61nrn6XBx8/zEFHHSV4jKcEfhxh9i96a7DukGyo9X8Q7TjruTfpqCqRYzJx2MLD
 q4R1hc7wxB0pQtUff17fZIlXrqH3hObbTdlIkyGf3VwfIuy/ehu0Ew7b8Bk2n54AahBk
 SQB5TKNGEcIH2QTCcUZ5OWnkjbsgMRW3DWlwI8m4B2RgHTuoJjqHXsVtC58xZYZLPRyS
 vvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723371972; x=1723976772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/VrMQAl2Hs8NqoMzMBNb3FrFT3TtFUbe/Zaju8CjWfw=;
 b=m2InWqeO1oUWhYdnNy745qikprRatZvwHRP+UhUBiQKKniHzs4iV8BKpOEmalj7Gkb
 rCoiFWEA9cuynRXHE3kp35RMotQqeT03IXbNlOfWCP3XviInucKKvAh0eJt1pJjttKbq
 tan0Q/J29skvMZGA598+m+ZPlJsHOh7R8GkfOvE2ES4lrFOlaIIWStDDZELx3QHMFwti
 vEx7tdp7DbJsv9566cxL6T6e3y1xy5etrJxV4/ql+ulBh6UBsFI7CzgSLnjOBCkUgb8A
 lw2IqFKD9IOtAZzjy7GesbGhxUYq6IokLs4pBvPQ2sWL0nPnSurIt9l2WGnFfvaVyR8y
 Fwbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXttXDGyb8sB9i4TH6tlgR6ac8BKxoY5TqGAI6r6fmE07KGQEkb/il7u2ZQ7MUqqGI1w2kJTbaI8uuOhU08lKHzHEF6t2TujB7XdfnN98M
X-Gm-Message-State: AOJu0YwPHsUgZEFU0H8aEPYzr9NLpFJUu1VK7atj1hp3kE4P76hEoGQM
 +tLmWdI5+C3q5wa6pv8EjsONanXVME+uz35mWi1G/UJcMvLGb0+I
X-Google-Smtp-Source: AGHT+IGceJgtvbEHrAhmOy3u7lAjDJxBa1LGz4pl6v6wY9aVymYthfS05cwQXQ+Nci/28SSEZGMX7w==
X-Received: by 2002:a05:6a21:670d:b0:1c2:8af6:31d3 with SMTP id
 adf61e73a8af0-1c89fe7208bmr6481901637.10.1723371972094; 
 Sun, 11 Aug 2024 03:26:12 -0700 (PDT)
Received: from localhost.localdomain ([49.37.217.20])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710e5a8a456sm2217670b3a.165.2024.08.11.03.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 03:26:11 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Add missing documentation for struct drm_plane_size_hint
Date: Sun, 11 Aug 2024 06:16:51 -0400
Message-ID: <20240811101653.170223-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Aug 2024 14:17:05 +0000
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

This patch takes care of the following warnings during documentation
compiling:

./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'width' not described in 'drm_plane_size_hint'
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'height' not described in 'drm_plane_size_hint'

Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
 include/uapi/drm/drm_mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b8..c082810c0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -859,6 +859,8 @@ struct drm_color_lut {
 
 /**
  * struct drm_plane_size_hint - Plane size hints
+ * @width: The width of the plane in pixel
+ * @height: The height of the plane in pixel
  *
  * The plane SIZE_HINTS property blob contains an
  * array of struct drm_plane_size_hint.
-- 
2.43.0

