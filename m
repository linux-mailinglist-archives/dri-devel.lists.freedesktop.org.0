Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B694CD4591
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 21:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D626010E3ED;
	Sun, 21 Dec 2025 20:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="tNubzC36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A7110E048
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 19:24:26 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-88a2e3bd3cdso43017146d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Dec 2025 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1766345065;
 x=1766949865; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WNRXomm/9h0iGidBrRD9xr6yFpj6CojlLOaAVzHjsKs=;
 b=tNubzC36R+FN8+3qraNd+MfHoVWKaroczLB/iuR+AkT5kCv1c+S+RYE18Ua3phYUNd
 4/bpYqdWWbR5uS7+KHz+tU3Hki/LSHwuHB8OJpVjDrdVkGBp/o8FPpRH6IGuIEAOu96Y
 f0IUBv6WahRTf+E5KgWoWsnyGR4QvgxyoNUagSis3Ho6Ml+z0xineuFPKM8Psr+CLhL9
 iC4+7taurunHu6hwKTTL/7LC6vAz1JWvQy0/vGJ7Pinlwh2xKJx+m0G6DR7Fcvrw+uUn
 faMNH6uPPRGp5wACFR3H4PIxp9N3alhfzzoGYrk4Mdbkq2716uh5HHkNBRu7UXCOcEGb
 VPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766345065; x=1766949865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNRXomm/9h0iGidBrRD9xr6yFpj6CojlLOaAVzHjsKs=;
 b=wg0HAItIl4ZvD4PznH+uM4kxNhW8vinGre20ROLK1OaRiqAv5z0nLMax23nyL0VK2K
 yuLofPypYk7/0nXXb3qTzf2c7kWLBatQc4c90vlVs4+f2qfi/tJGa0TS7sPe2qlsbkL+
 yraPb8fBrdDSY49JGcbLbukq2L91aC7U1ti/u5io0E7UatIXUT3NMS7Amt8K9ldxzLSD
 9I3xjVIphUZ29f3w9X8fdvjfCMjN2BWm0bLC/StkZtgT2xmph8jY5+ctwxja9BLzNcm/
 j3mqTl1Lox3B6HSSNZey45m/UMlYRJ0IDCbrSHj9N03VjGOX0o1WXId91t4XC1TK8CI9
 Gnsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGWq/lQTkU3AAOYFdsa9tT53PIlUn3SKiMHpPWEhUzBxMD9fWR5Hq0igSDTn0WLhjAPpHEMNiNbF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYQKWR5I8oxWqrIWzB99V33oP4CvhUEaMddVdmVl+wRKg78zxL
 HNRlSNQX9La6gAz7DwQffakd0Wxhb3UctHzUIcvIcju8Xnut7tuoIX9h0joHn/FsUg==
X-Gm-Gg: AY/fxX76MZbjoqnAtedUq0iVuCFqpPPh3jcil5RNHXBapquZdwu1rnGW4FJny9ytkG0
 9vteneunqv4CYo1yNnufFONUSnzNgr4ebsWciHLgRnSKW3NWCgxtoq7yGT0N92x3Ug0iPPX9w2w
 VWT/6qL/TKRYhLcgpcgULc8E4S/ar/Vuh+YGo+6pcseemhUbbfWvdM8VeEJ3Tl6pYJSaRM0YsGa
 05LQFuY+/qcedyMV+nrUDnyy/pW2RyW2P1jkBJbme81+QRkJeQM+2fxFs+n91sSkA/DPjtWHutb
 CkE28rMtdDAQyo2znPkHhClykxTJPXseA7+5I39AC2HSoC3cpgYFYq4JYvnAv8q6JmlcIJQzJdb
 vN2XALQu7im0WNVvT8xaI+IkjXGThyJyqmE3fJdri1kp5cw/BhHsqYcr74jINQaa/ujmR/JzNwD
 8u9lEMtr6UVHej1fhFS7VG/f46hJ+uQGGkDou+Y7p6sNdkD983YMmd17qMf6ma4JzsAA==
X-Google-Smtp-Source: AGHT+IHgVYbByF5NCXxaki3N51wWAG7AvtLQAnsyAdqjgDj7hWSlDWpoheIh4kbzxiW2kzJablQFjQ==
X-Received: by 2002:ad4:5be1:0:b0:88a:375b:ed7c with SMTP id
 6a1803df08f44-88c533b360fmr188839156d6.35.1766345065382; 
 Sun, 21 Dec 2025 11:24:25 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca.
 [135.23.195.66]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d99d7e8d4sm68043356d6.41.2025.12.21.11.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 11:24:24 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Simona Vetter Thomas Zimmermann <"simona@ffwll.chtzimmermann"@suse.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add quirk to disable custom brightness curve
Date: Sun, 21 Dec 2025 14:24:17 -0500
Message-ID: <20251221192422.2726883-1-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 20:27:00 +0000
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

This series add the necessary plumbing in the drm_panel_backlight_quirks
module, and in the amdgpu module, to correctly support disabling any
custom backlight curve a firmware may have provided.

Basically, this is the same situation as with the other quirks, some
firmware data is sub-optimal. In this particular instance it makes the
backlight control jerkier when using the firmware-provided curve.

The last patch is authored on top of a just-sent change, which adds an
additional device to the list of known quirks. It was sent separately as
it should be entirely uncontroversial. Otherwise the changes in this
series were made on top of 8f0b4cce4481, the current drm-next.

-> drm: panel-backlight-quirks: Add Minisforum V3 SE
Link: https://lore.kernel.org/20251221185608.2718273-3-samuel@dionne-riel.com/

Samuel Dionne-Riel (3):
  drm: panel-backlight-quirks: Add quirk to disable custom brightness
    curve
  drm/amd/display: Implement disable custom brightness curve quirk
  drm: panel-backlight-quirks: Disable curve on V3 SE

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 drivers/gpu/drm/drm_panel_backlight_quirks.c      | 2 +-
 include/drm/drm_utils.h                           | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.51.0

