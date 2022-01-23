Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7344970AA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 10:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEB210E586;
	Sun, 23 Jan 2022 09:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE0010E586
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 09:11:03 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id i19so1439541qvx.12
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 01:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bl3efp74ab4pQlhH6DVOKc+JdDnTDiX+IOOPZRvKFIk=;
 b=ARUGGp+cvzIrVwH8Dm9kcolQ5ADQqS9hkzPW2oU/pvWuhoSxM/q+3AwrAeJ84YpQhJ
 5ZhsIcShNnEkSJNMFsmOMMbtVITZdiRQP9QHx7G6IHtKcHdJEAggLTGWyQ+DgjxwpVZi
 +54QUmZ5MbQS+9QIAYpovzahcH2ewcRB9ki0m+sDijroUtEdAzackUaZmmiqZyeNDyGA
 E4fgcq0GyqKkeqm8d6Jrcq/h/HJmfxyg2VCSPbXDs+L+wOIDhP/JpI7difpGQHbau9HJ
 UQdz6DTVHWH8EAf0PVoPQO3hJfPhJyc0JRlbt9C9aTF8eu2gVyZbh6vXaNcsdOceFQa+
 47Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bl3efp74ab4pQlhH6DVOKc+JdDnTDiX+IOOPZRvKFIk=;
 b=6LvyPx3bgrOIZPktFShfwcn0Mh4WF4P9IFFuhKkCwImyVz7B/kOallUN+7PaDakJOb
 xfY5S9DGabJ7HZTEJhm5XYtoxMqKTGAJ3/vAVKOSHReQLvlYpQAF3B2BHh85yQ82FlB6
 lXBDnRSJ/p9H+2csfaKpzoaNLtKiatxIBO+lCZ4vzTKcCFdA3/ITCgfVOuyvMu1Sssj4
 YUaDs07Tdlhbr71RLACWUgGSOyo1za2eKAyoUcInW/9fQiNG9ZjqU+ocA0Vx24Z58cGh
 LAtUe4PXRZNvswGlVm7Hj2YnETv1Ochhg7pz4L9WOgqTIsh3XGQOO4UvEX1KFZCo/VEQ
 gtZQ==
X-Gm-Message-State: AOAM533R58ffTJg5at7D22aUyCim2n+n93saz795ulPBF5zPfC+A1fdv
 HcCF/oFnH74mIBryjF7XMk8=
X-Google-Smtp-Source: ABdhPJzpO7Zzbcg01kfGn5FLWvm4y0zy0xN+rM7LtfVAM1UaB6ZlAdZ8qZNpdEmOBJYjasgcxGuM8A==
X-Received: by 2002:a05:6214:260d:: with SMTP id
 gu13mr10100714qvb.100.1642929062764; 
 Sun, 23 Jan 2022 01:11:02 -0800 (PST)
Received: from tong-desktop.local
 (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
 by smtp.googlemail.com with ESMTPSA id o126sm5479158qke.53.2022.01.23.01.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:11:02 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/privacy-screen: honor acpi=off in
 detect_thinkpad_privacy_screen
Date: Sun, 23 Jan 2022 01:10:04 -0800
Message-Id: <20220123091004.763775-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tong Zhang <ztong0001@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when acpi=off is provided in bootarg, kernel crash with

[    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
[    1.258308] Call Trace:
[    1.258490]  ? acpi_walk_namespace+0x147/0x147
[    1.258770]  acpi_get_devices+0xe4/0x137
[    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
[    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
[    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]

The reason is that acpi_walk_namespace expects acpi related stuff
initialized but in fact it wouldn't when acpi is set to off. In this case
we should honor acpi=off in detect_thinkpad_privacy_screen().

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
v2: fix typo in previous commit -- my keyboard is eating letters 

 drivers/gpu/drm/drm_privacy_screen_x86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
index a2cafb294ca6..e7aa74ad0b24 100644
--- a/drivers/gpu/drm/drm_privacy_screen_x86.c
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -33,6 +33,9 @@ static bool __init detect_thinkpad_privacy_screen(void)
 	unsigned long long output;
 	acpi_status status;
 
+	if (acpi_disabled)
+		return false;
+
 	/* Get embedded-controller handle */
 	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
 	if (ACPI_FAILURE(status) || !ec_handle)
-- 
2.25.1

