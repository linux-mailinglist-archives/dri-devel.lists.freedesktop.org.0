Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E3B3CA82
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 13:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E5C10E240;
	Sat, 30 Aug 2025 11:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RsFH3H18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1226C10E240
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 11:19:40 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-771f90a45easo2465000b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756552779; x=1757157579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pVqaGLyW2hjILGHMEnChyv1fl5JgTpcDkORSI4hpfYg=;
 b=RsFH3H188rr8a7SQaJpL8Y3ngeM20T1zf7CdjyenLnCAMpIVud+blOCbMTXAWY35tE
 OseBDHPg8gdWxCLeWuz3Rwt4MCKRS4n9uuZc5AWMsV0P3laZgHYhF7SBa9Xm0lNWGJBa
 7UWlhfD6EDS1h3ibiDYp8Dq7RKqrZggvc8Qy3rJVUoKkhjpkqR7P4On88eG55IY8rHyY
 2M98HzgVIrMdwuvK9CNuUid99bLPGBXb+H869eRbXTHEDuZNkKWv5J7g2gKFVUuZGwUe
 pZRJi7vio0J1o+sFRucYaq/kh3S7ykL4L8jEzVd6sX1bN0v3W8RNuqXQnWeW4AYbWMbd
 p9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756552779; x=1757157579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pVqaGLyW2hjILGHMEnChyv1fl5JgTpcDkORSI4hpfYg=;
 b=vkJYzkT/D7e6dMu4jZoriXggs9ZMNo1sj9e6o75/UTzvQl/LD25qJCUxjX6pQVg69l
 PtCexaCOe/jtEwioPLhCb/lJI5hoP6KbMf2Ouvjx8ZUIZTmnfSyRsT2TMuVaTiyl0Zgy
 JckWVs3qnlZ57QBVvj93f50ZWMrPImXwT4aI5ZETA2jO1278KxcrYa5a7vwcJ2lUp3Nq
 gxGKiWkMhd+bpxmRcDslFCsEB6+j3rvcmhh7afkOnBlWoFlDoc2Z/QtCUuXSIXp2NQXd
 ECT8rNoDgPIbbm+vvipOXLm6sqJO64QybIQFMsYwCt1CNKL5X/6HiEXtlopqp7rVyMLi
 yliw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhFOYgzMyHi4HgtefNtwJuSvNOpMnrCbg4sK73q+qRznaSCT+vgfnZ7heQv2vrEHnGG/xJJsUd3gM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+6KjSqKv3AIfd1iCs2CUEf3iHGbn0VzO5JuPC5NI3dschO5Ep
 N1jbRS2B3UWaiw+1vTre2pBkyYSPbhcWQknsd54yugzOUyH2/k4l7x+B
X-Gm-Gg: ASbGnctXAZ6b+38TyJv3kkx7Q/Klu2M3Lu3/5SC6eA+v2BQnG7JpX+u3QjWr21KHb7g
 +OrheQMKyQrgHYyFQQXwzd4Kq32MJMhuPbdl+uBvhRcitYyoyAu2Rs2WoIhzzLwkVm/KrarhZf4
 cX4ESdan/k6qaCtftLGJCRpUbSATlv5Bdp9vgkxlAnFXv1TOS8w8Qs1SQcfpmwsGsNumPU14uOL
 EXOOhPkjJF5wbGbY/OZwQ1xON+qVh0rTMMhxX08WdcR1ogWaPOQHipOfMYNo1VBm9J5UyFI021I
 zBQmX0HZ/Ms3oP8cqWm7UXdyFOqnRGuyx7ewW7koNUEpQWIApYzApHKP2pnsZn4yt5TX9euNchJ
 d2iYxWw8+pOiP1XsEJNp+xYcpYg21bKyh50GGACcHijWlrDmjiv6Vur4fRjREMqFzlWxqNoWuav
 As5A6EGuyK3jf+SXpTusYd71Y+kM8acG5vuNpl/5p2xfT3ow==
X-Google-Smtp-Source: AGHT+IGBJFYbfB9Xzyv0xn5iVG4pQmOjNrXtIqB4+niBgmd0qO++FkXRZrzPYHY2hL2wQICutDAklA==
X-Received: by 2002:a05:6a20:5493:b0:243:d1bd:fbc9 with SMTP id
 adf61e73a8af0-243d6f7ef68mr2476858637.56.1756552779472; 
 Sat, 30 Aug 2025 04:19:39 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local
 ([14.116.239.37]) by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b4e27d81ccbsm1818535a12.40.2025.08.30.04.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 04:19:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] drm/debugfs: Fix dentry reference count leak in
 drm_debugfs_remove_files
Date: Sat, 30 Aug 2025 19:19:31 +0800
Message-Id: <20250830111931.2126770-1-linmq006@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function uses debugfs_lookup to find dentries,
but did not call dput() after use, causing a reference count leak.
Add dput(dent) after debugfs_remove to properly release the reference.

Fixes: 8e455145d8f1 ("drm/debugfs: rework drm_debugfs_create_files implementation v2")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ad05487a6949 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -285,6 +285,7 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 
 		drmm_kfree(minor->dev, d_inode(dent)->i_private);
 		debugfs_remove(dent);
+		dput(dent);
 	}
 	return 0;
 }
-- 
2.35.1

