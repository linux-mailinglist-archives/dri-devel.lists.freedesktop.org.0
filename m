Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69391E752
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 20:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E0D10E082;
	Mon,  1 Jul 2024 18:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VSgpGi6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9388210E061
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 18:19:56 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52ccc40e72eso2516711e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719857995; x=1720462795; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dc8qe8OV1S444E4eAxywBVqkh1cFkYHUloMOx0jwCMU=;
 b=VSgpGi6owJmo0nONqWd+6HPUBqq5e/S80teMAxi66dEKg3mQciGOeTO7UZuE+GyZWA
 uWF5iECVZ9wdSA52mHo+Kx+80dhtvOxlVn6+2RnYwJsURljElakQB+OBcz9o4PhDlgkh
 KgWUA6FX/QRad+gwqtZYQL0Rr34O2dlBgOs4/wDHKezh2IhBUPcmpN/ndmAVpuitC8mG
 utfnE/vaVI50eLGUzbhTt1FCBlr9CO+oXNtKoy7P7SaCmnAXQUI4icucf+VhKXrnz3HM
 ZVPDcrOQGgcHAegmk4m1s0irHVg3nejI1B4skiem0GpuFLy3j4UeEKXoscq/i3kBudeH
 GSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857995; x=1720462795;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dc8qe8OV1S444E4eAxywBVqkh1cFkYHUloMOx0jwCMU=;
 b=o5MjGCTTUrMsj6DUo8PdAuMr9aws4ohrCdRo+f5Ahu3IEDglFaeEfavG26wxLBLYNM
 kjeZAxADTwKBePQDUHbti3iVVKRA9irt/Uvw4GAWFIyKK0cjDmm/pcm1HBrA/jsffymn
 XbVQao5NpnTmMZsnCWsZRSYVeOiLsjHjuur3ycL4lNHFbUBFRl50/sa23Wj3yM2L5D86
 UFZytHP1jY9IJKAwE08rg/6yqkPsE1WTHhM1nOJDCH32unTQ2ZJ21g0WUx01KfkCo6PR
 LNRr5wCIo0rOjRyWwY2T/HvMt2BsKw9OqY7Xgii45ynnCVOb7ZCY2zPAeHSNOeVgcPq7
 k6hQ==
X-Gm-Message-State: AOJu0YwYl0s5feBC6O/N9FICKvf2d0tQNZyw+sUxoVYXYF5WakKAYocZ
 oYSjAgYqzEnhDg8W73FXhJLDnbnFfyeNCbKmnG/LIvYV1DkW1TenmD7y1u7ItPg=
X-Google-Smtp-Source: AGHT+IE4IdVlZK7nZQIeEVkkvUvINFjYJUC7b47ExpSB23jlnenL9jSphPJ7dU2iRcVHdNJHXwSzsA==
X-Received: by 2002:ac2:4c4d:0:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-52e82747e5bmr5232300e87.56.1719857994731; 
 Mon, 01 Jul 2024 11:19:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2f8aasm1516931e87.236.2024.07.01.11.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:19:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/bridge: lt9611uxc: require
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Mon, 01 Jul 2024 21:19:51 +0300
Message-Id: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfzgmYC/x2MWwqAIBAAryL7ndBK76tEH6VbLYSFWgjh3ZM+B
 2bmBU+OycMgXnD0sOfTZsBCgN5nu5FkkxlUqaqyUbU8Qt8g3lFLSzHIxbHJUt2p1vQLtqtGyO3
 laOX4f8cppQ/yk2+PZwAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ylhHcMcrV547eodmRYkpw1mRL3EmELvfcMwfUScqkIM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rTZ88pt9Y2V86p8u54kdJ5r5j3wsJdWR53+Mr3W2/fE
 l48wUm6k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATUdJg/ysgfrKgcXH/zwPN
 F6J2CXvNCtzwxvRIatjrd+uWrKlQXpaRMT0u/1T0g+OrONiDe8++P9OpafWwJ0TspY5P6HRrx23
 T7J0KejQXNU04yOaYzvD4YVyYrN/qjnqrP53xDe/lTzx9+GeVc7lYrJOK5k0RgfhPP/eE6i+PVD
 6d/kwwvHJJyxUT2f7pou8yf2oriPm+kZ1ZwrNQ1e3V1pk7bx+4xvIqoldaoaBM9ITPXoPzC1sn8
 9bfdt3t3+nZIftctcRuYydLkHZ+9aLvMRuDDz4rVrL5eUGlouPCJ+nS0tcPU1PCrd+4bFn7p6ei
 vXGNRMovk1PtL+LKkkuK5QVCtBfNnzL/ZmK5x6FzYZmbAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

There are no in-kernel DTs that use Lontium LT9611UXC bridge and still
require creation of the drm_connector by the bridge on attachment.
Drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR by the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/bridge: lt9611uxc: properly attach to a next bridge
      drm/bridge: lt9611uxc: drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 103 ++++-------------------------
 1 file changed, 12 insertions(+), 91 deletions(-)
---
base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
change-id: 20240625-lt9611uxc-next-bridge-5827d9b17fc1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

