Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AZONfyZpmnfRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BD1EAB44
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B905B10E65D;
	Tue,  3 Mar 2026 08:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eqIyngwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2410E65B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:21:11 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-389ebb0e885so102159921fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772526070; x=1773130870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkFD0nTtiMecWdiMYsq45f5KZ8ZJ53Zo2JaKZseIkhs=;
 b=eqIyngwYWco61pQRCw9D+eWVL/weXHqozy24DezNwvqnsZ1XaSBbS3kVZbE+L3Bloh
 2be/9NKTAoSDXw38VGXCHVYRmjLisCnktgNeWrP7kx/BJTQuCjy8n4Mxa9iEJt3YfTJg
 oi83WOLYpf49Vmq4S1NWLAFlnhuWuuFl9Mv872pBtEyxQvE6VHN0lGfNzeRowZRpPmA3
 A9QOJqtELWm2IYN6dfi1zx6QNq3vily4xmnga4VZfm5LROIo8YDWCBd1AWLI90aJ3v7s
 2se+0yysDNLhqY9npMheqIpNJMOCmEqKsHBDa04WRlWSSOyucYp25azlUIfPKm5hscEy
 pWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772526070; x=1773130870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rkFD0nTtiMecWdiMYsq45f5KZ8ZJ53Zo2JaKZseIkhs=;
 b=vq5qJ4aAmz6LJF2XVYh0YbnPafNHlJv3nBrzjav9yK8qJHkPTHlEsNq/MawmSzjESx
 ajWhtURVa5Xc0w5dFJ3fYlfTnwoi+ERpjyTCtMVWpJc/D3gJNiJQqbo8NcfWUNTFdIp2
 9Lppah68ukYtetre4/wgs/DnJzwKwrGiE6sTQ70BDDwGqMpTcwm/3fOUsplxJJF4R6O+
 YkKMVz+DnsB5SthODr5rUADAGeTeml2sWlBsYrwcLvbav2vEZI9MJNx6ot0V8jaw+Lqd
 vxKmiTNQtOSDckmXe66qhmuU+DEuaHyvYLqOHKnhNpuiUdiKYalYptnUDtXcZTFsse/i
 4UtQ==
X-Gm-Message-State: AOJu0Yzq2FzmGrNcm7m+Ha0iqiJEgS/2LK7bx1+Z/ULx1ANmQB++eyYy
 FszDmqg95iMDbshJ5Suh+HLbovFQTykcjjWrTK8IIN5MlPVhc1Tqp5KA
X-Gm-Gg: ATEYQzxgJB7wW7XiJ6FSonPZONMSegMJXmoXUD2d2m6YqjOmj6D2y7Jx2+/YGQz4dB3
 GwKAdr3BSStYnr+6XqQz4STYwRcIGUMwiPjLWh691vWCggzHoy0HO0z0F7iTITDoul9ML++2QPi
 eSuhzN/Fwkkdp3LgSM27iePiXZ36DjJms5FPi0FiwXbzj5YCsOkx8Mcqi+VFhQeJEtPPj0s/u4t
 XHsUMXLAYoC5EYQQtAYeREc8uY5pMvutQqm7Hfw+n7NnqWxsKiSl5Z/qgDn/uPZKUqQTc5/3KMy
 vF1BMRsHA0UXCEoicOpLXGf/QcscRY5eFJMUwEIr5Td+MQFQnKGEEBX0DI4cmcCMZrgyN0jKNPm
 7iIZUoCXFqNBjGvlUa84tsAqO4fOE5LnGJ9g7LApWvPIld9wteHqB49emhX9hlsay+fPt9jiR6y
 73xfmH5jznfzdm
X-Received: by 2002:a05:651c:2354:10b0:383:1d66:c1fa with SMTP id
 38308e7fff4ca-389ff119cdfmr73500421fa.10.1772526069561; 
 Tue, 03 Mar 2026 00:21:09 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe02bsm30856171fa.27.2026.03.03.00.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:21:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
Date: Tue,  3 Mar 2026 10:20:38 +0200
Message-ID: <20260303082038.11352-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303082038.11352-1-clamor95@gmail.com>
References: <20260303082038.11352-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 6F4BD1EAB44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Maxim Schwalm <maxim.schwalm@gmail.com>

A simple HDMI bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 8aa31ca3c72d..cc13c98f9be6 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "mstar,tsumu88adt3-lf-1",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "parade,ps185hdm",
 		.data = &(const struct simple_bridge_info) {
-- 
2.51.0

