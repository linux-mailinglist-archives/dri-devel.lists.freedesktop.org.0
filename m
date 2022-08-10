Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E958F4E1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 01:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEB011AA4B;
	Wed, 10 Aug 2022 23:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519BE9500F;
 Wed, 10 Aug 2022 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ciDPhF07fS+tRj3SbXyJWbm9upDSDTB8l7rbsGiPQ3k=; b=RkaB8hBq3/R/1OYWjtaZU64XCX
 3OmzaUdxiynm4exZuNrmc6p80Mw5Q6TYSSnSb/f1mTTaOmyzWraHCWxeISIq1a1ICOLOzZmlweG0o
 YOmSL381a0dVFwm5y1rNY8WU5GNzqwCjTruBEEV0GEyTjt4gRDE2hh+yRINWGSaTFlAi1r6sEUQBM
 DLld2kb46YIkOfVWUrCd61qLCINDWkePkLM9hWKCHeyfQMuPQ4RxM+rbHM2B8H7Lgj9+lvMGgr/nv
 B9KLN8qAnLDY6xslPCom9REx6WbYaVQXvAoCBquUIG8VXYXzipYvOf+Drhi1GLdT5TXFFv6zg5n1n
 qYTw7yMQ==;
Received: from [191.17.41.12] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oLv8x-004r9g-62; Thu, 11 Aug 2022 01:29:43 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tom St Denis <tom.stdenis@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v3 3/4] Documentation/gpu: Document GFXOFF's count and
 residency
Date: Wed, 10 Aug 2022 20:28:57 -0300
Message-Id: <20220810232858.11844-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810232858.11844-1-andrealmeid@igalia.com>
References: <20220810232858.11844-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation explaining those two new files.

While here, add a note about the value type.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/amdgpu/thermal.rst | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/thermal.rst b/Documentation/gpu/amdgpu/thermal.rst
index 997231b6adcf..5e27e4eb3959 100644
--- a/Documentation/gpu/amdgpu/thermal.rst
+++ b/Documentation/gpu/amdgpu/thermal.rst
@@ -72,7 +72,8 @@ card's RLC (RunList Controller) firmware powers off the gfx engine
 dynamically when there is no workload on gfx or compute pipes. GFXOFF is on by
 default on supported GPUs.
 
-Userspace can interact with GFXOFF through a debugfs interface:
+Userspace can interact with GFXOFF through a debugfs interface (all values in
+`uint32_t`, unless otherwise noted):
 
 ``amdgpu_gfxoff``
 -----------------
@@ -104,3 +105,18 @@ Read it to check current GFXOFF's status of a GPU::
 If GFXOFF is enabled, the value will be transitioning around [0, 3], always
 getting into 0 when possible. When it's disabled, it's always at 2. Returns
 ``-EINVAL`` if it's not supported.
+
+``amdgpu_gfxoff_count``
+-----------------------
+
+Read it to get the total GFXOFF entry count at the time of query since system
+power-up. The value is an `uint64_t` type, however, due to firmware limitations,
+it can currently overflow as an `uint32_t`. *Only supported in vangogh*
+
+``amdgpu_gfxoff_residency``
+---------------------------
+
+Write 1 to amdgpu_gfxoff_residency to start logging, and 0 to stop. Read it to
+get average GFXOFF residency % multiplied by 100 during the last logging
+interval. E.g. a value of 7854 means 78.54% of the time in the last logging
+interval the GPU was in GFXOFF mode. *Only supported in vangogh*
-- 
2.37.1

