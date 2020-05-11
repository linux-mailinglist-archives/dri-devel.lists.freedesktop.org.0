Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341481CD90D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38986E442;
	Mon, 11 May 2020 11:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A610B6E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp2cT6Sztd+lVAs1QgoJEeIfB+/0jExFHYNEonzHW8pXG/SQ3ef7thbFf5oOjiKTkpzJt5gDdWrcpZVf79wXkLR/aFSHSVdfSWgj7n7+L5PLEh1URTQvZ5cDU/ztmPUvhbxbcGEdZpiq76AxvlnzHQ023W4TBio3R6INPXSNzrQC9pRGudJI6A3LcDVJ4AYtNkGKpT6Rl3jpAj+rzv2gsKLIDrvFjE8/o3f1hs3U00z6Non68JmKmAKC6nlBt4W4vDNcm8pnJuag9+t9d2QhAaiyKLCNTnvVt5zGEamElPl73ns9QZoLph9SooeVlEEDXvBogvBdl/NaqCyPjKtTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04kCC9dXcvPQIjkaulRaXK3Fs1wyUpdGGX4DjRMSh7w=;
 b=AXL7PRX9npEtext/rheUr1tAj7l0Uav5rkTIWGQXS9O42bBqTqRLIXjMfNwKUBIPpesQoOK40S6xrJKr8b/JoW10Ch/WKpv7M33q61vMpGI5RvK3wF+YwTdCMDWc3cqVtVPkYbQ9ba0xzgucEIZPuLu0KAx7n8HEjllaaAV4Dc8cCacIO3UdgX4TBpA8TEQSJQlP3owib8w6ikfqMV+1LuShmz+QUWo5v1sLozpbmKkwfRaRoTEOi91c52XmenUYTv6zo/UiSRliJyL2/jo3eYKuqjEjARrwgsRxKJfcwRL7l2QOllmcNAt78X/36ooUUQEbSm3WNx8FMyfbS2pnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04kCC9dXcvPQIjkaulRaXK3Fs1wyUpdGGX4DjRMSh7w=;
 b=Z2QzO7zJLxAfM+qDjGc94QVTdBhrafBFJbVY8gQ6iFUyW1VoDssVOAO0A6aTYF7QGKL60b1uZWQ56jiAQR/u2yasrzmHCmRfYb6926MOk56Jj2L8R0Qy1ieUpiVk66TTwgCoBZccIrrhP6egA3yXZL3UDYd/PuvuYAK/H4XoVkg=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1944.namprd12.prod.outlook.com (2603:10b6:903:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 11:55:41 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.033; Mon, 11 May
 2020 11:55:41 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: [PATCH V4 1/3] drm/vkms: Decouple crc operations from composer
Date: Mon, 11 May 2020 07:55:22 -0400
Message-Id: <20200511115524.22602-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::2) by
 YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 11:55:40 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2607:fea8:56a0:11a1::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc632e02-b830-4d65-c79b-08d7f5a23aa7
X-MS-TrafficTypeDiagnostic: CY4PR12MB1944:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1944C636DE7746083311655B98A10@CY4PR12MB1944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xorj0WWyAhI+o2X5r2LXskt1RAQcfWxGCHXsnND89j65j4BlaiQ3z/oRgovHzrIKTsmjfoA3LTRYdlcrk4ImvENPc+DhH4Szbp6/P+nFkyjXxah7UXXi6PQg1/lSE0nkay88Ym3Y6AnE1xZrtIDDTQGNK3TUY5LdG/s6NIGN/Vu6mj3uJhM8I5GmRUqBLSR+t4VEUHzfFmt69X3VcDMmz41LTccbYGqPyns8AEx+augJqYq+8N3ePkI9W9vqodwBBglndq8aFWLFBABkMkFPj1txDGhl0ju8ZYEAsWOLfM5ysVxXa/k9auB6puYnE3VtcTsyQBjiiO+A0qw1QKUB0Cyr51mNXxqziLhN6OifoaHfP4yhQV1laILL+3Gma27O8iaOQQcqLs0IUcX5tk4YTYegCLLZWZSy84XmIWNdEOMtqMXFSsm/pnxv+Hhuw6IUJbtMsa97y80UAOu6qcYdwk6W5OHO+OFFRZKVzm8YnwpMd+7jZLuWd6VHKgvjAoTs+rhR0+zrlX0Y12m+K7cn9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(33430700001)(36756003)(66946007)(66476007)(86362001)(66556008)(1076003)(6666004)(6506007)(16526019)(52116002)(186003)(316002)(110136005)(2616005)(4326008)(478600001)(6512007)(2906002)(6486002)(5660300002)(33440700001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 77uUGuralJ64/BjwLhf7az/08yuOGSxcpLYKWOLfyteIl353eCBUAaEoeuQLwp1cJJ+1BZM/waKyAs6Dbp/ncB/uia0OHO7IppIj6h+7WvUpN+spBjYgfmo2Pmc0S/JdbzB3ONY4iN3wy9l5hvL4vfOsFC/uxl02Z3EfJnF9MCiRO4EpN9Pma9fv2X99mbEo7YTICjhAdIRE6JfCkMRcglgDLaVb0zVNftUbGPjmcTGcyZfT5So9JpztJHrBp9gO1/VC3d9rMBbZ9RH1WLB8YyVB57DeeYJVjb9FV3Ig6ViraiRyycD4fyfMzW92og/gczay8zky54lGFzbjS+kjePgyuA+G8TZJRDAMSN3onVmxbESmKTdcDyw3EC3u9+XPXPjJv7dGsKTyY+tBUDYFN1cAVetsmUCWsTQzC9TbXRtMsid6jrdq90ZCciopLno44Uga7KiRcixVOkJgKvr/u+iG5WTuh9qlVB0nXD5bvkulO3ZNIvMR851/8PdtYEO2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc632e02-b830-4d65-c79b-08d7f5a23aa7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 11:55:41.5984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2H4ltU6knhKq3J0gZWIKjnMWdf449AUAZQq+nUZPY8gChYAmBlT0C/w1Ey42oKXNfBKAmO05m0Vh5v7LhM54w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1944
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

In the vkms_composer.c, some of the functions related to CRC and compose
have interdependence between each other. This patch reworks some
functions inside vkms_composer to make crc and composer computation
decoupled.

This patch is preparation work for making vkms able to support new
features.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4af2f19480f4..258e659ecfba 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -108,35 +108,31 @@ static void compose_cursor(struct vkms_composer *cursor_composer,
 	      primary_composer, cursor_composer);
 }
 
-static uint32_t _vkms_get_crc(struct vkms_composer *primary_composer,
-			      struct vkms_composer *cursor_composer)
+static int compose_planes(void **vaddr_out,
+			  struct vkms_composer *primary_composer,
+			  struct vkms_composer *cursor_composer)
 {
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	struct vkms_gem_object *vkms_obj = drm_gem_to_vkms_gem(gem_obj);
-	void *vaddr_out = kzalloc(vkms_obj->gem.size, GFP_KERNEL);
-	u32 crc = 0;
 
-	if (!vaddr_out) {
-		DRM_ERROR("Failed to allocate memory for output frame.");
-		return 0;
+	if (!*vaddr_out) {
+		*vaddr_out = kzalloc(vkms_obj->gem.size, GFP_KERNEL);
+		if (!*vaddr_out) {
+			DRM_ERROR("Cannot allocate memory for output frame.");
+			return -ENOMEM;
+		}
 	}
 
-	if (WARN_ON(!vkms_obj->vaddr)) {
-		kfree(vaddr_out);
-		return crc;
-	}
+	if (WARN_ON(!vkms_obj->vaddr))
+		return -EINVAL;
 
-	memcpy(vaddr_out, vkms_obj->vaddr, vkms_obj->gem.size);
+	memcpy(*vaddr_out, vkms_obj->vaddr, vkms_obj->gem.size);
 
 	if (cursor_composer)
-		compose_cursor(cursor_composer, primary_composer, vaddr_out);
+		compose_cursor(cursor_composer, primary_composer, *vaddr_out);
 
-	crc = compute_crc(vaddr_out, primary_composer);
-
-	kfree(vaddr_out);
-
-	return crc;
+	return 0;
 }
 
 /**
@@ -157,9 +153,11 @@ void vkms_composer_worker(struct work_struct *work)
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	struct vkms_composer *primary_composer = NULL;
 	struct vkms_composer *cursor_composer = NULL;
+	void *vaddr_out = NULL;
 	u32 crc32 = 0;
 	u64 frame_start, frame_end;
 	bool crc_pending;
+	int ret;
 
 	spin_lock_irq(&out->composer_lock);
 	frame_start = crtc_state->frame_start;
@@ -183,14 +181,25 @@ void vkms_composer_worker(struct work_struct *work)
 	if (crtc_state->num_active_planes == 2)
 		cursor_composer = crtc_state->active_planes[1]->composer;
 
-	if (primary_composer)
-		crc32 = _vkms_get_crc(primary_composer, cursor_composer);
+	if (!primary_composer)
+		return;
+
+	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	if (ret) {
+		if (ret == -EINVAL)
+			kfree(vaddr_out);
+		return;
+	}
+
+	crc32 = compute_crc(vaddr_out, primary_composer);
 
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
 	while (frame_start <= frame_end)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
+
+	kfree(vaddr_out);
 }
 
 static const char * const pipe_crc_sources[] = {"auto"};
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
