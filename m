Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17448D28E9
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7816610F3C5;
	Tue, 28 May 2024 23:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GEHNlJUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3424B10E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:52:58 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52ab11ecdbaso209649e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716940376; x=1717545176; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UHZNDUUbr3q7e6NPW2DwrC8X2CnNixkR9Oi+CBBYDV0=;
 b=GEHNlJUwVg/Bkm1MIeHk3gZ5j3W64SdR5Q/vEgXhdVNqEU67IR3tjU44aNRGaK9kY1
 4voULuYERnhQHQWl3xUAwul9cOPK2ODYo1Wfkw5U0etu0JJBe7Ozfg9C6DQh7AMQ18K0
 GRQLWrCNssH1dBr5e2RvUxoYlBVbd9pyIeNhyU90bqGd1Ud70rfGnxr2qu+g9HjDG9iY
 7u6jYQAKtHMgv2zlVoyDAC0VAMW8KQ5MgY37W/tt+g8XcAF6J5QkXF1D63mi5YEpoHzC
 XTqUKE2Gbf8jHr3cgWDsWka3aByuZ95QYV9OzsrUjx2UMWwnppwHvglw5qlfmVHv5++q
 6GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716940376; x=1717545176;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UHZNDUUbr3q7e6NPW2DwrC8X2CnNixkR9Oi+CBBYDV0=;
 b=cUgN8Rt0HkcnGmSLGhCMSUjsKxj5WLts+I0VPsbsp135xg2XnEvebl0glU/RyvohJT
 r4rDUnhDcqzckyS/QbItcuWIXEZK50xDLTN5ejECkybzt9pM3mEUtEi9wtsQOiczbR3q
 ZIGi9/Cy7KV9fkdKjtr1KWHHdT+5bKGkvueoP1iiV1uKsTBr8kXzfUkzLLtUY2EEWE4P
 D4d/1RFv5URLfWVb2o3LZq53oaTtlltd8OrgNOzFQdIYc5CFtQGPtLjh5wWEWbk93OVp
 Y/3LhOJYkiYp7kAGX85S8Ud72mpe2fGLEi7+T1ug5iJiVIMvNvPioQqIyE1aCxLkAaNm
 GJaw==
X-Gm-Message-State: AOJu0YySONydzyAjsEs7Lv4QF8b48vEODGinCC9bAURn/YNC6NcMXbWJ
 ar+41qpt1IbKwcidxeNGVnzSvYE8HlIDE53xNuSfqwVL9kexau9FE38BoDOcvPk=
X-Google-Smtp-Source: AGHT+IGqLAv4OZyUcAM8naoZFj20K0vlp1pzotZb6OElrE2WNXGbtTQKAWxUzgWmE+4EwKspTa0x6g==
X-Received: by 2002:a05:6512:3f03:b0:529:b717:2a18 with SMTP id
 2adb3069b0e04-529b7172fc6mr3374561e87.47.1716940375739; 
 Tue, 28 May 2024 16:52:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066bd0bsm1099869e87.165.2024.05.28.16.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 16:52:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Date: Wed, 29 May 2024 02:52:53 +0300
Message-Id: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVuVmYC/3XMQQqDMBCF4avIrDsliUawq96juIhmqgOShEkJL
 eLdm7rv8n/wvh0yCVOGW7ODUOHMMdQwlwbm1YWFkH1tMMp0ypoWySdMLtCGXmJCpZwz7TC1cz9
 BPSWhJ79P8DHWXjm/onxOv+jf+pcqGjWqzvreWK29Gu4bByfxGmWB8TiOL/RuDAatAAAA
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zhBAUb36pf48/N0Xpw1fsuiV05YaoZWCcFJTlPimKO4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVm5Wc00pr7mhb8XYoTjTxYcuglgy5D4WYfsxu
 Exxp3CTvNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZuVgAKCRCLPIo+Aiko
 1VkOB/0RzePb01tIc+8MNPG8I8IItb4ymjg3U/xVHeE3+VeY/roCzspzKY5EMESQQJix/QZ9B6s
 vEnDGqxakmpkq6IrhIq1BapWaN9pQ/u2noeLdQDV/kCHn9uMIeU8/4NxnQ+hiIYkI03V79VSGuL
 qysgRYWrHj3quiJuG8OBnpbw2Hi4h/a3shraRnZhBOTocXAiHY6H3pHdrkC9ScUHoSSQFx+mBAT
 +SBMVYXuCKwgmrlVnDqnWsf0cT9g+Py+kpe8BF+p8HhdSO0TRudREkan+re9J7dv9YgpusN3Wa3
 kA0xNPSJIlGlba0JZgAGAh1Ws5DhKPDx6d0Gruavnt83GXDi
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

There are two ways to describe an eDP panel in device tree. The
recommended way is to add a device on the AUX bus, ideally using the
edp-panel compatible. The legacy way is to define a top-level platform
device for the panel.

Document that adding support for eDP panels in a legacy way is strongly
discouraged (if not forbidden at all).

While we are at it, also drop legacy compatible strings and bindings for
five panels. These compatible strings were never used by a DT file
present in Linux kernel and most likely were never used with the
upstream Linux kernel.

The following compatibles were never used by the devices supported by
the upstream kernel and are a subject to possible removal:

- lg,lp097qx1-spa1
- samsung,lsn122dl01-c01
- sharp,ld-d5116z01b

I'm considering dropping them later, unless there is a good reason not
to do so.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Actually drop support for five panels acked by Doug Andersson
- Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org

---
Dmitry Baryshkov (3):
      drm/panel-edp: add fat warning against adding new panel compatibles
      dt-bindings: display: panel-simple: drop several eDP panels
      drm/panel-edp: drop several legacy panels

 .../bindings/display/panel/panel-simple.yaml       |  10 --
 drivers/gpu/drm/panel/panel-edp.c                  | 191 +++------------------
 2 files changed, 24 insertions(+), 177 deletions(-)
---
base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
change-id: 20240523-edp-panel-drop-00aa239b3c6b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

