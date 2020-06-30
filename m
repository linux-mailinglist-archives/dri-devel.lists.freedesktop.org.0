Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC720FB57
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15CD6E083;
	Tue, 30 Jun 2020 18:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD14E6E071
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:05:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so23667818ljv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C2f9zZwQlqr0fYdk23UoOCnQKirNL10zzLyxsGmtHFA=;
 b=MzvO2YXee/TJygfnFHdzTQjUKln1gjzBQCDd68Ba8J5XbSYMjOI+0BDV6QWCu5nCPR
 syl/PE7/UkIIo5R1xoEhfxKBOfUfPId+ZzyMWeit3VI/xwMGaO8ZHJsD76xuQUSMEsW1
 Drv6OURQWkmmjLVk1M6fnm2os79TAi3ZOJnOR1T5/NjmVLqBFASBo1mkaPG95Zs5YQrQ
 EN9Ja/LEtYxNJB4suy0gory351KNRkHqos6zJLNRQk+L4RBuf4WI6dR9ELKUA2wRyBcd
 YUKYU4LHpLm+H2Zxw+GIwA4srDVdMvZpOhj+w5h8wuM4yjskHJkNY4rcvriObkjsn1S/
 TXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C2f9zZwQlqr0fYdk23UoOCnQKirNL10zzLyxsGmtHFA=;
 b=h7gCybNV+0GMdoG/dRukPC9+6/MUjA4cB5e0VSPQlNUadJcxc1guw+KH2XF+BqV3el
 lofxqr6rwZ6pFvek5LxD49mdx+TT5Yb/H3Gx93rK8/sjQRSNkznhjO/Dxrlvi57DVfLv
 x9lvRwlOMHr8IkIAEkDs1UniYrcsr8nI/4i+vI746zVLe1e0JaKYcrgWfNCd6R83QYv2
 ZhRL08ZR51afKly18CmOcYuNd8tymm7mD8a8+/LQhzEW7K85gyf36SSvATBjo9me2uUx
 6DtvZVdp3cSA21xCimvYcbS/+NTEo1QdxXe9h26/AvqRwsIA4I40PALCKFbKXkp/nmP1
 JseQ==
X-Gm-Message-State: AOAM531kZIkpVLUs7Uaa+vQMf4+8EZkz53BTsj2tA1DakyMc/HALPHh0
 O4HSJ5lU1YthXetpyYcOu5cxCnj253E=
X-Google-Smtp-Source: ABdhPJw2vgit8z9QgprdLo8FU34EG8XgqJxr7ijzwLUeyQIbwqkE0romFGD734xpgv5nFcss6u+ZEw==
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr11434256ljk.379.1593540355389; 
 Tue, 30 Jun 2020 11:05:55 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:05:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/7] drm/tidss: drop use of legacy drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:39 +0200
Message-Id: <20200630180545.1132217-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
References: <20200630180545.1132217-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the more descriptive _DRIVE_ variants thus avoiding the
legacy drm_bus_flags values.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 629dd06393f6..772a497e8c57 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -997,12 +997,12 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 
 	ieo = !!(tstate->bus_flags & DRM_BUS_FLAG_DE_LOW);
 
-	ipc = !!(tstate->bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE);
+	ipc = !!(tstate->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE);
 
 	/* always use the 'rf' setting */
 	onoff = true;
 
-	rf = !!(tstate->bus_flags & DRM_BUS_FLAG_SYNC_POSEDGE);
+	rf = !!(tstate->bus_flags & DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE);
 
 	/* always use aligned syncs */
 	align = true;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
