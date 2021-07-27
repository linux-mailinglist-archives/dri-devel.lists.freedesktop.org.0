Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A63D74C5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 14:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D698D6E3BB;
	Tue, 27 Jul 2021 12:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109196E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:10:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so1696931wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiDTKh8DNOhbwBce61iq5CGtRilbbuE9UNuHZ6HhVL0=;
 b=cOQVX5C3T1KmMGo8NPBlovcwKRMSGfUCil140q8sXoifee3Sl+QU0Vwga0SVQAS+At
 YLBuoYWz46xi9r9bny9sTqT0PAx3dF2mSfD/5hKAewYSdSE9wf2M88e9Zn82F2wEfgRZ
 wyzdwaw3bmV38tU/nS6Ohy2khWbesIqSxTbbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JiDTKh8DNOhbwBce61iq5CGtRilbbuE9UNuHZ6HhVL0=;
 b=OTw0HNFNC5z/goC9U2VhjKA9KZoUN2FODE0/S9yVGUHX3t4dzER6evZIuWoQbnsa8w
 5buTKvP5Yw9WeEzVXX573dlJ3drNBJDXaRCJD/Kvhh0EjZgxbxpaduwIOyiq7BImCSBm
 9QA1GjJhHJmhFye81o2gPXRZ5eDY/+TdvMxCndgezwWESY/TYiz01on+k0v4p8P0ZRr4
 u7BQ7Mprne/w2Vreg/A06z8s+eUErscgnei8X5tPOlCLm/x8zh5H4aBA4kMgesNPhI4g
 g+ywnLWARzfM1uj3vIB0TxpTz4W+4lpXODbAQI08uCCI2snLRVVWY6a4bBuafGUW4JRd
 N0/A==
X-Gm-Message-State: AOAM531wpyTLS5H834nRUnrv0UhTxwF+LVjsWPBFcnBT4K648ymOChEu
 dazTpNPj/Mx8wKYkQ71wL7w9PeVhExKMVQ==
X-Google-Smtp-Source: ABdhPJxp+Q/ktPBo6GzEOYrWnpBFMlBC3/yNZurQF3GhvbX5jLGJYVm9DNakRussrlLFTOT1w1KdGQ==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr3943757wmj.0.1627387843562;
 Tue, 27 Jul 2021 05:10:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm3010577wme.45.2021.07.27.05.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:10:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 01/11] drm/i915: Check for nomodeset in i915_init() first
Date: Tue, 27 Jul 2021 14:10:27 +0200
Message-Id: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
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

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index f28206484552..eb520fcb32e4 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1293,9 +1293,9 @@ static const struct {
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

