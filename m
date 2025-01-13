Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E89A0B26E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562610E1D3;
	Mon, 13 Jan 2025 09:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VplS0GS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F006810E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZj/iF5wQk50YYcQ/VN1Kqn/fmVHXqk4RIEBJioupRAbXPk+ULMcnCigg6MYVWb8oxUzDASQldb1/Gh2p9XqPCqHE4u54t0GtIQ0khTWFYjGjccSfzf/y4KQikRSlzbC/RRGhSfe0BBERQlLB3/XMANgcaB8WFpCCBWKyNB79isvgx0/MRN26EjS4hoUZ0I2AQCi2Av8JhHNnP2/ti+F8k9myIuxUD2vYg8HQKILLXXeI+APBjBsbFfIH75/MotlLd2vDcaUgnc1V0P3o0iBh0trCxHw/02l/i/GEkeDfg6cTdAy1LvTK/kcnd+HqtVRXf/u/joomtbfazzbQzLd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4GoBr1urZkxtf2ZSdy6RHaRxbGv42GlvQIT4DaDO78=;
 b=uPrI8tu3sKtNA4vUfz99EzI6sJeBST67CS739WocXdeJSdM7AUoYiLBMEjJ50f9ojMulldTrY6g72aWLhjzPyX4PasQJXnsv8AmhBMcEI9x7LwvDEBPUemdRqrDlpO/B1MooDaQDCON5daIuLioWOIWN00e5JGz66Uu8PVZiu8pxyUUMsqZ7Vs7AXMh0nPN7Sj5/45m3vRU/mkgZuejlTmQWSw1NVSlRcP9UHX0TsksfL2qu+M2aHXzcd+PKPhm09gU1QDPPHOuCKxkzIOUAC5S1135TyVrn5/8ceXpEjetOkUzOmKKn2epX4+pHjShDjdQP5pdrgK2jshiPqOATTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4GoBr1urZkxtf2ZSdy6RHaRxbGv42GlvQIT4DaDO78=;
 b=VplS0GS4aq/rt7PVWnwxJ4l89YSfKLZndV7sGRXGv82TlxUW+4SlJb7lFSM51MTZ0JPR4nzoybzSiakto/eNKiK8JtK4CEi8qST0kK/roImsora7bxQfOgwULmSrPTHD0HF1djiIeq1iPCPX+eJVqNHTWSE1XEmab6M1UXjfCjQ=
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:11:06 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::2b) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Mon,
 13 Jan 2025 09:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 09:11:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 03:11:05 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 03:11:02 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, <hwentlan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v4 0/2] Fix drm RAD print
Date: Mon, 13 Jan 2025 17:10:58 +0800
Message-ID: <20250113091100.3314533-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cbb81d-cfaa-473a-6dfc-08dd33b2361f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTV2YThyS0dEOEhqbE9RZ0NqSzNmdXQyODlpNkMrMVlURU92TU50eFlGZlUv?=
 =?utf-8?B?YmZFUGpSa2RpOUdERHo5cFJ6dkN1anBmRElLSktkUDQxZlIxTzVLYy9XR3Fr?=
 =?utf-8?B?WlFsTG4wcWhCT2tVd3o3Qzk3MHRiUjN1VEpndUNkamRUUk9INFRWQlpuRGpp?=
 =?utf-8?B?VEtuZUkySDdJODlZU2k4WlJPMVhDbVRMdlQxa1JXT2FzSXZZUUJDNzFKVE5k?=
 =?utf-8?B?TG1oMk1INnY0Lzh3akRGT1JUV0Y0TUw2dGE0NjBhS1MvK0JEVTZSb2JqOVl2?=
 =?utf-8?B?TWorUHc1RldUaE5KZUNjbDRpdjZwR1ZhNGw4WDBxM1VlU0pmclQ2NEdwWTI4?=
 =?utf-8?B?Um05bFgrdklPTGhNQU9xeTg0VFVodndLcFF5VWJDTjN0RVhEQm1CTEVQdVJY?=
 =?utf-8?B?dEY5WG1Vcm1vS3Q1SDNtTjJwdU5XSkRhbUVyenh1ZVBDSG10bVNwQy92dmln?=
 =?utf-8?B?TERsY3ZmMHNSVzBDclB4RmI4aHZYai9jZVJRN3ppTXplQVRvTEVpWnZJWlpB?=
 =?utf-8?B?MTJvaWtKaUNlNTU1dVh5Y3ZTRmhURVc4VW5oVEJoWnljUTVtS25pdWNTSXlD?=
 =?utf-8?B?N3Z4bDJjeVNiU3crbG9SMXZ0dHBXSjVMS1B6aVNCY2dQeHRhSEhwaUZNTmxt?=
 =?utf-8?B?ZXlRSkZYMnEwUUtISVFRTy9IOWlBWWRiNUo1akNsUUJwT0pjVi91QWxLWFQy?=
 =?utf-8?B?cCtHWFo4aEZDejA2SGFtMXJQQUlPbDRWQjNHZjhCQnlEVDFVV3dMek5GOFo3?=
 =?utf-8?B?RVhmVG1yMzQxQXljTnB4bWlPanVzbS8zeTlhdGFmNXRTSnZEMlBaaWFhMXpB?=
 =?utf-8?B?WWdyTm1iT0JnVjRsb1liUnU4T1VBYXVmVFVNNW9LMVZ0aVRnNG5SZms3SCsr?=
 =?utf-8?B?clhBdFVRcG5PWHJwb0xEVFllcDZ3ZStpOXFuYk1aRzNnSzlSVk84aENqYjJP?=
 =?utf-8?B?Z1d6SXcvOTJUd1RScXRJRXB5SFc1QS9abGoyeGhJeDB3aFdIYWJJd2tiM3lH?=
 =?utf-8?B?VmFmTnJsUVk1ZkFHanZ3VDZ5THY0T2RhL2IwczZXMzdhUEZzNmJLaUdyTEQw?=
 =?utf-8?B?TlQvR2tyUWJKTll6RWdvZnk5VXd5SEhxMG94d081QVFVcXA3ZFdTZE1YclFk?=
 =?utf-8?B?bjdEdlNvSXY2cENZMWtGcmRMc2ZrQjBKSU5aM0dOSEw5aXB0YURKc0ZBWUhP?=
 =?utf-8?B?b0dkNjJpcUxobVBDWCtYNVhEaGxYUll0UVZoLzBIYzI3VVFjM0o0K0NVSGY5?=
 =?utf-8?B?SFZWN1hvM05pdmVpVzdBb040bnhXV201eHhWSWFYTmx5anFOQmJoQlRjUExH?=
 =?utf-8?B?dy9VM2gwU29NUjJKNGU5MkJuamt4OCtqV3M1VHhTOEZuOUxVbHdlem90U2Jn?=
 =?utf-8?B?aVR5dkhZUUt1L1U2ZVk1OUUyQmJxNElMcE9ydlRYUzFlM1R4akxydFVMNHpz?=
 =?utf-8?B?RFNPUExIL0twKzQ3bGMvRTBJYURBUlA0MWkyTC9ON1hmbXFQbzk4UmoxajFy?=
 =?utf-8?B?aUpkQkVMUWROZC8vbE4rckxIak1yeTR0azNxc3NhVDJIblFieHkwS0VhTHdP?=
 =?utf-8?B?S2xGOFY2UGY2SUwyNDlubERNSDR4OC9Id3F0MWpYbFozRWVSVXBVYzkxTklZ?=
 =?utf-8?B?VUtOeWFxV3lLcTdobnhZNk9Bclc5R1BmVW00OXNXVkFvWTl1R1J6a3g3MXBq?=
 =?utf-8?B?Qm5JSCtqZElmOUpFSmNFU3JzSVoydFV1WWQrZ2pjbEFWYkFtdjZwNlZCLzZa?=
 =?utf-8?B?MFY3eHR0TndYcHVaejdXVVBBZDJEY05iTmlNNFN0UWNZUWFIdDFMTmZHY1V3?=
 =?utf-8?B?SVJ0L3EzS3UzSCtSdmhSV3k3QzByZ0s5T0l6UmRYbjB3VWJJSUJmY3hwTGJw?=
 =?utf-8?B?V1ZxeDhhK2IxVit0MXBXUmQxcHpWZUVzaHZuRjdTU0ZybWNUMmFMZUswTHVH?=
 =?utf-8?Q?UqMOfIAwGDs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:11:06.0765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cbb81d-cfaa-473a-6dfc-08dd33b2361f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
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

This is v4 of [1], with the following changes:

- Fix warning caught by kernel test robot:
drivers/gpu/drm/display/drm_dp_mst_topology.c: In function 'drm_dp_mst_rad_to_str':
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: warning: passing argument 2 of 'drm_dp_mst_get_ufp_num_at_lct_from_rad' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     201 |                 unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
         |                                                                                 ^~~
   drivers/gpu/drm/display/drm_dp_mst_topology.c:179:52: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'const u8 *' {aka 'const unsigned char *'}
     179 | drm_dp_mst_get_ufp_num_at_lct_from_rad(u8 lct, u8 *rad)
         |                                                ~~~~^~~


vim +201 drivers/gpu/drm/display/drm_dp_mst_topology.c

   193 
   194  static int
   195  drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
   196  {
   197          int i;
   198          u8 unpacked_rad[16] = {};
   199 
   200          for (i = 0; i < lct; i++)
 > 201                   unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
   202 
   203          /* TODO: Eventually add something to printk so we can format the rad
   204           * like this: 1.2.3
   205           */
   206          return snprintf(out, len, "%*phC", lct, unpacked_rad);
   207  }
   208 


Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>

[1] https://patchwork.freedesktop.org/series/141832/

Wayne Lin (2):
  drm/dp_mst: Fix drm RAD print
  drm/dp_mst: Add helper to get port number at specific LCT from RAD

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 31 +++++++++++++------
 include/drm/display/drm_dp_mst_helper.h       |  7 +++++
 2 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.37.3

