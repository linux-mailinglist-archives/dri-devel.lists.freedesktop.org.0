Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757081621C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9BB6E15A;
	Tue, 18 Feb 2020 07:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92B06E90E;
 Mon, 17 Feb 2020 10:16:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a6so17788435wme.2;
 Mon, 17 Feb 2020 02:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6kTYyV4yeootxcCO0Pc4b5JT430LY5TerttUMYIqdU=;
 b=TbwZP9HxK71gVHf3IOh0a/1JQLrpVCcLEpYTRNNUuN/kajFy5BKeCijudxJD/Th52V
 aiMN36m3DHtathw2KIU5bKawyDU3MqcydDKeMGWNs2zzMWDo6M9Z9M1QdYO7idb4UBu3
 9dQrbgXqJ29i5UmyiPdFwEyp8GgF3al77UjHPNnb53uoSoUjXGJNzgcwbP1ZnarOfG0g
 OHkkaqLMn7VPl1K3Eh59ps4Rkb6XNeN0NZNQVdf8BkB2MCMNMT1/SYBHaR3+gplxdMc5
 f1eqw5J3IIbzNZHNfJdnFtXd5b+niL3BpycIZD7Gu7TWKtE5PdarTU++B3R5CVcoWetQ
 qBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6kTYyV4yeootxcCO0Pc4b5JT430LY5TerttUMYIqdU=;
 b=pPwXNDe3nzEVVDSqCPt4oTMFt8cYOtG0C0NtyFpfhPB0FaNNZw2+fsHUdvtPlEU+cN
 W7k0LnCg6t9UgGoLXhQ9P/LTW3LAFUb8qDJBQI51kZjWl7n5ztupa91YMkyrI1KnTzHy
 xEZsOPEw8avrtQagZ9Q7WjmDyb05rh9Puyiqo7egPM71X5NJi83JfgUNcRcWomXuZR75
 8SXxK/wC/kmSLmJzTlsSKbWhAp1IexGVtk8NqNXf+zAgcoHVvY8S8CnJScSOYVHNIKcp
 atw4VkZggtMi6pxbNuWF0ppaf3sEvNf6y/G7HGidvr9Fs/HG4jbIrZvpcyTQK3Ea5N9I
 WoUg==
X-Gm-Message-State: APjAAAWsjLmVjO9kq2nVvv+XPrcYg4j0WiRDoKACKmzbRxbjN4R8tcXZ
 MFcuWJx1xSVtjtbdpyAJW7ambZELWfZQmg==
X-Google-Smtp-Source: APXvYqyTbxyLPSzZ7hpJC3vu1S48YFo1V4ueNy2uWRuPYiKTaExIGsmfPW2v7UU6WGDE7Ufo1TF9ZQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr21050154wmk.29.1581934567017; 
 Mon, 17 Feb 2020 02:16:07 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F261400BC111EAD619EC67C.dip0.t-ipconnect.de.
 [2003:c5:8f26:1400:bc11:1ead:619e:c67c])
 by smtp.gmail.com with ESMTPSA id a16sm278487wrt.30.2020.02.17.02.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:16:06 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/bochs: don't use ttm bo->offset
Date: Mon, 17 Feb 2020 11:18:40 +0100
Message-Id: <20200217101841.7437-7-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217101841.7437-1-nirmoy.das@amd.com>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate GPU offset within bochs driver itself without depending on
bo->offset

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/bochs/bochs_kms.c     | 3 ++-
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 8066d7d370d5..852ec7910d84 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -38,7 +38,8 @@ static void bochs_plane_update(struct bochs_device *bochs,
 			 state->crtc_x,
 			 state->crtc_y,
 			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gbo->bo.offset);
+			 state->fb->offsets[0] +
+			 (gbo->bo.mem.start << PAGE_SHIFT));
 	bochs_hw_setformat(bochs, state->fb->format);
 }
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..e7ef4cd8116d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -214,7 +214,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
 {
 	if (WARN_ON_ONCE(!gbo->pin_count))
 		return (s64)-ENODEV;
-	return gbo->bo.offset;
+	return gbo->bo.mem.start << PAGE_SHIFT;
 }
 EXPORT_SYMBOL(drm_gem_vram_offset);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
