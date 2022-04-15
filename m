Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA270502D4E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 17:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6110E204;
	Fri, 15 Apr 2022 15:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1F610E221
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 15:47:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e21so11074628wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eVzMG+zpu3+1hRtFVA+ruZ6wFZcWgleiqmePRHdUybo=;
 b=qZz7Q6sxtsctCU+AZWdIgKNJKHt4F7pgzRWBWcwwkztrzO4hMxC+3y6bM+aQbE2xPm
 ZgDOt/of8dP232h4DWHKBZdrlFl7mr/rHPWLMlTUAIgQShx/CLBs7x04LE2hA4klZfjd
 W3bXY/m5KdcR0T/MgcaxM6ZN3LAMge79NTXnUcoGdGzzo1aJuBQrv7EwuBB0yst9SEeQ
 SqZ5p94yOj0JYqxZpDZUQrI50oNOazZEPOOIs36FyidDLsR1wcEYZqF52fn0aTdqFSru
 f/OHnqPmd3EHYQVhLnCWJUJ+ZdbHsz4kHAKKZict87s4Il+PYOPtJNePZ6nVOBeHy0PA
 d8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eVzMG+zpu3+1hRtFVA+ruZ6wFZcWgleiqmePRHdUybo=;
 b=U7lef95vx3gKm6+k1HEeCINnBBa+q513tRd/f8CKGFo6CpC8QuPcy5tMdQJe9K/pSY
 01rT39qXtTHueBy1IWYUg+1AnLFLqin6xpno9kthFzmgNcGSWRmhmMvtB2PyUBfql2xV
 0nUaQR7YFogdQ8CETQVsMk9TC1MLBce/n7l5LJc34lPVyzsWjSk907XkFUIjZ1CLsR3H
 s2USsCnj1PvSR/QjhpdaDEF9Bmki40Z7hoTDgC9urARmDHoKTOWrbEW5NOAhfFahyCJ0
 X+9pMbNx+woIAl+7j2UX2l6fWzLKVcpqprUMav7goO6qBPrUMwiOOLInvDDUs9dwGIcg
 i7Aw==
X-Gm-Message-State: AOAM530wBn9/UkAW/nikPfC8wJT8J4A/tYt3Anp01g3Dx7X4tSmZx8u3
 /pkX3gkp6Fzw7de8BnKEMlA=
X-Google-Smtp-Source: ABdhPJy53CGJvYDdnX2i/uwKm+d/NbMdizBcSF/BiT2v5dFHuYNgxTBoU3cJqgveJRQqMg297/59Kw==
X-Received: by 2002:a5d:5705:0:b0:207:a299:27e2 with SMTP id
 a5-20020a5d5705000000b00207a29927e2mr5877936wrv.59.1650037673765; 
 Fri, 15 Apr 2022 08:47:53 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adffb87000000b00207982c7f4dsm4349655wrr.67.2022.04.15.08.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:47:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH v2 1/2] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with
 is_hdmi
Date: Fri, 15 Apr 2022 17:47:44 +0200
Message-Id: <20220415154745.170597-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415154745.170597-1-jose.exposito89@gmail.com>
References: <20220415154745.170597-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is cached in
drm_display_info.is_hdmi by drm_parse_hdmi_vsdb_video().

This driver calls drm_detect_hdmi_monitor() to receive the same
information and stores its own cached value, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead.

drm_detect_hdmi_monitor() is called in vc4_hdmi_connector_detect() and
vc4_hdmi_connector_get_modes(). In both cases it is safe to rely on
drm_display_info.is_hdmi as shown by ftrace:

$ sudo trace-cmd record -p function_graph -l "vc4_hdmi_*" -l "drm_*"

vc4_hdmi_connector_detect:

    vc4_hdmi_connector_detect() {
      drm_get_edid() {
        drm_connector_update_edid_property() {
          drm_add_display_info() {
            drm_reset_display_info();
            drm_for_each_detailed_block.part.0();
            drm_parse_cea_ext() {
              drm_find_cea_extension();
              drm_parse_hdmi_vsdb_video();
              /* drm_display_info.is_hdmi is cached here */
            }
          }
        }
      }
      /* drm_display_info.is_hdmi is used here */
    }

vc4_hdmi_connector_get_modes:

    vc4_hdmi_connector_get_modes() {
      drm_get_edid() {
        drm_connector_update_edid_property() {
          drm_add_display_info() {
            drm_reset_display_info();
            drm_for_each_detailed_block.part.0();
            drm_parse_cea_ext() {
              drm_find_cea_extension();
              drm_parse_hdmi_vsdb_video();
              /* drm_display_info.is_hdmi is cached here */
            }
          }
        }
      }
      /* drm_display_info.is_hdmi is used here */
      drm_connector_update_edid_property();
    }

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6c58b0fd13fb..ecdb1ffc2023 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -216,7 +216,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 			if (edid) {
 				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
+				vc4_hdmi->encoder.hdmi_monitor = connector->display_info.is_hdmi;
 				kfree(edid);
 			}
 		}
@@ -255,7 +255,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		goto out;
 	}
 
-	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
+	vc4_encoder->hdmi_monitor = connector->display_info.is_hdmi;
 
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
-- 
2.25.1

