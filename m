Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4FA1490C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0FF10EA48;
	Fri, 17 Jan 2025 05:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="QN0ESkbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CCB10EA48
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 05:05:00 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso30661625ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737090300; x=1737695100; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kv75voyZV+5wj1rCTi/H5IxduQD+JzMUTiBVDefdHgo=;
 b=QN0ESkbRwFHVUlVk79oeU5CnJkBDfMHzXrgZMRLwCVJAPAVktWZTB4ROUAxXTOSyEp
 rmLqyGpLetJLHRkVJqfmmG9nnTd1kV1Ui7Zo+zhVF/4ba8txyxSNd0dNHRhcznduP8sh
 ACgrU61dGhBT+n/jq+V+eo1NigjJMscruTgaZhiQo8ui9bCKm/lA1RfcMhcbySsFiTyF
 Gz0vEkop/304ewaMADIA2KGvKFAi6nvB1lHtawlRab2smD/MQMU2mOZ7wfTeCtFR2yDZ
 i+hLPNO5HH2usP+38lJt/hKqT2f172PXytgjEAm0TWU6VSnDh451QlxEAXh96Xho/dMk
 Qjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737090300; x=1737695100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kv75voyZV+5wj1rCTi/H5IxduQD+JzMUTiBVDefdHgo=;
 b=FWVsToK2mKaA1eOCHFVYVFEv5FGSnNyo9RhYkCFIIeYGI8sY+EWwtzYHFkTrNwQcKh
 pIXtw2S+IUQ4RgHCmI1Sc3abwLsQe9pk3b7c2n+p1uC3ixNOUSu8TSulld9/e3MNhjb7
 7L5cYBX2pjxxIwDGoDixdabiqjL4cK7KCqrPvxpWVJGeA0v6rMeLPNqFRM/GERP+XYii
 WUMmWA2hWe3acu3ZDb0zo3xrrsM8A2eMqJRGPoY8mX6VAhIUule+yz72OXuPbGBgX/ZR
 dzaX8irljQcL/nEBdk9jeL6aC+HXbz2I4UnnXldVjCgdkzw/OsI8lWeMSWNuid32yie0
 kQ3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCViDKJ//JES7ES3ZrSQkUTXbzlsWj97Woq5KGmt11yWHqqlfHZvigvDcw+Nq9ns7EYo6a+jiWk38Ow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqQ9nucl+HLrz2LVFTJFcD50EAMDcPUKTzjW3Y6G4O7Yg40fL9
 mRaMl0TBVcPJwvJAAqAN1PLhs3xhT7MzKVrPnML+aXno/eK7l1E7RLOEVVb/2lo=
X-Gm-Gg: ASbGncvMMjyWF1Dtwshu9GabWCoN0vBnCnkvW2vmLuAg24FcESN9UvWNq8b1yrIeM8s
 Duv/AICqI0C3xNI+kC0AETLDIFX/ih52tmwqkBnvQs7XpG7o6zFPpIyREQF2ddDexpvwzxG+mSL
 BOa3RugnI2JmxsmufRn3qFcxi3gXTJwXTPj8/CQfhpOFr2cRJntFfNa1oUCb5ONtX2R1dCg8/Po
 UVW5UK/gSXrsB8zTSwbjG/rP9A+V65vKO6anAEPnOH76bwTFHw/Me8zdgfBlC9xr16qqo1zVUYM
 h3tqgd5UfERS98uLgML+ta0YlBiA
X-Google-Smtp-Source: AGHT+IFxv/Vp4SFEKUsmv7TPxoOc1HWCDzS8/OI2knXHjwyqeg9SpYqyCRLnX0zXZ2iNUr+tnmtDsQ==
X-Received: by 2002:a17:90b:5445:b0:2ee:741c:e9f4 with SMTP id
 98e67ed59e1d1-2f782c7779cmr1977444a91.11.1737090300068; 
 Thu, 16 Jan 2025 21:05:00 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c1511b2sm4591710a91.3.2025.01.16.21.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 21:04:59 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/4] dt-bindings: display: panel: Add compatible for STARRY
 2082109QFH040022-50E
Date: Fri, 17 Jan 2025 13:04:53 +0800
Message-Id: <20250117050453.934900-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

