Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D410AF6B2F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A2E10E7CB;
	Thu,  3 Jul 2025 07:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I2jLEDlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774E10E7CB;
 Thu,  3 Jul 2025 07:13:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6snmHJ/XRI9wiv8Evk0rDkxoQ07meDulh2+nJXElRE0xqpPqIkTl2XVXVNjTe4TQfFSNpEUpT44pT/AzTp17ucBG7h1WE0nZp3uV5NeBwkcCn6HnqJ2+4EYvu/XS/docc+42Ffo/eyXQIzmHx9o3hXN4GGNftyEecr/taUUOuZNQtqVmYLOK4yBoyRrJcTCh7meCJ+atG1N5WJnE5+U1kT5NBvjdB2FrCAmme65j4oRFJBSKPr/B+Ayw2m2XaeMsiMbz6RDwVQYUEQ9F8fujijdTCsceV1jRYR1wDjGGA1JTUpx4FYa7Fb4pxXvghgsfKFLCHuQpN0gPYErHJQUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyo5SZ8VAGwoxBK/g2rusJ5wpmLtZDUTkICdDDm7DAM=;
 b=wPOrMxUMvQx4Pmb0rsxtjEhKNJFgIm4+Ox+/Y88nA7ouJjgj/oqeDPOhbfIhz/+pMnmURQSRraubHns9t+hIsmLo8ZQn8Ye1kDvUaZxqkrJjhDBQARxlZJ6fIgGP5PINIK/JETfgdhjFWeVTkl5lswNJtQoXneXbbDTpGaSv5hEivIqamgghNAKe8xyDyWN0n/NnBgBxaglHQ1333gnFgGCRiKdVpCemQTyd5CSQMv1O4fO27w52Ub3hRrx8VyMy6MThJPrdrylWceYbCnKJFzb36GpzamS8N6/zuDGCX171hiGqVCkuPepYAyfDJc+oyORnKW5tlH2WwPmGEYHkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyo5SZ8VAGwoxBK/g2rusJ5wpmLtZDUTkICdDDm7DAM=;
 b=I2jLEDlCZUgkLHApx6Bb0ingRJU3GIvO8eIboUc7ht1feJLfwK5XYEd9QWUmsDWjywi9Swx4Z6ZEUz6goJUZJ19vq3y1E0WEuLi026dxwcIC8GQvR2aTG8yfx1+2Wzh4QWj4gYmzM/nhDmlOOBmJTaiBSToN56F/dSqANZfPwLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 07:13:50 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8880.030; Thu, 3 Jul 2025
 07:13:49 +0000
Message-ID: <1a65c427-e0ae-49fa-b5cb-0a67a6851d72@amd.com>
Date: Thu, 3 Jul 2025 12:43:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/amdgpu: Dirty cleared blocks on free
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
 <39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com>
 <eebf740c-2a96-434a-a114-2d168f51f774@amd.com>
 <dda50b9d-1348-4fce-a513-c20e6223d58f@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <dda50b9d-1348-4fce-a513-c20e6223d58f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae411c2-7d96-4f09-d148-08ddba01285a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2xBaWN2QnFNWkVPK0tzcU11RFpXR2NNYWJWSk8wRFVHdFR1RWN2SndGOEVt?=
 =?utf-8?B?Tk1EckRsaUlzOTFYUW05N3UrOXFWOEZHemNqSUhhcVNmMFcxUDh6L2Y2NGty?=
 =?utf-8?B?OEVtelNIV3F2eTVrUEFrN2J3ajMzTUpQeFVxYXI2RGlqYmU3QU9MdHB1NHh5?=
 =?utf-8?B?OHlVY0FkdFAxWTNhU1pMZjZVTitsak93VDljZWRqc01wNVhXa2FkWmEveWZq?=
 =?utf-8?B?aUZRaTdjV1BKbTZyRDUzRzRUR1h6eERiM0FLNTFhdWVFZ1hrYWxESENRR3g3?=
 =?utf-8?B?dzhHUk9lWTJVcTF5T3ZBMUpBRUdVTjhUOTZqNGYvMFZLbmZiY3RRWTRXakxE?=
 =?utf-8?B?V0lqa1Z5bkswTEZTVmUwTzVadm43bURUZStwcy8veElqako5ZU5uMUVmQ3ht?=
 =?utf-8?B?L05zSGdVa3NaZm5Gb3NOYTJlcnlxd25JR2tKbVgyejJYdWFEdmlma0FZVFV6?=
 =?utf-8?B?SzMzQzRlQ1NvdUliQU5GQmhyYkFmd0FKRytBcW8rdkN4WHQ1UzYreXlkdWVE?=
 =?utf-8?B?WHAycktXMk5jWWpLbnFVcUREZjEvMWRHdy9hSkxoRGhZeGFUQm9BNEt0OHA1?=
 =?utf-8?B?Y21qdlhZcFRRckhQNjdpTkZWaU5ReFYrK1RES3cwdm5mVGF6dWJuNkpZbXNt?=
 =?utf-8?B?dHZxelYzWHdRNWpvdXJWMzlFdnVrYWYvZFpjR1dGZC81cjdub3JwM0dPem9U?=
 =?utf-8?B?elhabFI0QkxFdmh6bHFHUDd6SS82bXJBVWpMOEF0OE9KNktsV0d1S2RzcStL?=
 =?utf-8?B?czBBSHdpNXZYZm5CREZtLzdWMUw2ajdKSHVOdXV1d1R5d2lsWFYwcGlBWTBV?=
 =?utf-8?B?ejFKVmZRNGNROWxzRlRaS1VOQmZIYjkvc0s0QWI2a3JiY0FESGJXV0ZiZGdC?=
 =?utf-8?B?bExLalkybUhXdGV5emF4NElESVRQMXpYRG1xOXJJZ0plNkU3SGNsb2VqeE9n?=
 =?utf-8?B?dlRWWHZpRHFTZUt2UmdJWXRXNDBZMUd5cmVId0EyVHo4dFpFM3ZlYnJsZytp?=
 =?utf-8?B?SSs0MFlOaXBlVFo4K1VKZVl0Rmt4MkNvc1daQWthYlpwSXljVjdFQ0lYZG9v?=
 =?utf-8?B?SlVUWjRkVHIyMHh6T1Q4Q3B1ZnlWdWNIdnR2N2wrMzBkVCswOUorWHd3S3F3?=
 =?utf-8?B?OGQ0TzVFV3p6OEc4SFgxY3hMRUV5QzBNQllBWC9hbGlmU3FrN3lNbWo0a29t?=
 =?utf-8?B?YWdzSVlNRFJnZTNhQVRaNVlRSWJSTko2UWJnUEFDSHFqSk12MTMyb1I1emRx?=
 =?utf-8?B?WE9PK0o5ME02UFVKZGxOZnlnTHJKeisvM0paTjFLV3o3bzlHNnc1WEh3bU1K?=
 =?utf-8?B?c2xhVVpYcjZhNnBwN2pmdkVYeW02R253UENsbEtocWVYaHpDNEhiRzVBc2ZU?=
 =?utf-8?B?N0lxNHZSVzRJRndua3V5T3Q2WEl6Um5veWsycDR5NmZFTFp0d3ZuVjFBcnZP?=
 =?utf-8?B?dFYyYkZWQVp2QStDY1VkVENRcUZSWHRNZGZtUTBZOS9Qd2s4cWVPRTRscmR1?=
 =?utf-8?B?OXFHUzE5N3dNaUZCRUxKSTJQbm1HajdYVVB3YU94UFd6ajRiRVRwN1Nia0cr?=
 =?utf-8?B?WFZrS3l4UGZockRSZU40QmRSV0RnQXl5K1psVkJUQXdOWkxVazNzZmJyaTli?=
 =?utf-8?B?eXZSTnBzV2N2L0hldlB3b2p2NVpwdXpkemJRdzJVT2wrZU5kc3pCeTFWc2NJ?=
 =?utf-8?B?Zjl3MTJNVlRCOFFFd3V5TjJUbVFIMjl3dGFWT2R5OFVtdVhISjNBblZWUUFT?=
 =?utf-8?B?UlA4L1czU1BGbnQreit6clQ0SFEzQmpmMmo5WlN3Z214ZFJkKyt2OHFXY0l6?=
 =?utf-8?B?SkpUV2o4eHVLRUMzNkxsNnNSLzYrZjNTNE5UN2Y1dWM5UEpCZFJnWnNRRjJu?=
 =?utf-8?B?a1A0d3NQa2FBaDJ6cWtsc1VzaUw2UW9ZMmtqK3RUL3llQk4vUERaSUlMVGdv?=
 =?utf-8?Q?Go6XxubybsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2dEREplR051bGhZYzRyWm9CaXBVQ2Vjck5qd2xnanpnWWZjWm1CV0laMkd1?=
 =?utf-8?B?bmtHTGRZaXMvWS8wdlpCV05qd0RhRVE3Z0pZYjJ6a1JpZlBoUTJTKzRwTzVp?=
 =?utf-8?B?aFpVQld0U05NMzI4R0tobDVKcE5NVmdoK2t0aFdGUDRXdm84THZIdG5CM0g0?=
 =?utf-8?B?cDQwZmtDbW8yQVM4Slc2U2NBM29sVlE2UnFpVTByWURYd3ZCS2RLU1JnOVFP?=
 =?utf-8?B?T3ZJeHFTeDdjUVBXRW91dkV6VjY4eHZ3VzNqK3Fwck5JNWs4M0JxZERWRkFD?=
 =?utf-8?B?VEVTQlBrZ21uZyt4dzdacFBwU3JUM3FnNEJBTGFZZHRzUVhQSDJ1cktXcGs2?=
 =?utf-8?B?R1lmSUhUdFZURHlRSmlvSVY2UHdnZTBldjU0Y0FqZTFnNmRmL2E2cEUvVzFZ?=
 =?utf-8?B?bk9UMW1vOUdiYXhEQW5UYURicHFaaTJObVNjOWU3ZmhlRU9oM3dXZXZiTnVo?=
 =?utf-8?B?QnVERENkTjY1emlsUGtiNUhSSGxuSXc1YW5vYkc2Yjk0R2ozdHpSbFhlTEp5?=
 =?utf-8?B?NGNYUGlabTN3bHo1VmpkTkF6dlZxWGtnR21NbzAyNGJJSVBzbjlsWENKZjhj?=
 =?utf-8?B?YitRWlJhNkw1QXlBZ1VUekxJLzVRRkQ0eFYxanpFZ2hKSCtzbkx2WGZWYTBr?=
 =?utf-8?B?YnBMSHdGSE9kaTU0SG1DNFpSeW9CMG03L1FBWUJqS2F0SjVNNFNPYzFTbC9p?=
 =?utf-8?B?NFJNZmlZeGtlOG1qSkZtVm9lNkdZSmN0VkwzTmNxSnJUd204bUdFTjlBbGR1?=
 =?utf-8?B?NGYrcDVOKzAxMkMzOVUwSkhKR0c4VS9WVy95UGJ6MzFFKzVIK2ZwVDY3eVlq?=
 =?utf-8?B?N1h2UXN0MHhEMDVJWHZmbFZ3OERYeHpQY1lKVmNVcW85Z05UZXpENU9XSU9w?=
 =?utf-8?B?RHI1QkZmRkR0dUVaREp6eUtWSXhTeXZadDE2TS9Nb0hMdjhIeDhQeXU3NW5D?=
 =?utf-8?B?MkcyVVVVcllsRmhpOFptU2JDTldIQlZVOUM3VHFWYXFTSFc5Rmx4MkZBTEUx?=
 =?utf-8?B?akNlTHBRdTY1TjhCbUMxWU56dkRmNkVUYnBmekRUVmJ3NVdiK3VVWmRPUVRX?=
 =?utf-8?B?TFVWenlVZktSNzRPZS9WamxFanI0NWwzdEpBemN3QkdtSkFpc0RlOE5mdjFr?=
 =?utf-8?B?dDk5M3NwUStIUDZNMGZ2d09HcDk5aHpIVTJzQWk1MVR2MmRYQ0o5Z0FraDhr?=
 =?utf-8?B?bmhpQWZZTjVES3NCYks0cHB0alV3WU9FdVNYalpqYlpZSFpidFlJb2p0VlZJ?=
 =?utf-8?B?WXJDWVlPMXRkYTArU0hNTjk1ZlBRMDNUTjlXMzU5R2ZlUXF5V3FuS29WMVp3?=
 =?utf-8?B?QTRCV2tQemc1c1BaVG5iaHdxMzlmSHhnb1NsTnVoektEOUFUVXZWMVNNV1Bm?=
 =?utf-8?B?dE1yZDYvUGZrR0JpelZjVGxGaldYUWUxSHhPcTcwcGVUU3d4MFIyR3pHRjZ5?=
 =?utf-8?B?UlhrdGxuNWJCYWFZVjRFMHh4SGRtME9OTlRXMkpka1J5RkFoektMdmVxNHdQ?=
 =?utf-8?B?YmxnR3piYStWbXF2RTc3cmZtVEtpdTgrS3d5djg5SE9YQTNpcVc3T1hITnV3?=
 =?utf-8?B?eVVnb3EySWpwbVRNMkZXTVNQVlI4bEVlaUtaaHNZV3pOYmhCVVc0azVsd29U?=
 =?utf-8?B?dFdjUStCTWZHV2xpeEVXc0JXNG5paUo0ZEZPRDZETHE4cThrSU56ZTBYc1I5?=
 =?utf-8?B?TU1CT2hKTUV1cFgwcytkWlYyUkVRcGlYMjdUL0JlWENmWFF5UXYyV0VMV1p4?=
 =?utf-8?B?cVBHRlFNS3J4U1hYcjBLR0pkeGV2bnRCd3lYRkRVa2M3R3dQTjY0S2pwMXk2?=
 =?utf-8?B?STlsTGZqdXNGbHZhTUxNcXVvVEU1SGgzMHB6Z01DVlo3Yzhoc1lYdlJWd09S?=
 =?utf-8?B?Q3pyTmxPR2huQ0M0bWwrUTVWMyt2dnJob0hzY2pLdXRQTE9NbXpYZ3lrWGx1?=
 =?utf-8?B?V2RrcXF5QXpIblBOQWNYdXdqU1J2QlgzclhlV1NrOFJlbm5JSytCWEJsQUYr?=
 =?utf-8?B?RG5pQ3JHdEpNVERhdm5lOTd6MTcwais0SHNucEI2QWhmVi9FUGd1Z0hub0lm?=
 =?utf-8?B?L1BvS2hkTURoS1lyY1V0cDQyckR1cC9FeDlIYlVZUy9PcG1PUnB3dm1iSkYr?=
 =?utf-8?Q?ewTUNr6QXY2Wrcqo8YfhGkHHs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae411c2-7d96-4f09-d148-08ddba01285a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:13:49.4767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOsCz/TNKPESD0UH5sYY0vEnrSODcjMPuyMmAbYWYIsqg5O5/L7XUkgfd5kMuC8E5YZB8d2lBGuUSZzIYDbNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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


On 7/2/2025 7:11 PM, Christian König wrote:
> On 02.07.25 13:58, Arunpravin Paneer Selvam wrote:
>> Hi Christian,
>>
>> On 7/2/2025 1:27 PM, Christian König wrote:
>>> On 01.07.25 21:08, Arunpravin Paneer Selvam wrote:
>>>> Set the dirty bit when the memory resource is not cleared
>>>> during BO release.
>>>>
>>>> v2(Christian):
>>>>    - Drop the cleared flag set to false.
>>>>    - Improve the amdgpu_vram_mgr_set_clear_state() function.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 1 -
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
>>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 9c5df35f05b7..86eb6d47dcc5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -409,7 +409,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>>   		if (r) {
>>>>   			goto error;
>>>>   		} else if (wipe_fence) {
>>>> -			amdgpu_vram_mgr_set_cleared(bo->resource);
>>> Mhm, that looks incorrect to me.
>>>
>>> Why don't we consider the resource cleared after it go wiped during eviction?
>> Modifying the resource flag here doesn't go into effect until we call the drm_buddy_free_list() in amdgpu_vram_mgr_del(). This BO will be cleared once again after executing amdgpu_bo_release_notify(). With the new implementation, there's a chance that changing the resource flag the second time would cause the WARN_ON to occur. Hence I removed the resource cleared function call in amdgpu_move_blit. Thanks, Arun.
> Something fishy is going on that we don't fully understand.
>
> What happens here is that we move from VRAM to GTT, clear the VRAM BO after the move and set the flag.
>
> When the BO is destroyed the it is backed by GTT and not VRAM any more, so no clear operation and no flag setting is performed.
>
> It looks more like we forget to clear the flag in some cases.

Got it. I tried to add back the resource cleared after being wiped 
during eviction and verified it, and I didn't observe WARN_ON messages.

I will update the patch and send the next version.

Thanks,

Arun.

>
> Regards,
> Christian.
>
>>> Regards,
>>> Christian.
>>>
>>>>   			dma_fence_put(fence);
>>>>   			fence = wipe_fence;
>>>>   		}
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>> index b256cbc2bc27..2c88d5fd87da 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>> @@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>>   
>>>>   static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
>>>>   {
>>>> -	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
>>>> +	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
>>>> +
>>>> +	WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
>>>> +	ares->flags |= DRM_BUDDY_CLEARED;
>>>>   }
>>>>   
>>>>   #endif
