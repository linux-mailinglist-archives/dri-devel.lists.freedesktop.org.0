Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1884970A4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 10:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9357710EF03;
	Sun, 23 Jan 2022 09:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886EC10EF08
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 09:05:53 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id t1so16042007qkt.11
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 01:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eX3+DBLJl7kPGzkIiPqLhVq9cTOZ0N88Avq3dcptuxU=;
 b=btmtA6Grf+PXkdfiNHYWykZ3RTKbJes6CDtpN2wUTw+raLCpy1PI/WGx1QbXYe5YZN
 2Aef5zrFSy7BX6ykz1tQXpqVS3EoUaS5Mbm6vru5TLHAOt7/S1qARMCLv6H7eyoDSh9c
 tZSTeyJYCW8J1gjUgLbWrDRuDzUkvBJT4W/fQcjJntnroAxIrHyo+U2Rugg+bpqQ+Obt
 bdkvZJQzj26DpyZ9cNsZUvdA3kU6UAuEvOA0Laa9M+7/VPrMw+BA1J8F3iKHwTpIaZ82
 OyarFOi4fGvmZB6MaNCBLuCTeibKZa9P/kjLyMrIruqKJ1e8gpiqOIPvKARh6+i7wFPv
 NpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eX3+DBLJl7kPGzkIiPqLhVq9cTOZ0N88Avq3dcptuxU=;
 b=64QLbsFx73pebPuUtxQ3Y5fr5bDDxtO7FpwXXuYEjG3iHWDl7Sq3/6ZX81B4g/HyvW
 Z6B3PASvPbKBIyk+h9oof7y7CFyxVs6cbQxlT0VQe5no6Z6md+2NWQKHibAEUGGi/Yxu
 8V1m2Wi3rzObQSqsQcu2IIoaZvOu05g9y2UrZ8m8mr5owxHk4rd+hz9MTf+wwrt2Pj3c
 5wIvy92aBPc+/sqf9VWamNYBAkjAxEqVhD3aEip+cZzkCos/Z2QYrXnkmr4LcZFN5hkn
 a8RQaOKFmd9R8Z23+kAew4VEPKBL0FT/9oxn3vFQVxh/5lERM3N7tkPphkWfrU27cXn7
 6Nbw==
X-Gm-Message-State: AOAM533YKSgrGtY5gsZMiaoHgRMdZJilbyStAEqM91tfzLpjv+z4PBKp
 WuP9CdP9NWKZ9//ardJuMjw=
X-Google-Smtp-Source: ABdhPJzY2JqV02cUZ1vxb0vczI+ycvCGtFWFwVcB4D0aRymmcH5Ck2jcJ5vsH2fj06H+x1FSMM5Y7A==
X-Received: by 2002:a05:620a:1663:: with SMTP id
 d3mr7803665qko.199.1642928752563; 
 Sun, 23 Jan 2022 01:05:52 -0800 (PST)
Received: from tong-desktop.local
 (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
 by smtp.googlemail.com with ESMTPSA id y2sm5558080qke.33.2022.01.23.01.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:05:52 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/privacy-screen: honor acpi=off in
 detect_thinkpad_privacy_screen
Date: Sun, 23 Jan 2022 01:05:48 -0800
Message-Id: <20220123090548.763170-1-ztong0001@gmail.com>
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
we sould honor acpi=off in detect_thinkpad_privacy_screen().

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
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

