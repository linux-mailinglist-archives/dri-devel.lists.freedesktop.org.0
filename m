Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BECB0107
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 14:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930210E597;
	Tue,  9 Dec 2025 13:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HAQuJxEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011051.outbound.protection.outlook.com
 [40.93.194.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246B310E596;
 Tue,  9 Dec 2025 13:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZzS01xLB5MC7vgLflQHMwjOBzyeOvD4Gp5EI9ReFva6/MjlyZHTvt5UWAXxM+MHBsXOZHzgOp1QpFtaxWYR9nboJexZowT3icmIQO0NMwQHTJWrn7YccTKk6UK1/zfsvHxmnJb5ChyckYRJE55sh7kVCnPRBtUMwZSKrIsLmMJENp0x59Oh1o4+aiWdeNzjrdqIoAb0YjmWY+nFvGeD3glCMFfkrUCEEPvTJKnSJ1Kn4zzDfVrMEfv0FnoQIz0SO53iWyuseO4T+mpRk+sdsYQP86Kyc76YmByCoxZkpFm+J1kG/tHSMGgHslBQKz3GCBfSu4C1Fqj8Lsyaeu+BdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg4uTIbiVlhJiBWaAzip7mkD20Yf9K6wghp99LBygFM=;
 b=eTSqBPV6MFO0lnSCkSdjSwxT4C2cI4krNHLXp4K4UwUgL/gkCcGPwBNboNZBdEf07YeKWDAv2ZME4OAG02HZEkud0afg8y6b2eIUR28Uhkub6IOv2MCRcn5gX6asxun4SuIfM/x4IZct9GV55dqEzmkittvafuF+SVnR50FBXtskeNzhaPmroc+PjS2Rx3WCT81pv0g5r78g+BG9nrR9IwZS4fWz0jyE4wG5WKoG3XbcmjvongHSkdDNyEfFFS4PA9EulS9sxbiRK5zRXqYBodNpo6bQa+Q5T7vrCgKQnJqtAUXQ2OCLBs6UKS1OXrYuidJ6XkodC1BfRwsfNucUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gg4uTIbiVlhJiBWaAzip7mkD20Yf9K6wghp99LBygFM=;
 b=HAQuJxEMYqSLzMtlyiXyDgZfB7DrJcP15QXlosxvO7Pf0XVGGNxiuvpLWhRf5sMFBpVnasI1rDPViggCvkSRMNO+6sp7217Z42ByogNYaQixOjA3st219T/E0nFS4aAbIsoComWbQsUIL+/bURP84Cfwdyg2t+Ia+VGOH69Xnow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 13:32:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 13:32:15 +0000
Message-ID: <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
Date: Tue, 9 Dec 2025 14:32:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0599.namprd03.prod.outlook.com
 (2603:10b6:408:10d::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 82018aee-a9a7-4862-852a-08de37275db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzhHREJ5d0dvRGFlT0pHOGF2YWpvcXBqTzdwaTU2YXhpd1gzaTdRalVKY05w?=
 =?utf-8?B?UG5kKzB2UUFtMU5XTGQwWUdVSUhSa0NKM1lNeUhhdi9aZlJKdXRCR1NRY1JT?=
 =?utf-8?B?MUIrZDNDVGNkVDR6RzBwa1RFbGo0dFE0NG9jb0I3T1dMdURmYW4zdHNhYUVL?=
 =?utf-8?B?YVVISEsxQTdmb3FObzQwU05pWDhnSlJwbldMWFVUM2hjVk5oSUFkQzR5OTV1?=
 =?utf-8?B?aTdZY052UDBKU2VpdC8xcTJRMlNDZ0RqamhEWmJmNEV5THdRenVTQldaVlJV?=
 =?utf-8?B?L2RKOFpjdzUwQzJKanVnL3VoZ1puRzZ4d3QzV0dxdjNVb21zRjByMnVrcVBv?=
 =?utf-8?B?TVUxeWx5bGZTajRTYmU0NVZSU2dQTVVZOTgvR0tTZG95a1lMZElFWTc0OEx1?=
 =?utf-8?B?YkF0V1d1dE9sQzdoeVlVZzJvR2VlWFR1YTh0T29aOGg0b3oyU213YWRjUEht?=
 =?utf-8?B?d0JCS0VBMzZvQVBSNTNLMzlxbXNmZzJpNm1vbFZkUndMcjNxd01Da2h1dVdq?=
 =?utf-8?B?Y3RuVTVTOFlPWUhHdnNOOWpQOUhFYVd2amd4ZW95ZTRILzJCejIrVlJZU1pY?=
 =?utf-8?B?TERybW5PWFVYc3FKbzc5VElZWHBjNFV2Snk5T21rcWp3Vmh1MHoxa1VuZHBx?=
 =?utf-8?B?NXJMdVJqRjVEY0ZWdkJrQWgyTmdHVHlkdEdvU2ZYQ0xBaG94aHpxeDdTS29M?=
 =?utf-8?B?NUh0UVRJcGZ3UTRnS1pMOFYyYVZQNFBwSDNwTGV1RUJVNk1mMWVMOWV0M2cz?=
 =?utf-8?B?ZjVDRnFaM1J2dktFcDNHUFVoZWRjMEROeWhsN2hZek9ndERJMXlRbmdBcUZI?=
 =?utf-8?B?aDF2S0Y2SUVVcExkaFdUdnhFckdpOW95Q1piUlNoZmZHSE5JcHMySTVORDZX?=
 =?utf-8?B?eFlsK0k3RCt5RmhGMVZrSUZKakdIZkl6RjNVVm1NWVlWZXpXVHlXZG5VTko3?=
 =?utf-8?B?OWxUK2s4Ri9BTjl5a1pleXVwNURrYzkxR09XVjVSc2doM2F1TlZMNTkvT1ZP?=
 =?utf-8?B?L21ZSWdQOFNIblFiL0kvWHlzamhDcFd3Tk9vUU5tSHZ2M1hkWGUwenRDQ0d1?=
 =?utf-8?B?Rk9WelkyYXV2OGhpVnR2NGhGaXViZ3VKeDhrTlhOVi8venBRRTJLVE4rcEI5?=
 =?utf-8?B?L0MyKytXdXM4ZHdLQzMyZy9KVG94U2FoRXZySjdYVWI4Snh6ZkZBMitRWlI1?=
 =?utf-8?B?TVdjYkpuanduVzRGaWNET2pLRytzUW9zenVqcVdiZjBQT3VhbUxCUm1RbVU2?=
 =?utf-8?B?T0dxOTJpQThWTUtZcU1vWTRRYXEwN3N2NnpTekRTRTl5ekYwbXM0M3F3dGdX?=
 =?utf-8?B?Skc4WHR3SE5ZNGNZam5POGZaRVdGKzZVZ2ZBU2xXdkNyNjU1b3lOQktzcTln?=
 =?utf-8?B?Y1g3dThKTllhdmt6QmtqUWdaemNDVVFHc0NuWnJZdlI3bnpmUTlCZGxqMWJx?=
 =?utf-8?B?Z1R5Wmt5WlQxNHJBeVcrMTQxa0VpMHVQOHk2NXloN3VTTktUVE5ybXNaQUhh?=
 =?utf-8?B?YkN1SUZKY0RWbjJXelovdU9sVnRVcXVQdityRWJYbG03NnFhSEpNQUtDUjNi?=
 =?utf-8?B?VmVtM1pjSlFXT3FibWRRRlAwcXpWVnVEdFZpNWF6QUhIWTRzYjhoMkVHZXVq?=
 =?utf-8?B?eXZRNW4xUWcyZUtLVmZUWFQzd1crenNZR2EydTJ6SHhMRFdJMTYySEt3ME93?=
 =?utf-8?B?a0JGdWgzcTZ0UTgzT005ZGRIaStLd2FPV1dtYnZYeng5RzBiSVpTOHdrNHBw?=
 =?utf-8?B?UHdGblphVGhpT0lvbS9CY3dJVHhHclNETVlZSmY2M29neEs2VVhVY1Y2OUFJ?=
 =?utf-8?B?akh0MHFTYjJnNlY5NFJzWDNyQTE5aUlQL0E3NFlUdmQrb3BRRTdaM0E3VUlE?=
 =?utf-8?B?WU9ieCtiSGQvYVBQRysyNmpuKzQ4T2lzNWJ0RGREN01VUytKUUFxTmtvY1lq?=
 =?utf-8?Q?hdrZPuRuChwGK6CVUI4Q3UhRANTpifbV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1FzbmNscnZwL0YwdzM4Ry9wbUNLOC9ROVhzNGhFSHltRERhNEY0NllhSm9Z?=
 =?utf-8?B?bzZNSUR6SlQ2ZGl6aUhXRDZPSDQwdzF1WGNpdGtOUksvK3Q1M3Nhei84Y090?=
 =?utf-8?B?aVhhSlRDTFNxKzBweThrb0x3ZW5NcUV0enVTSnFZQUJQbEt3SW5Na2dJb0Z6?=
 =?utf-8?B?TWNnTURRYkd5MUJQeWdrWXFsSnU1dkVLaEkwL2t0Z1h4RDdETStJV2xhV2l5?=
 =?utf-8?B?ZUw5cjNuVW9EaWZKUjZVSWNLYVZ4NVZjc25DdzlCZ1A2NmRjMnFuc05mcVJ6?=
 =?utf-8?B?dmtjNWg5Q1pzcjFFK0VqdFFVRU5iQVV0ckpoVlBHdXNITkg5SCtVWmdRNTYr?=
 =?utf-8?B?WlFlNW1zaC9aN2pOdUZqZnBCdUxTNDZ2d3I0MzNxN3J2ZTZjbDFYU055ODFT?=
 =?utf-8?B?VEZEN1BabGNKQzloRnl2bWpHbnJVZ2wxRHZ2a0NPODk5aE11c1IzVVhFS1cy?=
 =?utf-8?B?cmF0YTVmU1dsNGxlcnRHKzdFQVNiZVVHN1ZWenA0Vy8xMHlFajluOVhuRThL?=
 =?utf-8?B?U3JLQU1RanNtcy9jTVNaYnArZTF0YzBIOHd5YUZCNGtHdFN2WGx5ZGRLUjdT?=
 =?utf-8?B?bTlCN3ZkNStveDRwQVNQVVZGMzNGbTFDdFl6VFR3Z3ZGMWdKMm44dHlTZEsr?=
 =?utf-8?B?Y1A3dVVOQzRvVktycDExM2w3b2lZMnVsUUVubnpNV3E0MnBvbnRCOWh0YklP?=
 =?utf-8?B?Z01WZG02R2R1eUdOMjRCeVhzOWd5eVI5TEdhMjVQbUJ2YUtLUGxoa3VXVndS?=
 =?utf-8?B?cmp4U3Nzb290VGF4SFE2dTFEWVFvQ3FZYkZLNERleEllNDdybjFpZkkvbnZM?=
 =?utf-8?B?S3NjUzZsSkVWQnhrdUpPZUU1MUx5ZmxIM1RVY25xUWdkMHVZVnRWVGlCRmc3?=
 =?utf-8?B?Tnp2Y2M4TkJ1a0pUOEVuRkdFRnRVQ3dDOUZBd1h1Sjk1Z1RqNyt5d1lnMUdD?=
 =?utf-8?B?TlJtS2R2M01UWWRmeW10THRtWCtTNmRZUVJKM2pkWFFOYy9Mci9wU3RuNWd6?=
 =?utf-8?B?aVZDOTQycGtHem0wV053SmZON3ZTWm1LTi9qL21RclgxWkk2dVdxY3NrcHNx?=
 =?utf-8?B?Y0RHUllwbDkwY0JNMGlEenJQZm5SWitDdjk1Y3prRk1yL3FiNGNEZHRrVVor?=
 =?utf-8?B?RGEySzdUNWR6UzladHZOYjNBNFpEZko1NG5QVms1akNiUU1hVDNoa0J2U0JH?=
 =?utf-8?B?dFJPbE9FQ29wNGJYcEZsRGFuQk5wNlRVMVFCTzV3RGZEY0NQZlhMeXlJcml6?=
 =?utf-8?B?LytJZ3RibWxidXhzajlma21oc3A5L2FId1gwWUhPYzFXM1JIMERBUmRBNkdi?=
 =?utf-8?B?NUp4aDQ0RFBLVE9mUk9EMDlQT3lwNTRPK0RPRWd2dFZLSHNSNllySVhYS1FH?=
 =?utf-8?B?TVNwdXptcFpWajN5aGVMOUxWSDRBRnNteVNSRnVjRUZLeDVxdTJVbjNIZ3Ry?=
 =?utf-8?B?dHdPcnIySU93MGswK0FOZmg2ei8rdUsyekNvNnlFMVVPQ0kzMkd0RCttV211?=
 =?utf-8?B?eVI3WC9pa2xGNmd6WlJTMFB6aVRoN0svNGtvdVI2ZDg3RC9SNEVQWDBvOXd1?=
 =?utf-8?B?ZWZiVU15TlhLU21YaWV0SFhVZjQ4MVpCd28yNFcxWkhDUkIvSkFrak12eDFF?=
 =?utf-8?B?cHVyeDZDaGhidGJBbEs3UlhQRkZoQWpNZldWeW1mK0krb2FKbVRBWUh1Y0E2?=
 =?utf-8?B?MkptREFybWdZQWRFbVJvckRESXFRMUJkZFI0VXBzUk0rNHBJUVViOWhLVWJ4?=
 =?utf-8?B?cFYrbTJZK3FEWlJVeTY4ckdvS1VYeHJ2SkxHNDk3OE12d0J4TGVPL2RNSllS?=
 =?utf-8?B?cFFZUlVxWFZDRHh3QkZidVNEUEZzMjNUeGdIeGRNSEV2VGJGdXVScVFsM1M4?=
 =?utf-8?B?VEdPd1oxUTJGajdUenBVZ0lNRGJMRFZHd1pYVlFQRnhVL2k5S25vaUpzQnpw?=
 =?utf-8?B?ZjN0MDJBUmRSWHdnbnNIVlhIMGsyVk1ObzdHS2FralpGSmZTWmh0Vy9CMDBk?=
 =?utf-8?B?eFRwSHoyeEtrelRaWjYvOGR6Tkh4ZUdkWTlHY1dpNElxQWF5aEdQVlo5M1Mx?=
 =?utf-8?B?STUzMTk0Rm9jS0xFdHBLcWNSWFRNbXF5ajA5Mm5CTnRLa1lpS3R1cHZYWlho?=
 =?utf-8?Q?wrio=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82018aee-a9a7-4862-852a-08de37275db7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:32:14.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TxYSXBG4lsKwLhRFxV2qx74vh7RDhTjOMGUKWkszhUViF9C4rPj3Q0ENVpQfjAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211
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

On 12/9/25 12:00, Philipp Stanner wrote:
> On Mon, 2025-12-08 at 13:39 -0800, Matthew Brost wrote:
>> On Mon, Dec 08, 2025 at 08:43:03PM +0100, Christian König wrote:
>>> On 12/8/25 20:02, Matthew Brost wrote:
>>>> On Mon, Dec 08, 2025 at 10:58:42AM -0800, Matthew Brost wrote:
>>>>> On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote:
>>>>>> On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
>>>>>>> On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian König wrote:
>>>>>>>> On 12/1/25 10:04, Philipp Stanner wrote:
>>> ....
>>>>>>>>> This entire fix idea seems to circle around the concept of relying yet
>>>>>>>>> again on the scheduler's internal behavior (i.e., when it schedules the
>>>>>>>>> call to free_job()).
>>>>>>>>>
>>>>>>>>> I think we discussed that at XDC, but how I see it if drivers have
>>>>>>>>> strange job life time requirements where a job shall outlive
>>>>>>>>> drm_sched's free_job() call, they must solve that with a proper
>>>>>>>>> synchronization mechanism.
>>>>>>>>
>>>>>>>> Well that is not correct as far as I can see.
>>>>>>>>
>>>>>>>> The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.
>>>>>>>>
>>>>>>>> This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.
>>>>>>>>
>>>>>>>
>>>>>>> Are you sure this is happening? It doesn’t seem possible, nor have I
>>>>>>> observed it.
>>>>>>
>>>>>> It's impossible, isn't it?
>>>>>>
>>>>>> static void drm_sched_job_timedout(struct work_struct *work) { struct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET; sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent deletion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if (job) { /* * Remove the bad job so it cannot be freed by a concurrent * &struct drm_sched_backend_ops.free_job. It will be * reinserted after the scheduler's work items have been * cancelled, at which point it's safe. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); status = job->sched->ops->timedout_job(job);
>>>>>>
>>>>>>
>>>>>>    1. scheduler takes list lock
>>>>>>    2. removes job from list
>>>>>>    3. unlocks
>>>>>>    4. calls timedout_job callback
>>>>>>
>>>>>>
>>>>>> How can free_job_work, through drm_sched_get_finished_job(), get and
>>>>>> free the same job?
>>>>>>
>>>>>
>>>>> It can't.
>>>
>>> But exactly that happens somehow. Don't ask me how, I have no idea.
> 
> *Philipp refuses to elaborate and asks Christian*
> 
> How are you so sure about that's what's happening? Anyways, assuming it
> is true:

[  489.134585] ==================================================================
[  489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
[  489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kworker/u128:0/12
[  489.158686] 
[  489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: G            E       6.16.0-1289896.3.zuul.0ec208edc00d48a9bae1719675cb777f #1 PREEMPT(voluntary) 
[  489.160285] Tainted: [E]=UNSIGNED_MODULE
[  489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BIOS V1.03.B10 04/01/2019
[  489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
[  489.160306] Call Trace:
[  489.160308]  <TASK>
[  489.160311]  dump_stack_lvl+0x64/0x80
[  489.160321]  print_report+0xce/0x630
[  489.160328]  ? _raw_spin_lock_irqsave+0x86/0xd0
[  489.160333]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  489.160337]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
[  489.161044]  kasan_report+0xb8/0xf0
[  489.161049]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
[  489.161756]  amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
[  489.162464]  ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [amdgpu]
[  489.163170]  ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
[  489.163904]  amdgpu_job_timedout+0x642/0x1400 [amdgpu]
[  489.164698]  ? __pfx__raw_spin_lock+0x10/0x10
[  489.164703]  ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
[  489.165496]  ? _raw_spin_lock+0x75/0xc0
[  489.165499]  ? __pfx__raw_spin_lock+0x10/0x10
[  489.165503]  drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]

> 
>>>
>>> My educated guess is that the job somehow ends up on the pending list again.
> 
> then the obvious question would be: does amdgpu touch the pending_list
> itself, or does it only ever modify it through proper scheduler APIs?

My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.

>>>
>>>>>
>>>>>> The pending_list is probably the one place where we actually lock
>>>>>> consistently and sanely.
>>>>>>
>>>>>> I think this needs to be debugged more intensively, Christian.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> What actually looks like a problem is that in drm_sched_job_timedout,
>>>>>>> free_job can be called. Look at [2]—if you’re using free_guilty (Xe
>>>>>>> isn’t, but [2] was Xe trying to do the same thing), this is actually
>>>>>>> unsafe. The free_guilty code should likely be removed as that definitely
>>>>>>> can explode under the right conditions.
>>>>>>
>>>>>> I'm right now not even sure why free_guilty exists, but I don't see how
>>>>>
>>>>> I'm sure why free_guilty exists either. If the fence is signaled in
>>>>> timedout job free_job will get scheduled on another work_item.
>>>>>
>>>>>> it's illegal for drm_sched to call free_job in drm_sched_job_timedout?
>>>>>>
>>>>>> free_job can be called at any point in time, drivers must expect that.
>>>>>> No lock is being held, and timedout_job already ran. So what's the
>>>>>> problem?
>>>>>>
>>>>>> For drivers with additional refcounting it would be even less of a
>>>>>> problem.
>>>>>>
>>>>>
>>>>> No, the scheduler can still reference the job.
>>>>>
>>>>> 1265         fence = sched->ops->run_job(sched_job);
>>>>> 1266         complete_all(&entity->entity_idle);
>>>>> 1267         drm_sched_fence_scheduled(s_fence, fence);
>>>>> 1268
>>>>> 1269         if (!IS_ERR_OR_NULL(fence)) {
>>>>> 1270                 r = dma_fence_add_callback(fence, &sched_job->cb,
>>>>> 1271                                            drm_sched_job_done_cb);
>>>>> 1272                 if (r == -ENOENT)
>>>>> 1273                         drm_sched_job_done(sched_job, fence->error);
>>>>> 1274                 else if (r)
>>>>> 1275                         DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
>>>>> 1276
>>>>> 1277                 dma_fence_put(fence);
>>>>> 1278         } else {
>>>>> 1279                 drm_sched_job_done(sched_job, IS_ERR(fence) ?
>>>>> 1280                                    PTR_ERR(fence) : 0);
>>>>> 1281         }
>>>>> 1282
>>>>> 1283         wake_up(&sched->job_scheduled);
>>>>> 1284         drm_sched_run_job_queue(sched);
>>>>>
>>>>> At line 1269, the run_job work item is interrupted. Timed-out jobs run,
>>>>> call free_job, which performs the final put. Then the run_job work item
>>>>> resumes—and boom, UAF. Using the same reasoning, I think moving free_job
>>>>> to the timed-out work queue could also cause issues.
>>>>>
>>>>> If run_job work item took a reference to the job before adding it to the
>>>>> pending list and dropped it after it was done touching it in this
>>>>> function, then yes, that would be safe. This is an argument for moving
>>>>> reference counting into the base DRM scheduler class, it would make
>>>>
>>>> typo: s/DRM scheduler class/DRM job class
>>>
>>> That strongly sounds like re-inventing the scheduler fence.
>>>
>>
>> Perhaps.
>>
>>> What if we completely drop the job object? Or merge it into the scheduler fence?
>>>
>>> The fence has reference counting, proper state transitions and a well defined lifetime.
>>>
>>> We would just need ->schedule and ->finished functions instead of ->run_job and ->free_job. Those callbacks would then still be called by the scheduler in work item context instead of the irq context of the dma_fence callbacks.
>>
>> Yes, definitely no IRQ contexts.
>>
>>>
>>> The job can then be a void* in the scheduler fence where drivers can put anything they want and also drivers control the lifetime of that. E.g. they can free it during ->schedule as well as during ->finished.
>>>
>>
>> I think this is a reasonable idea, but it would require major surgery
>> across the subsystem plus the 11 upstream drivers I’m counting that use
>> DRM scheduler. This would be a huge coordinated effort.
>>
>> So I see three options:
>>
>> 1. Rename free_job to put_job and document usage. Rip out free_guilty.
>>    Likely the easiest and least invasive.
> 
> I think I can live with that. It's work-effort wise the best we can do
> right now. However, that does need proper documentation.

I think that is the worst of all options.

It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.

> 
> Let me respin to my documentation series and upstream that soonish,
> than we can build on top of that.
> 
> 
> P.
> 
>>
>> 2. Move reference counting to the base DRM scheduler job object, provide a
>>    vfunc for the final job put, and document usage. Medium invasive.

I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.

With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.

If a driver like XE needs that for some reason than that is perfectly fine.

>> 3. Move job (driver) side tracking to the scheduler fence and let it
>>    control the lifetime. Very invasive.

Thinking about it more that is actually not so much of a problem.

Let me try to code something together by the end of next week or so.

Regards,
Christian.

>>
>> I’ll support any option, but my personal bandwidth to dive into
>> something like #3 just isn’t there (of course, I can help review
>> scheduler changes and fix up Xe, etc.).
>>
>> Matt
>>
>>> Christian.
>>>
>>>>
>>>> Matt
>>>>
>>>>> ownership clear rather than relying on ordered work queues to keep
>>>>> everything safe.
>>>>>
>>>>>>>
>>>>>>> [2] git format-patch -1 ea2f6a77d0c40
>>>>>>>
>>>>>>>>> The first question would be: what does amdgpu need the job for after
>>>>>>>>> free_job() ran? What do you even need a job for still after there was a
>>>>>>>>> timeout?
>>>>>>>>
>>>>>>>> No, we just need the job structure alive as long as the timedout_job() callback is running.
>>>>>>>>
>>>>>>>
>>>>>>> Yes, I agree.
>>>>>>
>>>>>> As far as I can see that's how it's already implemented? No one can
>>>>>> free that job while timedout_job() is running in
>>>>>> drm_sched_job_timedout().
>>>>>>
>>>>>
>>>>> See above, free guility is still problematic.
>>>>>  
>>>>>>>
>>>>>>>>> And if you really still need its contents, can't you memcpy() the job
>>>>>>>>> or something?
>>>>>>>>>
>>>>>>>>> Assuming that it really needs it and that that cannot easily be solved,
>>>>>>>>> I suppose the obvious answer for differing memory life times is
>>>>>>>>> refcounting. So amdgpu could just let drm_sched drop its reference in
>>>>>>>>> free_job(), and from then onward it's amdgpu's problem.
>>>>>>>>>
>>>>>>>>> I hope Matthew can educate us on how Xe does it.
>>>>>>>>
>>>>>>>> We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.
>>>>>>>>
>>>>>>>
>>>>>>> No, see my explainations above. This is not my suggestion.
>>>>>>>
>>>>>>>>>
>>>>>>>>> AFAIK Nouveau doesn't have that problem, because on timeout we just
>>>>>>>>> terminate the channel.
>>>>>>>>>
>>>>>>>>> Would also be interesting to hear whether other driver folks have the
>>>>>>>>> problem of free_job() being racy.
>>>>>>>>
>>>>>>>> I think that this is still a general problem with the drm scheduler and not driver specific at all.
>>>>>>>>
>>>>>>>
>>>>>>> Maybe the free_guilty is likely a scheduler problem but I'm not seeing
>>>>>>> an issue aside from that.
>>>>>>
>>>>>> I also can't see the bug. I fail to see how drm_sched can free a job
>>>>>> that's currently in use in timedout_job(). If that can happen,
>>>>>> Christian, Vitaly, please point us to where and how. Only then can we
>>>>>> decide on how to fix it properly.
>>>>>>
>>>>>
>>>>> Again see above.
>>>>>
>>>>> Matt
>>>>>
>>>>>>
>>>>>> P.
>>>>>>
>>>>>>
>>>
> 

