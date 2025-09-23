Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A8B95131
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231C210E06E;
	Tue, 23 Sep 2025 08:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/TA7+Td";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C6510E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:53:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46dd8af697dso2661415e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758617583; x=1759222383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=HejTWNpWzxc6zcJhy00/kkFkRjULOR58cZ1QBwMT80E=;
 b=d/TA7+TdSH3sU+60qAv1FA2r+VK5IX4SAAj1yA7v/VrED2KO/4O7UJJ8++eWiEcCHT
 KggkhKrrh83pScFtuyZSDlCYm87Vs15kJAby/vBS8IQ26RtPS5rg1yBFzTCmTfWBEVY0
 3IGymHbfzQHB80ICO5bP8Mc3SVUwuEY+jSY204W11/tT9hb30ziVr8MT31t8tn/U1AWd
 r9mwfagtzHMuGJG7yDVQl0ronmXhTqDgIbWlitVLICe3TsJcDc7xAyWgM9b2rUMMzxgU
 S3FaG2Xe8oqMTtIwR/JCZxIgcRfh783bVUY1wNfPAKO98QauT8KpSVmPXiV8GYSYPAzO
 tGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758617583; x=1759222383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HejTWNpWzxc6zcJhy00/kkFkRjULOR58cZ1QBwMT80E=;
 b=krphc7OMdQiKmJcJy8P/vfOBDYHvvy9qh9fIc3kQI3RWlusiZtFPBAdsxmU2XTK7SM
 NSr/RA133rU5Q2wimSR0jp/DdXPIYcqEBhYCxrI2V31uQmxIiRwkFXOKnvMnRKPqtYhc
 FWoJt6pFBr1rjFM5wWOavDtqzzYxQ5CKkakC0Y317/z6hgBrqb6hhjN5ju12a0KXZ4NK
 UQEaMkKJaFMZKt41F/vGej/xgsBu5Qg8wAtcWKoaCkXWnSHcO33ZQVjoi2elZ90ciAUG
 LTO5N4VSvo5iU8sfSWQFVjYuSmn73vpVduccnn3VrPUQgs0TkcXFXCRlpxS3eRYhgTRn
 OqEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdIl7Qe0KQnj6L26o4qVEjsTppdRJwYyE/ynbLFshtL9XpVpOGhYrgNPp6auzosWqHoFH3KmAWK+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQk5Zzs25IP2SF1+zM/4b400T+oizbuZsQ4xO2ZOi1tMvgSo6C
 iB4BZKoNX/QDiFeNK2AQYGg86TVNnUHRuYVlfIvAsDg5Oz3FZEn42/or
X-Gm-Gg: ASbGnct3YsyBurHxqmFgHIeLLDOBdwTlFavJj9isWR3y21+/YT7aKlCz+e1/hyr6XPW
 UsLPyGjUrYUGZNGg53GLla92tQ58BIj2MdvrR6yuwhQAyyPtQR4BbUabUFmeMQonh2420K7I9m2
 iGiMq+g5WohZKRq/SEi+6GRQqR9z9hqIZgSZ6WGYUX6TSO2EqVLdbJo0yd0/xDVLZFrs3V3Q+9/
 cvHUkxgpq7dfyDHwpBnnqbihYjHsOtPFzbnmBljJLRps+0u4zjJx1zjqzgwhhRm5qTI1VnTBKkD
 skdCsEisSXfsqMYTT7QnxI5xnKzV4ZvJUxg5oYIGDo6oQWV8tdJPaZBHeD40w2cOw6TwwrPnc0S
 vD9J2PL59AZ3RZfAwccByFReDj3OWs1vYFHgiGt1qopfdc4A=
X-Google-Smtp-Source: AGHT+IF+pe+VjNamL550YfvLiwpzja5iPw2JpG5LSj5sevXgBPnDhd/LroHyEH2A+QZT+qzzkEG02g==
X-Received: by 2002:a05:600c:828f:b0:462:3c05:3c00 with SMTP id
 5b1f17b1804b1-46e1dac9966mr8681385e9.5.1758617582289; 
 Tue, 23 Sep 2025 01:53:02 -0700 (PDT)
Received: from bhk.router ([102.170.50.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d1f3e1b03sm81136945e9.23.2025.09.23.01.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 01:53:02 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de,
 mehdi.benhadjkhelifa@gmail.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, rubenru09@aol.com
Subject: [PATCH v2] drm/gud: Use kmalloc_array() instead of kmalloc()
Date: Tue, 23 Sep 2025 09:51:44 +0100
Message-ID: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
calculation inside kmalloc is dynamic 'width * height' to avoid
overflow.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes since v1:
- Use of width as element count and height as size of element to
eliminate the mentionned calculation and overflow issues.

 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..8898dc9393fb 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	height = drm_rect_height(rect);
 	len = drm_format_info_min_pitch(format, 0, width) * height;
 
-	buf = kmalloc(width * height, GFP_KERNEL);
+	buf = kmalloc_array(width, height, GFP_KERNEL);
 	if (!buf)
 		return 0;
 
-- 
2.51.0

