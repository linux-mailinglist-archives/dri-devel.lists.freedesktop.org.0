Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE94C88D51
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6AB10E55D;
	Wed, 26 Nov 2025 09:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1bO8MGhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012044.outbound.protection.outlook.com
 [40.107.200.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024BB10E55C;
 Wed, 26 Nov 2025 09:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlASSkCzFIyg4/KPknbo690pinxPIwqAzrwRKYwrg1MvNiX7C8kTHc7dfDoXWfZxyPlnTADbmOEQ23KwD/2nFcCZKXWkOycXUGPhHqDOxCaiG1i89vkgI8zeEya8RWYaEXrWuHtsACAcGQtUkfhy0WmYVgwkx2nz5Xria62a7r1S34FVsefIy+SeRCgNJjyUFOuN6wUE+HEwT6ifCSWkdMXK2w5OtqmcXSW6CkMPTBH0F0pvKPDO8JaBVykJWZIUxnpu/5bPywCPy27rYrh2RTGbfRFxeJl2ihk8RcvH1EVCgyt/SCmuo1eS0bJuB9+5tJZ4nO4g6wa5zYcuUrHQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjdjtR/kp7cP7QGrjKNWAS0N3sHrN28IPryUpnKL7WM=;
 b=EovcCu81zjD9DSlcn+JaSN32ffZ/KvKKw4AIAFwmsw8H43MCkfF2tAQHwhR/G5JoI8WrKVFWHHzh1FKX27O/crQefIflLJoVPNsRZpWPH39x7ZJ3BYQkd/c4Upa0OAcfcvIohKGeYAQqxOYX+KWqpaKLPmiv0f1U2uw24dkauHzqDJ9F+aUZkTFl8uA6E/yAXw+bYiNf4IrIRH7IuCO5ybuQQbKdlcaOKzqMltSsWf4lzSCbkbDxMpyUOdet52Ap4dJ362pxAUxEuTzZNUa2XVe7+qVhsyW/Beig3I1he/Mfgo8Z1hHGzPdp4lIWfzDD08P5csVVhLh9IRv0alM1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjdjtR/kp7cP7QGrjKNWAS0N3sHrN28IPryUpnKL7WM=;
 b=1bO8MGhLiAXLxj/0QTBaY5uQi3EKN4HjQ7GEEa0kgLTJNQYBDBLlgEMBEQSSqdB4H2oSuInQqLVFRdGhlz/5bqoNVuGWXuIDY7hCOYcf040TbQLYQ8MdmdorQiPNN4WHWOdi7t1LCjuD5vGzGKdQI+/v35yQbrtI52CeZSMtMJg=
Received: from CH0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:610:b2::35)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 26 Nov
 2025 09:05:31 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::c4) by CH0PR13CA0060.outlook.office365.com
 (2603:10b6:610:b2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 09:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:05:31 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:05:26 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: [PATCH v3 0/5] drm/amdgpu: add UMA carveout tuning interfaces
Date: Wed, 26 Nov 2025 17:05:11 +0800
Message-ID: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfCJmkC/5XNyw6CMBCF4VchXTumFy7Fle9hXNS2QBdQMi2Nh
 vDuFja61OU/k3xnJcGis4FcipWgTS44P+UQp4LoQU29BWdyE055xRgVkFCNoBUm65cIcZnc1EP
 nEZY5RLT5yUzFZFtLaRpBsjOj7dzz2Ljdcw8uRI+vYzKx/fqPnhhQYI3lquG1aHV1VaM5az+S3
 U78y2PlLx7PXtnVD2NKSQU1H2/btjcKJlG7IAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=wiRUzFKtZ44YqUyz5ZLvPMBYO/tv03Mmc9PnjjZjRt4=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpJsLU8XesXvD+EdbYQIGs6g+CKwmfqpbH2X/b7
 u7mTvt7/F6JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaSbC1AAKCRBfF7GWSinu
 hhuKD/9gQSVAbgoj1DFqFVYw8AOO4s7JBCqvC8CE6BJcmEVZkOnsPwu/jca5H9xtJxXaqMODp1M
 kYcCadJGkak27LD0zaxE786H/1n33IGx+QTV+9Ja6S7OnTiLT2LMGCKYqhJkzxz0eqJ7oTLN7m4
 xWGMhcsVo41PPUvz2bwdGaLe3hGaOpn+Z7ZIvk6+O736bIFbbnBowf29ynessasGcUWEQbgJnve
 FRR1Z4Rll5kub7WupxPVk0RKRgb8tiKaqqRTd8OmwXgusP/rkjSzmWW9zs1HqhnR+UpR9MhBoYo
 sLRTgizfd4odmqhtFN2YQOPuQuJl2soCWuHVhOoJvI6SqWTgEwywFyBsxejD4RU9mERz6eSIWpm
 48QK+XNU33mxveRrHPkJd7ASYSLfCqV6tBHOhdOsUIIfGr70uLlGHsOmX1dLbbqS9sFgh+tFGz1
 Cvjw1ee3AJ0lt0fn8nQcg987na8FEGHpoIZ81FaErZVYxBGu7TNmzjaoTIiHgUswbwbHtTEvkeG
 W3FLVHszpq1xSs+nMehYtnuHv082LQRDiCwHTdsdVjNQ8N2zzG+5VsdcEKgIb7EsogpHxQ96TFD
 kxVNwW4dUeayu10rdNwFgnM1DpMRNlyRw4i5OVes7wp4TLkEO0+M2pCvCbBhV/2JYQW18rvW/EN
 UcyCHJzfhgS0g4Q==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e057e0-af01-4284-7a73-08de2ccaf358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2ZCOGRVRTEwMlNyVE14bHRhYjc4NjNiaThBdU5OVmkrSVo2NzVVVTAyM0x2?=
 =?utf-8?B?d1ZFRXhEVmRQcGdHVWhVZm41ZDFqbDBSbWhCREswUGJUR1d1YUZkSlc1cDZx?=
 =?utf-8?B?R2NJNHA0dWlNMlViWVVDUVBTRmdKSnVtYkhkbElvL2pWLzZ1OWUxMWw2Smlu?=
 =?utf-8?B?bzkzbnN2VWk5QWpjTXZnREIvUEtkYllqLzVOTWhPUXg2V1kwOFJwNWgzVFln?=
 =?utf-8?B?SGtnRklyL2VrNGgzOVZGNEQxSGxvTmRMNno3Z281a0FkKzJzd3p1blJKVFdQ?=
 =?utf-8?B?aElvZGtvQzRnaXNUMFNKM3owalNZMHBwNzlIdmEwOUJKREQxNnJiTStqOFhI?=
 =?utf-8?B?T01rbndUdHQ4c3cybXBFeWFNam9ncTVhRUUwUDhMSEFJa1VvKy90aDlaNk9x?=
 =?utf-8?B?S0JXUXJUYjlXdHpBK1dHbDgrM0xvWm9DY1dJVU9lQmkzR2N4VW4vd0hoR3RP?=
 =?utf-8?B?Z21NUUZYb2ZiQXUwUEhxTUVtOEtnUlR6UlRkQllRZU9acEN5WDYzTHkwdXVP?=
 =?utf-8?B?RlpLd0Z0czNxY0l6UTdmd0NWL1NIWFZLY3RRVmcwa25MZ1drNnB3cDhIRTlB?=
 =?utf-8?B?WDZLRGgvbEhJYmZkSC9lWVhsb2pOdDk1WVVuNjNPUzFFTUJsbDRNYjB4UktY?=
 =?utf-8?B?VlBHbWovOEpPL0w2UUJZZTJOSVg5Nm96aXd6dkc5cWNmR3MzTUFoY09oREVs?=
 =?utf-8?B?clJqazlHakNUcVdzd0lDS3VvMnZGcStqbTlxNGhLSWQzbWR5VGFwY2t1T2lo?=
 =?utf-8?B?MU5sZ0l3RTg1ay9xNzBMU1ZHZ2RQWG1qTGVIeHBKbk1PNkFNKzR4MzZvMnVw?=
 =?utf-8?B?eFlnb1psUEhDOXRYNVlKblF1UUYrYjgwRUR0KytOTGpmZXJKSEJmNWNXL2RE?=
 =?utf-8?B?Q2lMcmF3NjVDd1VJanZZZUNOOWduZ0k1SnQrNGRIZ01QdDRaeGZnbWd0empC?=
 =?utf-8?B?TzllVi9DTHk0bWNOTzdrWm96eC9qSW5Lb2ZwZUR0NjVURVJRVzlUbXI2WWtH?=
 =?utf-8?B?d3VUSWZIY0c4R0NDVzdvR3Z0VlluZEV5OEF5Yy9jd01pVDNqSWlpOFRQMnhk?=
 =?utf-8?B?bHdqZ1NVY1J4SEg2YUtIK04yWTVGbWtpU0g4Qm5xK3pFblUzb3UxM0xvUzlk?=
 =?utf-8?B?QnFkUlFOZi9McGxMeXlCazhyZHo3T25ZVmJFVDdNTnVjZEx6RE1OMUdwYUVV?=
 =?utf-8?B?eEVJY0c4cVFHTHVnSjVIRjlnbTNkSGFmMk1tTjBzWEZLcDdpd1dFcGlwckxL?=
 =?utf-8?B?MDZ4N3E3a2pBWENxeHlEWlRaSTA0L0tDYXFlY0Z3N2hmeTVTdU5tV2lFUkU1?=
 =?utf-8?B?enpjcWJEZ0JBL05ZeENGVDVhRDlOTGw2VlRwWmthZXNkQ3c5Q0Vodi9SUXp6?=
 =?utf-8?B?SWQ5OWRzQmJmOEJaaU44K2RmNmFrdGh0TXhpWnlncmdFMURpZDdlaTRhQnB0?=
 =?utf-8?B?RUsxTWp4YU9wb21oYzhwN3I1Tlh3aG9qTytERFN2bEFFWEM0eGtqZ29INHFs?=
 =?utf-8?B?NmJGRTNpaGs1cTAveUcxZzRici94aDk0bVVJNmNpUU9ndFAwL2t6QkZyVjRH?=
 =?utf-8?B?ZXN5UGtvTGxxZDJPeEVhZGtzNG1OM1Rjb2doYlBnVmptcTh4dXgxYXk1STZF?=
 =?utf-8?B?N0U1eHdDWGVYbFc2eURjTEV0SmVQUWkvbklVeC80ZGNldThWeG00anNiUjZY?=
 =?utf-8?B?OVd0UGhiZkxwWTNQeWpRZ1JVZEJqVkVLaU9vMDJ0VCt0YTRkd1RSaElHOUhN?=
 =?utf-8?B?bFpTdG5zVGtCZGg5dGl2T01POWFENFFzdDhQakNyZXFCRkVYaWpyc25vMUFi?=
 =?utf-8?B?VDZPM1RpOW1SZzNTNlh5b2t5L2cvQUZwUXJjeXVtVWpkcU9JTmxpTlVNdnNi?=
 =?utf-8?B?ck1rcGREbDhSN21wdnZ6N0dLNDRKOVVlMVhwYkFMdGlqRDNPeld1RWNTZVR1?=
 =?utf-8?B?bVhzUWF6aGZsbmVWSDlVUlpOaEJsbUlEYmVzUjYzTjN0eUFQZnMrRW1XaUxn?=
 =?utf-8?B?ZVRkQUJKRFpaYUt6b2tuOEJJQW5oWVVqNTlCMVJkZk04amp6bktEa3lxYWhn?=
 =?utf-8?B?M3RBcWhQcHhhdlU4TFdpOE1PVFROWjV6L2Q2a0VoUHFQdnFUc1ZnZVptWHl6?=
 =?utf-8?Q?L4KF3j8evU8F3sSuJZs7hgdjJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:05:31.0073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e057e0-af01-4284-7a73-08de2ccaf358
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174
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

- uma_carveout_options: this a read-only file listing all available
  carveout options. They are fetched from the Atom ROM on driver
  initialization.

- uma_carveout: this shows the index of the currently selected option,
  as shown in the uma_carveout_options. Writing a valid option index
  to this file will change the carveout option on next boot.

Note that above files are created only if BIOS indicates support for
it, i.e. where the table shows non-zero UMACarveoutIndexMax.

Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         | 215 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  77 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |   2 +
 drivers/gpu/drm/amd/include/amd_acpi.h           |  34 +++-
 6 files changed, 392 insertions(+), 1 deletion(-)
---
base-commit: 5de8ce0f3709ad93ca5a579aa45cf1b52d72bc90
change-id: 20251103-vram-carveout-tuning-for-upstream-1d5189688d73

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

