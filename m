Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECC67998FA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 16:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55410E133;
	Sat,  9 Sep 2023 14:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165A410E133
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 14:44:41 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52f3ba561d9so321712a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694270679; x=1694875479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nej0/398bNZdr2HyvdtcO9BJNRbt3FMJ9LgNhlCfcUs=;
 b=ZlblaGriFRmaxJafAUlFQ+nIxvpsqfZ2RQNZR5WVUYEHxq86F5VBBIzv4YcLKYiPoa
 6oX/fiHC1u9PcKjcbf/UsdDP6XhLY7N+beY+5yuP11GZ88/6rh9R+7sgiUvub/HWGDMk
 AJ/oYM7XTrvFrTVLd7qOXq7obloLByb0caHKq3b591vVyajaMrsm9V/wK0f1LJg0SjPR
 g0IDkdj91SKvYR3ypMgGpkw67oGt7jMqMwNjenpdizLWtH2Ni6OrJY/dVSdcMR1XXp7R
 fBKn3eoeNyJsIRmwQ/KTabrPX8nBcHoofzJ4/TSTkMsAMKuhBF4XubnDov+0m4laNwQ8
 dqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694270679; x=1694875479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nej0/398bNZdr2HyvdtcO9BJNRbt3FMJ9LgNhlCfcUs=;
 b=FriYW9sJbWpvm9CxjKLyqzdPquOftS/5yBrxS92PESoMr6WNuN7pypkjVVSauZgrTQ
 hUetJnRP5LzQ0i1yy8rB14T8/rsRNPlRqs+7MLjQDeIN3txRUiISiBDHHNvrKDLPTsON
 pCxjoUM9jgqaFHubZz2U5iJuZpq4VYs8fLq7o/M3sJj/PHwJi/8BrR4Zy2Dh1jKq+Oa8
 6xL0XR5F8lah1xSETsV0NaQGErsSeZxWtzw2DPWavEZ4ZalaRvyFC0hm/1m6Gsyctacc
 Il/daaEabiY4oAhjwNRd0ROzPVHNucpNZR4f87zx+zkWr9Sf6WIXgfLSB8lCrq3oQitl
 QaxQ==
X-Gm-Message-State: AOJu0YzdJftySj05KHcEHIGpHjYlAqiyJ5vAjqRK8EESEN/vT7ZJyjp9
 FcVtLqZYaxWAf+HmOtoCK/U=
X-Google-Smtp-Source: AGHT+IFHzKC+0At/DYBgP3WZpFSkxW99Svb/7clX08ja8nXiHh59vaxzYeiaEBwvDKoBHvLxw6X0jw==
X-Received: by 2002:a05:6402:2794:b0:522:582f:91af with SMTP id
 b20-20020a056402279400b00522582f91afmr10420708ede.9.1694270679307; 
 Sat, 09 Sep 2023 07:44:39 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 d22-20020aa7ce16000000b005233609e39dsm2252399edv.30.2023.09.09.07.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 07:44:38 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 hverkuil-cisco@xs4all.nl
Subject: [PATCH] drm/bridge: dw-hdmi-cec: Add arbitration lost event
Date: Sat,  9 Sep 2023 16:44:32 +0200
Message-ID: <20230909144432.34972-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add handling of arbitration lost event.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index be21c11de1f2..673661160e54 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -145,6 +145,10 @@ static irqreturn_t dw_hdmi_cec_hardirq(int irq, void *data)
 		cec->tx_status = CEC_TX_STATUS_NACK;
 		cec->tx_done = true;
 		ret = IRQ_WAKE_THREAD;
+	} else if (stat & CEC_STAT_ARBLOST) {
+		cec->tx_status = CEC_TX_STATUS_ARB_LOST;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
 	}
 
 	if (stat & CEC_STAT_EOM) {
@@ -209,7 +213,7 @@ static int dw_hdmi_cec_enable(struct cec_adapter *adap, bool enable)
 		cec->ops->enable(cec->hdmi);
 
 		irqs = CEC_STAT_ERROR_INIT | CEC_STAT_NACK | CEC_STAT_EOM |
-		       CEC_STAT_DONE;
+		       CEC_STAT_ARBLOST | CEC_STAT_DONE;
 		dw_hdmi_write(cec, irqs, HDMI_CEC_POLARITY);
 		dw_hdmi_write(cec, ~irqs, HDMI_CEC_MASK);
 		dw_hdmi_write(cec, ~irqs, HDMI_IH_MUTE_CEC_STAT0);
-- 
2.42.0

