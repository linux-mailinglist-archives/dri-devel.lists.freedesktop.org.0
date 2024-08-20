Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63839958830
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2A310E7EC;
	Tue, 20 Aug 2024 13:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OX0xyIdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740A110E7E7;
 Tue, 20 Aug 2024 13:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH1pF/Q4hHqZE1PE5hAygWzvqM3GFv1Dt2S9RklssoKF7dLPsFGmkC/yxx88jjrbSQDzNjvp84QYjYa6c86OKWQR2dPPvgCtexw4TWxPlV9t0OPaeehHQuWqzBJKWFSDD6NVm92uEwxF0VOfeEIw2lHVxOK8BNIGUuv9qWOQtUtj1UPPDFPmApDI+xj/QqWCzIbDQ15gNHzKa47J0xrSfBcFSTMk7UB0hMr+xOsyWllDjF5ZuFSdPf5qcQLSEp7+pAPBTJh6VQNEi0L4EEwDVQujAOsRe3WYxvTzRUrAjB9J3KT42EFvXLBzaQJOKp/wl2cNpO20CglH1luRXU7a0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV8CFl/Mg0XaUiWCBHPzonY6n9Wc/Ii/6cs8PO0gVN8=;
 b=Qx/wTuMLRWeBQoeCp9xDfw+0a0aG96isiw0qe++Bm21M4KNKF0vctjgyl/nYhpd9lCOPR2sL1oVQY9rrNxksRnjgHfkz9jnomNg/OTGxTCgFwEABmVW73aNJgcOCBGHSrw/VGKaTHxdPGw9qDLwWI6v6be8ICFK1o+E/+fdZmGM+JXFRWnJEkoLpY3hN8DuhEj1TaV95+IJ2VwPkAAKJKJlMZO9L0RCYD5ddchAze1n1oqr5lh7FGZ5Ix+ujy5rRuwNLBSe2Ry7YCm1XWbK9NCkQWEctZGETrslpnVKkB6o411J2YIaqGsFpSDf0ytGCF9Tqb2e971gcqwZV/HGfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV8CFl/Mg0XaUiWCBHPzonY6n9Wc/Ii/6cs8PO0gVN8=;
 b=OX0xyIdz0MttHExGSbK20FuUgF83a2joo//CQ88cSDS9yrM3svkYaXPaQYZo41o4s5BEoximr9/0KxtLKg7zww7HMQ+x1ve/vEFCqIlirM67z5Vb0xNIkEJzyhVyhR8D4eHfEHVV+6MB2SZhbPz3PBtmh5hcCS54jvTDZAQ1HYc=
Received: from PH7P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::9)
 by CH3PR12MB8878.namprd12.prod.outlook.com (2603:10b6:610:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 13:46:17 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::57) by PH7P220CA0017.outlook.office365.com
 (2603:10b6:510:326::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 13:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 13:46:16 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 08:46:15 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Zhu Lingshan
 <lingshan.zhu@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: [PATCH] Revert "drm/ttm: increase ttm pre-fault value to PMD size"
Date: Tue, 20 Aug 2024 09:46:00 -0400
Message-ID: <20240820134600.1909370-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|CH3PR12MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d0006e-4531-4abc-9cbb-08dcc11e76f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFFXY1c1LzVZaWJLOUQyRGZVOThTRWlUM1MzaFNCKzhhUWZTanlJcDAwRjk5?=
 =?utf-8?B?Y2FMNExqU1R1VmwyajhHLzBzM1h2aFZOYWRBSjJheVBTOEZ4ek5Ccm1tTzNY?=
 =?utf-8?B?WDFLYWw2MUN0OE9hWnFPaC9IV2JnVTJ6MFBpODhHTG9GVEZDUmorVFJlS003?=
 =?utf-8?B?V2UreGlkQnZXbFQ0akthZDVpc3UwSnZDaUt0enFXR2RacTdBZ1hXN0Y0eFFO?=
 =?utf-8?B?cFdBOG41Y1NEam1EdXd1dWZDTWMwVGN4L2xHYlQ4YWlWU1RsdDh3UldaZjlF?=
 =?utf-8?B?bm9XdHdVSUlFbjZPYm1Ta0lFTjNzYnBWOFp0QnkvUjhxbGJ0VURad0pUVWcz?=
 =?utf-8?B?ZHkxMWFyVFdnbk4zNUxnQ003RGtGY0hiNlRnRkJteXJsaHp5LzBXYlFrYW9h?=
 =?utf-8?B?b3JKME5oc0h1dlg4MVhyczlpZU44LytyZThJbXVlakN2U3NmR3ZkbU1WdXJk?=
 =?utf-8?B?eCtsT2dKSjNNVTlteVRsZExPR0RTQTl3NFA5OFZ6S29Wa0xqbDhwWjExU3gx?=
 =?utf-8?B?ODkxM0lSMktRS0hnTWEwTHl5bzBmUXJuR0EvakZPTlpDdSs0QXlSRXVhaG9h?=
 =?utf-8?B?UXNPdFdibGczYlJYNXF6WU1ReXV6TTJ3cVVnZm1rNW1DemlIWmNwUTRvekNI?=
 =?utf-8?B?QTMxc0hWRGxUVWNjL2hMbThOWVE4bktLZ2VZVTdUZnpYUEFlQXVWamI0RUJi?=
 =?utf-8?B?MitCUmtyb1BRV3pBSUM3NFVsdUVhOGhEOW5abVNzV1dzekd2WVlodHpKczBm?=
 =?utf-8?B?ME1OT2RaVUQwVkRzQmxZTzRucGs2d0lPNnBGdytrcVRZUDdaMVRGdk9uSFUx?=
 =?utf-8?B?UUtHZ0dEYWkrS1JwMzVaaEkyanI3UTd0bkZ2ZXZscXpJMVVYVm9YRjZ3akh6?=
 =?utf-8?B?ZTAvV1JlR2pER3ZueW9VUWJ4Tzc0WFE3T3U0NHY0N0ZRRzY4OXdlZXp1NDha?=
 =?utf-8?B?SW1wNGhhMTNJNlNHWHJjRU5aKzM5R0RLOGI4QVJsd09XOWRjTCtKNWhTKzVJ?=
 =?utf-8?B?TWxYV0orVTRGZk03Q0JiMUNKeHRIZkJOUjd3TmxuWnBXbVZSYUFOTURiZDVP?=
 =?utf-8?B?ZHQ2Z3g0RWN2SlA2byt3eUFoVWtNL2hBa1ZKeXZEMUt6cmthR2VreHpnakFv?=
 =?utf-8?B?VjkySHVMS2pJRVRBTm5KTXE2dCtnSXhwUERZQWR1WHlwU0EyYWd0MHhvMGw0?=
 =?utf-8?B?bUFTTjFWSnE5ekJSQzA4dUQyM01MTzAyRVNpWEtnNG5SWjJqRnNUTm53ZVlj?=
 =?utf-8?B?QlNlcnF1NWMva2dKMW9yRjhoR2xUV0hQWjZoQ2FoSER5OTY2T2ROMi9zL1VS?=
 =?utf-8?B?NEhYNjZPamR4dzlsdEd5bjNUWWNib0xmM0ZSNnNrS1ovTEl3dDZyVVN6SHJq?=
 =?utf-8?B?TjMvNm1BcnVqbVlMZ1dvWFkvL1gwMjd1eURZcytuaW0rcUd5L3F5VVUyWEtU?=
 =?utf-8?B?V2Yyd25nS0ZtcnBOd3VVd2krYkFxdWFmM1R2L0lBL0VlR2d1dzNZKytzRzVp?=
 =?utf-8?B?Y0lCZmJMS1E0UURINFFpWjNjMG1IbE9aWE1MOENjdzI0NTR6aHd4KzY0WTZQ?=
 =?utf-8?B?YktJVVFaT2dwb20yY1IyU29NU1F3Sk5GajBqQldHZXhMUlBueUZZc2l3RHpt?=
 =?utf-8?B?Ymcza2Y4U3pwNEFxSmVxdTB1dndLVTZ6SFoybFFhTlZvcGErOUtrZnF2ZHpW?=
 =?utf-8?B?SkN2QzVpb1N4YXBMN2ZpWjlLK2g2d2wvK0FkQzJQRG9qZlJlOUw0SjJiQ1Ru?=
 =?utf-8?B?VTQ4Ym43N1J6QmRrVktoQWw1b0RQaDExdWZVbzY4cEYvTVF2eEtQZzhLYUxx?=
 =?utf-8?B?VjdGTTFUaVlyZHcxUDE1bXpkQnM0SWhjYkJCR0Jjc1RWVk4zNExlZXEwSEhC?=
 =?utf-8?Q?6+VUfQ184g5p0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 13:46:16.7702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d0006e-4531-4abc-9cbb-08dcc11e76f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8878
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

This reverts commit 0ddd2ae586d28e521d37393364d989ce118802e0.

This patch causes sluggishness and stuttering in graphical
apps.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3564
Link: https://www.spinics.net/lists/dri-devel/msg457005.html
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 include/drm/ttm/ttm_bo.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index ef0f52f56ebc..6ccf96c91f3a 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -39,11 +39,7 @@
 #include "ttm_device.h"
 
 /* Default number of pre-faulted pages in the TTM fault handler */
-#if CONFIG_PGTABLE_LEVELS > 2
-#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
-#else
 #define TTM_BO_VM_NUM_PREFAULT 16
-#endif
 
 struct iosys_map;
 
-- 
2.46.0

