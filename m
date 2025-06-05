Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6BACE8B3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 05:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDE110E853;
	Thu,  5 Jun 2025 03:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d4JQ3Vye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5010E88C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 03:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749095195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XXvmdmmn1tFYv0uxxK5u4EJQqXxf5VTQjxQB6qyj6BY=;
 b=d4JQ3VyeRZbmkEPDqZC+DXYFSjA5n5u2V0agBsKtVlSmj2RkigYg4IRHWZ6oE3yIkkta41
 KDBthy0hX0dIAnvoT52npOJb1i/SYxCBeenz5QQMDkdxiRGS0gp0DvjPeqWgBQlKiI3fy2
 X97RsZRtrgnxkO5uuhKv1hHXLs6U7z8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-h8rxEJLaO1qYFezv_spyhw-1; Wed,
 04 Jun 2025 23:46:29 -0400
X-MC-Unique: h8rxEJLaO1qYFezv_spyhw-1
X-Mimecast-MFC-AGG-ID: h8rxEJLaO1qYFezv_spyhw_1749095186
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C9C3118003FD; Thu,  5 Jun 2025 03:46:24 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7EDFA30002C0; Thu,  5 Jun 2025 03:46:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 0/4] Integrate refcounting across of_drm_find_panel() callers
Date: Wed, 04 Jun 2025 22:45:09 -0500
Message-Id: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUSQWgC/x2MWwqAIBAArxL7nWDag7pKhFiutVAWa0QQ3T3pZ
 2A+Zh6IyIQRuuwBxosi7SFJkWcwLTbMKMglByVVJWtZit0bx5vxFJw5bMA1kc9CaG2Vw7FpVVV
 Dqg9GT/d/7of3/QCEmLcdaQAAAA==
X-Change-ID: 20250604-of_drm_find_panel_part1-33a2deb79256
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=1449;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rPF1Y/Lj5T3DhXlPLFMCFyqGLjxlQBeRLLgsB6ClAEU=;
 b=SeeBSMW5SkSz2m1U56oKwm8PDfWdG4toxWnKciRa8oqK8kQqUV5RtZYYVHAvOk1mvJzF3/GNs
 3m9IvhcutyHAcccJkhr85frr56vbFC+VUXRCu9sj/CoQvwuR6Se3vYX
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

With the panel refcount allocation infrastructure  merged: [1]
and all drivers converted to use the new API: [2],[3] and [4],
the next chunk of work involves integrating refcounting across
different callers across various drivers.

First patch was added to the original series [1] but later
removed. Adding it here with the initial of_drm_find_panel()
callers being updated with refcounting. This is not an exhaustive
list. Remaining drivers to be updated will be sent in next set
of series.

[1] -> https://patchwork.freedesktop.org/series/146750/
[2] -> https://patchwork.freedesktop.org/series/147082/
[3] -> https://patchwork.freedesktop.org/series/147157/
[4] -> https://patchwork.freedesktop.org/series/147246/

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (4):
      drm/panel: get/put panel reference in drm_panel_add/remove()
      drm/panel/samsung-dsicm: Keep up with refcounting
      drm/panel/sun4i: Keep up with refcounting
      drm/panel/exynos: Keep up with refcounting

 drivers/gpu/drm/bridge/samsung-dsim.c   | 1 +
 drivers/gpu/drm/drm_panel.c             | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c  | 2 ++
 4 files changed, 6 insertions(+)
---
base-commit: 685c407f168cb49a12cc703230d1e2d62767bfd2
change-id: 20250604-of_drm_find_panel_part1-33a2deb79256

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

