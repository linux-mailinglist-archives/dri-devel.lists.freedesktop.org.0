Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F1CFCC61
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5D710E564;
	Wed,  7 Jan 2026 09:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bFI9Ztqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2098010E048
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 03:23:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59583505988so623418e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 19:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767756227; x=1768361027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BT/Cklzk2ZGjKwNY3GGnpOGQpSYmxVog2FzbJyORQkI=;
 b=bFI9ZtqpF+jRUjol91qBY+3NXZv0iZJfCN8jK076d8wWBZ7Yj/LsWZbYaDi+PFzswN
 HD6GcXq3vsDFL/nJwEE6Qix79CZLjHpGf3w3ISWEgMNWXr9tltweXJgGzT5G5L34Nska
 lMA/6AaQuQQIXThrCYnM6ej9trG/hsLhs/mD3re4YFg/ZpqCIiERbrT3yehtCFfgAixd
 9YmfUXwzWQHWyAaMsIcELu4eIQFT8dLUgx3/WsHkp+yhgbLe0appaseVd4Eb4+Cslagr
 wXIg6ERqvwkbulPXbFhmwibQK5zu8bExCo8fPsN3YObiK41oBw+Zt/IvKBrohONqnHLs
 XkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767756227; x=1768361027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BT/Cklzk2ZGjKwNY3GGnpOGQpSYmxVog2FzbJyORQkI=;
 b=NpHCh6PwZSjyb7GUpVAVpIfp4QSQHRwVUi3iq4B1baMZkLCylkdpGYp39MOKwCtSn6
 qfxrBdb8pEtfNSWGyZXAlmplQIG5fdvxejgkBZSMS7beGNk4DwI8cv6/3XwWWjf7fcDX
 Geq6uPUjDpnYa8fBH73VNDz4VdXKNvFx9K1ALTQYf8cOoSNrNtWj1vGCI7QB68F/80l1
 AGS03d9hhntxpA5c2fA81vdm6OdDVDsE09rOak6SH7/Q/1ksjb5bId/gGBBRYug1Wdpi
 gpwCU+Oi94SnX+z1DxtMIPhOnJbWpaCkNX5K8DhCycPrzgQMY8Eb4RowoFaswW4iSEJ7
 uqZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGQDYgMjLFhCOq9WiYAiMaLXEA/k+zGNmSIgzTSAhVP+sh5Xi5g890ue37PstysW0E/JXeZdtN4OI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxjwjLibLXN5HIVEnbeWKd1ngMHbvwL6DchR0uqxaRL6WMaiLE
 +AJjE/wLXzjjE5DDTeOMZR1V7/2PjT1pSlC2k7K668O4AJQDz01kMVr3
X-Gm-Gg: AY/fxX4ubmfHC/p6Zn+fWkNBo5eJIvjX8Mw3lD12s1OqHCsEkA5VoJQSdZbBOhok+Ra
 f8QFw4UkqJ3XHBiL8wjRUUuETRp0zP1qEpSbixmAE7tvMhC9ILO2Sua9+qm9IXwcwodIKWAnOwb
 AZxEHUCOkApK49oSIe6xwgVT5ytrGPYHzfEL+Ffu565sq4/lpJT21wn1PSY6rqsj964QQK8fVRp
 Jj1WAO1mYgnSq6MVlQnDZIuA5mocFtpKVNJ6RaI5C7MsmXiO5Meiwwp8p7dMstKZB60SfFOV2RQ
 JWbo1O4KH6h5GtWRg/NbH69/VWavzulgzk8FAUaov1I1axfiYKc0qbjjmogQN/aNU67UAF9aeGt
 89roYHCp2PL+IzK4pIYQIcZj8f5jD/7ozQKPCsmEAs6hcoG0i4hH3N0OC9Q3Yo1/ke9GfbCGrNq
 AO5wFY02cMbPnewJlA8qs=
X-Google-Smtp-Source: AGHT+IE2wdtjBtjcbjaLNMKTTIwRw6ldU6Bzb1FyPmZ8+4x3t4OignlgGzjMCbQNtcMTeZ0Kgxt4gg==
X-Received: by 2002:a05:6512:118b:b0:59b:6cc7:ca22 with SMTP id
 2adb3069b0e04-59b6eb0c3f3mr349531e87.5.1767756227259; 
 Tue, 06 Jan 2026 19:23:47 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-59b6dd08593sm324669e87.77.2026.01.06.19.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 19:23:45 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: Vladimir Yakovlev <vovchkir@gmail.com>, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH v2 0/1] drm/bridge: lontium-lt9611uxc: use irq as optional
Date: Wed,  7 Jan 2026 06:23:41 +0300
Message-Id: <20260107032342.332758-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: DEZGWL9B8SOU.ON89J7KLA9QA@bootlin.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Jan 2026 09:14:13 +0000
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

Hello!

This patch add support IRQ as optional for lt9611uxc

Changes in v2:
- As Luca Ceresoli recommended earlier, I added a patch to replace
- request_threaded_irq with devm_request_threaded_irq before making
- these changes.
-
- Since the updates only affected this patch, and the previous patch
- was new, I made v2 just for this one. I apologize if this is incorrect.


Thanks

Vladimir Yakovlev (1):
  drm/bridge: lontium-lt9611uxc: use irq as optional parameter

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.34.1

