Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6DAB47802
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1C010E3F6;
	Sat,  6 Sep 2025 22:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="efddJbbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAC210E667
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:21:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-329b76008c6so1333517a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756812111; x=1757416911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
 b=efddJbbOI+Z/yQJgREVs7YT+oxT0hu7ty76YtgVCywCv0DElgqm2cdymFWZxlWZGoN
 rxMqF564uLN5kbh7rqU3Knmtoi6SOaRFcPIfceD7tqVN7/2+GfdbW8TQoUwwP4la2TEY
 47ny5BTNcQR1mMEVOeFjXjRBplQjfI2DvT29TpHm/XQ05YJ/RxCSeMS2+uEEDfPNyOZa
 4lra/mxbmHPk+jGJkHjcc+sLLhhd7GC0kasWjbuDRVOKFklNv3oZD3CE95+XIyZAxKzI
 Hzuol3bNuEbuWAaGFuvg0HSgFjZNl56Ibe5zYqg2KgjRPCNvkmMqWP3HX4zAmUxdDy6q
 L7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756812111; x=1757416911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
 b=UnX8e0ve8Bf2jobRUNL6sn5IHpz2gwz2W7pxhBKOISFdqZfG+xYfyWDQES5dNWMwBR
 sNrJ3QzB2h5EHtpS1QYhBK1AkJBh2/xhJglLjYjivxMAGcglxKmqP6dyMgMT+2t8Td2/
 521+yxxOWnQTFJfybxeB8VHAUcqoP/ljR7W89c+HnKet21k8ONBc2I7OFsOg7aMWujHB
 Iq4fpHfpsunmsz2bD6na9RV43a6KZ6bJMtFTvvxNa5pKvL4IhL3gwVr5sTyRYus3EhgE
 Niv0syWq6aqaMwbBWBuvcQPb6oh7fawFHsq62M1momffOl3kllgz3PuAXhEBv29X+Ocz
 Pa6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+uUNUYiH9otVHWpbbLG6O5MbLul+cuJIUxImrCKTwtwc9ELQqTsVE27tidLCndMdDRiWm3LG3eI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfJxyMyIQg1S8DWDoGDhDf5ptka+YbFbyE+ymE8uBKdW0wqjqJ
 cfH2M90xu1riZjtxNk0kjkJZyNkEd/mxlg25sJBr5/LbMMuX20fDxKfWrZ3+jots
X-Gm-Gg: ASbGnctaON/0YJPco1jv8PeabvScePObgD/4ZLFdKlUhkRbXcB55eSy7g9U7TR8ggUl
 2LLqcoiY1zXwImyyVFOHfNLdH50MhQAzI5eLiYjVt/Lu5RMK8XJ/Jks5RVxoOnnlCg0DxIPGByX
 KEO3stggmZhtLDWab8N4kna8cQulwnAbierP1iaVvHfLTqsgf56E2S+TqUPG2JEwhLCmS4+URM+
 IEzU9kO5+CDEmNkhIvDmLjkH6Vt0QZY39RggMWbpH3jldTzW6cikbEVG61NCuRAxZCPLFv7oGgv
 bgCJjZ1rRgO7yYx76mhiyrfyRav3NLEuw/6xzhYHmU5YuOyDDkciFaL6ZT7KC5ueWxAGXK85qmR
 SO9CuPvpGHZq0kRbHXPwP4GMOJWMiJNEsRe1NZwtBo7VB3kd823xkY0I0BqYK
X-Google-Smtp-Source: AGHT+IH1KF6DJ5OOOOe1l7ldEAlzXJxUIBb9mE6VlKXMsVGCI5lGE0+ieIjUzywYE4Fa9tCwx8K4LQ==
X-Received: by 2002:a17:90b:5587:b0:32b:4c71:f40a with SMTP id
 98e67ed59e1d1-32b4c71f85amr241852a91.24.1756812110843; 
 Tue, 02 Sep 2025 04:21:50 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:21:50 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: krzk@kernel.org, alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, aha310510@gmail.com
Subject: [PATCH 2/3] drm/exynos: vidi: fix to avoid directly dereferencing
 user pointer
Date: Tue,  2 Sep 2025 20:20:42 +0900
Message-Id: <20250902112043.3525123-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902112043.3525123-1-aha310510@gmail.com>
References: <20250902112043.3525123-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:44:18 +0000
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

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1fe297d512e7..601406b640c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -251,13 +251,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
--
