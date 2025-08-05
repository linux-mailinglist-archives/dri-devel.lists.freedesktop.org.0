Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF86B1C1A2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 09:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9730510E2F1;
	Wed,  6 Aug 2025 07:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i/6rqm4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0493110E107
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 23:59:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-458baf449cbso34966615e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754438386; x=1755043186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2xhiUEc9Kw/V714a7yfCWYYu6l+qIkZaBDMyW3CyOmw=;
 b=i/6rqm4zhQiog9Hb3SpCcpA6ZdXCrrc+/Rl28hoDKgKVfDvJmXSszcscYDnjSQ4Hhh
 mezpDixgN03oB2HCq+m8xjRdCPKmGjb5G3kxOxUlg37rxtwlEo86ERj5HX70xSlId09p
 yGOtkniILS1t/xqIWBj4XI2r5OG13K4vyLztIXUMzcQ6Y/EQ0VhteNRs+fRyhOWqC7S/
 Evd1CsdmhlKFL9BVbeR9Rjxi4xV8QwOalFmmvZ8J19YmbAzR3Xq5A5HESMj/WMSb5bK8
 i7dVlr+uKVzMiezDP4u1NQKokP2PIgL58BWQrdllvtAWwDetylKhBUYPqUjkL2I1M/0F
 lafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754438386; x=1755043186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2xhiUEc9Kw/V714a7yfCWYYu6l+qIkZaBDMyW3CyOmw=;
 b=G1GNpEGa/iGl0eVkVhLcLFM7PvX4mLoRi7+B4JKQnpsJIZCrVOvsD9jTwnL8gjkeT6
 Cln9rW6kAE9fS3suUlOUVeMOnIbM4FbUpIWP12Oh8yCNd1pqcHCPhRGnly6BjZzKezZH
 6OnK4OqmjaIiCtDWd5nvZKH+aaaPv5IOOSx1nADVPmYPkBbB8AhZ1E9kDoTmq3I+mwll
 TgQuQYsHL39qZ28K59tZ+iNhhrTlbLB9EHk3ztnWiFqYV3Omz+ElrZLjYwQUT1tuX9jv
 FJiqkMtgufOlcX8XtxutBgxsycx0sENiuCOHw4rqrDDnjHokIXIgundYNWF2WVIBH6T/
 x5sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR3yviXGjqswLt1YC7l5W/c3nKPgKbAiSqDeeZShpQVtJ5r3ER0R0vESDWdimnjgaWvlCp3TzbFeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpx0oP1FMA21V4Ccsozc7s6q5XzUNA6Qx9b1RFays3XneM7B10
 WgNDZbeKg2TL04ngd8QJ9ax5KRDjcQ434w2ln7I0OygSe/oWSXHtN3oB
X-Gm-Gg: ASbGncuoKaRowAvZNc76ulpqocwIBtWwhu0KgkSk09BOJRVlTYc6BBe8y9B2D2pAS0O
 xJxqTLFrjzE0EbGt8AzAK2pUcfwzVpxNRu5R+xSPcA1vTjrVaSLV9tb+WouI7dPgEDr5Xgsf+Oi
 TSjSUXm7akbB6lD0BU5h/4RrCOzRunmWhyyXrMsbWLhZgOnkda7BBYMDFyPWuWEFzLOJ6GgdaT2
 uME8x7eyGqPUE7AzDhuiaZa4Z8nQIz3nA2+kWaRNUzRWrgoUEhHI7JOnh/Qkt8UFw9ZWCLDbDKb
 gxr197HW4MBhgfOy3XVCOOuNFXexOkrGeC6qrvs8AiG6R891Z8Lyi7HbqQcj0FqYmZUi7Kky0wz
 HW5PAKXDtfOZaJMcZoR3eziwe2gTSTxsQNhqYq58EnE2I1Qmln2X9kltiVZLoBH6dlb31dh8Gcy
 I=
X-Google-Smtp-Source: AGHT+IFsHdG6C+dK0jpCSAVCpiWRzLZUbTx+mxWcmzk1Qn9/oqFLMmf+47R0EY18CG9DIppdXP0Hkw==
X-Received: by 2002:a05:600c:3ba2:b0:456:1ac8:cace with SMTP id
 5b1f17b1804b1-459e7090ffbmr5512585e9.12.1754438386168; 
 Tue, 05 Aug 2025 16:59:46 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bd5a0f9bsm90322215e9.0.2025.08.05.16.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 16:59:45 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Cc: skhan@linuxfoundation.com, Eslam Khafagy <eslam.medhat1993@gmail.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] drm: atmel-hlcdc: replace dev_* print funtions with drm_*
Date: Wed,  6 Aug 2025 02:56:50 +0300
Message-ID: <20250805235928.236248-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Aug 2025 07:56:35 +0000
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

Hi, this patch is to replace dev_* print function for the atmel_hlcdc
driver with more prefered drm_* variant [1].

It's eventualy up to you the mainterner to chose to apply this patch.
but since i am a starter to the kernel i'd appreciate it if you do.

[1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter


Eslam Khafagy (1):
  drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0

