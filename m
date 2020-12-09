Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2AC2D4CA9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 22:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C186E1CE;
	Wed,  9 Dec 2020 21:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D896E1A8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 21:18:35 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id p12so1347105qvj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 13:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RH0q26tWfSpC6Az0z0jtBiVQCPe6xjQ2CSrs1gGcCVY=;
 b=ALIYJ8lk2fMtT3Y5EQ31oN6a79sC+/k3E5JC1eAQR2iDW/1LoOdlCA5mrvDhmmYO/n
 UJByzDBLjw8nGq6pj8F6FJYV8yM/S1cKuOlDmrjo4Q4qaNNZszMbFtLgtz9QbIuUEBVz
 4uNGSjpzgcIXtqOxJc3hpP2WuExboIpDyZpsEV25ND3/wKRUlCT7ey/h4/IQXos7oMIS
 T+BQ7X5LQFvrFA1iA4Hv0r0nnIqYcUjp6nRL7H3HUfZW4wjEHExTR04zPNkGbxTkgkTg
 EJ11nhesqB6K/lZ2ZlkznYDdj/nddJWviuU6ehUVA+698G+EQ8Iiil+ElUMqsJKVdSSA
 B8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RH0q26tWfSpC6Az0z0jtBiVQCPe6xjQ2CSrs1gGcCVY=;
 b=QhdmjEbNWKIMV6X5JOX53EwPoLmPATHrffNfIBSrPAalL9zad+86bzdqtitXLD1QDt
 0hgctsfCjdWIkKqMzNAZgFInlsZaznAjGeLB7HMZo7A1bkVuHGOewrCAKgnqCmno+2qA
 c/dSRr0vL1ByvlCxujN1MEu5udmrpt8Swc6Sd3KB2Ux4yqDlqPpVHiA+T1NhNnDlf3Qm
 UOgtaHEyreP7V7pB7VZhSmtG4ikPJKaTwwDYtOCETUdAkSkcHuy2yO8mA1wx5U6PvNTg
 FBFCp8Rew82nwg6y93bVn+mg3DHByZCjgxERoh08I/favYPDVOhfQSvi6fnUBYaNJCOd
 cX8g==
X-Gm-Message-State: AOAM5334a6509gktCFezLr406lHb8lC4XSSbhNWY92EhlTlGc2iNF+gd
 ze7Fzze4AbXxLv/sPT4h8pfqCw==
X-Google-Smtp-Source: ABdhPJzYTSL0HkbPXHw3Y1SjoJgoB7qP4AV5GV8JexPGKr3fmNHsgjURG9nxW3Xssm33uYwERMyImQ==
X-Received: by 2002:a0c:8b99:: with SMTP id r25mr5437257qva.0.1607548715137;
 Wed, 09 Dec 2020 13:18:35 -0800 (PST)
Received: from localhost (159.sub-174-193-24.myvzw.com. [174.193.24.159])
 by smtp.gmail.com with ESMTPSA id 5sm1814156qtp.55.2020.12.09.13.18.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Dec 2020 13:18:34 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/display/tc: Only WARN once for bogus tc port flag
Date: Wed,  9 Dec 2020 16:16:36 -0500
Message-Id: <20201209211828.53193-1-sean@poorly.run>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

No need to spam syslog/console when we can ignore/fix the flag.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 4346bc1a747a..27dc2dad6809 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -262,7 +262,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
 		mask |= BIT(TC_PORT_LEGACY);
 
 	/* The sink can be connected only in a single mode. */
-	if (!drm_WARN_ON(&i915->drm, hweight32(mask) > 1))
+	if (!drm_WARN_ON_ONCE(&i915->drm, hweight32(mask) > 1))
 		tc_port_fixup_legacy_flag(dig_port, mask);
 
 	return mask;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
