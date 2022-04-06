Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956AA4F6615
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2F210E0F1;
	Wed,  6 Apr 2022 16:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B3E10E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:55:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j12so4157794wrb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Brc5sUVC73xpzNVMY8eIEmfdgN51pWWRYrH2qSgq75o=;
 b=nT9FCG1nc9hgRjXNNEpzWPUpQ5PojjQAMUumt/NiFssL0aqZRp/qouxeaDAXsBdAjm
 wK0dL/+Z8a9V4Puu02rv2z0du9c1gtbLgKuhXN68KFvnfqs5qOZmOJBD++mWiRRvOv7D
 LCZ+tPcEitRE8DSB77Ko1vPjl9VahjMnfmwoEqmxhVkzdAbZ76Esu+FPHJfFijdNX/Rp
 2r2LWIl7Z4qZK8f1AZ5PSAqy8vgxwsAMlHjxz/7jKOdZDvsdvG7E2VjHmdMBgc1Gz0MV
 ezE4GkIxyDl1x2Ty7rbohCgUqRZmHg7XndH7hqHdH1+F62idcmQypsSeaZlDeHFQfPRG
 PA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Brc5sUVC73xpzNVMY8eIEmfdgN51pWWRYrH2qSgq75o=;
 b=DlTJktjYlCivsMo4tktL7zKaSEOqmzrD4OXg0aW8f1lm5rakdtRWspHS/LrFKbiXf0
 2pQG6R9jc/MtZPES0SZH8A6ff4ig1EDlstgeQy8Pxj1FSNy4c5BhGitp0r1AcSZAT7N1
 giYbU2SSIphxICNMTPIn5eEENvPpMqL5FAqwrZYeNK/31QFFjqx4Cro3co4kBeiwcOQt
 SsgW0KVFQFUKW9fc4+GrpC3yN7ZH8mds+bddm4uA2DXzHS01TXWHMmRLjr7ljX8Wl3Zn
 nmkJyYsGsfshEU+pLIU1CzJfFEKkSsfyv3N1l9n1/M5Qk401AbarmDCVNe5YGK73nHn7
 dksg==
X-Gm-Message-State: AOAM531hKeFnU9bdVzgR0co2CppvrgcVYvkd8bbAkA20ueigDuZJS1RP
 kEQUXNqhwhYVYdUV/rXDu7A=
X-Google-Smtp-Source: ABdhPJyPO9myg44y/8FXgf9FElA/EI9EQTODsY0bVDuMEU4VBW5owNAPHxuejsQgef0qBC7QlPorHg==
X-Received: by 2002:adf:e104:0:b0:206:109a:c90f with SMTP id
 t4-20020adfe104000000b00206109ac90fmr7374435wrz.259.1649264129576; 
 Wed, 06 Apr 2022 09:55:29 -0700 (PDT)
Received: from localhost.localdomain ([217.113.241.148])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm5694484wmq.9.2022.04.06.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:55:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH 1/1] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with
 is_hdmi
Date: Wed,  6 Apr 2022 18:55:14 +0200
Message-Id: <20220406165514.6106-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406165514.6106-1-jose.exposito89@gmail.com>
References: <20220406165514.6106-1-jose.exposito89@gmail.com>
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

vc4_hdmi_connector_detect:

    vc4_hdmi_connector_detect() {
      drm_get_edid() {
        drm_connector_update_edid_property() {
          drm_add_display_info() {
            drm_reset_display_info();
            drm_for_each_detailed_block.part.0();
            drm_parse_cea_ext() {
              drm_find_cea_extension();
              cea_db_offsets.part.0();
              cea_db_is_hdmi_vsdb.part.0();
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
              cea_db_offsets.part.0();
              cea_db_is_hdmi_vsdb.part.0();
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

