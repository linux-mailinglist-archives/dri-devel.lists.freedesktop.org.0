Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999AFD178C2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E1C10E486;
	Tue, 13 Jan 2026 09:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hSC71oZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC81110E486
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:15:00 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-81f4dfa82edso1091290b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768295700; x=1768900500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+s7yLtwafd1DP/bHj/6SXxAgsNok3A/T6LhCr4pAvvE=;
 b=hSC71oZU1U/Vce49VRM/6TFqNM+QD5FLJaVFo0WmcrGFygtF+gnv4q/TJVKHBxV+pe
 7i9KsfUME5zN6yzyt31iiMA8wUilurR6h0uJkEOJr1xRHP050p9WkmNRWobTle1TCZSJ
 HpGI6EwgK8Yv0+cmog4Kd94UlUMk3OyIJ3jOiwz3IhV0TtlIVub5XU4nWdMpgV5oqEGW
 cjbukq+0omkKswZ2wku7JeCu9loDZAFCXvtJdxHuMnyNhzX0u0BJgdwceDqLTBohR5gJ
 0AQkFITBqMIW+p2s0H050AzwB8qt0ajTJ93ijvxS7UEXsMO+2yiOiCkq4e6a8ddT/xeB
 IBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295700; x=1768900500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+s7yLtwafd1DP/bHj/6SXxAgsNok3A/T6LhCr4pAvvE=;
 b=RPgnrIqg9N7llHNgjLVjBJm4KgknqgXpu2Tkyqz0jdUvAzZ+1GUBqFwD1DMy6LV8ln
 ij3Mqh9gEKry/HPjf5sJRZtI/bsciujwvMMxLJlt5OxoisZe2ArQ5iXyeIqCD3FTDNEt
 Adq8ARWB4m555e9bn8Wgt0OnxrdErlQhYXyKQFzC/hwvEciuoLnMG/31r8G7dvEk2bTj
 QBxBkZsIRY+4dwStPk0r59Ux4g6+1vjjGq8oYQ/GfTqYSgTu7EKtuoPK6OeOdraVTWHy
 hcpAXzi0W5bNkaGfYB63lpAQVkJj0L6oNJ6G5rnfoOVbqu8Dn/YloBX//cGJwPK3zRww
 3wmQ==
X-Gm-Message-State: AOJu0YyWHhFvXB7M6op84xILwrhLkql91s8wpsqGZBWykGZny13WlzlL
 avTaamNOHyKeLlJakmY8HagYUG8dziLftcQmCkuvofwxaU0BBWeOAmrlGM6xU0cS
X-Gm-Gg: AY/fxX7y9xL1sHhL8nkm6B1iSNMYFpL5PXkvWlYdP7cIbbityNl0ACH7+7nbVaPUSTH
 3NQcFdybVLZkofzrvpzAH0J3HSm9GAfzDXUjD3oITFTJuJuGnGFbpJNifOE4jXGg7QvimiTNxTc
 2dV9YdrL6FUJonecFAtYsx8erjUDKYxCZVOwhUz32VestrD44Lq997IIX+tUGg50TdqDp+zwCgU
 AREtyYSseSb5kf+rZWoHIhnsjb95nw/Omm8jiZYAz98FeIW4/MikuMfoWQF841CKsMS0tJYQa0r
 YwTZbyd4T4RBrkThMX0rFyv51jG82+D2bjI0LMdToojjCCBAaUjPAeDdEmZEkEHjt/sdqKk3lbm
 b4CsD3kuBw8ImWsQDR7hBENETY5zhOzZnjbOlqJ6n9LK57gd40oMzRCja32SUnfCbo+wTTO8F3P
 RcZzvOhPqJD2N1k+OR8qF3ci5kjsHeOkTDSZ50Hb10vFw=
X-Google-Smtp-Source: AGHT+IHYqD0mcqXK6G8MAhkTPFDCEwe4nqIcOzNKIgk6Bu1mG4rSqcYdb08j1Y2dFKrXtGTfK+SQnQ==
X-Received: by 2002:a05:6a00:300f:b0:7e8:4471:ae6d with SMTP id
 d2e1a72fcca58-81b7fbd2393mr15211771b3a.57.1768295699733; 
 Tue, 13 Jan 2026 01:14:59 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:df08:2b25:2f22:316a:eb93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-819baa1936dsm19832778b3a.12.2026.01.13.01.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:14:58 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH v3 0/2] drm/panel: panasonic-vvx10f034n00: transition to
 mipi_dsi wrapped functions
Date: Tue, 13 Jan 2026 14:44:38 +0530
Message-ID: <20260113091440.43735-1-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Apologies, I did use the checkpatch script but I attached the unfixed patch file by mistake.
I have fixed it now. Will take care from next time.

Thanks a lot.

Changes from v2:
  Fixed typo

Avinal Kumar (2):
  drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
  drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi wrapped
    functions

 drivers/gpu/drm/drm_mipi_dsi.c                | 28 +++++++++++++++++++
 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 14 ++++++++--
 include/drm/drm_mipi_dsi.h                    |  1 +
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.52.0

