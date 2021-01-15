Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A841A2F8CE0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8AA6E554;
	Sat, 16 Jan 2021 10:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6546E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 11:02:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o13so12564023lfr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
 b=Q6OSfsKHIRau6OEp7U8C5Y+6jgIDFkbJL5vZk91Nuv0NpTmw5qQ5axByZ0pzivn+Si
 owKkBlxjCDFJSDxUZFD1Ehqk9+kxyKCa260yDW+BtNDdqS4QyCv0hAypajTGyz+UGXgH
 INO1yAMhbBbZ6ju1YmkaWYKJjix5mvZP6dTrZa/lro9WUF6ykREP9qqiOFZVPv9vOPT1
 N999vz7F0m/nUByMdKPhktsyjnCkqSnJr1hKKMJvSJCEgJgNXS7gJQMTlEPqOt3krd4y
 0aP7+OAYAsWeLdhAFW6Yoi+DM4Q7vZA/lb5hM2kkxB9+eEold3C44pOIVRXBc5tvoxng
 v7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHRQ0xxynPvZxQkJ0XwkKO8LykVQgvPwVrEG9Eu8CIA=;
 b=gN2KFG2RrvMKOmvG0cucVHD22gu0WZWfy2+Bi8nEVDfdhJuPFdhLiV97gxhyorJxwD
 8Fif9TNUmhiRIoJtfe3yKdGJ04JqqY/+PSlxbtOTavnKpPhxdHpNJ5RlkeEZTQFyA0qR
 D8uLAdxW7w+AiS3OiJPadnk8JYGyvwBNYnY2JbNXZxsIuVeKkts6LWupOYnJnvYAC9zr
 KkWQVuVloVxZmMzsm+gc8E53bOiE01C8lJ/ttAMDtitu+CCOQdeuk1owfaXv6z9v1JDg
 +iSlBFUp2gehcCQ+abbEc86Pzbc+UvH3TgC4XvRlww4jCqjvm37pCMqNIRkZMFciMzUb
 CnEA==
X-Gm-Message-State: AOAM532Xy1cvPUxkqTfnrABVF177apHpRUaRJ2L8/NeIZyNYC7wyoDtV
 Z24KO51YdJp4JjZIQRWPwzfH6cdhVV2wbDbTq6s=
X-Google-Smtp-Source: ABdhPJxBug6UNOjEOx3RFIV60hE0chZMQa2BhXfTSNpiRFtgstHaPxI4KJqF8zn5ZRIsxUO9Suy7Aw==
X-Received: by 2002:a19:c711:: with SMTP id x17mr5344738lff.56.1610708551013; 
 Fri, 15 Jan 2021 03:02:31 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
 by smtp.gmail.com with ESMTPSA id s8sm862020lfi.21.2021.01.15.03.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 03:02:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to
 become available
Date: Fri, 15 Jan 2021 14:02:23 +0300
Message-Id: <20210115110225.127075-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Call wake_up() when EDID ready event is received to wake
  wait_event_interruptible_timeout()

- Increase waiting timeout, reading EDID can take longer than 100ms, so
  let's be on a safe side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 0c98d27f84ac..a59e811f1705 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
 
 	lt9611uxc_unlock(lt9611uxc);
 
-	if (irq_status & BIT(0))
+	if (irq_status & BIT(0)) {
 		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
+		wake_up_all(&lt9611uxc->wq);
+	}
 
 	if (irq_status & BIT(1)) {
 		if (lt9611uxc->connector.dev)
@@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
 static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
 {
 	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
-			msecs_to_jiffies(100));
+			msecs_to_jiffies(500));
 }
 
 static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
