Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EE4F2953
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 11:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7110F215;
	Tue,  5 Apr 2022 09:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1377F10E5AD;
 Mon,  4 Apr 2022 22:22:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id g24so14772867lja.7;
 Mon, 04 Apr 2022 15:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3rwhB1mUhFaCfEgLZjUcCjNm+5f5fkFkvdLOTF0xYk=;
 b=P0iFhoylKXhVCWdgWMTjMyf65xZiqKqiiqn4536XFm7K4P9Ta0r/nlJa2ZwiC+a12n
 LSLuT9brEn/BUEFFC5GWAnVhrlfeyA9hIGXUnG9WJiMuq/PLyfQCGF2C66gRnkEK/+/W
 e0WoLN8Qs1s2zXNPwroDh68ftRZkYO04Dps0QAibdvREzehBAOAGVoxowB38OcI3ESLx
 IlDiri9w8Pk3RUThqxIFl288Atk6Wf21f7tUH9BmnEH5Aa2eAj6/ATlfCL13xk9EIcr8
 /Ri3gOybzV17/GnsQmzrsdw3NOaikndrXmGL+yF/PWgFm3YtmhHclJJPI4kygMXUTLX7
 0EYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3rwhB1mUhFaCfEgLZjUcCjNm+5f5fkFkvdLOTF0xYk=;
 b=UirSBO4CtlrhYyhc2p4St11opzIBERWRLRwaoL+yh589zARU9D9I83GAJHLr/WaT7F
 4ZJZM7uGsI/oR4ECI9CQB5zmGuJ5xy3RWRoWvK7YnSwmr8/YdNouEk7DS/c1Pug3iFNZ
 Dq3gNrjv7HFi9xhWQuFXnUiVvZntzHMhbB0cF83FfN90vzeRMqIRQZW7jBbNsyIXueR3
 IDJhpXoe/SaDhy7t3mW6lMI5XLdxvuI1jhtNPj0fPLpem7AECaxuakn8QeuHcsRwFNtL
 kIzJQMmkmalgA/c9//LqdNxiNQLAlpRTlBmO0lcgKA4Nl4PYaMgeEPgpgyCHu+I4U2hB
 3kWQ==
X-Gm-Message-State: AOAM530BjuwuNMiK9b5ZHY8ab+dZB2pdNglA+nJvhl4EEopehi/GKx1V
 dveeVSDno8IE3WJ1vUD28ig=
X-Google-Smtp-Source: ABdhPJwXm5uGlz1Ceov1IiHnrlmRknRoJkFqYNsXAi624p6ZE1sgHZJw6jz9Vbq32Ly/8CU4oucKGw==
X-Received: by 2002:a2e:9c96:0:b0:249:5f27:591a with SMTP id
 x22-20020a2e9c96000000b002495f27591amr172674lji.11.1649110925028; 
 Mon, 04 Apr 2022 15:22:05 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:1093:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 v10-20020a2ea44a000000b002493831631csm1181068ljn.14.2022.04.04.15.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 15:22:04 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdkfd: Fix potential NULL pointer dereference
Date: Tue,  5 Apr 2022 01:21:32 +0300
Message-Id: <20220404222132.12740-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Apr 2022 09:07:16 +0000
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
Cc: Grigory Vasilyev <h0tc0d3@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the amdgpu_amdkfd_get_xgmi_bandwidth_mbytes function,
the peer_adev pointer can be NULL and is passed to amdgpu_xgmi_get_num_links.

In amdgpu_xgmi_get_num_links, peer_adev pointer is dereferenced
without any checks: peer_adev->gmc.xgmi.node_id .

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index be1a55f8b8c5..1a1006b18016 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -541,11 +541,10 @@ int amdgpu_amdkfd_get_xgmi_bandwidth_mbytes(struct amdgpu_device *dst,
 	struct amdgpu_device *adev = dst, *peer_adev;
 	int num_links;
 
-	if (adev->asic_type != CHIP_ALDEBARAN)
+	if (!src || adev->asic_type != CHIP_ALDEBARAN)
 		return 0;
 
-	if (src)
-		peer_adev = src;
+	peer_adev = src;
 
 	/* num links returns 0 for indirect peers since indirect route is unknown. */
 	num_links = is_min ? 1 : amdgpu_xgmi_get_num_links(adev, peer_adev);
-- 
2.35.1

