Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7658258FA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1B710E647;
	Fri,  5 Jan 2024 17:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9505310E647
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704475394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dtJeN7TACSQgao0vuoZrL+Z3Hkf2IquMRY0Uvyl8X9k=;
 b=caTZA6qTr3O1DuWzviERwm4X4OvvsL7+z6NBHg21WeEGNy+CrZNPa+SKi71scB40K3SEyK
 qiP0m9ZFOfyx8EKrfv9n2Y3nK9SBzPLYLxMpVts70ZMCHxZ1OnFtiaySF0nSLvHXKMgmXF
 YXnWzq+bBvnmVpMPhzuULivgltmazx0=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-9zjastxuPmO1_dW011ZKpQ-1; Fri, 05 Jan 2024 12:23:12 -0500
X-MC-Unique: 9zjastxuPmO1_dW011ZKpQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-59430ae1ff1so430810eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 09:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704475391; x=1705080191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtJeN7TACSQgao0vuoZrL+Z3Hkf2IquMRY0Uvyl8X9k=;
 b=fh7g3vkDyxZCviBpKza4wVFiyJs3j7TPFi5RRwyQ5VsAjVU6psN4MZ0OdP1GtmQuvc
 8CbegBYsBdieHMmPust1GMbfWEjG4fVbcj7RohL38IrHlLnkSt54WtmsGBKuetK5Ssvc
 bHvMTJ2GsJTzZOX7W9mD3EkjzHCTmaB5zxxYmFPZap2M9MW+rsKQc/3qH3WxVbZbc+fO
 aBHDybTqga9m1geQJFIff+v1pPdndI9OXeeUOhyxCTzXpqfldIp9QRF4FqpCV2OCKJwW
 9lDK38pUSCJZ8h16Yizo/xR+MFQ7LDPHCK0u9j5j0Kf/dEyoFOI8wLDDUd8l4rQPfJzP
 Opmg==
X-Gm-Message-State: AOJu0Yw/oogrMq4ZGrhR6efupN51Za9L3yQ/0X9YFQV4ktExFvAekkUl
 RV5EwGP8DccZ/8GDBzpZ4HV5yLYI846rBvHIK9n+SHyPP9R/PvhmQe5ozh7TB2hYWT7pRaiK6yk
 dnkSGu20rxi9HZHM/radfgB+x/J6Zr3jQiDpl
X-Received: by 2002:a05:6358:998a:b0:175:31db:191f with SMTP id
 j10-20020a056358998a00b0017531db191fmr5533024rwb.3.1704475391329; 
 Fri, 05 Jan 2024 09:23:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4W7UoEYVL25ZiTJPqQ+3iKgSUjpmhQaKfboSvX00EKet2J7PxO9VXhFiFvETA35RWG0dxOw==
X-Received: by 2002:a05:6358:998a:b0:175:31db:191f with SMTP id
 j10-20020a056358998a00b0017531db191fmr5533001rwb.3.1704475390938; 
 Fri, 05 Jan 2024 09:23:10 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32d1:a900:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 t22-20020ac865d6000000b004282c862fccsm884750qto.57.2024.01.05.09.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:23:10 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 0/2] platform_device: add new devres function
Date: Fri,  5 Jan 2024 18:22:17 +0100
Message-ID: <20240105172218.42457-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch #1 adds a new devres function that I found could be useful for the
driver dcss in drm. Patch #2 makes that driver use the new function.

I compiled this successfully but unfortunately don't have the hardware
to test it for dcss.
So you might want to have a closer look.

Greetings,
P.

Philipp Stanner (2):
  platform_device: add devres function region-reqs
  drm/dcss: request memory region

 drivers/base/platform.c             | 37 +++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c |  8 +++----
 include/linux/platform_device.h     |  2 ++
 3 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.43.0

