Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0ECA6FED
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8810EA9B;
	Fri,  5 Dec 2025 09:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFeB7Zec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744710EA9B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:51:07 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29d7b019e0eso22420555ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764928267; x=1765533067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=AFeB7ZecR2oTB4hI6FnL/TcdxFgykyhyu4lpG92uoEvaJ5Jpq6yzL0Hy175L+xQDoU
 jbh+41e0FEvtTwlTTJ12xfYQMZBRKW1F67xduDFu4bJvAskaH05G63U6nyQFvo6mTFP4
 27io4/j3AQY7l+6qd6eCWueu5XhiEawKYZazK8U4o5ON+l5vQU0YAzzd7ycxPf9T7oKS
 gt2puGanWSvQ8DToDBBz8BwM5Uc+JkeiqEyBq5AevLq1Os8AcFX1u/+TqKwyHux2ZEro
 zeNq21L10lZn9y8O/g3NjucdmGyB4EyM5452hClvcBX/ikLgvoSqLCbiyFiqRER0S8Zd
 TQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764928267; x=1765533067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=lFCnvmppDtU7mUDSFeTcYVNetRwND4OKxudmSNtZqGlNPkJlsOyc2fe4+T0uMgQ7IY
 C0DS2+dnXcjlXrz5p15ba3bJyNB1XbnAzCZCITroEKDx8v//ZnoVwnJm+vs14RmLcHQH
 a44E8b35i9//swoke2sgIfxzDLhhiGOoRxcK96C96zuCDVRuVR8a8tWNfqTI/NvB9+p/
 GmmwwWY5NuSEqnH8S4e+puKxLpC8BZKHja+p/5fpz+HmKK71rGLkeh3ry2AoyRcLhFE3
 GmwpRbrFAcR2+0PJnH8JhpEPE3DyxiU0CDrMaaCc0DZhOLABMLrPmv8wUKuFJH/UPdF0
 WN/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyaAtC47n/IelnwVUCMVdZqNPyElwgPWm2PAV+9gPmVfAaxpW3vatkY5+4YeoD6PgvzQycFLB+cqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYE0u8joHrCrzMhoGIHDhgJalqlp7zVa+8cI9hVtYaFgOv6PvV
 tJoxhh6s536JlpwHVYPYcnfp87x7RaxOLs7OGsMDvaLZvQZvyqgBnnyF
X-Gm-Gg: ASbGncsNscNrDNzSw0oK2f8Y0hj1rZ+8RCJUlVnZ6f07Zhx1E1a9sN3BuNfWf9e616B
 /EjODdQx0eC7aNJQO9Bo9bbWPxijhu5rLkCSLDllmQVOw/VX1z7hwGKL5aKfuUlaZr39g0aF5s1
 IUeA24aJt8ycIHP9QlB3UhXg0J2EjW84XYx99RSAXVj2gfwaCJepYbNqDF4aIm/P2KKO0qlX1+m
 SQiO2OMAgoJ8M6peeNHLDBLnv2+M+BK9ToJoWWLI0DXv8ukym0vmwJuD+71tw5r05ZxbSx09Oau
 V3deX2LI0U5zSMPjMvU48/dB0Ve5w6t8PdEY15v1ggutHi7eaDN80dWh3RC+eG6GR2BorZBYD0Q
 oXIKRo70fbfWNjwkvi+7gbElrg8dOZkONfDnyNKKrTeBYZROshQn4+ltWGdy4a8w78dMUyzLUUH
 9vCtz9rpn3vf/g04AY
X-Google-Smtp-Source: AGHT+IE6UDzJ4K0qWbbZExV4Pib6HqpqfH478ATbU2gNSVjEFAMSvfaiCsZ7zaEbNCvotPtH/SqWgg==
X-Received: by 2002:a17:903:3d0e:b0:299:dea1:e791 with SMTP id
 d9443c01a7336-29d6833c4c5mr110080585ad.12.1764928267448; 
 Fri, 05 Dec 2025 01:51:07 -0800 (PST)
Received: from archlinux ([205.254.184.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae4cf863sm44562235ad.38.2025.12.05.01.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 01:51:07 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm: xe: Replace sprintf() with sysfs_emit()
Date: Fri,  5 Dec 2025 15:21:00 +0530
Message-ID: <20251205095100.355503-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Replace sprintf() calls with sysfs_emit() to follow current kernel
coding standards.

sysfs_emit() is the preferred method for formatting sysfs output as it
provides better bounds checking and is more secure.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..f016459c9904 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -425,7 +425,7 @@ static ssize_t event_attr_show(struct device *dev,
 	struct perf_pmu_events_attr *pmu_attr =
 		container_of(attr, struct perf_pmu_events_attr, attr);
 
-	return sprintf(buf, "event=%#04llx\n", pmu_attr->id);
+	return sysfs_emit(buf, "event=%#04llx\n", pmu_attr->id);
 }
 
 #define XE_EVENT_ATTR(name_, v_, id_)					\
-- 
2.52.0

