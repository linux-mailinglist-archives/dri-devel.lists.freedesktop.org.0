Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E516E30FF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 13:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99D10E257;
	Sat, 15 Apr 2023 11:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2238210E257
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 11:01:05 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id k15so3568614ljq.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681556462; x=1684148462;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gxs5lrZiuUMHb5dYpFm0IIyfMKZX7kJZib+sRP8GGTk=;
 b=kdlO5bcc480qfQKisepn4Mr4sTybTQtn5tGn5m2rtYjUSm0Gjtx9zaWF0anm/S/Trp
 ggFU/W7Y4BU3H2UGjcxzVYASVZj3yCE/d0IiJM6G+GAH7wYPETYyUaGpLivow4Re9qw5
 XEuYgJA/fFsgxa9QG2MoHLf2wuRvk5ZjtOejmsbTr4iTd0L4JrbPdgwvABJnkvF6xI8Y
 if4BRED7+IMf87V3Zwyml23sGO76XvZsNsDoO7Pgj8sUluxMvmWFaxA1QRpfoIVwIcqc
 3C5GMtA5nvnbzgAS4vSEaAEIWKF/dL8xOk7m3+DQU3ZAtbYMkorGMT4z1tDUJz8vCGPt
 Wh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681556462; x=1684148462;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gxs5lrZiuUMHb5dYpFm0IIyfMKZX7kJZib+sRP8GGTk=;
 b=KxK6LjPLc1uCh7BPQOkDRNUvrnzk1MRuPxog1MA55cF3KNYkJYihK1zkMACVe17663
 5Nw17B0sqPkODvHkw9BONjyvTo7Sfx5SUr3zOz7lzrIsPv75qR5ns+VARKP0LwVTIk84
 CCUodcX9qJoahwsljRuD0lS+h/RF3hm5DfZVjar+SuBmi00pduiVhN5ijhC6HEt6tcUI
 PpK6WHhu6DsGoOGfP+JsCrHrBnOAZ/GtOEZ3GvWv+uYGcoGChBXZa32xUk7PAUDwRZtj
 l9dkSlWMhA2knPqz6UFaQtI1GcEvCwFCihSbhXOR5dy1z464SH9y8ThJtl9KTQW8Nvxi
 02Sw==
X-Gm-Message-State: AAQBX9fSgIrt5x63kuia28jpMamU69MtBgRJIqU3mZB9CRNzpofjhEVt
 JhYNWrBewH4rRvIHx7DN8+RBtmVAGXwhQ5Dl1Bs=
X-Google-Smtp-Source: AKy350bVjU523dSJdWRv3YB7nrXwNMFf/bpzrH+1dTJMw8eM6dkJ/1UM5ONhbyeFmmLTHRGZyoRWkw==
X-Received: by 2002:a2e:7c16:0:b0:2a7:6544:8e42 with SMTP id
 x22-20020a2e7c16000000b002a765448e42mr2680129ljc.19.1681556462447; 
 Sat, 15 Apr 2023 04:01:02 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a2e7306000000b002a77792f2c5sm1250470ljc.62.2023.04.15.04.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 04:01:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 15 Apr 2023 13:00:30 +0200
Subject: [PATCH] drm/panel: novatek-nt35950: Improve error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM2DOmQC/x2N0QrCMAwAf2Xk2cBWOyb+iviQrHELllRSlcHYv
 1t8vIPjdqjiKhWu3Q4uX61arMFw6mBeyRZBTY0h9OHcx2HEZzGnhLnYwkUrmmxvvMQpjRMxxxS
 gpUxVkJ1sXltsn5ybfLk8dPu/bvfj+AHXrGiqewAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681556461; l=1735;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GYsGlCcltfmdrDXO+aOe/68DSe4OLB+OCq4VQr9q5rk=;
 b=qX0g3RtIKAy8Nfq9bAUTgYgSz6DAnZPpT76Q7UeSQBoRm7gqApfY3f/4y8hglOm2kjT2dlObSL6K
 TK783grBCgyvBdW+Kh5+CCNxlGyjQtfUzV3PRVHcLhVHtNYdnfgA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a very peculiar case when probing and registering with the secondary
DSI host succeeds, but the OF backlight or DSI attachment fails, the
primary DSI device is automatically cleaned up, but the secondary one
is not, leading to -EEXIST when the driver core tries to handle
-EPROBE_DEFER.

Unregister the DSI1 device manually on failure to prevent that.

Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index abf752b36a52..7498fc6258bb 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -585,8 +585,11 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 		       DRM_MODE_CONNECTOR_DSI);
 
 	ret = drm_panel_of_backlight(&nt->panel);
-	if (ret)
+	if (ret) {
+		mipi_dsi_device_unregister(nt->dsi[1]);
+
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+	}
 
 	drm_panel_add(&nt->panel);
 
@@ -602,6 +605,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 
 		ret = mipi_dsi_attach(nt->dsi[i]);
 		if (ret < 0) {
+			/* If we fail to attach to either host, we're done */
+			mipi_dsi_device_unregister(nt->dsi[1]);
+
 			return dev_err_probe(dev, ret,
 					     "Cannot attach to DSI%d host.\n", i);
 		}

---
base-commit: 035ba5f9cf511b9299fd9c9d0688ef930d33c886
change-id: 20230415-konrad-longbois-next-847d57abb4d2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

