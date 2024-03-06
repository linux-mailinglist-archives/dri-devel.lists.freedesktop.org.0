Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA4872BD8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710B3112DB6;
	Wed,  6 Mar 2024 00:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XEX/hlBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF0E10E75A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:43:51 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3c19aaedfdaso3902152b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709685830; x=1710290630;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=skL9kwoINY2e2BLPcnAl1r5cKivgr2bgQKAAVl8VlEI=;
 b=XEX/hlBMbaGgxpfikapC1dSXl4Dq0YwqTEiTPMq+SBXZvQeE52UvhTR0Bb9zDLc+JU
 f50Lk91GfivoxMjtyyy5bHH+JY7ON+vSkxhSzGuCGR9tc4HwMnRN5x4UB1ZHkFmRzS5A
 gs1xcR4IDRxJ/e+YA2S6JeHAf321H/WKY4RWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685830; x=1710290630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=skL9kwoINY2e2BLPcnAl1r5cKivgr2bgQKAAVl8VlEI=;
 b=PBmlh4pNLW+fderBDRs7OtzVTRgqWzWivBBSudDj9IkIz+EBtmYqYRb7o+bdFgC/LO
 hsi5LGVULuTuiLDl5sGK9JpKPOEL+USGcaJadE6qIO8n2glOifXxSCG2uDBljw6yl/uq
 ur7BjqmVl/MLw1LyHsLd8HXRWDYpB3kynzcRV5Zpt0VZNPUIeNcorv79MaQBxpW6kg1u
 4QnmKz31aZu/a0Tpf7BQoHz2yEnDEdRjiQUG2kfLhnNTS8ku/nKk7pzHMjTTQKtbdJ6F
 UOB9niHOVr7nIy/Kb72nIYqMdnYQx+uJsge/pmIgTfdCkaDBOQszR92OnlMUsIImhFd2
 vK/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8cu4N1cyKLdF0CxNGhxR1rgndNOmpDNIYpwlILDdoSQtFCrozvav+yuOaTOSvFR9TcUn3/ZALcWLbBcFzDZ1B+8hfhsiHitzf8EpQuZRS
X-Gm-Message-State: AOJu0YysTH2+i8/0nO3H8MHsxW8Hw8T2+meEhqf0Qw2dhgiKC87JQCEt
 Gt5AMsDhsDZG81s910WaX8xDCEfpAQHg75VfrP6u5ZQPzrTFpz8BAIId3wCqNQ==
X-Google-Smtp-Source: AGHT+IH0rkwG83EfUqaVo2L5B6vkJMYLTrBhh7MNxEN86PPrBbsKd0w3xq4KX0LNtK9mic7XGS+vbQ==
X-Received: by 2002:aca:2209:0:b0:3c1:d24e:80d2 with SMTP id
 b9-20020aca2209000000b003c1d24e80d2mr3600263oic.1.1709685830579; 
 Tue, 05 Mar 2024 16:43:50 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:29bc:b3d:1ba8:cf52])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a631725000000b005dc48e56191sm8512885pgl.11.2024.03.05.16.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 16:43:50 -0800 (PST)
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
Subject: [PATCH v4 0/5] Match panel with identity
Date: Tue,  5 Mar 2024 16:34:00 -0800
Message-ID: <20240306004347.974304-1-hsinyi@chromium.org>
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

Hsin-Yi Wang (5):
  drm_edid: Add a function to get EDID base block
  drm/edid: Add a function to match EDID with identity
  drm/edid: match edid quirks with identity
  drm/panel-edp: Match edp_panels with panel identity
  drm/panel-edp: Fix AUO 0x405c panel naming and add a variant

 drivers/gpu/drm/drm_edid.c        | 152 ++++++++++++++++++++++++------
 drivers/gpu/drm/panel/panel-edp.c |  68 ++++++++-----
 include/drm/drm_edid.h            |  11 ++-
 3 files changed, 177 insertions(+), 54 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog

