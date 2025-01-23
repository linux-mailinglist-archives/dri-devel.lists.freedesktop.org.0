Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F9A1ACDE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 23:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6EE10E8BD;
	Thu, 23 Jan 2025 22:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="CSwFRLle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A2110E3F8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 22:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737672836; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RrvFipjO8WRJ5qrEobVXcCt1+poXZM1VauP7CH5IckhWlIVZg/dEBhmtDgYeWztQf0+qrWEjTr7crQfGcXwu3ZzpjPvyxV2CM8b43mEjMAl4kNxh4FciZnV7N/09d08lTy4f3D4Me6r9o0k01e3q21AUKfGKCl2lgdwFV4WKZdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737672836;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=P7YSgOBT4ZEydHi6CBZLDANUBg1ODh9pUPQasV9rKe4=; 
 b=P3sq+tp8W1iD38Z9QHugqyH1NGY4Z/lwF/83DVG2zK9pHrNMmZVYPgi3z8I8v49jok2ozFM6XTXRs4cNJwuCGQzEgGa5J/Qlal15TiTBSvcKv3ANAOmNbKDxnTDt46KLobJOuO5zY+BEt0tyyujqQRQMkfB+C/DO097SOwagnT4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737672836; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=P7YSgOBT4ZEydHi6CBZLDANUBg1ODh9pUPQasV9rKe4=;
 b=CSwFRLleudBtmmIgvIWZZjmpY2QRGEP9OFbfHIJIbhGbNVquYk8sFPt01KVQD/zl
 lvvB7tGA3F/6gwFx0eZVycSRHuonUO128n+l1V76YnvGhgG2lmnVhuPo2zgdcCf5vfj
 78S8FN6IkD9rN4cEnJrLj0Y9SoB1iX/Wb+UX6qhc=
Received: by mx.zohomail.com with SMTPS id 1737672830663713.3510044597829;
 Thu, 23 Jan 2025 14:53:50 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v9 1/5] Documentation/gpu: Clarify format of driver-specific
 fidnfo keys
Date: Thu, 23 Jan 2025 22:52:58 +0000
Message-ID: <20250123225325.3271764-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change reflects de facto usage by amdgpu, as exemplified by commit
d6530c33a978 ("drm/amdgpu: expose more memory stats in fdinfo").

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 Documentation/gpu/drm-usage-stats.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 2717cb2a597e..2b5393ed7692 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -21,7 +21,10 @@ File format specification
 
 - File shall contain one key value pair per one line of text.
 - Colon character (`:`) must be used to delimit keys and values.
-- All keys shall be prefixed with `drm-`.
+- All standardised keys shall be prefixed with `drm-`.
+- Driver-specific keys shall be prefixed with `driver_name-`, where
+  driver_name should ideally be the same as the `name` field in
+  `struct drm_driver`, although this is not mandatory.
 - Whitespace between the delimiter and first non-whitespace character shall be
   ignored when parsing.
 - Keys are not allowed to contain whitespace characters.
-- 
2.47.1

