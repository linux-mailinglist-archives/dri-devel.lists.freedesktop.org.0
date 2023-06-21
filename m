Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93F73787A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 02:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2618110E397;
	Wed, 21 Jun 2023 00:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC5410E396;
 Wed, 21 Jun 2023 00:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wMbMm2LjbMgpiJqJVmk81D3jcaDM5uS/Z4Si5959JYc=; b=QIwarYKnq64Uj9A19OtKYgeo+0
 9wjl6C3e8cPUCZtOyJblrw87TDaLkhfaGSmUPDN5L1WmFKge/xUZ6oMOulQ0hMdJUN9R1ZHN8Jpy8
 ArwGpQHbNLo5pBk0FpUAzy7f07le7/QhaW6IJoeq57PZmSiNApDdVRyNArWJMQFDxueT8qSeqhQxH
 oH59LxBDhXBstxzVBld8BSn8DuMpeX3mDQPCkrfdLv5OoR5qwiudN/ZwiWSE4nLluIIERebdDlOra
 UUznXhdeONCjbE8/PWnPOS8Cw+ls49cIGXoS4jMLgUtm9FPxm6R+9F8bcmAVsid1Sbk0mRKUPQOHE
 8HF94R0g==;
Received: from [179.113.218.86] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qBmBH-0011pg-SC; Wed, 21 Jun 2023 02:58:44 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 4/4] drm/i915: Implement DRM_IOCTL_GET_RESET
Date: Tue, 20 Jun 2023 21:57:19 -0300
Message-ID: <20230621005719.836857-5-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621005719.836857-1-andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement get_reset ioctl for i915.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_context.h    |  2 ++
 .../gpu/drm/i915/gem/i915_gem_context_types.h  |  2 ++
 drivers/gpu/drm/i915/i915_driver.c             |  2 ++
 4 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9a9ff84c90d7..fba8c9bbc7e9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1666,6 +1666,8 @@ i915_gem_create_context(struct drm_i915_private *i915,
 		ctx->uses_protected_content = true;
 	}
 
+	ctx->dev_reset_counter = i915_reset_count(&i915->gpu_error);
+
 	trace_i915_context_create(ctx);
 
 	return ctx;
@@ -2558,6 +2560,22 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
 	return 0;
 }
 
+int i915_gem_get_reset(struct drm_file *filp, struct drm_device *dev,
+		       struct drm_get_reset *reset)
+{
+	struct i915_gem_context *ctx;
+
+	ctx = i915_gem_context_lookup(file->driver_priv, reset->ctx_id);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	reset->dev_reset_count = i915_reset_count(&i915->gpu_error) - ctx->dev_reset_count;
+	reset->ctx_reset_count = ctx->guilty_count;
+
+	i915_gem_context_put(ctx);
+	return 0;
+}
+
 /* GEM context-engines iterator: for_each_gem_engine() */
 struct intel_context *
 i915_gem_engines_iter_next(struct i915_gem_engines_iter *it)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index e5b0f66ea1fe..9ee119d8123f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -138,6 +138,8 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 				    struct drm_file *file_priv);
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file);
+int i915_gem_get_reset(struct drm_file *file_priv, struct drm_device *dev,
+		       struct drm_get_reset *reset);
 
 struct i915_gem_context *
 i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index cb78214a7dcd..2e4cf0f0d3dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -414,6 +414,8 @@ struct i915_gem_context {
 		/** @engines: list of stale engines */
 		struct list_head engines;
 	} stale;
+
+	uint64_t dev_reset_counter;
 };
 
 #endif /* __I915_GEM_CONTEXT_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 97244541ec28..640304141ada 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1805,6 +1805,8 @@ static const struct drm_driver i915_drm_driver = {
 	.postclose = i915_driver_postclose,
 	.show_fdinfo = i915_drm_client_fdinfo,
 
+	.get_reset = i915_gem_get_reset,
+
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = i915_gem_prime_import,
-- 
2.41.0

