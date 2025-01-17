Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4BA14BFD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3870D10E236;
	Fri, 17 Jan 2025 09:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="c9+o4lJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC4210E236
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:18:10 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2164b1f05caso34799915ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737105430; x=1737710230; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kv75voyZV+5wj1rCTi/H5IxduQD+JzMUTiBVDefdHgo=;
 b=c9+o4lJKQEMhYQ9QEZTpBV7JZtlIQcD4qrKUXJuhZdwCMYvih7tBQ4shVdWGtiRAOF
 oExLnAWODVm+U8CZq3au4udu+aAQALfmllE1qqP5BSc3uKHka2GGZqiMze6k9pWii9Og
 VgyCOCOrEl2oHpbCAS2QRrZ8hN2ocrjqI615TqNyC66AvxNyzAbdLzu6HMZEswZSG3zl
 1h7lpmvi/KF69pWPSn6MeVjbub7Y0HFESicFnkDlQDO+P3ICx3d6W5DxKrQ4pnnTdfjU
 7YhyDqKiHowYjxmv/8jYapD06qcSSk9tORTFycRj3KIck8vOr8pjfOVwS93dEcgPgszf
 APSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737105430; x=1737710230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kv75voyZV+5wj1rCTi/H5IxduQD+JzMUTiBVDefdHgo=;
 b=Zpey9FaaWeyRvDdPTNNIZZmEpJoRqXRghoKX3FI6MjAdQA2rI3eMNI8mMt18wZZ7PQ
 YT1pN25k+w0Ct9Dn7/jYJId+sz598YutLSzBezwxZGJSmdmGVLJqbc7zpygYLuLZwi6M
 0elIrKcf6XI5f/jw0+UCUkwPmIZ7pzo4DnUSGrUucukNmkaVNyCbHVuutM8eO67BpV9d
 6ngulW3UBXw+P7fNRqTJgnNvcYsn+9E9wJsSPZ66bi9T/VqAuTtyf6pFxlJhPUSwgfak
 75X2OcWVTBPfg2ODSA2h1iBwX4Is1eP8bvrCbgmXSuJ7mm1jaUBxjlolAeSRSH63+FGB
 GCEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCHksb8HATOjw2YyWHGCRPWLmIrAcczKgkjq175ezAti5sG6BJXCPfvSyy7/gS/jgTCrl+ZKytCaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbFGSz77458LX8TRlrGTgBEsHBBrPBvAaqIzEAGAcEmJTZVJfO
 gzTKEYconFmOL8rKb2p+l4MaSygVhKlIsh7e0JCypks8k73X9HnghkXY6KaIxqo=
X-Gm-Gg: ASbGncti0O0XbcjDwrsvthmNo6DvwJGv/DXRNSslC28Jo11gA/3IXmuWem6LvFPPL0k
 9uO9QF1O+19UPXXu0E8jgX5jLlX3brAKVrQj8jjCVFYR0I022s/6a+3OKT/S1F3xesmZF+pF9SC
 O/fHEpf+ISnt3iMP6b6ZhYvT6/Y0oovSqILm4uVyRthp9lzLwhwcrYHBFy7IhbIuA/Wc1CV/3wV
 5sfZogt/MqyBa8gc8PzYZ7iip1iTD/dVpgabq4l47faBoYd6uZTYMfcQBNy9h5QWAMETd2lGNjn
 JKGyb72rhdbXLkdl/p5JTaGqlrGT
X-Google-Smtp-Source: AGHT+IFDzcnY1S9j6j6dsi2fgvb1cdv/fF7vzqTpNv3XE15NG5j4dFJsyXJu68v2zO0UZM58U2Am4Q==
X-Received: by 2002:a05:6a00:1743:b0:725:f1b1:cbc5 with SMTP id
 d2e1a72fcca58-72daf931e97mr3532352b3a.3.1737105430234; 
 Fri, 17 Jan 2025 01:17:10 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab815bccsm1421548b3a.56.2025.01.17.01.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:17:09 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/4] dt-bindings: display: panel: Add compatible for STARRY
 2082109QFH040022-50E
Date: Fri, 17 Jan 2025 17:14:36 +0800
Message-Id: <20250117091438.1486732-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
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

The STARRY 2082109QFH040022-50E is a 10.95" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index c771f517952d..75f7598ceac8 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -36,6 +36,8 @@ properties:
       - starry,ili9882t
         # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
       - kingdisplay,kd110n11-51ie
+        # STARRY 2082109QFH040022-50E 10.95" WUXGA TFT LCD panel
+      - starry,2082109qfh040022-50e
 
   reg:
     maxItems: 1
-- 
2.34.1

