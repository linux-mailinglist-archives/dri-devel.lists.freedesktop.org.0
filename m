Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EBCAC3CA8
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8B10E2DE;
	Mon, 26 May 2025 09:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GftKnXlL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDE110E131;
 Mon, 26 May 2025 09:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYsff/wSNpW6AtQ2lFJbHkM6ySvQvSsYQw5QjS2kQXGSmDbXZR8K1oNrQn4wwf+VOIG5gO3eWQ35INcON3kQlN3itiFiXRjk+1YAeoVaDExDq6jRESJs1e+G1i7rnFWN3hbJ+Wpw9N1rO4J+nVLyJIOR/86/Dpm9rzm6uU+5OIP8zU94f8GPdp5GrjwVsGlbfU2lx6IW8DbnOrL9kh652xuClTZ08eXPF8rK5dmTKjC6decUCEH9s7Fy9vbL0UIB2s59a18x81ytd5vUiJHNDQo7B85LwLuY7ih9BusoO1CFePvDyQA7SrPvcwNdpJoJtTM3QdZQBdAq1vxWuzhH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPQZ+D7iYW5dqPMP1P5YTX8MJyrOIcp8aln+b5MHL9U=;
 b=NbfEVQEE/GNI9u1Zl8d6nRkd8MRuTRB2c84eZDDq0ks7eHijaKpddaBSKae9ZAcNZIKZQnXc1OjtdNUgpI6cM2i9VRLKnEV/gDQgW+yGgUnR3tK6mmy/eMBsXmS6ZJhdbF7jfnCMrC0j958qq+rEYr6Q0GZlVxZ8C2Jdd3mRZInQGgrYnYlO+HRUNbjLti6NViGjWc4F5LU5gSi95vTIu+/55++dK8h8+oHrd39Qaswde1SLE4tpWX5RenpMpD/tv/5GWkYGvllsN52LN0esrBnr0As//IC0o73x2cSiu6eVvxGQkkjclswD24VWuL8o9VkFMM4ZcY6L4ELfCUjW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPQZ+D7iYW5dqPMP1P5YTX8MJyrOIcp8aln+b5MHL9U=;
 b=GftKnXlLVasAzlI5A9M2p12/NQGH0TFrVWvf9IIXbGGcbCtPcFVchnJucWAlO4qGIK6HifFaiyJN0Tfo8LA0dIk0JkEAyt+kNjxK+IRQmuz18ywBfVMJ0tlLJDdDtMU6ugsEM12/edr4RuGsuM70SoTBbckYrJ70qUflgDMiodM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 09:25:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 26 May 2025
 09:25:12 +0000
Message-ID: <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
Date: Mon, 26 May 2025 11:25:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: Danilo Krummrich <dakr@kernel.org>
Cc: tursulin@ursulin.net, phasta@mailbox.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDCDJ-sK9rRI6wse@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0313.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: f7eaba13-6a32-4e70-c1a1-08dd9c373728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU9yeGx0L0JtTHRGYjhVTFBpMTF3aVRsZTE2VlBuQjR4RXk5WTM0QU8vY3hn?=
 =?utf-8?B?R2NsMVczcy9jS0N1T3NRR0plREVOcU9OQVR4T0RnOWxVYVVNYnZhL3dyRmUw?=
 =?utf-8?B?bGZGUzhPRTY2MDFWYWJudk1XQTBQdmxOSnBLSVhKYXhYUS9WYXFBdVd2Wnhl?=
 =?utf-8?B?UWxCbFpUTHU4TW4wMURFWktWQlk0T1hvVjhpY2ljVnRNV21tMjFPSU95R2lN?=
 =?utf-8?B?K0JyWGluNEZQcVRWQ2RpcjY0a2FMMVl6YzNRR1g0TmdxNVFJeTFQWk42dUo5?=
 =?utf-8?B?ZXpFQjBOUDU4RmE1SFhuQkVOODFqUE1VbjVCWkJacXJEem5tN1RFWXFtV1k1?=
 =?utf-8?B?RzFjL3FMVk1ST3FzQ3ZReWQ0Wk5iYXJ4ZzhBbndJcE9NcDNHQ2NLYjNsdlNB?=
 =?utf-8?B?YWtSRkZ4Q2lZVFNiZWRnTUIvTThVeEZJTjJEZDhhVHFRSm5ndVRleElBUHJz?=
 =?utf-8?B?QlJKRHhzN1NpbG1iaUxkRzlKRjZ4RWx2MjcwSDBPSE81WTVxRElFL3JYL25W?=
 =?utf-8?B?R0VGNWZpb3JLZTdHdmg3L2xxV0FFLzN5cDc3cngyWmJkUHh4YTIrdDAzRDgy?=
 =?utf-8?B?MXZwTllua0lHRjVZVzFBbWZXTDF1ZmpvWU9CWFdQMVlYbmxrVnNRLytOTHpD?=
 =?utf-8?B?dzhKT2hSYm8vYTdKZXFBcWR5am5jaDR3Yk5JSGFzZDd5aGh6WjBwTlpTekpI?=
 =?utf-8?B?Yklnc0xLWGJUNnFxblV0UThVNUwwN29ndjlSYnhpZFdJSWMyTkIrRUdPZ2pP?=
 =?utf-8?B?TFdacUxKUkpTSGRISysvUnM4UUlxaTRhUzRBcnFTeEZnMUYwOW9adlVraStT?=
 =?utf-8?B?OEtyOXFLQUhuNHpWU1pER2tkZVg2eTRXS2xCdlhENzRBVk1qU1d5aSsrYW5G?=
 =?utf-8?B?QW8xYzdkWkFOWVAzLzEvUFB1aHlodHN6ZjlMSzk5V2xXWTJFRlZEVFdpcTZx?=
 =?utf-8?B?ZURUZ3VtQlgrSzJyZHhHdFF3NDBqVW5sM01XNE5TYVA3N2E2WjB3Qy9UWFRy?=
 =?utf-8?B?VmhLZ1h5Q0NGT3F5NnNTaUhOZzBxaGcxWTAzUmJZRFMrVWlDcjg3N1ppdlh3?=
 =?utf-8?B?eGpVaEJxZVlMSXREbnZKV2VBQTdjZ0ZxNG9ac0hPdEFQaTFwU0Vac2pwNjFz?=
 =?utf-8?B?L0VwSmFabUFzb0xwbkZBN2FFUHQvVWZ4M1RETmdaWGoyT1FHRlNodE0zNjFU?=
 =?utf-8?B?SXF5dTlrWG9OZ0hCdGQ1cHBzdmpuQXI0NFhvTHBOaFI3SXd4WWIwdllncGFu?=
 =?utf-8?B?TjlTdUswNFZUTVZHTm00c0dMcWUxMEUyeW95ait1WWgyZC9qbk9tcVZTOXIw?=
 =?utf-8?B?SE9aeU1sQkNNdEtlTlh1b2NXeFN0QUtYLzFSclNPK1NOSFhCNm1hSzY1UXhP?=
 =?utf-8?B?bFRmb2oyTm5TeFJmc015bGRKMjZzMm5RT004bGFVVEZPdC9MRGo4alptNTd4?=
 =?utf-8?B?blB2SmQyYUNMRlBZcU03TFQ5V2x2RVlCZEJOaW9XL3BqZzBLVkhkUnM1Zmgy?=
 =?utf-8?B?eU1kZ21jRkFkeGZlK3N3Q1lGSGRWMTFObVNkd0hrWDhucHRoYnIvdUcrSjFa?=
 =?utf-8?B?RHhHK0JyaDIxNlJUUHdJNzRMMnZHQ3IrU1UyNEkwZXd5MWZtclRVQXAxYjlq?=
 =?utf-8?B?K3RDVnZ2VndaWFVkNk95QmJtVWVHSU1OUVprYmNHUzJ3ek1WWXFDZE9aRnkw?=
 =?utf-8?B?SWdIYUN3bmVpWmZDM3NMUFY4RVYrMXl2SG9DbzJYeXdoNVlobWhmamxLNERr?=
 =?utf-8?B?RTBxazRsVlRteXE0dlBQTytQa0lwVGZOTnVaOGhweW1zTU90MHJvSVJTMGp6?=
 =?utf-8?B?NmtnZ2M1SEx1bm92VVZwcXF1RWprcER4UjlGSHhMTmV2WVZMbmp6U2oyd25S?=
 =?utf-8?B?MEx5V2loTUoreUk5Qk9qQ0ozRTM3bVUyLy9kMndFdzhmK2NKTWlDa1hGTTBR?=
 =?utf-8?Q?KVZlD+FjieE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0Ztamw1RUV4eGN4Z2NvdkVIaFpPa2FsQkFZK0V1NmJHWEVmZW5pYWlXYURa?=
 =?utf-8?B?VUdSV1VVMFFyRld1c0lFajFMMzZlVlVvRWt3UEk5VWdmYTJ1SW85RTBFRWxV?=
 =?utf-8?B?M2k0cTNlWnBxL2ZKcTJpSXM3bE80a29XOUMzRnFNTCtDcXo3ODI4bjA5aTZ4?=
 =?utf-8?B?UFQ3czdGSnVhRnNYR2NNQk5tQXMwVmRMV2Y0c3k3Y3FLbFBIdkRXNmpDaHhr?=
 =?utf-8?B?bmpmQXVmNkRMQXFqNXNrOUV4d0h4WXhtWmRlelhNdXVnbTFMM20rU0poWnpt?=
 =?utf-8?B?QTNyMnNubTlxOFJJQmpjbjJDb2h4bmFFNm9yRTUzMDZObHpIZXQ1NGdUTHk4?=
 =?utf-8?B?OUNncU50OFhTbGhWNWduNHRBZjZwUzg4VGR3OVo1WlkzM2ttQXIvQjVPV2Nq?=
 =?utf-8?B?aG9xNkk3Y1lvZ3V0bitFYUNLMEJtOEIrSE15WlI4bmRiQ3ZTN2lLY0FnenBM?=
 =?utf-8?B?VGZYL0V3RlZyTTRxbGladGdyV2EyM01KWldjdnJGNUlsSGFNWWE3ZTJXM3Vz?=
 =?utf-8?B?QXNFS0c4cEVnZkdVLzFNTW1wbmNaZDhIZnpBRGpWL2hpRHlXYWJ5N0lwMHMv?=
 =?utf-8?B?N2JpU1I1d2dtbGU1R0hVb21icmpsUVpmWEFGR2RNZ0lZL0RlQU13VVdWdmYx?=
 =?utf-8?B?ZG0zZTNsWVFETW10bEIvK3NxWElIMkxSanhFVENEMHl0YXk2NG05a1FSYmxC?=
 =?utf-8?B?SGdIVmVMYnpnalViTHQ0Wm1OWVZXWHBDTXdvYlB0S0xvNEZtYmtiWC9nL2tv?=
 =?utf-8?B?czFJQVdpOGZDTGdyYWFXbFNzWFFoNTY2WEEwUUpIS1pvd0xwMmdtcjU2eHI1?=
 =?utf-8?B?eWlJNk9zNFJSODFxemR4bmZxSFJXQkN3NjVLaVNXZmNPOFRzMzZIUjFkSUUw?=
 =?utf-8?B?R2Qwb0ZxWDRDWHM5OGlhY0VqOFYyR3YxeU8zRVlMWFhHSEVvd2RSenZYM1dL?=
 =?utf-8?B?c2QxdGhiY0E3WDNYOTFJd3Vzdm5YbnVua3RCSHh5dFZhMS9EZlRwS0pPdkkw?=
 =?utf-8?B?RjBETUkyMnhNWXI1OWRvV2Fma2o3bzIzUWhjOW9sNmlSaHhaZlBTVEFyUVJD?=
 =?utf-8?B?K3dxWnhYRE53MFZFWmpQYlhEVlpUUzFiYVdWc05TZjQ0amJlT0ZjQjZmby82?=
 =?utf-8?B?bXR6WitvZnA1eFZSd1F3NjZ6MjlQNDduZXpMYk1IRFFMdjBTUktoaGlyT09a?=
 =?utf-8?B?cjBBbHduUDdYcFQ1NFdKVUhGc1VURDlzdnJvVFFvamlWdUdKZEM2bGIwSHB0?=
 =?utf-8?B?bXpkZ29NS093YTBtS0NGYmRQOFJwdUI2S2lXM1NGMTVuOTlsNXVGZ3ljRGZk?=
 =?utf-8?B?STdWdVpQTjM1Q0NZVFhDWlJlaCtzeXZYL1dDQm1jQW12UVcxRnQvbHZuQjZr?=
 =?utf-8?B?Sy9rWVU2OEpRaFVPMnpIcmV4RUxwM0JKdU5jNmhWTTBIeE9Kdk84eEl5UEh0?=
 =?utf-8?B?dW1ZcXAvWTM0UUQ2TWJrVklRVzhYSk0zbC9UZlB1c3ZGckJuWDgrTjVWVGl3?=
 =?utf-8?B?NUdESWExazZObWd3RTJWUzF5Y1BYMjh6ZDNFWlhieWl0T0hCZ29sc2t3VWIv?=
 =?utf-8?B?bUpOUjZEYnZZUFBjNldsUEV1WVgzbkNPLzM1WlNQMzlPY1hhUk5EbVZIcEJL?=
 =?utf-8?B?N0ZSQWk0bmNtaSt3ejRSaVBiWjBBZ0pzZlV3eXVXRFdqSUJTaTFwMnYxNGhM?=
 =?utf-8?B?TXFQK2t2Q3AzdTM4ZFZKdWRVQlVtVGdtK09PbUVyUjRGU3pjT09LUXNrUkpG?=
 =?utf-8?B?SVlaK3NYcGo3Szk4MjJNemxpTkI1aG1KRzlZbTEzZkwxaUpzNmhvbUFZVm96?=
 =?utf-8?B?Ri9jeFQrdzgrNTJoU1BNVGdMak00UTBzTmZpcXg2TUJwN2hzQlFvNklrZHIv?=
 =?utf-8?B?bFFORVFEU3BBTEx1N28vV0dRcTkxcUFWRFdCaW1lR2x2dlJZZjVQMnh5dXBQ?=
 =?utf-8?B?Z3FjbTBPQjl0K1Y2RDB4WUovYWgxN2JJRDlhWFZaVUFpbjNrc1M0MXV0RGlr?=
 =?utf-8?B?eGFqcURmRU9YOUZHUERRZTVvUHNaUmlDZm5lc0JiUXIwbnFuc0p6eU9XVGor?=
 =?utf-8?B?cU5MY0RVZDZzcmxnT0JkMi93TC9VYWlOMWtRK2pyQmI5azd5Y09LeUo4QSs4?=
 =?utf-8?Q?drhU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eaba13-6a32-4e70-c1a1-08dd9c373728
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:25:12.1626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nefHD5kpJkWV8mJ3AzbofhCK2OyxYfapR3+hsd7cJHIT4wXqMfxzIkQRxFrucDZp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484
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

On 5/23/25 16:16, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich wrote:
>> On Fri, May 23, 2025 at 02:56:40PM +0200, Christian König wrote:
>>> It turned out that we can actually massively optimize here.
>>>
>>> The previous code was horrible inefficient since it constantly released
>>> and re-acquired the lock of the xarray and started each iteration from the
>>> base of the array to avoid concurrent modification which in our case
>>> doesn't exist.
>>>
>>> Additional to that the xas_find() and xas_store() functions are explicitly
>>> made in a way so that you can efficiently check entries and if you don't
>>> find a match store a new one at the end or replace existing ones.
>>>
>>> So use xas_for_each()/xa_store() instead of xa_for_each()/xa_alloc().
>>> It's a bit more code, but should be much faster in the end.
>>
>> This commit message does neither explain the motivation of the commit nor what it
>> does. It describes what instead belongs into the changelog between versions.
> 
> Sorry, this is wrong. I got confused, the commit message is perfectly fine. :)
> 
> The rest still applies though.
> 
>> Speaking of versioning of the patch series, AFAIK there were previous versions,
>> but this series was sent as a whole new series -- why?
>>
>> Please resend with a proper commit message, version and changelog. Thanks!


Well Philip asked to remove the changelog. I'm happy to bring it back, but yeah...

Regards,
Christian.

>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++--------
>>>  1 file changed, 20 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index f7118497e47a..cf200b1b643e 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>>>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>  				 struct dma_fence *fence)
>>>  {
>>> +	XA_STATE(xas, &job->dependencies, 0);
>>>  	struct dma_fence *entry;
>>> -	unsigned long index;
>>> -	u32 id = 0;
>>> -	int ret;
>>>  
>>>  	if (!fence)
>>>  		return 0;
>>> @@ -883,24 +881,37 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>  	 * This lets the size of the array of deps scale with the number of
>>>  	 * engines involved, rather than the number of BOs.
>>>  	 */
>>> -	xa_for_each(&job->dependencies, index, entry) {
>>> +	xa_lock(&job->dependencies);
>>> +	xas_for_each(&xas, entry, ULONG_MAX) {
>>>  		if (entry->context != fence->context)
>>>  			continue;
>>>  
>>>  		if (dma_fence_is_later(fence, entry)) {
>>>  			dma_fence_put(entry);
>>> -			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>>> +			xas_store(&xas, fence);
>>>  		} else {
>>>  			dma_fence_put(fence);
>>>  		}
>>> -		return 0;
>>> +		xa_unlock(&job->dependencies);
>>> +		return xas_error(&xas);
>>>  	}
>>>  
>>> -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
>>> -	if (ret != 0)
>>> +retry:
>>> +	entry = xas_store(&xas, fence);
>>> +	xa_unlock(&job->dependencies);
>>> +
>>> +	/* There shouldn't be any concurrent add, so no need to loop again */
>>
>> Concurrency shouldn't matter, xas_nomem() stores the pre-allocated memory in the
>> XA_STATE not the xarray. Hence, I think we should remove the comment.
>>
>>> +	if (xas_nomem(&xas, GFP_KERNEL)) {
>>> +		xa_lock(&job->dependencies);
>>> +		goto retry;
>>
>> Please don't use a goto here, if we would have failed to allocate memory here,
>> this would be an endless loop until we succeed eventually. It would be equal to:
>>
>> 	while (!ptr) {
>> 		ptr = kmalloc();
>> 	}
>>
>> Instead just take the lock and call xas_store() again.
>>
>>> +	}
>>> +
>>> +	if (xas_error(&xas))
>>>  		dma_fence_put(fence);
>>> +	else
>>> +		WARN_ON(entry);
>>
>> Please don't call WARN_ON() here, this isn't fatal, we only need to return the
>> error code.

