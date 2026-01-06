Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B60CF9BA2
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FDC10E1D5;
	Tue,  6 Jan 2026 17:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YrwzNnh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011022.outbound.protection.outlook.com
 [40.93.194.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350F110E1D5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 17:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsbJncF49TT2LODyjD5V58jvhrjR+fmVlTGusU9Yw4ARnjY3t5zu1F795krVWWtrflbcuNgrl0xNhLPFQWzx4y5vz4c6K9AeXBrfEVx/p9fXGSLurDi9IVd5xFzLTf4F4ezXcWfL8ccLglTsnhPslH5BIHDQl4y6BLWYSHq644hW23/4WbJpGYnvTEVaaJ8YuNX/4FHvcwAq5nnHE9YJKHh3n6sg1uenqoEqWlezoIt10OpBcjqI6d2FlZMaSeF32ipJhoxzJmgA3DkdMOa51BxKr8VApTZgNjtEwiY4vfhq/PrPzzHLV1hl/W3Wk20BbNUEqLLzVont9rp9ive8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+4l/Zkr75SJk+KZnbptK80XFZFLHmomhmNbNnqpCyo=;
 b=ho0ut6wG9Opq6jqGND8fh2e2X3eiBQhGp+2Dz0Sg/OGX0wDUzMQya3dWO9EQabbUwzbQoYaZYIJYpTqCZOQL/if3BHUisw9a2QBDytlS/43gXZJ3v4xOytivyFPj8a3sKzIGOqUuo7T5+aJu0n0sB06MaKGU2w6fiEAhcHkQlHHLJLJOimADlqq0d1ZCTDH5pxKIccQ1EY9fbx7+8uMjweDCaEZhT21dkZ4+Tea8ZU6ru+0qC4aQA5QUnA3JrqH8TeAxCaVr/fFmxMy3p6S8MDV+qO4zuUVEhJFnX+Of+vJCoO4CIo9IvUC8R3bnz+s8Fsj8ywtrKxLX9406bL+OsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+4l/Zkr75SJk+KZnbptK80XFZFLHmomhmNbNnqpCyo=;
 b=YrwzNnh7EZfMpNF7Z9MFR3e+TNZE42ERwozHlnxqqjKSP705FK+E1R44uPrHvJwihjD5VnlAQYdou8HctHi+OhtcC9UnFRlreSJuvUFQAZj6H6XaBcr91OqGrUPfK/wg2JFj71WWFOp/btOaVf1YJGQIH45TxeV2bGk6a6KXE4I=
Received: from BYAPR08CA0001.namprd08.prod.outlook.com (2603:10b6:a03:100::14)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 6 Jan
 2026 17:35:09 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::12) by BYAPR08CA0001.outlook.office365.com
 (2603:10b6:a03:100::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 17:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 17:35:09 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 11:35:06 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 6 Jan 2026 11:35:04 -0600
Message-ID: <93210832-aa75-7639-c9d2-99ec802d88e4@amd.com>
Date: Tue, 6 Jan 2026 09:35:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>, <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <VinitKumar.Shukla@amd.com>, Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
 <20260105172956.3732123-2-lizhi.hou@amd.com>
 <3e19f17e-3d5d-4b48-8776-65ac2543c066@amd.com>
 <8495eeb5-b049-2efc-4ba7-c6dad1747501@amd.com>
 <4363d65e-c50b-eb1a-39d3-99a9809f3c37@amd.com>
 <b6c80015-d399-e8c1-4b8a-d2ebb4cee9da@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b6c80015-d399-e8c1-4b8a-d2ebb4cee9da@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e033342-a5d2-4882-3e88-08de4d49f073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVdKQlQ1RS9nMU0vVjZmTlZPY0xtUXgyWGVsbmhzOFU1MXFOY0kzdU1rTDhK?=
 =?utf-8?B?K1FCbENtR25FTTZOdzJIaVVTL29WTWdLMzdoT1h3MU8zUTFBQ2JpZEo3Nmgx?=
 =?utf-8?B?ME1rRVZYSXpWbXdjSTRpSDE5N01OYlBGbGJGL2MyZ0JKWldQMG9tZ0FYNnhW?=
 =?utf-8?B?RHJra3VqeE9KOFdpRVZrY3JmN0NHVk5JS3p5RnJuOHBJYXpIT2I2REQ3TWc4?=
 =?utf-8?B?TUJMTUtVeU1LaFJLVHNSUVNuemlEQ0Vld3NQbFRtZWc5TEl0NStQN0M0ei94?=
 =?utf-8?B?K1ZFbUVSZkkyYzlHOElMd0g0TDMwUURXdnZMMlE5SHlnS2VvMjNMY0dsSUpm?=
 =?utf-8?B?ZGl6aXA1ZVc3NE0wN1pFSmVpdEsrSzFJdUJGODJ6TTBqNTNpUE1WYU5PbXVR?=
 =?utf-8?B?a29ZQlo5THpwbGZKMmFKN0RudG9PbHMxZHJWRTZ4bU1nM3RRRDgzZmthSTdl?=
 =?utf-8?B?UHBCODR0MVIwZzQ1bHlJYW9RamlDUjVnSmlqR1h1bDROM1BRaE9FcndzRjdV?=
 =?utf-8?B?S3hiQk40WHdtODhmcU5oRGc1SFlxdmJrcVFIQ1hvaWJKL0N0ZkpRWVZIMUhY?=
 =?utf-8?B?RGRCUG5LMU1VNktPcDk3bUIxQTlCbTZQUEpOUVBYaVU5K2tTdkNzcDNYc3lZ?=
 =?utf-8?B?VXNMcGJQV1BGeEwwejR5VU5kTnUvYXJmMTFHY21MWERTZTc0K2tLdTFLc3pV?=
 =?utf-8?B?ZzNkd2J6Y3NzRUo1b0NWU0RXOERJaThtZFZDRHhVUlZWRk5ZMmVRdTN2Qmgx?=
 =?utf-8?B?d2d3a01meFNpNXhmdGQxSXN3RENUcDZMSWhockZicE0xdTkrM21hekQzR3lY?=
 =?utf-8?B?TWViMUJWTU95N0o5Qk5Jc2IxU2RrYUFKYWQ2UEVNNUVYL0twWEZLUUJlZm9H?=
 =?utf-8?B?MzJmcmdIWko1MmkyV3BNZUhEYnAvUytoQm9pY2gyM2V5eTNzTGswbUVwTkVP?=
 =?utf-8?B?TTUrMXRhMDc4TGNPaUtSR0JVdk1tTHhKbWUrMEY1aXVZMzV0WGtMRUh2bXJk?=
 =?utf-8?B?ZWU2OGFLOFN3YkkzL2U0Q3FiSStDaTRDRmtmNUtOeVRFY1Zwd0N1VjFSUmwx?=
 =?utf-8?B?WkE2Y050azJMR3BoeHg4eEpJMDQyYVUvM3FUOUQvL0N3SUxLbWNnZEs2ZWov?=
 =?utf-8?B?WTR1MkNTdVRPRERRTUNvMW1PVExGRk54OXJwdDljdUQ3OUJkZmd0eXlsOWtJ?=
 =?utf-8?B?TU5sYnpuZG5yekQwcUszR0VRVDg5Z3c4cDRkUUg2QkJwazJaRUxCNEJDWnhy?=
 =?utf-8?B?U0xLUi84KzBsQ1pNdjduc2VBMkM4S3VJcnFSS0tzd3ljczVYc05vdzVxdEZm?=
 =?utf-8?B?Z0dyOHExQ1d6OXRyYW9waUwyOTQvTjBraTYwZzNEeXhRamkwTG9VSlhINk9N?=
 =?utf-8?B?MmljR0Zvc0lBQnpTTGwxR3RTRzBscmN1WEN5dGUzbzhSU3FUVDNMblUrZ3di?=
 =?utf-8?B?NEhWTUZSUmNBa1lyN1FXaG9GakNwVlhOKzBZZFRQVm9VcU80c3J2MDBmb01o?=
 =?utf-8?B?VlFIdEFJU0lyOWN0aTJBME9NSXg1TURQcG9pQXRxSUE3QjJSMkdEdndyQnhv?=
 =?utf-8?B?TEJWN2RzMG4rVTE2aThLbkMrdWZGcnVMWWhqVnd3RnQ0R0RGcEkzdU5hWW9K?=
 =?utf-8?B?YmdsSkNwYUs5Rk1pV0VBWVNOSGtPajlvVDd1cmI2RVljaGMwcUJEelFzZ3ND?=
 =?utf-8?B?bDVrVjJLQzZhblhqazZTbXhhazBTTDJyQnpscmhyRitiUTVRYjdqUXpIekhT?=
 =?utf-8?B?VFkvOVlucm5WZ2x3cXJwSlVseUcrWjBYSkI0ZkNtTEx3NzhDSXVreDFhdS9W?=
 =?utf-8?B?QWs5VGEvL01XQlM3UmFnemd2Y2M5NzVFdmJyRnBiY014TVB3dzdWcTlpT29B?=
 =?utf-8?B?UWYydlYzOHF5WTlXemh2QlNUTUpMblB1UWlyS2F4WkFGTlFtMG95SE5kbTRs?=
 =?utf-8?B?OFVXZHZRdjU0RTFwdEVIeTRQOFZiQmN3OTlMTlBxazVOTkZYVzF4dHpyRVF4?=
 =?utf-8?B?STV0NkhYOTlVN2lGMmFQQzAzOHl4bUFwb1V5enljSlFJcWZUblRQS2pBMitQ?=
 =?utf-8?B?SVJwMjUzcGR3NldwbExub1c2US9pSy95RU9pUjNOOFVQejJQM1U0NGl5cjFt?=
 =?utf-8?Q?LZk8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 17:35:09.4120 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e033342-a5d2-4882-3e88-08de4d49f073
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580
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


On 1/6/26 09:09, Ilpo Järvinen wrote:
> On Tue, 6 Jan 2026, Lizhi Hou wrote:
>
>> What should be the next step? Should I generate both patches based on
>> review-ilpo-next? Will the amdxdna change upstream through platform-x86 tree?
> (We seemed to have crossed emails.)
>
> That would work for me too, but I thought it was wanted that patch 2 to
> go through accel?

Thanks a lot. Glad to know patch 1 is good and I will not post another 
one. :)

The patch 2 depends on patch1. I agree that patch 2 to go through accel  
which can avoid conflict with other recent amdxdna driver changes. So I 
can wait the patch 1 to be upstream and reach to drm-misc, then submit 
patch 2 there. Does it sound a right plan?


Thanks,

Lizhi

>
