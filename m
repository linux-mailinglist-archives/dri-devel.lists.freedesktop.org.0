Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D8592B42
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70E2B6AB4;
	Mon, 15 Aug 2022 09:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD00B6A4C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:39:55 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id o14so3572504ilt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=7MIhZhyQf1iiQaCJxYZieUdU7Z/6XeeU6tWciUhQM70=;
 b=fzPUmgMpRnKlkWNT2SrLzEDGj/tEkFn6IsZGf4kObHoFSetYoZZ+gve2wb+vqt6Yne
 OHdEFNN01Xvdem3BkWhN+IbLrgtd42m93B15vSfNaEHSOb5+RNhSk5fLRm1Oj2ymoVT4
 kPNrFYfG6JFMOe07OcKituyuGM7hP5eMWDij4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7MIhZhyQf1iiQaCJxYZieUdU7Z/6XeeU6tWciUhQM70=;
 b=mZsbvA/4N6ner+Vo+FQYHj1+VBx/je74Edcg+Zh95m8DZlY47l/UWxjUkuFrZXq2CT
 xdRP8bat76XKIIztJzwBSJuWkB7Fp2LiWHDfUblBeT2ehS69mw8pSTnHq8uEZ9ZdF8pS
 YsvHaa10GEscGWPHkgwJgBha4rrvsgOmc3suMyG+Ivr71O4gwjgLoLRmqsbFkO6WFbce
 /nvPEJTIsn8HsbFV6qwjb59OOw9jzWCh/V1XTD4WDExUxRosti+3RW+OtXLq/T8jOgQg
 BIfBRQ056q4ovfDjhxOjPw/NqNILA4DEBpx8IKDRjtqF6Ga/a8PiM05a+yzcqyWhSJqu
 5u/g==
X-Gm-Message-State: ACgBeo19bsVgQQdiuGhSaFd3dsmaV422ipawOpFhM4lRGOmjcRxrhMDW
 cKpfEpHSdtc7O6FvJ6os3vZIMjkNSLaMST3e
X-Google-Smtp-Source: AA6agR6NRtKS2CTIYBNCSm6wJ4Gn5jaSJ/CXvUpJQtzt+CO8e0li+ALCHXyFxo3riiphyjuuuXWzQg==
X-Received: by 2002:a65:6c10:0:b0:41b:ab8f:ff71 with SMTP id
 y16-20020a656c10000000b0041bab8fff71mr12969588pgu.308.1660556383875; 
 Mon, 15 Aug 2022 02:39:43 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6fc6:4170:be4b:587])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170903228d00b001714fa07b74sm6680020plh.108.2022.08.15.02.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:39:43 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to power-on
 sequence
Date: Mon, 15 Aug 2022 17:39:07 +0800
Message-Id: <20220815093905.134164-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 rock.chiu@paradetech.corp-partner.google.com, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double reset power-on sequence is a workaround for the hardware
flaw in some chip that SPI Clock output glitch and cause internal MPU
unable to read firmware correctly. The sequence is suggested in ps8640
application note.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 49107a6cdac18..d7483c13c569b 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct device *dev)
 	gpiod_set_value(ps_bridge->gpio_reset, 1);
 	usleep_range(2000, 2500);
 	gpiod_set_value(ps_bridge->gpio_reset, 0);
+	/* Double reset for T4 and T5 */
+	msleep(50);
+	gpiod_set_value(ps_bridge->gpio_reset, 1);
+	msleep(50);
+	gpiod_set_value(ps_bridge->gpio_reset, 0);
 
 	/*
 	 * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
-- 
2.37.1.595.g718a3a8f04-goog

