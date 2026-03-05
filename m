Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGpgJh2rqWlSBwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:11:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395662152F4
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB39410EC1F;
	Thu,  5 Mar 2026 16:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W5HjH40v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D33310EC1F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 16:11:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso3408747f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772727064; x=1773331864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJeeuaZ7qx7HAcADjaqwPatptaDaRzMU0Sji/6Pdru8=;
 b=W5HjH40vAv0maaLSXWxn+7Lw4m5ksZsMNaeJJyGvQ/ENy55FT9hEJdWiqV8yR8tS+T
 tXD9+qGRbNhJgAGBsaYbBuCD5oTxXKfsFsGjhFkXH5yEcAqE5tCAoxnO79AqIaA4r4KL
 +3btSdf6xDIFegwUVyMDL3jbyxfEX+UDhJPbzSBo9LdtBL6IbstkSaPkypmVQiAfA4MV
 pKdTysw1yy4GgzMHWAci/be9izh+TfXoOyQBBJR2IjqOrh0/I301ff24ASzOxqk1otDU
 NvDQdNM0ZOnHJ6v34HVPUCVPEXnFDNdoXw4idVHIjZobQmOSl1pfgch6b3mBqOd5Ow1h
 GJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772727064; x=1773331864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJeeuaZ7qx7HAcADjaqwPatptaDaRzMU0Sji/6Pdru8=;
 b=luAkTrNCTnzEWySN0P/tPiTtQ68ETuEcV0/4k3TkWrJoyZI2raRvDJNQu8n5kJ4Ac+
 DiCLUifkzr68BNoXlYR4T44Rw6IxJXlZOotLVxQwVi19mdtrnMF5OkGrbJakcyxdtHlM
 6qZWBBQwkjA3esoS0OeJeTtu4s2G+11hY965X/LGl0Lg9SIbtGRYFalo55o0jXxoLQd6
 n/z8n+cNzPhYWlMEW3oTI/+e51fFsAWbeWP4l2yAPR1FP1/UX68tRQjf94GobH7OLy2U
 t/GJkWwW/RkZeozyRaulyZZ/CIoueDzribU3yoLchqdoH7XCpzwvACfq7wS9RiAXOfPY
 0J3Q==
X-Gm-Message-State: AOJu0YzeUxH0X3L0MYrub815cWsI/r51Wg29dSqbMaZ/UtrQrkHvsZED
 1ZVl7Df7TzWq2phuI8IgHc9gKw/DG9LSF+dtcwZbhh4TNDAWpmix+8mj
X-Gm-Gg: ATEYQzx1jzR2EtB0i5YVhvETglA2t328lkXKHjazNdq1PAaZ6LkwvvGEPfqaE48bh51
 OwH8SyI0M0HPs4AQFQLUSfj9seQBmvyTs+W7N2YahE0lDIfZYCIPbWPGSL18WXZQYHP0ywK6bUd
 JGY18/g+HasUunAWmlDAeP73mpEMLq4s8NuDq7eyDphsAvfqZu6NDVadFQMb51oGTO2nynj/Xf8
 m3uCIBCa/ZYxs+3rRKiKp+l5Z/qzSq3nRDyPZSU12xTiTPcsBiM8KAFqC7ABrvsS0bcaJy74CLn
 2htAzc9336pBEc3hyq5j4+IBh5JyYeeFY3s2nzvvb5jHvW2kPATfjFwiSXrOqSlxeh0CHvpahKJ
 jP5V8zDSegG5TfWPgUT02ZLfdTNw7rUl7WWbG+dng0BD2Gx34xxbyQn0V5JGdaJTA6dfxcfSuI8
 mVxiG+EYj9pL58
X-Received: by 2002:a5d:5848:0:b0:439:bc31:a05a with SMTP id
 ffacd0b85a97d-439c800f812mr12087240f8f.43.1772727063494; 
 Thu, 05 Mar 2026 08:11:03 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b8807a4esm31426496f8f.4.2026.03.05.08.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 08:11:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] [RFC] drm/tegra: dsi: remove tegra_output_probe use
Date: Thu,  5 Mar 2026 18:10:35 +0200
Message-ID: <20260305161035.64548-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305161035.64548-1-clamor95@gmail.com>
References: <20260305161035.64548-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 395662152F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The tegra_output_probe() function parses DC, DSI, HDMI, and SOR nodes for
panel phandles, OF graph endpoints, EDID, HPD GPIOs, and DDC buses.
However, this function is redundant for DSI controllers that define the
panel as a child node.

Furthermore, it creates conflicts with modern dual-mode panel bindings
that use OF graph links to both DSI controllers. The function incorrectly
treats these links as standard panel links and attempts to resolve a panel
that should not be handled there. For example, this causes the Mi Pad
panel to fail initialization.

Testing shows that bypassing this function allows the Mi Pad to work
correctly while maintaining compatibility with other Tegra20 and Tegra114
DSI devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 55259b68c933..5fbce17ea1fa 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1594,10 +1594,6 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
-	if (err < 0)
-		return err;
-
 	dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	/*
-- 
2.51.0

