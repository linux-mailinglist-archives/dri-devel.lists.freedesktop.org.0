Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF053D80A8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD016EA8A;
	Tue, 27 Jul 2021 21:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1346D6EA7B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:07:01 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id j1so1815997pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RRl4QwGFVHrrGOIPdMRW7d1sxZ/z0xnxJ3QgfuV7q+Y=;
 b=VLdolfVHCXSWi55Yx/uNOx2x9gNCjcm8fAuonyRhF6lka+9tJjMC+ljSDw1I2hhSPl
 IPeW06Di2elnxoPtiM8a7tbufyY5DIpbj0wKJi28F7I97+I2C7r+CBhjZpWfsMqRUJOq
 uPrEwdOtDaUl+C26xZmgSdL3xsdhOztQ/ekno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RRl4QwGFVHrrGOIPdMRW7d1sxZ/z0xnxJ3QgfuV7q+Y=;
 b=Gl4Hb1wdidEwB9mRTuq2SMIVuo0BubbUf5scYOtTnYVABThr9fPNaDNoUkMP7BZizb
 KMdYPGbnIuykYYahXFSt91UWsDkQGLzaJmW68gTFyoLwEF2wLvqKe9Uu7oKYqV4zWwEP
 yAwbFmirAymslg6SZ3ctazSeGiHezre6Sah4mLk/EceO/OZAdHVqbWRpiH0KPdDHfawm
 CqNAIPOLalX+QYuJguTU6wMBX30OFyzzrw3p3HvpQiyqlw4xSrY66BBJd0cQOU7plKP0
 a5AG/10YXuuaS8nAypKZw6C2r10U0Ff/cV8wkmHF2Fcq5pWbs87uoF8O1JLo7f8iP0Wt
 Id4w==
X-Gm-Message-State: AOAM533Ggd+EQvoK8WEVTItKCVvfy65s4kUhinEzRsFJplXNNdvk64+v
 xGyfUdHZY6yyIHoyT3Nm0ET30A==
X-Google-Smtp-Source: ABdhPJz1O0RCaY6YxEHXQjrBeBf6WlvQVtA9lzuclsJxgu0ny8IwFRemKEhaTqFBHWHY+58Ad0sxsg==
X-Received: by 2002:a17:90b:1097:: with SMTP id
 gj23mr24623197pjb.65.1627420020773; 
 Tue, 27 Jul 2021 14:07:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k4sm1283492pgh.9.2021.07.27.14.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 53/64] HID: roccat: Use struct_group() to zero kone_mouse_event
Date: Tue, 27 Jul 2021 13:58:44 -0700
Message-Id: <20210727205855.411487-54-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; h=from:subject;
 bh=EUTv4O0nvngYWbdXtF9deGR2fwqq+6xUthh2+Rv4aLw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOMI/KVhJIquCmbVDokB41QtN0+bK1f1n8H1BjO
 /vI3XCGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzjAAKCRCJcvTf3G3AJigBD/
 4xOpohWQjjZHlbRQQB4Xc96JEF9UrR/87ufDJ/LQCR9f7bpU5HN4prxvGPl+Gh14S3nTWDhs7tQLV8
 lgvttBveo3P3wp1AEgc84pleIWnY19RV8DcusmvreDhDG62N4MMW91V+yoqBuqB34xAxKaVJ0z6h4X
 tMH1NjPo77yLscB15GrJ4m3R/aS/iaccGcVUCwTR/CdCDoI/vLaImBCCH5YwQovtUmT1k04HUparAv
 jTs0fwcc1LfmJGkpT/YOIJnJ2shh0qAzEBKxdHgAIYE1pJJ59NQ6IfNzbMcQzEeapQ0p+kJRjODNpd
 oBpl+VAcjcyG71c3NBYs64mHgmd7xQgqxrKHeTTPI73krFkwv0sjaz1tYf6t3wGr+MJBryeUc/XLef
 bBUhQQ+U2nmjxMpH5biZuX8R5fJd8K2A6iOdS4OCIgCexMIqdOf47mtYSGy6w/OqX0D0HulkNM6Ak5
 /kO3TY/+btKVuq9e6QW5DQLMbCfCbRrCJHmWxOFI5GVH3bchbtyGtVnd5VCwHQJhG28UCjTcKMLd10
 3FKyVUcll/fy3asrDwz923cHSGawsRdwuUUF+B/1A93hUfh8ZPHnbv0X2Rh95SGmSNd9p793a13Ftn
 6BVstROxT8kaLKdvZkdDDu6WqpqQxHglko/wXhuVc2rwuMX8jO3UGuzQBK9A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct kone_mouse_event that should
be initialized to zero.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/hid/hid-roccat-kone.c |  2 +-
 drivers/hid/hid-roccat-kone.h | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 1ca64481145e..ea17abc7ad52 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -857,7 +857,7 @@ static int kone_raw_event(struct hid_device *hdev, struct hid_report *report,
 		memcpy(&kone->last_mouse_event, event,
 				sizeof(struct kone_mouse_event));
 	else
-		memset(&event->tilt, 0, 5);
+		memset(&event->wipe, 0, sizeof(event->wipe));
 
 	kone_keep_values_up_to_date(kone, event);
 
diff --git a/drivers/hid/hid-roccat-kone.h b/drivers/hid/hid-roccat-kone.h
index 4a1a9cb76b08..65c800e3addc 100644
--- a/drivers/hid/hid-roccat-kone.h
+++ b/drivers/hid/hid-roccat-kone.h
@@ -152,11 +152,13 @@ struct kone_mouse_event {
 	uint16_t x;
 	uint16_t y;
 	uint8_t wheel; /* up = 1, down = -1 */
-	uint8_t tilt; /* right = 1, left = -1 */
-	uint8_t unknown;
-	uint8_t event;
-	uint8_t value; /* press = 0, release = 1 */
-	uint8_t macro_key; /* 0 to 8 */
+	struct_group(wipe,
+		uint8_t tilt; /* right = 1, left = -1 */
+		uint8_t unknown;
+		uint8_t event;
+		uint8_t value; /* press = 0, release = 1 */
+		uint8_t macro_key; /* 0 to 8 */
+	);
 } __attribute__ ((__packed__));
 
 enum kone_mouse_events {
-- 
2.30.2

