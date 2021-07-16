Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A813CB88C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E516E99E;
	Fri, 16 Jul 2021 14:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406D46E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:14:32 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so10012260otl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46xU+SXnqlLkmlzsI55zUXIr3djBOo3fEmLgJyTXo+M=;
 b=nrn0B+IqE0DunuPhH9qgvK3pgxePiU+u5i+w3JSW6+U0cH4bqQHWJScoug5eBQ7uC3
 Asr3iQrQ4H1sW6NAb1JHOIYoL+ndDqzVR1BK0RMYR/5/xrgxRRcSQ0Lf7TLoG0uBALGV
 Rkel9AfPU2xs/wkPiuYm84759RN22q9EmHJDpLbJKrTz6t49xpbuh2hyjmkxc0iIF/MJ
 3zxiEbCSzeMZF9D4CsEW+LI+hfTElrPhIsGC5evuF5jjdzh6+94v5mNwJGEFeK9p9H9R
 mG3TjcHNfa8C/iC6lZ0VPzmTI7wuRUsn1WTyPn5TaDaXVRuIlkhiKzTyyWvfxaapxKMJ
 8kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46xU+SXnqlLkmlzsI55zUXIr3djBOo3fEmLgJyTXo+M=;
 b=JZp1UhwJlYDAxFKaUFjde0LwgmnkZyj5uC1A5x2RZ2nV/8/j7rezIEXF/Xt+D40bGe
 tZ7jNcesKsLwXyf6HC2VRa2nticFF6sl+0MiuXye1m1cmTsfSbbpGYTmaS0P322C1X/6
 +TmYZCRg29nWw/J0xCwWpDaiSeazpzM2f89RtkDzWEXUadQN69EiWmONP8LXOSzMtAkw
 WfcO5lMK5vyxT/PB7TjiU1mHbe9Jc96FSyghJHex+hGA4uwHgXLygUhfPTNFGfnkL3xi
 1gXPTXYULneABlH9eLpA3zFWRysVBra1Gj47GbOZ+WpjPWFs3fBW+CNyuYzy1L/8D9KI
 eJ8Q==
X-Gm-Message-State: AOAM530YQS38mHfg+65fUWT3Sbf7hmszOhwnRTk+c3CPEprPVVrGsXVq
 S0OwiEBVFUCLfMFX5vZvi81KTQ==
X-Google-Smtp-Source: ABdhPJxhtLCtyeshB1Ll9sx4/SUW5z0DS9S/txY8nctuNTmk86n37RDi7feuVT3HmW2wgupaiHnfnQ==
X-Received: by 2002:a9d:7f14:: with SMTP id j20mr8042414otq.82.1626444871280; 
 Fri, 16 Jul 2021 07:14:31 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id v42sm1852266ott.70.2021.07.16.07.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:14:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915/gem: Call i915_gem_flush_free_objects() in
 i915_gem_dumb_create()
Date: Fri, 16 Jul 2021 09:14:22 -0500
Message-Id: <20210716141426.1904528-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716141426.1904528-1-jason@jlekstrand.net>
References: <20210716141426.1904528-1-jason@jlekstrand.net>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This doesn't really fix anything serious since the chances of a client
creating and destroying a mass of dumb BOs is pretty low.  However, it
is called by the other two create IOCTLs to garbage collect old objects.
Call it here too for consistency.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 5766749a449c0..1b370914587c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -151,6 +151,8 @@ i915_gem_dumb_create(struct drm_file *file,
 	if (args->pitch < args->width)
 		return -EINVAL;
 
+	i915_gem_flush_free_objects(i915);
+
 	args->size = mul_u32_u32(args->pitch, args->height);
 
 	mem_type = INTEL_MEMORY_SYSTEM;
-- 
2.31.1

