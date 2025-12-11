Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61ECB6707
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808F210E2DB;
	Thu, 11 Dec 2025 16:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="OPLZycxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F082010E2DB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765469765; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GAjEVfyahUksOB4ZH429xuPtTXkYH3hsjAbVHr5t++/Z50/2MjVcZ/N2squGlcTHoDZWvciFm3I5tJDL/63OX41VYzzwCsBPIVWLclPtbcHL5iY8mQbSjmeWRfVv6xOjpDkQpJCVpthFKCEVCgWnLykpwr5OKhgDpyRX6UoSFSE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765469765;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ljTiiC8Aaa7q3v3glKNPBgbqYkCecupLLIv7VFlF1TM=; 
 b=me8X3Nej9ducNyHWGlfleXlMzKQ+4om5tc28b/lunj/2mW2m3AOiDwr/+xx44qCbbr4UvNAeYP7FuK4Z/EojmO4j2AIUYkKiJHWdOCl/u6/JQcfyn7A7mJcqMgnIG8cQ8k2uZwdpTNg9FxPfliv9V9Ol0VVbkbk6rkfo1DRtXm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765469765; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ljTiiC8Aaa7q3v3glKNPBgbqYkCecupLLIv7VFlF1TM=;
 b=OPLZycxGBt6mW9T8Zy60bilzJ5MYxPqlsjHRf4LzCbrJM7bBW+wa3JTK6JkzXMm6
 uatodnMYdpp2mWejEMHIhxt64QKMa8S99iGLXUGYU81kbm3+/KNvwwj3ZaWkZ2rBUsD
 5OtJQ+TFcCWLFeW5wflI5saib2waqvMLZz8k3lPU=
Received: by mx.zohomail.com with SMTPS id 1765469762576757.2841065750086;
 Thu, 11 Dec 2025 08:16:02 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 17:15:35 +0100
Subject: [PATCH v3 1/3] drm/panthor: Add panthor_*_irq_mask_set helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-panthor-tracepoints-v3-1-924c9d356a5c@collabora.com>
References: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
In-Reply-To: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
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

Add a function to modify an IRQ's mask. If the IRQ is currently active,
it will write to the register, otherwise it will only set the struct
member.

There's no locking done to guarantee exclusion with the other two
functions that touch the IRQ mask, and it should only be called from a
context where the circumstances guarantee no concurrent access is
performed.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f35e52b9546a..894d28b3eb02 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -470,6 +470,13 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 					 panthor_ ## __name ## _irq_threaded_handler,		\
 					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
 					 pirq);							\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_mask_set(struct panthor_irq *pirq, u32 mask)	\
+{												\
+	pirq->mask = mask;									\
+	if (!atomic_read(&pirq->suspended))							\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
 }
 
 extern struct workqueue_struct *panthor_cleanup_wq;

-- 
2.52.0

