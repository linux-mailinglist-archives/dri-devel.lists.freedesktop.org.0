Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27EAE38A7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1FB10E1C7;
	Mon, 23 Jun 2025 08:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bOB1GlAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265A10E03C;
 Mon, 23 Jun 2025 08:41:31 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so25218775e9.1; 
 Mon, 23 Jun 2025 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750668090; x=1751272890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hFKfoFX+b0fWpj1OGuQAhMWHq/Trp5Rsum6TUT3TNh8=;
 b=bOB1GlAnKI3IxyMm+k/D7saH25BCSgMI9cDYso+4Z5dh49BzdtpAF3WgTdk02bJ6XJ
 TYLsAO6UGabx6SgmUef23aTMf+5JhyEfep1kh4+BqzHYMpz3mCDzSGz0vOJ2JfAhUvTc
 LRciv0oJOiel0WNPACawEiJkq56dC7njLYurSv4O5pmJ1TO8RRZbRDqs5NUi9HMW7Ntg
 YE2ExfpEkM3xz0jf0ZNaoNH7WSydrnbMCbD/orKIpZjppZutpBIgFdndH9Lbm6DxBbxY
 uYXDnAvEroKY6YNPd0aGZ9wxo9SzNfTKQhTWbGV4h5iN10tu0FK5hu7i/KbLpVKiPj5Q
 XV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750668090; x=1751272890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hFKfoFX+b0fWpj1OGuQAhMWHq/Trp5Rsum6TUT3TNh8=;
 b=CV0OgjoAClVLLfC8F20Ji3XiDIF0kdzWohFXTgfNpzcdGkrUzlm9sLg3ewUfGSCdWV
 Ox7uERX6o8ExZmNvrxfRbp1xat/zBa2tRklWftvcDgM9oX6ej3R1Yts+VDCEIAUbPUNE
 2wLEnNqJigvdud/LdmggyGI3YQpkEnIyD+aMcN9HNFkHetmgvRKzkCD5XEHAofwZCme5
 ltkt4EPEgdyyrwavS+d5sIYcWZyngmCOIa9hTNSuTKYn87wJHKBcxUl63eTEs04qY3gA
 SI5gq6oNibJ90swyeskRoMqAVaTygD/XA1j8oGNhAWL20NyabcKgpWGTf5EklxGtw5ZU
 /W1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjNJ+ii3ZwJaWznalQyOsEfyloOWG2NKtua3PAK2adf4nUQX4m1hV0YA4iU5Sf2TGJUkm6MXo2kMe+@lists.freedesktop.org,
 AJvYcCWifL1d3EGw8TNHXFC37qKBgkReyhWvKw765/CBI02opy3U5Gic2/Rb+sTD8UxlzPtG8/kBmaC9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIGazcl/4MV6K1boIOiurFfen2FtVmqb8kvNJUJhRV+/HuSHOH
 OEnj9+o3Iziq1SAN0coI4W9LWQfVAE3DIcpBcVgKZl5Jiz72k0FdFz2T
X-Gm-Gg: ASbGncv5A3GOFchrzwQgYGHRY3Kf4x7jZl6kxqpB+Z40P+buvgBttJ9HflUC9c6ikx4
 dkOjpp0w6/kvmYpelnfGa3hoyLDvZ2vRaFE3krBduz3QnscrmR+VItsr/n8MyRZ98XrZdCGFMci
 Tz8MrWFTczOJ1cjGgbyIxKGTouilcwzUM1TQvuVK2SxaMNWq9bpalSFAqAoaDk743hD9fMZvy4n
 R9aEUwY780f6BRyk1pGr0ydQ2Q1e+ZyWyspf2XUJ4tw+W0B2VttO3IVH9hCUtT2nPLWFPXGdFb5
 Khswi7FOyO/gFfSN5R+Rcya9fMRpcjNluABe965617+dxBcWSuGZOzt1HNIG
X-Google-Smtp-Source: AGHT+IEg+Vrg4q7OXMVziKAkMdGsGKVcz2ch4jcR2RgQa7iyDmfJ9xV9plJ7R+MCae/mqCNaZWsqGg==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:f52d:8b05 with SMTP id
 ffacd0b85a97d-3a6d12d5316mr10912719f8f.35.1750668089889; 
 Mon, 23 Jun 2025 01:41:29 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453646cb5ecsm105878885e9.8.2025.06.23.01.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 01:41:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd: Fix spelling mistake "correctalbe" ->
 "correctable"
Date: Mon, 23 Jun 2025 09:41:08 +0100
Message-ID: <20250623084108.29627-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a pr_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7f8fa69300bf..eaf95ee5148a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2281,7 +2281,7 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_RAS_CE_LOG) {
-		pr_info("debug: disable kernel logs of correctalbe errors\n");
+		pr_info("debug: disable kernel logs of correctable errors\n");
 		adev->debug_disable_ce_logs = true;
 	}
 }
-- 
2.50.0

