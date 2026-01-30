Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEUiFw0JfWnhPwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:39:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA3BE300
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9C310E372;
	Fri, 30 Jan 2026 19:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XY2mXHbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010042.outbound.protection.outlook.com
 [40.93.198.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AE210E372
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDUSGyyuz2V/xVjF/Jwf7GRudtZZWcz4RNROT4MAFIr2SzuO/D7uemJO7ghBl6fy/vqul/uxbaxjh0YyKCzh0NzyEaBYPaaKI101lIfOg5B5QBXfVQkf31kRrG4UKPM8kaKxbxsYzKTLXUL1yn0CMoexEveFgv0DdZrB1FmuvrFmvM3yC4ncYJqqNI6LY9rvlt8/t7q3rJ4BerUZVGKzuDQPQXjEwnmr/rLdWt/lMsrYlE9ZFIPvzCjuPy/qLIoykFuzNFVfsdfcREC2TCed3wANC367kMyWW3NOS1Fcabf99y75ObVgQi/JIHnuXYd/ssEglje9qvIFgmmWffYUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBLkYN+zKYbGb+Y8FW3h+2OxCtkA/FU3jUXwjmOuDZU=;
 b=QQwxanDTvdwo/zEo38pi4V+P7Hcxbalp6zbdSsqS1e8kOdHovhh1y0AXQ1mfAnPymW0o6fL6TIin/R0Qu4kU8VONrWykQg7YqZl2AajneZNf06WfocUEmwC8qDpUzPtJVw32ugxSDf84RwjmsTQCWtuyTHNj3KTXk0KNhn45lFj+G7eGnZbrXDiP4+9YXJnWx9nrHzgXjo9E76zvjhdySk6St5pKoxQk+9exX7J53qouvo6uX/p/BbPbDNEcbbJ5B/gpGkN5iLt/hy92AYCUSiY5fFxjTEK/5F+0Fio5caSD/HhtlFr9cRegJDSs8snBlYyewkv69oGciC/PEh6zBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBLkYN+zKYbGb+Y8FW3h+2OxCtkA/FU3jUXwjmOuDZU=;
 b=XY2mXHbcdRv8BpFuGxLHrWAL5URqajzcWoUouMX2fMWlmxgVGRVAcSg+dqciAyNykjbNQxqlEta2aDEQHGBEnMFgYwlArreY65s7oQEocrxDbgZNED0NuyJwmKfmIyK1U9Ea/85SsOm0o2ogtaqqRYy2sbhRrSvYqYj9/hmO7CA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 19:39:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 19:39:49 +0000
Message-ID: <bfcf20f8-1390-4add-bf83-1d3087ac05c9@amd.com>
Date: Fri, 30 Jan 2026 13:39:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Hold mm structure across
 iommu_sva_unbind_device()
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260128002356.1858122-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260128002356.1858122-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0118.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: 6576fa20-802e-4e2d-10de-08de60375491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEt5eXFPWldka1JyZWlOM1h4ZmZwbnRFYWtxaG4vRTRzVURka1FIblRWVmVM?=
 =?utf-8?B?NGhPZFlVZ1NIWEQwdUZMaThpQjJpZ2JJeWh2U1ZhNUJtQ3JGYkRhMHNNUE1K?=
 =?utf-8?B?elIrNFF2dlRqdTN3WVRJemk1Sm9RMy9zZnd2YnJ6dnJHZXlJeWIzQmowZjdm?=
 =?utf-8?B?enNJOXZIcWdld2VKS3crVTcraWtIQVoybkVTYnd0SjNKa1FGRFJsbGdNSmZj?=
 =?utf-8?B?cTZoMC9KUGo5dDJxTmQzT21UWis2RXhEZEQ4M1FqZzlxZVlUT3lFazlYNmxi?=
 =?utf-8?B?aDhaQUFweU5aUzlBd29OcWJuQlB3eVo2aVF4UjVnM0lPY2ZqbENqUGZUQzlr?=
 =?utf-8?B?dEE1YnBWQ2FNV1R4QUpOYWxWcEU0MG9IUnMrZ3JHV0REMGxOZWR6SjMyWjRE?=
 =?utf-8?B?Zzg5Z3h3cGZxNnRoSmNEZnkyWTFMZDlMK1dqVnBaL0tPNlRBRkplMDJzRmQ4?=
 =?utf-8?B?VVBvTHlUWWxobDlzNUtCYVpveGR5K2pyb2cwanFXYlhUYm1DNHJoK0h0Zm95?=
 =?utf-8?B?R0lIbmdoSU9ZeDZ6SXR6S1pWWlpvSG44enBjdG5GN09hUzl6ZzNYbW00UjBY?=
 =?utf-8?B?dWh5MWp5dURaWVc0Zld1eG9xcVNFMGVxSGhXUE5HMzdUOVo0ak9SN0JiS3dP?=
 =?utf-8?B?eU9hZHV1cVdDMGIrS1hwQXRVb1ltaGs4cXIxU0JhYlg3a0ZYS3haK05UVC92?=
 =?utf-8?B?b0JGK2ZwdXlkRGtobXlVYzAzd0dyMThWaHBHT25taEM1ZmRlUExKTHNjODI4?=
 =?utf-8?B?R09QV2tCcUNKUGdiVVhvWk5SWjFSa3ltZk9qY2VVb1M0VGpsRFFLa2tBWmVT?=
 =?utf-8?B?KzJwYytJMGF5SWJuWmpFWHc5emxQTEJMcFFwVERUdDdOTFhyWDNPc2dSYy9v?=
 =?utf-8?B?S3ExTkJlVGNJT1BVZWFIc00zRXhmelkvbjliaExNdnplVW1HMmVzcStJNVNt?=
 =?utf-8?B?UEhVY0w2M1FabE5iVUJlRW9wRDBBT2pmaXhHTDlCMVRlNFJxQWk0MVZXWTA5?=
 =?utf-8?B?aXpZT0hDWlJiS1d0OVJYREcrRnlTTzVGSHhjM0piUUhzelJXazd2cGg4WnFY?=
 =?utf-8?B?YWhnQ2p1ZEVyUDZCMUtVT3hxSUhTdzRRMWFzcUJRSXFKZ0Q5VkkrSndnZ3dq?=
 =?utf-8?B?QUNES052TjF1Z0JwVGw2c2dZNVBrN011ZjVSaHcxSUdHTDBiT1dHNExDajFC?=
 =?utf-8?B?U0g5Y2NkTHhWNkpIYkVtSGxBT3Z5WmFmZUY5Tkl3Y3FldURKdVZQSUtjOGZ4?=
 =?utf-8?B?NlQ2a3FaVERIa0k2cm1TTnBTYWhyWUdkUGhTNkZiYnFmMERHMEp3VEQ5dHov?=
 =?utf-8?B?OWhTSFcweEdoQWFwVEtETml2MDNDUjhZYkwvT2d5b3lHVm5lK0N1SGRjYlJY?=
 =?utf-8?B?ekxtSSt0ekk2WWNuVXJvS29VYWF5cDJLb1UvclgvWVhTL3RVZWlsem0xTHp6?=
 =?utf-8?B?Qk0zcjRXYzFTMjlMS1JRdG9xd3NiSjA2d21vRnlSakVtNmZaTEhILzJKWFZ4?=
 =?utf-8?B?Y3ZHWFZSZWprSEVNSDVhdVlza0hlUHh2ZnVBN25GSHREejl1bHpNcmVXOVJS?=
 =?utf-8?B?TFJML1BXT1dkdnh2aWd4K1BwdFFIRExBR2VBOVhKemtZb2w1bjlxSGNMdys3?=
 =?utf-8?B?Ym1PeFRyWktHbUhJNnNLWWJzc1hTTko3QXhldDNPR29VUkQvM3RLaGFoeSt5?=
 =?utf-8?B?UkNmdThaTm15WVJMRkkvYVB4Vk5SMElIUDNIVllKVGRaTGo0cWRVSTdJQWFi?=
 =?utf-8?B?SFVDbDlkTUY2QnRUOUxTOGlZL2JyQWRQWGFuMXA1QThJVEZsVlpwTzJ4Z2RP?=
 =?utf-8?B?bmdVdjk4SkxOQ1FqMFh3ckRBUTErUEM5RWdLbWNUWnJSZGhiR0hhVUYrK3Rv?=
 =?utf-8?B?WkVvb0pTck5ZcFRERFlXWW1tandTUjQxVWxrUXQ4bENQKzk1Vm9nTzU2eFh6?=
 =?utf-8?B?MTFYQkhEWXJCYWwwWEhXcTZncFJIOUUzdnBQbFdvVUFYRk5BOS9ITEhLUVph?=
 =?utf-8?B?U0ljZDA5NmJZelFKR21rYmE0eHpOSnEreDJNdXROWTlRVjZvZWg5dG92NWhj?=
 =?utf-8?B?eElzbjUyMUtzSGJYblpRSU9zRjhNeVNLeG8xaWpaZGpEb3o5SjJ3bWVqWnJE?=
 =?utf-8?Q?tlOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3ZabHNqVEdFVXF3M0Q5dEMvTWl5TmtoaFJHQURHZElIOWx6SExML1NVYjhG?=
 =?utf-8?B?bURhbUx1WnlyWDlPc2pmdVRNUHRtSzhHek4yV1ErL1N0TjdXVXI1UU1TWm9H?=
 =?utf-8?B?Q3BQdSttYUlmSUFUU1ZQVVFUOWx3YnhIaFZMeDl1amtTYk9FbE5pbkdPVFZS?=
 =?utf-8?B?Zmd1UUc5OHcveE4wV0djQlFIdmx0WmxpMVd4cjlyZ09ONkpxeXcyTXFDbXZi?=
 =?utf-8?B?UkkzQllnYWVld2grcmVJVXVVQmtaYUtLaDlrSWNySy9OUlpra1VTeWhTampP?=
 =?utf-8?B?bWEwQUhpL21TTXlWS2FHeWh6ME1waXArVzYyZ2FGQ2MwV2p6VW42dWxwVkZu?=
 =?utf-8?B?ZUdoNUxFc2FFRmF4YVREanRrQVRCbENGeHJ1ZGl6b0hHeE5GR3RPU2JpaGJ0?=
 =?utf-8?B?d2t3Rm4xczUxU2R6cW5SbG9NUXcwTTFaS2prVElMQmhUeHRCMjZDcit0d3VV?=
 =?utf-8?B?SlBhY3hudHI2RC91anR4NS9NRzZOMTlxYjJKTUNkNCtJL2paN0dBbkxpQk5L?=
 =?utf-8?B?VzN5ZFRIei9kVzlLUTlIcmFnT0RVSzRWL1JVeGg3R3FwalQ0UG9DOFVGTDNR?=
 =?utf-8?B?bVJaZ05XNFVpUW9WVW5XeXJnWGJGRktmWXBpRUxUQmNrUVpyODN4RzBjZDhm?=
 =?utf-8?B?RHV1NTF0MURvUFJrR3FOSnpKbkRDdzZObXZ3U09yKzROdHpjb1pyd3F3eDdT?=
 =?utf-8?B?dDhSd2I1blQwM1dES2ZQd0RwNjVPZGJJM2lJaEZydzVqZjRSS0lYeDBaY25R?=
 =?utf-8?B?ZmpOQTArNUJCT3hkVHhZQzdRNHA3NEdDNnVVeHE1ZG5nUnJjaXpPMFB4MXlr?=
 =?utf-8?B?NThQMGNvUVUvL1lZRjlZTE5XU2RUWDR3L2s3NFpoTFVieHVjOVZ0ZjZyS0ZB?=
 =?utf-8?B?UWVPNGc5OW13TUpYZmZRWnNuZWw3N2V3NzdlMm1TZ1ZITXcyamRaYytpY0N4?=
 =?utf-8?B?ejZoZmlWWEdwNnFBVVpCdGdEWEZTL0pNQStKNjQwU2lkZHhQcXNUdEZjZ0dK?=
 =?utf-8?B?N2ZMSGVpbzFvL3BycjM4NUFBRGpLS1c3UnVwa1QxdWtveEZvNlhQMEM1UUJL?=
 =?utf-8?B?WEdqUFNxRWxPYjZqanpEYlliMHdxYktJZXVGZUpYQ29HNG5XN0tyN1cxN2Vk?=
 =?utf-8?B?TDBQYTlVMkdJMXpmR1Z3K2R0dThIdUd3TGt4L2kyQUVQbnE2dEZiY1JYOEZO?=
 =?utf-8?B?MjFMVW15T2xaanE2aEhuS0lzWU01VkhnTDZGYy8yVmxWeTFwODd1VFBSVWU5?=
 =?utf-8?B?SjJEdzhMMUhiZXZnaFVlSkF6cUtobFFQZklSbU1SaGNJSXJsbjRVUmYyM2J4?=
 =?utf-8?B?WkNJUmpPOTJHUUVxV25wNTVnV3ozYTBySHVrMjF2bkRkeEExeVc3elQweVVE?=
 =?utf-8?B?T1VNTUwzME1GYkJWcDFUV2lqZDdvYkhGdTVvSnVYRFNpY1pwSUJubCt1N3pS?=
 =?utf-8?B?RjVwWjJaZTY0RWFmR0ZtUmpmWkxwd2FnbGRoQzVRQnVQb012bW1HWUUvWDh3?=
 =?utf-8?B?UGJZVXRsNm8wK1ZNK2k3cmcxOThESDlSNzh5c2ptS0xPYVFhZlR2Y0lMeHdt?=
 =?utf-8?B?Y0ttVlc4WUZNMkRuQ216UDYwTFhsTXMwdGRFT1Q2Undsd3pmWlRneTlDekUy?=
 =?utf-8?B?VDRvbFlNc3hOdzlOSXB1ZXRZNTBsNytmdVBrcmUwVU1HNGtqMjNQU2RaK2FY?=
 =?utf-8?B?U0dERlUrT2pGcTczTFV2c0dLVGkvMkx3bXZJcE91VjlhMDFJVTZaUHhFSHMw?=
 =?utf-8?B?cVlxanppWWlMVDNxblo1VWo5UFNQRFNiQ3B2Z0dweDhoM0E5RkY4R3JkMXRs?=
 =?utf-8?B?dExibjVHZ1EweGt4NGhnR1o5blhLdWNCak9qNTVMRk5jOFVLSFFjMWgyVFNw?=
 =?utf-8?B?SVkxbkd4TEJTdUNUWWJYNW9zRkI1emdBSUY1OTgvd0VoUk5nNTZzNDM3ZkdS?=
 =?utf-8?B?U0Rzd29DVDFPQ1NpMkd2MVB3Zlg0SUx4N2xZY09mY21RK1d3eHFkaE1kN0hS?=
 =?utf-8?B?em42c21LZS9IdGYramlLbytkN1hIcDFJODFOL0ZoWHp3WExpbGt2VDA4Z0ZP?=
 =?utf-8?B?Zkl0eUkvaFVpeTMrMFJJVGp6SEYxRys1QUhic0w4VGRWMWJIQkhJVjdaM0ZU?=
 =?utf-8?B?NDE1R0lTc0JnUE94RWFZdW1oMEY5YWo0NzVza1F1ZTBaU2FpOFNsQS8zajUx?=
 =?utf-8?B?OU5wVVlQdm1Yb3dzSHVWWlZaaCt3UVgwK0UyL2RDT1BnZ1hwb1JQMjBoeXZa?=
 =?utf-8?B?QXpHZ3dVRWY5K2I2U0dLQ29sMjlOdzN1dEpvZUsxcDhiMTkyVkMrVGtlcFZl?=
 =?utf-8?B?anRKM2MrRE1uWjVOS2dKRFVpNEdNQlk0YWpjV09MSXdpbXdqVTVxZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6576fa20-802e-4e2d-10de-08de60375491
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:39:49.3304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPfvo70laesYM+cRP5NQshoxphzcbR8I1NiFgcSQYNDjxpIHzI/h1ANJsDNwLBorO7pt6WN8ZHvzAVU+Kfax+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BEAA3BE300
X-Rspamd-Action: no action

On 1/27/26 6:23 PM, Lizhi Hou wrote:
> Some tests trigger a crash in iommu_sva_unbind_device() due to
> accessing iommu_mm after the associated mm structure has been
> freed.
> 
> Fix this by taking an explicit reference to the mm structure
> after successfully binding the device, and releasing it only
> after the device is unbound. This ensures the mm remains valid
> for the entire SVA bind/unbind lifetime.
> 
> Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 3 +++
>   drivers/accel/amdxdna/amdxdna_pci_drv.h | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 45f5c12fc67f..fdefd9ec2066 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -82,6 +82,8 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>   		ret = -ENODEV;
>   		goto unbind_sva;
>   	}
> +	client->mm = current->mm;
> +	mmgrab(client->mm);
>   	init_srcu_struct(&client->hwctx_srcu);
>   	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
>   	mutex_init(&client->mm_lock);
> @@ -116,6 +118,7 @@ static void amdxdna_client_cleanup(struct amdxdna_client *client)
>   		drm_gem_object_put(to_gobj(client->dev_heap));
>   
>   	iommu_sva_unbind_device(client->sva);
> +	mmdrop(client->mm);
>   
>   	kfree(client);
>   }
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index 6580cb5ec7e2..f08406b8fdf9 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -130,6 +130,7 @@ struct amdxdna_client {
>   
>   	struct iommu_sva		*sva;
>   	int				pasid;
> +	struct mm_struct		*mm;
>   };
>   
>   #define amdxdna_for_each_hwctx(client, hwctx_id, entry)		\

