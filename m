Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA8861FEB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 23:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12210E0EF;
	Fri, 23 Feb 2024 22:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DZS/UJOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0710E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 22:40:03 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-5d3907ff128so777656a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708728003; x=1709332803;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=izkBVtvZeid9EW6DkeQXaaTaSvfcQ1H0IJ+Swz72A+s=;
 b=DZS/UJOI2wwJbj6C9Lf6aNgr22ziJU6zRP931KJykG27RHCZfs4lVwY5xlGHbdMKuD
 0Wx14fcQgZHr604YUBT6CsMK5Q2RL7M9qAmxmWN7jgafvJkPCLhkvQVNgZFzM4PVtsNi
 LkYrK4fk7N+7WjfSpJIny6b5jB3fyOlAjl9ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708728003; x=1709332803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=izkBVtvZeid9EW6DkeQXaaTaSvfcQ1H0IJ+Swz72A+s=;
 b=oXnsVNLjdpeU2Nc9YAQJ8+SbqzUI9UiiWcoJIE3zEHOyH3mLyp+1ArY1LDf5lMXoEc
 GBCI8riSBwrzMayns/8OUin4xSlfjJbcIyv3Luqs8elR1ixF/QYfNVPeAYLvKs2og1EX
 W6T20iKYQOlHiW/iib78MxD/ZR4fdz76rpmwBCRtMTNzD6w+ggXo5pAK+ZfldTwC8mgg
 8qzatLdPK9zQ2+DCduZoXLODtmSoVbfGMhuLjNzn9Hquq5OYEqHNMFdeaPkteAgy8x8w
 mJig1vjncvqEpXBH3kfIX1xqE/FJsqO0+Sz6b6LDSHBk1xJaXB2F2HGot283qU7v7TH1
 emaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAm+7wy2pLoDjnACMi4x2Sse/nM3SKkD5viF3Uobb1L31nwAkCGFHyCKXH0pvc5OH1mewyEI7VY7kmW5k8vapfSCHeZEpcJMtsiKJS7aAM
X-Gm-Message-State: AOJu0YwxYIDqqsDV7P/CF9u8cdvIRWFgijq7AI3dzGTa4YGOk31oMSP4
 cXRWKKqXoUj8jlk6SxPzzCy7GwJM4XCcGF9b1DELyNdrqN54Rl9qCpto5D91Dg==
X-Google-Smtp-Source: AGHT+IFLqEp+ut7+L1vZW2F/0DOKxAHKy2m3nbpPVLCCx3mk0ofsuFUvdrdReCRY9vZsTQ3VvgGtIw==
X-Received: by 2002:a17:90a:fb4f:b0:29a:8b5a:892a with SMTP id
 iq15-20020a17090afb4f00b0029a8b5a892amr1200115pjb.39.1708728002781; 
 Fri, 23 Feb 2024 14:40:02 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:8ff9:a089:c05c:9af])
 by smtp.gmail.com with ESMTPSA id
 cz4-20020a17090ad44400b002966a13f2e9sm2032873pjb.37.2024.02.23.14.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 14:40:02 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Match panel hash for overridden mode
Date: Fri, 23 Feb 2024 14:29:16 -0800
Message-ID: <20240223223958.3887423-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
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

Since product id match is no longer sufficient, EDP_PANEL_ENTRY2 is extended
to check the crc hash of the entire edid base block.

Hsin-Yi Wang (2):
  drm_edid: Add a function to get EDID base block
  drm/panel: panel-edp: Match with panel hash for overridden modes

 drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++-------------
 drivers/gpu/drm/panel/panel-edp.c | 60 ++++++++++++++++++++++++++-----
 include/drm/drm_edid.h            |  3 +-
 3 files changed, 84 insertions(+), 34 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

