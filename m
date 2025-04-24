Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFE3A99F42
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 05:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4109010E717;
	Thu, 24 Apr 2025 03:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OzYkDfFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793610E716
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 03:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBRc76Ke7Nm0o8DUEHGTGNkDS6Qmi4PtUsXD/ZFbiloyRW3LbMdPMkoZ05mLLjNGB1YqBjaa2C/tmiwY6CRTECxLuWvT0lATnutqUd495aDmKxHRXF9FZsdr3Ib+16GcgnnrXZNHgCTOeZjt6xoImCqnRXW5pICv5r+T+BDnC+tTKHg7zORaLKnGUUmQjal3LzAIm0I3IuQ6I6SNoiAdSoLS9WY3NKm3JMatlVbomH4f+i8YExsXYhEhwFH8Eacq907WX68LHUo4AXQlmwbs447j+1+WMpDFjOYEN0q5As/Pr/nXn4O2EvUUkk5cgKa7WxVdhse2B+d4KA8X87M4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPLNVVX0IPiaN5rem7ixZLebz0JuOUVH2Pg2z860M6Y=;
 b=mapiYpcNM04hEJYMx3A0tvLh54ZqbuQD/QBaNrRrPQB+b7w5RVZrthA5wMHod2FeZWxG0WGRoXoD5f0HOjmIuVZMQ4SgrKnIJ7NBwrgmxPFA3+jmTLTarGO7eh8+UjIxncoPswn9xciwUeBTDUjmYhmZ7NeHUIajj/2mcXjuy9LkF9f36v5WooqkC9MIxESa7YhdXRQCc0Ob0SfzYB09srmn5SvzOD5tCHlrIwr19E6+xbP9aLLiclz6kCs56ejpfPO+E/IY/GSSixAbHtrF8C9r/QaV3aqTWi96om8J4Qhp8RsAIIt1GoozbKktW94XD6a4cdbM+mT5Df/0sLq1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPLNVVX0IPiaN5rem7ixZLebz0JuOUVH2Pg2z860M6Y=;
 b=OzYkDfFf3VbEeoDnkIWTETS4/dLpRIp4zGDhVo4saTeYmvEioxxD2oEuE1B0GvocddquPMeteaS4XFVciXOHHQxHnYuL7lP1LtMbLmMc7VLDWkYemcX2zGAvFpeVrcdHj+bbxDdJbHg4z7qutTSkbaP5lTIyo5pg23dUcGpQGxE=
Received: from CH0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:610:e5::30)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 03:07:49 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com (2603:10b6:610:e5::4)
 by CH0PR03CA0265.outlook.office365.com (2603:10b6:610:e5::30) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37
 via Frontend Transport; Thu, 24 Apr 2025 03:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 03:07:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 22:07:46 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 22:07:44 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <jani.nikula@intel.com>,
 <mario.limonciello@amd.com>, <harry.wentland@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH 0/2] Fix I2C-Over-AUX handling
Date: Thu, 24 Apr 2025 11:07:32 +0800
Message-ID: <20250424030734.873693-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|BY5PR12MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8a5703-6c78-4665-5802-08dd82dd312e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHpTVnB4N0V2UERrQkZDNE00aThvdE9FQXNISWJaay8vRGFldjMxRDJ1eXFo?=
 =?utf-8?B?RU55ZURIaGZYellQN1VyWW1MdXhQR2FsZXljc1g5Y2h6ODBQYnBydHpoUkNX?=
 =?utf-8?B?dmYyMHc3cTNBbHZNUDNYODNFaitYV3FHb1Z3azdGdG5sTUYxZENoN0JBNkFO?=
 =?utf-8?B?d0ZoM3BMWXJsY1NxZE9ab0FhbEtWZXJJVzNqRFhxYkpZVmo2Q20rK3ppN1Rs?=
 =?utf-8?B?U3hNaWtkVlpWZmdjbitoZ3BNTVBReERvelA0cGRQS0NEUkQrMUxPK0ZzbDZw?=
 =?utf-8?B?VFgyS0dKUkRzaEplVkExZGlldTRQU2FWcFk1TlFLa21HNWQxaVdPRWNpQTF4?=
 =?utf-8?B?d3lPeFBGWEVOZ2Jxd0dEMlF1YlZ1ZWtVRkZpQzFZd2lYZ0pDUU0wKzZKRUNz?=
 =?utf-8?B?Umtxb1RkN00wTUNKdHdHc1VxV3M2SEowMkRKVm9seEVua0ZSbjB4V3B0L3dh?=
 =?utf-8?B?VTAwRFM2V2liWVlvQTFpa1JhMXpZemR3c3BHZTd6L2l4Y0RYZTFOWjBxdG5m?=
 =?utf-8?B?SnJqZFJLeEdZUjhya1lUbCtXcm0zQS8xL2xyeHhsaWVZbWU3R0tIdG5NamNq?=
 =?utf-8?B?VGY3U0dvQUhhSVBCeEF4UkZoRElXNUtIaGFXS3BRa0syQUZXd3FHS3BadFJI?=
 =?utf-8?B?TFBRSXkzSURXZ1FKQjNiS2xIbkk0QTc3UVlsS1p5TWw4YjhGczgxNVFpS1ln?=
 =?utf-8?B?SjEya2Y3OGlSYUVpaVZFdzhQUHZ6NzNIYjFFbnJLU1NDWEovUDZ5NzhQMHg4?=
 =?utf-8?B?NnNaOEU3Y1ZUSU45STRGNTVlTTJ5bFp0Y1JZb0IwZzJVQzZacFdXU0RvMTlm?=
 =?utf-8?B?bnM0LzNKOUt3eWd0ZkduMVNlcytMdEhPTkpYMCtsM3ZCeGRQK09mQWt5bHY4?=
 =?utf-8?B?bll3NG5Qay9CNjA3THRoZlE2eGtqT2VoS2MzOWhXckZMc1NleGp5TUliQ2NF?=
 =?utf-8?B?NHlwK3N0R1NrRHhLM1ExZ0Z0R3p2bUY4OWt5YW1icXhlQ1N2SjhwZGZzU25u?=
 =?utf-8?B?M2dWYzU3QkNZQTY5REdxSTNsVlByZStZOGFJMllEQ29MNmFPKzFnSC9xdnJT?=
 =?utf-8?B?bDF2TWp4ZURJQlBqYjhOaG45cDFpdUJmUEoxNFAzbDFGT292RXRCRGl2bWI5?=
 =?utf-8?B?Ujd5Si9ZTUE3ZkF3dGhuQ3luVmFaS1o3cEhNbGRRNEp0V2VQNDlpTE5LbWE4?=
 =?utf-8?B?c1h2MjN2RmVMbHZDRDRTY2o0Z3BTclgxMmxiRzlsV3R2b05yS0FVN3VMQll4?=
 =?utf-8?B?YXNhRWJSM3dUNE1ndHlOSms2ajVuUXJrb3VNQmNVS3ZhTmNtMG5oRHoyUUpa?=
 =?utf-8?B?ckw2S1h4RlpQT2VHMStwbjVZRnNNb2ZEUWJnZ2NLelNSZnFzSWtMLzg5c25v?=
 =?utf-8?B?bmdOdXd4c3FPSHBlbEJUSWx5RSt0UWxYVHpyT25xWEFvMVhpUzgzMDNxMHcw?=
 =?utf-8?B?Rks5UE5WTDNRZkdaU2xTbU5JRmNzSWtBUTh6Ti9ETTQzLzB0NGI1dk1mdVJM?=
 =?utf-8?B?OGNINFBqY0MwSm1NK01TSlBnY016eGJTZW1nWkdhNWQ3ajZGcllSRnJPMnIw?=
 =?utf-8?B?T1FrNWtQRnJuZWxuTy9kaFFSQkVLVVdkeHdOUzBQS2R5YWdIalRZUG5obHF3?=
 =?utf-8?B?eWdSNkova1RWWDVMWUJRN2Z0bkc3cXd0UDI3blFBYXJzVVJkQlB4Ynp1M2Zz?=
 =?utf-8?B?SzVaUjNBWjY3VEQ2TUFHUmV3STIreFZUSDM2cGdmK0tHQUFtVUFJbHQ4V1Q0?=
 =?utf-8?B?dzd1QjNvREZkYUZhbXNWNGJSWUlJcDVaaGV0d3lldlFJekUyVlVPT1dRLzBs?=
 =?utf-8?B?NkpKeEp4TEQwaUIxNGR5NURIbUcxd1NjaHBaVEdNcVczaW1JY1M1WHlwUEcr?=
 =?utf-8?B?SkNkUGZraVExNVFxVWRuVExvRUJtU25pN1R0MzUwSllHSDVLMFdpNjlxdFph?=
 =?utf-8?B?VEh2V0pXN2R1a3FFbytKdnRrazlsQzA0cUtVMXkyV2g5NnRVUXNCWk00WkV0?=
 =?utf-8?B?dG5Dei9BZm81aTVqQmVnTXBlL1FFOExGeDBhejNRUGFIN29CVk4vbHRJaGZ2?=
 =?utf-8?Q?I4nqmn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 03:07:47.9657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8a5703-6c78-4665-5802-08dd82dd312e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161
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

These two patches are trying to fix how we handle I2C-Over_AUX
transactions when sink side can only complte partial data at one time.

We encounter EDID reading error with specific monitor and cause mode
list can only be lower resolutions. After analysis, the monitor will
reply I2C_ACK|AUX_ACK followed by a byte indicating the read data length
fewer than the requested one. Under this case, we should update the
request length and request again. Code we have today doesn't handle
such case.

Meanwhile, how we handle Write_Status_Update_Request for I2C write over
AUX transactions seems wrong as well. The request format should be address
only transaction without length and data, and we don't really send it out.
Further more, it should be constrained for I2C write case only. Not
for I2C read request.

1st patch to fix the I2C write problem and 2nd one to fix the I2C read.

---
Wayne Lin (2):
  drm/dp: Correct Write_Status_Update_Request handling
  drm/dp: Add handling for partially read under I2-readC-over-AUX

 drivers/gpu/drm/display/drm_dp_helper.c | 28 +++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

-- 
2.43.0

