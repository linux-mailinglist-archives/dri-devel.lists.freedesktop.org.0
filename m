Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567AE94ADB8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 18:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF6F10E186;
	Wed,  7 Aug 2024 16:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="RjUJLLj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CF510E181
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 16:10:02 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723046993; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kHVV3rIPzmwA2HcpXjLPE26bMMKmuDLza/WXLbdHteIx7sN103/Iy8YKnH76LPLiEgBNVwFPwH3tyVwM4Riv12sUxRxo6c+/BKV5JRX26vUjGjd9XO+f82PK80en2z5WPlQZ2AWF16q/pFMGXkrwuc7sqV3zoHLAzfiZe2w7LYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723046993;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=J29M+xTzHtWGYHNY/aAB6XIac64gox5At2FLEcBydXI=; 
 b=DRs4rbvmSG8J9ugP/4hHMPH6LmvLL8puLvyjQeGX4J4w7b7lkbgtqjHqVdxZFwfZcc5j6iQdNXyOPikdXc80EjS9B058MXTccohLUZM24zy7VGgsp/YksyjQKGQTiInSvR1R2XznIfEDd5OEa1NGbmP4JnSou2c0EMTyLdj2uBU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723046993; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=J29M+xTzHtWGYHNY/aAB6XIac64gox5At2FLEcBydXI=;
 b=RjUJLLj9mzJAKaTlej65pd3DNRRN8diYNYhdgCK/IdxRkpDq5FyzLJvHSvruir6M
 g0lTWw3LWLJjmCudRovwSlTwAel/x4smjjrywoMuFETf1330Hw5fhhmynOJJ1iKKw2j
 qg0cmfC5lk4BJSvR+jDJ4+xW19dw4HSScTYnFJeg=
Received: by mx.zohomail.com with SMTPS id 1723046992518427.5667049103944;
 Wed, 7 Aug 2024 09:09:52 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/panfrost: Add cycle counter job requirement
Date: Wed,  7 Aug 2024 18:08:58 +0200
Message-ID: <20240807160900.149154-3-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807160900.149154-1-mary.guillemard@collabora.com>
References: <20240807160900.149154-1-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Extend the uAPI with a new job requirement flag for cycle
counters. This requirement is used by userland to indicate that a job
requires cycle counters or system timestamp to be propagated. (for use
with write value timestamp jobs)

We cannot enable cycle counters unconditionally as this would result in
an increase of GPU power consumption. As a result, they should be left
off unless required by the application.

This new uAPI will be used in Mesa to implement timestamp queries and
VK_KHR_shader_clock.

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 include/uapi/drm/panfrost_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 52b050e2b660..568724be6628 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -40,6 +40,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
 
 #define PANFROST_JD_REQ_FS (1 << 0)
+#define PANFROST_JD_REQ_CYCLE_COUNT (1 << 1)
 /**
  * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
  * engine.
-- 
2.45.2

