Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC84C2FFAF
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052B610E587;
	Tue,  4 Nov 2025 08:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G3nd8pI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632ED10E58A;
 Tue,  4 Nov 2025 08:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiNp3z2KDCXU+W6li1x9D4zg8c5JKw2OaGm5FAxFvXx1tEBX30upBhk+95CMAo+GrWY7ePuPFkQLKWLqlTS0UnBfRX7RP3QCkEHbvvB35xHLjkEXOg/t5wEXk9ro+q05oXyzUsZZ9FifnkJYkTIjOjpCqLyptruzcV5bBcAqM5rIOkL5rXWVdvYCVjdWLFjIjhW2royQLTSJqJkoadax52NeLY47hx9h7hJNHPiz/Xp/Q2qe8UtKTZo+DaH2JCK9OQ0sGpyU6RuTwX/nQ4l3ME8CDjzHu+4cIKikJsaW5BJgEHEppgOi9D3K50qyV2ysIR2H1S2dAQ6nrRT56KJUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRG9v0rey5waBbHwMI6f6qH7XoZTbpm1KzC6oAG5ZeY=;
 b=kdf4XXi9vIPaJpmR7BnsH1120p8Z5l8QPsZyLD77FwYNVnz0IS/Kx8E0ZMf3oxp6toWc7+W8056va00wxrP0Y5H7X2ZYVfkSNmtVNq+fuMrUUo5nABlGjl1Bc9yLSq2271JFQ/k/GbxUtBxF9IKM6igxz3nnEHgz5jQtDOWl6+GqBdKGVa6SI+VS0YZhBI/2C4MZnl67b6hAjhE3ezAFnU/uc248fjadRFCqLN8lcr6MlItaz0Ne0ezmpZjo318sCS9ntLi3tbHkDCzr31VaaJCbq+J2ok7guz0RYgzLWeimOZrDEwrQFZcw6vrCpNh33bl5yqgsIplYMAfxG87eFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRG9v0rey5waBbHwMI6f6qH7XoZTbpm1KzC6oAG5ZeY=;
 b=G3nd8pI5z+nuH6YMG+q6uPDVqJN7m6OvhseNMEFnP0tJ8ExB+S28+0EhqXFODMuwrxg8z6y4u7z1wfdf/R/4eXPVbyLsnYV1Q6ffpa6sP+KnBmMaIfGc8LtF2+i+T2LklQ3s1iAm2QN7M6IG/uKD5OYcDYY3dF0vNuQXGizQuUI=
Received: from SJ0PR13CA0205.namprd13.prod.outlook.com (2603:10b6:a03:2c3::30)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:37:17 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::a7) by SJ0PR13CA0205.outlook.office365.com
 (2603:10b6:a03:2c3::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:36:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:37:17 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:37:14 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 20/20] drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
Date: Tue, 4 Nov 2025 09:35:35 +0100
Message-ID: <20251104083605.13677-21-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 897dc282-784e-46ce-59e6-08de1b7d5c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9lxy2IsEeFYUTs/Ft1zkMM21oE3cEraONq0XZYRC0E7QpbAkfRay+8Ke+Rn?=
 =?us-ascii?Q?fwaGGeEW1UhN6VxT3947wAGTQLYN0FaQzg6JLO1WJEA1eK/7TOZ3pmPSm8CT?=
 =?us-ascii?Q?sJUDq9DONJe9ekE2CgDz7Oope75H2Gw6fag5+fYCA3D6hQNQrrSyV40lPaNf?=
 =?us-ascii?Q?J+VJk277N3kjA2csZ5K3T7X3SHKG1uM4KQjr8WHUIJb+Z7wd5jDzMlzL2jRX?=
 =?us-ascii?Q?UBCZZkZB1RrRYUGqJTIK2Kpv6iSVdR/0fqGgIwg4mWa6Ta7OUCd0r9gJeLHr?=
 =?us-ascii?Q?sSLl6BwLZ9RQNT0cKiAJfuzpLOJls5klXufwZpBnDCVa5GpXvjQMZX4Msx51?=
 =?us-ascii?Q?XcrUDThUhfbbIswZLrejD0cf+ficbnd2yIHZRRfeC56ts/NvOu0i1pv7m0Sg?=
 =?us-ascii?Q?NJZSco0nEfAfyapRw4/cYK3DQfUolV+UES9AVOxQJmLsld8HeZMrLdhl3i+P?=
 =?us-ascii?Q?KZvaJ9Z2b+jNuZP0kiJ66VJhH/RHdPSi0r7fWCve+pciGRn2AkkwFfHQAYq+?=
 =?us-ascii?Q?VXJaDNKh0s6/KC3NPkAZ75i6ts0mEsLubqk5ML0dfIBU25+6/qHyHKpaxgB9?=
 =?us-ascii?Q?cBILtPjw21lF0R1/Syln8kkvQREahtgAZenb0ifiwV3jJEW0TDEFmR+hx+5B?=
 =?us-ascii?Q?XtKcJlyd/D8kpY8faa3w/ioduSZZO+MEPuaIyLT7ZFtfSQfbJYOfUXX1za3H?=
 =?us-ascii?Q?F3bwRHOOqzmpKbBrgsmyWoBIaGTVoIkqShLsR9zyFsZ6wHEvcP8En6Wz9fj+?=
 =?us-ascii?Q?9LUhTRTb4wKFUC7/EiIgd3yfgPang+sP/IltvAm8g6+g7yfvhpZ55lGXOtBC?=
 =?us-ascii?Q?olYXbwc6BKQX5rADxxOjuZJ/AuSkdIf8E/ClUsDzAUUgh7H5VEZ4OaEgNgSB?=
 =?us-ascii?Q?kRttfgqu2e9mwEc3WQxNJ4krWZaEUZoVA+5qRnRJsES3EC052GWKVgM0a8WS?=
 =?us-ascii?Q?Xg2u8thkt8a6zF7L5FUXTVc8Pef6ggBTUtO4aDBRvdFAErxIlH298tU7ZT0P?=
 =?us-ascii?Q?CcMahpDHPwGnoRbXxMkYlbsmPNSb0JSrj8b9itc5M/Y8NJIG6ZOYnHwtQmrA?=
 =?us-ascii?Q?wg1TMPyNMA2H8Ydo7WiKc4T2rW4M468q/E7SCmAkmBv2AFqeaOdq/xuAlpeb?=
 =?us-ascii?Q?0KMtZQO5Yz9Q+u71SbbqoSvrjj6cyDAsHh34zX70iAHbJDjU1oNIG9kEvqLn?=
 =?us-ascii?Q?x8NcYQWAFBLimIc2uFzxKXqmT/ego1Vcjy6l05UV2mHeKN+l0zFkRoGFyPKX?=
 =?us-ascii?Q?cFN192QFHswUXYcMGFBneuHqai+LJODM5tDmvVs+WeJYWzxa7QQgYGlZSukB?=
 =?us-ascii?Q?Z4lOjvO7WiEsqzuh3vh+KDcrWA0IcbpH/xtUTrDBL6bNuFIDdA5ttRzxVRwT?=
 =?us-ascii?Q?CdEJFp8ycd1brbPSoIAp01XrYdL8al5C7omaL5YiDIVwuxwDKI5ql/P6gJvc?=
 =?us-ascii?Q?AJb9dHDiyLwmr2JXdTJgIrpNulg3JKOpvmFyQEYG/zc/XwMqAnhkf5QRq6Tv?=
 =?us-ascii?Q?WdrJLrMCaZfeWPQ/h4HjO/Q9r8Rsy8CMOBC1xI9wBXhk0LgH/VRcNU0FsfS5?=
 =?us-ascii?Q?xnpIxxNQ6YiMvT6hLIc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:37:17.0188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897dc282-784e-46ce-59e6-08de1b7d5c98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306
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

Makes copies/evictions faster when gart windows are required.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index b685bf207e43..82276eff511d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -38,7 +38,7 @@
 #define AMDGPU_PL_MMIO_REMAP	(TTM_PL_PRIV + 5)
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
-#define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
+#define AMDGPU_GTT_MAX_TRANSFER_SIZE	1024
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

