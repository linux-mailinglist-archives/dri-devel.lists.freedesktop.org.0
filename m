Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377D1983BB7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 05:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72110E4C4;
	Tue, 24 Sep 2024 03:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fJt8ekz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0802310E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:53:17 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-20570b42f24so55065915ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727149996; x=1727754796;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=itAoP6z6vkUpMR5lw63h40cd1DW9tcScRk+uvBsAU8g=;
 b=fJt8ekz4TIMxNkG0yV2D/TKchP39li/DCm7nUUFBpmDE8b49F+VxYRKGyZpD7SoDrf
 y8lCWqf9siwTMKeORO+NoCVnELwepWf6IvxdtInZeJ6SWNguZAaPJ6q1R3/8zJLytisy
 h84ZP5rrc/R8ZF4N14vU3sIRL7GTRvnPpD5k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727149996; x=1727754796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itAoP6z6vkUpMR5lw63h40cd1DW9tcScRk+uvBsAU8g=;
 b=hiHcDckPsUESXomLyDYOFGFQGDyDcqWQxC4ngLEDutMNIPf+64j9rtIzW/k0Gfxypq
 r3qwRai+8D+e4osnHpgPX72Tu2dhWCi3GoS/1dCIc2/tcuVXMk70OtK6DmBu4NNf1tSV
 h+dkahfj4gRIQL4kHXyp7c2FhJgJwOmrZMW6VRGrYYSBJPDNFGuTQAjw4pN1rC0pYexM
 mo+D1sEsVIpgMSswDkY/35eT+se7pSY2wVkVKtzIZy91EtJI4ocaToExHUZm2oF0tVl/
 suEf1ZEfnyvXw2swy7TXchSSpuQoDweaCqToPl19KtUyLX3ph8B+cgQsRh7A09SMQeKn
 HnYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK9d4DQ2HZlHF/eCCcX9W0a9fZmjUhefG2ytSnNzOLmBnki3822Nu2mUEFrSEmuq5PyvrSrWM+anU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn+qilNEEe+fzRwE0lf7V3J141896dvqKKL9olLf64EXiEiRIN
 kU/2aKHfWsvTX4LmkQob8XihnzbVGMSEuFKTg221bAmQV/s0Si378yTtCCEK8w==
X-Google-Smtp-Source: AGHT+IFky1LfGemAY/Su4SnOb/kwNfm+jkQA/oFjvASbwaAUL1I1hsKEb4eZXTg0Szlx4LIwBXJAJw==
X-Received: by 2002:a17:902:ce82:b0:205:7b04:ddf2 with SMTP id
 d9443c01a7336-208d839ac4amr227572735ad.29.1727149996583; 
 Mon, 23 Sep 2024 20:53:16 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:727c:308e:bfa8:9ccb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20af1869000sm2555335ad.307.2024.09.23.20.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 20:53:16 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/2] Drop EDID cache for it6505/anx7625 when the bridge is
 powered off
Date: Tue, 24 Sep 2024 11:51:45 +0800
Message-ID: <20240924035231.1163670-1-treapking@chromium.org>
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


Pin-yen Lin (2):
  drm/bridge: anx7625: Drop EDID cache on bridge power off
  drm/bridge: it6505: Drop EDID cache on bridge power off

 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 drivers/gpu/drm/bridge/ite-it6505.c       | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.46.0.792.g87dc391469-goog

