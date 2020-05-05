Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB271C5CEF
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73DB6E7DB;
	Tue,  5 May 2020 16:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D918A6E5D5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:05:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u16so2942458wmc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Lg+gPF2P0MEgQL05rDAB/dXUVq400Yz6N4qXpQCO5A=;
 b=JaWXAoJklRiuF6MmIYIEcwbZXJDKW70vF6webo/ITMZsjhUqm7mJ088PRDxFkBMZ3y
 Hcqos8s0cCR+TD1Y/rj3q5vZRzw8B3e9208JOfeRKTWlPuXBzcZasoFgRCRcqERw39PC
 DiT9iJwBUU91azVyqJi+QNpCvexIMwQIXbnqQ6qWoS4RgJSoHX0BpREqoAY6zl0XOf9P
 TsywwlOlanP9r0nJJjvxXEYiN8Zh6qwhvmDkJEBhsJV7QWbPT+GqJZ1HIPu21tMrbHqu
 H+U/t72+8yJC+kzt3nJlOujhLNi/olkLLmQBugciQtZFU9TbkCiIMcMc6eIoZTrqR+ql
 YgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Lg+gPF2P0MEgQL05rDAB/dXUVq400Yz6N4qXpQCO5A=;
 b=dJDBpjWabzb4mXnhKv28GTOyeIPdo0sDyYMpkr59etx4mavqXlJbmgvQHzbzlNReSL
 kx/5h2mAIsJb6ZaKUilzh9+itMa4VTznY6RU+JEsuSBS589T58jN8mxY/362qeIQZK86
 Q9l6BNDQPbFbcGF46/PtuT7sBJCf9qbW5SfbKi/okjMdiZXI/YMkz8h+VueaqiOD9sxn
 VawEBtkYy2GpgCiB/r4CInJNPvlrvDzJpPnsomOo/xd/5uLnolYej0d/gp4YWmLbL/C2
 J+Ge/EHqzA8D1lGDH1d/PZvx7k55aGV267eWPlXcEvPi/Wu6R2GWDnLoYAJSY78xfmNz
 ZSew==
X-Gm-Message-State: AGi0PuZHHz35vFiz9qTSCY7nd1byP66b2hxJbz5LaaZgU1cm3DBJ9nXB
 iG2ZRWY2xFZyLsXCTL4Yc42zd/XX
X-Google-Smtp-Source: APiQypJ7UwzrgmnXlJhm0jvdrh9RmtJzGL3bWRqKRdVT29OlrJgJA3xb8VTYnHYpSOuST12xPz25Vg==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4404910wmd.117.1588694758238; 
 Tue, 05 May 2020 09:05:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id w18sm3803621wrn.55.2020.05.05.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:05:57 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/mipi: use dcs write for mipi_dsi_dcs_set_tear_scanline
Date: Tue,  5 May 2020 17:03:29 +0100
Message-Id: <20200505160329.2976059-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Robert Chiras <robert.chiras@nxp.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <treding@nvidia.com>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The helper uses the MIPI_DCS_SET_TEAR_SCANLINE, although it's currently
using the generic write. This does not look right.

Perhaps some platforms don't distinguish between the two writers?

Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Fixes: e83950816367 ("drm/dsi: Implement set tear scanline")
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
Robert, can you please test this against the only user - the Raydium
RM67191 panel driver that you introduced.

Thanks

Vinay, can you confirm if this is a genuine typo or there's something
really subtle happening.
---
 drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index b96d5b4629d7..07102d8da58f 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1082,11 +1082,11 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
  */
 int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scanline)
 {
-	u8 payload[3] = { MIPI_DCS_SET_TEAR_SCANLINE, scanline >> 8,
-			  scanline & 0xff };
+	u8 payload[2] = { scanline >> 8, scanline & 0xff };
 	ssize_t err;
 
-	err = mipi_dsi_generic_write(dsi, payload, sizeof(payload));
+	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_SCANLINE, payload,
+				 sizeof(payload));
 	if (err < 0)
 		return err;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
