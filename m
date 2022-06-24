Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563685594B2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5100112C51;
	Fri, 24 Jun 2022 08:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36717112C32;
 Fri, 24 Jun 2022 08:04:59 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cf14so2302222edb.8;
 Fri, 24 Jun 2022 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byPE9Yoru8EMtsMIQe5jAdiqqlz8rrO56DVvtVJd9qg=;
 b=m1LPw4Tq7YAn8lQCGgWgt12CjzJ5ei1Ei63rf/aKMcF5rpgBfXhWWd5y3NKVG8Ui9/
 K3F30mqlEy32o+QZsZXlA17af4wRr1DVKixhlju+deheafQ/NAXkt5GRlFmAkXrz01om
 TzwlkMMWSIsZz8Y8uObLx5ljXVdIXmDX3AUzGfBhaZh2KCqzGxsWKyfjOqHtTTOnuQk3
 r1HIiRKeCgO4p1DUTcPzLqAFw481eF/Afji3PnuaKxzRhlw9/Ofd3QbWU/gWWeNF2Y9Z
 eMVfDCvHAUic+3PY3ZEtifzoXXEm0gqpa/KTCrNtzATjGFHR2fzV08RAqKXrhHMLRFyL
 Yixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byPE9Yoru8EMtsMIQe5jAdiqqlz8rrO56DVvtVJd9qg=;
 b=dAm9Wx3E/hIHI8Wkamz81abKilVaRnrIwXLIqGJ2uAQcZJqcIWg3B79jsBlB81sNwh
 w1XqegTv5kpraU/fdBbsKKqzVpS2tmqyRUxBrKeRbfQvMjktJzaAfEMyMhiHUxXAAhOu
 MwQ/QOQPhiT3kHZkSLsq6fTVWLenQIuo+4c3VrP05qC1HwVbJGjkYJfQkl1jzveCpl/b
 WS1GIbomXZhzXmPzM+xQ3Stxiy8vns6uB6ySoWViUvS+fVuP+V/mYYUDbVmMmX1ft/FQ
 m1fTq4HsvMNGH4xvsLiLxhOMDuM8+N1GI44k0bkDlV8ECjLQtCDaSRDk3bqNg0jYSm0j
 n9DQ==
X-Gm-Message-State: AJIora8e3TBxZJz8VhYumGTxICOzBimCN0XHlv5TBhNfIrU3S1C2vO+B
 ObniCGBTHWEJlErSHZwb8do=
X-Google-Smtp-Source: AGRyM1tei8ieA1a6mCZFwIOAyKz2hIJ91XJFBH3Ye843yczThgaTMvzSiEfsJRV0/KOD+tyxr8SMCg==
X-Received: by 2002:a05:6402:2790:b0:431:4bb6:a6dc with SMTP id
 b16-20020a056402279000b004314bb6a6dcmr15766928ede.48.1656057898870; 
 Fri, 24 Jun 2022 01:04:58 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 09/14] drm/radeon: use drm_oom_badness
Date: Fri, 24 Jun 2022 10:04:39 +0200
Message-Id: <20220624080444.7619-10-christian.koenig@amd.com>
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
 drivers/gpu/drm/radeon/radeon_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 956c72b5aa33..11d310cdd2e8 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -550,6 +550,7 @@ static const struct file_operations radeon_driver_kms_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = radeon_kms_compat_ioctl,
 #endif
+	.file_rss = drm_file_rss,
 };
 
 static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
-- 
2.25.1

