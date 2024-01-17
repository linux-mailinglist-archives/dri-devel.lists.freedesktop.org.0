Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA8830CC9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66FA10E790;
	Wed, 17 Jan 2024 18:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F64A10E790
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 18:36:41 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6e0a64d9449so3163658a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705516534; x=1706121334;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dGYRtDKlKnGOQduq4VNWov4UOWEDuy3ZPEgEUd75zZg=;
 b=LF1a5cqW35ZbFSuGP/eNFfFAV8c6sITD2ix76OZycfpsMe1QWVH2uIem/2FRs2LDvr
 SC5+BXqIs4OA8ERPIPLeUIh981KaCcWP1zXgUFiwDzxJ/eVS1ivO7scrgBKjZ86FmFlg
 vCLJN7P2oSaPWNk7TWQdXr5/UOBkddH1kISiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705516534; x=1706121334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGYRtDKlKnGOQduq4VNWov4UOWEDuy3ZPEgEUd75zZg=;
 b=xBI+6CPBluuOnSWWxRIWjx+5d7YnMLBZetkRl+vc077SNkG/iYHDTxQBczT8P8yHxQ
 E/TgekXvv7D7PIiH8RnN7gdpm6sqqAIRYz90zHKyvyI2h7jhDIBAYzftsbElbpfCP6jd
 86qcYAAHAy1FVtkUFhAtIuVM3ltYEfxNOyYW6St78rkrLZvGJ7NPZvWDnoj/LE5hbwkU
 +4saynGpARfhiBeeyqVLLG3TEKsJuCfsuLJsFAf9U6YSE2IrU149dbu2tTAWn0eVZNWJ
 HhFRRRhh6tQYCbmlWkB1Xv02zWr4WHrTf5QJVm3dn38UPVavcI1A0qwobF7UDWY25VTZ
 m8Lg==
X-Gm-Message-State: AOJu0Ywlt8ullUzbmknjc0nvL+NQh2Qoddb4qGpeKrh1qirOwLtn+pw4
 dQ4KRE0j3DpK6OFRTR5dmU7vLpzhYKvbYd7nLl5OUb4OlkEx
X-Google-Smtp-Source: AGHT+IFZnL0+bJFVTkL8YnbJPonvdMeWIW2tBeoi/pmAtih3evTSdKFPj5YogL3HK+ZLXPIM8Jrk8w==
X-Received: by 2002:a05:6358:5398:b0:175:b906:8c87 with SMTP id
 z24-20020a056358539800b00175b9068c87mr7650557rwe.21.1705516534518; 
 Wed, 17 Jan 2024 10:35:34 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:bcd0:3985:867:5ea4])
 by smtp.gmail.com with ESMTPSA id
 ko18-20020a056a00461200b006dab0d72cd0sm1762215pfb.214.2024.01.17.10.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 10:35:34 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: parade-ps8640: Make sure we drop the AUX mutex in
 the error case
Date: Wed, 17 Jan 2024 10:35:03 -0800
Message-ID: <20240117103502.1.Ib726a0184913925efc7e99c4d4fc801982e1bc24@changeid>
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Pin-yen Lin <treapking@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge
is suspended in .post_disable()"), if we hit the error case in
ps8640_aux_transfer() then we return without dropping the mutex. Fix
this oversight.

Fixes: 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge is suspended in .post_disable()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Sorry for missing this in my review! :( Given that this is really
simple and I'd rather the buggy commit not be there for long, if I can
get a quick Reviewed-by tag on this patch I'll land it without the
typical stewing period.

 drivers/gpu/drm/bridge/parade-ps8640.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 166bfc725ef4..14d4dcf239da 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -351,11 +351,13 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	ret = _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
 	if (ret) {
 		pm_runtime_put_sync_suspend(dev);
-		return ret;
+		goto exit;
 	}
 	ret = ps8640_aux_transfer_msg(aux, msg);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
+
+exit:
 	mutex_unlock(&ps_bridge->aux_lock);
 
 	return ret;
-- 
2.43.0.381.gb435a96ce8-goog

