Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46789D0F96E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 19:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE4810E258;
	Sun, 11 Jan 2026 18:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aUXNIq4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944410E054
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 18:03:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so45442315e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 10:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768154607; x=1768759407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ylNstlcHQqQPb1lIO3/+F8ejtUcnVrUxWIKtE1p/Jk=;
 b=aUXNIq4/ws3//ifjUUYFSS98vY5cYaBv8D9eiO3VCAQb/SgZWd3xr1IjBTiZ81XhE5
 9dhojMmaEAN+LAZinzZSCZI6vJRbpyKRrVtY+ijBY8S/S/Ku5yJo2A3VCzI1ZC5h79LM
 Av/pDLde1HV/nhhrOfWw0VwdyAwCYKXjeG5uYwUcp5UM9517TzUdVQtAJem2pfrfVNP6
 3ctkPp53MpLRYL8A/CY/3nSJa1IpJ0ntVRqWRkpWWy38hjSmz9eANI8Wxn9iqsLc+KjT
 9MaDvTR6jnzPuVWtQ36CQSyEqeBHSoZUZwWTmujOOaTOQhekiScLQfuQCy1807ceCL9e
 hpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768154607; x=1768759407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ylNstlcHQqQPb1lIO3/+F8ejtUcnVrUxWIKtE1p/Jk=;
 b=eRy0JV4BaJdscSRMx07h2gknk4h/66oqQYhiiHoV3gc5e5BW4UuZ9iWC7v+QaRuuiM
 Y/msVWizk81Z29VPDhNHbxQZ3bfMjm2cr3PVzfOYv5K+u7QbykIQo0p+4U/TksI5SHV9
 h8aagVW869FBdgIUfje6nmq+V+YpJZMT8v1rAz+PTiRrODmbj98JMwN7+r0CGureDnLI
 jWjK2p1qCMIf7/sCEDqJsdvXt6vcx77dLF0LFeUSijc6b1lSplqn8xda7IPK+/2jd7aK
 iNc59dMPnvDq7GKb3ywpvhezxaFpfmq33kRgSn5UWLowb2DTI3ipYd1gFFgmLquRlYUt
 3uoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDb6HW7OcJfVrU3su4SyCzNasQ0XvCjV48oLxkz7u/5DGC3iSA2UaGDTOZ1OC6bg6hXhGt5tzEx3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRzqBWLI+9Zu+Nw5lGb6nV8kuHjFL2Cb6m7sFaiDqjgBz//PAo
 gDRhTQ2i3/HyWa4wVcuigFjIjwxRw9TLIe1dq2iJFqrZQZHv7MYGkP13
X-Gm-Gg: AY/fxX4L8W1Mc7/byzRyLvlMbiSrAHQQbJiW+x3yKtZojLr3ioF0fCbnonb8Vj75TDo
 Dn0YnlCcKmNrktu+VmMDhoKfjgrgBa/w/OmcvEls3mEU76evSRMIZe1zjG6RZrcPbaU7+2lIuD/
 NdJ4H8J22m6HgsOP/da8gRkAsMkaj2sze/lMZX84a1teXi5G59lw/qYAXhPmzQdPRks2AIHsDq/
 JEMvP7mzJ1iDZwiJkcEfvrLh4cBIFWLHRF21shsV6I2L9HxRxTEhDwp3Dm2pmnSZsoT7tj5K+9w
 y6sY/SYHA59mrruiwJyQocyMVfvZwb2SY0CAk2JfrGa99cfkZqI2wGt/xQOIeRiJii09zKkVCtJ
 tZu2CGTwFwdc3UOcFF01dGUCONjzMXKqGzlj95Hx3f7sg+YMGwzqmKpQukTkcNSusKUTn4akzuh
 jOinIvEMp3kRmEPp46WL6Bn0zfAToG
X-Google-Smtp-Source: AGHT+IFj6AybmJoihdjdfDxy0n2aRd2OEr83rmTyUKMa6uV6WE/wqh+Lu6HN3O7FotA8Kfkee6MvVg==
X-Received: by 2002:a05:600c:c8a:b0:477:af8d:203a with SMTP id
 5b1f17b1804b1-47d84b41b69mr173708255e9.27.1768154606731; 
 Sun, 11 Jan 2026 10:03:26 -0800 (PST)
Received: from hassaan-HP-Victus.. ([58.65.201.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d871ac28bsm111313365e9.20.2026.01.11.10.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 10:03:26 -0800 (PST)
From: TrainedPro <hassaananwar12345@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 TrainedPro <hassaananwar12345@gmail.com>
Subject: [PATCH] drm/display: Bump LSPCON mode switch timeout to 1000ms
Date: Sun, 11 Jan 2026 23:03:20 +0500
Message-ID: <20260111180320.4047086-1-hassaananwar12345@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jan 2026 18:39:50 +0000
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

The Parade PS175 LSPCON chip often requires up to 800ms to settle after a mode change, particularly during resume.

Although the Intel driver (intel_lspcon.c) is aware of this 800ms requirement, it calls the shared helper `drm_lspcon_set_mode()`, which currently hardcodes a 200ms timeout. This specific implementation forces a 200ms limit, effectively overriding the driver's knowledge and causing the mode change to time out prematurely, which results in a black screen (never waking up).

This patch increases the hardcoded timeout in the helper from 200ms to 1000ms. Since the function polls for the status bit, this change does not penalize faster chips but ensures correct operation for slower ones like the PS175.

Signed-off-by: TrainedPro <hassaananwar12345@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
index 719da3610310f..fda3cb4966adf 100644
--- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
@@ -495,7 +495,7 @@ int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapte
 {
 	u8 data = 0;
 	int ret;
-	int time_out = 200;
+	int time_out = 1000;
 	enum drm_lspcon_mode current_mode;
 
 	if (mode == DRM_LSPCON_MODE_PCON)
-- 
2.43.0

