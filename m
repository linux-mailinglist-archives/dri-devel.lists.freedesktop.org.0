Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B764F5C27
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4C10E05E;
	Wed,  6 Apr 2022 11:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF8710E033
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 11:31:50 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id c2so1944875pga.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=xl6VVCAajevFuRJS9yPa1nlDbDqEUfMrrJAAj8Ufl7w=;
 b=Jm/MEaVSKPLAgcL0eRNOvFXKLkxCSUlelHrlNGJGE8zKGxd3mPDoOYmNNAr/PX2oZf
 RI56ezt7I/hXAiPJq0vjNGAcQdWuTdVWA/7HJ+WZ3/B7mbSna+w1YFowR0TTEWY06fIF
 WfJU0pApHvsua2/YXeuoXGx+e7I4ebchnLVYYnj8iygztCYswVz7jr7Dibf3ufK1ndcA
 mxmOxppTuxX3dtjyhVfSyWcNRIDUo0Z//arZ/poeXhMUaF3BOLjZy0EWeqKe8I2MeObe
 /A1vlRRhDQfVjwsZ3tA5TLRSHymZFcUXPpi8ktcYdFJDGzQe+HSYGq8JR+rxkv4chhPM
 MB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xl6VVCAajevFuRJS9yPa1nlDbDqEUfMrrJAAj8Ufl7w=;
 b=gPrbwUImgdzCBF01IWXCehe4sGu3coQxQilC5fNOZk1V/d4rWwV/WpTTc9usYQ1dcB
 02m/3jrLPXOvJn+Yv+Qtv0d1m7o6OaZf6TgCwTckuP2SmCKKYGDzEN4n4J1SsI6aQIi0
 qS0eku7PBDZyCA5wo6bH/46qfd89I7xdNpMPFTd403WRWPVExV0lkDv3NqlAgUhZqdMC
 TU/TTeOmIct4m8mqcLy37DFPcBp/LkCUTpQdHIs1g3RYiHeZrLlnbxpPvQo/Z+COO3BN
 mrpgQrX2mglrLyfkk1t/FUQOFWlKye+JQrqgEGs8eIoN6tfSuzzKV02K+EEj8Ooc8rHZ
 Ob0A==
X-Gm-Message-State: AOAM531y0yQ1+CjZkFDYBSPNehI19i7hTlT5yXTHuNECrtwwmYre327I
 Xsx/m7H5SpBbm50FI4yUW9w=
X-Google-Smtp-Source: ABdhPJx3gTn89KY6+7NY2fQ+ZYGvPyx47HtqtU3a9MIUqtNVPY4y3m/hrg/EmUaMM3x0fmQTiwagag==
X-Received: by 2002:a63:221f:0:b0:374:7286:446a with SMTP id
 i31-20020a63221f000000b003747286446amr6759359pgi.538.1649244709835; 
 Wed, 06 Apr 2022 04:31:49 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056a00229300b004fb157f136asm19760516pfe.153.2022.04.06.04.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 04:31:49 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2] drm/gma500: fix a potential repeat execution in
 psb_driver_load
Date: Wed,  6 Apr 2022 19:31:43 +0800
Message-Id: <20220406113143.10699-1-xiam0nd.tong@gmail.com>
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
goto outside the loop when the entry is found.

Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---

changes since v1:
 - goto outside the loop (Xiaomeng Tong)

v1: https://lore.kernel.org/lkml/20220401115811.9656-1-xiam0nd.tong@gmail.com/

---
 drivers/gpu/drm/gma500/psb_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2aff54d505e2..929fd47548b4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -400,9 +400,10 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 		case INTEL_OUTPUT_LVDS:
 		case INTEL_OUTPUT_MIPI:
 			ret = gma_backlight_init(dev);
-			break;
+			goto out;
 		}
 	}
+out:
 	drm_connector_list_iter_end(&conn_iter);
 
 	if (ret)
-- 
2.17.1

