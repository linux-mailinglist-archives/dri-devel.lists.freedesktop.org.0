Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC03A29EB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B626ECFC;
	Thu, 10 Jun 2021 11:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5245A6ECFD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:11:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m18so1836411wrv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12906iPsWJQOVdQadbOK6b29G12HcaqUh9zhbldpC20=;
 b=rITqrsiKVVZtPuJaF7u8Oy0uTnx1Vs1Dm0Ye4QHx52LF3prZy3GNTOPJWGnyUt36Pr
 QUtS3Ln0+YajAXBOqSCptntS0vWm0A+fuSbXwQWyDjiorsjes9wWU6i4/epp4KJxlt6n
 dvO5FyQ2YJYi9tcYYFtuheP1NrV/ZI+s8IOMMZbHLUKodnf1cqvQFCmBcTfuiIr9nHQG
 B42ZamCECoq8qImqsxOGlPdMqL61L0V9ulZnqgYQ0pEijhgEptpzJURWjoj0zPoAWb8V
 /ea8nIa7gGsKUFf6Qh7UUJ2aeB96SWcdZvUeyLN5t2Wi8Ux9aAb1ad3x8tOG8HqRrvF/
 0Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12906iPsWJQOVdQadbOK6b29G12HcaqUh9zhbldpC20=;
 b=uaOGE9JZKkuyWj8XRtt6MFTBhrpp0iggzPXVs0i2nGR4J/Gx8tcvujzgHho11CkAqm
 b0QnVr0/9wPlICYFrPkrauv/fWPbzoGg/XIYHDS6fJ7BKplbTJvkHp8TTSOhNeR0eMIG
 Ou9T1UaIfypisNuB9DE65HJmuD/rt/GKgLAKnhetQEab3vQ6y9lys9Z+Ptx+LigywTzZ
 wP7jhfvsJ6IQ5SNPAiTZjiDrhoCZojvyTS0uqe3YPdK2QVZr7ILzXWhz9DIJXu9/X+I1
 PJrvLLilfUSumR4zpKuaaVZpBWU1Wz6DqkQzXnpG7fC9zt+YyR4Y8k0DSbAi43Gdfurg
 J3/Q==
X-Gm-Message-State: AOAM533Ppo51QKwv9gjZhtDTK3tp3Uy+A4di8RixJj9vw4rViY+iGb2R
 qFIrjsXXys9Kl9jjG9DWlW1O504HAx0=
X-Google-Smtp-Source: ABdhPJw4UVZXmrMmhWf0uMQEf4MET3d2Za+7WFlMLjnvK3gLs5c3x1tYoxFbmXVj6y+pHJJzf36iyg==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr4878613wrj.243.1623323462386; 
 Thu, 10 Jun 2021 04:11:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id d13sm1370182wrs.41.2021.06.10.04.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:11:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/tegra: Use fourcc_mod_is_vendor() helper
Date: Thu, 10 Jun 2021 13:12:36 +0200
Message-Id: <20210610111236.3814211-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610111236.3814211-1-thierry.reding@gmail.com>
References: <20210610111236.3814211-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Rather than open-coding the vendor extraction operation, use the newly
introduced helper macro.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/fb.c    | 2 +-
 drivers/gpu/drm/tegra/plane.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index cae8b8cbe9dd..c04dda8353fd 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 {
 	uint64_t modifier = framebuffer->modifier;
 
-	if ((modifier >> 56) == DRM_FORMAT_MOD_VENDOR_NVIDIA) {
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
 		if ((modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) == 0)
 			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_TEGRA;
 		else
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 2e65b4075ce6..f7496425fa83 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -109,7 +109,7 @@ static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
 		return true;
 
 	/* check for the sector layout bit */
-	if ((modifier >> 56) == DRM_FORMAT_MOD_VENDOR_NVIDIA) {
+	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
 		if (modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) {
 			if (!tegra_plane_supports_sector_layout(plane))
 				return false;
-- 
2.31.1

