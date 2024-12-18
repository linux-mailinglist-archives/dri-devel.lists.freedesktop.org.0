Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3C9F5FD2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9571C10E0DC;
	Wed, 18 Dec 2024 08:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jatroekb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E8D10E009;
 Wed, 18 Dec 2024 08:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCAb+zgI+iZ7LA5LqsMe0t2QitPlxS+hanCz6exQZ4vCA/D4XLz7I/NG+iwzES0/3hvrddfPyOQ1ub0glH5O43FzrhLRKadqRBfNimex2Efrp2ApJkr7bD/kxmNFF8kvQvnYckhlZvODJnuy1+LhPOqgEbl+jO3EhpeFCZJVTptIZCt4aMe7XsgG5/6FIM1KwQbUO8ySSzlZwmdR2HYu6X/pLdv/FljK/yBF8uPKaLlWEZnKglHRNpz7kgIEDEOb8Xc7YIz4H6ja4XsthL6cpAy2sdG6g1mSsr7ay7ig6yGrGGHKq6fPC7R7BcIHHk+mudS0GsQAkhtE25q5/Lu6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zRMlGhHpxYdlv3IHShLwqL9CkriPBnBm3ZNyfHKmLw=;
 b=YvjGm0bF4LToCxZWkrlyjqNUGQWIPxBT+v5Cn5Y0264eJsPr1LUnEA6xSIKLAfaX/f5VcovlTZmheGfuGx4SiJa1+IKQQY6ODHm2dJBsAu80oWwmwvgpaoxaFJupScowCQBnkvzk4iIiwIQpSurXajyo73czKOoPEsI7+EXPM/8e1XA6Tnh+O6s6gbTBmhu0HDgvlQsMxRXJhJMntGSnl8bNzO3l2HpGNM1/VM6+uguLPdgpydEKkpYTBSlF9ibhmefoadtRWUiEGLRua7bO3mTX/Lr/aeRkh2/tLwLJHP0d1XzdXcdZgYB+sh6M2o4Fi6wFL4rkt01jvn+xrTtGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zRMlGhHpxYdlv3IHShLwqL9CkriPBnBm3ZNyfHKmLw=;
 b=jatroekba+0LDKZjo5ZqdGgFpQ6F2XA6xsH/12jcmSyw2RrkdheKHYcLKmPeEh5JzvK2BjGS7yT9Yvs/xWlX20OZBry+brSP0z+QXdLWIWWv+rjPoKblrbGiKAjh3U3nAQjWHdrQ2hD/Dp/MkoH4FbgbWATp3KL5Lry97/2NOoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 08:03:52 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%7]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 08:03:52 +0000
Message-ID: <2a061534-7780-40a7-b058-98d1fc16915b@amd.com>
Date: Wed, 18 Dec 2024 13:33:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/admgpu: replace kmalloc() and memcpy() with
 kmemdup()
To: Mirsad Todorovac <mtodorovac69@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Zhigang Luo <Zhigang.Luo@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Vignesh Chander <Vignesh.Chander@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20241217225811.2437150-2-mtodorovac69@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PEPF000001A9.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::f) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 291458ca-aca4-490b-6ee6-08dd1f3a82b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWMxaGw5MHhLNm95WGpuK2hoUXRCVndvVGw0cDByK3lWS0RVczFLNDJSOUdS?=
 =?utf-8?B?RllvWmNnaWJOd0lTbTZlZ3ZLbW55M2dwaXZ6VFR0a1lhZlQyMmZsRUx1bW0w?=
 =?utf-8?B?Yjh2M0hZWWtHN1JFQUdiTUM3aG5oWjNSZjRhQWRhSHNjZitpS2t6QTd6ZnYr?=
 =?utf-8?B?WWFsUlpuUW9OQ2lZbVR5MTcvM0pMb3U2OXRVU0RZQi8vSENITWFkaEVrblRM?=
 =?utf-8?B?TnJ1SXJBWWExazVHK0lWRUFWVzhtK28vbWpQM1luUi8rejdrdklUN2I5TTNl?=
 =?utf-8?B?L0dYRjUyb3Y3cGFiU2J2Z010Zy9LTG5YZlB4bUhPY2hHTWVvVnJGQzI0SUpv?=
 =?utf-8?B?QlZpbjJUS0YvTUlrc0hNRkRSNnFvbzlZWllGZ0tuU2w1VUJ0em4wVW8weTZT?=
 =?utf-8?B?d0tjS2MzTTZFZTM2UjBsbzY3czAxSmxDN1M4R2ZkVHhuaXNMdUNkcjdjaTUr?=
 =?utf-8?B?MTRNRnpHL2hJbURYZWFUWVhRc003bDUxS3ZGUnBGb3JvQTV4SVpWZ2xXbk9U?=
 =?utf-8?B?RHRQbGl3R3h6WlFRN1Q4R09GeVladEVSNHFkMEh4bkxUaG1QWlBJYlErS3RX?=
 =?utf-8?B?QUlJY3FqUld4dVN6Q3pHd1pKOHIyNUw5UFNzSDZoRWFHaTJMQlpYMHJDWWlK?=
 =?utf-8?B?N0pKakV5bDlHWWZHWWZUMStzU0FCS1h0Qlg5NkQ4cm1jOFdwMFhFTkRKSmdX?=
 =?utf-8?B?ekVTWFlEOUhPNUlVSnNHMzZyeVdWMW0yYUZzMEgzYjM1aTl1dUdvTFV3blU1?=
 =?utf-8?B?SzdScG9nRHBYZllJTy9RWlVKMTNwdGFGZEVhb2t3UHlkbGc1Sk0yOWFBWXNB?=
 =?utf-8?B?NDRPTmZ6ZUJNVGJKcThkbXQ3LzNBVWhSUTR6OW04MlRzR281SXR1V2JvZm1t?=
 =?utf-8?B?cHVJUitEeFpaOU9YWDRKUjVGbjNCNjZJbmNxeS9vcDdNOElyQmJYRHkvOW4y?=
 =?utf-8?B?ZU5EaUhOUjhGaE9seHJrL25Gcm1ORnVvY3R4alRIcVpvNldTZVZub1AyWGMy?=
 =?utf-8?B?aFY4NDVrMmEzU3BpT21JcGFRc1RiQXo5T2RNU0M3UTRncThkMlFuREdKL3c5?=
 =?utf-8?B?d1pKRzY2QnluMUtPRjFDZ2xFUjJSU1ZMNzBQSTB5ZDBrQ0I3bnZESURYTEFQ?=
 =?utf-8?B?SmhjTkdQSEpZdHBvbituRDJkbGNhYUVjeGVkb2c0MGU5L3FwaG9NdVBjWmlI?=
 =?utf-8?B?TU5BNml1QktTQ3FxOTEvR29zWEdTOFczeCtSMG9uKzBpV3VadnJweERwbFJI?=
 =?utf-8?B?WjlRQk9DR0FNQ3dHVTVmVGVWWExkTEVvd2pMYW95WkpjWFlDQzZ5Y3htbEtJ?=
 =?utf-8?B?dWNIOC9pemJsM3F5aTA0cTMzcCtuOGNibkpmSlRUcFFEUUV4Z2djaHZGbDhQ?=
 =?utf-8?B?SDgrZ2NuSG00RWtUcWcwdnNDMlhvRHkxakJiNElkTDVHbUVZcGRVTis4OHRy?=
 =?utf-8?B?a3AxS0hXTk9RV29YZEYwR2ZDdERXWHI3WlNCeFhNMFQ0ZktocmQrSkxsZEVy?=
 =?utf-8?B?Q3RWbHJIU1RuM0VhRitHN0JxNDJ1OU5BL3BKMXd5ODk3ei9XdG5DYjFJS3Er?=
 =?utf-8?B?V3hqRHg1dkFSbFR1MFUzSkoySkxCYUFzV2NuQi9abHFoK0F5YXdIUXAyRUxu?=
 =?utf-8?B?RS9SUVBWWXFLWjFBT1JBVVJXMEIrSEZQZytuTHNsQ2lvSG1YeVJ2TnRwSC8y?=
 =?utf-8?B?eTQ1NWQydlpYU3JYblFGQVM5R2tpazA2c0RXaVNZNUJIb0Y0MXViN00zQlFy?=
 =?utf-8?B?TGtLZlJLbXZyYS9FZ2YvQVRiRUd5ZTVobm95VXBwdldwa011Y0dDV1ZWa1ho?=
 =?utf-8?B?Y2pOd1Z1Z3JIci9uMzJ5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BMczF3ZSs2L3FyZTgvWHlkYS82cGk2T2NQeVQ3QTk3WVBTdjc5L0JjZnFN?=
 =?utf-8?B?NnJkcWs5QVNzUE4zNHpnYVJIRTE0TzRoa2ozeldOcnRka3AwUGdET25TN0JN?=
 =?utf-8?B?Y0Z0UnpzcnRaYldGL1c5dkg4U1BqSEIvRmRMb0wrb3ZqNTAxVU5PVWk1THVp?=
 =?utf-8?B?MlFFU0V6bjVnNE1YVm8xUk5HM2VPL0lpVWdPQnB4TVJhdGZnbjM1aEYxb2NH?=
 =?utf-8?B?WDYrdlZGYVJmT2c3L1oyMHQ2STkwOFRDaG9CWHdoRGJhVXF3OStNWWlCSVhH?=
 =?utf-8?B?Y0hBZXZPYW1NRWlRRUpsWFlPODh2NTRoSmhmRmNCR0dTQ0Z6Tit5elBvVXpS?=
 =?utf-8?B?S0ZrbkhwSTFXRFlPNlhlQW1ORmQrVERtR0Z4eUtLTVUwSjZXODQ3eU44elNS?=
 =?utf-8?B?dXFUV2VPV2RadCtQdWw2L21ac0ZvY3FIdFZUZ29TeWtaRTUyWkd3N1VET2tq?=
 =?utf-8?B?bTNMN2RsNHlxVVY0OGMreWlmdXZMQ0Q4M0R3R3dSMXUvYUM1ZUJKcXlkN2Nl?=
 =?utf-8?B?ZUdVTFNIQ0JUbnRCcVFWMFdmcnVROVI1OGZDQTdqd1BQRWh3cklXdzZXYWRh?=
 =?utf-8?B?NUJ3cytyMzdLZDRSOFNwOWZTY3kwNExvVEc3d3FVK1ppaU5YV0gwQk1uQ2FF?=
 =?utf-8?B?RXJnVUwvcXBTczUxcXFRdStyNHFyd09lN2VPdStjclVWd3lseTFGLzZTMzli?=
 =?utf-8?B?UE5yK3lVQkVOc0hzVEZFaldEbk1PSVFqMTZleFV0TllBeEt4QzZQMlhhVjQ1?=
 =?utf-8?B?ZGNxTEJMS3UyQndRUlZ6NXdrekhxS1MrdlQrV1A3OFJZcmlwKzZtclNOakZ2?=
 =?utf-8?B?Nlh6Z0F6M1BUTGFFcUhxeDA0YkZnRHlTZjZBeWFTQjhOeU5zZ3diR1JXdldv?=
 =?utf-8?B?UjdldUJqNW1sT0k5MmJqa0p2amVlVVVOQXRPNmhGU3FLaXQ2a2JHd2pNdmV6?=
 =?utf-8?B?WFNyR2d5U1lkeTVvdHZRSHhOZjRMdDg1aUwzV3orTlRTNjdXdVJBS2t0WE5z?=
 =?utf-8?B?bnc5TlhIYWJUa2g2RDVGeXNWWGZHMzVGdTVBZ2dMQzRHVTdQWmNPdjdsdGp2?=
 =?utf-8?B?dkFrZ2lEb1IzaXZONDZ6a1FCczdER3pnY2N5ZFpoeG5BQ2dFS1plSmh5YmhJ?=
 =?utf-8?B?Sk1yR1lwWGlnZ1B3cUxEc0h4OEUyZ3RKV2VhOGVSWmdFYmIzcThXalladmsy?=
 =?utf-8?B?OW9VeXlnVElmVC9uOGFwTFRBRXR6SjJRS2ZtdFdwckF1TndlUytPcHlROWx0?=
 =?utf-8?B?Q2lQdVIveHE0enJPUVgxK1puV0JtbWFmVVZrbHoxUWxLM256ZHR5cytBUjBG?=
 =?utf-8?B?Yk1yMGJHdkpld2ZyRzU3UkJSZ2pJaVZ5TURrQWxCOWhublNHc3NycWZTRjRp?=
 =?utf-8?B?Tjc0dWgvZ3dvVSsvNXJVZWtnZlJCQ3pibnZxemJGcGtLSVNWSWIwSzRmYmhM?=
 =?utf-8?B?Z1NQaXdvS0xFbCtPSERzSWZxTS9zbndyOUpKVVRNYkthbjcvUmFKNzdKV01w?=
 =?utf-8?B?YklVVU1rdmthbjhyMG04Z04zektBK3p6N3hndFJ6VDJaUkkvcEN2ZkdONXZT?=
 =?utf-8?B?MHVMOGphUDBrak0xaDBucHpGR0VmRnV0OXRzMEV1MG44NCtjelRpazR3UmQw?=
 =?utf-8?B?OXhTYzVPNThLbmdjTzRPbGlPbk54UjJ1QjdiS0hJajhPNHdnczJCL1BWcGJH?=
 =?utf-8?B?cUFGNjhhV1dvcnQyaU9GZUxubzF4aGlwVVRqMko5UXE0VzJiZml1WXp2bnRX?=
 =?utf-8?B?dStlTmFFL25UcDlNYmRDRDRPTmhZcURodzZGbTY5YTlZdjdJSklGUHI3YjB1?=
 =?utf-8?B?YzlJSGh1S1NkNkJ5RkdOeHFqYVVYWjdpaklZZjVvV3VVRGpDNFhRRjJCamtj?=
 =?utf-8?B?bStwcWVGc0Y0eGp5T3FiUnNrZmJaT0JoYU96YWNyUHNka3kveUVhRExIRWVo?=
 =?utf-8?B?ZnhSb3ZsQzNhU2lWREh3bFlZTjJ3WkJJOUpDMGVDaWxuK2JhT0R0WTF3QXFN?=
 =?utf-8?B?VnVReHdyZG85OWtINGM5Qm4yd0dOdnpRRCtrYWU2bkxLVy9RR1AvaWpnQTU4?=
 =?utf-8?B?VjczWmJYS1ZrZTE5TXRGdVl0cER5TzRYS3kwWmNNM2RkcjJMaEZWTXRZNldK?=
 =?utf-8?Q?zTlRmWFzax7frkvZxmUjTR/m/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291458ca-aca4-490b-6ee6-08dd1f3a82b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 08:03:52.2363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y2z1P1GnbP7im9HM4p60XPbpr5Tz1WiyLXojeG754ywxTrf6hshqgTwlpcZe4bU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
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



On 12/18/2024 4:28 AM, Mirsad Todorovac wrote:
> The static analyser tool gave the following advice:
> 
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1266:7-14: WARNING opportunity for kmemdup
> 
>  → 1266         tmp = kmalloc(used_size, GFP_KERNEL);
>    1267         if (!tmp)
>    1268                 return -ENOMEM;
>    1269
>  → 1270         memcpy(tmp, &host_telemetry->body.error_count, used_size);
> 
> Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
> Original code works without fault, so this is not a bug fix but proposed improvement.
> 
> Link: https://lwn.net/Articles/198928/
> Fixes: 84a2947ecc85c ("drm/amdgpu: Implement virt req_ras_err_count")
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Zhigang Luo <Zhigang.Luo@amd.com>
> Cc: Victor Skvortsov <victor.skvortsov@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Yunxiang Li <Yunxiang.Li@amd.com>
> Cc: Jack Xiao <Jack.Xiao@amd.com>
> Cc: Vignesh Chander <Vignesh.Chander@amd.com>
> Cc: Danijel Slivka <danijel.slivka@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
>  v1:
> 	initial version.
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index c704e9803e11..0af469ec6fcc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -1263,12 +1263,10 @@ static int amdgpu_virt_cache_host_error_counts(struct amdgpu_device *adev,
>  	if (used_size > (AMD_SRIOV_RAS_TELEMETRY_SIZE_KB << 10))
>  		return 0;
>  
> -	tmp = kmalloc(used_size, GFP_KERNEL);
> +	tmp = kmemdup(&host_telemetry->body.error_count, used_size, GFP_KERNEL);
>  	if (!tmp)
>  		return -ENOMEM;
>  
> -	memcpy(tmp, &host_telemetry->body.error_count, used_size);
> -
>  	if (checksum != amd_sriov_msg_checksum(tmp, used_size, 0, 0))
>  		goto out;
>  

