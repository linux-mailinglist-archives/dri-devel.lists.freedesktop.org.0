Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E96BA8E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 08:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7410E93C;
	Wed, 15 Mar 2023 07:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832D510E93F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 07:18:44 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-176eae36feaso20047894fac.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 00:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678864724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uta/U05GAafaktR9fApAMeVEtX67Kdj3raMR2qMOvbI=;
 b=PJ2X+ScApxHTebPxeX1bpYuOF7q01B1YjghfwtSX9BrJezCARL3fcJzeYPbRNAqq8Q
 7Wm4cm8ceHVNag03pezg+jR1KBV+BtMvS4ujHJcqIhkb3yXOBqhjkYKDv1QXEmyB51li
 VVPGWnAGUhnxQ+uCEao0OIqcJCr/17LOOKoNWgWYw3zLPcwhp+BC9bE97WvFQK2QbH/G
 amtOOyJWhny5O1eaoXOfGnJicjORYiZOyDBdytgJobMhSDWhy3pMIAZ0F5UBEWpJYYpT
 1XDJZO8xRd0BXGzrMO5waJ8D3Zfc7fL2/VzWD13i8TUXK/I8qwjy74Fi+T+z+J8KCScB
 etIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678864724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uta/U05GAafaktR9fApAMeVEtX67Kdj3raMR2qMOvbI=;
 b=aahbUea2xX+AFqIDOr/0cZ1waGfp+GUxPVaZeZVaD+DQkEK4Ncx/lLSrbB7XMouRDt
 6I2InPF4b3GlJptcBX4tI6FSyceIlLrbpRRFzXDA4BNoOobiJaVDZQRJ9g9X28F7XQhj
 1WqeSpI+LX1Isk1rE1RBPlcMwu1UAWJBK4i3DfNb0d93k/Ejl2xFpRm9aS5LIwWr1QBT
 zzBqI/nh1eFQahiIGyOL3/cVdnLMzso4BbYF+82AQvWXEW4HwizCFkCZ0sP25uM1AsID
 SSV0l7YqzmuSI2F/guUF/N7IhAlTtMmYYlD4eaSElk5gaSITjz0lOfXa21iPXC2rHdOL
 aGeg==
X-Gm-Message-State: AO0yUKXbaBAzoADhAYAgbN//MLNU/lTdx0YTy9zKvmaUGzILrp6YMDBr
 bRwcqVUeq5X8H2n8jXcWJ9o=
X-Google-Smtp-Source: AK7set+tVtF3UU14jhEuO63/9HB2svaK+oHMY8mRNgtuyokLjZEUYhsRpjZC9RJHiAdfnnYAgpuYCA==
X-Received: by 2002:a05:6870:c084:b0:17a:bbbc:71f6 with SMTP id
 c4-20020a056870c08400b0017abbbc71f6mr1862775oad.55.1678864723793; 
 Wed, 15 Mar 2023 00:18:43 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk.
 [143.89.191.119]) by smtp.gmail.com with ESMTPSA id
 f59-20020a9d2c41000000b0068bb6043362sm2047437otb.11.2023.03.15.00.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 00:18:43 -0700 (PDT)
From: Wei Chen <harperchen1110@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH] fbdev: nvidia: Fix potential divide by zero
Date: Wed, 15 Mar 2023 07:18:31 +0000
Message-Id: <20230315071831.3833948-1-harperchen1110@gmail.com>
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
Cc: Wei Chen <harperchen1110@gmail.com>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

variable var->pixclock can be set by user. In case it
equals to zero, divide by zero would occur in nvidiafb_set_par.

Similar crashes have happened in other fbdev drivers. There
is no check and modification on var->pixclock along the call
chain to nvidia_check_var and nvidiafb_set_par. We believe it
could also be triggered in driver nvidia from user site.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
 drivers/video/fbdev/nvidia/nvidia.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index e60a276b4855..ea4ba3dfb96b 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -764,6 +764,8 @@ static int nvidiafb_check_var(struct fb_var_screeninfo *var,
 	int pitch, err = 0;
 
 	NVTRACE_ENTER();
+	if (!var->pixclock)
+		return -EINVAL;
 
 	var->transp.offset = 0;
 	var->transp.length = 0;
-- 
2.25.1

