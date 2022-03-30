Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340284EC2EA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E5410EA79;
	Wed, 30 Mar 2022 12:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8410EA79
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:03:22 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id w8so20258891pll.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AvqwHy5iP7QDYL90jHvlfS06VpNkgs2PdfjMbWdFXfE=;
 b=CUSnOCzxqgVRMtGhfZ4Fy+WyRU2GGqdh5D/k3XFkbJDJPj/P66POAZKY4dNjn2XQkf
 FSlZOHnmvEeO1rwpxooAaYyRSdT+Xdb2zuHBGjfhISLnyARzPggG/rs5cxIlTaxzOzki
 A8HjFhdN0mp0ByA1LrCj6pRVd8XmdIfw4qCmhwju5c9OCFwblO4rU4c2bYCPUhdSrgG3
 iSMgDyu2u2O0bI1bCgtlaeVvd3mT/iQaNvyn3xfH+kFktz4VewiRslZ/lxD2rTIPLgC6
 Fd5DsWOQ6etUz2D6YMpdVyiFPCQIMMduoPTX4tB+mAfH+d5Fa+b+PWAfkmhiWoZBVn1U
 pgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AvqwHy5iP7QDYL90jHvlfS06VpNkgs2PdfjMbWdFXfE=;
 b=EN/Ijp0n2RVd+nrIXdxPmTgSxX/mO/5/H8bG/zr9PK53jUpBRM36U8Qb5QgQ9KnIyl
 sM566MuCKEr6FRk9RsXucg5TRFgge7+YAvAHdCzaykqaPyHkhMIqeP5nz9PKc4LZmJJI
 gIG6XY3WFdOpDjESaz03GtVISFESNncpEY3guBKrKreb0bQBq1U7iw3n3ZO8jEJc9sdU
 GqrbIj7KA+w+6Asj8Sf6XFhMcQZuUxNUHgomeqPsyXVzeroKtoac3PdisceKo9NOl0Y0
 uLCmuGrf+YiDZh3bwLwFjYoRfklBHtm7jUQt3eVY0x04HrlFOgf3BaxXstUH+n116uOU
 CfVw==
X-Gm-Message-State: AOAM533ZOVeiSC3cL/Jy0ZjzefzhBpeark6KS1kKnsR/FI7lNM6zw/Oj
 bmeN3zMIQcawzun9/4rduOH1XfMjI8dPvA==
X-Google-Smtp-Source: ABdhPJy0jqMqa9ZIkbR+7qbrpJnbD0474GqIHiQoKDnZ/tH3sXBv6IRUdF4/oiU/ag6EBaHguPWVSQ==
X-Received: by 2002:a17:903:41cf:b0:154:25bf:7d0f with SMTP id
 u15-20020a17090341cf00b0015425bf7d0fmr34409382ple.41.1648641802229; 
 Wed, 30 Mar 2022 05:03:22 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 q13-20020aa7982d000000b004fb199b9c7dsm19622304pfl.119.2022.03.30.05.03.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Mar 2022 05:03:21 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/5] gma500: fix a missing break in cdv_intel_crtc_mode_set
Date: Wed, 30 Mar 2022 20:02:43 +0800
Message-Id: <20220330120246.25580-3-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yakui.zhao@intel.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 airlied@redhat.com, rob@ti.com, alan@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. It
could lead to a invalid reference to 'ddi_select' after the loop, and
could lead to multiple 'is_*' flags being set with true mistakely, too.

The invalid reference to 'ddi_select' is here:
	cdv_dpll_set_clock_cdv(dev, crtc, &clock, is_lvds, ddi_select);

To fix this, when found the entry, add a break after the switch statement.

Fixes: d66760962d75 ("gma500: Program the DPLL lane based on the selected digitial port")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 94ebc48a4349..3e93019b17cb 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -616,6 +616,8 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 			DRM_ERROR("invalid output type.\n");
 			return 0;
 		}
+
+		break;
 	}
 
 	if (dev_priv->dplla_96mhz)
-- 
2.17.1

