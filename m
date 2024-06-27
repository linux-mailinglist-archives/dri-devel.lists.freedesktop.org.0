Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9B91B10A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EED10EB3C;
	Thu, 27 Jun 2024 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="Y6GiGk/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24310E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:00:12 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-706b14044cbso1137369b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719511212; x=1720116012;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItlPUnSvus72i750gw994VRrzxx6DngH2RkQqxVGs8Q=;
 b=Y6GiGk/dOqzsOLyTu8XmSPTrdSi/bTnA06+HWLiGMQ6sYFG/EtPvxqQiglQWsD8Tkr
 F5eGjyCe9fgz1K/5zNOkxd+zyiH1uSzMCjA1dXd4ejyD8+PyrMsAUoSVAEa1cQssUm88
 QN5DUihKJoMjaVtl3I/YI/839OrDn3MK/kbyOa+EE+Iw/hPrXCzyh/MY72is2wfZdbQl
 vvC1V42ol4jPi1JoW3XxV8C3vJKzdpn1JX6WvhWn0UX9+D/uD2RhcGxsjbkETxtnvQtt
 ei5AP3+m4PxUrJAjlREPZVNWlf7hSa102Ik/S03GPS1q1/YpdyjwWMIHh6oJT7WiJ/2p
 v2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719511212; x=1720116012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItlPUnSvus72i750gw994VRrzxx6DngH2RkQqxVGs8Q=;
 b=YGqu1qOYSN8EmgOqeAPoaAZdTQvjk8I7P8urM9fedLF4sbHP7o0+DDSRNA9i0pZqI4
 zES63+6eb/FbdHUEcrSwrLNGA89Ck/4FtdqbrQpRgrnfMfvA9za3qj4xK1k/WzQNxSM5
 NUAiJuHP9TO+ADFp2rZ6ijXuJZzoTmzRWqWMbytdgSbAqK2FZu3oRGqZgsljlBZTylVe
 33UX8//hlRqd3WjpmgtLkmY2lP2inSXNkce5LqXT+AlSFRuHwN8zMSb248npyPXs3jwW
 tK9nBUNH6izTtD5VXXXpR5suzMdh0zRYDW6UPWOEY0s8/qr/df3VqoFzTXiB3xKbHye0
 oCqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz3aJPq2Di7LisrDIRJBSFfkd3+Yh29V4dXV4c1Av/BBJEsoDkzwhDgbpee6P/XvRzi9mtzRa2GQdPPLpI3v2bfWrpbmjorKEzUkI13V3Q
X-Gm-Message-State: AOJu0Yy04GUF6lWYLpiG/uajcWDtuPu0Jk5rPygPBuEI7XFx27hwG8OD
 quDlLUMyo1nt6B8IspW8o6FN0JQBruNKUnkIsd6+AVC28+71F7u8oFkhf+TI7A==
X-Google-Smtp-Source: AGHT+IESjooPdGd4R6XKtPhPeyt2QG2/mENVza+Wy5xrhF/fH7VOJlp0YoLUOLgDIN+gvqfSIu+Aeg==
X-Received: by 2002:a05:6a00:26c5:b0:706:4304:3047 with SMTP id
 d2e1a72fcca58-706746fb433mr11797648b3a.32.1719511212095; 
 Thu, 27 Jun 2024 11:00:12 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a352c0sm1718018b3a.171.2024.06.27.11.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:00:11 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH 2/2] drm: panel-orientation-quirks: Add labels for both Valve
 Steam Deck revisions
Date: Thu, 27 Jun 2024 10:59:47 -0700
Message-ID: <20240627175947.65513-3-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627175947.65513-1-mattschwartz@gwu.edu>
References: <20240627175947.65513-1-mattschwartz@gwu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

This accounts for the existence of two Steam Deck revisions 
instead of a single revision

Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index ac8319d38e37..3f84d7527793 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,14 +420,14 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck */
+	}, {	/* Valve Steam Deck (Jupiter) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* Valve Steam Deck */
+	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
-- 
2.45.2

