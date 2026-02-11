Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMv2IcShjWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4B12BFF0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B49510E710;
	Thu, 12 Feb 2026 09:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="QHbm9aT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78510E656
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgsAmmIX7cXBEdEbANdfSN83M5QC2jzrjPLyp8rTtfubjPx/DznmjStmB+5mPec1RSv2goU7yAw7LjYZAzx+Dvfdu/XlvIbrGOC9IVl6UrukszVYLmIl5nm5a6G2EDZ9dTsFekuH9VFvZTqu/b9x9GzkYm9ppfNEx2/8qoDXH+R7ALDsPy86VybpJkYkQEKeYBtGeYPm7X3amIqCN0+gTUeRG8e6EUpNSAOajOPBXu42pwkIgCay688r+Ly06c0vuxR9RlmwpYFGq4J58SNhYjPm1XidJQz6BWArrqvXoPfQhZfdsVm/TaCvRqMh9srfxyuapz3nRvuNeuS/DzSQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbJUOvujQYryVW1tr3nzgCuIr1WS5po8jonJ4E59XR0=;
 b=P97nnW379Punm8NJJBWHNjAWXZDdA3g3v+wyXtJcIokfoycm6Dvp6LufH3rMG+5hiX2/uodMriJTv0GtW4TmXrAU6+WKDeKjOjO/YiVLFZy4Dz0LolkiNGAm22YbVvHorwe0jqs73MFRlvfIoSWQW6f5o6i0howzwUJ2EvpmioIDZB0F0hKSNrHUbWMmqmehctxa4jX99wMOTJjyujYrWkx4N3h0GjBl6ze73ZX5zx7BN5JT091q8vGuzaj0wgVtvVLnQeSTZTG+GRtG6/R0MU58yIESb2ddfh4eu9kkmWgX+ItG8tG5qJRCFMMvJaeOwsVtFPmFPPwBcoB7hZ/1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbJUOvujQYryVW1tr3nzgCuIr1WS5po8jonJ4E59XR0=;
 b=QHbm9aT8jeufuNrbMmPY24cyB72AY2a1IwP5zI30xO9ze2L5HeF//k2kJcHaxAwt1D5NH43dNZt+a6uKWPxqwOdlKv8dThwv2+W+Pw4ruKx2qlaABauk6xv2XZs0XgCd8rNTazg/YEygiYlIzoEYXsYwTGJNtqn0it5Oxc+1AmY=
Received: from MN0PR04CA0017.namprd04.prod.outlook.com (2603:10b6:208:52d::10)
 by DM4PR10MB5968.namprd10.prod.outlook.com (2603:10b6:8:aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:10:44 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::6c) by MN0PR04CA0017.outlook.office365.com
 (2603:10b6:208:52d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Wed,
 11 Feb 2026 21:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 21:10:42 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 15:10:33 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 15:10:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 15:10:33 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BLAXeN2306484;
 Wed, 11 Feb 2026 15:10:33 -0600
From: Sen Wang <sen@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
CC: <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>, <r-donadkar@ti.com>, 
 <s-jain1@ti.com>, Sen Wang <sen@ti.com>
Subject: [PATCH] drm/bridge: sii902x: Add audio context to suspend/resume
 routine
Date: Wed, 11 Feb 2026 15:10:18 -0600
Message-ID: <20260211211018.149916-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DM4PR10MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f18dc6-f579-40db-8731-08de69b20451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?npx/2NUVT7hVQitDEUiAfCk4r3qLcuIaIu07ivVk72EcS2XYpqlA8QVx4lyu?=
 =?us-ascii?Q?zmbPdx51VILt4KDJJAMJ3zYuE9DjLtryaXC+moGMvIJYjApUG7tccNm6vtAx?=
 =?us-ascii?Q?ksuBKDRAcUfyFH5m8pNnVe7wQhMuRj1qFF9GTu4aSuG8Ae/ELc1f2I1KqYq6?=
 =?us-ascii?Q?oUTEHKhTR7M3LDvouFNeiI8GBN4W3lXloaOCl68Pwm156C/B+emI/d9CpD5o?=
 =?us-ascii?Q?SM+qKHch00HhDkqlW4hG/ARbgS5QdSmyJ0HFbMxosEdzWBQ/0zNcSUdg3E2D?=
 =?us-ascii?Q?Gd8y+RMV7wgvPaYpGu6tmLh+5CYpDChHl+RAHGxz1WihjFT06MfQRG5QqQpx?=
 =?us-ascii?Q?8lfOfobObcGo3cHAzYQVsmQ73n4a0o7F3SYRyqW5sBNSz5PTyJDFF+AQ99hu?=
 =?us-ascii?Q?t+v0DEF/EH2drX/MojIHdzcbRMNueRQG/a0wRi+reBJgp1yC3LhfhOKpjIQq?=
 =?us-ascii?Q?Uxfs9B2QSE0W4HO778pIPd4OIfi6Ww2pRk75ugwex27w7lpqdTvrLxc+3y2h?=
 =?us-ascii?Q?tLvsgJrCYeLCGgOhPKo22ws+UXo4j+K0DukYvF1agqgXSF11I2+VCXcvABUN?=
 =?us-ascii?Q?vh8ns10cog/ER1umKBpa9+aU1lKamOp+07CN6Zy6bCSyznGHcUggoElaRnIi?=
 =?us-ascii?Q?QaKvFddhIa5abw+n3W/vaqrNLJHFivmSZhU0Kdry5A6V1V7iUOtky4zkiIDW?=
 =?us-ascii?Q?QvBQ0WXwccSiRdmae2telYOeKC77RrQWQoNWAdkkvJaQ/1RVMCozfYjRd+A0?=
 =?us-ascii?Q?ONnUXqDiJ1FYhT9pqJoDW9s45Bm3nLdnKssIcmTkT2sOgw1RgHQdvUog7qdw?=
 =?us-ascii?Q?1fk7LFv0OaiL/eAv05vJhI73K1xASuSHEH+puDL/vU1RSor+5CK7XPN8p8wZ?=
 =?us-ascii?Q?VGfodxyQE8a8psU1/yHjcj7tfdv4OEZsG+9U1mzQAs9fBMwLQ8No1HCsY76Y?=
 =?us-ascii?Q?NAFc+nnZqFoEywD86akY2qbF5raXQbRjDjYzj3hlTLTbgmYFUY9A7kn0z1kd?=
 =?us-ascii?Q?a6DD90F3aE7PGZkLxki2C2wAtD50f/Rz8Doa2rlopdvWuUSp7pe8Du0jADeb?=
 =?us-ascii?Q?bVTEY65BCNc51jUMNuyVsLd1GRzsGrVVeoqzApiWWnVQtSdK2RW56SfBlY6A?=
 =?us-ascii?Q?1X/Ky7NDb8Du26W8MskcDMHIEHnFKWwPUPu5gtOevuPr0zT/SrDGmmLuVTWP?=
 =?us-ascii?Q?zMooi2hAakEZT9QGxy/muYiSdauW9qO6e5k7JdB0h1GB2ajPLrifXpWAeu2U?=
 =?us-ascii?Q?9GiHRjSDA9elBCypw/7cZ2hzNRFCeAb68VAvIu9ORqM8A0H796cWUFLEWLoC?=
 =?us-ascii?Q?pk5/oeZKP25ZdB0qcNltBdeTD5WAhcy4Cc9VUifUt/N1vJ33h886Liq/zewQ?=
 =?us-ascii?Q?2NO5DMInKewn3OnidZ5Iluv+ZBhF9AcCuXmKpJxuGGBPlRXeP/QOjQeExQCG?=
 =?us-ascii?Q?OokFcSLdcexhoicir6p0kFtjNcNzlvKlIHYVlA/LVhiyNFOBDlN8Z3UynQiF?=
 =?us-ascii?Q?SbliifWfXYwr0ro90YVL9wMhKrFJibCg9Ilzq5j1D8uTPjkAAZSjbNmBJxu0?=
 =?us-ascii?Q?lMsFx5xsN0BR3tKqAp0J9iFRih+Z3czbOvGmmhNand66dJ7PCxrFykrKh6ST?=
 =?us-ascii?Q?bCWH/CHmAsG4/VbjLhbNsA36DGhZU6jCvDZlGKAgVpHH86ZO970WWBjF4x0H?=
 =?us-ascii?Q?q9daqZNqIQJHjlL3FoGJyv/HlG8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q15JxF4UJHl6hi0vz6qU4+jkdvkPa2VUdQLP0p683eEtoHKgAuB5UuwI2vgWYNZf0f6NzaZKibPyk+A4k+BCxrY8JODNK0Q8EPWTwgcc5so5V3vA5R8MVcGqfLQbjcqe/N1KFZyrNMSUi1mJ0zRrBacdIw57kl3dNsB2B9EKzuTGsycUPASj1D+LAdt2ZQG90mFkbNjQaD71XC24AJtGfZzlyy3iGNeBmhCLuRsfhv2wk0L4M2D60DpoRyVagbiNN/Iuv+H6uOeBqfNCPvRLBudwV24w96pzVlrbvnJ7F5c+57QRj/azPZdYazmA2iLEhCAtHXMQ90YWcdqk20xDmSjwF7jPMs7KiKiYRe3Px6MShSHw0TMoqs/yeficZBlH0+31cFCkSL2tXGf0ySRJEavM0g+jecXRWAX+Dgr2XAm/go+09ulIoWat5rUr0QSe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:10:42.9495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f18dc6-f579-40db-8731-08de69b20451
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5968
X-Mailman-Approved-At: Thu, 12 Feb 2026 09:47:42 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:airlied@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:jani.nikula@intel.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:devarsht@ti.com,m:r-donadkar@ti.com,m:s-jain1@ti.com,m:sen@ti.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,gmail.com,linux.intel.com,suse.de,lists.freedesktop.org,ffwll.ch,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[sen@ti.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sen@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9FA4B12BFF0
X-Rspamd-Action: no action

The sii902x driver has existing suspend/resume handlers that save and
restore video-related register context (TPI mode and interrupts), but
these handlers were not saving/restoring audio configuration registers.
This caused HDMI audio to stop working after system suspend/resume cycles.

Therefore add audio-related register context to the existing
suspend/resume handlers when audio context needs to be saved/restored. As
well as mclk for the sake of power saving, in the case of sii902x being
the frame producer.

The audio context is only saved/restored when audio.active is true,
avoiding unnecessary register access when audio is not in use.

Tested on TI SK-AM62P-LP board with HDMI audio playback across multiple
suspend/resume cycles.

Signed-off-by: Sen Wang <sen@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 91 +++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 134657041799..fd38a6ae86b2 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -192,6 +192,13 @@ struct sii902x {
 		struct platform_device *pdev;
 		struct clk *mclk;
 		u32 i2s_fifo_sequence[4];
+		bool active;
+		/* Audio register context for save/resume */
+		unsigned int ctx_i2s_input_config;
+		unsigned int ctx_audio_config_byte2;
+		unsigned int ctx_audio_config_byte3;
+		u8 ctx_i2s_stream_header[SII902X_TPI_I2S_STRM_HDR_SIZE];
+		u8 ctx_audio_infoframe[SII902X_TPI_MISC_INFOFRAME_SIZE];
 	} audio;
 };
 
@@ -764,6 +771,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 	if (ret)
 		goto out;
 
+	sii902x->audio.active = true;
+
 	dev_dbg(dev, "%s: hdmi audio enabled\n", __func__);
 out:
 	mutex_unlock(&sii902x->mutex);
@@ -786,6 +795,8 @@ static void sii902x_audio_shutdown(struct device *dev, void *data)
 	regmap_write(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE2_REG,
 		     SII902X_TPI_AUDIO_INTERFACE_DISABLE);
 
+	sii902x->audio.active = false;
+
 	mutex_unlock(&sii902x->mutex);
 
 	clk_disable_unprepare(sii902x->audio.mclk);
@@ -1081,7 +1092,7 @@ static int __maybe_unused sii902x_resume(struct device *dev)
 {
 	struct sii902x *sii902x = dev_get_drvdata(dev);
 	unsigned int tpi_reg, status;
-	int ret;
+	int ret, i;
 
 	ret = regmap_read(sii902x->regmap, SII902X_REG_TPI_RQB, &tpi_reg);
 	if (ret)
@@ -1109,7 +1120,62 @@ static int __maybe_unused sii902x_resume(struct device *dev)
 	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
 	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
 
+	/*
+	 * Restore audio context if audio was active before suspend,
+	 * in the matching order of sii902x_audio_hw_params()
+	 * initialization
+	 */
+	if (sii902x->audio.active) {
+		/* Re-enable mclk */
+		ret = clk_prepare_enable(sii902x->audio.mclk);
+		if (ret) {
+			dev_err(dev, "Failed to re-enable mclk: %d\n", ret);
+			return ret;
+		}
+
+		ret = regmap_write(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE2_REG,
+				   sii902x->audio.ctx_audio_config_byte2);
+		if (ret)
+			goto err_audio_resume;
+
+		ret = regmap_write(sii902x->regmap, SII902X_TPI_I2S_INPUT_CONFIG_REG,
+				   sii902x->audio.ctx_i2s_input_config);
+		if (ret)
+			goto err_audio_resume;
+
+		for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
+		     sii902x->audio.i2s_fifo_sequence[i]; i++) {
+			ret = regmap_write(sii902x->regmap,
+					   SII902X_TPI_I2S_ENABLE_MAPPING_REG,
+					   sii902x->audio.i2s_fifo_sequence[i]);
+			if (ret)
+				goto err_audio_resume;
+		}
+
+		ret = regmap_write(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE3_REG,
+				   sii902x->audio.ctx_audio_config_byte3);
+		if (ret)
+			goto err_audio_resume;
+
+		ret = regmap_bulk_write(sii902x->regmap, SII902X_TPI_I2S_STRM_HDR_BASE,
+					sii902x->audio.ctx_i2s_stream_header,
+					SII902X_TPI_I2S_STRM_HDR_SIZE);
+		if (ret)
+			goto err_audio_resume;
+
+		ret = regmap_bulk_write(sii902x->regmap, SII902X_TPI_MISC_INFOFRAME_BASE,
+					sii902x->audio.ctx_audio_infoframe,
+					SII902X_TPI_MISC_INFOFRAME_SIZE);
+		if (ret)
+			goto err_audio_resume;
+	}
+
 	return 0;
+
+err_audio_resume:
+	clk_disable_unprepare(sii902x->audio.mclk);
+	dev_err(dev, "Failed to restore audio registers: %d\n", ret);
+	return ret;
 }
 
 static int __maybe_unused sii902x_suspend(struct device *dev)
@@ -1122,6 +1188,29 @@ static int __maybe_unused sii902x_suspend(struct device *dev)
 	regmap_read(sii902x->regmap, SII902X_INT_ENABLE,
 		    &sii902x->ctx_interrupt);
 
+	/*
+	 * Save audio context if audio is active, and
+	 * in the matching order of sii902x_audio_hw_params()
+	 * initialization
+	 */
+	if (sii902x->audio.active) {
+		regmap_read(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE2_REG,
+			    &sii902x->audio.ctx_audio_config_byte2);
+		regmap_read(sii902x->regmap, SII902X_TPI_I2S_INPUT_CONFIG_REG,
+			    &sii902x->audio.ctx_i2s_input_config);
+		regmap_read(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE3_REG,
+			    &sii902x->audio.ctx_audio_config_byte3);
+		regmap_bulk_read(sii902x->regmap, SII902X_TPI_I2S_STRM_HDR_BASE,
+				 sii902x->audio.ctx_i2s_stream_header,
+				 SII902X_TPI_I2S_STRM_HDR_SIZE);
+		regmap_bulk_read(sii902x->regmap, SII902X_TPI_MISC_INFOFRAME_BASE,
+				 sii902x->audio.ctx_audio_infoframe,
+				 SII902X_TPI_MISC_INFOFRAME_SIZE);
+
+		/* Disable mclk during suspend */
+		clk_disable_unprepare(sii902x->audio.mclk);
+	}
+
 	return 0;
 }
 
-- 
2.43.0

