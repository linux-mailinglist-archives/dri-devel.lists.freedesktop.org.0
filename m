Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B837F9FA9D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 05:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6010E236;
	Mon, 23 Dec 2024 04:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0hJQOgkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516CC10E236
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 04:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sg+Dup895G3hLhY+skaqxBMcUsXdMf2N34B4AYMk5vDhcnPd2do7vf/juVfG90T6h/H79ylPNZHAyI8PidD5QEmsP+fN+ZQyMTVw6b8qLKmWJ+6PFRekLP8aESMSSKefqX5VUkNylk2jaRUuUxq4Quur4hLSThVBrNEwhrav71cFunIUWL1Asf4PTpSqfNIB116mPs8WwZd2KackvU3U3lwXTHHzO8RulDuUiZdy6f5w1t6MqQYwpefINOSvUkTI3peyIfHAXlS5tOE/GQqR6LAoEFU8QkyYPXHSvOG2I/rVl5ekzgcsx7TWiXxg1O+R0fLiuGaBwHzcxjO9NIVsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNcaGbtiRNDJ8yqfZGrlIASRHHZj4/FqW2ee/DSy0Ak=;
 b=XXz+RcH1cVZckJ7N924oNZrIcMCQB7J01IUYtLoUUGlOPoy/VFlIvdZF66YwlyDcw7GxnbbG97GJOzVHe4crhTupeGmA8WJcxE6k5zgNyHpdW/+WAGwg8mRf8A4KG2OJWBe2FXGl3ndqFdic2Ru9otpltogNPNH4mWrUw1h5KwowtrIIPetAGxjXec4akkWyphmHQzh52jkOBvY8ibOW2DToBMZH4gfWP6fbKHRaumcjxVAc95+r6oOhJocwnwIcWHOp+wIr7WThpIS9VF5ldpKNzsNooesGAbV5286wWwNwzTdH89y3cjGBmmtmNV6HWjhneSwd5AMqTJzLLaWu8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNcaGbtiRNDJ8yqfZGrlIASRHHZj4/FqW2ee/DSy0Ak=;
 b=0hJQOgklPQ8nyrzkTuDItkQT81jKLJTdbYN4rnCEUIchfosJ1SBiFgd8EbbCzMwNQDdZyn5G8E8c0Vh+TIHWHvHg2QNglBqAf2vaYGZ9ppQ2QIUytu1JvQCWGrhwZKbZccOe8+r8RBVMhXwh0CQyo6mIlNXhFRj0rV6fLfNLzmA=
Received: from CH0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:b0::12)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Mon, 23 Dec
 2024 04:07:33 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::c6) by CH0PR03CA0007.outlook.office365.com
 (2603:10b6:610:b0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend Transport; Mon,
 23 Dec 2024 04:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 04:07:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Dec
 2024 22:07:31 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 22 Dec 2024 22:07:29 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, <hwentlan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v2 0/2] Fix drm RAD print
Date: Mon, 23 Dec 2024 12:07:24 +0800
Message-ID: <20241223040726.3985676-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 984a90b9-1235-42bb-39c2-08dd23075353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGtUbzJBK2pueUxPalVVZjJGRTcrSFE4MnhQSnhXdDBJN0ErQWtjbVhmM2VM?=
 =?utf-8?B?MnJ5Z1Rpb0JiNVFkVzJVWGJIc28rYjlXUC9sYnFHNVdLQVdnZzdRRzBhQm04?=
 =?utf-8?B?ZEtYU29NbC94cmFkMHJVSjVIdkpuTkVXYnBtQWJYTmNTRjA3MDZDc0xSZ2VB?=
 =?utf-8?B?ZEtqN1JoWW5NdzZSQUhKNlpKK09adEpUN3ZhTE4zMVJDcHluNDVQcWtwTXlP?=
 =?utf-8?B?cVZ3Y2VqTzVaRWdocDI0VlpJa0dib3B2U1lvNDV4b09xMkp2Q2hOK3NIKzh6?=
 =?utf-8?B?Q1JPWTZYTnFUcHM4MlZWMnpCRTFBTW5zN1VUTmdwRW9MbnJtY3ZwMmZTQklh?=
 =?utf-8?B?eERDUUxjVlBoc2oraU9pOXh3SElVVEtxS1p2cWY2dHVoN1g0TlBzclRFd1Fw?=
 =?utf-8?B?WitnZG53M3pyQkN0SjBPK0lGMXlKdHpXbEhIVHhUeUpwVnZoejJuSXU2cm1h?=
 =?utf-8?B?aSsxZFUwSktKT2EwSTZhL3RrNHZTaVNyMnEyam9LNi8yZCtrcEJsajUvdjM3?=
 =?utf-8?B?cTdMbEc0QWRVMHp5bnNqWW5GT21HUzJsaFRXYW5mMXh3SzMxd2g5SmQrUVRt?=
 =?utf-8?B?cjl0QU4yT1lRdjFNQzY3MjRhNDdKRzRJTnJPZE43bGUyZ2tEaVZJZjBtZTNz?=
 =?utf-8?B?Mm1YRkFxNmlVRmtSRGhGeXl3OUkwTE5Ga2I0VjB0TGhpMUdHTVM2QjRsaW9i?=
 =?utf-8?B?YXpieklWdVJ3NGQ3alBZUlpucmxRZzArV1l0NkVyZ3I4ZkRncVE3dU9jSGxP?=
 =?utf-8?B?WlFuZ0dOSEcrSXlCcVdNcWZsTytxci9BZ3ZMejNId1NZeUtxYjE1UkxkZmRs?=
 =?utf-8?B?MFczeHNLT3NhcGdkUSsyWnRMa09OblRiVFRHem4waFJZOGliTm1za0FOSE94?=
 =?utf-8?B?dnl1Yy9pMDBVNU4vOTdKRFgyN0hSRDhpWEQxZ080aGZkQUZZN1BkSnVoMmZP?=
 =?utf-8?B?N2x2YTdydXowbmNzUlRZZ1gwMkJmZ2dCajltV3ErSHoyVnR2YjBuR0luMHV1?=
 =?utf-8?B?YUlrenI5MDlObDFsQ2V4NGY2WFVRMlRjVTNaSGZxRmhpTlFrT3I2WHRJeVNj?=
 =?utf-8?B?bzR3T2VLbTZ5YlVPcDh6dVZoRk85WEY4UzZ2ZUdVdEJHeERhdXc4V0RFa1Jh?=
 =?utf-8?B?cktXTnBDSm1wYU5jMkNOVXRZMGZLTVdYOG44MlM2d2FMdHR1VnJBbWg0aE1n?=
 =?utf-8?B?TFVpVXZBcHc0aTB5R1IxdlU5VWM5WWdEYXBBbFlobm8wV1lRWVh3ZDU2V2Zz?=
 =?utf-8?B?S1A4MnJwQUlYTWIvMkVPOWFHaDdvVzkzY0RYc2cwK0J0M2dVM2dNZmw3SHVY?=
 =?utf-8?B?Q24ya01JMFhlaTdwK1ovdnVkTUlvcnlwZFgyQ3Q1cVZxQ0ZjLzh5Y0tONHYy?=
 =?utf-8?B?WXVFYXVHRGNCbmhwUjVqdWJaMGgvV1h5UTgwbmdMbEE0SksyUnVURWU3b2ps?=
 =?utf-8?B?RGdOYXcxU1FIaEVoNXdvS0lLVjQ0M1gyYWwyaTBXV3lNRWptdnhZOFlZWmRE?=
 =?utf-8?B?WkhhVm9QUnZpUFdNNm5rdHF3SkErU3ZhaUVHcmJYOXRZWWZBTUJUaWMzWk5t?=
 =?utf-8?B?QkE4b3lyYUlML2gyRTA2MVIxaG8wVXducCtPbml1aEx2L1pvMm5pcnVxWXlk?=
 =?utf-8?B?MFNFMXdXK1NacUNROWlFenczZ2NuakJ1NDVseStqZWZ1a2h5bFFQc0hxQnJU?=
 =?utf-8?B?Q1Fhbk9GT0VNOTY3WDJ4Q2pUdmVEOUh5cUF1VXBMcU8vWnFFQlhJOXcyZmNK?=
 =?utf-8?B?eVpMYUIyTVNvUGthUUp2Y05zZmJHaUZiVzZjZzdmRjZVcGJIajA0WmlOSFg3?=
 =?utf-8?B?MzBtUkxkQlFad1dlaUMxeTVnY2wzTU4raWtwVnhIVmNJcDBWRHI4M3BLNkd0?=
 =?utf-8?B?WktvWFFORGVaUlF4OVVUN1ZDekhtM1RpQ09ndVJhZytnY0JEdmQ5ZDRSUENa?=
 =?utf-8?Q?Vs3NWSZKdsA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 04:07:32.5091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 984a90b9-1235-42bb-39c2-08dd23075353
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054
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

This is v2 of [1], with the following changes:

- Document how RAD is constructed at drm_dp_mst_branch::rad[] (Imre)
- Add a new helper drm_dp_mst_get_ufp_num_at_lct_from_rad() which can
  be leveraged by drm_dp_mst_rad_to_str() and
  drm_dp_get_mst_branch_device() (Imre)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>

[1] https://patchwork.freedesktop.org/series/141832/

Wayne Lin (2):
  drm/dp_mst: Fix drm RAD print
  drm/dp_mst: Add helper to get port number at specific LCT from RAD

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 32 +++++++++++++------
 include/drm/display/drm_dp_mst_helper.h       |  7 ++++
 2 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.37.3

