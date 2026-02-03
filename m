Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C89HJzNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:27:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C75D79B6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA0E10E5F2;
	Tue,  3 Feb 2026 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ugi2dxat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8B10E5F2;
 Tue,  3 Feb 2026 10:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BChV217sQWReQ/97QH8tbcsUbd8m9C4wHIdkA9Pu7KLxyJFPQWrU9yBN3ImUzMwe3HOoRBK+LDRzt65TnOTh5yD1QKZEbarYSiyR0Mj6BvQiJfouZK/Ts/pASUaiPvEZenQs91DkGasNyRhZa4vXawj60kHWqqBei+G1Rje9haV7Vvu9UPhGYo0yRgo7fpXGA8jiHSvFzrtr+KZptf0Ff8cU08UdfsxmbNE7Mal6mxsiUQ5rwLNebYDz7+xkOGIie0Ngnk/N7Ms8zsrKjeHnyK+BqJ35AahlAH3umzMvbhF4Yrcld5jgT+hSOemzdaNWr6UWZPSjB7Y/IE0ADLiJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qF/EYpAh5kVseG4kwQD3BXpgzi+aEW+mXTeo8FNAgmw=;
 b=bY7E13ZLqoNiw0+Uh+LInZSzlmuvW4C2SUtP0QABHGAacIT2469OyovWCurO5q3KgeRE6ME317oDxCtLhdDLa6Myn7HS8tA8PHh1OTb3mDo9XUKsbVshNnmiR5OKG2FrLqRWthIVpAF1yiHXma8W+w44BS0cn/2bY3JenphONVPy+8+cy4If4zwbpEnM+5bZNGsCH2OXSAMK65hIlycNYnXbO75g3ZCzKkXpWZu2ZTSuTpQWXcZPp+86ugPtGRryR3/WDvHP2SGxB17HTv53MkfuWY1LsoNGV5cKPz1JSrBpPkJsbHQvj7lgFtKi5o33Vp7vHkrA5ulPEfGVgzxphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF/EYpAh5kVseG4kwQD3BXpgzi+aEW+mXTeo8FNAgmw=;
 b=ugi2dxatAPTrVTn5R9QuoRYuINXdEt3Uumr2yiIJm62Db017153+c7U4qKgh0tGbyyp9Wu+u1Nxuf+sw3SXdcfHbciXhJGjKL9gxBSiY7fYRzWCnpvg9E9dwF9bV6OipvBkjgHFfOK8Tp3WIehwJ6jQ2Os8hZZ117LHksnFNQzM=
Received: from SJ0PR03CA0241.namprd03.prod.outlook.com (2603:10b6:a03:3a0::6)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:27:31 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::65) by SJ0PR03CA0241.outlook.office365.com
 (2603:10b6:a03:3a0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 10:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:27:31 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:27:28 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 08/12] drm/amdgpu: create multiple clear/move ttm entities
Date: Tue, 3 Feb 2026 11:22:15 +0100
Message-ID: <20260203102236.3456-9-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 52176f78-bc5c-4357-663a-08de630ed6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OQX1tcii7VcPkrZDvebMl3vpRWWwpfnMWI6tk5Ngl6ErzjImT7SLHCcQX4gH?=
 =?us-ascii?Q?788RzSH4nR09xBgJpP/ej2TKW1s5QdSi99K9swnXC+v+qXUIMbPJmcmILZQ9?=
 =?us-ascii?Q?qnsUXi+LURCqTUb8+to2EvxWJHTrF7tdpbeYq0FjTCLJdW4/8XdCFOmKntMI?=
 =?us-ascii?Q?LvAksZ83U6e+XCuww7wqMuH5CVdgyhx9OgKwIc1ogBb/Q6RYYAjfiam3SppU?=
 =?us-ascii?Q?xNhpAriWPS/H81wK05/RAUz+i8XLsrosiBVR7TLpKGUcaNDVv5dDNbJfu8I6?=
 =?us-ascii?Q?KDJzPPqwHVodbYL9WcZxuXirW8jy4TdOa1+iF0Ep7fkAy/AhrcS1nLQelHos?=
 =?us-ascii?Q?EqcC6iBg6dc633N+nWFt38ghP9FdEF5asQ/Y4kTkqHMeSl5o6LacMOqi+XYG?=
 =?us-ascii?Q?v37uhXMYdzKOh/TC123MOXSp/m/IuGC2q9h4scuQbd0A2H2PStfsN7QzDzrq?=
 =?us-ascii?Q?PHB+E4Cz83qmwX9bgIr9xBW+Tlw9eNuqDYVzn83p6htGqzBKrT8Fiq3923Vy?=
 =?us-ascii?Q?7025hvrv28SHvJj9+EXk5koA8uEzxt5MlGTLYXu853y4bESoC7c+vgq2ot2C?=
 =?us-ascii?Q?w5yESMRqOth81D0ub/Qbvc6aJAr3n6UTX7/TOg01mIalsRp4sIgqGMHeXqP1?=
 =?us-ascii?Q?NAv5KDFRiiS/E9ftxr3/pzzk/I0kbVyG+Po4O2QdlI8zZG5U6fXEJD2SC7Gi?=
 =?us-ascii?Q?rtcG1gxM/2HHWzW5YJ5J3HVr+z44C9M/bfJtbkzproERG62iOilTPV6Qc2Yk?=
 =?us-ascii?Q?Dj7x177Snv63hAPMLkrAlzmZaSQ9w60a80gYOHNbqvrRD/ktRkdKJPKVTSon?=
 =?us-ascii?Q?89tHIMFB2SuAxnET7mDEBYTCLse06d24Foc78jfkNwOYOs90ASNc1Ejw2R8X?=
 =?us-ascii?Q?WSdwydgJ6xVJf3HauUElLJNCZFzH/VEd4qk+fsXsgXVgi5WcBJVKg1tGBNGN?=
 =?us-ascii?Q?yFL/2WRsZHh11aDS4T++ZkTS14MnbxfLvd/c4y9qAp/OsEk0romsJzsmDK3q?=
 =?us-ascii?Q?fpDA5tQxiiW7e5k2kaTlunPIRYXpsJKjnehTkAfIgtk5G0VYdJgg5YN2kP0g?=
 =?us-ascii?Q?WiunuWq+Ya7X6GQMu+xb6OH5AgUpUgtOn7IOxfrDff2klj3Jzzev6o0yPy+c?=
 =?us-ascii?Q?N5FsRbFvoJ8rraDUR4pxgypLO+7FXLDrfzvlyEEcsoSSC0XS89/XPJZc7hnO?=
 =?us-ascii?Q?ZX3HW3/32FFzwYz4ccAAfDjcTczyT30NbmlHKX6RaORSZsw/xfOec0yDocH4?=
 =?us-ascii?Q?2JYvDg6QiqWM+yeWb2NO27gALMhGc+AExDptKWrjmmfUp9WZ/cd16NQChfLt?=
 =?us-ascii?Q?aJnfhUoZ3FUF3FoF3ZsRW+By9K5NqYpSfjsi99JDxct2PlVAHx/K7BLdFgQf?=
 =?us-ascii?Q?erZhfdYldMet9bURFYo8ztSpSK0e8V5yf1FoBsR33BnHF33fbhENvb6rKMbm?=
 =?us-ascii?Q?BRbqSeUrmq2jxkFZclb7oMZd5BqRIA9XRpmBI5XJBRB18lve8WGsaq2pr6LN?=
 =?us-ascii?Q?scUDRHlXIZjmcsY6a5SRNvv+XPYiNI3Y1jlo5BBPqzf81hH6e85+ljd1rX5s?=
 =?us-ascii?Q?LkOQu3vIf/353FARI8RE87M6jWtlyffx7dsYUUzJ9TGCSl6YRRGNO5NgP5K8?=
 =?us-ascii?Q?b+6w9u8e6SeLFmSjvYOiDZUH5KsjVg6WlT+pLZchZPbHDznl+7SpThbMAA52?=
 =?us-ascii?Q?UK6dGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ad1lpIfNJSQANgXX0LQRELuQ7+YU3eDHm6G+JZ7eht/qNejf+ksbP+nhYXOMpKDAecw9C7zyVJyqxZN+suJtXiINu8AQJ0qfYuDrKGxB8WAZHXH/lzM3lrbNLCUdOm7Bs3DeVLQMkP/VtREvk2jrmQAqfIioWa91I9hCim7oSk758k85PpdOBlq0C37JHQyj8fw9qJyZfhUseZ7L5Y1gxk6yFzbdU6vAhJT9b/JCTKU0u+O9Ua0lxsZMJuc79ptszzJ+X5ppXo4wPNyKT8fW2WaGR7G1mGIqXBkcPD1agXrar5OCs5RTREe8ok6h8O8y4ejfxm+p+U2gPxOzjs36OLMYJMvl1EEPapujXajfK8VW1QWl2VYdJjGMXAiac2ptrMD5MkGsaDOZqsnUQT3GMzUCcn1F+Emy1mtlhkGZVsJR9rvQAe/ZMfzeepgy/12W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:27:31.5155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52176f78-bc5c-4357-663a-08de630ed6bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 24C75D79B6
X-Rspamd-Action: no action

This enables parallelism of operations.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 4857b5abdfa5..b233bcc61ec0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2366,8 +2366,8 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			return;
 		}
 
-		num_clear_entities = 1;
-		num_move_entities = 1;
+		num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
+		num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
 		sched = adev->mman.buffer_funcs_scheds[0];
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
 						  &adev->mman.default_entity,
-- 
2.43.0

