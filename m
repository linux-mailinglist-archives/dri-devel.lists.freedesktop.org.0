Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D398CD4A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 08:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1326C10E1EB;
	Wed,  2 Oct 2024 06:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4GuVd6mu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41610E1EB;
 Wed,  2 Oct 2024 06:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cycw0nYmp8oD1wLhFNDCMiIxdZMtuJyQkVlVAyz0sTeQ8GATcBoVNKQjjvE/jYEGNVVh5JscmEbOus+6XeUyHMpxLBN3GlfzLtsWyDKik86ubm1Riyd2B/QM0PAnlIXRBH+TnRh/IHWDLMX88lIh8zOXFAmKWNnN29E3KPhRJldOQv/wtEAwYI6mlhvIaSqDhIoCVxACE7wHu2oePhJiz7BKT/OEYPqF7VDfmH83yAmMRTzgRFdz1BbJddeinqjJonZjovJczB8ywEX1Sy8lzscEjQ6YcT6oZLlt92YpG++3dqUEqzFDldQ1+nUEbegFLrSi6mUd2cKbRvNM39ZGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgsd2nhhgcayXb2r2/i5b0lFubphC9B1y8YCVnjnRhQ=;
 b=Gko8UUO9GBjI7aZda0ONE9cXkskEKk+DDnUji4QkwHFvLKYBDMaPZyqACxh0oPW9tLIBzXP7ptXhS5wCsMGu2Y7wIwplUHXuaLykFQ/9tCo3bNgg3P/YGU+rRQeb1dos73RYGLuiw8UUEbV5MSlWF7ynItoz38sEmGU0teb7KbdL9MQWUEkBW45CmmYH0Dn+OsE9eQNUFsQVfoiF/yv8VtbsmMlcf14EtICmhWQraXBPG1zcEFZejLshR+/M8TSBQfBOTmwgK8vzoDo0tHNixgn9s0+z5GYc0BTE9XZB2z5YnepnqkHt2GdFWMeXKhMTkFRj1EuxAOmBrlguZ3nhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgsd2nhhgcayXb2r2/i5b0lFubphC9B1y8YCVnjnRhQ=;
 b=4GuVd6muI9oZH+7RbTp2QY6QU3CHoqebAuEho6ixBTiJNLd8ZeklNIUJ3bajA+CIygNUNcNG4z4FP8bkrkoDLuTX8mJLeeVM5ZZ7Cn0R2y7lA/1fuLehPqVVm4wZs680GaN8TBUsj7ZIMUiAFx8vxKajLP7D2A0LXAuWGz1Pp3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 06:43:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 06:43:15 +0000
Message-ID: <a2d0fefe-0bcb-47aa-af3b-e7ce383c6426@amd.com>
Date: Wed, 2 Oct 2024 08:43:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/radeon: use GEM references instead of TTMs"
To: Mingcong Bai <jeffbai@aosc.io>, Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Pan@freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, Huacai Chen <chenhuacai@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 cherokee_legend_04@foxmail.com
References: <20240929075058.3542013-1-chenhuacai@loongson.cn>
 <c48100d6f22ebd4b99bcc2b3f068581b@aosc.io>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c48100d6f22ebd4b99bcc2b3f068581b@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 966c447b-a200-4605-5937-08dce2ad7e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnErMWoyczJSUHZyVHVZYytJQms1TXk0WEZaeWQyNEZ0dHQ4UjN0a2dSWnpz?=
 =?utf-8?B?SEUzdjZpakZ6SEV1T2xqcmdhUW00ZTg0eE9MeERMcEFMSHM2THAwRHZwcENh?=
 =?utf-8?B?Ui94MXRma292VEVvZERIQjZJSDU4Zkx5MWptNm5Cd1BYWFJRdC9SbjBPSmNZ?=
 =?utf-8?B?QW45RXdsRHVJTjBMa2xMTE4vOW1kM29YQ3BKSnUxaXRYTjNuQjNyZU5pMzFa?=
 =?utf-8?B?ZkwraWhWaW9lOFh1SXV0WnkyRTJMd0l0R2RDLzdtSzY4V254K3FqTVNyeFh1?=
 =?utf-8?B?YUQyQVFxRjJjenVMelZYa2p2bFFUdUh5d1NJL0tLa2dDY3VOU2lCUzVqQVI5?=
 =?utf-8?B?bWtHUDJ5UGx5V1JaK1EvN3paSk9mNklxTUE1Y3FFQWFCQnI1Y21CWDcxNjZL?=
 =?utf-8?B?d3lmLzVTODBMQ3pjalZHMGNoZHNNUWdQVlJHMzhWbkR6Rkt2ZTdxazh1WVh3?=
 =?utf-8?B?ODFMRXptMTRzTDBpRmhsMHcwSHR0U1ZmeEpQU1NpYjJhTHpJRVNiRlNEeTJt?=
 =?utf-8?B?NTBmakc3dDNwd3lsVm5xdkhoamtyclFxOXRDUkxVYlM1bjFiUWxDZkI0MjNR?=
 =?utf-8?B?dng4VXFuYkZMZXZqZ0laOFJQZm1HNWtWS2t5cThqalR4OVZqcDFrc1BSTVVC?=
 =?utf-8?B?dU9BUUFUNXdEdGVxUVZueDJhTmdqbjcvc2RCZzVRaFF2WHQ0M1ZJVUFieDR5?=
 =?utf-8?B?NHozNnl1VzdpNUt0ZVM2VnBuWk5ZWWhPdjNVL0V3bGphNDdxRTYzb2dIQlJF?=
 =?utf-8?B?allPQmZFcVRnemtvTGRJVnU0MjJvZWhVMVpTeHlKQWQ0NkprdG0zYkJWOTEz?=
 =?utf-8?B?SWVHb1dzZWlCOVVtT0MwTG1BbzRza3U5Y3dSVEhjTE03RXMvQVBFMHVVWWEx?=
 =?utf-8?B?OG15SFNFbDZlT0dFSUY2RGJhSkxZdHorZ2MzeDFSVU1XbXBlVUtRL0hOYUJl?=
 =?utf-8?B?TDFxbnl5cXZxTHhEU1hneE0vdUgyQk5BTTZhOUdnSVN2Z09VeEhEQWdpM1dH?=
 =?utf-8?B?MzYxdVNwNkRORFBvNWpLOWRSREFadXF2Mm02VWFLb2RuZEJtclZta29ubThN?=
 =?utf-8?B?cjlJTlVFV1czOWtGSmdDSVYzOUx0UVphUVdyRml2ak5QQUR4d3BRQ2dDb1BT?=
 =?utf-8?B?NEplSElnYkRHK2ErVURUdGlVNjdlVWhOVjZsd0RHdk15VHBxUGFTMlNYYWhR?=
 =?utf-8?B?N1FGbURtSUtaS2k4Q2JzN0Q4NTBweVFTSUl3VkM3Umg2cTJGbGRoYkJiTmkv?=
 =?utf-8?B?T2dyZ0VMbkZBblhrNUM1QzZtd3BNQWxCMkp2VytxQStxWDhiWk1pZW1iZS9U?=
 =?utf-8?B?UTJER0hqbnJxODluY2hPWmJHUHRXRkdHVEFBYmk0N2ZON1RTbnpUWWszWGYy?=
 =?utf-8?B?TFY5V1JKNnVpS2FKZGRNQkRXb2Z1VGI4d0VPZjZxOFhYSDZNWlhvL250MnY4?=
 =?utf-8?B?ODkyTUFUZVhDdHJidnNTcTdLOGhiVXZHNU9CVUZ4aVNZVURKZnJvdnJHOGVn?=
 =?utf-8?B?MGNHUy9QV3d0ajQ2Q0VMYWpsNS9VbVhNSEpQNFRieUN0WUFoK1NCSmYrcHhH?=
 =?utf-8?B?U0NWZGtBZkZBVFJSZFJSczFNZktyWkVkYlBpWWlnM1BOcFozWjM0L2FReTM1?=
 =?utf-8?B?dDIvVXMzOE9SNUxIb2FHUDAybzJ5SjExdHR5TnVUR3ZxMG1taUdHRnp2K2Q0?=
 =?utf-8?B?Y2I1TFlVQkxHS05QQVRMamU3S3QxNmZkTGVxSUJST2hJR3JMNzlrcWRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RndiY0ZXckkzTmd1NDNWM3RTdTVzUm4wbXRYeHhtaVVpb09nVXFKQjFlMUNJ?=
 =?utf-8?B?dGtmU1RhNzVMQ3NaNUV3anNGRXN6djJUV2tqd211dTZhLzBSSDVrb1dDbjRB?=
 =?utf-8?B?ZjhkUzlxc0tGOXRETXFwWUhOSDZGenpvUVBMMk5yRVYxQmNidGNwWkdqcnRY?=
 =?utf-8?B?aG1LaDQvUXQxVTFQcWwwa3pHZUxNVEtCcmpRYkNDbXZxQ3ZobEgwdklyeDY1?=
 =?utf-8?B?ZGlYWHhkYy8rMWNOemdCRFhwNEd2YmdBeEdvSWt3REVUZ2hkSEc0WHhyL0ZP?=
 =?utf-8?B?NkZRbURQMXRpVEZiWDlwSnAzUnhLc1Yzb2ZVUjdFVnJ1d1J2RVFsNzV4dTZU?=
 =?utf-8?B?dEloSHNBem5lWVJ3YWdBTzNHQ1pKV2dEcDQ1TW81Q2pGNWFSU1FlbUlVZjRk?=
 =?utf-8?B?Rjk4YU5pMEVRdVZXenFyR25SQzFYSjhkU2dzTzBsdXpKZHFuTmUzTDJiM3E2?=
 =?utf-8?B?RVRkM0V1OTQ0OE1heExIcjdYVVZSaS9LRmNmNzV2VHhXd2g5NHV2YW8xRmVG?=
 =?utf-8?B?SU55Mk9ScnBOVTk1eWt4U1hTUVdYdTlhUksyMkRSSDI1dG9wcGNNMkhWOWZI?=
 =?utf-8?B?ZE1ha0F5Tk4yNzBEVVNOR0dZLzBiSDVnYjd3L2ZjZlQxcWxpWEh3dTR5TmdR?=
 =?utf-8?B?OTRFQ2s2RjlVL0czUldTUC8xMDRsY0lUQ3BnT0lKUk1kSC9jUFdNWGZXU3hS?=
 =?utf-8?B?U1A3Y2tRWVFZcHhpRXFrOG9FUmFrYUJJV1F0c2NURUg4bTFHMWpsWDduenBK?=
 =?utf-8?B?Vk1NaUlZdHMrVHVVYWpQSFBZcFpsdS9BTjVkZjR5VjFWS0FhQk1RWDVRYWJP?=
 =?utf-8?B?VkZ4R0U2b0EwLzdNbHVmVUFNMWdWMEs0Wnh1MHF6eE00ZGhCMytwZ2VoSHVj?=
 =?utf-8?B?VXhhaUdaY1dKckppZ3RPTm1jZkhLZnF4RzZQdjB6VTJsVGVFRHVGRXJ0VHkx?=
 =?utf-8?B?REJGVG9mS2NySWlSVzRYd1lZdmVMbHUySVBUVnpuYjhoWFYwT3lqOENQUUxr?=
 =?utf-8?B?bDdybWtITE5QYXA4ay9HQSsrOEJtb2dtQjAzRFJpSW94WEZwRlRGUy9qYksv?=
 =?utf-8?B?MDVDWk4rUjVDS21YWW1xUE9LZjZPQUQ3aFRmRVNZS2dOTFpjUHNVUjRla28w?=
 =?utf-8?B?QUFoZUxKVk0vNXR2WWU5TVlXMFlYWjV6ZFROQ2RuR0VrMHhiTWx3WktHQ3BT?=
 =?utf-8?B?K1UyZ0JZeWdzajIwTUNYUEF6c3BCdk5mZDdNWE1rY0Y4Rm9uZ0hUVWw4dUd6?=
 =?utf-8?B?RDFvMTdYSWpiVkgyOWFzcW9hOHlpV2lxcnNheGJZOWVrS3REY2xoemtkQWpS?=
 =?utf-8?B?U2hGNWJEcDNHV1prbTZMbU15cHhGcGJUS0M4QTg1YURzZGRubWt1YWNlMkNy?=
 =?utf-8?B?SElxNU94bEkvQnI0V25xK1hkd1ZSd3paYllXVE5haExMbkRRNkhueFVTRWlw?=
 =?utf-8?B?TWp1TUkzMjk5Z2JKcXhNRnlJTkNiaGVuNWJvK08xRFBkTTI5WVB2V2lYaXFn?=
 =?utf-8?B?WHVEV1Nvam1Wd01PaS9aMSsyZ1NreTNEWk1UMDFiZFFJeDVmUkYxZEVsZytH?=
 =?utf-8?B?LzJPaFBHc0Rnd3BWcGh1NzZOaVdpTWxQZktMUjV4eGlucWw5V1FTaGtEd1Q3?=
 =?utf-8?B?OFdkRDQ2N3NrWEpWcmh4VTRsVXFSZVNEeUI2STE4eFJVYjlnWFhraGlDMmxE?=
 =?utf-8?B?bUwvNGpOcHB5UVNPcXliblJGb1ZRSGVOR21VbmRTbzhPY1dHbEFRMmpqclhv?=
 =?utf-8?B?Z1c1VzJWV2kzay9uYlZMOEJmU01uOHBud2J6OTZiZXhUK0k5TXNOVGExbnky?=
 =?utf-8?B?d2lrdmpRZkhWdUlxbzZ6UWlvR2MzN2R1ZU42THNXbHkwK3ZZcWdaYjJHTmky?=
 =?utf-8?B?T2h2OUlUdzcrVmxsR24yVmQ5UFJUeVpCbXNjT3Y1Njg3ajFWcktUeFRjVVAv?=
 =?utf-8?B?a0ZUTDBLRkI5ODNXdU5qSkxocCtXT2NYeFdnaTUzYXphekNmaTJGRzJ0ZzNU?=
 =?utf-8?B?R2hxOWN1a0pFbGcyOUUyajBSVmJpQnY1OGNtMmxZWjc2Q3dCSERTMEhYdVll?=
 =?utf-8?B?YnBDQkxCOEJJSU1oaGg0N3hJaXlGeU1zWUNNZ2FySnJUM3lQd2NxZ01Benkr?=
 =?utf-8?Q?TzVg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966c447b-a200-4605-5937-08dce2ad7e12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 06:43:15.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQMr+GA6Omdo9ud3wI9blSX7obG1FA0J+H3nIHoUSD6voKahIkjo8TEgWQcWqbJl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047
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

Yes that is a known issue with the driver at the moment.

It needs a three line change to init the GEM functions earlier than 
before. I'm currently working on this fix.

Regards,
Christian.

Am 01.10.24 um 15:50 schrieb Mingcong Bai:
> Hi Huacai,
>
> 在 2024-09-29 15:50，Huacai Chen 写道：
>> This reverts commit fd69ef05029f9beb7b031ef96e7a36970806a670.
>>
>> The original patch causes NULL pointer references:
>>
>> [   21.620856] CPU 3 Unable to handle kernel paging request at 
>> virtual address 0000000000000000, era == 9000000004bf61d8, ra == 
>> 9000000004bf61d4
>> [   21.717958] Oops[#1]:
>> [   21.803205] CPU: 3 UID: 0 PID: 706 Comm: Xorg Not tainted 6.11.0+ 
>> #1708
>> [   21.894451] Hardware name: Loongson 
>> Loongson-3A5000-7A1000-1w-CRB/Loongson-LS3A5000-7A1000-1w-CRB, BIOS 
>> vUDK2018-LoongArch-V2.0.0-prebeta9 10/21/2022
>> [   21.996576] pc 9000000004bf61d8 ra 9000000004bf61d4 tp 
>> 9000000110560000 sp 9000000110563d40
>> [   22.094731] a0 000000000000002d a1 9000000000580788 a2 
>> 9000000000584d78 a3 9000000005678f40
>> [   22.193513] a4 9000000005678f38 a5 9000000110563b70 a6 
>> 0000000000000001 a7 0000000000000001
>> [   22.291993] t0 0000000000000000 t1 78315f0d31fceafb t2 
>> 0000000000000000 t3 00000000000003c4
>> [   22.389868] t4 9000000101d65840 t5 0000000000000003 t6 
>> 0000000000000003 t7 ffffffffffffffff
>> [   22.488326] t8 0000000000000001 u0 9000000120c31e20 s9 
>> 9000000110563ec0 s0 90000001107e0868
>> [   22.587345] s1 ffff80000230c000 s2 9000000120c31e48 s3 
>> 9000000120c31e00 s4 90000001063b0000
>> [   22.685908] s5 9000000120c31e20 s6 0000000000000122 s7 
>> 0000000000000100 s8 000055555c079570
>> [   22.785169]    ra: 9000000004bf61d4 drm_gem_object_free+0x24/0x70
>> [   22.881896]   ERA: 9000000004bf61d8 drm_gem_object_free+0x28/0x70
>> [   22.978212]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>> [   23.076423]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>> [   23.153679] [drm] amdgpu kernel modesetting enabled.
>> [   23.173074]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>> [   23.365633]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>> [   23.459680] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
>> [   23.554473]  BADV: 0000000000000000
>> [   23.646222]  PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
>> [   23.740356] Modules linked in: amdgpu rfkill nft_fib_inet 
>> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 
>> nf_reject_ipv6 nft_reject nft_ct drm_exec amdxcps
>> [   23.973584] Process Xorg (pid: 706, threadinfo=000000005fc343eb, 
>> task=000000007bdfdf49)
>> [   24.080528] Stack : 9000000120d86000 ffff8000021bb1c0 
>> 0000000000000000 ffff8000022a6bcc
>> [   24.188191]         0000000000000122 9000000120c31d08 
>> 900000010e04a400 9000000120c31e00
>> [   24.295420]         90000001063b0008 9000000120c31c00 
>> 90000001063b0000 ffff80000219c54c
>> [   24.402622]         00000000000000b4 90000001063b0170 
>> 90000001063b0008 9000000120c31c00
>> [   24.509242]         9000000120c31ce0 90000000043966f8 
>> 000055555c0922c0 000055555c082ac0
>> [   24.615887]         000055555597b000 0000000000000000 
>> 90000001034af840 90000001063f7928
>> [   24.723086]         90000001063b00d0 9000000120c31c00 
>> 90000001063b0008 9000000004396844
>> [   24.830582]         90000001017901a0 90000001017901a0 
>> 900000010e7e6718 00000000000a001b
>> [   24.937455]         90000001228b86c0 9000000003ad5904 
>> 000055555c082da0 0000000000000000
>> [   25.043806]         000055555c082ac0 90000001228b86c0 
>> 0000000000000000 9000000003acfb58
>> [   25.149701]         ...
>> [   25.248708] Call Trace:
>> [   25.248710] [<9000000004bf61d8>] drm_gem_object_free+0x28/0x70
>> [   25.447554] [<ffff8000021bb1bc>] radeon_bo_unref+0x3c/0x60 [radeon]
>> [   25.549201] [<ffff8000022a6bc8>] radeon_vm_fini+0x188/0x2c0 [radeon]
>> [   25.650751] [<ffff80000219c548>] 
>> radeon_driver_postclose_kms+0x188/0x1e0 [radeon]
>> [   25.753856] [<90000000043966f4>] drm_file_free+0x214/0x2a0
>> [   25.854893] [<9000000004396840>] drm_release+0xc0/0x160
>> [   25.954337] [<9000000003ad5900>] __fput+0x100/0x340
>> [   26.052437] [<9000000003acfb54>] sys_close+0x34/0xa0
>> [   26.148701] [<9000000004c04170>] do_syscall+0xb0/0x160
>>
>
> This appears to be a non-LoongArch specific issue as I was able to 
> reproduce this on my Intel platform (H310 chipset, Pentium Gold G5620) 
> with an AMD Radeon R7 240 (Oland) connected via HDMI.
>
> Happy to provide more testing results if needed, but below is the log 
> where the crash occurred:
>
> kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
> kernel: #PF: supervisor read access in kernel mode
> kernel: #PF: error_code(0x0000) - not-present page
> kernel: PGD 0 P4D 0
> kernel: Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> kernel: CPU: 3 UID: 0 PID: 952 Comm: ddcutil Not tainted 
> 6.11.0-aosc-main-11993-g3efc57369a0c #1
> kernel: Hardware name: System manufacturer System Product Name/PRIME 
> H310M-F R2.0, BIOS 1401 03/31/2020
> kernel: RIP: 0010:drm_gem_object_free+0x10/0x30
> kernel: Code: 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 
> 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 87 40 01 00 00 
> <48> 8b 00 48 85 c0 74 06 ff e0 cc 66 90 cc 0f 0b 31 >
> kernel: RSP: 0018:ffffb0f300b23de8 EFLAGS: 00010246
> kernel: RAX: 0000000000000000 RBX: ffff918b0487a000 RCX: 000000000000000c
> kernel: RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff918b1eee2468
> kernel: RBP: ffff918b197d9000 R08: 0000000000000000 R09: 0000000000000000
> kernel: R10: 0000000000000000 R11: 0000000000000000 R12: ffff918b179cc000
> kernel: R13: ffff918b03ee0800 R14: ffff918b197d9048 R15: ffff918b197d92e0
> kernel: FS:  00007ffb58033b80(0000) GS:ffff918b32d80000(0000) 
> knlGS:0000000000000000
> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: CR2: 0000000000000000 CR3: 000000011eda4005 CR4: 00000000003706f0
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  ? __die+0x23/0x80
> kernel:  ? page_fault_oops+0x14f/0x560
> kernel:  ? exc_page_fault+0x84/0x1c0
> kernel:  ? asm_exc_page_fault+0x26/0x30
> kernel:  ? drm_gem_object_free+0x10/0x30
> kernel:  radeon_bo_unref+0x64/0x80 [radeon]
> kernel:  radeon_vm_fini+0x1d0/0x260 [radeon]
> kernel:  radeon_driver_postclose_kms+0x164/0x190 [radeon]
> kernel:  drm_file_free+0x1f3/0x250
> kernel:  drm_release+0xaa/0x120
> kernel:  __fput+0xdc/0x2a0
> kernel:  __x64_sys_close+0x3c/0x80
> kernel:  do_syscall_64+0x64/0x150
> kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> kernel: RIP: 0033:0x7ffb57ef9430
> kernel: Code: 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 
> 00 00 0f 1f 44 00 00 80 3d 39 8f 11 00 00 74 17 b8 03 00 00 00 0f 05 
> <48> 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 >
> kernel: RSP: 002b:00007ffd59048868 EFLAGS: 00000202 ORIG_RAX: 
> 0000000000000003
> kernel: RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007ffb57ef9430
> kernel: RDX: 000000055c96b7fe RSI: 0000000000000001 RDI: 0000000000000003
> kernel: RBP: 0000000000000001 R08: 0000000000000007 R09: 000055c96b7fe430
> kernel: R10: a563eae46f2f347c R11: 0000000000000202 R12: 0000000000000000
> kernel: R13: 000055c9634e44b8 R14: 0000000000000010 R15: 000055c96347e698
> kernel:  </TASK>
> kernel: Modules linked in: joydev mousedev input_leds snd_soc_avs 
> snd_soc_hda_codec snd_hda_ext_core intel_rapl_msr iTCO_wdt 
> intel_rapl_common intel_pmc_bxt intel_uncore_frequency snd_soc_core >
> kernel:  drm_ttm_helper ttm video wmi hid_logitech_dj hid_generic 
> sunrpc coretemp i2c_dev
> kernel: CR2: 0000000000000000
> kernel: ---[ end trace 0000000000000000 ]---
> kernel: RIP: 0010:drm_gem_object_free+0x10/0x30
> kernel: Code: 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 
> 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 87 40 01 00 00 
> <48> 8b 00 48 85 c0 74 06 ff e0 cc 66 90 cc 0f 0b 31 >
> kernel: RSP: 0018:ffffb0f300b23de8 EFLAGS: 00010246
> kernel: RAX: 0000000000000000 RBX: ffff918b0487a000 RCX: 000000000000000c
> kernel: RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff918b1eee2468
> kernel: RBP: ffff918b197d9000 R08: 0000000000000000 R09: 0000000000000000
> kernel: R10: 0000000000000000 R11: 0000000000000000 R12: ffff918b179cc000
> kernel: R13: ffff918b03ee0800 R14: ffff918b197d9048 R15: ffff918b197d92e0
> kernel: FS:  00007ffb58033b80(0000) GS:ffff918b32d80000(0000) 
> knlGS:0000000000000000
> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: CR2: 0000000000000000 CR3: 000000011eda4005 CR4: 00000000003706f0
>
>> The root cause is obj->funcs is NULL in drm_gem_object_free(). Only
>> fbdev bo is created by radeon_gem_object_create() and has valid 'funcs'.
>>
>> Maybe there is a better way to fix this bug, but since amdgpu driver
>> also use ttm helpers in amdgpu_bo_ref()/amdgpu_bo_unref() now, I think
>> it is also reasonable to just revert the original commit.
>> ---
>>  drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
>>  drivers/gpu/drm/radeon/radeon_object.c | 7 +++++--
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c 
>> b/drivers/gpu/drm/radeon/radeon_gem.c
>> index 9735f4968b86..210e8d43bb23 100644
>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>> @@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct 
>> drm_gem_object *gobj)
>>
>>      if (robj) {
>>          radeon_mn_unregister(robj);
>> -        ttm_bo_put(&robj->tbo);
>> +        radeon_bo_unref(&robj);
>>      }
>>  }
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c 
>> b/drivers/gpu/drm/radeon/radeon_object.c
>> index d0e4b43d155c..450ff7daa46c 100644
>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>> @@ -256,15 +256,18 @@ struct radeon_bo *radeon_bo_ref(struct 
>> radeon_bo *bo)
>>      if (bo == NULL)
>>          return NULL;
>>
>> -    drm_gem_object_get(&bo->tbo.base);
>> +    ttm_bo_get(&bo->tbo);
>>      return bo;
>>  }
>>
>>  void radeon_bo_unref(struct radeon_bo **bo)
>>  {
>> +    struct ttm_buffer_object *tbo;
>> +
>>      if ((*bo) == NULL)
>>          return;
>> -    drm_gem_object_put(&(*bo)->tbo.base);
>> +    tbo = &((*bo)->tbo);
>> +    ttm_bo_put(tbo);
>>      *bo = NULL;
>>  }
>
> Best Regards,
> Mingcong Bai

