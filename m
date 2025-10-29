Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFEC1CD00
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1450010E21C;
	Wed, 29 Oct 2025 18:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yoB+NJfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013061.outbound.protection.outlook.com
 [40.107.201.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568A610E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwabGovJpZGdQPBjmqu4PbtyH2sc9S8zTsVvcwDmSvYHu03Z9iEQnzXIua/UFFVQeU+xnWdKQIW8vtaMdC4MrAs8CHDM1dmch2EAuoWRdpVgYX+FnIy0h7BYSaPLqDL+8fb+Uwo+7s+U2Bh3jWpgH7L7SflLeyEcz7RHx0PYEreEExGM0QI4HJekwFEYn49T8M1xzM0P4M91sZKcW8vjvZZ44487eYHV0loW7aSRIJXYFDnLf2UApmz4FfN6xQKYAp2DBVymA6sSwHnm86Gx5YvQUjk9BhrGt7ZhQ1RaxuOHxQkK8CQOU9Q8VZgXDkFyxSjegm1/qDH420DX1F5fIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YAQFMt36yAItpgGmWreTjUMQGco0rH9yXGKZOv6Nkc=;
 b=qErcJ9PP8uaed23yj1Es3TRtaOk0JD0GMYP9Qat1AIOXlzHewHLsYQMFSsVO4P1Vtwt//yAZOFj/vf9prQ3ArN1Y3t1Z1wpfdokIdztSuNWV0pG+nsqdhUZddCJCMmX8tnXwZAEkRB/PWfC2/n+MGAISFh7E+vV/qtJRHI/guwhbW8lBQJIggHDq2NbTv0ktqV9p+ZEMZw7zyO8kBe7DYi1cZpTnAK6tizaEdmujIianWkoFNijBjmxCebMxpHLPBNvrSS2Yi9bzgjrk8gL9G00Y3cvt1qW/gEBDgQblq9xcfkhheoFFxmSIZmbfhqZqcjh7TCn2Sg1ljK5uzhw/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=web.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YAQFMt36yAItpgGmWreTjUMQGco0rH9yXGKZOv6Nkc=;
 b=yoB+NJfnWzL36J5pukYpew4c7GRxM3PcASeNgQR5WSkBOKYD5vfuz+XYGscrsZB/gPUNOTThcyJtNAGajfojCdMQe7yu2KC0dT/zPNnfTkaawBIIsAQRgxVlcsQTQSeWt3IOLPOYWukrfenFfNQQmvpG+KidcfGdqnSh9r3sCX0=
Received: from PH0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:510:5::33)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 18:43:38 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::f1) by PH0PR07CA0028.outlook.office365.com
 (2603:10b6:510:5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 18:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 18:43:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 11:43:37 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 11:43:36 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 11:43:36 -0700
Message-ID: <1a29a833-793c-a65c-f5aa-9f7617ec92bc@amd.com>
Date: Wed, 29 Oct 2025 11:43:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, <dri-devel@lists.freedesktop.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>, Sonal Santan
 <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
 <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
 <fe8e60ac-5cc9-415a-9b45-563b373e5873@web.de>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <fe8e60ac-5cc9-415a-9b45-563b373e5873@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: b8662db8-85e0-434d-a6af-08de171b1287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTNHUXRBNFM5OEdINFBoMUNrYnc2eDNGNmNLNW5TakNqcDN6dHMwejh4WSt0?=
 =?utf-8?B?MWxSaGdxcWNraUxEZ2dYd1ZmQ1JwOHZ4eURVWWYwS1V3MnE4SWpuS1M1bURQ?=
 =?utf-8?B?bkZocVNxSk4xZGszU0NUWTBnYUZvS0toeTVCTkJ6enFNV1BnQTUzYlllSW9Y?=
 =?utf-8?B?S2ZyTFUzOU9SUXlnV29YY2twb3BwZ21mVWJpRXU5czZXOGZDcmNQdVZhY01J?=
 =?utf-8?B?Q3p1a2hBc0xDN0hlUW9TM0pIUzNRZ1ZTRmdJRHcyRXdLVTZzcGdySW9ja0J3?=
 =?utf-8?B?M2oxdmFFbGJoak1yN2RaYm9zdHYzUXZlYzJQaGZGZFhiYlA4ejlDR2JFUzlV?=
 =?utf-8?B?bjRjWjFTVFlmTmdOdGpkaHZHb1BkWmk1QjRyWGdCU3VjaDd1TWVPV20rSGk5?=
 =?utf-8?B?TVhBZThJVEtrcS9XWEVLOCsvczQvVVkya2l5ckxSSDRCZjdVajVEWGl6NS9r?=
 =?utf-8?B?U2RENFl3cC9jSzBGSEkrUU1NWTN2M1Z3bHVTMlhCL3Eyb2RBM2JnY2lDWkZO?=
 =?utf-8?B?YkppVkUyb1VEWnJVVi9Tbk40ZnFvR1pZOWwrWVFVYlROWXY2LzhqcmpsblR3?=
 =?utf-8?B?akI3MmdJV29IK0hZemR3dUJVLzlYUUFXUzhsM3U4ZWlGQzFraFB1b1ljVERB?=
 =?utf-8?B?UlFDYzBycXU4VEw5dVBKQjBEaFVNYzF1eXEyMEx3ejVIZGVta0QwazdFdlVz?=
 =?utf-8?B?Mk1HWk9PU2pIZEFJNkg3ZlpGT25xS2pFRnRDSzB5OGU1alRMSTh6V2kxVkk0?=
 =?utf-8?B?S3gzbisrbEVqZDdVdFRpU2dUTHE4L2JER0xrejR4SHN3NTNtcFgza3h0QzhO?=
 =?utf-8?B?UWRjMTVNYnhSWCtkdTRiMHRzeWhpYmRpcTUwenptTnQzckZnM2JmblBlWHlr?=
 =?utf-8?B?V1FnVU1SQmdNMGpJL1RFUURzbzd4TU9ySTRwa3ZEMm1TSXphRHlMdjdtRmFD?=
 =?utf-8?B?VEtxVHNCQnBEL202TnZYTmtza1A4bzllQWJiYkhkcGRLbWYrbnkwN1dKTDN1?=
 =?utf-8?B?VXFucy9lL0s1aGRJbzFSV1pkNHlZR0ZwK29wQ0dPSWQraEkwRWgydWE1MnJF?=
 =?utf-8?B?cUVjRU1yR2ZGSEM1djE3WlFDbkJCb1E3dlFwWlBVVndLWUxQUWp3NE1teHZD?=
 =?utf-8?B?MDIxYTZCNFNkVXhsV1JqaUlONS90VDN4TCtnZy84Z0piazNVTWRnS1NIKzdJ?=
 =?utf-8?B?bnIxUnlBVksrSkI2MmVxYzVQd1kwZmpzeUFnanFTdjJhbjdHRHM3aDNIaXRl?=
 =?utf-8?B?bDhOWGFSb3l3Z1lqdmJsL0tYcnlOMHEwSThNQjZpS0d5SXBXdHBMTWlWVFl5?=
 =?utf-8?B?M1U1SlpINjZnZHh6MU9VUEs3aXNLbk1JOGszRHJLYWsvazNFZ3MxWU9UM3JK?=
 =?utf-8?B?WDN4VXY2T2dXOHdiN0JuZE1FTmc0d0srZ1AxdURYTVNPOUR5RU9XYXNnUGJv?=
 =?utf-8?B?V09yZmVYRWNsRElKRG8rQUFUNC9sZ2J2QkF1eUtUcVpJSVlIZFJRcVl1d0lE?=
 =?utf-8?B?TVBOR3o3bzg4YUUvbWQ5ZnAvWEhWK0JZbkJjb2Nod2NoM2EydllIeWd6eEla?=
 =?utf-8?B?a25UM2hLcDcwajJZZmVLNTlkZmhmRDB3d00yUUt1SS9KS3JVVG5IZ0tnM2hH?=
 =?utf-8?B?emV3TjFLNEpHSzVyQ1k5MkpXdkJDNHBWeXlVQ1ZVdEpZSGUxRGlrdkFrMTNZ?=
 =?utf-8?B?WFdESmRwaC9UMndPY0ljUjlQV1BzTC9zUW9RNEp3bkNTRUg3eVdkSElsQ0xL?=
 =?utf-8?B?ZzhmUjBBSFVRMHBpV2R1RUhZdHRSOFg4RmRKM09hUW9ZZXEzeUhkbXdNc3lz?=
 =?utf-8?B?dGtNb3VqQWh3SnlMckJPVTRMejFBeE01dWhDZU9leDNuRWd6MzdwSkhSZUpE?=
 =?utf-8?B?Q1NNQmVOTllyZ3I2aTRlRUdzakZ4bTVVVWltSE9La24zTkdZZW9zeU15WDRY?=
 =?utf-8?B?aHNlckZlbHptWCt6V3ZGZGZMaXd3Y0VucTFES3l2WUNWcXc5bWxPbGZCTXdM?=
 =?utf-8?Q?qkT5D5yZo2iN+U9lIhG01NztRelh3E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:43:37.4752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8662db8-85e0-434d-a6af-08de171b1287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
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


On 10/29/25 03:40, Markus Elfring wrote:
>> Sorry that I am still a little confused.
> By the way:
> How do you think about to move the statement “cmd_abo = job->cmd_bo;”
> behind the applied input parameter validation?
> https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/accel/amdxdna/aie2_ctx.c#L197-L226

With the patch, the order changed. It needs to read the timeout flag 
from cmd_abo.

Lizhi

>
> Regards,
> Markus
