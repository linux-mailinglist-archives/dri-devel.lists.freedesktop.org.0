Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC4A0855D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D282F10EF76;
	Fri, 10 Jan 2025 02:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B84QoNsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A8810EF76
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI/uRPDrR8sfehiYNaNA52TnGuPsZUIHyZudtrQUt/0JCFkciR1ys3HqEpVw69gvoVIj8uPOJPj/Q/dILrKCFhTRMX+CkBB7u7GSX4ElgKGEi4UVvHAZFosjusi6A6kjxuVjFUmZEsXi0txtkc09qH62LL7K05NpXA7IbYRXdmkNfKUhIkMnYGrROmbuB+jybEk4RFUdJAY75dDtHNs1xCDV40F9TQJ4G/ATMq5A7WObZud80TCLkTnc9qw6SOiFKGK9qJvs7JyqC0m/Mio+0/qmXAzIM9u3klc0BwPXgp3l8yLTWEy/sNiYeSdr/7+P11CSofBQsVv0oFZh+ghcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1/9MQ5UpGJXRLAqTi1UKTW7w+kit9nvZ7xE+OX6XiA=;
 b=wmjPyU8znVUOlYDSYlso9PaK5vtwAPo62q7HjIAxXhual7c+EBy8IZDR0fBt8Up1HgBX5dako6auLChGSefZiEjotrI8hk/HzbzP9qRCbkKbfBYTUXqkhts1XgTFQ8kltBxpnexq3RW8znrkM03wARHPJMXRpEWaqkJlsC6aHcnfs5lao+/BawwZRWElN3vC9ZXQs2wnd+2E6FeiXlJRaw/H2izceAw5s8UwYkPleIfJQKSwznkfZaSAlohTlJUH83ZtJEg18G0kuhHOidIxQrcB5hpboivCfcuUaNsftrCSvCE21vTiLpSQ88bCJyuBBxMBEbhalXjRtnMkWjxdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1/9MQ5UpGJXRLAqTi1UKTW7w+kit9nvZ7xE+OX6XiA=;
 b=B84QoNsuqxHGArk9SatO1WdwnyS7Dem1TqNGp/tovWOJB6mK5lsLbmUAR5o/2ExmgyvKWXUin0eDd6vW0LLqqUo38WFp4h0jggT4S0nuHyqrkL1zMwccP0W89V1hF3xt8/6zWJREhh6bDYlTGELivVCdFaDf8ODxVpmeOz0qwA4=
Received: from BL0PR02CA0127.namprd02.prod.outlook.com (2603:10b6:208:35::32)
 by PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 02:36:56 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::4c) by BL0PR02CA0127.outlook.office365.com
 (2603:10b6:208:35::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 02:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 02:36:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 20:36:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 20:36:23 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 20:36:21 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, Wayne Lin <Wayne.Lin@amd.com>, "Harry
 Wentland" <hwentlan@amd.com>
Subject: [Patch v3 0/2] Fix drm RAD print
Date: Fri, 10 Jan 2025 10:36:16 +0800
Message-ID: <20250110023618.66401-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 43429e9a-ba70-4720-a1ce-08dd311fa5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXo5bUErbWhVK3V4eC8xcU1vSDlUSDcrZlRXMk5ETjg4QU9WRkQxKzlMZFF3?=
 =?utf-8?B?ZmFTK0FvKzc0dmpvZEhqUmxvOXZXeFkrNkJ0TWNHTEl4OHZ0SnJaNUgzODVN?=
 =?utf-8?B?STBQZ0ZhZEZrWG91UytHR082QjJlaGIvb01jWXU4ZFJSSXNBZXJNZ3czZlVN?=
 =?utf-8?B?SngrV0cxZVgvQXhEamx6cm1xMUkxTHVDY2RMQk9qc0lCWjltNFRaanVmZ2lX?=
 =?utf-8?B?a0R0NUxyTklRcUp1dlhmb0FJd1Nkb3YzQjBnRFlLUEp5aC9UWXNqY1N4RVJG?=
 =?utf-8?B?M3dtaVZZa3Y1RU1NZXJ5eXZPWk5uekdZWVE0bWw5c252MUk0d2Z2U0UwNmhY?=
 =?utf-8?B?WmJ2K0ZkbnNkb3UvcHNpOEs1T1V3ZjJXeXBBdUhKRXRoZ1hDbkRodE5ObmpZ?=
 =?utf-8?B?MlVTek1YaVR2RUI2ZWN2Z0k0R1JrTkI1cXpxeXhvVVhaR09kRlVCQ0JYR1lm?=
 =?utf-8?B?dzNncHMrY2N2bCtVUVIzczdWdEJlcDNHOTJodDVNTC9CelF1VFBPUkl3Wlhw?=
 =?utf-8?B?OWZDYkpHcjJJNE9lWm1tcm9vMFUra2RVY3o1Q2Z5QlRsTkorVzNBamJab3cr?=
 =?utf-8?B?VHdUS0U0MXMrV2dHNHJQbEpFVGFOV2MrYTdlNnR4OG93NjFSeHRWa3gvT3J0?=
 =?utf-8?B?WkdKOGpZL3dUY0p4SWNua1I1cEVncERCbmJOS3VOb1RuVC82Q2VNeGxMU3VZ?=
 =?utf-8?B?QjRjZkFVTjk1WDB1dDdDbWxFdDhwTGtwdDJTZm9VYWZoT3QyTDkwNzZBQUZh?=
 =?utf-8?B?UmhGU0lPR3dmTU1SWWVZT0ZVQURxWUNmYWJPaUhCTm56dTVGa3VDUVlQaldH?=
 =?utf-8?B?LzFQbDdDTWxZeHFjQ256amt6bC9XeHVxSmJkV0h4eWZ4RjJNVlBhNENBLzJo?=
 =?utf-8?B?MDZNaVJ2TkIrSk4ySjh5NEcrV1dhK3RpaDI3eGQ2b0pzOXNDcEd6bVRIYWJD?=
 =?utf-8?B?ZWRLVEZWTUNIOWpNa3lVdCtyTnRaaGl2MGFrSjNGYUtReWFIOUl5aDhjV2tq?=
 =?utf-8?B?cXZCRHcybytPdEVCMjUyOURSQitTZFRLd0NlMmRwb3F4RUZ1YnRaTXBBQ3A0?=
 =?utf-8?B?VEVpOStlMW1xdm4xeXZTTWpHTFFBZGhVWWxlR21lOTVYQkNjeG5sdTVidzh5?=
 =?utf-8?B?d0RMVmlxZ2JKRTlBWTg3ekJrSXg1ZkMxY2htNEhWOFptemNOMmFCTDZ5VC9X?=
 =?utf-8?B?Nms5Q0J0eUhqUmtaOUlOMlNOZEI2TW9TSEFabjBxd0x6UUZwRTkvSExlUHIz?=
 =?utf-8?B?NGx0VllBcjdONncySnVpemRwZHRsdUxYd0E2TE5vKzlwN3FZWXB2K1FPSHJ6?=
 =?utf-8?B?ZFR3MXAza1NkaEFXYXR1UGtSTVBEVk1DcitWNFlrZDBsUldrQm5oUjV6dTgy?=
 =?utf-8?B?NTFFT1lOd2h4dUtQeHJDVE9LZThiakgwdDR5M3AyVkttK2M4eEtSajNqL3A2?=
 =?utf-8?B?TGk1b3V2dUhRSElqSlB0Z3dHTnpMbUhlQ0ZHRW1EYVZ4MFpUUHR0YkF4L0Nt?=
 =?utf-8?B?VktzTFZWcGFpVVA2ZXpJMDU5aUw2cjBYZHdGQUdSVUNtWmg4U3ZmQ2ZqNTAr?=
 =?utf-8?B?N1F1U201OWVGTHlXN3hIWGkvUkpyaElnY3VML1hlS1N4SW1hQTZXKysydXpu?=
 =?utf-8?B?RW1jV2RRYzAyL1QrbWhhakphdXFGZko0dnZTenpwT1l6bDdnVitrNzFHNXo4?=
 =?utf-8?B?VEJPMjRtYWs1V2FibmtWREh3K3dTZU5xQ1k0b2dEdFcyU0oyTkR5eGExRVNa?=
 =?utf-8?B?UCs0cDN6a0I0MEdLWC83TzI3a1ZJbC9vTnd3aTlGNkR4ZzZ3ZmRZSFRNdlZs?=
 =?utf-8?B?Z2ZsS2NJQ3UwVDErTEZGOFBXb1Mra3hXZFdHVk5RbzlGeTVkN2N6MS9NY2tv?=
 =?utf-8?B?OFNaaDlIVWdVdXJUUWtRbTNGd2lXZ1A0Wk5YL3RnRlg0cmdFY2x5ZDNUai9K?=
 =?utf-8?Q?O5/6xDplJJo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 02:36:55.4201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43429e9a-ba70-4720-a1ce-08dd311fa5f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959
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

This is v3 of [1], with the following changes:

- Modify description "drm_dp_mst_topology_mgr::mst_primary" to 
  "&drm_dp_mst_topology_mgr.mst_primary" so kdoc formats it properly (Lyude)
- Ajust code format (Lyude)

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

