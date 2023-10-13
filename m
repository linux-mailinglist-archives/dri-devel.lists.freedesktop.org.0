Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B57C7E7C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 09:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFC810E5BE;
	Fri, 13 Oct 2023 07:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621A10E080
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 03:10:53 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-79fe6da0049so66330839f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 20:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697166652; x=1697771452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TsY2oClvKo7kprulGqoF1UimrGsaQgD/VvrbzM3GhTw=;
 b=NVl8JwYV+3d10fx5kXi7BeQl1tyWl6Vm4MyvWUSlvvZ4q5pdpwXa+3XyC+5O00Q9X7
 btYST1xp/HCK08v67JzdVsulWwZwfszaEWmzOlouij1l2NC6Qf5Po3ziRrO/KbhjaRig
 Ujph9VUhFpJp/TbwEn7bQO0WbmkuaspuUgUQ8huZl/MDY6Uqh0mdBons6jNg9KMSNl8j
 0Zy53EvgGhjDL0sCiiCSbsbXE8gP/Wn9ESAWv0zNoMbvb/YXgPITfU8GueK+//fdN+1v
 z2Qyy8IzrOXNn6DvJpK0FOH1vchLpxGRr0Ga4HZZzd6X9Xnvj4ONZHIhXjWmza1zH/cY
 IcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697166652; x=1697771452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TsY2oClvKo7kprulGqoF1UimrGsaQgD/VvrbzM3GhTw=;
 b=b/MU4Aq45104C4WS/85FACAzpX5LymWalbspwbmDUQ80oEWOtMrYlz/moZ1SIKyzsz
 9T3Q1HMkZypOzra+SqaMc2mr8KzUDHeq6J/oC7k5zvSe60ISDUaRLmwV8NfECUsoNzTo
 MblOT046JOrMmnK7drSJhpfNx32//WXvnvCPFbPmW/ps/DKo/aHnp6aSY+4aWVcFfSuK
 clG1RYt99nnFWwLBlSVC6z/8bhCC13tx/oOwJUEXxvNrIc4LHRjRpwdqP+ZhsjJ0c22J
 /o48rh+CRd2bSlyJ5w0EWb4Dv4p1Vo1M5ytakZjZtwPkdI4/YBY5cXAL0Pphz734CF1+
 7LvQ==
X-Gm-Message-State: AOJu0Yy3wtFrDgVHHFvQjcTs/Hk4Xu8zOZ+kiKX+HBA02h142YOJiQs8
 MZ7owhaGLvOSbMVy52eeUWmuSt+SsrKtvA==
X-Google-Smtp-Source: AGHT+IEuffesM8AN7N3wU2MdIgERDVEEEWATCJRRxrGyYBSB71aTI2qSladEUOIIj9hoG3k3YOVpYQ==
X-Received: by 2002:a05:6602:39a:b0:790:f735:4d30 with SMTP id
 f26-20020a056602039a00b00790f7354d30mr30694824iov.13.1697166652023; 
 Thu, 12 Oct 2023 20:10:52 -0700 (PDT)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:4979:b5dc:3d65:edd2])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5e8c03000000b0079ab2787139sm4691058ioj.7.2023.10.12.20.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 20:10:51 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm: bridge: samsung-dsim: Recalculate timings when rounding
 HFP up
Date: Thu, 12 Oct 2023 22:10:40 -0500
Message-Id: <20231013031040.152282-1-aford173@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Oct 2023 07:18:56 +0000
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using video sync pulses, the HFP, HBP, and HSA are divided between
the available lanes if there is more than one lane.  For certain
timings and lane configurations, the HFP may not be evenly divisible
and it gets rounded down which can cause certain resolutions and
refresh rates to not sync.

ie. 720p60 on some monitors show hss of 1390 and hdisplay of 1280.  This
yields an HFP of 110. When taking the HFP of 110 divides along 4 lanes,
the result is 27.5 which rounds down to 27 and causes some monitors not
to sync.

The solultion is to round HFP up by finding the remainder of HFP /
the number of lanes and increasing the hsync_start, hsync_end, and
htotal to compensate when there is a remainder.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
This adds support for 720p60 in the i.MX8M Plus.

NXP uses a look-up table in their downstream code to accomplish this.
Using this calculation, the driver can adjust without the need for a
complicated table and should be flexible for different timings and
resolutions depending on the monitor.

I don't have a DSI analyzer, and this appears to only work on
i.MX8M Plus but not Mini and Nano for some reason, despite their
having a similar DSI bridge.

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index be5914caa17d..5564e85f6b63 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1628,6 +1628,26 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
+	/*
+	 * When using video sync pulses, the HFP, HBP, and HSA are divided between
+	 * the available lanes if there is more than one lane.  For certain
+	 * timings and lane configurations, the HFP may not be evenly divisible.
+	 * This can cause HFP to round down, and it ends up being too small which can
+	 * cause some monitors to not sync properly. In these instances, round HFP up
+	 * and adjust htotal to compensate. Through trial and error, it appears that
+	 * the HBP and HSA do not appear to need the same correction that HFP does.
+	 */
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {
+		int hfp = adjusted_mode->hsync_start - adjusted_mode->hdisplay;
+		int remainder = hfp % dsi->lanes;
+
+		if (remainder) {
+			adjusted_mode->hsync_start += remainder;
+			adjusted_mode->hsync_end   += remainder;
+			adjusted_mode->htotal      += remainder;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.40.1

