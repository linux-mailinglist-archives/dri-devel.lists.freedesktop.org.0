Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEF2F2A37
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD986E13A;
	Tue, 12 Jan 2021 08:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8996E135
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id y17so1522829wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DiooeEYk8MkZJtYKRcyqrNpU6WznmViJg9DxY1OoaIA=;
 b=i2DPpL0P/JkC6czSQ4DlxhhNUCU5k3KY99uq62n6iLJZ5e/teH+8Dh+Ts9pdjCT1Qg
 hstBYlWdzWX0ZrG4/u2x+QAiq94dSt4+mtJQV4jVAjBPVpUGUrwJjfKBQCrC/Cip90YL
 jIyNarvh8qp8bW8OTddOHlovVUW85pJck053Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DiooeEYk8MkZJtYKRcyqrNpU6WznmViJg9DxY1OoaIA=;
 b=Ux9TAnuuZvybe9HKdi1emJL7E9Bsv5HyAwEiSWssNnTti5MtP392UaMxCQn75plkhO
 mNsaQ4CGdChIPETYrM4gZO4cfQSuUFN9Bd7BF2g9BKH2EpmCfIU+Ow/qXeANp5p+I+k2
 mwrePdGOtXW1h2bIAkU/7JWmixVihOH1PSpnUyeLUp8/PUW8GaRXvptBu+nsMn1lLQXg
 1f++DcM1/s/cJZYgGhwVKyE3U5sUFW+z+GeS7hbNG1IAceAt1NERfLUQ7FPPowVOYXyY
 tYB+kfZcEcaLAfnbjYnPj2meym7zUfE7TjzMHVeZni+tIrutlrTzF7N35W06EYK1xJWR
 SJ7w==
X-Gm-Message-State: AOAM531EzMbBR8yp01eYi+DxvgOoYuDETYXyylrx6ukEHZ6sttJjZ1n3
 /fvKq8VZyh+nG2QYl04SHQV+9kTP+8FHf8/z
X-Google-Smtp-Source: ABdhPJzUuw1soLMQWzqcbs4erfwlqwMip2cgxF/dvbE5ad+pBRFKjJluyeOuT6Q9lYQg/ej339/yPw==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr3033138wru.197.1610441051232; 
 Tue, 12 Jan 2021 00:44:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:10 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/15] drm/arc: Drop surplus connector registration
Date: Tue, 12 Jan 2021 09:43:49 +0100
Message-Id: <20210112084358.2771527-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, tiantao6@hisilicon.com,
 Alexey Brodkin <abrodkin@synopsys.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector_register does nothing before drm_dev_register(), it
is meant for hotpluggable connectors only. Same for the unregister side.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_sim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index e42fe5d05a3d..3772df1647aa 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -29,7 +29,6 @@ static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
 
 static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
 
@@ -80,7 +79,6 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		dev_err(drm->dev, "could not attach connector to encoder\n");
-		drm_connector_unregister(connector);
 		goto error_connector_cleanup;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
