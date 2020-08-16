Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E39A245D43
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E795A6E445;
	Mon, 17 Aug 2020 07:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97F86E10C;
 Sun, 16 Aug 2020 07:32:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t23so10158745qto.3;
 Sun, 16 Aug 2020 00:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFZnS/H//cCqZ9Tw8SLrqXxLr+Us0XncDMx+0csqM/0=;
 b=Ee6estnCpmTZM2d8Ec7sUyucvgxufFBgzRNx4J7Ya3/fM1RgwV5Y1m5mIRvKjao3xn
 LC5fdc9me6r5H0/jPNtc1VKFoRbCF7l1lJzHFKX4Jrwb9lHeHnzqF4eBB7dSp4OdfG4v
 3w9+he6p2XM3o9yEHqUKW3zS9RsC9Jx060V287sDr976ZAJ2h57evfVm3wCQLuKiOuti
 N3bjHm2Mf6Vy8J/ajzy712FVyXVnLMNjm+ibmv+bNnYb6WF7mM65UO6dyoJvBeFGeIeK
 BK95Y5hWfbg1ZLDSveIMjaHqTuWaS26kA7odMQK2XdZ+G/GhNtJ+Y6MhgrnvBWaN/c63
 QbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFZnS/H//cCqZ9Tw8SLrqXxLr+Us0XncDMx+0csqM/0=;
 b=Mm8AynsNjiXVKWXMnvV7d6ZHJ7PZxxeJNnn1ey5u6uZRRbWzuXDQQL7O//BT9zrZCc
 oRtCXNJEuLdrSwDURrJNcZWV+yfYt53xZLhW5t098SHR2R65zv/M/5g+gnVcP94qgdYn
 hIRfSp6Smp8YgPhHm/O7LKx1y5j0zvtUutB+kAppzoU89IMZJd1aa5inJ0FLTmvw/3sq
 dsEn/BwAQ0MZaiajwVBW4py0Si0jKmd2syVDCdadkx8R8bsRNhsYDHbGcLb/R7T+CSxt
 glROCNCzKkcZnjAIjtKIhj0SfZyUKTgq+kd+U2oHVFp8PF+dChx3Qr+Bg/PxaP1YwRtc
 WMiw==
X-Gm-Message-State: AOAM533ZkLYDk7ETf5ooCv6+sebUO8gBsVMyWOoTXIWZZkAFyuc6G5ao
 k5N/TL5ikw0CYf4KUJEAntU=
X-Google-Smtp-Source: ABdhPJwR4kKG/SUUTDLLLFXMrlH6ZZa/0RcpTycMvCDMqdZva0Aq7jclXCddTQ5uuGc9JUMM2Ji4Mw==
X-Received: by 2002:ac8:604f:: with SMTP id k15mr8921302qtm.338.1597563139833; 
 Sun, 16 Aug 2020 00:32:19 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c100:b9d:4032:a79a:238d:9f7a])
 by smtp.googlemail.com with ESMTPSA id 2sm13231609qki.46.2020.08.16.00.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 00:32:19 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Rodrigo.Siqueira@amd.com, wenjing.liu@amd.com, Bhawanpreet.Lakha@amd.com,
 abdoulaye.berthe@amd.com, hersenxs.wu@amd.com, jinlong.zhang@amd.com,
 aric.cyr@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: should check error using DC_OK
Date: Sun, 16 Aug 2020 03:32:12 -0400
Message-Id: <20200816073214.980424-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Cc: ztong0001@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

core_link_read_dpcd returns only DC_OK(1) and DC_ERROR_UNEXPECTED(-1),
the caller should check error using DC_OK instead of checking against 0

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 5cb7b834e459..a60a457fcc8f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -4376,9 +4376,9 @@ bool dc_link_get_backlight_level_nits(struct dc_link *link,
 			link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT))
 		return false;
 
-	if (!core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_CURRENT_PEAK,
+	if (core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_CURRENT_PEAK,
 			dpcd_backlight_get.raw,
-			sizeof(union dpcd_source_backlight_get)))
+			sizeof(union dpcd_source_backlight_get)) != DC_OK)
 		return false;
 
 	*backlight_millinits_avg =
@@ -4417,9 +4417,9 @@ bool dc_link_read_default_bl_aux(struct dc_link *link, uint32_t *backlight_milli
 		link->connector_signal != SIGNAL_TYPE_DISPLAY_PORT))
 		return false;
 
-	if (!core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_LEVEL,
+	if (core_link_read_dpcd(link, DP_SOURCE_BACKLIGHT_LEVEL,
 		(uint8_t *) backlight_millinits,
-		sizeof(uint32_t)))
+		sizeof(uint32_t)) != DC_OK)
 		return false;
 
 	return true;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
