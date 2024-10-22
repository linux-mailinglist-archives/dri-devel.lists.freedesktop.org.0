Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85139AB46F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB50C10E6DA;
	Tue, 22 Oct 2024 16:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P4AA5Mu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0DE10E6DD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 16:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc77EHw6I7pLkzqus+QOfaAyoxZm39YLzndk9zz5JvrTsGaAXcuqrCE/wY1cD6+nvL8FRjOipRWlR6FSDn1Yi2NSutm4zMQXkozRbsEter1YfB2KVY3Onx2Qi8Qh1JQQsMrAZuXqcMNHUOWnwOElfEKTKvbIECAI2dvDWRURv5At/dHwKqqcof4SH0Horfeu/WClfVvls5y+idTV2AuI2MIm32qlh4owjWGPWWYIrFCyv9+C9OKVbkjpCF6q4lP8x9fzDZVfeCrIv4J3GeF6/o9Y3iSAUga/nqMtR9pvi5vo9nAczUWeS33CPXdgnl7lRsGBnorvPQZhAoUt5m15Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI+PziohwHmAQJMD2ftHXVmL65lQ3ze3Zdvf8u2ta/w=;
 b=d5zBFjQUiRAglQ6vd5tCf+SFej5BnFW9rQQWAfJpfwFepsAiwZS81Uv7mWnmpjMgMIB0QFFf3orPwa/sGKcCPf3RYli7D7vrm0yo7y02dn+Y0ZgfNloYcMjaDU0mW7XkslaP6qzJILlrBvNEwRKhyOBJRZmwRGx/O8RLwMCh0D+e7m53nHM9m56wcidRXDC3ptAvTpFbJ8/UBJhDYTXdmA133EIUvU/THHx3tASm+55RDzk6Bpn6x+bwA7E9zxgsV7YVEgvXmMdcRx9TjoauoCnZ4GBD6Zjo6eMhsXvGZS5nV/zX6Ztyf6W4MTPjHXoKtzGOb4TkOCcran6TYKpcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI+PziohwHmAQJMD2ftHXVmL65lQ3ze3Zdvf8u2ta/w=;
 b=P4AA5Mu6HJvyeFX2/CWLszd02FeWYiW5iS1PO3kY69EUxIP/bVG8eTm1k4P5dtuqw8pbn6WofrYOP8H0rGq8aKBF9/j4xgXgmqAtWpdEOPLsq22BbKkFES0AAo1QsZfKwpkXVsFp/tx8ogcOFAKzP6nBZBwt/mTPN/yP0/P8bCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 16:53:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 16:53:13 +0000
Message-ID: <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
Date: Tue, 22 Oct 2024 18:53:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: Chia-I Wu <olvaffe@gmail.com>, boris.brezillon@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: faith.ekstrand@collabora.com
References: <20241022161825.228278-1-olvaffe@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241022161825.228278-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 72be0f5c-0d95-483b-21db-08dcf2ba0474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2Y2MmlFN1N0R0pvamxoZGtVSWo3MHNOYUM3Ly9tbjgzTFc3K0lBTmt2TFpK?=
 =?utf-8?B?dTZDL05xVmM3R0hLc0kzNUNhRlRLa3ZhS21QaUkwQlQwVjRqSjdZd3NXUzR4?=
 =?utf-8?B?NUxzVHhuV2lTU0VjRUpURUpEVXNyb0FYazNZWndWdlI4S0hMRXNDdlBqK2t4?=
 =?utf-8?B?dTIxMC9vbVJ6K3NQRllycmExL0tUUmY1WjhKc1VXa21wbmkxcXVETTFoTms4?=
 =?utf-8?B?U3krVjVVWk92NVQxSkY5RVVMVVA1ZkxYSk45OFp0cWlZOEFIY2FlcWROWWRX?=
 =?utf-8?B?Q0RkMjNwWE9TdWxGQldGcjZwRDN2TGpEY3RJWGIyeUNUYllLOFVMTE1TbmV2?=
 =?utf-8?B?cndyaUhCQ3VLemwrT2xhbU40WHlNNjZmamVwZm5Ga2g3ZnhuYjNUSXRWeDRa?=
 =?utf-8?B?d0ZmK0xXZENxS1Z4V0ZwVXMvWXI5aUs3MWZOaFZoYjUyYW91cEJaKzNGOHUy?=
 =?utf-8?B?NVVBVjZrQWIrOEp1T29scjRPNWt0TE9hRk1VaHFzNVdvT09BNkdhK0Mvbm4y?=
 =?utf-8?B?WnVZQWxLRTFSZGxlQTdmSFNhN21BN0pwSW9LaFdmMTBrV0NJcytIYWE5VU1S?=
 =?utf-8?B?d1dzVmFKOTNvNHc3WHhpelMzcEhKODUyL1FQYnNBMFdLVDZSY2g5RGJkRmdR?=
 =?utf-8?B?QjdEdC9uZFptN20xRG1NRVgvbWh1d0UzVWJKdGZOeTR5ZThQeWFEdG9Rb21y?=
 =?utf-8?B?dks3cVZIa1VvcHozbXQxU1d5MEgxaWpuUkdvOW5uREZ2YnhTOTU0WHhBcCsw?=
 =?utf-8?B?cHJIYkJySzB0SnpIQ0JnQlN6OHFsZ01UMzFxKy9QMTJQVVM4WnlOeU51REtZ?=
 =?utf-8?B?WXEvUFZLRjVObTNwMFhYbnIveXJabzRwUW1vb3JhUnlzZlRoNnVNSGNhenp1?=
 =?utf-8?B?QzhNUTA4bG9LSU5Ma0xKdE5ncjJXT3BrUXJDSVNTQTN1UHVIOGpnRXI5cEh3?=
 =?utf-8?B?T3ZJL1FhNWtDWUtFcEM3bGN4OWM3SjFpRjZNMUdaem9ab1RISGZpcXluNHdW?=
 =?utf-8?B?bjhEeG10L244cUVFWlBnYllENk1KZ3BTOUNFTUEzNVFnNVVYODNxeTU4OGg5?=
 =?utf-8?B?V2l1Y3dldXpmZm9lSEVYT2JzeEJIU3RPZ1J4WHFOY2lGT0haa3dRVXJnbk5X?=
 =?utf-8?B?S09SRVAwMHB6c2VqSi81ZkcyMzhtSG1zZTJmZDk5VW9vaHJmSWMvQmJrM2Zw?=
 =?utf-8?B?MGhGS1NaQU9xNWZKbWRjQi9Vb0w3Y0pDRG82RlNwVkNqMVplalFyc3J5eWt4?=
 =?utf-8?B?N2JHSWJMaVVnYXVwUkJLZUxKazRiNSt2dVJ1b1ExUHVndmFsdnk1ZU4yVk1J?=
 =?utf-8?B?Tzk3U2duQk9JZFlyaTVPTkpCalhaTWdkMGE5a0loZXRLQmpUVVZQSFlPUEty?=
 =?utf-8?B?ajJTZnZycURrSkpxdWhtYU9DWWZ2Wks1VzNsakNPcDZBdWp4b0tuSnZ3VXJo?=
 =?utf-8?B?Qy93Y1BobzB3SlA1WWU4ZHdzZzdnVlJyeWtaM3A5UVFiNXZ2czNManBpa1J6?=
 =?utf-8?B?Zk5odW00U1RXZElYVWdvY1IwSU9hYzFvZWV0My9wTTlPK29EK0MrRXpWQkdH?=
 =?utf-8?B?ZGtyTHNoVkxqTlFTc2ZOK0JVOXJubXRTa0F6UEVxZmVkMHJOUHhDbjl5M0hM?=
 =?utf-8?B?eHpYbGFkbCtRaE44R24vekRBZ0pNWGF5RWxCWmlxMU9VNG50b3M1VngyaTVZ?=
 =?utf-8?B?Z1hxdzhyVVZnMnN3Q280aHV2UmN1VERtZnZ0WUw2S3NQMklDeUlBWlQrL1Bn?=
 =?utf-8?B?VmVDV0Y4aGlsbVNReVArRmREbFo0SnJTUmF3N29mamtoUm9HVWMrNVhWSXM1?=
 =?utf-8?Q?4aKKsheghApY2qOZolOA01wqm1CVIe0svsukM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHZ5OFBSaStTTHdkaUJjdTNRZlRzRzloOXpIYUN5ZVppUlJVbGVBZFE4Uml4?=
 =?utf-8?B?YjBvZ3NNczRQTENwK1oySVpEWXpEbmhZeFMzN2ZDY0wzM1BUWithOGsrKzFT?=
 =?utf-8?B?VmhleFc3Zit0NGpjOGZLSHJyMFNkVGd4aWNzbUVtZ2NPQWFFa3MvTjk1UGli?=
 =?utf-8?B?UGN1Y1F1VUFXK3RQd09ndlIyYnZ4RGtyeDhMSWUrZUQ0c0Y5Ly9IV1Awd3Nr?=
 =?utf-8?B?SHN2L3NxMlFmQTExZStiYmhyWk9VZCtjNWRTYnoxOU85MWEyeDZ3WW51MjNo?=
 =?utf-8?B?eFFOcmpEQUU1L3V0cU04ek5YQnFtazlucGNXdmxqdWZNMkExRzhhYzJTNEM3?=
 =?utf-8?B?Rm9tbmlNTjZ5Rm5IU1Y0czgrNzJXMERJVWFnbVJRWGE2T0dLV05paEtXNVlD?=
 =?utf-8?B?ZGFEbjhvekpCY2cwZ1hpRE9TQjcxTURaMGFwMDd4dFdxanVaTXR5VmZsTHdK?=
 =?utf-8?B?eDhtQTk0UzBWb3ExNVdLQ09hS2hVMFc1UFNzMzAzaS9zQjZZL2UzOVhES2hM?=
 =?utf-8?B?VE8vRjZUNUdhM3ArQUFlejlCLytnNGdYMEE4enVKeThDS1dLQUFza3RtN3hF?=
 =?utf-8?B?ZGlKSUQySzJzb05IR2drQXp0QktOYUtEQ01kcTNGSkpxZHhDUm81a1BlSzhl?=
 =?utf-8?B?ZG1PN1ZpWmhyRXBpSUgzZTVPMitiOENIdkw2VVZlMS9aZXA2dHl2WFRvcW9X?=
 =?utf-8?B?SWh2Smg0cnBrRW9XeDR6bEUzUHBoYzZWazBteTl1cEU0RHlaZTV6MkIraFR2?=
 =?utf-8?B?b0lYMUZCYUd4MW5EcUU0WExOVEJaUUlBditETG1SNzZuY25KOEpaZjU0NE9p?=
 =?utf-8?B?SjJRcURDS243Yjc1OWNINHF0ZFFDMlR1ZStYOGR5V1NnU2JVN1VFR2YrWDNp?=
 =?utf-8?B?YnBtcEcrc0U4WGxSSnVabU1sOFFlL2FkNXdRd3VMRVRaQXlwSTF6bExocWFh?=
 =?utf-8?B?M2lyL0tXbktCSlh6TEd6YlBVR1FxUzJBakF5MW5iL3JjSVZHZkwzcVBRQWVP?=
 =?utf-8?B?WW1Wb3lBanJhbDlHVEg5NVNDcmdpUFM1emtIL29hUDB5U3RENDZTTmNKdmxy?=
 =?utf-8?B?Zko1MG51YzJOT3AzanpTTUFvSmtLRlNxcng0UlhYSU50SnZVRG85V1EyNGs0?=
 =?utf-8?B?N2YvWWp5QmQvZHM5RkN2aWh0UFBmYytYR0JkcTlCSC9ldnNoK1JLWU5xRHEv?=
 =?utf-8?B?MXNmQjlPSHkvdWpnTmhpNlR4YVV5U1kwdUhYNy9Oc1J5d0lWcVZ1ZjRaRENI?=
 =?utf-8?B?MFZlNTdwQTQrNVdRcW14NFFCSVRMNkVHT1h1UmVYazgrbFBPUFZjU0VqaXg0?=
 =?utf-8?B?YUt1dUpMeGp6eVB5YXMyNEFwK2lYMy9oN2NOemRXNC9IYkRhR0NRTklHeG51?=
 =?utf-8?B?cTd3eGhPNHlwR05zT2JpdDZ4dkM5THc2Slg0UnY0aTluVG4zRFlROFdiU2to?=
 =?utf-8?B?RmVJYThoUE5FREJzdmVDQmpsQVU0MHBLVVhJSGFYZ1BuL1dZZ0N3dVVSZzF3?=
 =?utf-8?B?WmlWaFBqT2UrVDNGeWdoTUpCTWFVb3B2ejFid29GL2F5Sm1pWEZRcUFxMFo1?=
 =?utf-8?B?NGZJSnJzZnNWWUxqZXhlaU5HaTVja2gxS01VczAvVS9zVmNhbzJ4R1lHa1Jo?=
 =?utf-8?B?VmhuVkxSeTJlcVQ0T0NXbzhTcCtqRlk0NlZ5QmVrOUxhbms0Wk9ZTnVnTS9U?=
 =?utf-8?B?UERPUUFCQnRXVEFoY3ZPZXBVY2dTVGdna1lHcVB3NVZBcjczY3p2M0xnaXo0?=
 =?utf-8?B?MnQwL0hNeXRhdTI3M0ZXcGZETnZYVWtxSXdtdGxBZnBELys0dTBITHk1SDhv?=
 =?utf-8?B?NmN3cHo1bXphNnpqMzU2VHB1TkVNM2lteDI3d1o3MlNzZE9aV2Vkb3hvT2pn?=
 =?utf-8?B?RjVIWGRXYWJyb0JQM21KMWMwNHlrdHZVYnRGVGtLWmsyVkw3TDR6VnNiUWcx?=
 =?utf-8?B?MXMyWDd4UDZ6WDdGa0FDbVI0cERlTDVBT0pKMUM2NTRFT2ZrK2czZWRFMkZE?=
 =?utf-8?B?UXlha21DNkZPdWxJY1pjNUwwUWhNRDAyODlFSk5DcXRPYkZWaXJBcWxPbmQy?=
 =?utf-8?B?ck95Q3k2bDUxa3JzenBZdys4THk2Z0dnUnZCdVgvM1piMmFHVklzNnVHdDYx?=
 =?utf-8?Q?wqxDIqbXoL1DBgNmemEU0zfxH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72be0f5c-0d95-483b-21db-08dcf2ba0474
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 16:53:13.4830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVtlxMAKq+yfs1wnG5Q7x3zK7PsZBieK2eiFURg0Hspk07/WYSJ8DgJ2KckPTD2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877
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

Am 22.10.24 um 18:18 schrieb Chia-I Wu:
> Userspace might poll a syncobj with the query ioctl.  Call
> dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> true in finite time.

Wait a second, just querying the fence status is absolutely not 
guaranteed to return true in finite time. That is well documented on the 
dma_fence() object.

When you want to poll on signaling from userspace you really need to 
call poll or the wait IOCTL with a zero timeout. That will also return 
immediately but should enable signaling while doing that.

So just querying the status should absolutely *not* enable signaling. 
That's an intentional separation.

Regards,
Christian.

>
> Fixes: 27b575a9aa2f ("drm/syncobj: add timeline payload query ioctl v6")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>
> ---
>
> v2: add Signed-off-by and Fixes tags
> ---
>   drivers/gpu/drm/drm_syncobj.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 4fcfc0b9b386c..58c5593c897a2 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1689,6 +1689,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
>   				point = fence->seqno;
>   			} else {
> +				/* ensure forward progress */
> +				dma_fence_enable_sw_signaling(fence);
> +
>   				dma_fence_chain_for_each(iter, fence) {
>   					if (iter->context != fence->context) {
>   						dma_fence_put(iter);

