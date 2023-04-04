Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6D6D6D4F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601410E795;
	Tue,  4 Apr 2023 19:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C8710E78D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 19:40:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id cn12so135138459edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680637248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L+bv+X+HUb7L5CiJGIhzyoiVMLKFlHsSpQjg6oJVXtI=;
 b=cYDXCCCUhljhT5VPYCL0i1wlKB9kZDxS20bKdGXohA3mKYc0j/VM8xuKBq++xsT/FO
 KOTG0d6xoIWtn15OGqzvEhNlUffM5bmo/uiCyflzgvlVsV2i35VpJGYGVSuDGn4c3Mdp
 NOWcerctpXLigN5ou2obCjphHR01ABKqLdzN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680637248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+bv+X+HUb7L5CiJGIhzyoiVMLKFlHsSpQjg6oJVXtI=;
 b=sAgWomB1fFunzFIUKEaepS/Z2U9EQBx82m/XtuEwWWp8zYM/CiHsYgmePJ6BEiRmNh
 gsem+khF1rC6IiM2C8wJPyiPe6gdqCaI9MJVz/3ihNxY4ZGQsXj+0Y3r1Re4L33jl+EB
 Sg4p+Mut/2aEMfUwhbjkD004g1dZaTdp95ienMSTWFpMDAa5nDsLk2x1GyanLFj69eiC
 krAnZdc3T8utDoFsyGknDEQVnigRA4WBCIHI/gAFwF0/W9e++wRXxQznjSZ4Njg0I57g
 6fYAmVDBvUer1W/IEEdj5PM9zP+pxsGXsnH2QYMdP2XxJjgLy7dLugAtBK+mzQR5vSql
 06Yw==
X-Gm-Message-State: AAQBX9eJ8YuLXELYnUQf/OspotnWea0SZcrUCO0yyQGE/wgv2+qBmn7X
 z4Z8ErdrVI2sQLjQ50RmmDfVcp7WwVkXwIlwoes=
X-Google-Smtp-Source: AKy350ZtXHF1TPelo6oE7RtQoe5ej7WiN9rL6H4LQHP7Ad2sqMbJJjjz7lkfoAFWB9Zxq2T2ONeuMw==
X-Received: by 2002:a05:6402:2811:b0:502:465:28e1 with SMTP id
 h17-20020a056402281100b00502046528e1mr4147038ede.0.1680637247791; 
 Tue, 04 Apr 2023 12:40:47 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 xb7-20020a170907070700b00948c2f245a9sm2472802ejb.110.2023.04.04.12.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 12:40:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/fb-helper: set x/yres_virtual in
 drm_fb_helper_check_var
Date: Tue,  4 Apr 2023 21:40:36 +0200
Message-Id: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers are supposed to fix this up if needed if they don't outright
reject it. Uncovered by 6c11df58fd1a ("fbmem: Check virtual screen
sizes in fb_set_var()").

Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=c5faf983bfa4a607de530cd3bb008888bf06cefc
Cc: stable@vger.kernel.org # v5.4+
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 59409820f424..eb4ece3e0027 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1595,6 +1595,9 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 		return -EINVAL;
 	}
 
+	var->xres_virtual = fb->width;
+	var->yres_virtual = fb->height;
+
 	/*
 	 * Workaround for SDL 1.2, which is known to be setting all pixel format
 	 * fields values to zero in some cases. We treat this situation as a
-- 
2.40.0

