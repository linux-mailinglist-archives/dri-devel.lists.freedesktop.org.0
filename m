Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CD4EC2ED
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530110EAC1;
	Wed, 30 Mar 2022 12:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E2410EAC1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:03:32 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id u22so18505577pfg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mw0Xb3acT/jJngaoGEDh96qavNQRf5DbODEg2Ia3G20=;
 b=j6tRbHGh4PwL7QVNwVCLvVVrcrP+486cq3+/B0xQQu2bAJsOtuKDqRaidYYvWi8QiJ
 9EBrPA+wjyOnufhmgXp/tCoEIh6VuWtCqEFwoSgY1CBncvyGFo9i+MZjB3+4aGb0rGGO
 g/6gkLtPfHVx/nmbA1pOqMUqcXQ/XnRC6opt0Y6pe3t+W/SBvFPGxGPWP1xXk1kcUjJm
 cRGYrS8ElkYE0UHThjswLXBZLSQQhtflN0tCC5ZbPDWpKOgvbfieOitc+xecRpvTo9QK
 8RRWp9rlO2FSN+AoX9nuBUIwGA+flgagxlgF12DgERG2eEJtR/zbLyUS2hZ1ei1CPreK
 SuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Mw0Xb3acT/jJngaoGEDh96qavNQRf5DbODEg2Ia3G20=;
 b=VzuIptx8yPYHgjA3wacvDsF3PJkrJTORMZhLnk9nSoQp+BgDKT/2F9OozYcWvrh/uY
 paqOUdI8YhN7rGzoiBrt2oTma2ZIWmB05bseV4Dr57zxI/55VI71F2a1eMJwtqteCRAQ
 9jdOTYg4OKJ+aPWU8JBrnS/N8AzNMZZSAyIQn6b4gz6HRJQ7X1dwBFGuTM1fZQUSqguZ
 S3ncag8kGXvJc7anvThn8phTZXw04Twt5smvWQ+TwfoLOkwdBX+zDtueRUD7G5hYcIQT
 PtKrzzqZ8x42EZ4zZomPiLkY5DJLLnepmCjrFWAymSt8IcdYYrbo98OqJUPIgZufiWd7
 4Qdg==
X-Gm-Message-State: AOAM5305PzHhnNzUN1PFpCQr5K3qKI4+0z/vLMrP9mZbJZTcOXbImyNf
 iBdUeVYjl42P789vqbAI/xw=
X-Google-Smtp-Source: ABdhPJwEBM261hXljDs2qeFIV354BPd5l2EbtG6IRonEl0apDdH4VGgubhpJfsdQJ9mYtScoLWW0BA==
X-Received: by 2002:aa7:8211:0:b0:4f7:8b7:239b with SMTP id
 k17-20020aa78211000000b004f708b7239bmr32372071pfi.64.1648641811381; 
 Wed, 30 Mar 2022 05:03:31 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm6446120pjb.16.2022.03.30.05.03.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Mar 2022 05:03:30 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 4/5] gma500: fix a missing break in cdv_intel_dp_set_m_n
Date: Wed, 30 Mar 2022 20:02:45 +0800
Message-Id: <20220330120246.25580-5-xiam0nd.tong@gmail.com>
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
could lead to a invalid reference to 'lane_count/bpp' after the loop.

The invalid reference to 'lane_count/bpp' is here:
	cdv_intel_dp_compute_m_n(bpp, lane_count,

To fix this, when found the entry, add a break after the switch statement.

Fixes: 8695b61294356 ("gma500: Add the support of display port on CDV")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index ba6ad1466374..e6473b8da296 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1016,6 +1016,8 @@ cdv_intel_dp_set_m_n(struct drm_crtc *crtc, struct drm_display_mode *mode,
 			bpp = dev_priv->edp.bpp;
 			break;
 		}
+
+		break;
 	}
 
 	/*
-- 
2.17.1

