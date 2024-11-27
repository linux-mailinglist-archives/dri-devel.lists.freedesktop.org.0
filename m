Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682F9DA726
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 12:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF4010EAAA;
	Wed, 27 Nov 2024 11:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yEVb5TNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1D10E255;
 Wed, 27 Nov 2024 11:51:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGPKEd/a4DjevUfM+E69p4s59KuavoAg86eGKrImE7P98YZ/nnoQDUw/mSsf0NPvLXs0sm10jt60CZ7nNlWsvcBj8lAjq/41K6iPuGwGlqPW1eYFHFr53OzxgtgDUUn8G2rqAbor5HEcyB0TezW7+CZ80/IqrkVC7pcP80vo0vjmx1V4JtVVvXJAtd5BV2mTUncs8ugWtx+BxPN0SSgWkJkU1HogCisGHEA1QK95U0v7FUFakb2Fbsth1W9MAa/2u08ZmVTAKL7v0AAO3RqjZqImAvLWoA/FxGiznm58QB/3T9dYh8mCw4mzwD83QzkDbOnslqxbW+x7AIhX76MQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDBsgBCGRyXkOtuzTGe0uAqzPzGkec6z9VM/Cld+69k=;
 b=yOTu14/1LwM8BQHEkfogA/PVK4cV4C0jYHuFsmDyBUhkvL8YBYpjKjT6CaoOOahhS/G1me+W+jzyUwDD5q4JP4tqxKWk1bzFHmFUPcajmVV62N2YzIKX2qCjKfbZA3UpeGlUMjAHHUfFpiIdWdgnkInYnGdpgi2byRTu/MSUwM3MMxKAJ7fCuDUctDMpCH6Xad+lX+jm7Q4v7tHtP7EQpmMepLcCI7AuOSqCtSrIWRrUd/55CVZBY3hC0i6LGsTt5NQP+RAGnxW9wgdc23d7AUvxzKvqy/wai/jIB8v6q/ocpIMA2ZttWuo1cPTWS2UIF7keJeMrC72chUXKBEikCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDBsgBCGRyXkOtuzTGe0uAqzPzGkec6z9VM/Cld+69k=;
 b=yEVb5TNvHoP88wTJRThnJxEDTJqz44z35jJlvZv9MjsLmLB97FFc2uuEF2hGmlmQLZ1EfR90S+dwtE0s7Whp/FLcg6Em/IAPSq/v1cc33beah3J+LP6qgxfjU+N8Yg4C0JAJk4dZYRczDb+MkJ75Etn0vAjcTBIocQ5UT5bjPPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6170.namprd12.prod.outlook.com (2603:10b6:a03:45b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 11:51:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 11:51:24 +0000
Message-ID: <8266003e-eb98-44cb-a326-1e4f688eeb4c@amd.com>
Date: Wed, 27 Nov 2024 12:51:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] amdgpu fix for gfx1103 queue evict/restore crash
To: Mika Laitio <lamikr@gmail.com>, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, sunil.khatri@amd.com,
 lijo.lazar@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241127114638.11216-1-lamikr@gmail.com>
 <20241127114638.11216-2-lamikr@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241127114638.11216-2-lamikr@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f9dc07-252f-4ae1-e84e-08dd0ed9d190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0tIQnFuNDVXWnNwZUFlQVNBVG5nWEd0am5VWmlrbDlCSTQ1dTVTQWNEMFFF?=
 =?utf-8?B?bnB6RlNIL2J1dXgyRkVNM3QvZFpaZDcvTlFhMERqL2lKL2FVSVNEQTdsYXBR?=
 =?utf-8?B?TFZIdCsrc0h1WFVpUjdocXJDdnEyeWFPL2pEdDRJUll4RksySTRTbDZCT211?=
 =?utf-8?B?RnZqVWpWVVl0MDBnaVFvS3VMdVFpdzM4SWJWSFFueSs1cXlkbExlQUhXdUln?=
 =?utf-8?B?MXpsMmRmVHJDQjZhd056ejdoSk1aUm4yYlRKRGpYb0FBMWx6blZyTEl4dlBh?=
 =?utf-8?B?Y0RMcmJJSVh2cVA3YlRLY1NzcjlmQjgrVjZlZ1Z6YkU2dlRWRVF6WUZyK1o4?=
 =?utf-8?B?OE5zS3NNT1Z5NnpvbnJRVFYza0s0d1gzMVB4Zm5DbnZPaHArbjZwdnVsSlBM?=
 =?utf-8?B?YUdhVy8wL0QxRXNHM2pKaWVZeWRnNzIwUVBlVXVXNk93TS9mVUYzMWdBRGp4?=
 =?utf-8?B?dnZsVTg1K0k3OXpoTGZDOUdROTFmMzVzTnU1NHhrcXA2QVNwbFlXSmVucnJT?=
 =?utf-8?B?eEZYcUwzVDYrV3lRNDBLdE5sbVZFTExDSU53b0RwcXlZNUIxQXpqb3ZYWFpP?=
 =?utf-8?B?YjZtOVkrTTNEYjJtaWlTUUFtQ0JpZFNmditNYlBNT1ZkTEJIMzJ4SlNxR29j?=
 =?utf-8?B?Uk81Zk5HaWpQaVBjOE9GbUhpTGtCWUNpSVlNQ3R0am9oV0hVdUZVMUR6cFo5?=
 =?utf-8?B?anIzNkUxODVlbENiM1NLR29nK3oySFJQamlieWpuTTVlbXUwU211eGs2RjdF?=
 =?utf-8?B?T0pud3BhTHpHcGNFWXZTZnh6MnYyaGJ6SWU5TGFjaWVUZUphMk02QjBoMVZn?=
 =?utf-8?B?TkFVM1VNTnZHYVpGbGl6S3JqYlFsNnF2WEpDQW9CdWNpUGFEcFFWVDZwNGs4?=
 =?utf-8?B?QjIxaXovNVZhTzcyMDBPYXc2cDQydW5VU2hPMWVMOWRJaFVTbWcwS1NvcXhu?=
 =?utf-8?B?eU1ia3Bpa1NGYjBiYllXY3o0cUFaRkdmTVJTRk9yaUR5QU9LeEswUlpTcmdo?=
 =?utf-8?B?MWE5ZnAxQit4aFRBOGNob3pEZXJlZUxuKytaSndXSlE3UHd5Y1FhYlBBZTNS?=
 =?utf-8?B?eXIreWphTE44b01VRmcwa0t0STZVSDZwZnJjV1VqTE83S0VOdVpRVlZEMHVk?=
 =?utf-8?B?KzRuUmhQdS9GZjFiSnk0cUppYzlCMEZFMXF5QkdEeUk1Ry9jMHVMZ3ZqSmpI?=
 =?utf-8?B?WUhBT1l0eW5CbEdaZzAzRWhVdnhvc05pM2RTOVplcDRGTERNaGdHbjZ5d2ZL?=
 =?utf-8?B?S3czK216ZzRBUkhJLzdmdnI0NW9qSHZWc1BRTVprdEZ5ekJWREswU2NLcUdK?=
 =?utf-8?B?MHFYR2UrTXZuNnNKSGQ4VDg1UjA2YkVvd214K1VlZUx1anhsUFpUQk95Q1M4?=
 =?utf-8?B?eU9rdXNJOU8wWCtZU0dEVWxjbHNCQXptdEcwaEZJTUJkSnhtanFsZjBBQ2RU?=
 =?utf-8?B?ZG5mTUhacnRuU0FmK3ZrUVk5YmtZZkRoRFRmSTY2ZWJVUzBnUmNlSURTRTl2?=
 =?utf-8?B?R1htUVVHSkEwbEc3bDhZZU9td0xTSnhQR0gzWCtBenU0elpHakxtRndlKzYx?=
 =?utf-8?B?MGNPRC8zT0ZFNVhEenlaQXZ4ZkxZVWFIR3Era0tyMG9vTTRxTWxUbTRLbElq?=
 =?utf-8?B?Z1laaUM3YStZdHhzdXdOUGJxNGhFWW90V1RBRkRmOFFmclRHU0pLSXcxT2Zt?=
 =?utf-8?B?MVAvaEdCT09tZGgvUjluRFpoN0o0RVdHeGpVK014MWRUUCtjTmw0OFBGMXo0?=
 =?utf-8?B?c3ZITytaUVJRQVUwYkc3YXVLMnE2SkRXLzJsdjh4QS90dmdId1VYcmI0enc3?=
 =?utf-8?B?amdTMFBVOTJiNDI4YTR1akZScVNkYUdoWHYvaERJQUt5blhORGUzUFRpTWVy?=
 =?utf-8?B?MTM2M21TMWhUd1NGRGRpVk9Nb1RGem43OVhlU0VMazIzcVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekQvRVhpYzNicnlvNXBVVzQ4dVl5RHA1YzJsTFplTkhEeDZqUzhoU1dLSy9K?=
 =?utf-8?B?VGlZYnNUakd3blhwanlzK0hxRkdYN2FYcjhaTnVZYjgrTjRhbkptWDhEWGFM?=
 =?utf-8?B?WlhDSWM3WW8zQlhkNjRBTlFuTHpNSGNOK0N3RThPd0RxcmRRWWticEYzTmh1?=
 =?utf-8?B?RTVUMnJWN0w2MnZzTWFCaUgwL2pqelp4ZjFNZjhicTNLNHZwYVhVdnVRdVFW?=
 =?utf-8?B?YXpQZTg4NG92MitEOHhja1I3alBnR1NVVzNodGQrYjM0VUdGQ1dCQ2pDR0c2?=
 =?utf-8?B?cm5rUGRIek1aVzFzUW9OZm0zWThxMERhYUNYQUVnNUdNKzVsTkRDOTI3S0ZI?=
 =?utf-8?B?Sk8rRHJ4cDJLM1F0cW8yT1E2M2w5ZklibVRoZktSclZoT1pEdWtwRVhRUVc2?=
 =?utf-8?B?Qi83aUtXN1VGcWJVR1dDNGNtRTVmak5CeEVab1VTLzZvdk9VNjY2Y2prbWhl?=
 =?utf-8?B?TW5VWFc0Uk51TmVIc3pKSFlhZ3NhdDZ4UnN4UDFSZUs2UmprZXl1eDJZWnZ4?=
 =?utf-8?B?STZGOEIrZWJjUDVnWG52enAyUy9ESlc3NHpzSWkwSWM5SUpxSTdGMHhkeHNs?=
 =?utf-8?B?aHBLQUNYTXNHNkkzL2djSE5KeEgxeDFEbzdNVnNEUFZnU2laRVI5aHRpcnM4?=
 =?utf-8?B?NjFoU0pXV2NmUi90TDdIVk1QMEZPeG1uMlZlUlY2MnZYdmlKYVdOZEFzSlhN?=
 =?utf-8?B?cUJ5ZkNtWWtKbWQ0U2x2WjBySmxOSzRWOWNocHhvOERIK1ZXZTg0RVVJMHJm?=
 =?utf-8?B?cEs1RDNXL1lZOU1ENzl3cDh2RlVaS0h5SnUvYkpPV204TkdhTUhXczNDb1E3?=
 =?utf-8?B?MlBuelFybmQ3NUN3RHR5aWZPTnpGRGF1dElMUXFtNE9tTG0wTTJpRUdQZWYr?=
 =?utf-8?B?dzZZV0JraElnNlBsMHlGVVR6V2ZVWEh3OEwrMG44ZHpJeW1NQ2ZsUnNKMkZp?=
 =?utf-8?B?eWx4S0RsZTR1Q3lMUFd2UVMybm9PS0xxZ2x4bytHcEZyVHFKUlVuWGFNblJH?=
 =?utf-8?B?NHYrcnluYi9UL3RySFlCNjF3bmtxa3hKeGk0bEw0MldoN2ZaOWYxWHpMdGsy?=
 =?utf-8?B?dEs0NG50OW1ETVFuRGdWbS9nYUNwaFplWmhjZnFqOEpMTXRlM2hRRk5zaEIw?=
 =?utf-8?B?MGx2VVJjam5yVXZ3LzI0ZXJUVTFtRzlJRzdmUUlYRmtGaEVJK2tiUXFFVkdJ?=
 =?utf-8?B?SmNucXNmMHB3QStjZUVjRWhwbGM3U3RUMURzaTlkYXNLTm1vc3BuRWE1OEVo?=
 =?utf-8?B?V0JHUkZMSlBYTXhMWUEzcEtFQVZ5aHE1dmtGYjA0eWgwZVBCQW5QUWEzMVk1?=
 =?utf-8?B?RHFSNmpEdFBPRmlGTWtaK3BGdTgzcFZOSnpWbXNvNXlvWDVmRzZCaVYvK3I4?=
 =?utf-8?B?MGE0M255OURaUFY4MTJuSTBWUWg0bjZacWdVZUhnUXFNaGRHaFNsS2tRWXNO?=
 =?utf-8?B?QldobHNnanUyMHNOdWpBNWU0STBqbDE5RjFla0lCVkFUTXN6N0p1N2hEdnBH?=
 =?utf-8?B?bmFhdHVqeXN4UjhOODMrREpBMXVjQ1hhQW5EYkJqKzYvRzlsZjliWUZiaEdq?=
 =?utf-8?B?aTVBYUcxQ0VablhrR1lMU1M3RTBDemN1TGExNE9JTVZlMlhhNXdwYXFmaVZY?=
 =?utf-8?B?WHZoZzRmZzhJVllSZ1c4WDgwVG80aUpJcVdZaGJVejdseHBUK3hwM3B3ZWsr?=
 =?utf-8?B?ZUxGTTFtWnR0VXRvRXE3WHphVzFFM3dDNm9UWFVlSEZVL1ZSU3ZTS2hHdFR3?=
 =?utf-8?B?OUtEZ0JPVDVRVHlTT3dGckQvQmRXRDRndlFQbTBZNS9uYVZVaGdkNFlzaHZR?=
 =?utf-8?B?ZFdBeVFMWUltVDNYUjhOUG05c2NFa3B5dGVEdUt2WFZJVXp4dlMwTDBrL1hP?=
 =?utf-8?B?VDlDWS94UFNvVlZoanl0N3ArSGpWSHRYSElCZStkbDcxaWdwSStJTkNTL1Rm?=
 =?utf-8?B?MVlEQzRYSFVzTVF3WkhFZTArVUU4UktENFp3Mk5Ha0s1TVNMdWtsRVZXTnNX?=
 =?utf-8?B?NHdJS2FCcXdHM0lNREVyVUJleUJUN3d6R0JSZjY3UGgrbGdvd2FESmh0OEVw?=
 =?utf-8?B?NUxONjBiMVN6UTIvWHdOU3RsZC9vZ2VBSWlZZ2xMRTVxaFFEU1ZyTU50YmJW?=
 =?utf-8?Q?G3v69nB84vnqp/5Yr9fUOtz/M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f9dc07-252f-4ae1-e84e-08dd0ed9d190
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 11:51:24.6148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlP1IIbFGtFjTKrJyMQR7oxB/w1nDd3HSrJLkH+hkoW00BJAyxVs/VXxZI13wU+5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6170
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

Am 27.11.24 um 12:46 schrieb Mika Laitio:
> AMD gfx1103 / M780 iGPU will crash eventually when used for
> pytorch ML/AI operations on rocm sdk stack. After kernel error
> the application exits on error and linux desktop can itself
> sometimes either freeze or reset back to login screen.
>
> Error will happen randomly when kernel calls evict_process_queues_cpsch and
> restore_process_queues_cpsch methods to remove and restore the queues
> that has been created earlier.
>
> The fix is to remove the evict and restore calls when device used is
> iGPU. The queues that has been added during the user space application execution
> time will still be removed when the application exits

As far as I can see that is absolutely not a fix but rather a obviously 
broken workaround.

Evicting and restoring queues is usually mandatory for correct operation.

So just ignore that this doesn't work will just is not something you can do.

Regards,
Christian.

>
> On evety test attempts the crash has always happened on the
> same location while removing the 2nd queue of 3 with doorbell id 0x1002.
>
> Below is the trace captured by adding more printouts to problem
> location to print message also when the queue is evicted or resrored
> succesfully.
>
> [  948.324174] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1202, queue: 2, caller: restore_process_queues_cpsch
> [  948.334344] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1002, queue: 1, caller: restore_process_queues_cpsch
> [  948.344499] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1000, queue: 0, caller: restore_process_queues_cpsch
> [  952.380614] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1202, queue: 2, caller: evict_process_queues_cpsch
> [  952.391330] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1002, queue: 1, caller: evict_process_queues_cpsch
> [  952.401634] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1000, queue: 0, caller: evict_process_queues_cpsch
> [  952.414507] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1202, queue: 2, caller: restore_process_queues_cpsch
> [  952.424618] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1002, queue: 1, caller: restore_process_queues_cpsch
> [  952.434922] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added hardware queue to MES, doorbell=0x1000, queue: 0, caller: restore_process_queues_cpsch
> [  952.446272] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed hardware queue from MES, doorbell=0x1202, queue: 2, caller: evict_process_queues_cpsch
> [  954.460341] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
> [  954.460356] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes failed to remove hardware queue from MES, doorbell=0x1002, queue: 1, caller: evict_process_queues_cpsch
> [  954.460360] amdgpu 0000:c4:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
> [  954.460366] amdgpu 0000:c4:00.0: amdgpu: Failed to evict queue 1
> [  954.460368] amdgpu 0000:c4:00.0: amdgpu: Failed to evict process queues
> [  954.460439] amdgpu 0000:c4:00.0: amdgpu: GPU reset begin!
> [  954.460464] amdgpu 0000:c4:00.0: amdgpu: remove_all_queues_mes: Failed to remove queue 0 for dev 5257
> [  954.460515] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State
> [  954.462637] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State Completed
> [  955.865591] amdgpu: process_termination_cpsch started
> [  955.866432] amdgpu: process_termination_cpsch started
> [  955.866445] amdgpu 0000:c4:00.0: amdgpu: Failed to remove queue 0
> [  956.503043] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
> [  956.503059] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
> [  958.507491] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
> [  958.507507] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
> [  960.512077] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
> [  960.512093] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
> [  960.785816] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to halt cp gfx
>
> Signed-off-by: Mika Laitio <lamikr@gmail.com>
> ---
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24 ++++++++++++-------
>   1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index c79fe9069e22..96088d480e09 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -1187,9 +1187,12 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   	struct kfd_process_device *pdd;
>   	int retval = 0;
>   
> +	// gfx1103 APU can fail to remove queue on evict/restore cycle
> +	if (dqm->dev->adev->flags & AMD_IS_APU)
> +		goto out;
>   	dqm_lock(dqm);
>   	if (qpd->evicted++ > 0) /* already evicted, do nothing */
> -		goto out;
> +		goto out_unlock;
>   
>   	pdd = qpd_to_pdd(qpd);
>   
> @@ -1198,7 +1201,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   	 * Skip queue eviction on process eviction.
>   	 */
>   	if (!pdd->drm_priv)
> -		goto out;
> +		goto out_unlock;
>   
>   	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>   			    pdd->process->pasid);
> @@ -1219,7 +1222,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   			if (retval) {
>   				dev_err(dev, "Failed to evict queue %d\n",
>   					q->properties.queue_id);
> -				goto out;
> +				goto out_unlock;
>   			}
>   		}
>   	}
> @@ -1231,8 +1234,9 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
>   					      USE_DEFAULT_GRACE_PERIOD);
>   
> -out:
> +out_unlock:
>   	dqm_unlock(dqm);
> +out:
>   	return retval;
>   }
>   
> @@ -1326,14 +1330,17 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   	uint64_t eviction_duration;
>   	int retval = 0;
>   
> +	// gfx1103 APU can fail to remove queue on evict/restore cycle
> +	if (dqm->dev->adev->flags & AMD_IS_APU)
> +		goto out;
>   	pdd = qpd_to_pdd(qpd);
>   
>   	dqm_lock(dqm);
>   	if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
> -		goto out;
> +		goto out_unlock;
>   	if (qpd->evicted > 1) { /* ref count still > 0, decrement & quit */
>   		qpd->evicted--;
> -		goto out;
> +		goto out_unlock;
>   	}
>   
>   	/* The debugger creates processes that temporarily have not acquired
> @@ -1364,7 +1371,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   			if (retval) {
>   				dev_err(dev, "Failed to restore queue %d\n",
>   					q->properties.queue_id);
> -				goto out;
> +				goto out_unlock;
>   			}
>   		}
>   	}
> @@ -1375,8 +1382,9 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
>   vm_not_acquired:
>   	qpd->evicted = 0;
> -out:
> +out_unlock:
>   	dqm_unlock(dqm);
> +out:
>   	return retval;
>   }
>   

