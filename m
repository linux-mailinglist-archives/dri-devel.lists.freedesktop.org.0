Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470E93E523
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 14:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE010E165;
	Sun, 28 Jul 2024 12:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lb2xaTKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1613310E165
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 12:47:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so3404674a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722170868; x=1722775668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPVGTGuK2/ZvoBHgwOxrrL/epZwrZeql038/zY8F5Uw=;
 b=lb2xaTKnf3D/PDP2RooyN9uA8cWJ6BVeoqq7s/VwmKJ/t3oLTSwKb4o/yq0Z9PJdar
 m9HN/PexlWXtxMkPlhYAndkMYQhHev6fyLDA0IoGcOOZLf7tQu7DauPO7+Osrn+u8tku
 z4clSznH5Q7zIAkpMBmXLQAmBRJN9luSauEy0wdVJCcvQzjyk1T1uf+/PVEbBebbnGY2
 FqshUGTCQ8KLhfhsf8Ea5jFea2f7hJDbXAGoiS1EQWiN+xT9qbsyF01hAHTe+S01HSmh
 y+C6yFPBVMJtw4eBgOvUcWBC/0N9gT3eGIkft/hJcvW+0HGYwNFUyKlfP0krrAeIxU6o
 0dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722170868; x=1722775668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPVGTGuK2/ZvoBHgwOxrrL/epZwrZeql038/zY8F5Uw=;
 b=jxcmvraEx1p3rmhzeGPPWiQMeMr4I+vn/PfEtFqy/67UOnO0MxtF2/WsspAnWaNb2j
 1t0HYMM4cYzq1+ddQPPOA2lc9Hkvs3NYhKMqwGngAY0fqdSrw/262bD9pqpEkdMT0BJG
 wcPyCRnclw7m24cAi0T5vJ3Hxj4FisyWbfpDf4NBYS0a1bfZ42XR34xMSzS8mhaxXEc7
 zUwmfg72v6inP0Wfzw6ncVfSxUi+8p+MURB2EU8qWclxTiaN1f7/3sVzIBq/ftaAgv1a
 GGNEnukC/FRcRL0XVmz86sNeeoTJwg99MEh8m+eav1mECDQ5ODngPpiGucVMgmQO+39g
 Nizw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmfqbYmflunTfv0DPCnJs/9uH46lQWudb9I8mwAIcOuP9J0nucFbF9oVpGzian4P3++yAWenccfWP9rhWQ3sa6m6mE2NjvZ1TF0Wa2YbO4
X-Gm-Message-State: AOJu0YzrIaPDrgJJbk9leGZ6/g8vOBikfWIrzHpWlGidGmScFQJ94M6P
 gP5+bgooIFQc8AGXzeczB/VEo+Bqgn5QGd5AFg/4DIJDjiR29H36
X-Google-Smtp-Source: AGHT+IEgFpT12RM1VUvndjc/bes+AYGvqugA9b2iz8T7vCrVIESZJ353xthOLr7iIs0PW5VsXdj3xg==
X-Received: by 2002:a17:906:bc24:b0:a7a:1c7b:dc17 with SMTP id
 a640c23a62f3a-a7d3fa0ab43mr461386366b.22.1722170868461; 
 Sun, 28 Jul 2024 05:47:48 -0700 (PDT)
Received: from Slimbook.lan (134-248-201-31.ftth.glasoperator.nl.
 [31.201.248.134]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9d3cbsm381125166b.182.2024.07.28.05.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 05:47:48 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	hdegoede@redhat.com
Cc: mripard@kernel.org, luke@ljones.dev, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
Subject: [PATCH RESEND 1/2] drm: panel-orientation-quirks: Add quirk for Ayn
 Loki Zero
Date: Sun, 28 Jul 2024 14:47:30 +0200
Message-ID: <20240728124731.168452-2-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240728124731.168452-1-boukehaarsma23@gmail.com>
References: <20240728124731.168452-1-boukehaarsma23@gmail.com>
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

Add quirk orientation for the Ayn Loki Zero.

This also has been tested/used by the JELOS team.

Signed-off-by: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c16c7678237e..a1dfeaae644d 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -208,6 +208,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
 		},
 		.driver_data = (void *)&lcd1600x2560_rightside_up,
+	}, {	/* AYN Loki Zero */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Zero"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.45.2

