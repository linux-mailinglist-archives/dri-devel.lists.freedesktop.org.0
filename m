Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4DE89EB7A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BAB1131FC;
	Wed, 10 Apr 2024 07:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=netflix.com header.i=@netflix.com header.b="lLKaljID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C0310E28B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 04:34:46 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-36a1140bd21so16687255ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 21:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netflix.com; s=google; t=1712723685; x=1713328485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a/JPFUxV2ArWkhwNnn1v7zuWOs9XoBJjsryMcg9Mcoo=;
 b=lLKaljIDk9OkiyVqqIs2eKQk6F1VyxX8qixJiln01CrrjMAzun1SL1tDBnmcEsactF
 /BIXZzme7douP7BtXndvjyucb4R21nXwjdzyGZahxLZtHyBBZQdehShkpggiWimIGKOg
 vpJHVwGiVj05CTuJ7N5XGGqhyN3vgEFmDHvbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712723685; x=1713328485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a/JPFUxV2ArWkhwNnn1v7zuWOs9XoBJjsryMcg9Mcoo=;
 b=fak5oQvdBNrS6oNhwiCOAjdGCI29yBlJOO3MbchLSFcF/Co0C9IO+XhwaPfobyXfhC
 MfbG6rSEPp377yN9A+SNYcOcrHD4hddsK4boCqjovZ/kSKLvLj82ybuOxB+3Bn7rwB5q
 iCKOX9mAKhVXcF8obBMlGHD8yj4wOOlmHplVvLEb72I7t7Fl+PfyaQHvos20wq0rHbf4
 +YDOErQiGt5UDYGvn5sw8cPeyUHLuFZcZdSX0npFMOJYR1mSJmzPmhNBGCyqutEl8s/E
 LvmkJD7LG/TX8QLe0mvsLa0E3Qi0xy94pgGUt9kOXo0tCLzH10RYx6a+R6wvbZ+gWtpl
 q+ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3N0/QdgtIJcV3EbRByR5/7puuN8EhDndjKB2QshSXy7OLCu3s1fRpiQmXt6CTmdmFFkZ1ASt169rqCa4+mjA7wI42MUk/cxP1Ld4R6Sos
X-Gm-Message-State: AOJu0YxjcKDymZ8LGBdByv1R4OkTYU0jNaLK+qUkf5iZi2/Ud04N4ebQ
 8kDHuOQHDzqPey+yusxDocDl8pPNS7uxa0JaJaPpXu7eqJCYYeq4vk3NFeN1a+Y=
X-Google-Smtp-Source: AGHT+IFILeN96Xd9wtsGDWKumJLAOJAbRVY+isMe2Tofq8xMm3T+C68RphVpIWdR/vNbrvujRnChCQ==
X-Received: by 2002:a05:6e02:1607:b0:369:ed5b:dd56 with SMTP id
 t7-20020a056e02160700b00369ed5bdd56mr2350659ilu.17.1712723685172; 
 Tue, 09 Apr 2024 21:34:45 -0700 (PDT)
Received: from localhost ([2601:285:8700:8f20:fa81:e682:614d:196f])
 by smtp.gmail.com with UTF8SMTPSA id
 hb2-20020a0566386c0200b0048290482c7bsm2023528jab.54.2024.04.09.21.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 21:34:44 -0700 (PDT)
From: Jose Fernandez <josef@netflix.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <wenjing.liu@amd.com>,
 Alan Liu <haoping.liu@amd.com>, George Shen <george.shen@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>, Nasir Osman <nasir.osman@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Leo Ma <hanghong.ma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Jose Fernandez <josef@netflix.com>
Subject: [PATCH] drm/amd/display: Fix division by zero in setup_dsc_config
Date: Tue,  9 Apr 2024 22:34:33 -0600
Message-Id: <20240410043433.12854-1-josef@netflix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Apr 2024 07:10:24 +0000
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

When slice_height is 0, the division by slice_height in the calculation
of the number of slices will cause a division by zero driver crash. This
leaves the kernel in a state that requires a reboot. This patch adds a
check to avoid the division by zero.

The stack trace below is for the 6.8.4 Kernel. I reproduced the issue on
a Z16 Gen 2 Lenovo Thinkpad with a Apple Studio Display monitor
connected via Thunderbolt. The amdgpu driver crashed with this exception
when I rebooted the system with the monitor connected.

kernel: ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447)
kernel: ? do_trap (arch/x86/kernel/traps.c:113 arch/x86/kernel/traps.c:154)
kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
kernel: ? do_error_trap (./arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:175)
kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
kernel: ? exc_divide_error (arch/x86/kernel/traps.c:194 (discriminator 2))
kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
kernel: ? asm_exc_divide_error (./arch/x86/include/asm/idtentry.h:548)
kernel: ? setup_dsc_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1053) amdgpu
kernel: dc_dsc_compute_config (drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:1109) amdgpu

After applying this patch, the driver no longer crashes when the monitor
is connected and the system is rebooted. I believe this is the same
issue reported for 3113.

Signed-off-by: Jose Fernandez <josef@netflix.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3113
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index ac41f9c0a283..597d5425d6cb 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -1055,7 +1055,12 @@ static bool setup_dsc_config(
 	if (!is_dsc_possible)
 		goto done;
 
-	dsc_cfg->num_slices_v = pic_height/slice_height;
+	if (slice_height > 0)
+		dsc_cfg->num_slices_v = pic_height/slice_height;
+	else {
+		is_dsc_possible = false;
+		goto done;
+	}
 
 	if (target_bandwidth_kbps > 0) {
 		is_dsc_possible = decide_dsc_target_bpp_x16(
-- 
2.44.0

