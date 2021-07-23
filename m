Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CF3D40BD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ED96FCED;
	Fri, 23 Jul 2021 19:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B8B6EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 19:29:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so2226302wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AtjGXQby9vrkjQNbOGk9BDKUaVuwZWt2ukLNnFbi6Gc=;
 b=QRWqGWGK+5Vs26h3bP45X7YpwVUKtFWE8pY0cpWJJhXOW86qF+3vqZAG1PfM2I6p/r
 CWmzx8E0/q+X2i0PfZAgT6+jij+ZFdZf4IDFXLF/6XbVQ0ur+ROVi20jAhW6zgEtQ3Yz
 nCSxK0t0qoBk0Pwn1cvEQJHXayRCJM3YBBado=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AtjGXQby9vrkjQNbOGk9BDKUaVuwZWt2ukLNnFbi6Gc=;
 b=fLJWCqzZ+8l6Hwb+zMa51CAPX6luPqOiEYzOHVEkJ3WNIU5xXBNcs6kyhtvuhFVlQS
 BOYS/nmohpi4QhaW3REgH4uA7iwR6tVNtEiygdrfB4RQL7RCowBm0kC/rscn/qWlQibE
 b8PLTqHONBLLFrURWUjQU+/TLypw/w5MLBN7f28LRKRNc9q1W/s00tm9qDveB9kzhUfh
 l5zNWCVb+Z9RlC/07vBwGFtZX70giUEofdZ/E7SFfL8BIPQABzrUkB6MF6kkKnyApB0I
 sJQrGiBigTZOusCdAgaHKScoqb0Ym/InVhbK+otic53p361PMmu3OjdL89P4GAIwWbYf
 gsAQ==
X-Gm-Message-State: AOAM5331B153Fhm8k/2dUGCz84Wjr5jOnlEYHW6lbUihuAIhPPt0o5ON
 p1oA5p4w3BGIK8U4ShXTRgxw7O2+3uyOJA==
X-Google-Smtp-Source: ABdhPJxFcBPlcugjzf3LleoBRFHxJARc6IAambQdzSJ6im40ldYd4vmgubfbTrGOUwO9ArVOh2faNw==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr13320002wml.52.1627068580442; 
 Fri, 23 Jul 2021 12:29:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s14sm17609870wmc.25.2021.07.23.12.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 12:29:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/10] drm/i915: Check for nomodeset in i915_init() first
Date: Fri, 23 Jul 2021 21:29:25 +0200
Message-Id: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When modesetting (aka the full pci driver, which has nothing to do
with disable_display option, which just gives you the full pci driver
without the display driver) is disabled, we load nothing and do
nothing.

So move that check first, for a bit of orderliness. With Jason's
module init/exit table this now becomes trivial.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 48ea23dd3b5b..0deaeeba2347 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1292,9 +1292,9 @@ static const struct {
    int (*init)(void);
    void (*exit)(void);
 } init_funcs[] = {
+	{ i915_check_nomodeset, NULL },
 	{ i915_globals_init, i915_globals_exit },
 	{ i915_mock_selftests, NULL },
-	{ i915_check_nomodeset, NULL },
 	{ i915_pmu_init, i915_pmu_exit },
 	{ i915_register_pci_driver, i915_unregister_pci_driver },
 	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
-- 
2.32.0

