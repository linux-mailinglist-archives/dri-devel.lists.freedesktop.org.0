Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHYkImLRomli5wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 12:28:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2B1C28DC
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 12:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540110E0A6;
	Sat, 28 Feb 2026 11:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T6op2CQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8325C10E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 11:28:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so25458545e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 03:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772278108; x=1772882908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=lPMQsCRzdgUsnGe3LplGdHC9I0aaGaZ1j+ZQBXbed9c=;
 b=T6op2CQ3sPBSAy9pPMFT4EKRWcRBoamA7rwNnUEz2JPwK1H/2tX93LHIYaNpnbFuXl
 u4q/5p1SnjL2juHVLlu39qSAUybDDCg8MpYT56k/gUvBv4SW6QZ/4/JKlRo36qeU37vi
 FxxQbpp4opcn4nJYiGqMAKi08/eTVrrZPGO4V89VHgFXJQ4Ye3eU1SoHINpxJGw8iHUM
 jpF0bV0q6Vtvs0PHeUiGGIqY6z9m+iFpRCJ3qVNCipIc3AsFXmMi6YApQx1JSaXt1L/q
 EaxEk2b2mIOxADAKtbsyNM3D69ntFcVPVVPg7DFlItK2nA8UmhF0pxZP8ycInhRpo5u6
 H/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772278108; x=1772882908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lPMQsCRzdgUsnGe3LplGdHC9I0aaGaZ1j+ZQBXbed9c=;
 b=qWRIkPi3G+xjTIHXWsJ3fvVel1mQYiI7kld0Osm3ZfYrDXrchNiRnd52QKyipp0rLN
 44skPYS9r2jy26x+08A38f3RjSfX+/U69OAjJfUwYlHYU3VxGOkZoJWhT5lKX8evvoN8
 XOgqsNWXedAO9yZB6Ey7hxfoT4JXWVOKJNnQs7H/f5EcCELjjCe2PIKHwpjtjVu8vAyn
 5srLsZL41P5ak9UkGEIWCzAwzZs2RNBNM60DKVPmtBrBTTPZYqqKcQ66/mQn1TOwa7CO
 hG0BaUPdGvy5oEZlsBSJdPastsTA53o5CWuqhjg/89R6VX3u4lx3NNpmlVQLzaDeHsdM
 T4ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Xg5Q5+uhq1Jly3WdxR8SDK2YA9XcWADsizLpp2mviMJtlsp28grszmj4kGUI9XULwsfPdoS1se8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2bauzSTALb5gtK0zKW13J4cj8pr8UD8sUggev/TND8lnYpQu4
 Q2S72Ov611owEVPNIyS5ASzpIqB9nMe79iFX8LYPztrx6Y1oXC9S/CIM
X-Gm-Gg: ATEYQzyNTBXnaF+nny/yQbTSZSYmsG8jsHi3+ZfezefJfsojKKZNirMQ1GjVaC3dyAL
 HQ1nhwr7/fvQX7h4QhUjXKOWubk6UywACN/Jd5e8x3Iyhb7pQgnwxwLD57lQFXLI5FQC9L0dsZ5
 fa5LJ2nzd3X5jNq7tOKNvM6BI5C1fQhCKU9Z2WnkUyE/4bWnV92Ph0JZyNp2koqI542BH2IvJo4
 Efh3ZuD8xjGrzOdqWNYia7aP7tZXwR97D07pfE6sxuIHXsqcxqCo4h8+/PGks6HifewcMRQPi5k
 w63omKx5Odgr+L6O4iuhoQypzBBWExb7/3WqpifJIa14TMQzzf9nPk0AJnUkC96KoWGZmBIgjWx
 YBtrnKr/AvcGydGVyPUOKGBEr4ldqFXIFBEuROsnssTAtXHRNwtEWWEGa1JooiAxi+gbhsTDRfR
 v2uoJUvkxTYnrqqHtZ1xF+BUm6Urc=
X-Received: by 2002:a05:600c:5308:b0:483:c490:8c0 with SMTP id
 5b1f17b1804b1-483c9bdb6d6mr93362665e9.11.1772278107808; 
 Sat, 28 Feb 2026 03:28:27 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd702e7bsm310980275e9.5.2026.02.28.03.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 03:28:27 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: dw-hdmi-qp: fix multi-channel audio output
Date: Sat, 28 Feb 2026 11:28:22 +0000
Message-ID: <20260228112822.4056354-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:cristian.ciocaltea@collabora.com,m:detlev.casanova@collabora.com,m:dianders@chromium.org,m:andy.yan@rock-chips.com,m:sugar.zhang@rock-chips.com,m:luca.ceresoli@bootlin.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,collabora.com,chromium.org,rock-chips.com,bootlin.com,sntech.de,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[christianshewitt@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christianshewitt@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kwiboo.se:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CFB2B1C28DC
X-Rspamd-Action: no action

From: Jonas Karlman <jonas@kwiboo.se>

Channel Allocation (PB4) and Level Shift Information (PB5) are
configured with values from PB1 and PB2 due to the wrong offset
being used. This results in missing audio channels or incorrect
speaker placement when playing multi-channel audio.

Use the correct offset to fix multi-channel audio output.

Fixes: fd0141d1a8a2 ("drm/bridge: synopsys: Add audio support for dw-hdmi-qp")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Add my SoB as requested in v1 [0]
- Add Cristians review
[0] https://patchwork.kernel.org/project/dri-devel/patch/20251206072718.2039874-1-christianshewitt@gmail.com/

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index ab7fed6214e0..facfb7526928 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -848,7 +848,7 @@ static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
 
 	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
 	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
-	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
+	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[7], 1);
 
 	/* Enable ACR, AUDI, AMD */
 	dw_hdmi_qp_mod(hdmi,
-- 
2.43.0

