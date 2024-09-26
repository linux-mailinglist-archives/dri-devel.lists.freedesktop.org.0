Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E798701F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868DF10E2ED;
	Thu, 26 Sep 2024 09:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JhThN30m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAE310EB35
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:29:38 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-206e614953aso8272935ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727342978; x=1727947778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CoVZDlT8rcbCdZD4HgbL8e34c7fme5G3T1sU2oo428U=;
 b=JhThN30mNSs7O0nljEnCtFXQuH4ZRGVzT9zv/irIxoU+8usPp+LnxpnWtnQ6tQBz4I
 oNBRosTfZyBCbMzuLYr7/7S5w/nUqHPmAOgoUIyE9cZH5h57vN7ef1PUhswqjlzC/squ
 tB9qyuoCDIbywZ1E7u7tnPgTRLEv/rc+ncFQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727342978; x=1727947778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CoVZDlT8rcbCdZD4HgbL8e34c7fme5G3T1sU2oo428U=;
 b=axFqG+uYq/aSwE2rS+pld3vwOpaaHgm5H+6MFjt44NMwCh3OE45vvPbXti7nQeIhCd
 mz29ScjuBnmGyhcGdT/ByEQmiMpCcHsQAYK6Qq5E4dFqvpYe1i9FhgvIYPP2On3BCCXW
 cD5wcIf6LJ6O7+ZM3EAalfuMJuvq/h/2Tdqh58t+QW39xmVeyjufThGG5qfJFCpe7DvO
 CnYc7T9FOFZ3mUJpLu4i4IZedc1wAfJ1OMXdyppPL2JSvvhCBGto/b9QK4iZE6kBOnCI
 jaF2BFfQ/2TqjeFTM6I8FfiCwLWJ8Rj54eKbKEb+2/9jVB9nPB9DD80tzcFt5bumU2GT
 gTcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWna1Om3dj9PISZNmPBJgEQLRvUYCW5+CsUPsgJ+J+mKNbBhvWC4anTQLZT8VS2MZxgTqtQMxX+EoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0/VXkF+E1e3DLAcZRRmTHVI7kQjG4ncaet6HE+GoxWemGfcVQ
 rjVnxWxt7+pOacqR0RFWgVSu3jpNKi5knubuk+Czqe1Rw3b+Fy6m8XKBvW8+ng==
X-Google-Smtp-Source: AGHT+IHXrp6wJER4dh1BTAriwK+WD+8X8sDvbZv4icGc+K+dLuVljojwoLFCgGkE+FqGR4g9QtmlWQ==
X-Received: by 2002:a17:903:40cc:b0:205:701b:22be with SMTP id
 d9443c01a7336-20afc662bdamr57796665ad.56.1727342978037; 
 Thu, 26 Sep 2024 02:29:38 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:4234:cfaa:3b83:d75a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1720b00sm34819105ad.64.2024.09.26.02.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 02:29:37 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/2] Drop EDID cache for it6505/anx7625 when the bridge is
 powered off
Date: Thu, 26 Sep 2024 17:29:07 +0800
Message-ID: <20240926092931.3870342-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
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

This mainly fixes the use case when the user changes the external monitor
when the system is suspended. Without this series, both of the bridges
will skip the EDID read and returned the cached one after resume.

Apart from that, we also observed a DP-to-HDMI bridge expects an EDID read
after it's powered on. This patch also works around the problem by always
triggering the EDID read after the system resume.

Changes in v2:
- Only drop the EDID cache for anx7625 when it's not in eDP mode
- Collect review tags

Pin-yen Lin (2):
  drm/bridge: anx7625: Drop EDID cache on bridge power off
  drm/bridge: it6505: Drop EDID cache on bridge power off

 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 drivers/gpu/drm/bridge/ite-it6505.c       | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.46.0.792.g87dc391469-goog

