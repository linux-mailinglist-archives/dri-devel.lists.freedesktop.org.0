Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E155594CA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06F4112C62;
	Fri, 24 Jun 2022 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF0A112C5E;
 Fri, 24 Jun 2022 08:05:06 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id fi2so3060985ejb.9;
 Fri, 24 Jun 2022 01:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EK5bTabBrzOC4s5o5qACkkoAhewHbBIhpYTiUtnXhVE=;
 b=JwN96QcsgT/HsX0Xpol3mA630eF5N5PgavN/AUY9qBXwAsuVmy5cd/GZroEBwxc86X
 ZaDki0JPCb7oEXIMUIfGTswi25k7wAP19cnFbDOv/5t9BukJv9rDcgt58DFQ74NADH2u
 CYXiAOkYs3SpdYAaOxY3UUVCX6ptHEJ6TRdbP7p4or3Zgu3/WAjyLLMK5jZ7vcqCp7eW
 EZMJA+g9/yiNDw7fyROAvFU5wIayjnD37MVXkIpRkTRGWcd7zygExPX5kLKinTCY8K/T
 5pdb6n5eb6/P1j1smDPETJawXNBlVLLfjUdE34ynUZs+JMkdILaXVbWdyIS5dNH8CO+w
 oVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EK5bTabBrzOC4s5o5qACkkoAhewHbBIhpYTiUtnXhVE=;
 b=gKgAs0xxLorEXtWpIPNdRZURm1HOtIu9/K+Xkr5v4RTiEfXEas1m+J3rW4a2DbjvvB
 NwdY4/noDeiEKjb42gHOYb5VBVH2ZLlPSHxPsMxiOws76uexLDwooYv8upfuEOxNyOMR
 T+6x8oC5dMkXyTfvQTtrpOLao6UlDUUHjUy9bhkkSgfmYhqvLA5Un8A6mkiZ6nN/r1cZ
 Tao0RdS+cTTSlkF3f5FOH027k/+jdQVQJtdWuFjIEEXCBSJroTR7hzO07Os82GRMeKT/
 3bSKF4K9uC69uiGmmdBJywkpraIOa54im92H4Pw44rewskEZGhagpIRclOX9fGQCBqve
 ExRQ==
X-Gm-Message-State: AJIora9F1/NJQnW2pAh4ylCHWPvHfe3HX95zDxGFE0fXNzOjGAGEqJEq
 stS6WJLO3MHESEbN/s3CgRY=
X-Google-Smtp-Source: AGRyM1tgbH7HQwAMplhNlcow9evBtQqHgtM4KLSWjdQaSt6HlGVy+kDMyMimMYEkA9mtx94cpAF30g==
X-Received: by 2002:a17:906:7a54:b0:722:e8e3:ef60 with SMTP id
 i20-20020a1709067a5400b00722e8e3ef60mr11829570ejo.453.1656057904986; 
 Fri, 24 Jun 2022 01:05:04 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:05:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 14/14] drm/tegra: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:44 +0200
Message-Id: <20220624080444.7619-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
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
Cc: mhocko@suse.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/tegra/drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4cdc8faf798f..cc0c2fc57250 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -804,6 +804,7 @@ static const struct file_operations tegra_drm_fops = {
 	.read = drm_read,
 	.compat_ioctl = drm_compat_ioctl,
 	.llseek = noop_llseek,
+	.file_rss = drm_file_rss,
 };
 
 static int tegra_drm_context_cleanup(int id, void *p, void *data)
-- 
2.25.1

