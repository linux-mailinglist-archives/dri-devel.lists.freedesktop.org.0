Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB584BE4F05
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FB410E33F;
	Thu, 16 Oct 2025 17:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LCS/ARR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001E10E312
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:57 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42701b29a7eso465001f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637416; x=1761242216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dDIBd/5GJWbfmYIhSedRYcdjoF/UyHPs/JoC64uZgbg=;
 b=LCS/ARR3Yv444zX64p68jfNWwLr/hJlhdITFoXEv1lc8ZlBZqKaF0CS1q19Y+Xi7qd
 CNkgPDLDMEhztOJBdymk059lef/qH4nrE9NSuMjb9cdW9jGnqD2MCqQ19qC/ktZNbXww
 VDZUlPYBH62NrxOg0NEltoP/PThkaOfMPEPaJTda+GbWYhvWpN2hHHUCu83Ctzdc+hPt
 0qFTbM7DG1sj0FgLhLEiSSLMT3KqcrtMwrI6rRdjJ/86qTt3IDLBYzK4CkxNYSBDBgh7
 IdhlTUN4FAsCNajk0o90YJFGAtDIB7QK7iTsunnJT+oWErscP0oDfWc2XvQO/yL0AIDc
 YEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637416; x=1761242216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDIBd/5GJWbfmYIhSedRYcdjoF/UyHPs/JoC64uZgbg=;
 b=j5eysUd48h/xDPUisi87LPjniGoOMmGY2NbWJvCrGdZdaSsPoGPcu2Fuv5OTbOI95z
 nBPMPoeuWQi2z7mINfgpFcoZENmagCPBbogGuE77xsRYmTaG3f0HBw5QV7rm4tfgxa1y
 q39WHNHxxUh4nBoGGtpJMu0vTsP39tLVLHlXlLXBtQoFzbIGTd9Z8fF983UCFVFq0zgw
 vGuwXmgCJ0SEzEblUl/PHo8cF3rAn6o4dwsiGFqYve3gt3y0o6UUryKgE4wwJTH27u/q
 B14r6oN0/YcV4xyaVpvOdIK+tuW2AePejO6+g5fAggkn/g08DFQhCTPSuXY8ML1GcXDL
 ogTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/8JUU9C3c+p8jGisdcJcoUPcKjFkn60t6DcxwDJrd0lwRRQ01ibi31es+w5QgZMTD+l7Z/SnH4Gk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFupVfJkulsclSWtfmPqIiMAWGAz17e5qdb3+hdpBDZyTm9YTx
 OvlTMCF0PgD+xlMSJHOoqxlNteoB4QR2moV+qsn0EFapqDScZrA7hJov
X-Gm-Gg: ASbGncs0BjyzcnVrbdTKJOtuqMRaLYttPKajwLE3KKuVSgvYGWX4NGOGfuyVf5+PK7u
 bI1SzNA4yejtUG5bXk+HH/DzhUfyzahtv4j8S2622/Ae7fY2dXkNkYa7kFp40xOroi1W8Cw7Qg1
 wl++HFfKPjD1+KRWiH61v4Z4FdS7P2tHm5WCtiE0GQpHbP5jUPfj6z/trG/y/IiOMso2vo4VQv7
 VE0+0iGJePK+28YmI5R+nlEOd2OnSH2m0R+jp78mVVLjKZokwimFc4rcN/lSKwr1YDUqoikBvK+
 9JGCc6Xub4AYHV7fnvLVwYOZEhq29/QHMAWgtjdy7FIAAzsCDGQLWJHj/aFL6fXb8hSSlSOgAV3
 cdVqdSTzNIghkgmUAZXWlMwzfaFtDAW0Cs1BfLk1cvhV2Sxq1RgjoAuXDJ5R3AFNMvHcvelD2NM
 Q=
X-Google-Smtp-Source: AGHT+IGcsJNQXUWM38WX59x6HV9qVAN223pS8C2g1oQg+KVg67lXv4toau5LU5uGbjwtrz4LccKf2w==
X-Received: by 2002:a5d:5f95:0:b0:3f4:5bda:2710 with SMTP id
 ffacd0b85a97d-426fb6a7461mr3088172f8f.9.1760637416228; 
 Thu, 16 Oct 2025 10:56:56 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:55 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 12/16] drm/vkms: Allow to configure the default device
 creation
Date: Thu, 16 Oct 2025 19:56:14 +0200
Message-ID: <20251016175618.10051-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

