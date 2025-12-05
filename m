Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA009CA643D
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB80F10EA19;
	Fri,  5 Dec 2025 06:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vkq55YK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305910E083;
 Fri,  5 Dec 2025 06:52:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/tsuWO3zwBLvrv9UWjn2ZZ5sUoOrraPcMc2TnyoIvVIVrSf+NbdFYmlSJuodNxCZbAgNOIaethIpNJg5fl3vHVNHD4KXRe9BgB0egSQsurVrczVKSGfZDXmlKWiUm48CmEm3HbKTRKYkIwqyL3mg3D9OlTtlUNGhqv7kGgP9YqaZ00rN1CJAZvCs9lY+zIK9ZmWbrI/v9ouj47N7I6JxK9pZyXaQOOrcCL4T+VAagUIkU6hGnWt85D/FuFMRlNGfWJJWACdNnXXfZvXniS1EQOiALRn180Zs9gKwLozSGlHaSdkUDbcSXy2sQFKnszHPSWYXYx+AmS7XcnIhg58Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KelzJmxtJgRp1iu8ZwJ/QgUnuuFlGEHBvRYpXH1B8hE=;
 b=Y4jEiwX8tVQWb4oEub/ur8HuOO+DVxNgjRq015Rgza4jqaEdWnTvjPm3GXMitux7/7wJtl1VbZfXpGqPK6fEqSx0g7/FaMhCp2S/83H2o3PYRPyIgDDscScqZrv30q88zabfC1AzONYkFBdNPS+4DBZJLUIDOtNPlVqxzNw/t6Z+tNIaQqb01NBeOgRUBbwUnmvqlacSI8TiJ+wJ3dtGv/JLlz1ajQbRwiJm+EuCfkDPP1DPcNW3vL9f9F2AheILHaKUu6ckTvewvI1IIvtff1a54VwkxAkTozaXV/KoXGgBczcmG2PKPMJLU4pgn6A5gNDircOKV1zr1MKrLdNczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KelzJmxtJgRp1iu8ZwJ/QgUnuuFlGEHBvRYpXH1B8hE=;
 b=vkq55YK8GkwZFuaazYAOCq1iD/xd2ov8fo7HS1+JEqtqmpPR4fTxPbPFEOlVPIbgfjxKD5wBPUfJEYobG6+dDoljFrLgVh5UTeawAqYafNQ+VXxr3aUvMtie1nKjYTc924CzR9a9N3nQVkdCqi3U3NSpDJZIYtj4SDTBeHFAzo0=
Received: from DM6PR05CA0050.namprd05.prod.outlook.com (2603:10b6:5:335::19)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 06:52:07 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::ee) by DM6PR05CA0050.outlook.office365.com
 (2603:10b6:5:335::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Fri, 5
 Dec 2025 06:52:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:52:06 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 00:52:00 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: [PATCH v5 0/5] drm/amdgpu: add UMA carveout tuning interfaces
Date: Fri, 5 Dec 2025 14:50:53 +0800
Message-ID: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2AMmkC/5XNwY7CIBDG8VcxnGXDMEBbT77HxgOFqXJoMdCSN
 abvvuhFvdXjfyb5fXeWKQXK7LC7s0Ql5BCnGnq/Y+5ipzPx4GszKaQGEMhLsiN3NhWKy8znZQr
 TmQ8x8eWa50T1CV5D25m29Q2y6lwTDeHvufF7qn0JeY7p9pws8Lh+oxfggkND0jbSYOf00Y7+x
 8WRPewi3zxQWzxZPTWY3nvVChT+08M3T5otHlbPDdDIzinXo/v01MuTArZ4qnodgQY02Gvbv7x
 1Xf8BhvSflMABAAA=
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>, "Mario Limonciello (AMD) (kernel.org)"
 <superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3958; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=D8USiMkGHeyA+Pknp7isNVIrZgauXV/qrHJ36j+fGac=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpMoECVe4ISIrsDVcQmyfrDR3bzORfSoei0o1ga
 g2+VHMUnYOJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTKBAgAKCRBfF7GWSinu
 hkytD/9AJuAsT18BefLLrDEQIxA51EwP4Bu0HdUuE6IafZvuhHjWq3tJnbiYtg7Lq3SqXIkb8a9
 ascXk/7cBnYQj3OJP0bO75phys1DRHDc0MDkp8gKZyFZmN+vnqfg+orJMji80HU5KA4m+RKBTRV
 gRAZnfTdnlonl6SHxH3gP8PMHW6UKnB5/A3dqF8DoKbeu9NB2hvw3myaApZytBe7a6nddAfSurt
 0MHGEWqAj+lv7IYBfi/oiVr2X+DfHbedZVeOA2TPSJ9WN8IIVYd67WOSZ4Yhs5vPKZI4KdH/P0F
 veZZ28Z6hBITRF2LyuikhOsWU9z48aIvDr+urhkpOF7I559KXnTA1tR0cyGKwDILAv/K+aW1leH
 XMnNswMw5VdzQHAK4gxAzBFLDkeWAdOBTuGRmz9qkoYF1jgOr8iFEL5f/nxJq9z0GaFsTh9YVpA
 GpAN46yFKjunv4f5aOOQcbf+kNSKq/tcmQsqPuiffyCN/XGsj2k/L8cqFJKHgkofZdc5xJScrKz
 KUyDulXhOzNqKLzByobNmkAoV0naWr6iKneNMUoLF6NVbQRfJwu+fJ+apFzcmrzLREe/TxuyFJC
 syq6vj6AOeTbtAjuo1mAatn56i/fPUBmc2AMdtsONSsvVhsnBrzKmBW5LpMGeBV8B3X4Q3nGcuj
 ZzLc1qM09vCNJtA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 469eabcc-59bc-4bde-53d3-08de33cace27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVRvUmNxb0tnY0IyMmtOb2RVZWZEeUFtdDVJY0I2dzZERnlNVXBMWVBueitU?=
 =?utf-8?B?cThIY2Q3S2lUVXI5VnduRWtGTzdPNGtlRXVhUFFudGlLL3dHSXJQM3RNck9C?=
 =?utf-8?B?ZlRaRFNVUFRsbGhueXBHczROdGV2SFJ5VDBUbmpET3Y5SS8xNllyQkJXeTJI?=
 =?utf-8?B?bGRqOUhINU90VkZDU3VDTGkvNkovc1dEeU16dm0vdTBTK1NOc2VhOFd5Wm1n?=
 =?utf-8?B?MkhqRzRGNmgyL1pCUGpGWE9uOEVBODFZeVZtRlhCR0trbWFGOE53OFNla1dT?=
 =?utf-8?B?NUUwZVhhV1VYWjhsaFQveGVGTDBtbkhvTmowQ2ZrR092SEFOVFZxenZkNmFp?=
 =?utf-8?B?d0RFeU9heTBxN0hYZlV6eGNxdS9HN29VM1YzenpCTHlpa25NVWtYU2xWcGdP?=
 =?utf-8?B?Smk5bS80RzBZa1FxUForZ2VVNkl5NnVFRCs4UjhVYW5KdU1vT044VmZIM0hI?=
 =?utf-8?B?T0JnbGFqTU5OOTRCOXlVSVAwc3Z1MVQxV2h2bEp1TUg5aDhvMkQxa2Q3MC92?=
 =?utf-8?B?N2ZvNTNlWVhGTzdhQnptZGd6NHh0ZHg3ekZwRGMwVTl1MHJFYnB0SjNuWHlx?=
 =?utf-8?B?MkNQSTNrMWhZNGJ3UVFSNlVhei9SSWtQWXRNOC8xRnI1S1YrTEttTmltKzBk?=
 =?utf-8?B?dEF5aVI0aFRtbEFXSzU3RHMxc0Znby9JQS84cWl6M2xXNnVNQ3EzSVBCamRD?=
 =?utf-8?B?RmdXeENLZk1jQS9RN2dEQjBGQndDYWRjN082RFpEeEdhSFg1SkhjdjhOVXUw?=
 =?utf-8?B?VEExNXN6OUVoNnd4Q2NLYzhYdkFHclhXWUhKWHBQakxoa2tmbUdCeWx1OVFM?=
 =?utf-8?B?WmF1ODhVdlI4YUlESUUrM05yVTR0WDBJMXNXQXB2Wm13ejE3RmswaVNVdTl2?=
 =?utf-8?B?WHllRktOL2RDVjJ4cllZSWxaU2FLYWZtdHZlbVBxYWNueFI0ajFSY1UvOXB1?=
 =?utf-8?B?YlpCM2EzQ1hEaXlWQXZ6RjM2UmVYWTBWaVF1cFdmQ0d5NHV0YWlxNGZMa3lB?=
 =?utf-8?B?REJzUitaM0ROcTk2N1NxM2tOMzl6VG9zRXJ1endkVzcvR01UYWgwQ093TUpj?=
 =?utf-8?B?dms1WnhpZys1c054c3Y3QlNKaHo5Z0VJS2hUQ0NiUlAzVjZPSS9hTTVzN1dz?=
 =?utf-8?B?L29POWRtcHIwZjVCM21DUDVrOWNCYlF0VEUybU84c2YyL3JSNFdOL2dQRmc5?=
 =?utf-8?B?dkZxZnFsd2ZQV0dLTWxTcnYzUElhaU8zT2JHSVVHaWd0L2IvT1N6b3JnZEwv?=
 =?utf-8?B?eWhRYThFZ0lOQW52ZnFQZm9ac29XNWhZbjNvWE9FWWMzamFMM0lSUTFJTjgy?=
 =?utf-8?B?UXNKM3Y1WjZZbVNNSjh3bXU2MmlZZzc2YitlWVRNV2E3RysrcG1xWnZyV0l5?=
 =?utf-8?B?OGMyMnpsU01teVRweUJWVElNcnBqdkluczhGeVBoVjFXNVlHWEJUR3JrWDAw?=
 =?utf-8?B?SVBHUWh0dksydkZjbGxCTnA2S28xWmxUWXlERExLckFLNXgzSnBIZW5DU0Nj?=
 =?utf-8?B?MDZsSGg0Y2FjZ1JlamNST0RGc2hpTnVsR1JlYTB2YTZMY21PRTlkVkN5bGFr?=
 =?utf-8?B?by9GUStIVGVESjgyNlJ1RnlLZGdwNWc4eklaSW1GUzhleVlYV2ZUQUFDdzd4?=
 =?utf-8?B?SzR4dnhrbFBnQmNrbk9YZGxCUlZad0d5Rm9SQU94ZUcybFZpdmhKTzVCbGVW?=
 =?utf-8?B?SWlnYVdYYlZXTkdzd2VvOXVGdXl3eXRRQ2U2Wmw0QmlIaVpqRExFcXhFUE1U?=
 =?utf-8?B?d0daUWl5SWhIeldEZ3dwc2cwNFRGV3BpWFdTRDVwSzducGNEMGdJRXNCRFMz?=
 =?utf-8?B?Q0o3QU82ZWxwa3Z6Y3ZXU08xdWZJSVZwWHE2TkZGUStqdE5CL1htMWIxMEVQ?=
 =?utf-8?B?cDB6aHB2MjM2KzB6RmxLQkgxajRxZWJYMk1kOGlJTWd5R1d0VStVZ1lWQW4w?=
 =?utf-8?B?YjY0WHY3VzBweTFROS8xeEx3dXhONnBjYi9INlpzTUM4ZHppSTNwTnZDQ1c2?=
 =?utf-8?B?S0VTVkxxakFsUHRFeEFuc0Q5d0ZLRkh5N2JTR2NBY0ZDZVFCYkV4TWhkMktq?=
 =?utf-8?B?S3NQaEFKdll6VFUvOFpzZnVENS81ZGdqdlhsWUZYWWhLTGpKQkRWWW0xUElT?=
 =?utf-8?Q?mZ94=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:52:06.7482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 469eabcc-59bc-4bde-53d3-08de33cace27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073
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

The integrated info v2.3 table in the Atom ROM exposes available
options for the VRAM carveout sizes. The carveout size can be changed
using the ATCS function code 0xA for BIOS that supports this.

Make these features available as sysfs files, so that users can set
the carveout size in a way similar to what a Windows user can do in
the "Tuning" tab in the AMD Adrenalin. The newly added sysfs files
are:

- uma/carveout_options: this a read-only file listing all available
  carveout options. They are fetched from the Atom ROM on driver
  initialization.

- uma/carveout: this shows the index of the currently selected option,
  as shown in the uma_carveout_options. Writing a valid option index
  to this file will change the carveout option on next boot.

Note that above files are created only if BIOS indicates support for
it, i.e. where the table shows non-zero UMACarveoutIndexMax.

Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
Changes in v5:
- Move uma_info from struct amdgpu_atcs to struct amdgpu_device.
- Move implementation of sysfs entry initialization functions from amdgpu_acpi.c
  to amdgpu_device.c
- Adjust function prototypes and how they access uma_info and amdgpu_atcs in accordance
  with the changes above
- Do clean up for uma_info in amdgpu_acpi_uma_option_fini() only if allocation size
  setting is supported, for uma_info is initialized only when this is supported
- Link to v4: https://lore.kernel.org/r/20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com

Changes in v4:
- Correct format string and error message in carveout_show()
- Sanitize input array index in carveout_show() to fix smatch spectre warning
- Fix typos in comments for amdgpu_uma_carveout_option and amdgpu_uma_carveout_info
- Link to v3: https://lore.kernel.org/r/20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com

Changes in v3:
- Change the unit of memory carved in UMA option entry from GB to MB and use
  uint32_t instead, so that options below 1 GB can be properly recorded.
- Rename the sysfs interfaces from "uma_carveout_options" and "uma_carveout" to
  just "carveout_options" and "carveout", and put them under a new uma/ directory.
- Update docs to reflect the naming/location changes to the said sysfs files.
- Rebase to latest asdn
- Fix LKP build error
- Link to v2: https://lore.kernel.org/r/20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com

Changes in v2:
- Move VBIOS table parsing and sysfs interface creation from atomfirmware
  initialization code to amdgpu_acpi_init()
- Create structs that abstract the uma options
- Move the parsed carveout options from atom_context to the amdgpu_atcs
- Minor kdoc fixes, as well as adding example output for uma_carveout_options
- Link to v1: https://lore.kernel.org/r/20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com

---
Yo-Jung Leo Lin (AMD) (5):
      drm/amdgpu: parse UMA size-getting/setting bits in ATCS mask
      drm/amdgpu: add helper to read UMA carveout info
      drm/amdgpu: add UMA allocation setting helpers
      drm/amdgpu: add UMA allocation interfaces to sysfs
      Documentation/amdgpu: Add UMA carveout details

 Documentation/gpu/amdgpu/driver-misc.rst         |  26 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  45 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  54 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  77 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 167 +++++++++++++++++++++++
 drivers/gpu/drm/amd/include/amd_acpi.h           |  34 ++++-
 7 files changed, 404 insertions(+), 1 deletion(-)
---
base-commit: 5de8ce0f3709ad93ca5a579aa45cf1b52d72bc90
change-id: 20251103-vram-carveout-tuning-for-upstream-1d5189688d73

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

