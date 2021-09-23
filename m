Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD04F4158C9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08066ECEA;
	Thu, 23 Sep 2021 07:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD9F6ECEA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 07:07:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t7so14060523wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/81sSyyxvMo1ibeq3AtPzZF+vUWnLboV86d+Wu7gvLo=;
 b=XGz7zHiTqUzR1wmtOzMHkib8qZf+yqVPgG2Kxb9agUMdSa74B5PAzvnGhksC0J61l+
 gbeiTnIEg4T+LXsyNjyb8+oXknkm2d/Q8jBLRCOFQVRVy/EEhuldm9M2V7ID34rXkSBD
 lMm8YTqbFBV8J4U13o4EGthVqG4ZlgyCK8F68hvY5xwUJqRc8z1Qysp7LJoRKtayA+lw
 wAAYh256XFoyaSzuZDSBY0d7s41VjvDgFX5ZlbvxaPKtNYr4DUbnw36ZwuP5Oz5PwvcD
 c7JUf8XtPzX7fmi4lhNTgjLjWZf17Tg4jXSKFgJkA0NbE/Ikl35HtkaWUTbZGy3ECct4
 SsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/81sSyyxvMo1ibeq3AtPzZF+vUWnLboV86d+Wu7gvLo=;
 b=kdQxBMGkc7S2Ol+SveXXT6IZ3F9uPnrIkSThssjZ+hK9JqEy1Bdf73krnXpJ7+g+NQ
 47eRRy4/e5u8vzTvhDtC1PvcXeQS7zsz0dNStJ+fSmFcReKztlzQ30cTWyp+GmxjXLBE
 0PfPcfji/poGDPmnEwtvcTB6l45DNTIhDEyLU7wiNfaSZgBCr3mGefI0CuhLclLoyH8v
 YeJymJ2YVPUW6TmqL/QjZyD+DsOE6xzlb8zq6+wBW/6naRsZs9vfPXLto1MSawc0Rjnf
 p4s/Mw5+BApLTUt72Kd1svCoZeHncuXMeS5IDhu+jGhlAC8Hg8I97gJ7E8yMjhoQV58Q
 pQ2w==
X-Gm-Message-State: AOAM532fv31TTlCoIjUrzKdTrvwV1M+0df2KizBpfcWu6zjNAu1aChzf
 XkOpaGmKcYnM6Icf76EiFhi8s1B8VqJXdnyQ
X-Google-Smtp-Source: ABdhPJzvK6+kkW7WQP3/h9qj7aFOHACeP1+5CPokeFbIVV+WS6TnnNKWAZewOmf9t7VSKZ47PK3nZg==
X-Received: by 2002:adf:edc7:: with SMTP id v7mr3218835wro.63.1632380825408;
 Thu, 23 Sep 2021 00:07:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
 by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:07:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 2/8] drm/omap: Add ovl checking funcs to dispc_ops
Date: Thu, 23 Sep 2021 09:06:55 +0200
Message-Id: <20210923070701.145377-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=narmstrong@baylibre.com;
 h=from:subject; bh=Wlxh4ChQtQ3J8QTuldvFif6dgGSQt01TuE/tUnTUmZU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchLvhFU34Ve0/Nb7xWC7pqWPlUGUB7Oe3pfZy0
 i0xGPk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0Y1yEA
 ClKhNhzDjL7ymUKnrKgJNt0URG2tcFseQ2cMa/nQz3M185rpH7m2YpireAuB2fEh63xJgSNC6uMD71
 5JFxzRR9Ln8mOzVI2HibMsVtdqlHcKNmyfVsHqQEe7APDXKOEyzVPkCk52PcUM1gWTvjhApniBuOzq
 WETV6RA8HJpPmea9S4H2A7s1ANetH6mjKmtdFhjJejk/KbHT9BDYmL31lrUkscJPmFqQG1In0h2J6r
 CcuMVqPIFrw5VM2Y6Xj18DEZBbu9RSXYe2UDDmswX+FFPemDEQhYlL4qGy+NHJ2esGlkyWjKUMnUVg
 gRZrAh+s92M+j9XblWS5Yz12QnuUMzSqIT80Yzk+Jhn8ztJXJQnL2csjpKEcAMBh0brzA8zJxU1XFh
 cqZKoFZgla6vmUCHzgu32HnCgJVkjbeh+glS0InDwdV1i1weAm0RbOdzA4avP8GWl5flcnKt9k2YlI
 84RhCeMBzZsUZ/sblrwNTGAsWYMiqwKdl3GCR684p+yuXPtHYXn+k6laRh5r7i+OIxRwAYJUZSmjYx
 ZAkgfh0J909RbB4FJqQryJP7CO7OfIZY84Wu5yKGqr8vBJpsMjLBmVSsycq6BfTP/wcEUQyj5exTin
 kITumX6LNqgV//czhZU1/j5VKlc5RsThZ28nL3THaV+sRfF/eGD13m/8vZ6g==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

From: Benoit Parrot <bparrot@ti.com>

In order to be able to dynamically assign overlays to planes we need to
be able to asses the overlay capabilities.

Add a helper function to be able to retrieve the supported capabilities
of an overlay.

And export the function to check if a fourcc is supported on a given
overlay.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++++++--
 drivers/gpu/drm/omapdrm/dss/dss.h   | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index bdecec8f4d88..df945e4b1fd3 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -1281,8 +1281,8 @@ static u32 dispc_ovl_get_burst_size(struct dispc_device *dispc,
 	return dispc->feat->burst_size_unit * 8;
 }
 
-static bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
-					   enum omap_plane_id plane, u32 fourcc)
+bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
+				    enum omap_plane_id plane, u32 fourcc)
 {
 	const u32 *modes;
 	unsigned int i;
@@ -2489,6 +2489,11 @@ static int dispc_ovl_calc_scaling_44xx(struct dispc_device *dispc,
 	return 0;
 }
 
+enum omap_overlay_caps dispc_ovl_get_caps(struct dispc_device *dispc, enum omap_plane_id plane)
+{
+	return dispc->feat->overlay_caps[plane];
+}
+
 #define DIV_FRAC(dividend, divisor) \
 	((dividend) * 100 / (divisor) - ((dividend) / (divisor) * 100))
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index 14c39f7c3988..4ff02fbc0e71 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -398,6 +398,9 @@ const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
 					    enum omap_plane_id plane);
 
 void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height);
+bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
+				    enum omap_plane_id plane, u32 fourcc);
+enum omap_overlay_caps dispc_ovl_get_caps(struct dispc_device *dispc, enum omap_plane_id plane);
 
 u32 dispc_read_irqstatus(struct dispc_device *dispc);
 void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
-- 
2.25.1

