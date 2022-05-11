Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE0522BD2
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 07:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B625710F69C;
	Wed, 11 May 2022 05:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA8610F69C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:41:01 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id a191so876795pge.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 22:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXF3SCNfjM2bxLwQ5AjghUOySdcJkYrZZ8M04WZEgOE=;
 b=je2OkTXoLAiJsYF6ntKWkXMs5+pyupPPj6tCBhGU4fGDuWvUG10HQ0BqCMmSaUA5YX
 tXf1U6mKLkDBRGx5eW6S6uconZii8wv4a2pMYNv799tH9Qqt/KcmfzF3ZbfGGMrgNhTr
 KmRxZla6QKPpnw9wUoXoDmACI0tmIBBKs4PuuqjSNvT6BPINoH8w2ftMVsH9U/GN/S+u
 cnFkluyiZ5jsPtVzFtHl6EYQaAVaijYDfifiA2+YhZXtkPdksSOyaU/H6xCmd8iYsg5k
 utWCOxed4g2PcsPd2RHU/ew5XSyPFWPuJvUwN8XXRuw9kWQa69naewIi9ULUljOm212V
 ArnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yXF3SCNfjM2bxLwQ5AjghUOySdcJkYrZZ8M04WZEgOE=;
 b=YwUuJCUof2Yjo05TrjfvB0G+byK+kUW6CdGDXTHCffGTcrVpT6AYd7cZbGbz8KCmDS
 Drngt18uTWaiqq2fFRaTsUBY9lyVNgqO53vn86calogEGx3i3zhHAlMV26Ss2teXU8l7
 y5Mgt6EmPn56FTuEhF4E5JTZGUKxPgOsnvEOmMMISif/ggO9pxDnXOUva0riEslNYX4v
 oIrlj/3tkuvu7OencClg3ahAxLGgjIXe3bmE4Ndnt+bpS/qMXzEq6V51n/o1Vymg8M1B
 WS6nFMhBTOyhJDnmCoRgp88jSXAyvZcHhjR6aTxc4aS+v6mD3kYCMXraSgdcakFR2OOV
 K4OA==
X-Gm-Message-State: AOAM532rAVayckwRl0OxHmhAisZ6t/ts0eWRM6jzfk9se0tReE2/XaXy
 t4FzayjGKmHjtX/LC7Ic4Fg=
X-Google-Smtp-Source: ABdhPJw7a6nCTB9DlRmTN0EmUxMmxzMov1YhkKH8myZAr3gidDhmH5/zIHIY+HZx3JcDbV79Xk2ULw==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id
 t8-20020a056a0021c800b004fdf89fec0emr23243222pfj.83.1652247661317; 
 Tue, 10 May 2022 22:41:01 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a170903021100b0015e8d4eb20bsm673772plh.85.2022.05.10.22.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 22:41:00 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Date: Wed, 11 May 2022 09:40:51 +0400
Message-Id: <20220511054052.51981-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_find_device_by_node() takes reference, we should use put_device()
to release it when not need anymore.
Add missing put_device() in error path to avoid refcount
leak.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..de87f02cd388 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
 
 		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
-		if (!notifier)
+		if (!notifier) {
+			put_device(&pdev->dev);
 			return -ENOMEM;
+		}
 
 		meson_encoder_hdmi->cec_notifier = notifier;
 	}
-- 
2.25.1

