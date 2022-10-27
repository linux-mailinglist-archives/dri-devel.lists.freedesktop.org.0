Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4C60EE7C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 05:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEE710E366;
	Thu, 27 Oct 2022 03:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AAA10E2F3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 03:22:12 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id h14so281046pjv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 20:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CAdp5j8ulbSqSMP5WhQQ65OXGcxKYysV58XuMaNjzUY=;
 b=gy3HWQyvWny4e6D1XXtgdsCcjIx6Rzbj2W5EZH2Iy54P7OmKCs88Rlz49SuKony4Jf
 opZrpoerdjb//gzLAO5Ny+kSF1OSL3hdDDJOqLyHlHs3JfNCDsD3pDo6ZZMEZTZfWyT+
 0QYIUMsF3UdyP9syDq9uDbz0SQqub8LVZBve4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CAdp5j8ulbSqSMP5WhQQ65OXGcxKYysV58XuMaNjzUY=;
 b=J63bi2DXQu9UQ2CByRJdIhwWq1YWX3SrDNvRtARPH0KGxgArlbTjeS+ApcmoNHccAv
 RPl8jYSby+OHwJkdrsRcoi6Si9vr55Y/TB3ETLC9Aj4Q0Xt2kAMSnMOJD/BNpaSIjEZq
 Sl/RIkcCaFQq3hfFepqyVvfUe/0aKoXy0VkSnbvyj1QxiSS6Vb8HX4HAzVZ8x8cAd42H
 fuY0o5zgu7/yZDlmEkwU/fV2zAtLSklqJ9TYGRPMSp4su+/KclJw4Y58de2rvWq39qgH
 fYo+x8wIRNGQ1WRFWCnJHDAoVYUSekINcO9kBcZuQnrFvpZeMAZGL5DS6rO59zG32AXO
 qe2w==
X-Gm-Message-State: ACrzQf08QC/tH1hnBrkk2n5Tq6gytv+KucvKm8fMxCJJcJ96Nq/VNIzY
 8Svfs5s14qO0aa7FsoPq5zNz/KYkKxyCjA==
X-Google-Smtp-Source: AMsMyM7ISTd7H5l+G+sR0cdRQnp4XV0OGpkEeWvzyTBCL/fYpUTGshzgfY1/BntVE31+WRiqRg0a9A==
X-Received: by 2002:a17:902:708a:b0:183:88dd:1d36 with SMTP id
 z10-20020a170902708a00b0018388dd1d36mr45241452plk.166.1666840932382; 
 Wed, 26 Oct 2022 20:22:12 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:3790:5571:53c5:e671])
 by smtp.gmail.com with ESMTPSA id
 y129-20020a633287000000b00464aa9ea6fasm62884pgy.20.2022.10.26.20.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 20:22:11 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/bridge: it6505: Fix return value check for
 pm_runtime_get_sync
Date: Thu, 27 Oct 2022 11:21:49 +0800
Message-Id: <20221027032149.2739912-1-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
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
Cc: Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`pm_runtime_get_sync` may return 1 on success. Fix the `if` statement
here to make the code less confusing, even though additional calls to
`it6505_poweron` doesn't break anything when it's already powered.

This was reported by Dan Carpenter <dan.carpenter@oracle.com> in
https://lore.kernel.org/all/Y1fMCs6VnxbDcB41@kili/

Fixes: 10517777d302 ("drm/bridge: it6505: Adapt runtime power management framework")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b929fc766e24..21a9b8422bda 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2699,7 +2699,7 @@ static void it6505_extcon_work(struct work_struct *work)
 		 * pm_runtime_force_resume re-enables runtime power management.
 		 * Handling the error here to make sure the bridge is powered on.
 		 */
-		if (ret)
+		if (ret < 0)
 			it6505_poweron(it6505);
 
 		complete_all(&it6505->extcon_completion);
-- 
2.38.0.135.g90850a2211-goog

