Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D772A7505A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB71610EAA0;
	Fri, 28 Mar 2025 18:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PRmwZEI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C0A10EAA0;
 Fri, 28 Mar 2025 18:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lf5IOwiJNEowRu4sqq/YVy5YzLd1hj8egalIcNnAQ//K8MwO6a5QQEwNlg+6bne8cfFsmeepwpKre5tJu9KjBnG+ON27sZkyW6ThftqjFg7eikciwpZbh7WyBrnc6UQHWZyOvCQM0b7o/eOUrO8cD+V3nC4zfDZ1CRVGjlOC57R7XekV7mo23HX0RuizyHA+5X6P6ObWx4Z8EnIpEce9Au5jSNlJIVYDShnXX9z0/IpBlAACmiXwVux8WTVzF9xhE520jNJGN/t8smraT/mvRe7871XoihVf/aygfP8ArGLsEfB+TN82hKJ654qpuf8TJxIKBYNMsDy/H0jJArr5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJxsIf0XMJZe47575DOsgdMKWEZQqIJi9dGTUd0bXRI=;
 b=JgJn51aNrlBMDY8Ud58vG5D85+jFclFRFNMufVBcHVJpGEZO31lrWYZr+PZDyEF9SajJhpF0Rb0i9OdCSECzjBSBNKc6VQLqjUfj7oyBCzOR4mIky7NL9/TD5CmWyDIfIFF6cFBXHIs8iHi+7NzHGIz+tulzXc0nmXQjJ0omnaxZiVt8NN9hEvLooK3vfOGMLBNrSZD75jm7xEKTEHMDE+ns5gTTZQfcWnvLrt8cBR+yrKqpCj98JFhrc3Xv2YBdmrisKQDdYbZMRN2JJ/rQSXw3tTjaNzPtygJDmls6JRM3SzUfnzqNPvTTGhaSkF0l7WEJA0egAZwqIHGdNMif5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJxsIf0XMJZe47575DOsgdMKWEZQqIJi9dGTUd0bXRI=;
 b=PRmwZEI92LmI53xra5mdb4a6yj/sRSFjdZP1UuhcPwdAPfwCIu6XAllPx8ooXDp3r0Pv2a/GbZko8lzqOG0cZInbwh7DRkvGIRrIFWjF/Z3Kxmzp3ZKcl0diUTYcwbbjgyRtaYkfTbVdr7NT1YKKTjOMVS6rorlMxaA7dup3pGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:27:46 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:27:45 +0000
Message-ID: <4a4e462a-ac83-4515-a64e-25238fb67ef2@amd.com>
Date: Fri, 28 Mar 2025 14:27:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
To: Huacai Chen <chenhuacai@kernel.org>, Alex Hung <alex.hung@amd.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Austin.Zheng@amd.com
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
 <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
 <87d0601b-c1cb-402b-aecd-23a5d371da66@amd.com>
 <712b77ef-c7f7-47a4-9609-47b179f15662@amd.com>
 <CAAhV-H6AMm1X4zyhj7-jqiaCpd-Yfco88d4KODd5_jUfhyi8Cg@mail.gmail.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <CAAhV-H6AMm1X4zyhj7-jqiaCpd-Yfco88d4KODd5_jUfhyi8Cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0216.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::27) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|IA1PR12MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 45305235-5dfc-4237-7e7b-08dd6e263c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGNMbExqa3pheVZwZ1RJdVl5T0ZSaFI1VkIwSld6UmFhRDBrWWhrUUcyUG9C?=
 =?utf-8?B?ZUdUVk5CYTR3MzlZYzdyTFR2S3JjeFppbTh0NjVsLzFKOUpHT1lmbXBvcUQr?=
 =?utf-8?B?a01yY0dnZld5Qll6ZDJWSUw5R0h3amVFUnRESzBiSFdXaG9aaHk1Y09RWmlt?=
 =?utf-8?B?OGNoWUpHVGIyTlgyMHQ4bFJUbTVSeUVRT2tUd3NWVlNyVUE2QkJWUFoyK1o2?=
 =?utf-8?B?cW45azFxQXZMWm9RNjY5T2NWMjRORCtjRUNJanhkc3BTTDA3bUZCV0hQUjNv?=
 =?utf-8?B?Q0pDVTJVL24xb2UzYmNzdUwrSWxBcXFjLzdEbTZUQ1JFbzV3WVZsb3ppYkhL?=
 =?utf-8?B?VkJkUkpQbFJjbWtqNlB2bzJTYmMrZ2ZoWUZLc3V0SXdobVJqNmdyZks1NDd5?=
 =?utf-8?B?L0J3TVhpRUxLUVZBbVhjWmRVNmMvZmlkY1pldEVnUnN0S25tYXZONjNrWWV4?=
 =?utf-8?B?RnNKOS8remhXbTE2UUM0bVNUYlZ3aHlSR25weWJMSVlHbGRDZ1dzWTZLUjdy?=
 =?utf-8?B?bXRnYkVrOUpHc0FzT1pZUmJnUE0xaStsQ3NPWlNhMmFNK1g3RDV6UEdUamJy?=
 =?utf-8?B?YjdEVy94ZzRvek5JSndNOFFMaUY4RFhvVHB4ZVk3bmVIZi8xNXprVmV6emRl?=
 =?utf-8?B?RkYrNEYvTTRneHpZUitUY0VWeHlGUm5xZEgzOWJTRG1KMUNIaFhGRW5JT2ho?=
 =?utf-8?B?TEdzQUpBeGJwWURTNndLdEFJZUdHN082V0RFQmZwR3NOejM3cUtDZjdmNnFr?=
 =?utf-8?B?MTA3cFArMmpBM2dNMHRkS0dydUhmcGFWT0pwZWtWYkcxbFRoaHJjdEgzVlRX?=
 =?utf-8?B?MG5tUnVIUE54WG92VVlJb2FwbGV1SjYvSTlXaXRYMVlrS2JsRXdGN2FiQ1Z5?=
 =?utf-8?B?Z1lDL3VuYVBSZ3l6aC9heVQzNWJpT25MaW9WamJ3T3hRVmM2NDJiZ1M4MUYw?=
 =?utf-8?B?T0MxRWJwdG43aC93VWFSZjFBMy9TVmZ3WEZlNDg4UHlvYy9Qb2FsWnFJaU01?=
 =?utf-8?B?TmRGdzgybzZmbEZtVnhpVVdERThkaVJzdW5MOTVLT2ovTkZ5WGhEYllhQTF2?=
 =?utf-8?B?QWQ5azhXeUd2MGZBRU1oRUg4Vkh6Q2R2WGVkR0lMc0Z0VjM1OFpDbmIxZzJk?=
 =?utf-8?B?RmEvdFhJTmFRdGFHOUllUVJpZ1dIMnhWYUhCZkMvWlhmSDdHMlZGSVlSMmt4?=
 =?utf-8?B?ZkFjS0NIYlBQcmlWWGVkcWF5TWk0V091cWtLUVp0b3crcndRQXJtb2JEZFQ5?=
 =?utf-8?B?Qk5iclhRd09NQ3dYbWlveVRjaXZLTHdLVFZzZGMxOTVRbmhlWSsyVXVHU09z?=
 =?utf-8?B?Kzkzb2NlYVp2VEgwM2FQbFAxd3VGSU9GQ1g0RG1WazViVjF3aFVQeTNNVGhu?=
 =?utf-8?B?a2IrY283WlZpbFJMT3huemoxTHdWYTNrMlQ5aVhyTWdWMDJGTXpOZXVLNTI5?=
 =?utf-8?B?RWlyK1MvZk5yR05QTjB0dk5qNFNTQlZaaVFZdW5VTGZCVzhpOVdLT2I5UmUr?=
 =?utf-8?B?aHpDL3NJeUFsQ3pNbWZydVcybFJTa2VER2NoQm85UjJTOTRrZTNkVS9SeHdM?=
 =?utf-8?B?dnovL1RONUNlQ2ZzeVl4eGh3Zmk0MFNxamQ4b09ITW9zNGRZTlZDVVp4bWoz?=
 =?utf-8?B?VExDTFB5WExEZnd1QVBBSWU2UDUrTXY2SlVGMi9BTzA3eE8wOXJ2YlZZL1lN?=
 =?utf-8?B?YjZ2MWIveU5STzlPeitXV1JJdVNiazg0dDZYTGY4UXczOVh0TnQ4aWxZd3VD?=
 =?utf-8?B?WUtPWEowTjhYcUVWL2w1eXM2eHl5WmV0MXRKNXEvWXhjZkJpb3ZETkdnVEZN?=
 =?utf-8?B?MUlGdkxpYXZYajZCYkdZeHhOOGltczJQbTNNZGRvUU9ITVowVlgrOW1mK2pQ?=
 =?utf-8?Q?oYP1yddEt+Z1r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amhmOEgza25YMTlVRnAxUCtrSXVEaFN6TzZVZ2RpcG5CL1FLV1FFcEJqRHdM?=
 =?utf-8?B?Mm1GZGphOHppcWhlOFR1ZXdpK1hhREVUd0tQZUYweWNUOGhLR2lSZ1lMZXZx?=
 =?utf-8?B?a3NsM2hzSkJLRDM5M0VseTY4aG43NHRCQ2ZST3Y4OU9rV3FBU0VpbmwwUG9Z?=
 =?utf-8?B?eGlIUGppQXlCM2N0WkoxZFBLK25BcjhLdlY4TkpiMDh3dVZES0FMdXQ0Z3NK?=
 =?utf-8?B?WlRpL0M0VGJWVmxSSVFDVWJTRGI0Q3V2L3U2YXdJYzJubUdaQmJrVmJtd0Jv?=
 =?utf-8?B?R08rbXNFc3JRVEFnQm54dU9nTjNxS1hwQllvMnJ2R095UnlCdk5iLy9sRzZT?=
 =?utf-8?B?TGlUN21tQWpreVJtMG5yK3RybVVwN3VNUUVmbE9pNFJnaDhqNkZpUDdlclVD?=
 =?utf-8?B?OGx0andWVndqb1Juczh1MFlyOTNXekFjT0o1ZWd0eUx3UDFqdVpiR01YYnVS?=
 =?utf-8?B?MytUdFVtdzdpeVRDQk8zZndaSDdYbkppc0NtTXd3Vk01bHV5cHhKbm5nODd1?=
 =?utf-8?B?VjVaWWpQQ0ZkbzdjYVVQVlQwbEJjVkxsNDY5bnN1RS9sUkRLeHFxYldIQ20r?=
 =?utf-8?B?bmtBblFHQjFSZEtFZ1FVUmVYbmI2UlRjeTJGNTdOMnpIako0ZFFtSlMvQmZE?=
 =?utf-8?B?ODRxVURTUUc1MFZsaFhmM1AyQjhjZlNGNDk0TnI2dS92VERwZzFCMnN3UENi?=
 =?utf-8?B?VXhsSWtNYjBSYkFHVlpNdDNzckhKU3RNWFRqZHlqaC85RlNxdUprUkVtL2FM?=
 =?utf-8?B?S0QxRGRXdjY2c3VuekdZQU9GY2plQ0t5UG5heTByY1VHRmZCeWVIZVVnZEdG?=
 =?utf-8?B?emUwb2JveFhnZzVhR3FLVFNaSXNEQ2RLQUdUTjVkdS9oQ1BmSzRrb2FFbXNy?=
 =?utf-8?B?Ry9OZ214M2xjWGVhKy95aktzb0tLTWp5bUovVWY5SHVsSXZJTEd6NzM4UjBX?=
 =?utf-8?B?T3ZXYjdKVGFNTTFzQmQzOXVFTDZaVFU1dVNRZkN0SEF1Zk9Mbnd6Y0E4bFdx?=
 =?utf-8?B?RjZlYkRHcWtFbnk2MTQva3RtRXkrdG1ISXNlb1N5T0RZZlJrOFFHc29RL3JG?=
 =?utf-8?B?ZXYrZHRnTEM2TjFDRmtCVlFPNG5JWVFZWHBtTU5BRDNBMFYvc1NKMTVrREE2?=
 =?utf-8?B?VXlVNE03aERsZHZFNzAwRWlqUit3ZFJBMWFPeEY5Q2wxc0JXcFliaW4vSmhW?=
 =?utf-8?B?SDVncE90L0xIb2lId1VIL3g4dHZsNzlDQTNhRUM5aUZzd0Y4eHdheW9URUN5?=
 =?utf-8?B?RFpoV3AvS1NwckEzVmE0VVBTbVEvcnRRTmVNQzFCc0xndElzbEwvdm5sSHNv?=
 =?utf-8?B?N0FFb3BXbUliYjhNWWpPck13WkVIL3VzWUZTZFVkci9iYWZZSVkrdGd4THd0?=
 =?utf-8?B?T202cWRWOW9Renpmb3JEY3FPRitOQzBWY3FKVm4zL0hZdDNVcjZBT25tVHgw?=
 =?utf-8?B?dm9JWVptZk5xMGEwcEhjemFVazNZOGtWcWFkQWVpS1dXaUdvbVFXamdZL2xB?=
 =?utf-8?B?VFFqRGhFR2hyMWlzTlVwb08xWEhjZFo1ZE5hVlI2aExLMDFKdE8zNXF1Q3h2?=
 =?utf-8?B?bGlZMlk4ZE1NL3FFcjdYTFZucXpJSHNYMmhFaC9OWlFzZXI0N2NsUDg4K2pD?=
 =?utf-8?B?NXpQV3gzcVNWSmx4R2V4anZPR3paVHZuZlVsMHJSUEdFbEIrUTFSN0d4NTBS?=
 =?utf-8?B?dldIZVc5bndVWVdIK3M5MThXTGVvc2N3bFJhRGN6QW9pSWhxR2duYjlOR0N2?=
 =?utf-8?B?dnd3dFk4MkhCWXYxUUI3TzZKOW9nNHQyMXUyY05vazdkNGc1dDhhWG1ZVENX?=
 =?utf-8?B?QkU3UzkzRVdkRzIyRkJtRzM1bGFNRVBnKzg1a2hpWUdPT2dHRUxLYTQwak5p?=
 =?utf-8?B?aXdVcDVpa1M0a2tSZXJUYWhqRmNtbGhvTWdpR2Z4RUc4VWp0bHg0Z3dibmx6?=
 =?utf-8?B?RGdSVVZPUlU2SDkyWE9yNDFRRFBTUzFqaloya0FQaHVMRDlkUG9UUW5mdFN1?=
 =?utf-8?B?NTVmTmE5Wmtkcm9YcFZua3Y2Qjl3Qlp3VWlVUUsrR1Y5aHh1eFJSUlBiQllJ?=
 =?utf-8?B?QjNaSHVaTk05SEY0ZXl4V0g0aWxLcTFUQ1QxREhKc3JuS1gyQUxDVktIMGZ3?=
 =?utf-8?Q?w7NoPku/I9vYJM1nh2/Z8g5Fj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45305235-5dfc-4237-7e7b-08dd6e263c42
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 18:27:45.7386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nndi9PeR9zPRCF3nCLecAKqVRaip4BYkjc9brPzvX77BhJnQvTSPIuUvjDmA9y953begjoeoXqnep2tCLmrrpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020
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



On 2025-03-26 21:40, Huacai Chen wrote:
> Hi, Alex,
> 
> On Thu, Mar 27, 2025 at 8:10 AM Alex Hung <alex.hung@amd.com> wrote:
>>
>> The following error messages showed up on an APU and a dGPU during testing.
>>
>> <3> [100.231411] BUG: sleeping function called from invalid context at
>> include/linux/sched/mm.h:321
>> <3> [100.231414] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
>> 1711, name: kms_color
>> <3> [100.231416] preempt_count: 2, expected: 0
>> <3> [100.231417] RCU nest depth: 0, expected: 0
>> <3> [100.231418] Preemption disabled at:
>> <3> [100.231419] [<ffffffffc0c2843b>] dc_fpu_begin+0x2b/0xc0 [amdgpu]
>> <4> [100.231626] CPU: 4 UID: 0 PID: 1711 Comm: kms_color Tainted: G
>>     W          6.12.0+ #1
>> <4> [100.231629] Tainted: [W]=WARN
>> <4> [100.231631] Call Trace:
>> <4> [100.231632]  <TASK>
>> <4> [100.231633]  dump_stack_lvl+0x5b/0x70
>> <4> [100.231638]  dump_stack+0x10/0x20
>> <4> [100.231639]  __might_resched+0x170/0x1d0
>> <4> [100.231643]  __might_sleep+0x44/0x70
>> <4> [100.231645]  __alloc_pages_noprof+0x22f/0x370
>> <4> [100.231649]  ___kmalloc_large_node+0x95/0x150
>> <4> [100.231651]  ? preempt_count_add+0x4e/0xc0
>> <4> [100.231653]  __kmalloc_large_noprof+0x1d/0xb0
>> <4> [100.231655]  dml2_create_copy+0x27/0x60 [amdgpu]
>> <4> [100.231827]  dc_state_create_copy+0x7e/0x170 [amdgpu]
>> <4> [100.231995]  update_planes_and_stream_state+0x23c/0x600 [amdgpu]
>> <4> [100.232189]  update_planes_and_stream_v2+0x22b/0x530 [amdgpu]
>> <4> [100.232366]  ? amdgpu_dm_atomic_commit_tail+0x1310/0x4100 [amdgpu]
>> <4> [100.232569]  ? commit_tail+0x96/0x140 [drm_kms_helper]
>> <4> [100.232577]  dc_update_planes_and_stream+0x5b/0xe0 [amdgpu]
>> <4> [100.232730]  amdgpu_dm_atomic_commit_tail+0x1fa7/0x4100 [amdgpu]
>> <4> [100.232908]  ? stack_depot_save_flags+0x2c/0x730
>> <4> [100.232915]  ? wait_for_completion_timeout+0x1d/0x30
>> <4> [100.232917]  commit_tail+0x96/0x140 [drm_kms_helper]
>> <4> [100.232923]  drm_atomic_helper_commit+0x12b/0x150 [drm_kms_helper]
>> <4> [100.232927]  drm_atomic_commit+0xad/0xe0 [drm]
>> <4> [100.232939]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
>> <4> [100.232956]  drm_atomic_helper_set_config+0x80/0xc0 [drm_kms_helper]
>> <4> [100.232961]  drm_mode_setcrtc+0x22e/0x910 [drm]
>> <4> [100.232975]  ? kfree+0x18f/0x350
>> <4> [100.232977]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
>> <4> [100.232987]  drm_ioctl_kernel+0xa7/0x100 [drm]
>> <4> [100.233004]  drm_ioctl+0x29d/0x500 [drm]
>> <4> [100.233015]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
>> <4> [100.233026]  ? _raw_spin_unlock_irqrestore+0x1f/0x40
>> <4> [100.233029]  amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
>> <4> [100.233131]  __x64_sys_ioctl+0x92/0xd0
>> <4> [100.233133]  x64_sys_call+0x1205/0x20d0
>> <4> [100.233136]  do_syscall_64+0x50/0x110
>> <4> [100.233138]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> <4> [100.233142] RIP: 0033:0x7fb21e71a94f
>> <4> [100.233144] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
>> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
>> 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>> <4> [100.233145] RSP: 002b:00007ffdd9a52e50 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000010
>> <4> [100.233148] RAX: ffffffffffffffda RBX: 00007ffdd9a52ee0 RCX:
>> 00007fb21e71a94f
>> <4> [100.233149] RDX: 00007ffdd9a52ee0 RSI: 00000000c06864a2 RDI:
>> 0000000000000005
>> <4> [100.233149] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
>> 00005609537f7b08
>> <4> [100.233150] R10: 0000000000000000 R11: 0000000000000246 R12:
>> 0000000000000000
>> <4> [100.233151] R13: 0000000000000005 R14: 0000000000000000 R15:
>> 00005609537e2848
>> <4> [100.233152]  </TASK>
> This seems caused by dml2_allocate_memory(), to fix this we can only
> protect FPU in DML2, I can do it in the new version, but I want to
> listen Aurabindo's opinion.
> 
>

It looks like dml21_apply_soc_bb_overrides() does have some division on 
double variables. I'm curious why we dont see this on our side. Was this 
seen on x86 or Loongson?

I think your approach is correct. Thanks for taking time to fix this. We 
can add it to weekly testing if you send us a patch.
