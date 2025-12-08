Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82337CAF410
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954310E4AE;
	Tue,  9 Dec 2025 08:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KgbCihPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47C10E096
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:16:46 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37ba781a6c3so35856351fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210605; x=1765815405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lq+b81zjuJ0KXIx00y6jcXONOYZwjMumPZ/OfgDUGBQ=;
 b=KgbCihPS32ge5mTWwULsGJQp84nEVDnyVDtDDsqbeNdUUzEO30Dpl0oTI4OlVUGASt
 LEDi5ZrUYGZ51/MzlIahMccIB4BEiYNyiE81AgOzOp0A2tz6VjQVh6ISmZ1vdtjUWDKY
 EPZxpwkrv56aS4yQIxCpl1rp4x2Abp2BFvBshuyJD2tAdMXl/CMpz5dwYh4jkuE+Edgq
 jpcWIgbpdp/tXQwESqCLb0dXzWnMVkGHohMtFjqRO07M06ikQL9pF3JyzpOq9LChLCOW
 Ncxnr2uPxtgJSKsiDMQfYvsgE3SJGrFJ93GCRr6TB9XPdT+TORplaPjEeDpwwa2+Cp0l
 +/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210605; x=1765815405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lq+b81zjuJ0KXIx00y6jcXONOYZwjMumPZ/OfgDUGBQ=;
 b=eiFAA70pgpCTYjYo1hTUX4kXOfkNi7i98qQps+sBlb960B/l0+m0ch+eZkgjrUYmJq
 +Jn139yqFh9sES4WMpJyZpdc+Mo62UvfytR4U+pw875MrY3W5lUAhsyqNiJbF8q8wZOS
 g/pgv9gPpvGnS5jxUXrau7QURyIxkoO/Qst+YQgX+RwQNhn0WCpi3rMdiQdQssvtMUNr
 H0H/RNCR+pKhPZxDBCjuTcea7emb/XbolUE5ppU8pe7GdkvnPfNMfB++pKllAPeWNY94
 9pU8xsilYIco6rACBxo1LY8HMhzMwKhRfHFg1QahcKJ3DoNBmNbFLn6xd1Z8ZgrCB3lQ
 E6QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA65GRhIaFhxUGHYbbD8QLpfj+dN+hBpJtyabOVl+uKWoJwIxcs6r1p7DBVurUSH5J8rlNTzOcCu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn9bxYBpkzMhjvhMbfJlYAzWCVq5XVrka+M68xT0mcLiQxO93p
 OWo+/SSjaKVQff9J0XMJVXbiF3SgnHnxUjPIEDPLsxtp/lBAKj4aCrSo
X-Gm-Gg: ASbGncvMHaQld4qqalMfH3mR/DSPSjvGCkviZIaqmxC+/gWnl1ntA9hQ78lD5TsYtaZ
 k8sVnmeF5z1sCoiloM74nLmIHPZlZrrl6SM3at65DkBz5yfu1bC/0XEMNy0uW0kVY1xlMR2vK7H
 IQXOb0Ib3sZ9UiBVs/tO6XJxRhBAhVYz/UTvK0ZHPS5IANsrJIrpUkSWkS2uTClbKd/BsUHF0G9
 O3TdYew/FE+hzeu+lNL/Wl7HdWDCaZBazObJic62ki7dDmDfPWuTqNKbVz5VbaLY6EL3rudKHGo
 morHwp5sF0cGXHQBQiXyEyHR+ibUVHAHNsnNJOEMfGGh5uJkwkW9OSm0BndiwtnMgoMvXOFoajS
 a5jJWrGdnf2Pb+iAMBP4kefK2/X0437SgXByA40T7PmGWFCQvwql+JBk9cddytAwH4KzAdhGLXw
 SFKGzJuC/fXk5EssF/AKc=
X-Google-Smtp-Source: AGHT+IHNZPG1QsMR21dNPgtrH03H0F1n9RkLL2N2CpVhYORoVSpEFt9e1N7ekSkGFmHwzBaTh0lwsw==
X-Received: by 2002:a05:651c:325b:b0:37b:ba8d:c0db with SMTP id
 38308e7fff4ca-37ed1fa08admr23821391fa.4.1765210604577; 
 Mon, 08 Dec 2025 08:16:44 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-37e705e85a0sm40398361fa.38.2025.12.08.08.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:16:44 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: disable audio capture for HDMI
 card
Date: Mon,  8 Dec 2025 19:16:41 +0300
Message-Id: <20251208161642.3763245-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

The LT9611UXC only has an I2S input and therefore only an HDMI-TX
audio channel. In this case, the capture channel must be disabled
on the HDMI sound card.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f4..d3ce5dd30420 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -555,6 +555,7 @@ static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &lt9611uxc_codec_ops,
 		.max_i2s_channels = 2,
+		.no_i2s_capture = 1,
 		.i2s = 1,
 		.data = lt9611uxc,
 	};
-- 
2.34.1

