Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E16874C5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 05:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061C610E039;
	Thu,  2 Feb 2023 04:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD90610E039
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 04:57:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 e8-20020a17090a9a8800b0022c387f0f93so4440189pjp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 20:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HEXNGmvImDiIabX0ha1Bsn0g9dYiCmRV9oIQI3tuzTE=;
 b=ESpEpRiNOlnHvH9iNu/RZlLGQnQ96XRBURzcxRZVB28y7PlIkfsK/EAyAPBMfbFPd5
 BHhZKgH7VX7HQwhFASIBKcWbVepGgF1zn88RUpIUIVWkNJKcLSuTVxk8t1Fqj9H6WPG7
 NxDmDF731XI7VUDgqABnlgaIORhRosSMgWIMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HEXNGmvImDiIabX0ha1Bsn0g9dYiCmRV9oIQI3tuzTE=;
 b=3uSk2kw4Umy/p0qcwgxohAQ02m0lXxZbECJfIx3/lPOvmtcsgpjDiupF3O3j7znSQl
 VCXUug+qdWb+K3e9Ya9NIY69nJmiaYT0dEsYG9fiX1s6JfaghzfpY6vF6CSYqoLKrPs6
 qg/TIqD0c2/3XWQC/uUctM5v4LwHyXcvsrd+gXU/8Wcabkjdb1AO4eGxlfcmIWv4PaH5
 RrACXGfSIi/Pdax5T4Kv1CV50nr+lzPpRE+9B1svqW9lwKyW6w/T5D9FQ1JLqQcgkW0k
 Dqy7qstvq+ovJoCtBQzmaDaBEuG4tkcMEiznNj/JYoUDo1HJrUT2IZx3iN/Dnu/vvEDK
 r0ww==
X-Gm-Message-State: AO0yUKUq1Bkush131yqXnqFiG56pKE8MPbrePQ1hOmmrJnJD4W6MPzNd
 7UHLa3ityZClBNWSZXq873gZSA==
X-Google-Smtp-Source: AK7set8WyD5ReUIueqrJ73xdpvTR1OAyoDOAo/QkEW005hwgtutfWFDZBrKjjW302/sUWzEzjRRm+Q==
X-Received: by 2002:a17:903:11cd:b0:196:704e:2c9a with SMTP id
 q13-20020a17090311cd00b00196704e2c9amr5774070plh.22.1675313858323; 
 Wed, 01 Feb 2023 20:57:38 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:68a6:9bbd:a36a:4d1f])
 by smtp.gmail.com with ESMTPSA id
 ba2-20020a170902720200b00186a437f4d7sm3667203plb.147.2023.02.01.20.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:57:37 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if bridge is
 attached
Date: Thu,  2 Feb 2023 12:57:34 +0800
Message-Id: <20230202045734.2773503-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MediaTek DisplayPort interface bridge driver starts its interrupts
as soon as its probed. However when the interrupts trigger the bridge
might not have been attached to a DRM device. As drm_helper_hpd_irq_event()
does not check whether the passed in drm_device is valid or not, a NULL
pointer passed in results in a kernel NULL pointer dereference in it.

Check whether the bridge is attached and only trigger an HPD event if
it is.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes since v1
- Dropped prerequisite-patch-ids
- Added Guillaume's Reviewed-by

This applies on top of mediatek-drm-next.

 drivers/gpu/drm/mediatek/mtk_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1f94fcc144d3..a82f53e1a146 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1823,7 +1823,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
 
 	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
-		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+		if (mtk_dp->bridge.dev)
+			drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
 
 		if (!mtk_dp->train_info.cable_plugged_in) {
 			mtk_dp_disable_sdp_aui(mtk_dp);
-- 
2.39.1.456.gfc5497dd1b-goog

