Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583396291D9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 07:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A4210E372;
	Tue, 15 Nov 2022 06:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783088C4C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 06:28:43 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id 4so12318234pli.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mBggjsv2GqBICe6FMg0nBv1QbzL30nQillIj133bFg=;
 b=h9HAx1RYCL+85yBECtCTWfMwgCWVLWezO7TR3xa2myoeE/9GBNy1GPd2bVXJTCyHmp
 RyF0Me4sutzi/qhfcY1o7pZhIMu0oNX4vDlc9AwIRTOVceoUFeGMdgeywaZLuC2h9L78
 zI72oGlO3pPDEik9pwTxZKO2t7TaeOm8hPFgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mBggjsv2GqBICe6FMg0nBv1QbzL30nQillIj133bFg=;
 b=ZkbRikfexcVMFoeA6imX88D7DMhcqLIfNUdk/amGqXJjnUaymnZ7wsj+JOqsrFR7yI
 GFZbpEp/51fcN8rlqn0BZ6XPMaHJTZut0m3gUoW5SKCYTOh7wJXLvLG7zT2s8lFvm54C
 FBSbJKiJGdpjR9JY81trC7JYjRszSHMza/gJOas3ykiRxi1I3s7PIjVIrV+Pa4jGcuRp
 zasfIi/DAAzWere3IGpd76B7+rVIQAmD4YFeFMR0VF05n0wfSLky3laqn9jXus3k/5Xm
 418UT57ON559TNeVVMOBofx74cU+mfk18PCss/3Avih9b2S4WuW2xP+JC6miyRbcUbJv
 3jQA==
X-Gm-Message-State: ANoB5plEFlCnPVfD+60aD1pEHG8MLs4siP0r6rND69HPv4SvSTh3Go7Z
 vaRSBCsaNlizm5fU7ZXPmYt86w==
X-Google-Smtp-Source: AA0mqf4ZdtG1c1bBiabETrFV/B9eVEfGZPHGV8dOCo600f5jtC6bKO7vj0k8zeTsi/9EXykc/lZyAA==
X-Received: by 2002:a17:90a:d985:b0:212:e891:f08d with SMTP id
 d5-20020a17090ad98500b00212e891f08dmr144456pjv.18.1668493723030; 
 Mon, 14 Nov 2022 22:28:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:17d2:e181:950d:967a])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a630c16000000b004351358f056sm6956372pgl.85.2022.11.14.22.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 22:28:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 2/3] drm/bridge: anx7625: register content protect property
Date: Tue, 15 Nov 2022 14:28:34 +0800
Message-Id: <20221115062835.3785083-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221115062835.3785083-1-hsinyi@chromium.org>
References: <20221115062835.3785083-1-hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set support_hdcp so the connector can register content protect proterty
when it's initializing.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---
v4->v5: no change
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0ff1ecb80a5..0636ac59c739 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2680,6 +2680,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
+	platform->bridge.support_hdcp = true;
 
 	drm_bridge_add(&platform->bridge);
 
-- 
2.38.1.431.g37b22c650d-goog

