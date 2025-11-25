Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5447C85D33
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 16:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC3D10E43D;
	Tue, 25 Nov 2025 15:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SxdtE+mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0656610E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 15:47:40 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-657044fea68so2288217eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764085659; x=1764690459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vwd7GiN0LhHHn+1+8fCmutdytRAkrux2QdVf0iABeVI=;
 b=SxdtE+moJwAhGbNnxnltRQoGXs+x9vyE77cpjUT0Z2lSWuBJTJdDrrCbhG2cVSUR87
 w/hel1gvSdIQqUyx2lIhxXalwEE/LEtCXRPESocZ/Hf+1KSJQCHmrzC7VujxZnmeD9+G
 SPz39f5TxqfsM3AS0TgGcAw+87NItrpwBrhEnRjuHIiY/F6JGnsxDzMjvHKGLXOKW39g
 ggrTtGsJ4/EbWFxxcWzZJzAaHXXSNVGjb6gfQ1sNcfM64c06ztXqvmFwSnPLgNi4aOrc
 B0250+lZnpg1pukfXizRXvv+B/eFBFrQDFaYdrnZ5lSRMVN8LdwWfO/8osafGPmhnSQX
 0J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764085659; x=1764690459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwd7GiN0LhHHn+1+8fCmutdytRAkrux2QdVf0iABeVI=;
 b=n3Svy2hls+e6yzekCrqKmcc90Al90lvxFe8yrV4gbKFfxJ8Ys3KM/R/KQLHjtTQvz5
 noKV17xzU1VQ/HU0KtHVTzqb9wXeWC/Ix+WXolA65sG6p6dCHtZEwttxtdHmQhopRUXI
 fK17tym4oIfTdtq882483UJJ1Ck5RHdWQXkgcnBbgrnonvnSZYU/j4iKjpzWjozY5OdR
 0sS03Dvsfmf5pIZH9/YX3w0uIHmcUFA7szEtK/XAUBBoyAnsWOlBOezF8SpM8VfO6b+m
 2B+2Jt4kzXhqWKQDSh3/EV3i8Yt4p8pS6qKPp9jco5uhhj1UHLuMV0tY28QHP5hb95p3
 RC8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7OxuytZVScBcmb0Y7XCKp1GXNWEyIzxEFUuJDFJhpBGQHd2sIWh1VkhY7E+1lNTFeHsLWMuEYE/A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9Dxbcu2X/jqEJvWIHEwmK0P7mCkyqZ8UP/X9D31T7q9ER9bTB
 k/TzK/oUTyFEyP6wK/fStELcnEgYRVhj22cSPDkemDm5MxHwnsUxA42O
X-Gm-Gg: ASbGncuYLAgcBB2rrmL0wCoTZKiBQgXLGGoB2oXiDoo26YPpiybozo/n3ctgnolW/kR
 8jrzalzHH6XF8FYSjzJiddK7pj0jGnkZD86Y5uhI2Zlc93jQYvnnNrGO0WNRUZiMG5iAXUkZO4t
 z0L0niWoTulpDVloWbDgnEFVyNp2MmajJGwjR8FO+OOWISx9t5sEqFkZqhhQenDyA3SAXm9TZXW
 YlzHcTIV0e6jeXOdvH1lsaz3PtbHprb4bdA6gIHEllbvBLw/qivHk6P+O0M/TOtdirgwKU0Dcjy
 8MWzd7Qiy8LaCnPpD3XZ3XShLlQ9xDo4wzcvs8RoBpOhZloo40PVbzPTbk+Cq9Ke7oFQHMBOQ/k
 mSkh3eWYwMXcen7lyTGJGlhs9hRAYrX2yZ0NnhUZqEqZELwQyUyeeYrh1L6f4EO/THzTXDY/GQH
 RM+Xb6huDNl6QqysYkcM/fZuUn+lEI/+Q=
X-Google-Smtp-Source: AGHT+IHiuoQZzYWwy314lRsUMafz3cwaDnTm31WJbXtW7FkNI3HiSFHTqV00n0ZzdvjwbdNNHFnnig==
X-Received: by 2002:a05:6808:1926:b0:450:cd83:80d6 with SMTP id
 5614622812f47-45112af3534mr7396381b6e.16.1764085659162; 
 Tue, 25 Nov 2025 07:47:39 -0800 (PST)
Received: from SyzRHEL1.fyre.ibm.com ([170.225.223.18])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-450fffed315sm4633108b6e.21.2025.11.25.07.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 07:47:38 -0800 (PST)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: lyude@redhat.com, dakr@kernel.org, mripard@kernel.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: tzimmermann@suse.de, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] drm/nouveau/mmu: add NULL check for args in
 nouveau_uvmm_sm_prepare()
Date: Tue, 25 Nov 2025 07:47:29 -0800
Message-ID: <20251125154729.434072-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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

nouveau_uvmm_sm_prepare() passes the uvmm_map_args pointer (args) to
op_map_prepare() without checking for NULL.
Prevent NULL deref in op_map_prepare() by checking args before use.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 79eefdfd08a2..7a33ce63770c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -627,6 +627,10 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 		case DRM_GPUVA_OP_MAP: {
 			u64 vmm_get_range = vmm_get_end - vmm_get_start;
 
+			if (!args) {
+				ret = -EINVAL;
+				goto unwind;
+			}
 			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
 			if (ret)
 				goto unwind;
-- 
2.47.3

