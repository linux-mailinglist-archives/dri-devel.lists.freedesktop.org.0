Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F28B29F58
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810D889E9E;
	Mon, 18 Aug 2025 10:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O6foFGiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FA510E1D0;
 Mon, 18 Aug 2025 10:45:00 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-321cfa7ad29so3637651a91.1; 
 Mon, 18 Aug 2025 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755513900; x=1756118700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zI/Nt7+AGO/rMAajmGnpXgwvKkgy60LC/B+5yT8wMm4=;
 b=O6foFGiYQVmxWL9hqfEebollH/YxIqyE1SjPtN9oebb6vgYAG1tlGLyfLsuhGkwfBE
 aeduWpPPr+/XHT9U2DvWctMARdha1vhOD5VbEVo1ZVr9ryIADn5fOrq/UVtwfwDIqO2C
 QjL7R0xmv2W6eohWNJtVfZoqoRQOipqcD8nXDLKgjfGHdrR62URhcUB/tv82CvDR8XSS
 NjVjT9xlCGW1HnwcPqL8XLFPnoCf96e1bv09VUEhlk2SGETUF+vq1LJqIo+kGXuU4TCn
 JnvLWeTLfCH6qMTAD9bPstYfxZmjAVGkqxEXPoE2c81cOtJEVjxjwIrbwX7U2dowxUP2
 JdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755513900; x=1756118700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zI/Nt7+AGO/rMAajmGnpXgwvKkgy60LC/B+5yT8wMm4=;
 b=rA5RO9fYdnRrUMN6Vwb7uCwdvwULwJHAbvoe3T/bn4KIBmyocZ1tvOOL36EL95hOPs
 rfr7oHcqLV69m8JwSVNndAwo6KI89WH2r4awDQX5Y1QJBYhFRKrdUeZ19H0LKPJNqyWO
 AR7rzdGqVt/KR0LxtPSqzhP45pmyihL3Hzqeve12NQkmpDnu1Rbh6T8y6AU1+WFDWSf5
 1WXJROi8WqHNpV0Om7CR5VNWfSOBjIkTvFEJxSLjNJDlbrF+RWSunWrTquY1sDghSeYW
 jEzO8SIr6wFSxBMXKoAcQnwP2NYBYaV6xgO19cDJwGiRnDjKT1e9Q3yuxyMaQgmXHCx7
 i6HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNFXMe18n79+JY0tTEcfaLFNrZzBBpNZr7WLOkN7ifyVMazkmxPG5T1W6+1AGeEHvW5nkBSwi+5w==@lists.freedesktop.org,
 AJvYcCWIgCGWV7sZioW7AbDfDXS9McpnksPVw6iRL7e8omZOqmFy/8YNJjev0ELoLKq/CAz5AeQfEA3Szyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPUEeGWSV8thnqgASyHkFxDFHtFASbL3cac/UFW+5W3sPIeSfl
 dEHNm63uX1kbrGrGTdq3Jp2pi+/5skYvYXhLURtG7qMpccqIRgZORA8K
X-Gm-Gg: ASbGncvDG+ERVj0f9R0c0m18duzIbmG2Nnn1w0fpI4YzPNhI09Em8qvl89FwgeAfWRP
 Rd9GMZWGGRhL20ocGt0qCB4r5R0+MKvvGbVo1glUHFtUaXJMvcVraEcC/8uPs58cE+07ubvyJhY
 V2xa5BYoH+fsZ3I/dvkLv6D1wl/jMNvuynaZn6cQAoDMwbD5F1d8c/DDxXntTCPeP5LAu3Jt8Rr
 GoUzBJgqm3FTJLRty9agfqVgUBiIEDn+wUK4gBZpG3HFaNawaJG/k49Ob1sh8PeolYH0mJ4DN0P
 h1s57052E1NYrs4V4RbYYNZP54lKUsgxEQZULyqpoF7l4h0tcNTBcdTdeA19lHvySHYOsE38mCu
 hWV4QHlktqRe6fIGsK3RcWywnCN6ZqJHcruYlyPiDkcxfPkU=
X-Google-Smtp-Source: AGHT+IGc3taSpgAHHOh+V9gwAudEbx1xMbNbGjmO8awFFHCg5952fVvLo7stUlBiQSuCkc+xHp06sg==
X-Received: by 2002:a17:90b:2c86:b0:31e:f36a:3532 with SMTP id
 98e67ed59e1d1-323297ac223mr24272393a91.13.1755513899400; 
 Mon, 18 Aug 2025 03:44:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8899:4b76:ead:acf9:f900:1070])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b472d5a6df6sm7793773a12.1.2025.08.18.03.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 03:44:59 -0700 (PDT)
From: darshanrathod475@gmail.com
To: lyude@redhat.com,
	dakr@kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] drm/nouveau: move assignment out of condition and fix spacing
Date: Mon, 18 Aug 2025 16:14:51 +0530
Message-Id: <20250818104451.916585-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Darshan Rathod <darshanrathod475@gmail.com>

Simplify conditional logic by moving the assignment of pll_lim.reg
to reg1 out of the if() statement. Also adjust spacing in an if()
statement for consistency with kernel style.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/hw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index 8b376f9c8746..165ba41422a5 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -172,7 +172,9 @@ nouveau_hw_get_pllvals(struct drm_device *dev, enum nvbios_pll_type plltype,
 	int ret;
 
 	ret = nvbios_pll_parse(bios, plltype, &pll_lim);
-	if (ret || !(reg1 = pll_lim.reg))
+	reg1 = pll_lim.reg;
+
+	if (ret || !reg1)
 		return -ENOENT;
 
 	pll1 = nvif_rd32(device, reg1);
@@ -747,7 +749,7 @@ nv_load_state_ext(struct drm_device *dev, int head,
 			/* Not waiting for vertical retrace before modifying
 			   CRE_53/CRE_54 causes lockups. */
 			nvif_msec(&drm->client.device, 650,
-				if ( (nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 8))
+				if ((nvif_rd32(device, NV_PRMCIO_INP0__COLOR) & 8))
 					break;
 			);
 			nvif_msec(&drm->client.device, 650,
-- 
2.25.1

