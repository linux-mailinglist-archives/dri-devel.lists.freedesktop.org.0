Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F180B3E2BE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8783B10E43B;
	Mon,  1 Sep 2025 12:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L5Xb4IeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7636B10E43B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:11 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3d0dd9c9381so2894292f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729570; x=1757334370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5O+yZ0tVj4VVG9ie2bCzxaZKaxc2ngyJg4tXjB6Ebrs=;
 b=L5Xb4IeHq2uxHfaPmNPpGRK2foIIC1s2jI3/s2W/GudLB+ELXagCoIW38oQxsycqZK
 tGyOZCLRWXuPMMieIKbh4Dg+3Oc/NoMQ1WtKPTJSxZDR+slFh7PaE76FjMgpUPzRBIjq
 PwVd6Ux5mitNQFrv7IymK3U9FNbeJ2nsjTDqZa2xfPpLQfzKkWPhMh2eIEwT3/4OpwVj
 HlYwOzMSGtSxBJul49A64WnEKMQIv3qvlHoQ+Qvm0kSDUI7qugizDCJ+JI822NGKxeJS
 Vke89O7bLKT1cSIhs5c7LgNznQ5mfYNTQ5jCShwSXdoHM4jCGV5pzYnCosGZhC1p/HFM
 A1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729570; x=1757334370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5O+yZ0tVj4VVG9ie2bCzxaZKaxc2ngyJg4tXjB6Ebrs=;
 b=nzSX7II9G6OGt2l6ZC6p+FRAfd0eU8e07RguZ8YFhP56n8q/j+ZKmKQ+SsBE4IXs1G
 vMRX8+CoAsG3FPot1NmmxRuVwTb4fMBgWpmiK5Et0lqR/Z4SpqcC/l7QJUGZbddp5Ctq
 LIlRYS456y9FFQ0qmBTiRBhUIj/v48orqnJSRhgenvFg0WPiQ9fB1v0oWbyKSaMN4aBX
 dqHdKp++Zo8cP4Vqw9VV+yqZKd5Xu7jHliP8V7ATl9N6OGZc7iw5xVLLILj/miRQMNUX
 XmwmSX7O51OluqQDFex+vqpqO+cyuX+siuYkEcc3VZXV6Q5qL065Vy5THlCatMcDs2jP
 r26Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUECw1os0RZ601SAT6SamNMlFR/IhCK9dLEtaKRivpReNzweVDGar3i7uUrH9LFwFZG5skDY/JjH8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyni0ZBEkBb4ZL6BCKd9ylXihYBPN6AeSRP+3hLibMRACSCVHgD
 VN8kOJLvWZp6dHE+p4EH75KF2DJHrTSAMQclSFSg/g44+dQO5Z7OYaDM
X-Gm-Gg: ASbGncv8kpdzhGTISOOFncbPkONy9A9S/HLkWy7XhxSQh+h/6lkUqfUiUTJO8iB7AfN
 Sq9k82jWlt7jAa+7JfFJXBsS+JMv1Avuhxt9ilDEauZ1Y5M+gaU3ptXmtU551lmYuM6znER/ycR
 ivUuR8jjS7CtAuuWjS4Za5IeaTsrx5oY/57mZkSgAwBNkuvPJVkt+JkpffCFH+evI+Y3oyjU8NR
 YlP1bi/iAjF4U/N8Ayr/SAL8Ih7H1szaiUdphNoRdoCt9YLJDQ7Lbwhor6y7JzOuplJUJ80oFox
 v42suvL+C848BxyqHLlRAHLCnvCHps16Qagg9CY82ObslQ9KPHSr6qqzsMG9NiVJKfsJdDfeZ2X
 WgE2efnMDW+Nkk/kK4mraauPYVAjHWO6pwqyrsts=
X-Google-Smtp-Source: AGHT+IEez3DPgxAss23izjD/lj9HKWSCt851WzEhPT8lwiYI89K4kHJbwaUo6MmcCHOXKG1VR8RWdw==
X-Received: by 2002:a05:6000:4205:b0:3d9:415c:b146 with SMTP id
 ffacd0b85a97d-3d9415cb164mr37173f8f.15.1756729569839; 
 Mon, 01 Sep 2025 05:26:09 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:09 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>
Subject: [PATCH v6 12/16] drm/vkms: Allow to configure the default device
 creation
Date: Mon,  1 Sep 2025 14:25:37 +0200
Message-ID: <20250901122541.9983-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a new module param to allow to create or not the default VKMS
instance. Useful when combined with configfs to avoid having additional
VKMS instances.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index c1f23e6a4b07..6d299903fab2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -50,6 +50,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool create_default_dev = true;
+module_param_named(create_default_dev, create_default_dev, bool, 0444);
+MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -219,6 +223,9 @@ static int __init vkms_init(void)
 	if (ret)
 		return ret;
 
+	if (!create_default_dev)
+		return 0;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
-- 
2.51.0

