Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C038FA69E56
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 03:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562010E30D;
	Thu, 20 Mar 2025 02:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V67suw1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB8610E30D;
 Thu, 20 Mar 2025 02:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNKd/2+kpwewTAmKbdOcel2WXzmTkL5Sc8hskrraKwfH4ojPPTlDWcyhfYtgRRyU7Pk8JEXEJSgbORsrD7nHFqR4LfvcR8QHIFvN6Vr7fAyn1QgOrIcFl0DFYOONwz1Jq2NMVOTtAtBETSoW0GK1FafSbFtdb1aTVQHmipam59fVcO9jwpJTFe86T8IzjZTEDeeWT9O+GBy5+Dp9HHUBBdOASKUr15XI2GucQD/xeG1Q/T++pLVSJVQQpTxFPoJojoF93RcwAaiicjV/rfDKJzM0scS5z7lClfa0M6ZxYpzN50kCRLo7JUbj2tIdt+YbZIWSaZ2DP/mSvN4TqBswlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDGqDzh/oYzKMq8gFUTxzxOA35Zrsdmx/gLrLp9wDjM=;
 b=zOMsXl/tT3cOKpM+O8Qa73R/ePCb4+3ZOLRKvC4x9OC7IZCsOcYU92NPKZeM+xz2K+SsFb+uUe0GtcO8PcU8scgUnk8VxcfXZQIAW7DQSIT7y26ux+7VRYSBA/0kSyJYDjIsaQyTFJzigecxyy6jp2fX4HTymkhZ65OnINgdksik4FWYaS4Boob1NHd8t0GTVAeD1l3wlZPwkbqUYCdRPACnFFoXLEXozXH8ksl1pPetDK8rtbAlBUjnx0yCO6S8y/osVNzSGaHOEM8eghrGU7o0to6GKByd1zaAMU3jV2AFJxQg12m4ft7k+GKXKKdp3FuzG2Lzs+6CrUI/ZHc++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDGqDzh/oYzKMq8gFUTxzxOA35Zrsdmx/gLrLp9wDjM=;
 b=V67suw1b50WZGrhS1ORuF/wK1/lqzfc/PEeQNcd0MrbjOx4wWkUT9QVAbG/LfKx3Fd3Xfh1UAikvGKsnpw/js6fimDzB0u1i4saQV9xtT6S0maLwtF0UE/ztW+2zvFnlJD3D238Y5m9wQSZy7ZtaGju50/7fl8tKWNOxCvnFKIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 02:16:20 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8511.026; Thu, 20 Mar 2025
 02:16:20 +0000
Message-ID: <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
Date: Wed, 19 Mar 2025 20:16:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Austin.Zheng@amd.com
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250318111717.2161235-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0403da0f-eb76-4185-6f73-08dd6755346c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V01IbFVjRXgzQzVyaytQeUQrd1lQTWh6b1QzS0dlYlRDeXA5SUNoZnJXQjJH?=
 =?utf-8?B?TWdnUUs3OUJ0bDRPb1pRRDN0RkJEY1Y2SkV0T0JRam9Gc1VNVkowdnd0d0l5?=
 =?utf-8?B?cE5ra0lVTkhIaXd3UDBTNWRwRFhzcnZ2bnkwVjRQMUZOQkRkaU0xYXJ5ZFRW?=
 =?utf-8?B?U3pRNUY1ZGdtc0xNRGM3TjluRTErSWFqQ0E5QXU3WVNERW5WYU9LY2JQMG5L?=
 =?utf-8?B?ODg3Qy94aWZ6THF6M1pod1pSQUh6WER0dmlUcFpKeFMrMkd5VVNFK1dHUzJJ?=
 =?utf-8?B?TXRocDIwREZIVW1INVVnVFJpb1E2a2ZvY2M5elpKMXZjWTBuZUNNeVo4ZmZB?=
 =?utf-8?B?K1NJTnlnK29SN0pRRGtWYUk3UmZnY2VOclhTdzJkTmZBTHdrZ0ZCL1p1ak1G?=
 =?utf-8?B?ZG5uOXNybElZN2pYUFNETFF5TTdwbnprbjZRWmcrdE9GczZMUWl1RUJyYUF5?=
 =?utf-8?B?VHo3SWZNaWg4UWN1cFVnejhNQU53TnQ5ZWEwU1piakZDSnNzbzM3VlUvUTNT?=
 =?utf-8?B?VTBLNzBKQmwwaWNGR0Y4OVpKVkNDZVVLNnNPaWZiVStqald5WGdHY1Z5UXZL?=
 =?utf-8?B?OHpXeU5LNWlNUmJBbWxPbDdFNnQzUFQ2SVpwL3N4NmxoQ0Rmb2NNOFl1eDc5?=
 =?utf-8?B?N2JUa0hEc0pISXlJUnBrVDE2U2NzU0VMajFXc1MrZzZFT2J3a0NLWXJDakpj?=
 =?utf-8?B?dXlWZ1VBUVBMUm1SZU1xS283eTJZb1BIcEZ2RzByb3Z3R2kvT2xOTkFsQlo1?=
 =?utf-8?B?WW16LzZmZ3Qxb2ZZWGRiNWN1b0tQemxyTzRBVEpLWE5TQUJqU1h5Z0cxSWlm?=
 =?utf-8?B?clozTTNVa1c1QWFONTZ2UTdUWWxBY2pGcnVSdUFKOTVPcHExd3IyWmdiZVlW?=
 =?utf-8?B?UC8rektOOSt0YWRGTUNVbExwbXROY29tZ2FOMTBwZE1jN1NTcmd2VU1nZXAv?=
 =?utf-8?B?TVFBM1ZOZVhDSENpdExZRWdrbFFZSTJEQlYrZHJ0U0hnRjNsb01KUFk2U2VO?=
 =?utf-8?B?aFFaaGFwdmh4MkZvZzlFR29lN0FhZnVTODhMeGl6UDJiSFpLT0ZLeERqWS9y?=
 =?utf-8?B?OXdVY3BkV0ZFb0JEWkhYVTVUSzl6TWZTL3ZWVEwrZmxtTUxnZTI3K01rdy90?=
 =?utf-8?B?SzZEdnMxNG1uMCsrN2RBUTNvck1KdFFNQzJ2Wi9rM0J2c3RKb20veXFHV0gw?=
 =?utf-8?B?eEFEY2ZzbkFXbUJYUXBWN2tCUStJcmltcmdhMW1UNFEzbXFjSEY5SGtJWmVJ?=
 =?utf-8?B?SEhwQ09HakV6TFJBK3E2RW9oUVNnajFiY2x5UDh0Y3hYK3RZOTh5ME93ZFA0?=
 =?utf-8?B?ajhUamxaakRjMFdweEhjeWJ6WHVreWRuR2dXd0crSG9MZXN4bjVsdUhUSC8w?=
 =?utf-8?B?NEVCNko1NDQrVFZrNktsZHdKS2M2dzkrQjJTUnFXOTJpQzJJN1FTVE83WEQ0?=
 =?utf-8?B?dVVoSU1Cemt3VlFkRVZDNW1pSDFmQnpNNTRBeGVLSXhIY1hGbXRyampGR0lD?=
 =?utf-8?B?Rjl1K3gyM2lYQklGZlI4ajFrbGgreWU0VEFEM1ZCOHgwd2pyRWh2SVRYUDBJ?=
 =?utf-8?B?RUtaV0I4ZWZxWGVZRDU3QkJ0ZHdiZGRoWlZkSm1MKzBXS2l3MTFUMnhMZms1?=
 =?utf-8?B?RWROM2FyM09nSFgya0xJckxkQVB1OUg1THZMOHdkZkNWZXlycWExVFJyVWxN?=
 =?utf-8?B?enNaU0JrVXdEQWtQU2RJVkl4ek1VL29Wa1VMd2J3RkdzL0JSOXd6QnduY1hP?=
 =?utf-8?B?ekxlN2hmVGxBMU05V0ZpMTExZjBGTmtya3NFcXNZU2hJRXFuaWJqUlJxMlZU?=
 =?utf-8?B?MjdUU1pvbEpYdDYycTVBTkU3c1FDRDQyWW9OU1BmWTU1Vk9yYmkzMWZDREho?=
 =?utf-8?Q?ysaFLPev14bzV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVp1Q2FlazQvMEptWWhrUnpWekUwcm52UGhaU1FoODdaN3AyMGNDU0h4L1pC?=
 =?utf-8?B?ZG5kQSt0ZTRUM1o5VkxzR2NHeUpyU3RCaVRURjYvV2I3ODZzM0tvMHM2WDVi?=
 =?utf-8?B?WlpaUHRGSmxoS1hBRXJhVnhzaExpcC9nbTZ6TjQraCs2dEttL2xHQ0p5aCtX?=
 =?utf-8?B?NWxnVGhZQzBac2JUNitiZ2QvKzNFSFlsU2xQRDBUNHBXbkg3T1gwU3R0Vmpj?=
 =?utf-8?B?Wk5DTlRnZkc0c05XbkxDVGV4cXh6VDE3dDJwTkJHcGVHSVRUaHBxYjdVTnJV?=
 =?utf-8?B?UEdvYytmWjZmYXpjVzdUNHNXb1A5amxZWVZUb3hreElLdUExeDdBREZDd2VY?=
 =?utf-8?B?VkxlanUxMFFzMEo4Rmw4b01FZVIvL3ZORjMxbVdrb3F4YnoxRkhaM0pOTUFn?=
 =?utf-8?B?R05ZRFZKQWFKK3d2akxEMndXQlNXUDQvRU4vV3NoeFRsb2pMREpMSjdEU01X?=
 =?utf-8?B?TU1tZEhMN3FBNEhPQ3FxV2V3bElGZGxsQmd2RzcvUUR6cXM0bVMyVjZIQUZ5?=
 =?utf-8?B?NFQvZHY4VWhZdGZOdmFRamczcm5taURSTXlOSUowUk1NbUJERlFNb1I3WnRx?=
 =?utf-8?B?aVcyMWdrMUxuWjFnVjIwbWEyZ1MzTGNNRHE3WjJ1WFk4QUdCU1VpV2dMR1hY?=
 =?utf-8?B?am0zZ3ZjNzRCNGpERWo5K1pBVTAxUWNoNHQvemtyak1kdFZGMDBLVmxqZTRU?=
 =?utf-8?B?NW5rTFJBYXJXMlpjaHpVcHNUMWNzS3lISzFldjRIbzBMY3oySHpGL2k4VldS?=
 =?utf-8?B?L1o0YnBPcFpwV2ZiU2FqSTVSdE5vVkR4QTJsTzY5bmRGSnNCWGY3aXFMNkZ4?=
 =?utf-8?B?TEdMMElMdVhyaGlGZFdJc25CQTZQOXU3aVM4R3U5bTNVcEUyYnpuU3dzd2Vy?=
 =?utf-8?B?b2xOVkhPdnNGQ1dOa0ErYk9RRWlHcjBxMWJNMWJpcWZHUlVubG5sMnQ1RmRk?=
 =?utf-8?B?cEJHWjYxK2Z1Vm45SXlKRlVqQ1VSclk2aUpGcnE1aERFbWxNYlYrZEpBTWo5?=
 =?utf-8?B?a3JRdE1aNURpUHNlcUhjYlh4ZlhNTEFQWkh0eEdTQUI4dERleWNEZ1UvNjEz?=
 =?utf-8?B?dlozazRyVXh2WW5xSGJjVDVCdU1nS3BBekIxREtxUUxrNllaZUVwNGNJempO?=
 =?utf-8?B?SFc1eURHVXJaQitCMmZaellHQXR4WTFvNkFzbUtxQ0szUEN3bjA5TmpoWkxp?=
 =?utf-8?B?OHZDZkowMkdLR0VRQ0RYQXhPNE11YTBlVDdiM2luc0IwMFdIVHdrOXE4Qzls?=
 =?utf-8?B?alFidzdLaFVOYXRXRDNZNCtqRXhmRi9zdlVzZ3BVQjRvZkRQWVpVam4wb1Z1?=
 =?utf-8?B?blY2VWNvUFo1RFhxL0UxV0xVanZwdjJ5dHdvZUtuMkFqVTFTMWhXRGEzTUwr?=
 =?utf-8?B?OFpNN0JzNDBCWmsvNzRmQXZWZjQ1b2NtTlZGRlNOQlNmRnJHaVZUZklCaC9j?=
 =?utf-8?B?SkVBWEg2QjhvUm5TOXl3ZTJ2WE5OSVJmUlRsWUh5NWZ4MEVzUTdseng2Q29h?=
 =?utf-8?B?KytWbWVueWY3TDVYMnZYNzR0RUNaa0JyYmhLZjBKc0J0VEpucThGU05NQW1R?=
 =?utf-8?B?SXdRYytjYk9zL0NlUmVJTmRIcktkaDVTYUdBVks2cTJ2Syt1TE1KY2I2amJU?=
 =?utf-8?B?WHNwWjRoMmdWWk9zWWluMVBERUwvc3R5d05INGFmL2FZZk5hSHQxQi9uaEpV?=
 =?utf-8?B?QTk2TGFJODNzd1JmWXY2T0wvUkFwMTU3bUVuNDVKaytYNG4veHhjaGpRUUtU?=
 =?utf-8?B?VUUwdlNqYnY3WHMyOFpOeGZVT0JaczhUMTFCRWIxRUFWL2d0QnlDM0RJc3oy?=
 =?utf-8?B?OEpucjdPMlFwWGYwU25VMHQydEwwWjc3OURTd20ybWFCSzZYVlE4S1hHdDhG?=
 =?utf-8?B?OGoxYVZCVGxIWCtSQXdUTHhKNC9XN1Yyc2pHSGUwcWo2MW8yRjBCaUNMU1NB?=
 =?utf-8?B?QzYzdHFCdDVOYkcwdnNMUkEwKzBKTmtlYTk2dllNQWp0TGVSU3ZRcWFMYnJm?=
 =?utf-8?B?SWsvY01wRUJQOFVtV2VlNG1SYmYvT3FpV3B0bHlnOEczNGdWcUFsMk5HYVdh?=
 =?utf-8?B?QkEyUEtGVDJ1Q0RFdU5raVZ1aVpMSDJQRStXWmZscVgvTTY2QnNvV2dVMTU1?=
 =?utf-8?Q?e1ujm0GC3OK7nIW0tFcrESJJt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0403da0f-eb76-4185-6f73-08dd6755346c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 02:16:20.7554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4csnvYk6yySNwXciqNRVWzEMIlur26lLNEIqxngeQDnJG0hdDgmwF5cH4oxcngI+M5X+RzaZ19dBpRh6JZHAJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565
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



On 3/18/25 05:17, Huacai Chen wrote:
> Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
> start") removes the FP context protection of dml2_create(), and it said
> "All the DC_FP_START/END should be used before call anything from DML2".
> 
> However, dml2_create()/dml2_copy()/dml2_create_copy() are not protected
> from their callers, causing such errors:
> 
>   do_fpu invoked from kernel context![#1]:
>   CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #1
>   Workqueue: events work_for_cpu_fn
>   pc ffff80000319de80 ra ffff80000319de5c tp 900000010575c000 sp 900000010575f840
>   a0 0000000000000000 a1 900000012f210130 a2 900000012f000000 a3 ffff80000357e268
>   a4 ffff80000357e260 a5 900000012ea52cf0 a6 0000000400000004 a7 0000012c00001388
>   t0 00001900000015e0 t1 ffff80000379d000 t2 0000000010624dd3 t3 0000006400000014
>   t4 00000000000003e8 t5 0000005000000018 t6 0000000000000020 t7 0000000f00000064
>   t8 000000000000002f u0 5f5e9200f8901912 s9 900000012d380010 s0 900000012ea51fd8
>   s1 900000012f000000 s2 9000000109296000 s3 0000000000000001 s4 0000000000001fd8
>   s5 0000000000000001 s6 ffff800003415000 s7 900000012d390000 s8 ffff800003211f80
>      ra: ffff80000319de5c dml21_apply_soc_bb_overrides+0x3c/0x960 [amdgpu]
>     ERA: ffff80000319de80 dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
>    CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>    PRMD: 00000004 (PPLV0 +PIE -PWE)
>    EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>    ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>   ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
>    PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
>   Process kworker/0:5 (pid: 239, threadinfo=00000000927eadc6, task=000000008fd31682)
>   Stack : 00040dc000003164 0000000000000001 900000012f210130 900000012eabeeb8
>           900000012f000000 ffff80000319fe48 900000012f210000 900000012f210130
>           900000012f000000 900000012eabeeb8 0000000000000001 ffff8000031a0064
>           900000010575f9f0 900000012f210130 900000012eac0000 900000012ea80000
>           900000012f000000 ffff8000031cefc4 900000010575f9f0 ffff8000035859c0
>           ffff800003414000 900000010575fa78 900000012f000000 ffff8000031b4c50
>           0000000000000000 9000000101c9d700 9000000109c40000 5f5e9200f8901912
>           900000012d3c4bd0 900000012d3c5000 ffff8000034aed18 900000012d380010
>           900000012d3c4bd0 ffff800003414000 900000012d380000 ffff800002ea49dc
>           0000000000000001 900000012d3c6000 00000000ffffe423 0000000000010000
>           ...
>   Call Trace:
>   [<ffff80000319de80>] dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
>   [<ffff80000319fe44>] dml21_init+0xa4/0x280 [amdgpu]
>   [<ffff8000031a0060>] dml21_create+0x40/0x80 [amdgpu]
>   [<ffff8000031cefc0>] dc_state_create+0x100/0x160 [amdgpu]
>   [<ffff8000031b4c4c>] dc_create+0x44c/0x640 [amdgpu]
>   [<ffff800002ea49d8>] amdgpu_dm_init+0x3f8/0x2060 [amdgpu]
>   [<ffff800002ea6658>] dm_hw_init+0x18/0x60 [amdgpu]
>   [<ffff800002b16738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
>   [<ffff800002b18e80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
>   [<ffff800002b0c8f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
>   [<900000000448eae4>] local_pci_probe+0x44/0xc0
>   [<9000000003b02b18>] work_for_cpu_fn+0x18/0x40
>   [<9000000003b05da0>] process_one_work+0x160/0x300
>   [<9000000003b06718>] worker_thread+0x318/0x440
>   [<9000000003b11b8c>] kthread+0x12c/0x220
>   [<9000000003ac1484>] ret_from_kernel_thread+0x8/0xa4
> 
> So protect dml2_create()/dml2_copy()/dml2_create_copy() with DC_FP_START
> and DC_FP_END.

Hi Huacai,

Can you try to put DC_FP_START DC_FP_END in the 
dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate() instead? 
The code will be cleaner and less error-prone to future changes.

Thanks.


> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_state.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> index 1b2cce127981..6e2cac08002d 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
> @@ -210,17 +210,23 @@ struct dc_state *dc_state_create(struct dc *dc, struct dc_state_create_params *p
>   
>   #ifdef CONFIG_DRM_AMD_DC_FP
>   	if (dc->debug.using_dml2) {
> +		DC_FP_START();
> +
>   		dml2_opt->use_clock_dc_limits = false;
>   		if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) {
> +			DC_FP_END();
>   			dc_state_release(state);
>   			return NULL;
>   		}
>   
>   		dml2_opt->use_clock_dc_limits = true;
>   		if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_power_source)) {
> +			DC_FP_END();
>   			dc_state_release(state);
>   			return NULL;
>   		}
> +
> +		DC_FP_END();
>   	}
>   #endif
>   
> @@ -240,6 +246,8 @@ void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
>   	dc_state_copy_internal(dst_state, src_state);
>   
>   #ifdef CONFIG_DRM_AMD_DC_FP
> +	DC_FP_START();
> +
>   	dst_state->bw_ctx.dml2 = dst_dml2;
>   	if (src_state->bw_ctx.dml2)
>   		dml2_copy(dst_state->bw_ctx.dml2, src_state->bw_ctx.dml2);
> @@ -247,6 +255,8 @@ void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
>   	dst_state->bw_ctx.dml2_dc_power_source = dst_dml2_dc_power_source;
>   	if (src_state->bw_ctx.dml2_dc_power_source)
>   		dml2_copy(dst_state->bw_ctx.dml2_dc_power_source, src_state->bw_ctx.dml2_dc_power_source);
> +
> +	DC_FP_END();
>   #endif
>   
>   	/* context refcount should not be overridden */
> @@ -268,17 +278,23 @@ struct dc_state *dc_state_create_copy(struct dc_state *src_state)
>   	new_state->bw_ctx.dml2 = NULL;
>   	new_state->bw_ctx.dml2_dc_power_source = NULL;
>   
> +	DC_FP_START();
> +
>   	if (src_state->bw_ctx.dml2 &&
>   			!dml2_create_copy(&new_state->bw_ctx.dml2, src_state->bw_ctx.dml2)) {
> +		DC_FP_END();
>   		dc_state_release(new_state);
>   		return NULL;
>   	}
>   
>   	if (src_state->bw_ctx.dml2_dc_power_source &&
>   			!dml2_create_copy(&new_state->bw_ctx.dml2_dc_power_source, src_state->bw_ctx.dml2_dc_power_source)) {
> +		DC_FP_END();
>   		dc_state_release(new_state);
>   		return NULL;
>   	}
> +
> +	DC_FP_END();
>   #endif
>   
>   	kref_init(&new_state->refcount);

