Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ADC54A2FE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEED10FD0F;
	Tue, 14 Jun 2022 00:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1BA10FD08
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:02:37 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso10553489fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+PvdRmnLM5kLGna2OvRIJUtGxiVqc+OqOxNYNZz+DdI=;
 b=jvgwT71wvdCQqf2KfZHvR/kzX0d2D0R4vrVgd9g2uxvBH2opwqqwxsv6SwhOi2WVsL
 8y9lgCt+XMi8yj0FUikjI2uArlCrUAvvyWbg+1TJ1NVMkf/h8bG+LPtqDOxYQT1WcpQ1
 ZlAPlwAn7wxDKH0o07ZMOTbWlrtUTaXGchVmiGTkK4znxZdsL6rasm28wkZYKoGB+dG/
 EJ25cy+XyLjgS7BverThdMRycEGRnyvPIsohISrht5z1rW7HwlmMa+btsSZfmmMLqoSw
 SiKZ+DP4Ognkgp9MMiLWhS/xL53mI9lEcVPfKRKp8XeixU87hjEs0CMyJdIpUCFOX3Rx
 U6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+PvdRmnLM5kLGna2OvRIJUtGxiVqc+OqOxNYNZz+DdI=;
 b=N08LJzAUr7x119SJnAWVOFiKQIF9/HqPDhBnsanNYHCii9Dh3AWoeLXAFuv971SRW1
 lreeN8FS0IP0aR3H+P7jMtvKM4bluC7OPeFyovOdlT0j7cqp+exzmOxEDDyVwm5vorqq
 StWeUbhJ0+YGrZL+rYfiwEVsWmyl/pqRpgXbT76CDJ5ffIR3XLo3L807q3WYTfKEBC03
 oip2+NYcR48hxDi4VoQhbTqXYWmr/W9aSwa4j7VqQk9OmDeP+9rH04MrfomTzxlPuc5H
 61ic2KB+saY+F9RD011c7fsRWjZNp6Xp3rvMEVNCSxwXyAynwmpHOre/G1uvUa55kH0P
 iVwQ==
X-Gm-Message-State: AJIora+lYgAknCgL2PmnUPU4U3/mv5B+e5ZZrthtDVLNpP352yHBqIfS
 DIB3Tkgf2dgGeHN3uRUk80k=
X-Google-Smtp-Source: AGRyM1uJoJACDj7VUfOq2/zkj2pOH4+J1hFKrQM96tV5OjUK7nDnPR0UrwIu03Ibjslg3HAWynjqxw==
X-Received: by 2002:a05:6870:80d1:b0:f3:26bb:a874 with SMTP id
 r17-20020a05687080d100b000f326bba874mr826361oab.26.1655164956526; 
 Mon, 13 Jun 2022 17:02:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:36 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 1/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Mon, 13 Jun 2022 21:02:18 -0300
Message-Id: <20220614000226.93297-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614000226.93297-1-igormtorrente@gmail.com>
References: <20220614000226.93297-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 91e63b12f60f..36fbab5989d1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -30,7 +30,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct iosys_map map[4];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

