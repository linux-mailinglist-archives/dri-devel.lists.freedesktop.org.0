Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C3A08C9A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE310F02F;
	Fri, 10 Jan 2025 09:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PjBuGP34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0628210F02F;
 Fri, 10 Jan 2025 09:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5Xn7nkR5A/BzY3SEtAYoVrCTNWZ0kOL323a4yaNbx7tIy+bmJRXmeOWGr3cuWnOTxEGKSPcTsD/cWNo+i6DPNRjKFbvLYSZ36YvJfKOLBwjRwjZKS3Z0KG8R5vONnO5e7PttXOMHrNH+EbOk2/ejVeY3+BjNuvwQJWln0U8W8w9ljsoIJvYj9ASK1HBL1QkJNvpk4ScvrZdKsXKAL8zslrnJeSDFp89uA9elTx8c9ipNLKTt8ma6jJLg0zkE5XlBjClVhNB9oFp34/RQOCAVUjU7ZB1TcjVS3opdY+2Hh0JmtrihVEy5ArTidYlVkXdJikqTlXfOfGWDQX9A0e6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpzs/x3/FtqQ2diVa5mNqGZ0njfNLk5sZZxOmVDWgdU=;
 b=aCzsEeFcJznmiQwXJX+lyT0/2gJhCKkSF9uggHHBi2WdVmCXCWqxeLOEUfabBexAnE6TVUyd1j01dTd0VRFENcFu6M+6lvk+dlDxKeOri3RSOPOlg/3+V8zli9mdfNF7oqiRJ9WkUggHVUo/yXUio8VHBxFJCVLGMzC3N/iZMklRvlPULwATJfIGjyoFWgZYzyI8mte0Fx9nfdFQLu/v5QRLXw8sBUM0YxL7JxxM0z7P+Ng5BAv/QmCb7u43RRasCU9gnnpK5BQRBnKdkXdm4TCfEA3HLunyVnFywlDusQFHkdh6+f2+W9gh41/KH2k9RZlokmaDYYY5ProiS7/7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpzs/x3/FtqQ2diVa5mNqGZ0njfNLk5sZZxOmVDWgdU=;
 b=PjBuGP34TE2dXuzc/GlcdI9hCGBT9/Wyb6PA9gtgn7L3IGxHtNedRWcT1u8MecyYhgYzQfajU5yOFdeydB/izmhNp3Ri4P0MvAND1VnKmpxhLWuPy8f/KVvqSnIX6Twh0N2eQP210fqdJ8uVH7dxbe8xabGQg68ER3sSFLTNRg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 09:45:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 09:45:44 +0000
Message-ID: <c2e7b35a-4dc4-4b9e-9589-0457b2318dec@amd.com>
Date: Fri, 10 Jan 2025 10:45:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/9] drm/ttm/pool: Restructure the pool allocation code
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
 <20241217145852.37342-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241217145852.37342-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e6e265-290a-4000-d609-08dd315b8d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmthYTFWNk90d1U3S3UrL0FTaTZpNTdRb09wMCtFdFFYaFlLZnkrRDhNUFFp?=
 =?utf-8?B?aldscHFQZG5qRUNEbGxWak5iR3FtRllXejlkR3lWSXpzUGwxOFhOaG4wR0Jp?=
 =?utf-8?B?M3VwUTJnaldhVU8zV0FTcDZvWUN2UHRuSXNSbXFHZEZTSTBGVStNaWo4Vno5?=
 =?utf-8?B?c0I5ZWJTaS9qMmNMcDlSUnhlMkZiekJJSi9qVzJ5M0p2YTVQSlQzUkNRQ3Jx?=
 =?utf-8?B?YjlhUmh3UCtMb3dMNWtmUkc1cml2QWJoOVV5THVlaFFTWVQvU2FCL0k4YVkz?=
 =?utf-8?B?bE9FYTBqWSs2MHAzVCtla2EvQVhSU21sempBU1ZhSXVKWmNrQXdjcVBmamo0?=
 =?utf-8?B?OStGMFBTczRaUmlpQkhqN3hFMzRRbUtBUCtEUElNUUhFVi9HckRybU9CVlpY?=
 =?utf-8?B?dEZ3WFZGQ2xVWi9GUzF3SFFqM2RVeWg0bTY0UDgvMXVES0xRTlowYXRhcTJ6?=
 =?utf-8?B?aDEvVm9UMWwvdFRaODF0YkxHTEo2ZGV5VEFadFRFNXF6b1UyRmcxcW5YYmo2?=
 =?utf-8?B?RkJ3a0RWdzZQRExhZlRNcFcxbkZqOVNpUExJVzFsQTE1VXVucTRhMGJYbEg3?=
 =?utf-8?B?cXVrdVpxV0hNc0NQdUJoNkYwNEtZODhIcjAvbllKN2ptNlY3Q01wZHZEVkd0?=
 =?utf-8?B?d0k1eURZVzFOdlFTOWYwaFZDZ3B4V3lOSXdxWjk1U0tlcmU3ampuRzh1QXcx?=
 =?utf-8?B?UUtJSCtGc3V3eGNjNlBKNGJkTlh0aGpLKzBJeDJGSEFFUFJ4KzBQWFJMdzRU?=
 =?utf-8?B?WkpMYjdpQXVBOXEvZXlIWjRVUXl1ZWsrNDV5NWNIeXF5V3JHcEtDM3g3RXBR?=
 =?utf-8?B?bnlmL251bWV6WnN5dFM0UWlNOERXb0tLcHNuSi9kUnh6MEJ5bjZQbS9ETkZV?=
 =?utf-8?B?RDNLRHhsY09pdTFZVGJkZUVZVTBmSGtnWlh0UHVMbnJYV2lVaDQyTjJwZmdy?=
 =?utf-8?B?dldjWEVnWElWWXRwRE5kaDBaOUkvR1d3d0M2ODNLYnhBSktxVXByeDBKaGEx?=
 =?utf-8?B?UjVqUGZoMjhoVXZSZC9hT1ZlOVY1aENuYmUzRkJZeEtKV09kNks4eFlTZm1P?=
 =?utf-8?B?b293Q0F4SUdtMGtTSkZTRStrN1lBbng4NVBLNEplTFVqYnNtODNXOW9GUGpC?=
 =?utf-8?B?ZVRMMk51dGM0N1FnM256RGtibjhqZzl0VjZqSWR1Y3YrYlVHZ1ZtUTRYcnF6?=
 =?utf-8?B?ZnlJMGhXNUZVbEY3V0xQeGpVRkJGUVV4ZHVpMHo2dHg3QUpZNWhRVjAyK1p5?=
 =?utf-8?B?dFRwZ0RTS0JhVzdCMDZoNlVWYmlTM3YvUE1ta0NZc3VGWG5nc1V0K3YzQnVw?=
 =?utf-8?B?NFZQcE9Qb1JFWkpxNWFEckliNTlIMnQ0ZVFsSmdjMXN3N2tJRlhtZCtGV2JI?=
 =?utf-8?B?SlpXcmdzYkJCK3dmRzMycGJBMEVubmhvUitRZG8vYi9iREo1a2RIc0UyLzVw?=
 =?utf-8?B?TEFMc3lBYmRBWWp6Vm5QMUxHTVdaNDVDTHdwYTdDVzBsYTRoZk9yRVRHM0lS?=
 =?utf-8?B?VkxiUkdRWUpNekZPKytzeHMxb05DaVczcVJaOXRmc3dzZUZBZHlHWUdXeExF?=
 =?utf-8?B?dU40dzZYei94OWJXL3kwZkt2WmNxb3hyemIzZHo5NVJZYnRoN3lXSE1hMC9R?=
 =?utf-8?B?NFNxbTVPdndjak80elBwWUFNSXBYMzkvQTN3K3BxN1JzaCtDdS9yVWpXbmhr?=
 =?utf-8?B?Tm5xcDg2bHJCdy9lYTlKUnYxSWxlQks4dnk4ZVJabnBreFVJY29IYlhzaEVQ?=
 =?utf-8?B?S0NSeVhPS2NzK3VKVSsrREtNT0hWRjVxa2VSZ0lweURNbkRxb1BXNnRTQUF3?=
 =?utf-8?B?M1hDQjJ3S2NiU3F1MmtUR1Jtc09TZk5QTldOcFdWZStwWC9JekVpY2lJaDd2?=
 =?utf-8?Q?+MhwPsmG4O7DW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFpeW54a28zWWRwUHFaNGtjZldRTTBUUW1Fdm14YlFha2Y5ejVacnRyZDR3?=
 =?utf-8?B?QjhBdC9ONU9EQVJKV2ZpNWhlWE8rUEs4TGdlcEYxZVRYRUthWnVqYzhZYkEz?=
 =?utf-8?B?TGFrUzEyVklteXdLbHJuS3VEVkRFazAxYjBNcXFzSGtDd3dBd3ptZ2VZYmVy?=
 =?utf-8?B?UHhmd1dsQlZUT1ZuajJabkU3YXFiWEdIS1paeHpyN0M5SE4rVTN4QUF6U0wy?=
 =?utf-8?B?K2wwMGNZN0ZWZGFoUjh3WGpBS0lJc2FSdnJOYmF1NUZrVXZMdFZYcnB1M20z?=
 =?utf-8?B?Zlg2Zk93OGh1ckZncjd2d1gzYnpSWXVZTjBIell1RWZTbG03TkQwYkFuRldu?=
 =?utf-8?B?UjN4K1VMMWZhTTNnV1FwZzlENGFLcGVOS3ZCWkZNOVptYXppYkRvdk1ZY1Ft?=
 =?utf-8?B?V0dEV2Q4NFF0Z3lZUzNNVHZRbG43NFp3QmxObDdaY1lxam43L2lCaXhCK1FD?=
 =?utf-8?B?TjJCV0J2UXBqSG1rRFNjb2F1elpMMWN5YWNUU3JIV3hrNDMxZlIzbWY2TzR4?=
 =?utf-8?B?ZThmNHBUeHZxcXZCL0FwN09WMS9nczU2QVhSUkVoT2dKNlNuT1BTZWZEM1FX?=
 =?utf-8?B?TDJGaSsrUVpXcXN4OStPNm50Tm5pbEVmSUdTVkU3Q0Rtd3dGcExLeE5tQWFR?=
 =?utf-8?B?VlFtUEt2VzlzZGorYUVGQjgxbWRRVzhpTzUyeFpjM2lMVkdKMzI2dDNLeTNX?=
 =?utf-8?B?dFVlVE1LOURiNVR1bVBSUUpuKy9TTW5mYkJUUUg1TmpxM09yNVBpWlB4dCt1?=
 =?utf-8?B?REFEQzJEUzhiR2I1WkNIY3JJeEZ3VHZmUEl4MzJrUWRoREtwYkcreHVGbFVJ?=
 =?utf-8?B?RTRPQjhTTW9DYkUzMlVZRjIxZWdMcGJrU2NUeDRsRDUvZ0RIbElIUUVITTMy?=
 =?utf-8?B?dUNtejh0ZGNzNzUxZVdjem02NGlmKzc4aC9TZ0NQWE5hVkVNS1NWbStYUVJ5?=
 =?utf-8?B?cDNCODJmR21WY1U4TDNPSjZCU3VrVEZraFZKSUU5K05vblVBclZHTVB0eUdZ?=
 =?utf-8?B?VUxUMzlyVHJIeE1Walg2bm5EZ04yM2hVcEhQWjN1bFVJV0pKZ1R1SWU1ZjlU?=
 =?utf-8?B?dlVmZWVrMUJhUzBrRkVVU1RhbE5UK0hLcUNoTDBPanlHd0pFRFJJSDRjRE51?=
 =?utf-8?B?d0xuTTh2UjlHTVpMWUxOa3QyTkZoZHhNQndmUU9rNmhBbGdFZmRZNFgyZmx5?=
 =?utf-8?B?U2N2VzJwTXR0V1VuU0JpSFNnbTdWMnIxNFFHUE1rTXJiUGt6VFg3Qy9vUHA3?=
 =?utf-8?B?STlsdWtkY05uTGQvYVcwZWpQMStwTTN3S09OcWducndkOVlZK3FESm10UmtD?=
 =?utf-8?B?RXhrSWwzaDFmZEEvN3pBWmo1aTNqSFdPaVRyTjQwSDNqa2p5Rzk4c3NBQ1RQ?=
 =?utf-8?B?bGF3YTdKT3V4UytEdTNod3ZyZmJXbGFINitwdzJYOWp5M3FEZVZQbno1cEph?=
 =?utf-8?B?eVh4OENYbVIwUFMxNGF2cXM4TGtvUzROdXFiWkxXRDE0N1dRcFVBdGJmVlUz?=
 =?utf-8?B?VDJWUU82YVVqVFFsSHhxY0VZRktFSDh5TndjWWwzbXRrbytDV3FIRVJxelpR?=
 =?utf-8?B?OEd5RFRYU3RxSVFGbUUxMTMyMVVNL1dBd3Flckh1aGtiU3J5aUZEUDhRcDZ0?=
 =?utf-8?B?dDd0OFAxYjFUZ0tQWVo5aEdDRkZqSWRzbmRzZzRXT2lKZDMwOUxJWEU1NUFD?=
 =?utf-8?B?c0t0d3NsNkFlejcvTU84d3FxVmRTTEdxdU83UDdNdmJybDdoWjZBNFVsVzl3?=
 =?utf-8?B?YXg0ZGZGT2o1V3NQQ2EwYUZyLzVkQ1VLVVM3VzlETXd5MVRTVnRZY0srOWlF?=
 =?utf-8?B?UC9XUXJjUUVXSUZ5eE1pTTBUS09jV1ZuVjIveE9UUkhiRERJZWdoeVI1RW9p?=
 =?utf-8?B?WEVjUlZjMmJSWGJSKzEydzJjSlgvOUZEQ0syMFFxSjJLK0oyOU11NFNsVW5t?=
 =?utf-8?B?QWo4dytNNSs1ZmtNVmJsM2VuZ2srYkNNblN3Z1k3TzZ0WXFCVnJra05LTFFt?=
 =?utf-8?B?N2VrT2p3R2hjVlg5NmJRVkJRRWIraFllWDVFSkpxQWFrTDBRTEMrc21pc3RQ?=
 =?utf-8?B?MG16M0NiTkRiVVB2emRmWklEQVUwRTk0NzF0LytZcDBzd1JjYm5mNkx0U2lt?=
 =?utf-8?Q?SM+jULLlCOv4RCGOp3Px58cwS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e6e265-290a-4000-d609-08dd315b8d45
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 09:45:43.9620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhFh2CpbN1qmy8c4jicvHD4OMjV5iToEx46jfEuw7u+3JOEdzmZEDQap76IN5uIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731
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

Am 17.12.24 um 15:58 schrieb Thomas Hellström:
> Simplify the pool allocation code somewhat by merging loop arguments
> used by multiple functions together in a struct and simplifying the
> loop. Also add documentation.
> This hopefully makes the behaviour of the allocation loop
> simplier to understand, but above all paves the way for upcoming
> restore-while-allocating functionality.
>
> There are no functional changes, but the "allow_pools" bool
> introduced to keep current functionality could be removed as a
> follow up, which would enable using write-back cached pools when
> allocating memory for other caching modes, rather than to resort
> to allocating from the system directly.
>
> v15:
> - Introduce this patch to simplify the upcoming patch that introduces
>    restore while allocating.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 183 +++++++++++++++++++--------------
>   1 file changed, 108 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8504dbe19c1a..c9eba76d5143 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -58,6 +58,23 @@ struct ttm_pool_dma {
>   	unsigned long vaddr;
>   };
>   
> +/**
> + * struct ttm_pool_alloc_state - Current state of the tt page allocation process
> + * @pages: Pointer to the next tt page pointer to populate.
> + * @caching_divide: Pointer to the first page pointer whose page has a staged but
> + * not committed caching transition from write-back to @tt_caching.
> + * @dma_addr: Pointer to the next tt dma_address entry to populate if any.
> + * @remaining_pages: Remaining pages to populate.
> + * @tt_caching: The requested cpu-caching for the pages allocated.
> + */
> +struct ttm_pool_alloc_state {
> +	struct page **pages;
> +	struct page **caching_divide;
> +	dma_addr_t *dma_addr;
> +	pgoff_t remaining_pages;
> +	enum ttm_caching tt_caching;
> +};
> +
>   static unsigned long page_pool_size;
>   
>   MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> @@ -160,25 +177,25 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   	kfree(dma);
>   }
>   
> -/* Apply a new caching to an array of pages */
> -static int ttm_pool_apply_caching(struct page **first, struct page **last,
> -				  enum ttm_caching caching)
> +/* Apply any cpu-caching deferred during page allocation */
> +static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
>   {
>   #ifdef CONFIG_X86
> -	unsigned int num_pages = last - first;
> +	unsigned int num_pages = alloc->pages - alloc->caching_divide;
>   
>   	if (!num_pages)
>   		return 0;
>   
> -	switch (caching) {
> +	switch (alloc->tt_caching) {
>   	case ttm_cached:
>   		break;
>   	case ttm_write_combined:
> -		return set_pages_array_wc(first, num_pages);
> +		return set_pages_array_wc(alloc->caching_divide, num_pages);
>   	case ttm_uncached:
> -		return set_pages_array_uc(first, num_pages);
> +		return set_pages_array_uc(alloc->caching_divide, num_pages);
>   	}
>   #endif
> +	alloc->caching_divide = alloc->pages;
>   	return 0;
>   }
>   
> @@ -354,24 +371,41 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>   	return p->private;
>   }
>   
> -/* Called when we got a page, either from a pool or newly allocated */
> +/*
> + * Called when we got a page, either from a pool or newly allocated.
> + * if needed, dma map the page and populate the dma address array.
> + * Populate the page address array.
> + * If the caching is consistent, update any deferred caching. Otherwise
> + * stage this page for an upcoming deferred caching update.
> + */
>   static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
> -				   struct page *p, dma_addr_t **dma_addr,
> -				   unsigned long *num_pages,
> -				   struct page ***pages)
> +				   struct page *p, enum ttm_caching page_caching,
> +				   struct ttm_pool_alloc_state *alloc)
>   {
> -	unsigned int i;
> -	int r;
> +	pgoff_t i, nr = 1UL << order;
> +	bool caching_consistent;
> +	int r = 0;
> +
> +	caching_consistent = (page_caching == alloc->tt_caching) || PageHighMem(p);
> +
> +	if (caching_consistent) {
> +		r = ttm_pool_apply_caching(alloc);
> +		if (r)
> +			return r;
> +	}
>   
> -	if (*dma_addr) {
> -		r = ttm_pool_map(pool, order, p, dma_addr);
> +	if (alloc->dma_addr) {
> +		r = ttm_pool_map(pool, order, p, &alloc->dma_addr);
>   		if (r)
>   			return r;
>   	}
>   
> -	*num_pages -= 1 << order;
> -	for (i = 1 << order; i; --i, ++(*pages), ++p)
> -		**pages = p;
> +	alloc->remaining_pages -= nr;
> +	for (i = 0; i < nr; ++i)
> +		*alloc->pages++ = p++;
> +
> +	if (caching_consistent)
> +		alloc->caching_divide = alloc->pages;
>   
>   	return 0;
>   }
> @@ -413,6 +447,26 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   	}
>   }
>   
> +static void ttm_pool_alloc_state_init(const struct ttm_tt *tt,
> +				      struct ttm_pool_alloc_state *alloc)
> +{
> +	alloc->pages = tt->pages;
> +	alloc->caching_divide = tt->pages;
> +	alloc->dma_addr = tt->dma_address;
> +	alloc->remaining_pages = tt->num_pages;
> +	alloc->tt_caching = tt->caching;
> +}
> +
> +/*
> + * Find a suitable allocation order based on highest desired order
> + * and number of remaining pages
> + */
> +static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
> +					      const struct ttm_pool_alloc_state *alloc)
> +{
> +	return min_t(unsigned int, highest, __fls(alloc->remaining_pages));
> +}
> +
>   /**
>    * ttm_pool_alloc - Fill a ttm_tt object
>    *
> @@ -428,19 +482,19 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>   int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   		   struct ttm_operation_ctx *ctx)
>   {
> -	pgoff_t num_pages = tt->num_pages;
> -	dma_addr_t *dma_addr = tt->dma_address;
> -	struct page **caching = tt->pages;
> -	struct page **pages = tt->pages;
> +	struct ttm_pool_alloc_state alloc;
>   	enum ttm_caching page_caching;
>   	gfp_t gfp_flags = GFP_USER;
>   	pgoff_t caching_divide;
>   	unsigned int order;
> +	bool allow_pools;
>   	struct page *p;
>   	int r;
>   
> -	WARN_ON(!num_pages || ttm_tt_is_populated(tt));
> -	WARN_ON(dma_addr && !pool->dev);
> +	ttm_pool_alloc_state_init(tt, &alloc);
> +
> +	WARN_ON(!alloc.remaining_pages || ttm_tt_is_populated(tt));
> +	WARN_ON(alloc.dma_addr && !pool->dev);
>   
>   	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
>   		gfp_flags |= __GFP_ZERO;
> @@ -453,67 +507,46 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	else
>   		gfp_flags |= GFP_HIGHUSER;
>   
> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> -	     num_pages;
> -	     order = min_t(unsigned int, order, __fls(num_pages))) {
> +	page_caching = tt->caching;
> +	allow_pools = true;
> +	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, &alloc);
> +	     alloc.remaining_pages;
> +	     order = ttm_pool_alloc_find_order(order, &alloc)) {
>   		struct ttm_pool_type *pt;
>   
> -		page_caching = tt->caching;
> -		pt = ttm_pool_select_type(pool, tt->caching, order);
> -		p = pt ? ttm_pool_type_take(pt) : NULL;
> -		if (p) {
> -			r = ttm_pool_apply_caching(caching, pages,
> -						   tt->caching);
> -			if (r)
> -				goto error_free_page;
> -
> -			caching = pages;
> -			do {
> -				r = ttm_pool_page_allocated(pool, order, p,
> -							    &dma_addr,
> -							    &num_pages,
> -							    &pages);
> -				if (r)
> -					goto error_free_page;
> -
> -				caching = pages;
> -				if (num_pages < (1 << order))
> -					break;
> -
> -				p = ttm_pool_type_take(pt);
> -			} while (p);
> -		}
> -
> -		page_caching = ttm_cached;
> -		while (num_pages >= (1 << order) &&
> -		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
> -
> -			if (PageHighMem(p)) {
> -				r = ttm_pool_apply_caching(caching, pages,
> -							   tt->caching);
> -				if (r)
> -					goto error_free_page;
> -				caching = pages;
> -			}
> -			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
> -						    &num_pages, &pages);
> -			if (r)
> -				goto error_free_page;
> -			if (PageHighMem(p))
> -				caching = pages;
> +		/* First, try to allocate a page from a pool if one exists. */
> +		p = NULL;
> +		pt = ttm_pool_select_type(pool, page_caching, order);
> +		if (pt && allow_pools)
> +			p = ttm_pool_type_take(pt);
> +		/*
> +		 * If that fails or previously failed, allocate from system.
> +		 * Note that this also disallows additional pool allocations using
> +		 * write-back cached pools of the same order. Consider removing
> +		 * that behaviour.
> +		 */
> +		if (!p) {
> +			page_caching = ttm_cached;
> +			allow_pools = false;
> +			p = ttm_pool_alloc_page(pool, gfp_flags, order);
>   		}
> -
> +		/* If that fails, lower the order if possible and retry. */
>   		if (!p) {
>   			if (order) {
>   				--order;
> +				page_caching = tt->caching;
> +				allow_pools = true;
>   				continue;
>   			}
>   			r = -ENOMEM;
>   			goto error_free_all;
>   		}
> +		r = ttm_pool_page_allocated(pool, order, p, page_caching, &alloc);
> +		if (r)
> +			goto error_free_page;
>   	}
>   
> -	r = ttm_pool_apply_caching(caching, pages, tt->caching);
> +	r = ttm_pool_apply_caching(&alloc);
>   	if (r)
>   		goto error_free_all;
>   
> @@ -523,10 +556,10 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	ttm_pool_free_page(pool, page_caching, order, p);
>   
>   error_free_all:
> -	num_pages = tt->num_pages - num_pages;
> -	caching_divide = caching - tt->pages;
> +	caching_divide = alloc.caching_divide - tt->pages;
>   	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
> -	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide, num_pages);
> +	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide,
> +			    tt->num_pages - alloc.remaining_pages);
>   
>   	return r;
>   }

