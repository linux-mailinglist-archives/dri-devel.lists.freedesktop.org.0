Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501644F9206
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C5C10E170;
	Fri,  8 Apr 2022 09:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7723E10E170;
 Fri,  8 Apr 2022 09:28:01 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id h11so10696457ljb.2;
 Fri, 08 Apr 2022 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HgPZP8og8WpumzGAAXJPVekArW+Xl/SXdvcjF73+2JQ=;
 b=gHyFWpI6t8tOI4tUOMMz7p3TQeEQDqT5UxoSqnTR71xyC+cPoQ8GFnBWCqBCSal1Gv
 orGbjTEbs5Qdnhj10PvndYzcZh0UVMaZe+wmduTGqUGHG0YhB4FCbUz4xzREn/6OgvIB
 RRzUbSssHiOya74amEZ+zJSMXm76gERDIhfe/FfCjCz0voIT39bcAsz6U5Myuv+Ajg70
 hApiOhfPlKHR8ZQArArd+uZwWAwxZky61FDeKAfW6fAnpeth1S1BUNBM0FSSyp8gaye0
 tpljYIPZAu814zQ9RtpevYuib5m+XkmRBK0Fj4nTCGordvFiVlbZiXNHMPSH0pclk/wL
 p6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HgPZP8og8WpumzGAAXJPVekArW+Xl/SXdvcjF73+2JQ=;
 b=3Pc/rTqSFr+LYBsNrhTPS+jr3avOiow0RLhWobGqJ4CM8p6rgFiLb8SwvijvKbJT2x
 EdsbCtzGlByyuxHTAMD9dflstDb+tyhRKVfUy9/F65drwVcT6Snxv0I/hvfQVlIUBxbW
 dcWSA8bOx4475gZwpbzklDO0tTumKL4LczLi6/dz9Pz3cyHwu4dPnXEBycX5sZf/UTsP
 MVYRR1hf+myuXzGp8hxIGRCxxYTolim+qsHNvpUY1kas2fN259uuiQOY2TRmFNHmqYjg
 xd1MHShudQrcmAjM2iPDDvq3kR77SlgqjxSZer6xhf7/RrKoc2hoJ0NMAfKEwAQub/Xr
 BT9Q==
X-Gm-Message-State: AOAM532rPd2EM9nkpgQ8Zb42qWciPT1yiW9FqOQjxKfViGsDlYupCBd7
 upMwpay91YwXjHRxwYZ1iPo=
X-Google-Smtp-Source: ABdhPJzDmYvPgxNYX0/xkMPy8fJo6IwLGDldkvZtGq5F1xWFOwxo8a5LnYST9iSx1XiFSCkTg6ybbA==
X-Received: by 2002:a05:651c:996:b0:24a:f361:1d9 with SMTP id
 b22-20020a05651c099600b0024af36101d9mr10971985ljq.346.1649410079474; 
 Fri, 08 Apr 2022 02:27:59 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:149d:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 u12-20020a056512128c00b00446499f855dsm2412451lfs.78.2022.04.08.02.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 02:27:59 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Fix NULL pointer dereference
Date: Fri,  8 Apr 2022 12:28:02 +0300
Message-Id: <20220408092803.3188-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Grigory Vasilyev <h0tc0d3@gmail.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code below check for NULL, but is no check at this place, which is
potentially dangerous.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index d26810e7311d..c773a92dd4e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1017,8 +1017,10 @@ static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb
 	int r;
 
 	if (!amdgpu_fb) {
-		*tiling_flags = 0;
-		*tmz_surface = false;
+		if (tiling_flags)
+			*tiling_flags = 0;
+		if (tmz_surface)
+			*tmz_surface = false;
 		return 0;
 	}
 
-- 
2.35.1

