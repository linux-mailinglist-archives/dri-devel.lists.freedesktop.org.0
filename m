Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748077E5B6E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CA110E7DA;
	Wed,  8 Nov 2023 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED0E10E7C0;
 Wed,  8 Nov 2023 16:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWMJzJ4aPiMhJY8KGLW9OevgCZ1qO+0vC6hRghKEqxZ3cHdMtMEUjIXM7OmmkywqFZP5q/aXGQt1UZPbU3nHkQt1P1WPqkISGhspNJZ2bf783zF3OI9Lhv4S4X0Tl/1wIg1TrwFjEKK9Hw5WdUFtI6xAgcSvVpN3J+moePCVE29xBtZ1+YdCCk3j8ocaBxnCUiYB9aee0JXcNuyDW96Yc625Wammg193Kvs5Mvbnkpb9rvbA5G8d0OA5YvUHM0boZoreZS6M0lZMAEq24InQS3uanUbPGoC/afTt7K1HoD4J29ZEs5xvSu73frRbfdqVPwgnJgI6EOBmbn5g9dqmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF/XnjsZiHDaovEZdujrwGKTIQydye/r25NJg6OvIVI=;
 b=nJBDM+4dPQNUaBEj4ubcVExoiZBgnl4fkuDdSsMlWMB4a8UAj2xAVWDb/VJ2IxKjtgc8tTLGg7/0471SW3bq2fIV7jNuc6g28TozxsP5lBP/Z3mwnW1ZqzvTvoRtb6a6e8+u+P7CSEA7wL4fFoLzKVhgwsWwpOH8G77emQzb5DDfKJ9SFJJ5JmBP5O7iBCc+qDKwu/Rz6Q3mvUrYRCuL6UVbpOrnGFSc8nByrvbtlCHsuQuaDUTJ/B3jW/pDhgWDWIXYA/hlotqyKgi93wKOstvYO1bXGkB2RAI+ds5t4mwkPTKzS40xlDO2v7wFVnVy0ax+ZPdXK/dwlXkzqOZrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rF/XnjsZiHDaovEZdujrwGKTIQydye/r25NJg6OvIVI=;
 b=JX6LtHSnoOG8/v2gkmZPtItUeBih/qP3PqzKW2eZWs8qL0Rg0m7p0cIDNtot8O1DSCZKtBoBvbcndnnV9I+YmWPmS7cGGqzxP7AAfBD0cIhu8mcqjWHyTiVCbjnWfq8nHIHb6k61DpIa1jcfv8DMqIIXThGFO9dcbM+lFebA32w=
Received: from DM6PR07CA0131.namprd07.prod.outlook.com (2603:10b6:5:330::19)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Wed, 8 Nov
 2023 16:38:02 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::93) by DM6PR07CA0131.outlook.office365.com
 (2603:10b6:5:330::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:58 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:57 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 20/23] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Wed, 8 Nov 2023 11:36:39 -0500
Message-ID: <20231108163647.106853-21-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb9399f-ba38-402c-f7f2-08dbe0791391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtS5xDeCXTxFIBVkoJNtc96KSYzCuYbkcfjYmU6oykPpiHMIC4WoEB88pJ2SDJxGPgT004/yIyr9nXImElVce8yLKjbCQD1mX7ddNUBBMxHJAW5ypozLpo1zGo9J9ELk+9b4fPjs6XgoLjf8fA7121VmcCYkPTan0Q7+Xf0X1Bd0Ivg7K2hD1n+il8c4rt379fezdpWI8Nc/9eZqdOmUsgAsnf+sZEhDlaBDYfomv13UkHrN4Pu0JZRiUpR1JhOV9zoS5UeKXzu+d8gVZVU5RbO/JKY8aN/n9gvBfJZd52iFHvhNL2aTUvxA4/RgWAiX3ZGLszU1qTPI8cljqJdhOlNv39yN/uwuajFu4V6g7au0iREscP0/GwYrry/APbY9lV5pj6Mni7/+K4SIkTnAthUDbAnNoZVCT4OgjMjrMbloO2lUO70mfxiJYu3s0gBiT0J9c42GGvl/XiQbIJpgNSHynHmbmQ4qIoY3UPSO4qwwXQ9Wq4UJnR9mKxUa6IPFjpdhhjLFawXd+OJNhFjjSXQ/4mjG7iI6tUKUuEQk4OdM2Q5Y5df/XbWrUPMGl6c0/x/3IFtYf7zr6qDCpEQDTtPRqY+ngMsvS2ddxg63QgQgwJeCe7Dic8yVXe4tzJCFBy9yu5S+qzqhC0JxpaLuSxzrRlbjhROnnJ2/L4D64VghRgChzfIvwnDXQoFfXUIavQwGAd3XFQfqiSKPUxmKqlv6cNLpm+DsDrAMX3g5bSaBnVFS8gSu+EwarG+stdfXDhwx8U2AiJ7vOM5HYIBctQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(2616005)(36860700001)(2906002)(316002)(54906003)(6916009)(26005)(336012)(426003)(70586007)(70206006)(47076005)(4326008)(5660300002)(478600001)(44832011)(450100002)(83380400001)(8936002)(8676002)(41300700001)(81166007)(356005)(86362001)(82740400003)(40480700001)(1076003)(6666004)(36756003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:02.5961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb9399f-ba38-402c-f7f2-08dbe0791391
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Certain operations require us to preserve values below 0.0 and
above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
such operation is a BT709 encoding operation followed by its
decoding operation, or the reverse.

We'll use s32 values as intermediate in and outputs of our
color operations, for the operations where it matters.

For now this won't apply to LUT operations. We might want to
update those to work on s32 as well, but it's unclear how
that should work for unorm LUT definitions. We'll revisit
that once we add LUT + CTM tests.

In order to allow for this we'll also invert the nesting of our
colorop processing loops. We now use the pixel iteration loop
on the outside and the colorop iteration on the inside.

v3:
 - Use new colorop->next pointer

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 55 +++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9010415e4bd6..d04a235b9fcd 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	/* TODO is this right? */
 	struct drm_colorop_state *colorop_state = colorop->state;
@@ -191,25 +191,54 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
 
 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
 {
-	struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
+	struct drm_colorop *colorop;
+	struct pixel_argb_s32 pixel;
 
-	while (colorop) {
-		struct drm_colorop_state *colorop_state;
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
+
+		/*
+		 * Some operations, such as applying a BT709 encoding matrix,
+		 * followed by a decoding matrix, require that we preserve
+		 * values above 1.0 and below 0.0 until the end of the pipeline.
+		 *
+		 * Convert values to s32 for our internal pipeline and go back
+		 * to u16 values at the end.
+		 */
+		pixel.a = output_buffer->pixels[x].a;
+		pixel.r = output_buffer->pixels[x].r;
+		pixel.g = output_buffer->pixels[x].g;
+		pixel.b = output_buffer->pixels[x].b;
+
+		colorop = plane_state->base.base.color_pipeline;
+		while (colorop) {
+			struct drm_colorop_state *colorop_state;
 
-		if (!colorop)
-			return;
+			if (!colorop)
+				return;
 
-		/* TODO this is probably wrong */
-		colorop_state = colorop->state;
+			/* TODO this is probably wrong */
+			colorop_state = colorop->state;
 
-		if (!colorop_state)
-			return;
+			if (!colorop_state)
+				return;
 
-		for (size_t x = 0; x < output_buffer->n_pixels; x++)
 			if (!colorop_state->bypass)
-				apply_colorop(&output_buffer->pixels[x], colorop);
+				apply_colorop(&pixel, colorop);
+
+			colorop = colorop->next;
+		}
 
-		colorop = colorop->next;
+		/* clamp pixel */
+		pixel.a = max(min(pixel.a, 0xffff), 0x0);
+		pixel.r = max(min(pixel.r, 0xffff), 0x0);
+		pixel.g = max(min(pixel.g, 0xffff), 0x0);
+		pixel.b = max(min(pixel.b, 0xffff), 0x0);
+
+		/* put back to output_buffer */
+		output_buffer->pixels[x].a = pixel.a;
+		output_buffer->pixels[x].r = pixel.r;
+		output_buffer->pixels[x].g = pixel.g;
+		output_buffer->pixels[x].b = pixel.b;
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 2bcc24c196a2..fadb7685a360 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -36,6 +36,10 @@ struct vkms_frame_info {
 	unsigned int cpp;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 struct pixel_argb_u16 {
 	u16 a, r, g, b;
 };
-- 
2.42.1

