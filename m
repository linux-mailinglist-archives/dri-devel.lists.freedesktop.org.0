Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8315AFA7CD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 22:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB7A10E2ED;
	Sun,  6 Jul 2025 20:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="XoYrh0MH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E6010E2ED
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 20:59:20 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1751835559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSXbVhxIGkaH+o+88mv1rUZfsU9HWHbpjsI8nim4HX0=;
 b=XoYrh0MHuUA15YN3NbeMii0ZK7rpfy8BQk7Dxny/ii04+hNc9F5SyTeMCaJN1lc6hVi/eS
 lhU1YjmWTGi/Ht5900o2L2jxyuxkRPah0m+NZZGqdq8bmXd5qSFn9EnIU34BG4j5tjSibr
 WmtfmGx5Z4S//VlVnUhG1dz8OUib7evavA2z2ReMXiQk8pe/uG+NUUTz8+bKSqZOKJ6YZ7
 DPGS2dfYHsjWzNw569oggzJlWjyqPhjAT7kqLo6flMxvg8E+ZeR63e7+LLM/HzxyqIw09Q
 aqLMSA9PXnpWyU0hXvsRXmwks6CfnvJyqzcCC7uV2gk+azwjisAWDuX7oiDXnA==
From: Val Packett <val@packett.cool>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Val Packett <val@packett.cool>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude
 7455
Date: Sun,  6 Jul 2025 17:50:27 -0300
Message-ID: <20250706205723.9790-7-val@packett.cool>
In-Reply-To: <20250706205723.9790-2-val@packett.cool>
References: <20250706205723.9790-2-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Cannot confirm which variant exactly it is, as the EDID alphanumeric data
contains '0RGNR' <0x80> 'NE14QDM' and ends there; but it's 60 Hz and with
touch.

I do not have access to datasheets for these panels, so the timing is
a guess that was tested to work fine on this laptop.

Raw EDID dump:

00 ff ff ff ff ff ff 00 09 e5 1e 0b 00 00 00 00
10 20 01 04 a5 1e 13 78 07 fd 85 a7 53 4c 9b 25
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 a7 6d 00 a0 a0 40 78 60 30 20
36 00 2e bc 10 00 00 1a b9 57 00 a0 a0 40 78 60
30 20 36 00 2e bc 10 00 00 1a 00 00 00 fe 00 30
52 47 4e 52 80 4e 45 31 34 51 44 4d 00 00 00 00
00 02 41 31 a8 00 01 00 00 1a 41 0a 20 20 00 8f

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3796c41629cc..9a56e208cbdd 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1939,6 +1939,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
-- 
2.49.0

