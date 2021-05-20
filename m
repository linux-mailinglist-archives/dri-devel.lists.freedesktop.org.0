Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C138AD53
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B96F410;
	Thu, 20 May 2021 12:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCC76F411
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:02:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i17so17364047wrq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=gJ5vwtlJY7kaNteg3cWUjwJv5QuZOeibKsxrj//n0jDmkoKtte74LApZcTlPr3qEqP
 Mzlsm32bjp2uf3LzaVXTu+oFZkLGE4pTbES/qflCNupCozcEmwvchzxKRUHqTfRKpNXs
 zEicCevttpN4sMsTEZ94vVRt504daIkzMKuLcw3vq1J0PIZIfEVUUHhct/UQaU/ZB9gx
 J5d4neL47KFQgbcS03O3OV+qSvgERINie9CzvOoS3MZgvX8kCZhOlq8BmHybvhU7Ozwz
 RqTuE8aFs3eZ8FW0ANRkzgtq4JeJkrDEZqY6jD+Talvm6SYqqFJfG/V/DGQCZbqQ2YnC
 QGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=lZoZvxMK2nnw8bAPD4kNWvJmwjMGkwTLuNssBzocod3p4epWzkw8MP3MR57S5GiTPv
 dsizN3utCPrdAdiQdL8vZt0nCNFCMLdsnElXJScpwpQ/fEWnX15mfaNjw54TTw7tfVXS
 EyWvUYaEpOPhThghNPAUdFXN2YChtDFGruA3TfxUBLKXFVkZbuxdB1KnHXkwNcmgaqBa
 rcL4w0T94zfh+JiP19rQANiOXQCzrTSW5iYKLBhIPCxXxpAOf/Xwg+QuduAMmVDIswFk
 n6NNEJ0uf3Fj32qof/vDH5uMUET757UZxtZqslbiqq9caPlWo1codKMlpx3vfuRrNGcx
 +zCg==
X-Gm-Message-State: AOAM532WG1ijlpQDqvOQkaw0iLTJDCJL/lgh+VPVjf6dyeGrfoQLNJF8
 t8abm6GLV6EPcqqWW4va9GaoTz26sZzWoQ==
X-Google-Smtp-Source: ABdhPJxP35SmgHpjJBCWNK5+CE0sT2ZLGFbHSqTr5K3epue7/zsIbU6Tm4drzmp4lFX5MYElIP+/cg==
X-Received: by 2002:adf:e291:: with SMTP id v17mr3940756wri.149.1621512176218; 
 Thu, 20 May 2021 05:02:56 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/38] drm/mediatek/mtk_disp_ovl: Strip and demote
 non-conformant header
Date: Thu, 20 May 2021 13:02:14 +0100
Message-Id: <20210520120248.3464013-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'clk' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'regs' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'vblank_cb' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'vblank_cb_data' not described in 'mtk_disp_ovl'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 961f87f8d4d15..fa9d79963cd34 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -66,9 +66,8 @@ struct mtk_disp_ovl_data {
 	bool smi_id_en;
 };
 
-/**
+/*
  * struct mtk_disp_ovl - DISP_OVL driver structure
- * @ddp_comp: structure containing type enum and hardware resources
  * @crtc: associated crtc to report vblank events to
  * @data: platform data
  */
-- 
2.31.1

