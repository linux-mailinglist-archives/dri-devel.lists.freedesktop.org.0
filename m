Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC530B9CC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3196E8EA;
	Tue,  2 Feb 2021 08:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878A6E8DA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:12:55 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id e9so12034293plh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bXT4E5Sy6uZLs7wQdo5bJTu5WRYHheEqLaM47OwgPQ=;
 b=N9CZId4S7hNYbNn/EmNWWSAr8wF37aSzNhCtlBao3KDWLCsBnQnmZwcwgNMVJ+Qgwo
 aEvbUuzL0mg9ObRvaxRKPwBfDVNBc/IjdMlgNHMZ3Imd5TFB8ytiv7YYtsf12SVSmqA6
 D0RYUGNidfFwif5NovKfJrFGa4Yw/81TQFZvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bXT4E5Sy6uZLs7wQdo5bJTu5WRYHheEqLaM47OwgPQ=;
 b=JWclrU09ljHZF/Ha5yudPQp4+9qR0fMX2PoSzIRReCqEypZmhr6UtnOR4puBWSGkzR
 0oZTHTg7zZGcI+gSZfQgFaT2IyIEtJqHllKl0CX8qwdFVlAOgnlBGCQbE7/X2egfB7/I
 r5344mAZd5py9XoUya3OT/UZf6+z1GXA/DN5qiM4IbKGFcjUFH23NS3xuGr65rBWlE6m
 OraoGygxB2P8Gacqh/MhwT4O1VmmiI3L8DmOjakN3Ouykas3nvorzR4ADckEaWKehjIj
 7/YYSd0MKmC4oTJQM65Udk/XO342reDxQfrJqMhe/+LkfrWft2DSoTIeZJVdOcqegox7
 q5zg==
X-Gm-Message-State: AOAM532ziaSUHOXTRWa2ChG+TSgSG8zV43jg+jmBw/GGvSDql9fzhPf2
 WtYntH9yWiSd/Be2a/WE90y+nw==
X-Google-Smtp-Source: ABdhPJyLF2wHpV/D+HMLvMmxWe3iY+vP7l2QjMeBApFcWHo4WmvFIsbrCNchQ+/N5KYiGO8dwC/Qbg==
X-Received: by 2002:a17:90b:512:: with SMTP id
 r18mr3195381pjz.124.1612253575220; 
 Tue, 02 Feb 2021 00:12:55 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:54 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 5/8] drm/mediatek: Fix ccorr size config
Date: Tue,  2 Feb 2021 16:12:34 +0800
Message-Id: <20210202081237.774442-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Fix setting to follow hardware datasheet. The original error setting
affects mt8192 display.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 6ee2431e6b843..6c86673a835c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -65,7 +65,7 @@ void mtk_ccorr_config(struct device *dev, unsigned int w,
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_SIZE);
 	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_CFG);
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
