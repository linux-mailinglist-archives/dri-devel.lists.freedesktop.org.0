Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC48AD031
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 17:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F43B112BC4;
	Mon, 22 Apr 2024 15:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=netflix.com header.i=@netflix.com header.b="nslx70Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5C112B82
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:35:57 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7d6a772af5bso164423839f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netflix.com; s=google; t=1713796556; x=1714401356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a/JPFUxV2ArWkhwNnn1v7zuWOs9XoBJjsryMcg9Mcoo=;
 b=nslx70KarQ4HhxXGyp2t1E6v16EEd5ZT54unFmRWNKHae6THD8Z6h501lFS4+Dkprv
 8KbxJw2txgECTG4hd3EVQIOna/x7Bl25AIXxhNsdK18BgHfklXdACCnnwE8uPLHAUQ2k
 XGplYxmFSwBeFH8rys6v6QB6aJORBC6122yI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713796556; x=1714401356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a/JPFUxV2ArWkhwNnn1v7zuWOs9XoBJjsryMcg9Mcoo=;
 b=qJ89NfbW3TL1fc4rb8MFfsLWU9xfBLOFc6Kn9tUCQbL44adHJpKuMiBmU82N4xdhpk
 CbWIEBX5fe328nUT720sRfphXmrmnyURHuxE3KdKc6F4e8jZKM74zIPIGNgCwrrF+rHd
 Agz5RejLC6Wn6mh/lhuMVKX4vG4yBKpmodyjnWghE3iLtn8ukFARs1aZ8lgoCXA5RUGe
 GkCekqNFc3HJo+F+mLGo8N9srFVfs762YxH8MesZkmBrHMMz1rTn6OYv3QF1s+xONQn4
 NwOcF4y1XRPbr/hkjR4jAMTvA4OwqGOS+iTSI9+zHk5s3nYyv/F8sStsL4Rp2iqJ5TZ6
 GW/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYyiRedAczeuSLRK67Z4R5MrhbQQfFDSgo5sow69Vy7YIxC4+dHwHiwwqf0fopvuZtLbXQj1aCSNcOvOUWqWkLsztwUTkcHPHM+jN5YQI8
X-Gm-Message-State: AOJu0YzlnOWb6h5IGBF7As2TjF67RuTt9KplL06jIZ7vJ3pcgqECkszb
 R8/aA10navyqXW/ll4Bh+eHHS7QFTcUqhYJPDxul82gREMl4k/kPvPpDJ9blPjU=
X-Google-Smtp-Source: AGHT+IGDHc8HUrs0iww/TdL2zMyyadTokjPSQhWtaZ8TbB4GbBiQ8FO8zM77jN0fCSdoCB79InX/Ew==
X-Received: by 2002:a05:6602:1b92:b0:7cb:ffe6:b320 with SMTP id
 dq18-20020a0566021b9200b007cbffe6b320mr11608580iob.5.1713796555960; 
 Mon, 22 Apr 2024 07:35:55 -0700 (PDT)
Received: from localhost ([2601:285:8700:8f20:e98c:6f5c:74a4:9a12])
 by smtp.gmail.com with UTF8SMTPSA id
 dv10-20020a056638608a00b00482f7427748sm2849642jab.135.2024.04.22.07.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 07:35:55 -0700 (PDT)
From: Jose Fernandez <josef@netflix.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <wenjing.liu@amd.com>,
 Alan Liu <haoping.liu@amd.com>, George Shen <george.shen@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Leo Ma <hanghong.ma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Jose Fernandez <josef@netflix.com>
Subject: [PATCH RESEND] drm/amd/display: Fix division by zero in
 setup_dsc_config
Date: Mon, 22 Apr 2024 08:35:44 -0600
Message-Id: <20240422143544.20481-1-josef@netflix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Apr 2024 15:05:43 +0000
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

