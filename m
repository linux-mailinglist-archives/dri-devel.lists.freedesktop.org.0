Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E45819A1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 20:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D11697A59;
	Tue, 26 Jul 2022 18:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08D99775F;
 Tue, 26 Jul 2022 18:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ciDPhF07fS+tRj3SbXyJWbm9upDSDTB8l7rbsGiPQ3k=; b=HonnJmwDnytfcoTbVHoLE3mgX0
 lcMlhkhvqTsXNkBGMdFPqQ93L1kBh1dV0CRrxL9rAHgFFsmdES4PJTyjvaVmm2KZ2+3CEWvCDLEDw
 K6hnBDsnv22F6NxxkjIsklTgXVcW4Rqrog04d0nacSx2c4sroNW1F8VsdWUddNE3MofdBGjoZ73Db
 P+2GyLpHBZElYEr5k9BmHeil6vp0UyNIK4z6Ewb6yajipHVteL7Lo4eEk917qCSp7D6NF4WYLi4Il
 Wroc3Om0g6NK8wYZIJlwacrEwW/xZ6rOtnv67ByyHMJC3B/7WiKMrKtdH5kvDMuZrWksr1JqZuLL6
 ztGiztzg==;
Received: from 201-13-50-220.dsl.telesp.net.br ([201.13.50.220]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oGPCx-007aEh-7i; Tue, 26 Jul 2022 20:23:04 +0200
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
Subject: [PATCH v2 3/4] Documentation/gpu: Document GFXOFF's count and
 residency
Date: Tue, 26 Jul 2022 15:21:51 -0300
Message-Id: <20220726182152.123649-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726182152.123649-1-andrealmeid@igalia.com>
References: <20220726182152.123649-1-andrealmeid@igalia.com>
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

