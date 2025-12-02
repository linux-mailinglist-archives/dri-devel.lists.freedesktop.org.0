Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46220C9A22A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 06:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C910E170;
	Tue,  2 Dec 2025 05:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wQVJVdB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656910E170
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aoxz5TdYoATDSqMrmLmI7xzhWj9de2Ajl+HFf4nb9mEDLzUix4SF4m213OVorc9xOcVpMUDJAr3QXesUGObhcpeXan8980Sw5+9nnpkOesPzQjefVNWaQB3M/fM/o+TYcM07BxgyiDUUP+4FfbTRVw6/+gjKpdPRljcP7DVfri5lLven/90Zs4sFgmebSom/4IVbWAy441MVmDMXqRr4JOHvR8a9bJQM29OMlDyhu0v+MTld1Wk60az2JY+QYI+gtxaPNI8lOf0rbWk32A9L2Ljh1TeK2YZe/T+sZ4M3o0AHjdR+m2/dEMmeENTf8ei5/Z1zSA6Ev7txt7wZXWyXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLKsZ/hW22TtX7fbPv5PCjfzfinHT1lJct+lbHsh+oY=;
 b=OwCy+4qwarOpnZioeG5kigcgwG122fv5I+mx4UApQPjytvHVXxcsw3TXjyoLDb2mQZCzIUSmJvkfUz8p6/vcpu9j6vGTxrR6dHhU3kaz3eiSiudqB69cNVAOdOJ4l0KYL1hdX2D9cErc/BAKAw3xOFB9rwE9hx+mtUonSz0wxz3C04ugjV8QucshxrXiVY3/CCXGtRGi6fOUyoUwFV7XrDPOJ6lpF3uodcUZ+v4vp3H4A4yzmyafTwxZDFBkFGFG8vKSy4bkyOA4z0ubcSjGL7uABYTbYJ+JyrN8LaBPMPxod5ZkIHhJepIBzD/hbmdNgIKCjoXUpTz4vj4gEg7kaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLKsZ/hW22TtX7fbPv5PCjfzfinHT1lJct+lbHsh+oY=;
 b=wQVJVdB8RYefeIAYCq3m1A3rxv1LUzgOunVe/TAio7onuk1r4vGuh9Q8TFTRFfwC1wnc+18YfeocNKeZKGP6LpC5Rn/bx55iZ+LEby44P/NPF7OjEDha52FKUYKlGfmIDmE4HszpK/WZ8+vmj+sS7U8M3PeXah2qAotjum+Zg0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 05:52:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:52:02 +0000
Message-ID: <b18d6c28-fd7a-43df-b2a5-a8af3050c2a1@amd.com>
Date: Mon, 1 Dec 2025 23:51:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Poll MPNPU_PWAITMODE after requesting
 firmware suspend
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251202053717.461943-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251202053717.461943-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:805:66::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: c26af984-4e9d-42d3-60c0-08de3166ea61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUd3bTJFNy8vTFdWY1pRQTQrb3NieU4zMmR4TTcrdUZDYTVISUx5bVJRWHpy?=
 =?utf-8?B?R0dUTHhlZGx2WHM3M2RrTVBRVktZd3FZdnhCK0tsNTVyZ2JLelgrbzdYaFM3?=
 =?utf-8?B?SWkwNzlwQ3JWQm9qaGYzbmFWUTZFUHhJckZZU3NYa3JXWTVrbjZFdDNydnRq?=
 =?utf-8?B?OXVzckN1ZHV6S0tGNGJhdGRJK2NvZTZ2RlM5UkIrZHg2Nk9DK3ovbEhReWto?=
 =?utf-8?B?QVdQVStZR1ZrVDU5b0dvU1IvSDl4WU80bkRKVXlnNDJFYmRGU0o4QnQrMVZ3?=
 =?utf-8?B?U3VtekFVdEpGQ2hIaEwyZS8wR1gxOHo2REdwTTA0N0c3ZnhjWmd3bTZld3J5?=
 =?utf-8?B?eTlRUExOc3ZiQmoySkF1TWhIWm1LVEg5WG9rVGcrWUNmbDN4bnVyLzJOdlpO?=
 =?utf-8?B?MWwxNDl5VG1qKysyTWZQZEsvMkFncDV0cjBEOUxPSzhRSFp4WG9meUVWVzMw?=
 =?utf-8?B?SlEybVc2UU1XWFcrbU1INlhRcENrcGZIaTZzTkVTbXRtUHlSMjNXSzVaeFZV?=
 =?utf-8?B?SU9LaTErWHdROVhZMlRWZEloY2FoTi96YXhWbjhoaXQ0TXl3R256M0diRGJ2?=
 =?utf-8?B?Uno5WU9XTGZaMkpvQXZja0Q1cTM0bjIzbmZRWlNRcWRjUXdMaFVGTU56TGQ3?=
 =?utf-8?B?bXpJUXdVR0R6WGw1YmN2R3MxZDFwT2VXWmtFRHIxclZ5d3VZeHUyWjJzaHJa?=
 =?utf-8?B?RFpvb200VEd1cVhSdVdnOUhIU0xENkpLMDBteGRQMnRXSDdhenhBZ1RtaGEx?=
 =?utf-8?B?bXArdDhGUGFEYUFoNUNOWmx5V3NtNGRmN21Ed3lndDdIMzI5OTk0YU5YZU5G?=
 =?utf-8?B?bDUxVndhcUtpQmpkOGpTQkd4cnJuZVNPMmZEUmlaS21ORDF2cXQ4Z1UvUjNR?=
 =?utf-8?B?dHB2NWwxa05nZkZteFZDMlZWUFJCQkFKTUNYS3VWNkhLazlxaXBPazkzVFcy?=
 =?utf-8?B?aXh4RVZsSDRtYUZreXNTbDFPdGp2RHlCNmlnK0creVRCT3Fkd0pNWThZNmdn?=
 =?utf-8?B?YnlTWmkzMGV3akpWcVNkZzVVVUluQy8yV3N1a2t3OEUzSi81Q2xtaTlNcHlt?=
 =?utf-8?B?OXlIMzZtdVkyVGxCanFBZStVMGgwcE03NXcwWWQyWGZ5MXlhaXZSVTB5K2VE?=
 =?utf-8?B?NlJsRjRJM1dkK1RNSnRPNUw5dDlhUTJwSGxvNUZrbEZxZmJURW95RXN4SFpB?=
 =?utf-8?B?Uktvb2tsaExtditGaloyWXFObUxVVjAyVDdBcFpjQVlJY3pQYkpQeWxOazQv?=
 =?utf-8?B?ZkZJazFpNzUzYjk2Q2xZN0N0REZjVXk5WVZMQkRrL3A5Szl1ZlNMZm4zUmk0?=
 =?utf-8?B?Q3lXbVpMVmY0VFpLZFhWejUrWUdsVjZlT1lUQkRuWmFqZDBEVUp1VmJMVTVW?=
 =?utf-8?B?ZERKNTFyWXBJeHFtYXlLUW5iNHpEc0VJblBVN1dwM1hOL1VLaXpSVGp1UUdo?=
 =?utf-8?B?NWQrTUVCU1Izd014eWRyWnBpNXlnSjV5ZGpPMVpodTBqOEFhRzVGaHZqQlNi?=
 =?utf-8?B?bzNGUlJPdVdvVjZsakhMUjZPS2xPNHkyaXYzcGhXejlaRmIweWFBSkdoYStK?=
 =?utf-8?B?cG5RMnNaQmhaUkNWVjZKendnTkxUOVQwekJMM1YxYXlXTUY0Mkp6aU15ZVNy?=
 =?utf-8?B?anZaS25WeTlBbzBnZkFmWHRWT1VDKzRVNlZyVE83QjNNL0FsVmR4N0ZhUGVV?=
 =?utf-8?B?ellTKytYSTZWaU9SVDJLNWF3QnJ2WFVqWGlXUXl3anoyZkRrOVlZUTNNZWhl?=
 =?utf-8?B?Vll0VkM1R3NqOUdTUDFHWGgrUWVLTHBrbXB4SngxbVRUenF1K2pHTEVVWkNE?=
 =?utf-8?B?U1RBb0xzL0s1bUtMRFhlVjNxYmRsZ3JaL2RwRUZCN1JZb0RUZDROdjhOYThR?=
 =?utf-8?B?U0NEbVMzMzJEc2JzaVRmcXdqQjlmUXdaaUh4alVUb2l0bDhSWnNzTjI3b0RU?=
 =?utf-8?Q?ZDbEXHk1YFaoiB76K++vteHZ0EZmQ099?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXk5S1hSNFk3TWlCQklqR25sT0pBNUlDTTI4Ym1TUmNBNTBSMDR6bXRRNlZJ?=
 =?utf-8?B?dm5mblB5VHBhaUI1R3JrTDlTa0cyeXBISzVwZDBiS1A1L0EvNnl5N0k3Sk50?=
 =?utf-8?B?ZDEzSmowVE1XY0dMNmY3SmRvM0h6N3JSVDE4NlhaM2d2cXZTVzU3cVRpYXFx?=
 =?utf-8?B?dmhJc3ZHd0pDUlcxRWdUdTREbW1WUGRzZlJCQVR3eDhFcDNYMjRQOHovK2ZS?=
 =?utf-8?B?bGdDR3ZWRWVMOU5Xb3c3TGJpV3d2YVplZzRoM00xUDRDRXZ6WDlJUU10Q2Ni?=
 =?utf-8?B?MDI4NHpqTnNxZXk2UjQxenZLK3BVSUY2dTNjTURkelJnWGQvemQrL011M3cx?=
 =?utf-8?B?WUplY3h5LzFjM1pTMzF2cTdXaTdYaTVzdlN5TkNPSXNabFJ4Z0V6R1pNT3Q2?=
 =?utf-8?B?cE14NjZodzhMTk5admRJSDhxdzhNZ2I3VTE0M1V2UXNzbkt1MU52VUtSMFg0?=
 =?utf-8?B?R0h0Q1dLMEd6SS9iWlFzUVlibThBdnljb1ZINlRMQjA4Mjd5NDNTRG5IS1o1?=
 =?utf-8?B?MFNIald4RlMwU1A5UEZZZkx5RTREVUg5b25lOUxUSDVqR1pzNXdjV0ZaTjla?=
 =?utf-8?B?L1RHTEQ3TG9HeGpQRFZsNnUvWmFLbytLdzdxNU1mOGdvYmlRUHpSLzRUK1lW?=
 =?utf-8?B?V3VyRW9laGl4UDBSTGR0YlZDN0tGNmljcVAwSjBuWGwvbXk4dFBFdWxTSWtU?=
 =?utf-8?B?SFFUNG9tamExY3BXR0lhVzJseEtwcEl4VEliVGdUaTBUN3d4anhWNGVHT3pn?=
 =?utf-8?B?YmFTL0RRZWhWdkgwYmE3SVB6NUF6SXpOb2hBcVphL1cvMHk2RDRqUjZTVWZV?=
 =?utf-8?B?Myt2YXpFa1ZpWDVlMHUzK1hiUHdaTE1YNnNVS0RjQWJnZEZXOW1ZdlM0aG9h?=
 =?utf-8?B?NFZPa3p6WnA5elRwU0V3Y3FWekhtRHJpd0lpRzhBcktyOUhwV2RGT01WVEVr?=
 =?utf-8?B?N1RkcjBoanZWdXlCbUZIZ1RNZ1ZRdStlK1BQSGhwM1Z2NE1OR0FDbUU4Y01i?=
 =?utf-8?B?MkRoNjllbDROa2djWFhSdmNseUZZeWxzdjFUKzhnTzEzcmpBSjJkVStxYldm?=
 =?utf-8?B?UnNXYk1qSXVmVWczWTIyN0NSQzJPUXNGeUpKYlNQN04rLzRXNm5lWkhYdjN3?=
 =?utf-8?B?YXVnRTlSdmxBZm5WeWptNElzMHhDcDRkSEF1eE5WYkVTbkY0TEs2THd2K3RY?=
 =?utf-8?B?T25wNCtITGV4ejR0c3c0VTBkUUc4OEhkbFRBM2d1dHhKckREamhYaFJrejRC?=
 =?utf-8?B?M1Npb1dhZmVjTitiVSs4K0hQRkhUaCtFWFVTYkNDNkZwcUZGNDVKaW5jeTlD?=
 =?utf-8?B?eE53YmdPcnpFM05VVzY5N1hKVUU4ZVhGRk82NWlNc0FTdGdwZGNDQlZFQURh?=
 =?utf-8?B?OVRWbUw5N1JXREJrR1MxSmIvczQzR09valBaN1NoYlFqWGZ0SS9HNGtLYXRl?=
 =?utf-8?B?bm0wajV0ZGU0bCtkUTdyUm13UExnNTVCdm1VSEJ2WlFQSGJPVndWbk5selN2?=
 =?utf-8?B?aHZFNjB3c3gyZitHUi9OdC9xbCtyMW9ZcUQ4Z2hKbUhVNjZON3RDZWJLa0sz?=
 =?utf-8?B?ZDYvcjFrTGJiZitMQTJoQ0lqeld1TDhWRGJBNTlsRjRta1IyRUlVUnY3SlBJ?=
 =?utf-8?B?dkJVMUhvSkRIWXp6cm9BbjViNUp3MENFV2hNWXBCRWlMV0pINmg3aFJoditj?=
 =?utf-8?B?UlFWSGtWZ0RIV2t0T1k4bloySlB4bUdKTTVYYzlQUmRwL2F5Um43bUpoWDVv?=
 =?utf-8?B?UnNBRldwRGxJQ3BlY1BrMUk3b2lrV1pNcGJxRG9meXkzNXh2bDBsQ29tdFJE?=
 =?utf-8?B?U3c4OGdKR1grdkpMS0JhRUQ1YzBidjh0c096QnlIN00waXVGa2NxUGhzQjdZ?=
 =?utf-8?B?amI1WVFSUWpTam5VNE41SjBtcmd0UnRCOU53cWh1cVJNRUd5YXJOd3JvaThT?=
 =?utf-8?B?c0Y3WFNTRVI1ZnRrTVdBelZJdDNJRks5c2xDbEszR3o2d20xaTFCT05QbFpV?=
 =?utf-8?B?VVpnL1pudExYNW4yZzBiTk1jNThqZ3Nka3JBcVVVNnRCaHgrYnBTaFhndWV1?=
 =?utf-8?B?RDlvTlpxbWxQTFZuNU5PSlcyTFdZRmtEaExYZ3YxcW9sc0lLM0xFdmtDNzlJ?=
 =?utf-8?Q?Yqvj70ghmrWnDhj6BcKkEpeL3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26af984-4e9d-42d3-60c0-08de3166ea61
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 05:52:02.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aDMDKGFD7OWSm9/tCoI+Tkt71raj8LVWZttoirR5xCN2CTgJEZje4D5VNb58JYM0Ww2sbCcX23GrwsC/KD4GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541
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



On 12/1/2025 11:37 PM, Lizhi Hou wrote:
> After issuing a firmware suspend request, the driver must ensure that the
> suspend operation has completed before proceeding. Add polling of the
> MPNPU_PWAITMODE register to confirm that the firmware has fully entered
> the suspended state. This prevents race conditions where subsequent
> operations assume the firmware is idle before it has actually completed
> its suspend sequence.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c |  9 ++++++++-
>   drivers/accel/amdxdna/aie2_pci.h     |  2 ++
>   drivers/accel/amdxdna/aie2_psp.c     | 15 +++++++++++++++
>   drivers/accel/amdxdna/npu1_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu2_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu4_regs.c    |  2 ++
>   drivers/accel/amdxdna/npu5_regs.c    |  4 +++-
>   drivers/accel/amdxdna/npu6_regs.c    |  2 ++
>   8 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index d493bb1c3360..fee3b0627aba 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -59,8 +59,15 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>   {
>   	DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
> +	int ret;
>   
> -	return aie2_send_mgmt_msg_wait(ndev, &msg);
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Failed to suspend fw, ret %d", ret);
> +		return ret;
> +	}
> +
> +	return aie2_psp_waitmode_poll(ndev->psp_hdl);
>   }
>   
>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev)
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index a5f9c42155d1..cc9f933f80b2 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -70,6 +70,7 @@ enum psp_reg_idx {
>   	PSP_INTR_REG = PSP_NUM_IN_REGS,
>   	PSP_STATUS_REG,
>   	PSP_RESP_REG,
> +	PSP_PWAITMODE_REG,
>   	PSP_MAX_REGS /* Keep this at the end */
>   };
>   
> @@ -290,6 +291,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type
>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
>   int aie2_psp_start(struct psp_device *psp);
>   void aie2_psp_stop(struct psp_device *psp);
> +int aie2_psp_waitmode_poll(struct psp_device *psp);
>   
>   /* aie2_error.c */
>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
> index f28a060a8810..4bc60f458fd4 100644
> --- a/drivers/accel/amdxdna/aie2_psp.c
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -76,6 +76,21 @@ static int psp_exec(struct psp_device *psp, u32 *reg_vals)
>   	return 0;
>   }
>   
> +int aie2_psp_waitmode_poll(struct psp_device *psp)
> +{
> +	int mode_reg = -1, ret;

It seems like from the usage mode_reg shouldn't be a signed integer.

> +
> +	ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_PWAITMODE_REG), mode_reg,
> +				 (mode_reg & 0x1) == 1,
> +				 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
> +	if (ret) {
> +		drm_err(psp->ddev, "fw waitmode reg error, ret 0x%x", ret);

Aren't these return codes going to be negative in the case of an error? 
IE they shouldn't be 0x%x, they should be %d.

Also shouldn't you be using XDNA_ERR()?

> +		return ret;
> +	}
> +
> +	return 0;

You can probably simplify as:

if (ret)
	drm_err();
return ret;

> +}
> +
>   void aie2_psp_stop(struct psp_device *psp)
>   {
>   	u32 reg_vals[PSP_NUM_IN_REGS] = { PSP_RELEASE_TMR, };
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index ec407f3b48fc..ebc6e2802297 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* Address definition from NPU1 docs */
> +#define MPNPU_PWAITMODE			0x3010034
>   #define MPNPU_PUB_SEC_INTR		0x3010090
>   #define MPNPU_PUB_PWRMGMT_INTR		0x3010094
>   #define MPNPU_PUB_SCRATCH2		0x30100A0
> @@ -92,6 +93,7 @@ static const struct amdxdna_dev_priv npu1_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, MPNPU_PUB_SEC_INTR),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, MPNPU_PUB_SCRATCH2),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU1_PSP, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index 86f87d0d1354..ad0743fb06d5 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu2_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 986a5f28ba24..4ca21db70478 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -116,6 +117,7 @@ static const struct amdxdna_dev_priv npu4_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU4_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU4_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU4_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU4_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU4_SMU, MP1_C2PMSG_0),
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index 75ad97f0b937..f761a6661f40 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -62,7 +63,7 @@
>   #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
>   static const struct amdxdna_dev_priv npu5_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_11/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_11/npu.dev.sbin",

This seems like an unintended change.

>   	.protocol_major = 0x6,
>   	.protocol_minor = 12,
>   	.rt_config	= npu4_default_rt_cfg,
> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu5_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU5_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 758dc013fe13..1f71285655b2 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -13,6 +13,7 @@
>   #include "amdxdna_pci_drv.h"
>   
>   /* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PWAITMODE                0x301003C
>   #define MPNPU_PUB_SEC_INTR             0x3010060
>   #define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>   #define MPNPU_PUB_SCRATCH0             0x301006C
> @@ -85,6 +86,7 @@ static const struct amdxdna_dev_priv npu6_dev_priv = {
>   		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
>   		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
>   		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU6_REG, MPNPU_PWAITMODE),
>   	},
>   	.smu_regs_off   = {
>   		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),

