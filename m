Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1109A135F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 22:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3010E769;
	Wed, 16 Oct 2024 20:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ee6OGQQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B29310E769
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 20:08:14 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id
 af79cd13be357-7b115d0d7f8so111435585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729109293; x=1729714093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xo/VBxOKFH/TmGJuUnZWn7QS7QFDBk9dtLuBtP6fhKE=;
 b=Ee6OGQQyLfB8KqkVCLlAPTiWXfWUnLFQ+ftMCjwzCAeENtHr85/m6iutJ1DcZx47Kp
 0lNXi0oIjQO3Q2xhBUYwfAokFJTdunnDL7LKjXskWWRdc3Q/YwE8Y/sKdGVSzrdwmFAv
 XB22rS2fjXt1Ha5ofWwJn8aHdKPEN9yhkn40xlLt5QJXkuZ3kz+Jy2TZrbm+TkQ638LO
 i9uJ9r3G+HNV2NWozlMikHxyu26nDGy4Hziicv+Q457xyAI3yNitwsQkThoUy2dfmFTJ
 t2yJHeJQfnirlvzqNZt9fVeik0buRY349fKw6OZUKbY0tsMDGRAagmCz9pTRCu51wqg3
 lV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729109293; x=1729714093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xo/VBxOKFH/TmGJuUnZWn7QS7QFDBk9dtLuBtP6fhKE=;
 b=BsawUWQxsgoj/rbcNYgO6vhLex4K7EqmmSa8VOD7O8btxc7uJvWxxtk05g5RU5tvh9
 uXH1UBDwpFn+zbMLQngTsmRtU+Tn91nST2w5uy2wEzAqdqcF2ZA2u1f/25Xb1Ncdh3mL
 9JhHxKVeqwrOa61+ZMh3kymcnNb8/BFhWinK/wloi6ApvWG4cU230av4dIpQEizfWmMS
 KySEmOxlImED7tH4dSgcdsj/sNxDlZzk/Zy5eQeEwEglm1WjcaOKnoJKQoCI+0u/0sjq
 hKO+KcTKQCDOtcjndlp1846qcWvQfkjT0tmlYeu8OOq+g5+oVcN1auC/LmJb77Qbtokb
 zwPA==
X-Gm-Message-State: AOJu0YxjuJJU0NeVvz1NE4robptZr/Oq7hDM+4O8QZWsaF5RY/kC9DND
 7uGMluWuS4TiwULlJ08G9UyyY8cmVutzoJ9BytFF0V9HpOC4/IU2
X-Google-Smtp-Source: AGHT+IGqzpMWnAtWSKXsmhZf+cVv4uS+uDJF6vqc9SzgpRrXL8Am/lH5oizptIoGSFk3X614I1khTQ==
X-Received: by 2002:a05:620a:3181:b0:7a6:6b97:4da2 with SMTP id
 af79cd13be357-7b14d4f6069mr131156685a.11.1729109293178; 
 Wed, 16 Oct 2024 13:08:13 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b136397252sm223113285a.80.2024.10.16.13.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 13:08:12 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, markyao0591@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, chenyuan0y@gmail.com,
 zzjas98@gmail.com, Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/rockchip: fix potential integer overflow in
 rockchip_gem_dumb_create()
Date: Wed, 16 Oct 2024 15:06:55 -0500
Message-Id: <20241016200654.13472-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

There may be potential integer overflow issue in
rockchip_gem_dumb_create(). args->size is defined
as "__u64" while args->pitch and args->height are
both defined as "__u32". The result of
"args->pitch * args->height" will be limited to
"__u32" without correct casting.
Cast it to "__u64" first to avoid possible
integer overflow.

Fixes: e3c4abdb3bc9 ("drm/rockchip: fix wrong pitch/size using on gem")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 93ed841f5dce..76dea12fe394 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -409,7 +409,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
 	 * align to 64 bytes since Mali requires it.
 	 */
 	args->pitch = ALIGN(min_pitch, 64);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
 						 &args->handle);
-- 
2.25.1

