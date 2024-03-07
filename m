Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451E875AD4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF75E10F1A7;
	Thu,  7 Mar 2024 23:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nvzwfSmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAA110F1FD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:06:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1dd0d46ecc3so11456605ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709852817; x=1710457617;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7iHe5Q0jS1HzmXGXJsFnZi6ylveqC0jY0B2sEgUj6Vc=;
 b=nvzwfSmDUvLlAxy5mNq/5THAf+8EJSFYBEYPTTzWVlmxLyuSYtMX0PoD+PrlG2KXdF
 yUfjTInQMdgP+Two48bj9zcUVvJ8m2ksEj6FqoXQt9YqLe89kk44gDXHZRV5k+xsCB7S
 5P0DrnsG1OSKlxniKWQZjAQ+uW1wxCwL3B3Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709852817; x=1710457617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iHe5Q0jS1HzmXGXJsFnZi6ylveqC0jY0B2sEgUj6Vc=;
 b=IFGG2YYsSvN4AxpO5t3QHuwmNa/9qIZuohqofTX3UP1/+6CBpBdQBuB6NFgOcWDhlF
 TckiwiuK2RZOWVjI86R62cyZ4zG6tnpbXBaKoGbfD6CC7ybKGRZtHR00d7xaBy+jd4+7
 IAIx5sedHbEn8PNZ4Gg8j5U0OxyNqN6hbS9uJYelhDrhJKMi9e8JnHHcopA8EBQTWsOO
 LVyVKNsxosmvrRv1dgLsMo2RkbzXGLrxoYOSN6jDQrve7NqCitN/qNl8+DYY9d+Vr8kV
 6t32rCrEaHA5YKEJsaWTDuhf4mTk9ZXLyoSpBuBX2WOJPPp8FEELUrscABlyVEGAEuHi
 0+zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfwp0npdNFlAT/Ows6LWi3p3+i9bX8/77C0HEwIIX8wVd6VEfiCUB8TsrsnFml/vkmwks7QWv7Rh/ghoXTdC1t9zLuUBjMMAW3n3vjZVub
X-Gm-Message-State: AOJu0YzQiMXVhIGtJrEKs4wde1YxaHTLD9egBcydzAseqWqkuCXrCVbd
 BU7RkaGxVlUnWIBYTfzaoQ2gdwow2hgBIycqXvbO1zKzTOoEw4FHAxc1LrmUsw==
X-Google-Smtp-Source: AGHT+IGDyEFraCKG0HdJyNaPA3O24bCFqx7qZGkZjD64OyRYiu2ACBiTCOFte2RAn/zwJXOBBrJa4A==
X-Received: by 2002:a17:902:e74d:b0:1dc:26a1:d1da with SMTP id
 p13-20020a170902e74d00b001dc26a1d1damr13203385plf.13.1709852817467; 
 Thu, 07 Mar 2024 15:06:57 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bf8f:10d4:f877:bee3])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b001db63cfe07dsm15196654plc.283.2024.03.07.15.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:06:57 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] Match panel with identity
Date: Thu,  7 Mar 2024 14:57:40 -0800
Message-ID: <20240307230653.1807557-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
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

This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: Add
auo_b116xa3_mode""). It's found that 2 different AUO panels use the same
product id. One of them requires an overridden mode, while the other should
use the mode directly from edid.

Match the panel for identity (id and name). If not found, fallback to match
id.

v1: https://lore.kernel.org/lkml/20240223223958.3887423-1-hsinyi@chromium.org
v2: https://lore.kernel.org/lkml/20240228011133.1238439-1-hsinyi@chromium.org
v3: https://lore.kernel.org/lkml/20240304195214.14563-1-hsinyi@chromium.org
v4: https://lore.kernel.org/lkml/20240306004347.974304-1-hsinyi@chromium.org/
v5: https://lore.kernel.org/lkml/20240306200353.1436198-1-hsinyi@chromium.org/

Hsin-Yi Wang (5):
  drm_edid: Add a function to get EDID base block
  drm/edid: Add a function to match EDID with identity
  drm/edid: Match edid quirks with identity
  drm/panel-edp: Match edp_panels with panel identity
  drm/panel-edp: Fix AUO 0x405c panel naming and add a variant

 drivers/gpu/drm/drm_edid.c        | 147 +++++++++++++++++++++++-------
 drivers/gpu/drm/panel/panel-edp.c |  73 ++++++++++-----
 include/drm/drm_edid.h            |  12 ++-
 3 files changed, 177 insertions(+), 55 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog

