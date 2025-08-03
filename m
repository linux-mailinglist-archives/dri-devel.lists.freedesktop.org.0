Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB4B19233
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A22E10E4DC;
	Sun,  3 Aug 2025 03:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHqVaHbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7BA10E4DB;
 Sun,  3 Aug 2025 03:59:53 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e40050551bso23422035ab.2; 
 Sat, 02 Aug 2025 20:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193593; x=1754798393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=;
 b=DHqVaHbU3b+txUHqqoqbw/Nqk5u93C4fMvzbnHlhbDMuKQCgqNHhLF2D5csNOSM80M
 /VxFmRmYyhtGeBNXhEkWS9JUcWI0OSzB22OxiaqdkwbMya8RldQI0Ed+fGysPkJVtrxt
 Ef8mbHt+DAytZiSQj1QKxWJ1yVgBCxWUDguziPrVY9o99Y+z3Vk/HTqOWqXrRVQGgX4A
 7dbW37HLj1vOnkdBsH+pUzDgBrqtxwRs9l6CCj8jcHewtl9NDEHPhgPNU94GIaSlHF4Q
 FO4MDpbT3muS6YVSjK4tNmrPLctLWxCES3Lt2Tumyh67zgAkSedPF9KL2cgvBYkKP/ir
 TJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193593; x=1754798393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=;
 b=AetG4kMtRsc5wXpLO9TM8zkoW2oxBzAOjHqm2JJVs1sFd3tckoe3ceXGbqJfJ2fH5g
 O4lm3KF2YGJhK21yo6Xw9PH/eSepqYFsh5O9GK3wgOriAQ9ZT/SSTW4/Wp/teDneprGB
 AIu8Ge/Hv2Qbse1rgac5pSQVj87Srq4xTjadKQrEkV+hYH96Ia/X3r4PYhdjhjKjz+MA
 Fl8x49XWX68T/sKck+tn2RG9E/otIl1UJkpdMf87BONyjTlWlE+P3LcPD+DgqttrVpiq
 sY0eYV8YcUeIrRJ8BTYwx59NRdQKtocTTXaqDD8pV+6N4OaUchRAf64lc2YHFxN0Kww8
 4SLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYVKN4gFUl5FP1r01stb5UwhuJaSiAaP0TsbIrL/O9TQCYlSkRR3aHZrnT0I3ypaAZE+IVyluJ@lists.freedesktop.org,
 AJvYcCUczl+u6lbsaSU656XRKuJh2D0TK67eJf3nNZCbzlC3UjctUpTAza2EZUF7lzEl6p783UDr5/gCqnA6@lists.freedesktop.org,
 AJvYcCXz3CQgcH78gzrNnBvfDy/+ohV+R/aG6BLfOp1mTAgtq15WFi2vAu/J5Jfre8RWGUPHg9Wx7zKIbg1i0N0GAQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHt4okyk8H6PamJS0HpUhdDBudCeV1DV68rTR8lXMeW623L63q
 FIhmPOJvpTjE7yUvreNMJhIpluvUOshq+gNZNVqd7emIgZMmKYcfegLw
X-Gm-Gg: ASbGnctS3nf8r1jDRJvDPtUw+OQV9IvQ8XefLwXkzfBL68QpCCXqUjqPzA+aWaMR6U2
 dJ5If4D5MDQ/08Yxi4DVbxbgPIRHO9ukPxI/sQa6ksJNuIkGLb6CCNjLlRMYZZw0FzPCYHt63MM
 rgJDU5JLdhkYd79Oa6yTm8uGR/pwVYXbXxKkeI3S7Z8VIP1EHz8oj3gmM86TIfwwpfgPWWvD70G
 YzIGKGyghLDFRrDaENEfptxE+WZgL8WOpx4o1eM1r3Ju/73NTzYF3yxPsf/snyuh97aW0O2f8Ge
 hZ3olRQXJ2oVDx3YZoz77nGpmnkKH25XmoRm6UUDlM9yrKvUntcDMTDen2o1R1yHk5iVen60YFh
 Rl9AOMC/j0ht00oeAejJYuPd2fkgGiU+m7G8eJTkfeUiAuTUMsWm7ptFXGPdfyCmCZ5/Qvak6CX
 AONg==
X-Google-Smtp-Source: AGHT+IFRhlTHb2lQE4L0miOq7NLbPvlGhLYYpHWAVoxzVxg4lJp/ceeEQ8khoVmbBOpRBlSLgtRD3g==
X-Received: by 2002:a05:6e02:1689:b0:3e3:ef79:5a8a with SMTP id
 e9e14a558f8ab-3e41617efe3mr89164355ab.12.1754193592938; 
 Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
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
Subject: [PATCH v4 55/58] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Sat,  2 Aug 2025 21:58:13 -0600
Message-ID: <20250803035816.603405-56-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a5dbee6974ab6..95ff79abbcffc 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.50.1

