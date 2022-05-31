Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF883539354
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 16:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A3410E089;
	Tue, 31 May 2022 14:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4416710E089
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:49:39 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q18so13025422pln.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
 b=cV7Mz+wAIW+PUEe0iYCSMFq+uwxZ91W/LWcYZNEYSILqBIgtLaEyH4um2dlf1uimil
 Hi01/2VYvnNhg5DSMEI7jjDXglilceVlkoiPmjoJ7T37eqTTua6KsZfxs7YJoqo9iVYF
 ZBze3AfYyWmvNzLR0j+MK6mh8wov6wK65LrFma3m1bAzxLgSpHMraTJBX2Bx14ExdN3Q
 p8kWMI3acpRst921i2EBqp2XK8bfYwjbpd4dNcxzRkq0pyMxVqQoxW3Et3XaRFHK9XGT
 2OCdR5DusT0ZqUmE3AGkp7ntPwr7BoFNaUddygiHIKy4/LvF4KgYPvWivit4UnnS58j3
 OWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
 b=Y+tZN5HmtL2VcL3D+Eq9/ZRHCIK4dRXz3tSVD+511hHiHS3EtRPYsw8lc3LmNovdOG
 83yhML6EGFicRykrLOZX5ecoBKID1oajcBcAgSAFH54Y/VAmZJdvZ6qq9NvdS22dsv0m
 RIDMBciJeoB1vitIama1ZtkfJ2v6OJHhUztF4NKWeLByZYlCnH9d8lIVRHCGW7sAu0U9
 CXZsihSQGvByqyvPbZ6aN3ycZd9Lh9EHFMNm++KUPtixC9/psygOpCpaKdhvS0CZU+hq
 hcWWy33ZSI+mNKs2PgzYq3sX3nHq+DQX2pm3cjwMGbXrxVmGbpUMhvgS5IeZY+IydsuB
 JGWg==
X-Gm-Message-State: AOAM5307r5m4ZSlG2OYfdDlqPF0rfeFFO8UnVGb3atimZbK1bqPVz5uR
 As5CmbGvCSB8b0UJgiQC0XM=
X-Google-Smtp-Source: ABdhPJwp7L4klTmbrkke0YpYCLWkj2Vr73IGnj3X69pgKGLK4gcgENFTfpGqAgXHRx3n2vVZJlo34g==
X-Received: by 2002:a17:902:e80c:b0:163:d222:60b7 with SMTP id
 u12-20020a170902e80c00b00163d22260b7mr12131714plg.54.1654008578559; 
 Tue, 31 May 2022 07:49:38 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 d3-20020a17090a8d8300b001e2d4ef6160sm2007215pjo.27.2022.05.31.07.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 07:49:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/meson: encoder_cvbs: Fix refcount leak in
 meson_encoder_cvbs_init
Date: Tue, 31 May 2022 18:48:15 +0400
Message-Id: <20220531144818.26943-1-linmq006@gmail.com>
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

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index fd8db97ba8ba..8110a6e39320 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -238,6 +238,7 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_cvbs->next_bridge) {
 		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
 		return -EPROBE_DEFER;
-- 
2.25.1

