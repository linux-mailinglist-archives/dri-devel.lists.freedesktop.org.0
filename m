Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909BCAAEA9
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 23:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FB10E113;
	Sat,  6 Dec 2025 22:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IUQ3rED+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107A10E113
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 22:01:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-297d4a56f97so42161105ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 14:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765058460; x=1765663260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJqmdOIxEw8eLWLXbkfWEh7lb6XZW8BGJO73kS58WvE=;
 b=IUQ3rED+zpAaF0aw68ThzKZeLRH8DU3Paz7XAPyaXfryq136r7wrw3RWCmGEkTQkPD
 XugNaQjZHvdjym6w3R78AlYGAmd7kZ6lKgiqOQGUYBUhv2pse74y81XQgues1WlQBZTs
 XWqWc5kHzzhdkZ5VkM4gO9cmdOoWHyUqEtX40G8CE2pO4fRtG1eh7fEFE3L/jubONv/R
 4NGqOHTqvP4sbXif3Yu23aEfB7ymKLF8qnm6r1fBQ8b2utB8dCA+fjGttY2yWu2FNdPe
 FKjmWABi/aGSVcdwFjNNROejZfKXKG2IVoCevAYVblqY2JINr9UFn0KZliCTrI0ErA5V
 4r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765058460; x=1765663260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJqmdOIxEw8eLWLXbkfWEh7lb6XZW8BGJO73kS58WvE=;
 b=GChjmFB9fd5cfS59GyDtTjjPYbzokMVjXIonnLNMAgo9G2tEuuId3511SugsKn5ELk
 +UhxXQ7zklFmHtA7U3sl5Siv4MXcwCKTeb9aA5Skf8Tm10MJtLc5nxXb2ZAaxudnZWLY
 /+x8F6e0WL6oiwGCli2TjvIuqaaiVI0gM4j2lr9xoz5azAAPZQAe97FWS2gS2XFx9/7+
 Rn7BIIf15ou3+cZBLsKhi8Zxs2QiT0W78gP67GZgZmqA7oGZt8vbNWTzWOYiJ5LhG4iG
 BvdGVkL1sK4hncnrQIxj2CMwekntLKl9ypADBczlkhLlCqWB+jmnLkf7RpEOIj+PFj6T
 dBSw==
X-Gm-Message-State: AOJu0YxE53CYP/u+cCFyhFrNCI0ipEqjPpY0AxdDwu1Okw3BMUe4xLkz
 CxjRgG0fUgjHp4mdY9wnxOaKSJ5VUdOGXuwaoJH3Z/gCw3MjxR8eerC3
X-Gm-Gg: ASbGncuLPWMPZVOMO4/NHF3OHIzMbbWuu2+md7+ufqAm/XPtOEIdYy+kGUf7gSzeG2G
 a3OPemo8o27ZSG/9ixhdabNSpQAa23ffuF+O46OfiIdavu5jyUzwgXmCcgBTJPtq+sH1kNlDfPJ
 FokljMZeaQYw3RQgWADp+uGJ5fdTz+TdUtGb0WzLAjYtQOSq0fys6HE1iDL+bYVx3k1CQhiBrYU
 LZTT1huDyn/i1TPxef9ahsfW1R1noVCDYU0owtZFLOZBZxgZ0CqgnRzVw8j28DuxMO7UDu217Fw
 hXFjhL5LSgxkMOJnydCdUdramPmZUvayBtcb7L9L+oxfTI2rAHZdRmeiIXP8jRFXdgZIivt1i+T
 653QJNR8hVTFKEn+VdkekD5QnPLN6n4A2u0U89ZZPavoZlZop8SMQIHyzX8HZoAGgyyl6OqE6B3
 58zcNVpjZO2+5cwcKCvA==
X-Google-Smtp-Source: AGHT+IHJhC3zQ6XGABOCa/C/csyzvWYH8f/mZnTV0CIhv5r0IYn0ouFACeGSRAm+pqmZn78jscTDpw==
X-Received: by 2002:a17:903:1cd:b0:29a:2d0:c1b5 with SMTP id
 d9443c01a7336-29df5683ed6mr32782795ad.22.1765058460000; 
 Sat, 06 Dec 2025 14:01:00 -0800 (PST)
Received: from archlinux ([2409:40f2:100e:9587:f0e5:c788:34e0:f382])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae99f179sm84066505ad.64.2025.12.06.14.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 14:00:59 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>,
 syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Subject: [PATCH RESEND] drm/syncobj: Validate count_handles to prevent large
 allocations in array_find()
Date: Sun,  7 Dec 2025 03:30:45 +0530
Message-ID: <20251206220045.1403233-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
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

The DRM_IOCTL_SYNCOBJ_WAIT ioctl reads `count_handles` from userspace and
uses it directly when allocating memory in array_find(). and
kmalloc_array() allows userspace to request very large allocations,
which syzkaller was able to trigger.

Such unbounded values can lead to excessive memory requests, allocation
failures, warnings, or resource exhaustion paths. Add explicit bounds
validation to prevent excessively large allocations coming from
userspace-provided values.

Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
Fixes: 3e6fb72d6cef6 ("drm/syncobj: Add a syncobj_array_find helper")
Tested-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..f322b38ec251 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1293,6 +1293,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	uint32_t i, *handles;
 	struct drm_syncobj **syncobjs;
 	int ret;
+	size_t size;
+
+	if (check_mul_overflow(count_handles, sizeof(*handles), &size))
+		return -EOVERFLOW;
+
+	if (size > KMALLOC_MAX_SIZE)
+		return -ERANGE;
 
 	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
 	if (handles == NULL)
-- 
2.52.0

