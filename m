Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA5C5F365
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8637C10EB09;
	Fri, 14 Nov 2025 20:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4funp9oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010028.outbound.protection.outlook.com
 [52.101.193.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674E510EB08;
 Fri, 14 Nov 2025 20:18:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLgRsjQOE+vvPTF2J6x1ak5tiKTKx5+iMzvnz+rMaAPmM/3jHQLO5h4bPmC9420GD9wUgJOlPGF6MLHMrb+j4rLf9k/8Afg2Kxh1d20ihuLaHhhDhrKBrvIb1aXjZ6SJ4ZiO6fXmYTsstqACFjNGOMXnJSjxTdeDVGf/961xlwhDidTLlLYw763gArG2miQ+cFEy0mhBqoT62HbxonHnRzCZgEdy2CigU0lKLZe01d9/UNx8UTSvvOBOjyoodElm3v6A21Ls/IXapGAPOdNdU5hRK3N2Yria/arZau3JwdBy2QWvslQzkVU4Ozv5A2ORAE2baWo3RlK80UtTfqa4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0p2O3jElW4BzUEtLiteRq5isF6dfI9xLtTToJgpYwM=;
 b=Wt5dJT1HIPBQuhDQRIgb50aXknfQqAPmDkYWVeSRxw8SDK8qArHgDLCIt4cJQ2cnj0D8883jyoN6L9adcF0YhEspohzF70w+VgHi60cq0vFOuiTpqMbduT4qg6G2Jx8ULyCfRfndbTfkB4+R34FbGjwCyiwrGIrCCdMwRwoU80gUFujSEqC4+beKaeVQdnIITVz+/xiK7dRvlHFL/jNSOcmtAjqrHLk0LaUza6+hD8mbh/KjgOyk7kuZEXhqXLvSavkIYsMKKrpgPPZNcsh/VYDsRxh8XbyxOLLhSJqz7pXWSY3q2+UsVwgBC4p57w687ABYpgYcqN3lViP7K/CgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0p2O3jElW4BzUEtLiteRq5isF6dfI9xLtTToJgpYwM=;
 b=4funp9oiNqFORxL5ffIjvzQ3Fo+lTdXurKX39t/J0GWBBgicjnwn2IG/nJT76KLjM1zdwbghGMZKJJwuqmb8QxjAnrWVWAWdfO/t9MaSjv4kmVS/cL7pIYlH0J+a4ds/zpqdxI+KKBOjOfED2goBucUYPBFdGqSsWrae95qjeZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 20:18:47 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 20:18:47 +0000
Message-ID: <e2b8a446-2d49-49fc-8ea0-6b28a2aeb885@amd.com>
Date: Fri, 14 Nov 2025 15:18:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/20] drm/amdgpu: introduce amdgpu_ttm_buffer_entity
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-5-pierre-eric.pelloux-prayer@amd.com>
 <c9601cb5-109f-4968-9c3d-452044012532@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <c9601cb5-109f-4968-9c3d-452044012532@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0189.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 11181517-9e60-4a79-0b5b-08de23bb0459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFR6eXdSR05qa0taaW55UUdVMjRySmhhdC94WjNsRUplRmdYekFYdHZQQTNu?=
 =?utf-8?B?ZkN5ek45VXlwbkJ6Z1psMVIxNDlIYkRCV0NVUUh0MTdmK0lEeGxpL2JGQlFH?=
 =?utf-8?B?Nkx3ZFVjZ0I1N3FXYUR4RkQ1OG9sbG5mQm5tYkIxeXBxbUZSOXptRWgzcFA3?=
 =?utf-8?B?T1VkOU83YmZ4aEV1aWlJUjErbGZLSUgveXA0ZU8vM2ZmVGRGTlRqZUFiaURh?=
 =?utf-8?B?dysvZkJOeFIrQnpOeHhtcmZZdmx1WCtlOVNlZHdmQzQ0blYrb2FacVovTFZP?=
 =?utf-8?B?THBxb1VqM09DN1lXeno2ODJnbkJ1cFFzemtkWGo4eXhSOGE5cVp6bFlOQ2RV?=
 =?utf-8?B?N1RKcEh4azk4M0pvaGRQY3pLVGo2RnB6UHV0ZGNyNzVHWXdIN2x5U1krMDV3?=
 =?utf-8?B?c1lPa2JPMWRzYkhDNzdocUp0aE43d1g1RFVDMVNzYW5ySjdNVWdmK1FvTlBp?=
 =?utf-8?B?TXZvUEN5KzYxQjh3M2ZCa3hUMGZRVmtyL0xURFZqMndMeFhQekovdG5GZFBz?=
 =?utf-8?B?dDlWMFhSOTZHTnpUZHBicWdrWUZHbTl0UG1WM21iVFpDVlZGWEtvZ1l5ZC9B?=
 =?utf-8?B?Q29HYWZKaXl2alIvc0ptQ2R1aXcxNXduNGdOTjFhaXdoU1NIWVVEdTFEWlAz?=
 =?utf-8?B?a24vL0NJem5FT3NGUHV6emg1c3VqSWc2SEtnRkhhMmFldXRRWkZuKzVZRVpy?=
 =?utf-8?B?dE56bVVrKzFqb0lXR3h2eGtSOW1jQXoyb0Y5UXNKWkt6aUZ5OUZWc0tRZzd1?=
 =?utf-8?B?Mk12bVQxSytNaHRaRVUyRW4xbkxJbGpEdEVaTW54RHVvTWVoSEZ4T21qTWdz?=
 =?utf-8?B?d0JzSWxiZXkydG43a2RGVFkrWGVLeitoQzkwZHYvTHJIYWJ6c3dYR3RvT3Fj?=
 =?utf-8?B?cTRTY1JISXZ0aGJtcCtVUE82dll0YncrNHp3WEVGMjRXSW82VGlYTkRMcjln?=
 =?utf-8?B?MnpCcXcwZXZtTnJuUGxSYVc4aHNKZnY0UHA4M1ZyUnpOb09WWW1FRFVnMTZB?=
 =?utf-8?B?MGtGUFBFdkJVMG92VWZ4dkJCYk1Kd2o0eEwySTBzaGRYZkg2ckFmN0h3d3Zu?=
 =?utf-8?B?c0p6TjlKSklNeDdBL3dSVDRHREd6ZmVBQTU1VDV5YVVzZ3R4NHA1Wm1ub0dC?=
 =?utf-8?B?UFZ6ZWNjRzF5OEhNOWI0c1ByU3lHcWhkb3MrUUl6RGpockN1YzFMSVJadFEz?=
 =?utf-8?B?bGJqVEdJYXJlQ1pJMXByY2dXWmVvZXdOTXRNUDI5dlpnQmtiUHVrMTlhVGRL?=
 =?utf-8?B?dFJxN05nd0RyNjd6SDRPN3JKV0RKYU53dE9TVFVhYjJvWnZlWU05ZjZzNmsw?=
 =?utf-8?B?VWRpYVA4c1lLTEp1YS9xSGloYURoMlRyR1lVOVh1Q1E1eFlkbUdpeDR0S0xk?=
 =?utf-8?B?SWdrL3MwMFc4cGtjTHhFd0V1RExFR3NyaWFEZnJCbFVQRjNCcFlUa1JtaXBW?=
 =?utf-8?B?L1NiRUovK0VRRG1Dc3U4WmlWWXJ0RHVNU3Noc1BSSFFlR2NOSXYvTERrUDJl?=
 =?utf-8?B?U3ErWXhibnQyaVlVdjIvM0VFZStNbEFlaVNNWVlYTEpSTlJlT3Rkd29LMUx5?=
 =?utf-8?B?d3NaK1JSVndxSkNYeTcycjBUMDh0V3hyM0tlSTZZd3JOV3J6bWRoY1M3c3ZO?=
 =?utf-8?B?b21BWmt6T0w3S1A3Z0VyRXJqR0t2VzNiZlpZRzVVaTRKQk11R1VxQS9VK3Rq?=
 =?utf-8?B?d2EvbDlsYkYrL2taTUlxYUhsSDE1NmJsNkk5UE9VWTRDQjBHZHM1NHFvNWpt?=
 =?utf-8?B?S3EvazVMUnpOYlRCRDc3V1U3Yy9RMEJzVW1XVkVlOTQyYVo2SkZJMGZNclk0?=
 =?utf-8?B?bkhwZjE1WHBSMHhlYnJtMzlHTjFleVRHTW11NVpjZGZHNDRraXNYZVpHNHNv?=
 =?utf-8?B?SzVsQjhWRWZLc3VOVU0wZVJNNGZ6L3hybklOM3RhK3MxOWNUeUd0eWx1SVBh?=
 =?utf-8?Q?jCXAF2veBG0Q+SYFvqtE2khNpsdgKkLp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejVadGhrMzhjYnFQTDhPZXRtZVExb1pWQ2EvQjgwaFRHVlRueFdJQ2liZlly?=
 =?utf-8?B?VXVteTVJU3JFSy8rK25pK1FIYVQra1o0N3lidXFVNFZUdS8wNUZsdmxHeFhD?=
 =?utf-8?B?YmJnUk9oUHZucnhFS3NobTJ4cSs3Y1Q0Ulo5Ry9URnQzNCtXZHNSU211N21Q?=
 =?utf-8?B?REVmS25rOFlFQTRTbjRwTmxrR1Z5SUwvaEpiRmdzZjliQURzcTFwdVZXVzdu?=
 =?utf-8?B?WWxzcFpNK210RHFjNzE4ZDErVHhKK3pJSXArcmFGM1k4NzBXZnZyVXVTWDFV?=
 =?utf-8?B?bVBKcklIZjJFL1pxOVA0eXhvNmNUQXErOE1FMTR0RFpmODV5VkN5Ujg3U0pS?=
 =?utf-8?B?bkxMUHNXSjU2bUZLZlYzZEFRSzZSYlBUOEdwTWFVQ242TG1PNmhYVEJMamRw?=
 =?utf-8?B?REl1czZUY25JREZSdmU1ZjJIZk9QdUVoTjV3OFBRYm1yUEZzaHFIL3BhQnJC?=
 =?utf-8?B?Vk1pNnFQVGdIT0RoRDgvdVVnRjE5aytZWVpZQ21oemV4eHc1b2VWd3VYczFE?=
 =?utf-8?B?UTB2UVl3WGZBZzQ0eTdLK2I4VlEwbThISlExMEJVbno3dytNaGVROVZRN3JO?=
 =?utf-8?B?bDBOaEo4c0FsRjI5V1I2bVJ3bWlRdXhFTjhrenlUNE14N2lHREttTDlRV1Vo?=
 =?utf-8?B?dWcvRWwvNU5BUVVteVo2Um1nV2xlaE94a05aakU2QnlQODFuRmtMZysrVUMy?=
 =?utf-8?B?TTdmbG5XVjczMEVXMzV6YWI2M1VzR1hLaG03VVE3NHl4c2hMZzFETXQ0Y3c1?=
 =?utf-8?B?aGVRRGhOS1BWWXVld2lKMXhEQnFESUVVUVhBUDlCa2VZbzJIM0tXeDNrenNz?=
 =?utf-8?B?SWZFck9odnE3cFJlNVBFRlBKbHhBakFMbWFDODBoOWVQZ1BrRmNKS1pBUWd2?=
 =?utf-8?B?WUZySjYySHU1b1o0Tmhweldkemx6ZVM4RGhWMC9oVXNFYTNwQTdyd2Q3OGJW?=
 =?utf-8?B?UkZ2c0VZU2Nqb240QnJPWjJ5RXA5c0pNcnRIZFdLd3RRWkVveWRIbG1YVlU5?=
 =?utf-8?B?WUV0Yk9WMExmSWw5dEdhT2xXdDUyNE42Z2MzZy91THRHSmdURktRS1pPOFI2?=
 =?utf-8?B?TG45YjkyNGxuSTdXZjgybmhPQnhxYVJJT1JHQW9yZFFXUU9hQ2JZZVhKYXpP?=
 =?utf-8?B?TXUyRjFYL0dzb2lKUWpCMFZ6M1hnQU50a2JDbll2by9Cb1EzMkpqY0RTa3pl?=
 =?utf-8?B?OUJObWRsWUo0V21ZYVZ3Uy9hbnJlbE9zNk4rdzVrV1dhd3pDL2N0Sk1GRTcr?=
 =?utf-8?B?ZDhRT1gvVlZlNmpkR2tWTXNlSms3eDdQMmFMNWl6S294Z2VISUlUeG91anVN?=
 =?utf-8?B?ait0MXZwWEwzNlhiV0szN3QvVXVITmZhZlI4akVBckZ4RVdJc3BZZVh4eFZh?=
 =?utf-8?B?dkphWCs4L0J1RDFsZWVCSWhtWGUyeWJIZ2FKb24wblRqMDBMRW5PQWtBMGdz?=
 =?utf-8?B?U3Zzc3AzZ1g0bHFHMVdMTThSYThHRm5kMnhRckg0VjFTa0tWcUdMR0FQaUh3?=
 =?utf-8?B?UkY4NG9FRVNXVGRoUHh2bVdaYlNYUXIzL1RsajIzd0Q0NEJyTFJOeHFTVDRk?=
 =?utf-8?B?dnk2UUgvR1hjVWZ4M0o4ckloNWlSazFsb1NIemFHdmg2UDFCQlN3MXdFdW9L?=
 =?utf-8?B?ZkVHV0w3bkdOdDFVOE8wQVYyNzgyT1AzbXIwQkFRZ0NMRVk4NlFMajBxVzl6?=
 =?utf-8?B?ejZaQXlML0Q0U0dQY2E5Vlg2V0cySFhWVExvRmRBSzdxYldSK0hsT1dQWHhF?=
 =?utf-8?B?dmhLWUYvekFNN1d3QXIrN0xqc1BYZ2o4bmV0MGUvdG50RzBHVkt3UXRZY2I1?=
 =?utf-8?B?bENHZWp5MzgrWnpLTFlQUEx5eDZZdVhqRkIweDdJNjFFcW8rNmZvYnRGeU1G?=
 =?utf-8?B?QWc3QVJXOTRrVTV1Nnd1eEczbXhia3JvcVVBYWxCWHVmTlNKZmIzc1dXbUVD?=
 =?utf-8?B?RGRmeEZ2WUhoTkhhMm5Kb0ZMSDArUVAxSmk2VWVtWEZtVVpaeTA4Q0hVejdp?=
 =?utf-8?B?bGtvSDlzM0krNU56b21xUVN4S0daczE4eG80VVZsUkxUNEJVSlc1aXFqQXp6?=
 =?utf-8?B?TXFUK24xMEVLeFVxcUp3a01VS3VVT1FBVWtHOXJPaE9tcGxRazM3Sk91WG5I?=
 =?utf-8?Q?IIVG9XUXpmxVTBO6FwCTMilUl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11181517-9e60-4a79-0b5b-08de23bb0459
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:18:47.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAjN9dBaAJLFZ22OOlpxLRcHM4UYheu01cVySuOdRP1ZD622OUG8zB1OA/rWK1MFnKqmzfLCS1OIoYIZWwvlLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
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

On 2025-11-14 07:57, Christian König wrote:
> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>> No functional change for now, but this struct will have more
>> fields added in the next commit.
>>
>> Technically the change introduces synchronisation issue, because
>> dependencies between successive jobs are not taken care of
>> properly. For instance, amdgpu_ttm_clear_buffer uses
>> amdgpu_ttm_map_buffer then amdgpu_ttm_fill_mem which use
>> different entities (default_entity then move/clear entity).
>> But it's all working as expected, because all entities use the
>> same sdma instance for now and default_entity has a higher prio
>> so its job always gets scheduler first.
>>
>> The next commits will deal with these dependencies correctly.
>>
>> ---
>> v2: renamed amdgpu_ttm_buffer_entity
>> ---
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 30 +++++++++++++++++-------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 12 ++++++----
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 13 ++++++----
>>   4 files changed, 39 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> index 9dcf51991b5b..8e2d41c9c271 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>> @@ -687,7 +687,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>>   	 * itself at least for GART.
>>   	 */
>>   	mutex_lock(&adev->mman.gtt_window_lock);
>> -	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>> +	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>>   				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index c985f57fa227..42d448cd6a6d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -224,7 +224,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>   	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>>   	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>>   
>> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4 + num_bytes,
>>   				     AMDGPU_IB_POOL_DELAYED, &job,
>> @@ -1486,7 +1486,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>   		memcpy(adev->mman.sdma_access_ptr, buf, len);
>>   
>>   	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
>>   				     &job,
>> @@ -2168,7 +2168,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   
>>   		ring = adev->mman.buffer_funcs_ring;
>>   		sched = &ring->sched;
>> -		r = drm_sched_entity_init(&adev->mman.high_pr,
>> +		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>>   					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>>   					  1, NULL);
>>   		if (r) {
>> @@ -2178,18 +2178,30 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   			return;
>>   		}
>>   
>> -		r = drm_sched_entity_init(&adev->mman.low_pr,
>> +		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
>> +					  DRM_SCHED_PRIORITY_NORMAL, &sched,
>> +					  1, NULL);
>> +		if (r) {
>> +			dev_err(adev->dev,
>> +				"Failed setting up TTM BO clear entity (%d)\n",
>> +				r);
>> +			goto error_free_entity;
>> +		}
>> +
>> +		r = drm_sched_entity_init(&adev->mman.move_entity.base,
>>   					  DRM_SCHED_PRIORITY_NORMAL, &sched,
>>   					  1, NULL);
>>   		if (r) {
>>   			dev_err(adev->dev,
>>   				"Failed setting up TTM BO move entity (%d)\n",
>>   				r);
>> +			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>>   			goto error_free_entity;
>>   		}
>>   	} else {
>> -		drm_sched_entity_destroy(&adev->mman.high_pr);
>> -		drm_sched_entity_destroy(&adev->mman.low_pr);
>> +		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>> +		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>> +		drm_sched_entity_destroy(&adev->mman.move_entity.base);
>>   		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
>>   			dma_fence_put(man->eviction_fences[i]);
>>   			man->eviction_fences[i] = NULL;
>> @@ -2207,7 +2219,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   	return;
>>   
>>   error_free_entity:
>> -	drm_sched_entity_destroy(&adev->mman.high_pr);
>> +	drm_sched_entity_destroy(&adev->mman.default_entity.base);
>>   }
>>   
>>   static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>> @@ -2219,8 +2231,8 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>>   {
>>   	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>>   	int r;
>> -	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
>> -						    &adev->mman.high_pr;
>> +	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
>> +						    &adev->mman.move_entity.base;
>>   	r = amdgpu_job_alloc_with_ib(adev, entity,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4, pool, job, k_job_id);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 50e40380fe95..d2295d6c2b67 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -52,6 +52,10 @@ struct amdgpu_gtt_mgr {
>>   	spinlock_t lock;
>>   };
>>   
>> +struct amdgpu_ttm_buffer_entity {
>> +	struct drm_sched_entity base;
>> +};
>> +
>>   struct amdgpu_mman {
>>   	struct ttm_device		bdev;
>>   	struct ttm_pool			*ttm_pools;
>> @@ -64,10 +68,10 @@ struct amdgpu_mman {
>>   	bool					buffer_funcs_enabled;
>>   
>>   	struct mutex				gtt_window_lock;
>> -	/* High priority scheduler entity for buffer moves */
>> -	struct drm_sched_entity			high_pr;
>> -	/* Low priority scheduler entity for VRAM clearing */
>> -	struct drm_sched_entity			low_pr;
>> +
>> +	struct amdgpu_ttm_buffer_entity default_entity;
>> +	struct amdgpu_ttm_buffer_entity clear_entity;
>> +	struct amdgpu_ttm_buffer_entity move_entity;
>>   
>>   	struct amdgpu_vram_mgr vram_mgr;
>>   	struct amdgpu_gtt_mgr gtt_mgr;
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 378af0b2aaa9..d74ff6e90590 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -45,7 +45,9 @@ svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, u64 addr)
>>   }
>>   
>>   static int
>> -svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>> +svm_migrate_gart_map(struct amdgpu_ring *ring,
>> +		     struct amdgpu_ttm_buffer_entity *entity,

Do we still need the ring parameter, or is that implied by the entity?

Other than that, the patch is

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


>> +		     u64 npages,
>>   		     dma_addr_t *addr, u64 *gart_addr, u64 flags)
>>   {
>>   	struct amdgpu_device *adev = ring->adev;
>> @@ -63,7 +65,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>>   	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>>   	num_bytes = npages * 8;
>>   
>> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>> +	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
>>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>>   				     num_dw * 4 + num_bytes,
>>   				     AMDGPU_IB_POOL_DELAYED,
>> @@ -128,11 +130,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>>   {
>>   	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
>>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +	struct amdgpu_ttm_buffer_entity *entity;
>>   	u64 gart_s, gart_d;
>>   	struct dma_fence *next;
>>   	u64 size;
>>   	int r;
>>   
>> +	entity = &adev->mman.move_entity;
>> +
>>   	mutex_lock(&adev->mman.gtt_window_lock);
>>   
>>   	while (npages) {
>> @@ -140,10 +145,10 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>>   
>>   		if (direction == FROM_VRAM_TO_RAM) {
>>   			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
>> -			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
>> +			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_d, 0);
>>   
>>   		} else if (direction == FROM_RAM_TO_VRAM) {
>> -			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
>> +			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_s,
>>   						 KFD_IOCTL_SVM_FLAG_GPU_RO);
>>   			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
>>   		}
