Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410DB221FE5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 11:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311EA6EC39;
	Thu, 16 Jul 2020 09:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444476E045;
 Thu, 16 Jul 2020 04:28:08 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id k18so4372178qke.4;
 Wed, 15 Jul 2020 21:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/DmHETZOAY7H70Ux+TlQEI0fnuJDUnsXDXca6tT46g=;
 b=MttvtiJAL/Z4cy1qvGZG6Fln4g0zsBEgJIxXkKsC5wdcZx5VUygmatZNCIGxxsU5mk
 YxAFJdhdO4N+HPCFbCjs3j0W/ECegXrJRvfaxzgzZU4DTbw99XWQrvLjfsBMxgMiWN06
 z3Ouhbx4RtJrgLFfurVRxZAEd+/+SDC/JI0INOUTHf01E8uE6CclPefOiZ9qZyMgjhYP
 W/F6ULpN4aoc6gcBYcd21XIUMrmqJIDTX091uoovWUBKDFm+21OsblbEvkoNFb/jzA5f
 GzQzQoHCnoG72CVLGShWNmtt98ZqsyeA5UJgeE0votEVQqDXRN8kq6lyBRDxrWD3v8xg
 Ro0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/DmHETZOAY7H70Ux+TlQEI0fnuJDUnsXDXca6tT46g=;
 b=kFSzcXKTE/QGz7ZmPj9gBmC0v5GcGzY8x85HrCuK8MyEsEjlZzXPxs5bz4t6c3d8AS
 X2o7eJwOP6400MTZl2BStCG7N8CBFhuLUMGI1KXI25mJsSysbWzBklIpsp0dVJypRLlR
 9TJnVv8IJWrZ3r79XiF8jDfXWseb1fv3i4H5VZYBkjQrfTZmFD40ql8OSQQBnErKxqZM
 n3fifbkO25/GZVlW8zJGzoTVK6SJGp/82Vev00s7RaITfmnKeqkJtAS1hS0VWUaEpU5t
 JoehhPI9tMdmp1c0//8o49+Z0FFLJw/OE8pIc9USCjr6uNHo56Fch+z8DIW7gP5LSJTI
 b6Qw==
X-Gm-Message-State: AOAM5314YCxY3tAnGHc7ba7r/Hth0NuQz4rSDHMLs4EjRgoMspuL5ZnU
 GJiIz+JbkVMod0Y09sdBwXQ=
X-Google-Smtp-Source: ABdhPJyqZ06OE7DJZF6oZZcBoK379ofd//uSbRPcAsHFWSjy6GHaa3/nYk1wRYFZasP51XtjA7fXvg==
X-Received: by 2002:a37:9b08:: with SMTP id d8mr2291995qke.105.1594873687122; 
 Wed, 15 Jul 2020 21:28:07 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id 79sm5466778qkd.134.2020.07.15.21.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 21:28:06 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915/display: Ensure that ret is always initialized in
 icl_combo_phy_verify_state
Date: Wed, 15 Jul 2020 21:27:42 -0700
Message-Id: <20200716042742.123169-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:42:42 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

drivers/gpu/drm/i915/display/intel_combo_phy.c:268:3: warning: variable
'ret' is uninitialized when used here [-Wuninitialized]
                ret &= check_phy_reg(dev_priv, phy, ICL_PORT_TX_DW8_LN0(phy),
                ^~~
drivers/gpu/drm/i915/display/intel_combo_phy.c:261:10: note: initialize
the variable 'ret' to silence this warning
        bool ret;
                ^
                 = 0
1 warning generated.

In practice, the bug this warning appears to be concerned with would not
actually matter because ret gets initialized to the return value of
cnl_verify_procmon_ref_values. However, that does appear to be a bug
since it means the first hunk of the patch this fixes won't actually do
anything (since the values of check_phy_reg won't factor into the final
ret value). Initialize ret to true then make all of the assignments a
bitwise AND with itself so that the function always does what it should
do.

Fixes: 239bef676d8e ("drm/i915/display: Implement new combo phy initialization step")
Link: https://github.com/ClangBuiltLinux/linux/issues/1094
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_combo_phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_combo_phy.c b/drivers/gpu/drm/i915/display/intel_combo_phy.c
index eccaa79cb4a9..a4b8aa6d0a9e 100644
--- a/drivers/gpu/drm/i915/display/intel_combo_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_combo_phy.c
@@ -258,7 +258,7 @@ static bool phy_is_master(struct drm_i915_private *dev_priv, enum phy phy)
 static bool icl_combo_phy_verify_state(struct drm_i915_private *dev_priv,
 				       enum phy phy)
 {
-	bool ret;
+	bool ret = true;
 	u32 expected_val = 0;
 
 	if (!icl_combo_phy_enabled(dev_priv, phy))
@@ -276,7 +276,7 @@ static bool icl_combo_phy_verify_state(struct drm_i915_private *dev_priv,
 				     DCC_MODE_SELECT_CONTINUOSLY);
 	}
 
-	ret = cnl_verify_procmon_ref_values(dev_priv, phy);
+	ret &= cnl_verify_procmon_ref_values(dev_priv, phy);
 
 	if (phy_is_master(dev_priv, phy)) {
 		ret &= check_phy_reg(dev_priv, phy, ICL_PORT_COMP_DW8(phy),

base-commit: ca0e494af5edb59002665bf12871e94b4163a257
-- 
2.28.0.rc0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
