Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A8453E37
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 03:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819ED89BAE;
	Wed, 17 Nov 2021 02:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F9189BAE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 02:07:32 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 w2-20020a627b02000000b0049fa951281fso754581pfc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hm/r5eitKAhAvWdhE8mJWzffo0OEnbzo5qWeVRgm1k8=;
 b=CPo/C6GtgA5B8TPAasIkOvNwZw3gP/UYGqGPQQd7nTq7uDtpt4P76mPWhLnKBgfmLa
 igZTlgD12NrJEYaVL+/xpj+ReKr7Taptf8t+QL4HpJ5uRvBIkvX2su3dh3sf7udsOOBf
 7RyFuVuwrrvYH7nj3rk37MZ4c459qmfI8KNsVyPDDY4zv3oGJmwVi4fO848mjUhQceVW
 cEwIr6XlFgclxO/QodL2tZziqbe5j4ZPo2h+HEyZk95EhyPrEGWyZYxLA+pg1dK5sdVB
 C3BdedKE9lrJhjgrlUek5EGl0U3M2ULftGxVZc5leDGhm1o4EAnISXwdfCnCe2DYzPPP
 YE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hm/r5eitKAhAvWdhE8mJWzffo0OEnbzo5qWeVRgm1k8=;
 b=NBn9KUqXhGE2onXUJyFuBqrRN3iY1INdXIsU9G/9uWoKg3Kf7e7QXZHECqew40rsrs
 JwESvx6OL1yZYX9aisNEryB3PaIXzn11wxRD36yVtbruswRI5H7+FeJc2DNyZ7wXkbC5
 pm23ulCMzZqFzPBLmuySOPMACYsmum/S/ntyQ8VwLCsn3W9NkW30xRZGfqmrYcBYnfC0
 vTAfiZzKZx2PjWesHG1WxCfhbXdjCud0u3UNYkBHbkHBsdsJY9Hrhn1kIpQlap+HSm00
 x654M1Z+d6X5GfPsz3KWQF2FkoYepgzywu0UoSbIKXR7O0kP0H5sSkauR/BR9ybRWExY
 edXg==
X-Gm-Message-State: AOAM532Z3ZGeOfHrzYub1AjubPZEGbMdn+XnrYl1hwvojSQpBhfw2dbI
 RbyDFgbUCJqvfnpjaYUxCmI6fok=
X-Google-Smtp-Source: ABdhPJxI6FRG73rAsHm323JnCKMhq4pB3PcnYBXk14h/tsQYeYEeHo8w/6xWeXQvyHhFOSQqZ2IPvTs=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:200:dc63:3518:5cae:d4f6])
 (user=pcc job=sendgmr) by 2002:a17:902:684b:b0:143:84c4:6561 with SMTP id
 f11-20020a170902684b00b0014384c46561mr50657272pln.33.1637114852063; Tue, 16
 Nov 2021 18:07:32 -0800 (PST)
Date: Tue, 16 Nov 2021 18:07:24 -0800
Message-Id: <20211117020724.2647769-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
Subject: [PATCH] lontium-lt9611: check a different register bit for HDMI
 sensing
From: Peter Collingbourne <pcc@google.com>
To: Robert Foss <robert.foss@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 John Stultz <john.stultz@linaro.org>, Anibal Limon <anibal.limon@linaro.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Collingbourne <pcc@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It has been observed that with certain monitors such as the HP Z27n,
the register 0x825e reads a value of 0x79 when the HDMI cable is
connected and 0x78 when it is disconnected, i.e. bit 0 appears
to correspond to the HDMI connection status and bit 2 is never
set. Therefore, change the driver to check bit 0 instead of bit 2.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/I7e76411127e1ce4988a3f6d0c8ba5f1c3d880c23
---
N.B. I don't currently have easy access to a monitor that works
with the existing driver, so it would be great if people with
monitors that currently work could test this patch to make sure
that it doesn't introduce any regressions. Otherwise I will change
it to check both bits.

 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 29b1ce2140ab..71f1db802916 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -586,7 +586,7 @@ lt9611_connector_detect(struct drm_connector *connector, bool force)
 	int connected = 0;
 
 	regmap_read(lt9611->regmap, 0x825e, &reg_val);
-	connected  = (reg_val & BIT(2));
+	connected  = (reg_val & BIT(0));
 
 	lt9611->status = connected ?  connector_status_connected :
 				connector_status_disconnected;
@@ -926,7 +926,7 @@ static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 	int connected;
 
 	regmap_read(lt9611->regmap, 0x825e, &reg_val);
-	connected  = reg_val & BIT(2);
+	connected  = reg_val & BIT(0);
 
 	lt9611->status = connected ?  connector_status_connected :
 				connector_status_disconnected;
-- 
2.34.0.rc1.387.gb447b232ab-goog

