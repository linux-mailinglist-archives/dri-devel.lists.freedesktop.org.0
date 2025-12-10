Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E8CB3256
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 15:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF7810E74B;
	Wed, 10 Dec 2025 14:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="SMDBwmOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5355210E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 14:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765377057; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nB007A6yfb7kFqKIbwfPGElgHe9eaMAdIfe1PbM/hOH2p5AulcQ5n8zJXRkH6f9SBIwVtCKCtvSL4+JpCaX7Fzc80EJXTusXdHnCmef5xqocGU5T4zmtWkFFmsqyx4wgJACaSd2dpjox2CuGvpydJCfOl3q6264KnDor3FgWlrE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765377057;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LwVZ+VtALnH6wfKlHfuVOKsP1Ts6+08k1gucGtQpqFk=; 
 b=jDdoTP4mzgoaPl0ZHNG5zy3VmBrij0htWjhz/O0XKsdhWvYaSyE9XrPFUDwBxjwm4Pw3+NNrfVyglHu0SJGRTjjc6xXxo8LsetgS/kWHMyW2fR+It2fOum7Ua3b767UvLzFkI7JNtu4HRwvRNtw66xg3Wldrtu7VLmjSy6ATKys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765377057; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=LwVZ+VtALnH6wfKlHfuVOKsP1Ts6+08k1gucGtQpqFk=;
 b=SMDBwmOz+NePvxiT7FbE5ZlAhSPT1HRw5Eip4sZPUfJYH5rKAYgCtPfF/eJNgYAg
 eETV8I5m9UANd3a7NXzVDFMsZ3sjbgIQLPZ+dHMXQ+2kB2Q3M72EwTwNG3LIJ0uo4qm
 hj2Aq8BpJrs3PczCeDgfmG4qEfO4+gHpluQh2oqQ=
Received: by mx.zohomail.com with SMTPS id 176537705463225.457251165214757;
 Wed, 10 Dec 2025 06:30:54 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 10 Dec 2025 15:30:38 +0100
Subject: [PATCH v2 2/4] drm/panthor: Add SHADER_PWRFEATURES register definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-panthor-tracepoints-v2-2-ace2e29bad0f@collabora.com>
References: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
In-Reply-To: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

Available starting with Mali v12, the SHADER_PWRFEATURES register is a
32-bit register that contains a single bit so far. This bit flag
indicates whether the RT cores should be powered up or not.

The name "SHADER_PWRFEATURES" (as opposed to "SHADER_POWER_FEATURES") is
taken directly from official hardware documentation.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 08bf06c452d6..4c79cec8dc21 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -96,6 +96,8 @@
 #define L2_READY					0x160
 
 #define SHADER_PWRON					0x180
+#define SHADER_PWRFEATURES				0x188
+#define   SHADER_PWRFEATURES_RT				BIT(0)
 #define TILER_PWRON					0x190
 #define L2_PWRON					0x1A0
 

-- 
2.52.0

