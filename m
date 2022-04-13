Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42964FEE6A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 07:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F3610FFA7;
	Wed, 13 Apr 2022 05:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEC910FFA7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 05:11:15 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id q12so757364pgj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 22:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=kXceBWICMkqVzxZbbXouRUuh+7IRurVzl1HZ/UYHcmM=;
 b=CoDD+vum6WiHck6Yru57/HXqzuYL1H4hsZAx1F3Bhx7HHps1kvenvPkHL6jA32tJFH
 6NwEiBa2fCAsiR5SAwQieocAHm4PQxCJhD507jcgj8Db2MD7bLUgOMQj3KVGqVOJoRAa
 kPOc1Iqz4lReIV1suIKTD4utwV7uoTspJ62KtuQ4JayVWcaeY1g4y1oJ2UMZAAnwNu9i
 4IX+GAf4V/KaIyE9/r35ILcoZDrlOE64BO3Ip0mb+4woorVYC5fK/sNdNIBF/GYRZiIe
 TEfNTPdlHMtiVndnMj/2Z/MJYoK5ePT1nzrbmG3OMdbLiiiRix4iCCxZIHdjwvyQL0Dp
 pw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kXceBWICMkqVzxZbbXouRUuh+7IRurVzl1HZ/UYHcmM=;
 b=oZUICmpEAbgUVSEpPMbeM99JNcb53YoBbekIJlZtfLAygS+OjPjaXIizakgpG5fkBA
 /OOuYu/gEnbyXgiyfSNCaxss6vfUAaNjarokk7du9SYY8LeLikS1aPDcZCtfmvq2IRw2
 3pA3G0+M8IV4Tlu9tXonh35AE5x8ZeeRO2WtmnyMPXrRTm9uXsnDcGpGHfSYDr/8Z7HM
 2lbpTlfANpmET0hNpgwwWq8B7LuJqkYOVQNvatC5GG324SOKf++7vj5Kmtgsogm+OD6X
 EFghtghC9ZwQJvUobBReTxzAJD1iArp4Ked1uigJ6SRp16ejcAlfYagtfyJ+WjE7nt/8
 ywEg==
X-Gm-Message-State: AOAM530ofaVeP4N5X5Sg34FWLK5m7T3IFiZA27NrNHFmzo4lkoDvTvB8
 3nuA6Wb7Ku/0zN7+fWJjixKNJvZWsG8=
X-Google-Smtp-Source: ABdhPJwxZ04TU3nO4liFW+32dbNCALzgUg5LhTx5Uq5S8/oIGF/9ns0Gquc/Qd5KiLYJ7QXcTaHU2Q==
X-Received: by 2002:a63:4b5b:0:b0:39d:3808:c226 with SMTP id
 k27-20020a634b5b000000b0039d3808c226mr14062083pgl.603.1649826675192; 
 Tue, 12 Apr 2022 22:11:15 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
 by smtp.gmail.com with ESMTPSA id
 u206-20020a6279d7000000b00505fdc42bf9sm4414824pfc.101.2022.04.12.22.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 22:11:14 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v3] drm/gma500: fix a potential repeat execution in
 psb_driver_load
Date: Wed, 13 Apr 2022 13:11:05 +0800
Message-Id: <20220413051105.5612-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Xiaomeng Tong <xiam0nd.tong@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. To
avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
goto outside the loop when found entry by replacing switch/case with
if statement.

Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
changes since v2:
 - replace switch with if statement (Patrik Jakobsson)

changes since v1:
 - goto outside the loop (Xiaomeng Tong)

v2: https://lore.kernel.org/dri-devel/20220406113143.10699-1-xiam0nd.tong@gmail.com/
v1: https://lore.kernel.org/lkml/20220401115811.9656-1-xiam0nd.tong@gmail.com/
---
 drivers/gpu/drm/gma500/psb_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2aff54d505e2..85211ec16e52 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -396,9 +396,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		gma_encoder = gma_attached_encoder(connector);
 
-		switch (gma_encoder->type) {
-		case INTEL_OUTPUT_LVDS:
-		case INTEL_OUTPUT_MIPI:
+		if (gma_encoder->type == INTEL_OUTPUT_LVDS ||
+			gma_encoder->type == INTEL_OUTPUT_MIPI) {
 			ret = gma_backlight_init(dev);
 			break;
 		}
-- 
2.17.1

