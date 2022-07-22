Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6C57E85E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 22:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B0A93B8F;
	Fri, 22 Jul 2022 20:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E0D93B89;
 Fri, 22 Jul 2022 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7+kt7lXOg2rVGR6fwaVlAW44Sd/NwFG7DwhTa+6yfvM=; b=elkhrBkgGSiO5UJ34CwXrkxblr
 u7jbS6bDQb/EQulXwN5VwNSKUfkHEKy0s5PfDb7mLyEYc0F/CrnjhpQqzyOHk459b94i6WOsCVp4u
 cJQZOJNxlJVWXYrhhlcgXsXQZBi85MKpokjp31zBEKmI3XAmfbpXiB9rPnRTVJGCkcCVcIOf8Vqai
 Fk53yqzzOJ0awTKMxCTod5oiW+qj3tzLGlI7Hcyes93yyYSpE7gpdsawQK5hVhXMR0/Wfo2lJwAT2
 v/GZ+aESwfOPF5d92BhlUzZXTwYJ3Qv9KwJ89+5T6khGQbTL/Z1EVcWQINMjU3F9VaF7Jwya+NrRS
 vLygpAvQ==;
Received: from 201-13-50-220.dsl.telesp.net.br ([201.13.50.220]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEzM1-002fLB-5M; Fri, 22 Jul 2022 22:34:33 +0200
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
Subject: [PATCH 3/4] Documentation/gpu: Document GFXOFF's count and residency
Date: Fri, 22 Jul 2022 17:33:46 -0300
Message-Id: <20220722203347.70176-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722203347.70176-1-andrealmeid@igalia.com>
References: <20220722203347.70176-1-andrealmeid@igalia.com>
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

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/amdgpu/thermal.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/amdgpu/thermal.rst b/Documentation/gpu/amdgpu/thermal.rst
index 997231b6adcf..c31f94c6c681 100644
--- a/Documentation/gpu/amdgpu/thermal.rst
+++ b/Documentation/gpu/amdgpu/thermal.rst
@@ -104,3 +104,17 @@ Read it to check current GFXOFF's status of a GPU::
 If GFXOFF is enabled, the value will be transitioning around [0, 3], always
 getting into 0 when possible. When it's disabled, it's always at 2. Returns
 ``-EINVAL`` if it's not supported.
+
+``amdgpu_gfxoff_count``
+-----------------------
+
+Read it to get the total GFXOFF entry count at the time of query since system
+power-up. *Only supported in vangogh*
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

