Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879CC96CEE
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B29B10E392;
	Mon,  1 Dec 2025 11:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HQma0Dxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013052.outbound.protection.outlook.com
 [40.107.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83E10E392;
 Mon,  1 Dec 2025 11:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l37jOgeksr2gGT1SjrFj0qLqqId8nSMiOP0BWHq/y84WxFFrGNprpc0xsyQhWqSxQVUpUiyOzAduxX6knl/f76dHxpCN1DgdNg6IUfZ/+r4x+gbNs6JirCDcmJlJcEwFEhFT7HLoq/1Eh5/2wj4cK0mOw/I2B98kJKJxtIAFyvdmtqA3YpKsfR6S0q9iajEJD7XNaRKhHtMjohaHHmT4HmndlaFba/ddhYASxhFa/4mGrpM37PgFU8vRMGHBH2bCviG7zUH/0F8taHCxyb8+DIu6QdBI9VP3EVfNa10VF8pUJioej3lw7X+GPf8kpKRBfuF22RCc+0uCLVFuPW0sAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sEUPMu0bbKncBDErlGveLJlRCO9GGItRM9nUBCCnLw=;
 b=gU7nZBREy3DdRd/VSr0TUV1UD95iCXDiFkvbB5vRyrVv0Umm8PRVwnMMSfg7fKCMHXsEf8EzuMyTxE8J84HhuN7YeUmxNhpvLRpzvQhJ1MFGmoSnjUfYTKsYmaF/3eWn5f9+5IFOAGENX50wVSF0m4p7R8FexgyoBOo+FcBFgW9yf6ueNumA4kL6hw8psVeclxCqLcKJeP0x8q8V6TK6KMaomcRi5xHdD7NruGcTitcdQfl2hZwcjCEdSlJsqv4gqtG7Vnh4YGK6tYExqvCdw7FfJhqiQGTNoT0NxCkZ2J2i0EibtEsrpDXUm3lrAshWXT2Tsn6xunQ9cQByAluWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sEUPMu0bbKncBDErlGveLJlRCO9GGItRM9nUBCCnLw=;
 b=HQma0DxxebNEsA+DJYtZXtPQ1oSBaMxyreynUZmSLPwHM+YnSC1/kW9WGlUaRvgOOR0oZvAfowo+s5M6Aqg34f6D1W1ONfRdwbtPveVtAsZWHqGk03Riw0wHp/FXj/Zvc8sfhE+BFg0PFb58Qw0gFmqnILH/B5ZzbxP9nm96GCg=
Received: from BL0PR0102CA0059.prod.exchangelabs.com (2603:10b6:208:25::36) by
 SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:09:09 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:25:cafe::47) by BL0PR0102CA0059.outlook.office365.com
 (2603:10b6:208:25::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 11:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 11:09:08 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 05:09:05 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: [PATCH v4 0/5] drm/amdgpu: add UMA carveout tuning interfaces
Date: Mon, 1 Dec 2025 19:08:08 +0800
Message-ID: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABh3LWkC/5XNvQ6DIBSG4VsxzKXhAP516n00HRBQGRQDSNoY7
 73oUrvZ8T0neb4Fee2M9uiWLcjpaLyxYwp+yZDsxdhpbFRqRAnNAQjD0YkBS+GitnPAYR7N2OH
 WOjxPPjidnqByqOqiqlTJUHImp1vz2jcez9S98cG69z4ZYbv+o0fABEOpqShpwWqZ38WgrtIOa
 LMjPXjAz3g0ebwtGqV4RRhRvx47eLQ447HkyRZKWksuGya/3rquH55x5w9wAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3306; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=l5aAXA9iBLkvODjgGqVkvl1aEbkrIDmtdN37xoSM0nY=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpLXdOJXLYSX/wq8QrE3d9zdWiaC4spcMJT0x7v
 N9NKfg0c8iJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaS13TgAKCRBfF7GWSinu
 hhItD/9KNHaKYCCjqufUVxIfiZF7GZ6I7a8/TXb7pLP3HlIPqKhfHKE+JzJMQ7PYlYiBWBigcno
 j8wdJVO63sJzhq0ZUbRtT+WFB2NYbiw0oM2mEUhj2eeiXYbtSfFFSrvO9uSy87nlfaSjdDMxHvj
 cTc3slKk85l/cagHj7D3nIMZsmWgm1RylbrKSHwljbnB7nIyz/yDF9iJ6rP+fwTgT/4uTcWHeBH
 VpQmN23OqyrB+htAbfFlmFj5pylMBsZ5btV0tcd9V+vsTJY+90YdpYCzkQ9QQ35c9jZP5gTjPwu
 adeESIT59h4dK646nF9qL4LK9V7rUAN0dYCtYCdjL2YR7JKYkwegQnPPw1bYTfRdpMd6IKTpfGl
 F1Mut77UK9b7heejNC7kdKE308KYgqw12y35BDzCTz7crxWQcLWVEU7Xyp8TVTtTQWIRcT5x2Qn
 tlQ2eVWHFLGE032YhkEeiLctMiurBWSsEpD3GvCFUEjGQtAyB4QTjGEm++fJddYFe9vu+evMAS5
 K9UXvBjM0XqkPVpOk9RyvnWvVEta40+5I1byLPp5t4CRX8yisYePxDpXcssaq0N1Fc7d3A+LSd9
 wWwDWo0qsMUxHKNxVI3RXW6KzgE20Rf5RwYEkmz9g3v2ZXH8Bdd2kyGkFhj2gVZ/JIoy7ZwbeX6
 h6I31JZb9Q4FGxA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bfafab-3c70-4926-18ab-08de30ca0cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|36860700013|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDg2T2xtd082L0VsRkVxaGNaemRWRkhRNGdZSGNWOWt6aHNsdWZERjQ0OGhH?=
 =?utf-8?B?eEtsR2tkR0dKSzlmaEIxVFFnaWJldmkwNEFRNElJSnhyUk0vSHFIUWN4LzRx?=
 =?utf-8?B?TkV4K1pPb0szc1gzZ0YzUUtmYjNiQnY1a2dWcmNmUWVld3BRVG1KZkZSb0Vr?=
 =?utf-8?B?dWhteWloWHhXQ3RMMExNanRSSTM4WE16QjlBTFdaeVJWSWY2SDZQWFdyUU9Q?=
 =?utf-8?B?ZEFoOTJkVHY0RGlsVDlZQTc4dXA0M0xCYlJ6WTBMb3BJMEt1aFZTWW5xb0dN?=
 =?utf-8?B?YmJQZHVnQmVHV2hxOTFYZ1IrT2dCNXNrRzArV0V5Q3NWajlZdjYzS1BJY2pt?=
 =?utf-8?B?WlhKdDI5MHZUc1hkd0k2U2Rpa0tidnFTcjlPUXBHd1A0MXJCZVQ5UnZDVXJ3?=
 =?utf-8?B?QzNGWmlhS2hkaFpxTzVlTG5VWVAvUm1Xamg3a0tid0hXRkF1bnpxOTkwR0h3?=
 =?utf-8?B?S3JWajMvNmV6M09tNWIrRGU4d2JNd1lYR0JTSHBLUEpOMHQvMnZNZkptU05K?=
 =?utf-8?B?QnlINXBzNDRVQ1V2ek9oUVRQYXltZVpFUzZ5N09WMUhqU28va3luMyszRDNw?=
 =?utf-8?B?aGhvalhaaWZzb21XaUQ4ZHMwbWtTQVBRUkxPWldpTlJIdDBHaUwwcWgxejRS?=
 =?utf-8?B?dnk2YTF3MTFCR0NSWnBTUnJGcGRNMTBNNGpqQlhHTk8vanlHOG9LRCtUWXFM?=
 =?utf-8?B?RWNaZHNiUUF0N1ZpVCsxWFlIb3RwYk5vZXlRc2R5UUpsaFd1K2JjWm9zcTlj?=
 =?utf-8?B?SGlic0hHK0ozNUorbDdaYzZlWjg2a1ZRUXhJbHhUQmdZbVppaFBBOFlZUFQ0?=
 =?utf-8?B?WWNrQ2x2d0xSays1dEJ1eGtrN1lvYy91SjJZV3FvOUJBZUF4VmlEdTJRYXZp?=
 =?utf-8?B?TkpoWUVBWkIxbkp0NTVYZ2JUSmZCbFgwQkNjd3U2cm9TZkh4Mlh6a3IzOEZZ?=
 =?utf-8?B?MDlSNklhV1pwaGl6Ym54ajNkeXZUTFNpU0ozYzBOR0lJRnhrc2VZTGlTd3FK?=
 =?utf-8?B?Qm9zenkySHNWc0YxK1BnN3VKZ2t0NFJhNGUxd1k4eTMvcTJNSlZuakhvUHFG?=
 =?utf-8?B?Nm9nUlZnaExXUUZkcDlkZzFwYXhvcjdKMUlXa0RFejlLQ1B1TjM4NUdiY213?=
 =?utf-8?B?UmFUSXpEKzJvNUFIaC84ZSt0VldNVTN6citORnJtbGpWcXdLaVZnTjZMTXBm?=
 =?utf-8?B?eEdOVlBpTEszTEFtRlc0WUtlVlgzMXBoWTRoTThhMGhaS3UxOFNBd3NUbGsz?=
 =?utf-8?B?SzNSZXNucVRQbWlMSVZXcisrWWtGRTZvRFZDV2x5T1N5MkcyS0lvZENseSs2?=
 =?utf-8?B?d00wNnZKTzZlZ2I5Q0NubjVPVzBKYVRRc045WjZ3MERrNkltQWdaeTROVk44?=
 =?utf-8?B?U1Y2YVphdjBjTDJ6R0xUUnlmRi93NXBXQjhCbUhPd0JnRHovMkgxS2p3T0Iv?=
 =?utf-8?B?WU9FU3I1dy9mN0tkbDhBc3YyajVvSkZiNE9QVER0bkt5RlJLZFJ1UG1sR0h4?=
 =?utf-8?B?NC9kam05VEdqakJQL055M3JzWGtwOFBZK29qZVVoR1pWcHhFMHNFMDhBU09k?=
 =?utf-8?B?YUNtOWNrbjd5TTlTTGdsd2ZON2JwSGdJVjB3RkpUZFVSWEd1WWJ4L2ZuOVQ2?=
 =?utf-8?B?M2ZIeXhqWURVeXNQWGQwVTJiUDVVYzhyWDVNdnBTVkdqbnI5SmtSS1hzeUU1?=
 =?utf-8?B?Q2VHZnNXa1JqeTlnbUp2dXpkMDVtamZhRTY3WVkvRmxZSS9hNkNvenEyQnFi?=
 =?utf-8?B?WjdUSURXVjlKVjdCZ0lXajlvRHdCSUM3OVV5VUNnYy80SHA5Wkc1dzlZWU1x?=
 =?utf-8?B?STg2VUk4NXlJc1FidEtOWmMvQzRzdWNGQms5aGRJTGJJVmpMaVJya09CWVht?=
 =?utf-8?B?eHJVNDhIN09Kc1Aza2lYdzN0OTBJV3M0allvVmkrUFowa2JyR0kwT01Eb0RR?=
 =?utf-8?B?SVVBcFE5ek5vNnFLRUF4ZFdKKzNMMFlFS0FDblJBUTRXZ3QrTTFoQ0lFanB5?=
 =?utf-8?B?bmM0UHFHa3RrQWUzRzNoNXlkVnF6anpDK1I2QXJmZjVLVVMxdTJMZVQwS1FY?=
 =?utf-8?B?SkxNR1pKSVVocXpDNllOUUhocTdIdXlMZnY2Vm9BUjZCakkrMlMyeHZtOEth?=
 =?utf-8?Q?osJPLo/oR0HlI4EHr08fX96fT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(36860700013)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:09:08.9442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bfafab-3c70-4926-18ab-08de30ca0cd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604
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

 Documentation/gpu/amdgpu/driver-misc.rst         |  26 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  39 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         | 217 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  77 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |   2 +
 drivers/gpu/drm/amd/include/amd_acpi.h           |  34 +++-
 6 files changed, 394 insertions(+), 1 deletion(-)
---
base-commit: 5de8ce0f3709ad93ca5a579aa45cf1b52d72bc90
change-id: 20251103-vram-carveout-tuning-for-upstream-1d5189688d73

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

