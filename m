Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCC839FC6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A2310F5B9;
	Wed, 24 Jan 2024 03:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A86A10F5D2;
 Wed, 24 Jan 2024 03:01:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-55c33773c0aso2807742a12.1; 
 Tue, 23 Jan 2024 19:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065211; x=1706670011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZ2AGx4llgOQpbQHqy+lTWRZ3MYwi41F2EIG/DZLPtI=;
 b=Oms15XGX6qeB58KHCi1iGYjZbsaF2J+Qzyro0gH2cCES9DCcDHPyLCs/mdR3r39Y/u
 6g74HRt8uv0G5DobSC7hbaZXD/pzcHjJh5+YwbmjXmUPUBk0Ejp+DV7Vs+hR+s5xRNVr
 tCakMXZ2lNqr9Y9RAide49aaskeoHt9Dm2tcDyVbxE14qhXVX9s4w0T6yZ6lbgl/edc/
 2glXRu4pa2XYjf1UkIV1Nd9yRi85FseOfvgFdWmT0ENsXXAATPHsp8wMpMUJBej4xtsP
 2tl/nukAOsPaa8AVuYa7ROXV/vWoL6DdMia83yzY3vJ8AmwG7JS4elT8B5jQbygkjI4U
 seEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065211; x=1706670011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZ2AGx4llgOQpbQHqy+lTWRZ3MYwi41F2EIG/DZLPtI=;
 b=rmnKfBeRE5BUdEsEFqd6Dwyhjwz8DxTRGLjECbJ5bOr1mTh82AeHd0akoK/ZcODhFU
 /QHwj5jSjzXLd5p5ubjdmhl4I4N17ExbTX3GmImv/jVaRF7LAdTChdsiR+0GgteDPZeB
 MiraEHPmbCFSlVzlqS7VT81/4YHvQmEgvTxergRkfqs7WtBKxb0gcCeE6HpgFkVqgzTc
 ZA2dpcJa7liyDKfDDE8xv1ChhTVeHSOGDzkCGWvImVmWzA2wdLL/ze0KcX8teY5337vh
 wKR5HMp71IlkcdU+OT/WiSByP3RexVtWwrTBo3qobpgVogTjIpAgVO54ixct4uYaQd3i
 mXWw==
X-Gm-Message-State: AOJu0Yz1xkoVmvzTAY1V+W171MBKZyuxmthCqSfDSZHXHBStTComa809
 7uePZNMNzz3ETXAx9N2ODha0lsAaZUInciH+/2bsYGAGYQ9YjrjhXVbfyzzBTCg=
X-Google-Smtp-Source: AGHT+IFY/xUjRd5C81Nvba31ogUlvGsjSOuyHLhEZHoYYl7MqACrgkHcV+dOKD+vbkGVhH1TYy4G0w==
X-Received: by 2002:a50:ee03:0:b0:559:70d5:5dd9 with SMTP id
 g3-20020a50ee03000000b0055970d55dd9mr1494752eds.67.1706065211426; 
 Tue, 23 Jan 2024 19:00:11 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:10 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/lima: set pp bus_stop bit before hard reset
Date: Wed, 24 Jan 2024 03:59:42 +0100
Message-ID: <20240124025947.2110659-4-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required for reliable hard resets. Otherwise, doing a hard reset
while a task is still running (such as a task which is being stopped by
the drm_sched timeout handler) may result in random mmu write timeouts
or lockups which cause the entire gpu to hang.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index a8f8f63b8295..ac097dd75072 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -168,6 +168,11 @@ static void lima_pp_write_frame(struct lima_ip *ip, u32 *frame, u32 *wb)
 	}
 }
 
+static int lima_pp_bus_stop_poll(struct lima_ip *ip)
+{
+	return !!(pp_read(LIMA_PP_STATUS) & LIMA_PP_STATUS_BUS_STOPPED);
+}
+
 static int lima_pp_hard_reset_poll(struct lima_ip *ip)
 {
 	pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC01A0000);
@@ -181,6 +186,14 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
 
 	pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC0FFE000);
 	pp_write(LIMA_PP_INT_MASK, 0);
+
+	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_STOP_BUS);
+	ret = lima_poll_timeout(ip, lima_pp_bus_stop_poll, 10, 100);
+	if (ret) {
+		dev_err(dev->dev, "pp %s bus stop timeout\n", lima_ip_name(ip));
+		return ret;
+	}
+
 	pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
 	ret = lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
 	if (ret) {
-- 
2.43.0

