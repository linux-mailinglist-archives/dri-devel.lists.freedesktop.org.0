Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FC941276
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 14:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4939310E522;
	Tue, 30 Jul 2024 12:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D+JpTJ5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35B110E239
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 12:50:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so1501903f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343838; x=1722948638;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FpQIo3/nECT6BJG3YrzIm131E/DRxLPrAjjYNTEWJA=;
 b=D+JpTJ5XE5gp2b4tavj9IgDqKvK4/Z7u1BXcW/EUkeE0rw1jkafHlTbWlOWhfPCZNH
 6LTU5cuEHF/RUl7r2CWEgBQvkpIATl4lJMLRRIbAuqMy/H/1lqzD8jv0jJDf9raWeOeY
 +hUT0Nv4FIxZJSHIPqiC4ETLfaAF47t3lXpZNrTBaSNU32rMxEt9xMfVopP1nb7cfBwT
 Vs2DT/WBOnuw+5R8ueDumb3wyuc1CvinMPCuK9O5dDk0yXbwJZUFrnWVa70eczpoGu4j
 k77cROSJElairgXpY++G4MadgR5mmGwGNkq0xXq77a28Beatcb8KiWDAL1RgzpE7adm1
 FwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722343838; x=1722948638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FpQIo3/nECT6BJG3YrzIm131E/DRxLPrAjjYNTEWJA=;
 b=qxDOSF6qu1dmxh6fKOCbUly7xe/i1dSyXd7uM5r0GnHp2i6o2/DqTc5/3Lpm6ZHBNq
 UttYbuBYsUSNa/S4+x5jRf8O0AKTN3SIK9DoQWR+lV00YAX5GwKwXcpYqR+0Mj4c86Dl
 G2WboBzpTBrLBuWagOT9ksVa3o2Vfv+TY3oTfG1OI7fMTt9KQUziMajQdzIv+WpC1x+H
 puFq8XDYWYd5yR3n+rJc5KbQ/RU6P7f3ME1fq+LSeWD8FGllZuYXnNb/6sYITmG7kcQp
 1vdzdtjhiC/k+jlJrNOuWC+/omya76Tu2wmtOFXGNKZZFyJTED0Cr3KJPgCOR6y7Zs0i
 m+eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6LdmPxu4xp6L5yERflbv8zOpHeqwmANIQLG3ygjd4oVG6yDTVQ+bpWqRwarS1TqIzijFUc7fNh+PSbZe2NIOLgXwDJzhYPqvk527/xPhV
X-Gm-Message-State: AOJu0YyMdPzxk9FifrT5Wc5+/7XF+je9vIGY/HdLMhSCt0X2PybIl7zj
 EMVZIgl6jMnDMGCsv3gShtQ5DP638aBDv0LL2IFbIxRwjwQHRlt8n3bHSHC76RI=
X-Google-Smtp-Source: AGHT+IFYKETa1maYsbR/lXJacP4Dulbw5t+LnfR9HzWYE5KbSp8mR/aHH1IRgvWxRpjGsQ/h6Ss4mQ==
X-Received: by 2002:a05:6000:4029:b0:36b:63b5:ed64 with SMTP id
 ffacd0b85a97d-36b63b5f8e9mr8234742f8f.40.1722343837924; 
 Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] drm/meson: dw-hdmi: fix incorrect comment in suspend
Date: Tue, 30 Jul 2024 14:50:14 +0200
Message-ID: <20240730125023.710237-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Comment in suspend says TOP is put in suspend, but the register
poke following is actually de-asserting the reset, like in init.

It is doing the opposite of what the comment says.

Align the comment with what the code is doing for now and add
a FIXME note to sort this out later

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 2890796f9d49..5cd3264ab874 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -751,7 +751,7 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
 	if (!meson_dw_hdmi)
 		return 0;
 
-	/* Reset TOP */
+	/* FIXME: This actually bring top out reset on suspend, why ? */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
 				       HDMITX_TOP_SW_RESET, 0);
 
-- 
2.43.0

