Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C330C5FF0C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD010E28D;
	Sat, 15 Nov 2025 02:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGgpsKtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2F410E28D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:58:36 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3434700be69so3317909a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 18:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763175516; x=1763780316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EmQqivhlvMtIMdUDuewY+qml6crrlkIneJlSDxjEak=;
 b=MGgpsKtfsOOXc6QcSALw+p2uefryKu28+uzj/9UHqgECHG3tIhjYqnh9HLtiQagaqv
 EuNa2t5kjeyV85BnoO4qfnsodkbzMai0FBkSYX4Pbvs+V21WQONkscd442TRNXZgpsxR
 yfZSWKLOl8UXd7iJ8azybFWI+WmvDINwvEBYnpvQX76hHcsdWdGVh7gVy7iPIFbgvDFV
 NXB0B5RPdXyYml6VcvNA3OZmy4zS8NuqhYEcEis5yROU7naRxIw+CPlAsisq9h6voKRZ
 y7CMKWb9AzcxBdvu/cFjg8KmcOpAhr7o99VSJHarYkqQTQ0XD+rv6kKrNryZ5ZqwFRzR
 by6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763175516; x=1763780316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9EmQqivhlvMtIMdUDuewY+qml6crrlkIneJlSDxjEak=;
 b=heIxgZcoAuiT3cOIX98GnAc0UtjWpOwmlPpCS9F/B5QT0mkBlKAF4oa6/dJHlSQh6q
 5lzTVOGb8jQMxqG8VR5xrTMCEy+rqjTkDO6U2kC41FM3npMJUfMro3UoxymreQnMJQM3
 +Wjo1eQjEKDx34+v3+ZPMgfqXbhN2/rzCJ9gxfTsd79J1a5izqPW1yvkvipaCfLQWnjZ
 R93qMzn0eLYvMaDWHxvTofIRN3pLPFETG5ZF7UHvomK4MQv2ZaVrvAbtjw2lquIF/0sX
 CpS6j33z13zSQRZVfDUveeaxPECW7Vt3FjC0QYd/hV/ZDv9Dm5ItguD/cwSnramV9oKZ
 yziQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7LL6dXCjFPb/5ZBfJpSZZhkNJHbYN+HN3s0092VQbKR+tZMBaYu5jEXRrr7vcN3lcPNrIIYEO9jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpg1/tri2mBrYNVUWuFttEuknUZo1XrcLR41pZ0f8Le+3tHto9
 TMGjYcuNSKOF0Pv9ZOWokL7AxTxp3XBh5MCAVfXPhkWHmYB9BmdkwgHH
X-Gm-Gg: ASbGncsfgRoGJu6HDOUmg0c/JkuyNHow19MN9F+L4rXEDrS287xLjWXYDecrM2gUkeE
 MXlF/WoGwNh+YZL4758i2IGyCuhdihQVGJ4gTdNSi6adAKLAr6D34pdfp7E2wtSvzno5JlhM1ZD
 SCx8b78HKSzKUGDA/3IJFf7qSgl7RpZJTiaguM0Nxts6Zf8tDdh/Syy3ZcColp1ub0oBW5W7RAs
 i36FhVqjOv/czik0qp4D7MRjjSWUe5h+ztU4/qEOkuNIvasYQP7EHp1DvW3WFTfTXkd5kYOXT99
 Rrh151tkEXS7Ox+4JqvZuX7ad+M71Yvb+qlEuZc0Gsp/WZSbfoc3EjNi/ZcNZY55On+XWsxq4rC
 r+tRAunuyqF2Rw/lklSkhdtWe81m2QwdgAsNpGFjY06RVcJOAdDqj6dnME0u/chZXuxkUdnrJ2u
 w37fP18yK5sIvSnrEBdXjHzf4kxR6romS5sSE=
X-Google-Smtp-Source: AGHT+IGJ26UKrVpxFhQj/AXU3cvFCNrNNP+U8hJj43Em3kYnSKrKKjdFQa3dTP34XOwI2VgfiUGi0w==
X-Received: by 2002:a05:7022:7e81:b0:11b:9386:7ed3 with SMTP id
 a92af1059eb24-11b93868327mr191232c88.48.1763175515943; 
 Fri, 14 Nov 2025 18:58:35 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:735a:fcf2:fc15:89cd])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b86afe12esm4215227c88.6.2025.11.14.18.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 18:58:35 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] dt-bindings: display: simple: Add Raystar RFF500F-AWH-DNN
 panel
Date: Fri, 14 Nov 2025 23:58:26 -0300
Message-Id: <20251115025827.3113790-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251115025827.3113790-1-festevam@gmail.com>
References: <20251115025827.3113790-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Raystar RFF500F-AWH-DNN 5.0" TFT 840x480 LVDS panel compatible string.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 35ba99b76119..a8937298c2f6 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -270,6 +270,8 @@ properties:
       - qiaodian,qd43003c0-40
         # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
       - qishenglong,gopher2b-lcd
+        # Raystar Optronics, Inc. RFF500F-AWH-DNN 5.0" TFT 840x480
+      - raystar,rff500f-awh-dnn
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-- 
2.34.1

