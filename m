Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F3C52F32
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0F710E0D2;
	Wed, 12 Nov 2025 15:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3410E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:18:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42b3c965ca9so555664f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762960723; x=1763565523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9ERKG+RVswYeFDCXzwz7sJNCbZbjByWuF1IneGgYXk=;
 b=BRVQTotevnS/Oz8q4ms+UZ6ZLNvnaGWT7LcXYRY27BoW+9MOiH68ZxDIItdU0V4REy
 Di60AeYTBEtLtN3TmIr8tfU1+KvAW5Vs2pTZAhzcCM07xnDMwo1cuh2kc6DiUvkhCH8K
 3RnyxJXjfZ1hxSz8hu/92aipmtzye+rIiB3E3EJjNDw9x/kfA8Eou18xgWJs2HWyCJ90
 0jm7wH1p4z8aOwvxSx8Tnh3VU01uNaX6jxV4ZL6yZGwoJ7M5+A/9qxGNycEk3okSpEwo
 ZdsNw4vaZ+dFG+4pOKw+M9C9uAlwFdbb0/jX6HZer/91RfzhQQoMfrH6ySYpT8veo6CL
 7sHQ==
X-Gm-Message-State: AOJu0YybFKCPUAIRLEhhTZ6eLNKgPFFqOzJU1hIdEDviGDF3q1+OOWKW
 JLAS1JaFt/1BBXO+b8QVRGwZP13uK6WUDqj8HuFwaLLchlW75Hez4B1lq3nkaQ==
X-Gm-Gg: ASbGncvxr4KTjiiEro819nLCU3JO9bBS1f3ryKUjmCbFQWObvpBM3ND8ZpXHaD/JsU1
 ElMZd/eYSykSHWSkHmZ3O72jLbKqmlZMLX679Wjam3AbLkeHJd9eQgsTXGl4CdY8xNJApI/37ld
 +Ttmc68bCTw0CllShoh6LGFvELs7N5BuijNGP8r5Su1w4KrmrEjurZWYYPonAd5zwzw/7ZJd1c2
 v8ilYbdUMGwO2KfmSYVImfn0q5r+vBVTWuPPbOzMDhrsrZsOHszS82aeh3XUvafCV49s9xE00TH
 ILdZZH20bFlcb4UZQ+Vhfw4MHwhngkxZysUNrOrzjP8KpF+UncZ//LFhZ4Bhe5Z1hn06/J0whr+
 44zyoT2lgQv/JgeBwgyyQv+5eiq32da4CQCmaM4eBmnGfD089azBHJwV3d0SVuNFy2ef6V0T9PU
 VmDLmX4+wnRcY/s3ORPOs=
X-Google-Smtp-Source: AGHT+IFl3aCPLhARBAOzXnz43lwg+zp85mBUw/QQcIFFk9i36RBEUBY2w+Fa5wu6vZ6vO2WwfomyKA==
X-Received: by 2002:a05:6000:2f88:b0:42b:3ed2:c08b with SMTP id
 ffacd0b85a97d-42b4bdb674fmr2815717f8f.51.1762960722922; 
 Wed, 12 Nov 2025 07:18:42 -0800 (PST)
Received: from xavers-framework.fritz.box ([193.124.138.23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b32c1ad2bsm23255211f8f.6.2025.11.12.07.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 07:18:42 -0800 (PST)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH 1/3] amdgpu_dm: also send FreeSync packets on DisplayPort
 connectors
Date: Wed, 12 Nov 2025 16:18:30 +0100
Message-ID: <20251112151832.77867-1-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.51.1
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

Afaict there's no reason why it wasn't done before, and this is required
for later FreeSync 2 HDR enablement.

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 163780030eb1..1660169ae5aa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9048,7 +9048,10 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST || aconn->vsdb_info.replay_mode)) {
+	if (aconn && (aconn->as_type == FREESYNC_TYPE_PCON_IN_WHITELIST ||
+		     (aconn->as_type == ADAPTIVE_SYNC_TYPE_DP &&
+			aconn->vsdb_info.amd_vsdb_version != 0) ||
+		      aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
 		if (aconn->vsdb_info.amd_vsdb_version == 1)
@@ -9058,8 +9061,9 @@ static void update_freesync_state_on_stream(
 		else if (aconn->vsdb_info.amd_vsdb_version == 3)
 			packet_type = PACKET_TYPE_FS_V3;
 
-		mod_build_adaptive_sync_infopacket(new_stream, aconn->as_type, NULL,
-					&new_stream->adaptive_sync_infopacket);
+		if (aconn->as_type != ADAPTIVE_SYNC_TYPE_DP)
+			mod_build_adaptive_sync_infopacket(new_stream, aconn->as_type, NULL,
+							   &new_stream->adaptive_sync_infopacket);
 	}
 
 	mod_freesync_build_vrr_infopacket(
-- 
2.51.1

