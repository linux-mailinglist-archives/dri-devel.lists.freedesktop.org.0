Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D91AD3A7D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EC910E11D;
	Tue, 10 Jun 2025 14:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P8axhSC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AE10E11D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oc5EKZ9Bm2kztAV3LxrBUbzcyGvRCKkemREKluWPZ/JDzV5PxeMLvpPt1gikWo52Az/3WV7pWttBJCyWZX+cOBGoZ+7OO902qXmv6OkMRCSceqjfH+jrUU4/Y86aoIa94Jf+3BvFy7oAFqXP/4buFVayWV1CViVHzZlUrHTi/czqigyhm7qeLoRMNrPGz7wUqZ6gXl7N505Uq4I8CTgcD6dtKVnNBOKLfLZXpoWkNzfBxNisMwh3IjaGgXCG5KFbUPrygJVlRG05GHRax6iX2kD9sRaiP/chCajIb6ehmM7ikBF5DqrQxpJYTWfw/QS0gm0QIsXN1OX3wB2FSzI5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=is+xLEiFIXjoZ73DAzYLDnsbKPWkMkHmvVNbrIJQNZc=;
 b=a78LNvagKCdWCsKTmeILLH6zEk5E4IqopN+EqWfF/Eaqtoni8B/3106J3G6qGHSGhYY1irnXk7Zo4BM7FU6THGXXHh9N4Wphdr5RioQVDDpEJpl+HqtgsNggi3dvI3uVA6ifwmL42mlkLA/g8RoUHxrS7Ak10cwmX5T/+K993134Y/4PSLLAZ7MwSdtJzYegWucJI5dD7PsGu2Jc57rCWbEeOnfehC8Tf7/TpuM3eoSajQ92UYiMazeIvQ19Br1If0MV6gLrk/5ItaNnR/3IcCegrg1YT3jHDSxIiJuctiyyoeMo7RWODh16pUh85IgoDC7QddIoZgCdkri/+TAM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=is+xLEiFIXjoZ73DAzYLDnsbKPWkMkHmvVNbrIJQNZc=;
 b=P8axhSC0cLWBL/W4XWp+peGxpW5nT941+Q5QhSpZKs1kbz9BePer2WAMTF5eU9c8TH36eHjrxpTtqbFzYVIrdXHpfdnSGF2BLI31l0eN3YWzasmpWgLF6wvS13csI9eBUp1Siaok7x9LBdqOz+TaPpgM2q35wmlhJ/W4f/8y4aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9498.namprd12.prod.outlook.com (2603:10b6:208:594::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 14:07:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 10 Jun 2025
 14:07:35 +0000
Message-ID: <e26bc6aa-7ed8-470a-b626-c1e64b084070@amd.com>
Date: Tue, 10 Jun 2025 16:07:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix compare in WARN_ON_ONCE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dan.carpenter@linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Simona Vetter <simona@ffwll.ch>
References: <20250605085336.62156-1-christian.koenig@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250605085336.62156-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: e317fc4a-a412-4e20-dbe6-08dda8282635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3IvQzFoUG1oSXU1SnU2VGZhWC9tZm1NaVVoWGJsWXpzWEFLdnZJOEhZZzZC?=
 =?utf-8?B?VDQ2VDI5VEJ2ZDh2L1pFOXFmZEkxL3RvTzdib3A3WVh4ZHdJRzBGbFpZL3FF?=
 =?utf-8?B?N0E4SHUxTGxDbTVnWktDUzZINi95eWlFSkMzekdIc2lzeWFEOGtuNzMxT210?=
 =?utf-8?B?T3pLSXdFa0wvTW04dzNjczc3UUgxMTVhcEQzT0pkMlMwWEVOUHVvUU1kOHlT?=
 =?utf-8?B?THkrbmc4ZjBnUXlJQkYwWWFkNE9XY0RZdkxWVm9DT2VNdUkvbHZCRUo4NEk2?=
 =?utf-8?B?TG9kMDE2SmMxMGxIV0VNRVNsTmlrZkJSSDdkLzlRQiswZXRIa0Y1blhFQzVZ?=
 =?utf-8?B?ZndzYklIR1JTNUU5MlFMS1dTR3MxTjF1UCtRZ252b0U3WGlqZHBWbXpyRWRR?=
 =?utf-8?B?RHZhUWJ3czJvVlpLZTVNZzVIaXZIS3FncHhOWlR0RVNjazNMejlPWVpkZWdt?=
 =?utf-8?B?ZmR3emsrTklTOGthNUUwRitlNE80Qjk2dzQrbjE1VDBodCs4RGlsLzVtSmZu?=
 =?utf-8?B?dTBiWjhxT04yaThVWEtnckdCSGNGNnJ4WndDQmYrb3ZjYWk3WFA0a3JqalAx?=
 =?utf-8?B?UXFENEpvdzVGZGpWRmpISnhNS3YyeHJDTSt1NTdDZGtTOTJheHB5aEVZVkhT?=
 =?utf-8?B?TXhEcUFrL0ZnK3BHRVFHdm5wLytPVkI3Ni9KN3A0eVFTYmdNUFNKWCtta1kw?=
 =?utf-8?B?eE12QWtkeWNzVzRvbGtEaWkxenF5V0FyYjZENmFqdHpVaUZzZXpJZVBSRkVB?=
 =?utf-8?B?R2sxLzcyR1hHOHltbkplbEtsK0lqdlVHUG1PdGJYbUlTNTBZeEp6VUZLVG5t?=
 =?utf-8?B?S0phRERSWWprOFJwTjhxR3Bhd1grZjZxNW42Y0xrV2lhM3FOUFJaNlFmT0V4?=
 =?utf-8?B?a2lmVE1tTHk2WlgvTzZ2OVRtOTd4bWZ2VHdxTURNb2gzbXdXeWR0dkN5U04v?=
 =?utf-8?B?WUdBa2dmUU5VRlJkUk9NWVlCRVhISitiTnJsNTRjbStzd0RwUXR4QUxvV1N5?=
 =?utf-8?B?Mk1nMHZpYnY3R29ocmhKWDEzZFpFOURLa2IzWGlqdHl0amJGVkpFNkhQUURh?=
 =?utf-8?B?ZnRnUmlhd1Q2NU1MenNNZnA5MzBXSGc1TC9LeDgyNk1kUktvK0tiSzF6elhW?=
 =?utf-8?B?R0ttcHJVVGROSVA1ZTFtd2JlRUxKZy80M2lIOXlzVU5lZlRqZU10N3JtajVQ?=
 =?utf-8?B?MGxiTThZYnA0MUdQbDlYQml1MXlEQmRwak5JLzB4K2JFekdDUnlndkNFWkQ4?=
 =?utf-8?B?dTY0M09LVUJ4QzlZUDU0S21pclQxbzZYNjlLQXppV1BmK0UvanY1ZHpZc2xT?=
 =?utf-8?B?djc2MEs4cXhhaW5Tb2Yxd3hjdVI2NXR2ZnFELzhYVU9uZWxLbWhmbld1RVVP?=
 =?utf-8?B?VGhsUlFXL1VLOG9HSnNCRHY3b29TaGVjWDdVQ0t4T1ROTDkxTGgxSUhKSE1h?=
 =?utf-8?B?cTRJNXhKWU9VTXdOMVphUlFJMUhLcXc4dVRlblRBbzVUUjYxanhTRksxNGZH?=
 =?utf-8?B?dU1YU25MUmxINXBuN2k4NFJENEx0RjRrUEY5bjBXQVZGTkNQYU5DSE5HUkxO?=
 =?utf-8?B?TUNFc2ZrL2RTVjVEVTBtcHRKZXg4Z2V1cFhLVkRxUlB6dmlHM2tBM3B0Y25B?=
 =?utf-8?B?Qk91ODBwTlhLWVVoRTNiaFowai9ZKzlYSklXekdIanAvZXVTVitFRUlBbTBF?=
 =?utf-8?B?amZiaFlSQUU0RUoxY2hpVFdiYnBDbkJZTVZIaGdTTGs5YURNWHVnQmVLK1VS?=
 =?utf-8?B?aGtuQStYbVZia3YxZUp4aU1FRDhIazdyQkZKRDAwdmkwNmc5Ull3SjhBQVUz?=
 =?utf-8?B?TmpYYnNCbWN1OUpTODhsTXNmYkl2cHVML3FBcDhZaUloVFpTbi95b3BoS1FO?=
 =?utf-8?B?bmYrTFF4bnc3dUhmK2UrU2pOemVvTkpEZXBuaHI2TW9XL2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzRkeVdXbG12bzkrQzRhUUJ4YjdFRVcyaWVEYlgwWktBUzlIbkpua3d5L1RJ?=
 =?utf-8?B?em54VGJCWmRDakpmYlVaVlZydlRDSXlaOW5MUWZRM3o4UFlDcFBqbEtkU0N3?=
 =?utf-8?B?TzFqVkZBRE1kWUQxQTB2RWQ0QWFaNnEzTWZBUWR5SEUrd0FwQ2ZldkpBZnNl?=
 =?utf-8?B?OUVCNSszRXZ2NHhQSU5XS0d0NzdwaXdsU0lXSkVEb0plc1FsSjFKLzhSUHBQ?=
 =?utf-8?B?aExhV2FMbE5aQ0IwaUREMVFwQ01pVVl1d2VTclA0aHJQcEU2RzN5N2V0YXJU?=
 =?utf-8?B?blVmb2tMck5HK2VvUE9FZDdqZzV2SGdqNlhyS0pjQlZZd3ovdHdaVHYxaHJW?=
 =?utf-8?B?eTE0eU51ejhxRlhROWRQU2c1aUpWU1RNK3Q4T3R2Tm44NjhKY2Y1VFprc21P?=
 =?utf-8?B?dFgvL2NvTFp5WmxTZU40dFQvZ0NVWXpZZnBjTS9XMGdiaFBhQ0ZGZnExV3V1?=
 =?utf-8?B?Ym5xQVc1RDYzZU9TSkhVYWtwNXdtbzZZb1J2OGRpS21tOXFpWFdSeGV5dXp2?=
 =?utf-8?B?ZXRJZmMrbGd3cGkzK0FKSnVYbUxWVHRLYTBPU0tMWnoyMzRJNGxIdDBTUUVQ?=
 =?utf-8?B?TC9YTjBlRUpZd09FS1MzdFlyL0l0RWhYaFc0dVVONFBsdnFJM2NjaWVrVjhP?=
 =?utf-8?B?VjBMVHQrRzJhVmg5aUlLOWlHemFjeDlEempUVHFCTEJ1dGpzTm5uTHIzQTFR?=
 =?utf-8?B?NnhiVk5lb01Ea0lWMXlqQjhnNGlGTURUU3IxeHhlNzNvUjBqUnhyS2FUdVRn?=
 =?utf-8?B?Q2hpMFFjcUZFL3RhVjZIUmpUOHVsb3o3TmJxOXFWdGNQY3VlVFRTTVVxeGhS?=
 =?utf-8?B?M1lseEpyZCthNERTOTdncXk1eU9yeWQ3d2VwQWR2Nng2d1NSZ1VYQWlRWWJn?=
 =?utf-8?B?N2E5Nm1OaHNXRFk3M1FsdWw0N2tybkorSEpkczgwOGF3SGJWUFZwc1ZnN2Qv?=
 =?utf-8?B?YUY2NU9WWmFQTTIyejN0VWIyZ3h6ZmNqdlBXOTdsUXdWTmo3aEFmMkwwZ2N0?=
 =?utf-8?B?YVE1QmhqWWc4VTdKZUJ5RWVROU9UMVRqUVBqSkpQODA5WjBEZXpEVUd6MTVW?=
 =?utf-8?B?OG5ONjJBRVNVQ3dGMEZVc2dyN240TndpM0NvUWFGZkIzY0tRdUp4c3VDa0NR?=
 =?utf-8?B?RmNmTWlTb1lwY1FBazhpbjNrbnVydVczZmErczNTY3RuS2ZrY3VPbjlUSFBn?=
 =?utf-8?B?RW9SYlI4MjR0WlJ4aWFkTXRpdll0RzN6QU9CNjNqeWZlemVjbjZEQnpOZlNz?=
 =?utf-8?B?TzBFM1NPNzd1SVdzMFBUYk1qbENTdC9xSUxVWEJUUnRNMWs3SVRKd21haDNF?=
 =?utf-8?B?RTVOMlpmNEtHbXMycXZWRU1nZktHM1ZjM2VYdHNNS2I5OUduSEZkaU1NbmNF?=
 =?utf-8?B?NXNUYVE4cHNCTW5pSUdVdVMwcHp0Q3p6b05yRWFyRURIVXRGb0ltS1N4MEVQ?=
 =?utf-8?B?d0kvSFNxWG9TdVFVOEs1L1RaM1o0cEFuanNhWlVtZ2hWSlg4MUN5eHU1UXY4?=
 =?utf-8?B?Y1o0NmN4THkyTzBaRG16Z3liNHdITGppUC9KcDl2Wkt2NDlNNEd0RXBjbkU2?=
 =?utf-8?B?bk5EVFlzbkhha2N4UHlLcUV6T2djSkVhc0VacTlmazRGZ1hic3ZRUHYzbmNZ?=
 =?utf-8?B?YWlHZklRbTNZT1JVcTBqL2cydENvL3E1RmZqanlaZTIySTVyMEdTMGlWc2ZX?=
 =?utf-8?B?RllaTXl5SWp0SmcxMWVsVmJSR0g4c3lDZ2E5T0p1OUJMdUovVkVIUmFNT21p?=
 =?utf-8?B?eXFBbkxRdGV3OENWZytpcG9VNWhQOHQyNFFkb01CQ0w1ejlpTEpPZFQwdDVD?=
 =?utf-8?B?Y1Q0MFdkTkpSMzRsa2duVk96ckVGejdBdWtSNlRvbWRNVEEwb2dDeStBQTRi?=
 =?utf-8?B?M3VoREgxalhTa1V5d1RVT1ZDMkIvRWdOOGhkMk5vNHlYenFtNS9Od0R3Ky9M?=
 =?utf-8?B?U2NCZ3RnUkgreTFWRGtUcjM4SENoQXBtVkovTnFyMkM2NkVPZSs4MVN5eDNv?=
 =?utf-8?B?VWI5MHdvZncwNks3RE5KSXdTSFZsME00Yk1iMXhvVWd3MVZNQVJWbmdSZEpE?=
 =?utf-8?B?WGFHeEYxWXBXRnhWTzJyc000UUExUWxwN3hCSFFYWm40M3JQTHRUM2FKWUpZ?=
 =?utf-8?Q?KrQYbaDP8IDYfXJSHxAxH4HY7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e317fc4a-a412-4e20-dbe6-08dda8282635
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:07:35.2258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN/siWRzjlLsLBRnXSSl03S26A2vQkgYmI2Lywyw5DBhgdA6DMCQFsT9gXpSyEVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9498
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

Gentle ping, can anybody give me a quick rb for this trivial fix?

Thanks,
Christian.

On 6/5/25 10:53, Christian König wrote:
> Smatch pointed out this trivial typo:
> 	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
> 	warn: passing positive error code '16' to 'ERR_PTR'
> 
> drivers/dma-buf/dma-buf.c
>     1113         dma_resv_assert_held(attach->dmabuf->resv);
>     1114
>     1115         if (dma_buf_pin_on_map(attach)) {
>     1116                 ret = attach->dmabuf->ops->pin(attach);
>     1117                 /*
>     1118                  * Catch exporters making buffers inaccessible even when
>     1119                  * attachments preventing that exist.
>     1120                  */
>     1121                 WARN_ON_ONCE(ret == EBUSY);
>                                              ^^^^^
> This was probably intended to be -EBUSY?
> 
>     1122                 if (ret)
> --> 1123                         return ERR_PTR(ret);
>                                                 ^^^
> Otherwise we will eventually crash.
> 
>     1124         }
>     1125
>     1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>     1127         if (!sg_table)
>     1128                 sg_table = ERR_PTR(-ENOMEM);
>     1129         if (IS_ERR(sg_table))
>     1130                 goto error_unpin;
>     1131
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 0c48d41dd5eb..451714008e8a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1060,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  		 * Catch exporters making buffers inaccessible even when
>  		 * attachments preventing that exist.
>  		 */
> -		WARN_ON_ONCE(ret == EBUSY);
> +		WARN_ON_ONCE(ret == -EBUSY);
>  		if (ret)
>  			return ERR_PTR(ret);
>  	}

