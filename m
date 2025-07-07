Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AEAFADC9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 09:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE0210E282;
	Mon,  7 Jul 2025 07:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="le32W7s5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACED10E13F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 07:57:18 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b34ab678931so1847302a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751875038; x=1752479838;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fQK/9TljJT68jk0i2VGXxC4KsVLmbF/aNC235kAq204=;
 b=le32W7s552E7A4deM/ALgi8r8V2KMa4qAguYJYPTOJWlRv0IlvdQVvgNjY7t4gK2qR
 a+us8+vCqiODdAbXDO5CRzRMe4n/9xWtARnnMAkY9yB+jqfL2JPe9CT74IJihotYmtvE
 tfmPCvWOmwXuwrEpwIYAfNFymbiimRoUDAQpm5DdyLMjdng/I9ekXp9fUpAl3Red55YP
 0bL/01+aV3lc9Ba5a3YY6t/nhfvWQp0fM1NJzzrW7Gw52M6SIhSvyomlH+C4NNHHX1/Z
 N6irZ57b9s5tALqpFmmAUgcidqmGtORfELx5KcXHtly6adFlCAz9YkRI5RzBOAiRCWn5
 hehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751875038; x=1752479838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQK/9TljJT68jk0i2VGXxC4KsVLmbF/aNC235kAq204=;
 b=hA2/ww6T/EG0akrjPEAIpsjJ4NdGIFnCkniKQh6wMUd3biUBbpj1Mcx55xRq1ZV+8F
 NDsbGdTAs8qOQgihQVBB6gSumXFC/btIqln5ets+26TDBoaQN7HxFebB+8pGCZmSo0dW
 L6fCszSbaY5EG6Riee+c1f+79uANljfuJZTl2Hhu5D8QVZLEQAugeIL+r/oURwc/RhwH
 sFKIghAsXoPDhR9qSJoT68xC8d5z1UPJtFtvCQz/xMTSUxXTI2MeDlcs2hTUlef9/R1+
 ISsOa9scutnMQfid/d1meSHwKgQ3RO6dN1dUZgL/QIBOqXioCKHnBY0FoWBFodJ9Mfh1
 jG3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULnpw8xgIGoNQy75+6YsvcqG5Id7YCxkDqOEOertlb3IHCfQ5t7EPW9XX49C0xJ+DOis7OurI6nqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX5A2u0cJSj5UhUHIYyWmZ9oy+webh2Yy4MiQl9AOcDf42c6/U
 I8dL5BLPyXUliZuHblMFfC1Wr1YEkHiN74qH7uTA8R1kB4uAcRWTT2FcEqvwfcvI1dU=
X-Gm-Gg: ASbGncvC05fuONKJGQHUrxU+RGB8mcdoar9gG8d/ExpaywbRU50pe4Zi2LIyXqdvATn
 KzomPVDVKkkY1lwIeLpfZ7jSxOJ86SEfx4neb5afFbdTeXf1i0sfrgaSGVDOgA4deKpqNVrD4KE
 a4fk792y1xc4+uG7/j7ES5rUE7tLoaXyhqbPM9UPGe3WAFgzxSdLt5lbtkae0Kaqpzq9G0HBPvb
 Vp1k0cN/Ya0Ml1bmPul0BqLV+ksxCK8q7f79JJHmcmEWFv+O6j3Wx6KZQnEL2CJmgTRgWFeoVgN
 l9sIYOxrR9AevJWj7/TziQ1v9V8yQGMJUcn3HqSm9i/dEaE1/dA7Gtk8g1ettFIHDfJZ7pfU55M
 jLIgVCl8eiB3UiCtdnA==
X-Google-Smtp-Source: AGHT+IE2lbn1qBhh8KgJDxKX2gey0GXo1rH+SaJuo7y82wLYHSPHk5Utp4cnQZCTDw+CPsMhqqQlfw==
X-Received: by 2002:a05:6a20:9189:b0:21f:5aa1:3102 with SMTP id
 adf61e73a8af0-2272235311bmr12458991637.37.1751875037995; 
 Mon, 07 Jul 2025 00:57:17 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 00:57:17 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 0/3] drm: docs: Remove deprecated MIPI DSI macro
Date: Mon,  7 Jul 2025 01:56:55 -0600
Message-ID: <20250707075659.75810-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
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

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The first patch of the series converts the last remaining driver to use
the preferred _multi() variant of mipi_dsi_generic_write_seq(). This
work likely hasn't been completed until now because the panel's usage of
two separate MIPI DSI interfaces at once requires special treatment. Any
behavioral modification to the jdi lpm102a188a panel driver by this
series is unintentional.

Brigham Campbell (3):
  Replace usage of deprecated MIPI function
  Remove unused MIPI write seq and chatty functions
  Remove completed task from drm TODO list

 Documentation/gpu/todo.rst                    | 18 ----------
 drivers/gpu/drm/drm_mipi_dsi.c                | 34 ++-----------------
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++----
 include/drm/drm_mipi_dsi.h                    | 23 -------------
 4 files changed, 15 insertions(+), 78 deletions(-)


base-commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a
-- 
2.49.0

