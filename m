Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB6B1922F
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE4110E4D6;
	Sun,  3 Aug 2025 03:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qeq8OgCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516EC10E4CC;
 Sun,  3 Aug 2025 03:59:51 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3e3ee9c7815so14654155ab.3; 
 Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193590; x=1754798390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=;
 b=Qeq8OgCkVkDvGqWDvKnYyjcIHyGCF66c9UgfJt56XBkGvZf8YRHyOg2i5W2nD2ZMYM
 r0IwC8de0cz2vLxkysxiMYxSUWCE+Dv8o17PLZcZes6IKTUdrDGOlgFHjGOLDCnakMi/
 md8xuc39rJLeulIxPD6UKnCUvAqNd/mG6JF6imjSrDUkGH/8XfHnmYOcCDdlLSgjuEbb
 /LFqybVa0PQPTo7gqGImeVefmmwUIYYa/YNq4tZOdjdarfin4oLsInDU5BshGbXCzm2R
 Mt/iFytWMkzVxmPneGsu2EGcf5dd3pPRucL++m0kpuiFDBcqFOOAxnmVorGiD6zJPNI9
 jiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193590; x=1754798390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=;
 b=bcoCI54kKaoXaD70kA45oMvH/hQvqDhkBgK5X0n/QRQVmR8/VglP7BUakY2oaDqPht
 Lv74cFU7deyrncst+Je6uGw6Sn7OIBgs1PDm9Upiz2ruvfb0CpWFeNmF8Z3hi1U961qv
 14+hHviGfeN/NvvGdCkNKqXmzL7wbrBkKP3xHlep7Z8cff/csq9Pjdj4Fkhz28TDihzY
 XdESePn1dcj8U2UyL06orK8k75cZxBeA+SQvTe2/wrPx8mENjnYfaDm036zjABAFOIsp
 SH3N/z8rvo9RI+xDXrGLUiebsp14fL6b9YFJkmcb7dXeKqChnHz9YRw0Q3EAUT9n4XzJ
 1SaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY9ijsQZK2TT5OQ0D4LCWVehe2+ch8zNUFSWNIV9MNjFa4dZyRa9z4c2bEVnJ5rMs7vinJd4K9@lists.freedesktop.org,
 AJvYcCVd6N+cUYTHZg/wQsXrmC/rUZIK8um+ATSzbpGngom1ovFoIZTS6pB6y2IKYAGEXyndqqHeZXFzj9InUkcYug==@lists.freedesktop.org,
 AJvYcCW7slxaQGusrSpE8r+L2GhCgPMtXOClRHg6xMUVxk+xVdzcjflsIk5IqJyAkxVz8K67Tq6KpD9A8wUb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsrGsyOSwMZf5DLOrLm3p0SjFm1dCrhhuPXdNvRGm2FwhX+D+i
 PFXTuO1ktmBcLqxs3U+BU/bClSgnIjderOXfctueHwY+BAecdUQ3rYgh
X-Gm-Gg: ASbGnctFm38fhStwQaowvVVppN8mLznp8DEhwGZwxtB9Ceg7BrUGZLtD9DDyZK1JE0m
 tFPWVN24BaxgAf8fBzaAd+IsbrfICZF8NtHJQIC03xnzWxLLRLu247+DF/bMQiBp5WLSmR0cQgA
 lLjgyoc5y5jGNaokinKqhxAWG0CaEsy6SleYYj+uwNF1Qcv3IEDEbQHEpelNtErmGn0Du+UiYO1
 t53uESqZNts5gxIio8R1EvLRaMct+kJN+vQd/yN/gN4Pg6Tf2qbgAepRT6mbyjP6z3P5wcXO0VD
 N16PowRUVYcIbfgitKlOpTQgfuJtsVZrG15T5vfxaBlILWGeLABKKjGl+pWdZn363l/oB3jPlRI
 vImGavHCgs0bWBRczeSaFl2KA3YOq31y43ULugECygsniLpviunTQg7BPF4sTokKzyZ5tTuC1Qc
 ALiQ==
X-Google-Smtp-Source: AGHT+IF/wtqWPX2Zi7GTVg1C35Kj0vqsIIXy5Rg7Uw34TkqPQk+fiEKJa0lSA2jtCZZXOMZn37J89w==
X-Received: by 2002:a05:6e02:216d:b0:3e4:ba2:2cd1 with SMTP id
 e9e14a558f8ab-3e41617ffa8mr84699525ab.16.1754193590548; 
 Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 53/58] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Sat,  2 Aug 2025 21:58:11 -0600
Message-ID: <20250803035816.603405-54-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 5385a2126e45f..5b6797b80ff01 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.50.1

