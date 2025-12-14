Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBACBB7F0
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 09:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1ED610E045;
	Sun, 14 Dec 2025 08:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FInnLV+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABB010E1B2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 08:37:08 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a07fac8aa1so14049345ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 00:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765701428; x=1766306228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=FInnLV+OMr9zSt2jgKg4cheDiH/mCGqCWsVw7LUgbxMcgWiR7i8e0zpWNVHi+yY3vb
 pn0xHfsC3SX/CNehZfVVk5o8WJeS8oozGShR72+/pfZqOYwcxMCc69zCupt5VrWSp/O/
 9/PO2stA58pYbgVlUK0T3Nkr5Bwi+/4YmZzzI7kOhj14R2QtUAuuBzGxvowzolsKhUUi
 VeSpodiKtfhLe92gugxSbnBVVjaP7mOHfpmQsh4BFfgV4uqs9EhVZPcY4BevZWS3EYX9
 daYlpHnLQkfVs8WkX2TnU3HomdSA27cWc919cuDbKIC8po5OYby+ApuQreswt2ThZhVK
 TOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765701428; x=1766306228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=lwTIjfKt0TrIgdraDtT9KQHDhnCLBpjyckxA3dmtuR+TgZNAqA1AHh1Y2YcU51Cv4W
 vEKiN0YS6W2eY6wHKcrv0XSVqEu9DuzmxsPUDWsErSD1fXY56Md0FilrptN3FcrdFCm9
 R1d9IVm2XsKqD2A/2lc0AZ17kKBtYVjsQPiXXWSp6sZOOYcK8bWsNuasQOyYrXqEWFlx
 oSrDLblu5rt3El1fxnyPlbg3tRbj9pEsuC0scHdUz+XDVI2fx5lJRmu4i2jAn47SiFsr
 VatVP/PC7BcgBxx9wlMasOwslGQq/97YVzhP8EXFP+LeoU5ZTJjBCua+FHbHe1d1wdgo
 ckIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYN0Z8iKizj1D9feYXCYMHEHk38IaiNommfmDGFPHn5lp7uP3YOZiMT6q8UM4A/xBLgp+egpXWkRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+wdJuDnwfXFv5LxYa7yvKPYZV1L+vFsmLAzBOqIp+FanHRKZ2
 FHFSzRLpNoLL8z1pgyCl/9rgGMFuou2q8vTwzF4MliLXF9JPDdZo7zie
X-Gm-Gg: AY/fxX5oe1TQ+SsO1h3Gt/MHjH89I8jsVUG2pcE5sRzPgMnqn7rpjfnojVcp+wLkcET
 goTiTVQDoNtgGE9SZVaw3teXvMvBYJdT9RGyhLw3F5T5E9aqU5O+31ps2Hf/Pid/gp4ba0XZegb
 dS7uYkEpNpZWpWRxfVZXa0zjPsMLUvFN6grucj+6224ojb0bEQKqWzw/PPYrpWC9kV51txagpl/
 dDZIQXaAJt3ADMH483FO1oNHbejlJ+xnWKz5D5TWrnD1hbZbezcvkprcpreq6+WPGniToaUvhr6
 eKeZN0MutbU4FmoVoajna0z1mCmFdl6qMdXucDA81Qc6Yp3Xp9B0OBluwZR0mJRJa/VYW4vv/1m
 4Gx7+sPqPhSB3SfmIz38M6iPXiTBsmb7XSrRTYnyRwilK7/RFk5LpgzO43SGjc2fkMNLRJqnNk7
 UGhSM1G8AnN3aB
X-Google-Smtp-Source: AGHT+IEEYTb86N3Tgh0fbglFIuVjiuLsWOpx7kNxjyqwevTEnja/cXyx327cwjodPgKKjLz6PEe4YQ==
X-Received: by 2002:a17:902:dac8:b0:2a0:34ee:3725 with SMTP id
 d9443c01a7336-2a034ee381dmr61482095ad.14.1765701428430; 
 Sun, 14 Dec 2025 00:37:08 -0800 (PST)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea04cd14sm98244455ad.86.2025.12.14.00.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 00:37:08 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH RESEND] drm: xe: Replace sprintf() with sysfs_emit()
Date: Sun, 14 Dec 2025 14:06:59 +0530
Message-ID: <20251214083659.2412218-1-madhurkumar004@gmail.com>
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

