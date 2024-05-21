Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6718CB072
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7D010E048;
	Tue, 21 May 2024 14:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jEPMhGVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CB110E048
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:29:02 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6f0fbd2d9ebso2679539a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716301742; x=1716906542;
 darn=lists.freedesktop.org; 
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=TwldfdL+T6NcWAidI3T3bL1Xd+CxsE6EH6dzBTpXKgU=;
 b=jEPMhGVNAPQYmJYGVJMn/jSmddfeVDYCyHycPgE6oY6xPXelE3YBr4DdkCYEw9AQNA
 2A/ZxbS4BcjsBCP87EGLoTznJPXKG0FiDDjic7yHzZqEgi+ihyH0Bb7gsxgkfMAVCs1P
 sZgTTQBJYgRCIQd8jxZYmEKsqRevU29YEg209hLVDOlffqKA/TY16W/e2W2QqlPMdPfJ
 tj8cSb9fCjFYqkSwpgoBoe5Hf2mgcbRoe7UWZ8hM4WZuL8aAzgTz/SYgpNlk+hbGZFx0
 /craCae+CapukMB7r6KweHgx7gRREMGlwYL5RLukvbtgNpRYGGeZs9QPowtrpLp3k+JO
 zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716301742; x=1716906542;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TwldfdL+T6NcWAidI3T3bL1Xd+CxsE6EH6dzBTpXKgU=;
 b=h+rylnTjAXnDGhLG+WDqNi1yVzMW1NB1bBw8Of74v7nb63DHy3RJhe9tupxtZgZwsY
 atltALdhCT84dF8rTJDhiWP/rMgR0CuG2uyWVXlxUfCEQkM+SaBdcviAW9P5YZqH+8bs
 egZ4baZEW3fLs2pl9/i/3JYzc6bSSAQXmBb58liwnDWNsDzl6U4Ac8m9UK7ZCHYJyQ8E
 0PMrS4qI0WsilQal3hfkDAssdTNz//eFeRECdluYW9GOX6KRV9SyfV8Rr+Dkc6miLJ/L
 N6UXjnR+2ErQtwZ9LI/l8Oss+21wJ1tY8tngSdGQ0th2wR+fsnsNS1uzdRgo1zYz5Y2s
 ZxxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz4MhNy5vXkLbqA/4uMk8f0zyEUMaMuH9PziFDDjhch2l5MRa2KbjigCHciBBXB3zPayoBL8WHh3EJ16lDBE5ssedZ5DGs0xCDYzdljvNv
X-Gm-Message-State: AOJu0YyU0Id6NZwdx/P6v2PO5oE07qypUX9xdIZcz7HxckSVOJWMIgA3
 ame1OP1BLcr2LVxeC8xk8Q70FXVSs5AMN4XaobtcJE2TTBfBMskRMuMSJ5n4qAM=
X-Google-Smtp-Source: AGHT+IF+toXA1Nu3KEKk8hdXyTF86rbz9YOAD8q6l99vrilAUb3JIDxN2FfEB1nAafTrGIeh+79vhw==
X-Received: by 2002:a05:6358:8a8:b0:186:12e6:42b4 with SMTP id
 e5c5f4694b2df-193bcfc56a2mr3916016555d.23.1716301741198; 
 Tue, 21 May 2024 07:29:01 -0700 (PDT)
Received: from localhost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f6af98d9edsm3937397b3a.156.2024.05.21.07.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 07:29:00 -0700 (PDT)
Subject: [PATCH] drm: xlnx: zynqmp_disp: Fix WARN_ON build warning
Date: Tue, 21 May 2024 07:28:15 -0700
Message-ID: <20240521142814.32145-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: tomi.valkeinen@ideasonboard.com
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Without this I get warnings along the lines of

    drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
      949 |         if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
          |                     ^            ~~
    arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
       54 |         int __ret_warn_on = !!(x);                      \
          |                                ^
    drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses after the '!' to evaluate the comparison first
    drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses around left hand side expression to silence this warning

which get promoted to errors in my test builds.  Adding the suggested
parens elides those warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405080553.tfH9EmS8-lkp@intel.com/
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I couldn't find a patch for this in Linus' tree or on the lists, sorry
if someone's already fixed it.  No rush on my end, I'll just stash this
in a local branch for the tester.
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 13157da0089e..d37b4a9c99ea 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -981,7 +981,7 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 	unsigned int i;
 	u32 *formats;
 
-	if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
+	if (WARN_ON((!layer->mode) == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
 		*num_formats = 0;
 		return NULL;
 	}
-- 
2.45.0

