Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA5F53B061
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 01:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2655510E04A;
	Wed,  1 Jun 2022 23:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237410E06E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 23:35:48 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f314077115so4781030fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nysr9Vv0SpeIMmITphfX37l3IqsFABna+5njElQYczg=;
 b=rOkQwislOKDkFcI/V4qlVnJ+B1DnE8Gl30iIVoh/pBU+KqD5ojyKMo3/xro5T8uz69
 Jflz072DH8bsEe+TA9ZIXc6Y5WjIuN1wJ+oUlgKKHkw9PIrmLrVl80aqjLU7PfPU9ieW
 8LRGpAl7G9xQxmuiJdq1AmtcD3j4P1LRM/IngG6nRSbHE1WkwqeiProcNpAqRFFmvShZ
 toh8wi8aPEeEKqzPFH//L3uLTO/5tsHARMlZ1SyVPSgVwDWt/v9G7SLDb5wIuD7M7Mkb
 RqR2z9l2r9egywSWl93Aw/Chl9SDGzGSmLX8f/MCpSyPOwMjx7MaJXvDX5MSha0KG/gt
 IYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nysr9Vv0SpeIMmITphfX37l3IqsFABna+5njElQYczg=;
 b=c+LFcKv7Cgg5+0TirCDA9n6dsowWTLSpJ7RLatgi6NjbabWrnQHMVmoIun3+ehsADv
 j6Akeomz+PtLOGWQyVBjdFOrTvLHviBcNF4N4m8Ob+BFbfMOCSmswx7BM462ZPW0k0eh
 KbktN+tgPKQOLO/jmkEleGa4Ghp8f2CCfzuuB5OgBFqpvbqQusM67BDO4GLLKB6L2ln8
 jA8ZGl/iFCKFH4FpvqfaHFJPF98ZqdYidh0ghL16HqzVPVThkO1wWpiQoOa4pySHK5IE
 PDi7NVSTvdyvkOMl8lrKBSXA8iGeJnGWfkX0Nti86h2hyTG50iN8JPKJgi0ViKIKKQhU
 4Jqw==
X-Gm-Message-State: AOAM531x8xGkpvCiO3B/FoxBNXWkxvxmviGDqd8brs2+2Ia4gbFwVLOt
 5wgkAFME326iBL2iwWQVFhORfg==
X-Google-Smtp-Source: ABdhPJxTlWTl/SNX+dACDo7vUoDjljc+CM6IiK+RALMVaK5nsZboS/Oxij0yutp/YokkxVNMkLld6Q==
X-Received: by 2002:a05:6870:a10e:b0:f5:dc08:fe47 with SMTP id
 m14-20020a056870a10e00b000f5dc08fe47mr1168206oae.33.1654126546944; 
 Wed, 01 Jun 2022 16:35:46 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 a18-20020a0568300b9200b0060adcc87e37sm1315715otv.74.2022.06.01.16.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 16:35:46 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/bridge: lt9611uxc: Cancel only driver's work
Date: Wed,  1 Jun 2022 16:38:18 -0700
Message-Id: <20220601233818.1877963-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During device remove care needs to be taken that no work is pending
before it removes the underlying DRM bridge etc, but this can be done on
the specific work rather than waiting for the flush of the system-wide
workqueue.

Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3d62e6bf6892..310b3b194491 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -982,7 +982,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	flush_scheduled_work();
+	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
-- 
2.35.1

