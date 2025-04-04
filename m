Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF4A7B911
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008B10E1A5;
	Fri,  4 Apr 2025 08:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RwJ5gwlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0390210E1A5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1g/X8nTOaa051jiSUHzep0ehm6Eu8Bu7LGS3cyW61jy0IEwgxsAL8wb/yfn6/6XtEZ5kOtHX3d34csLXUrzRVmiN5IHFLyfwbTZIGIrQK8JbHlmccsUdD/+Hrmmzl6MPlcvV3HcsKFlAhNuJYmEVEmg4btINGxW5q5J1btn8uzfT1gQMCRr7onlSPbqUguTSuwIMD1Qv9kUX7/5gAGctAeeoIs1kIKGnHfNCtrKvNT6adZkg4MwO22iLKMaHfFDU3J+BgiL5rba2YPreM4KmkI0rm9yOA7GdZ0aE9ilptM47ztwvkvnHAQNDkrEWsEyH5RSBdzAfEJAeh2T3eKbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IahQYpUaTjdTl01s9AEYdaBJOStptk6H9xJm4InvGZk=;
 b=I4Jd+I1zdMDf2xgXk0cG1SyTobmJeS+rAzlH+Feko+OBhKOLqS8mc8SD1OicVyKXLPzUkbkmBR9Tb5nqJ2n9QPpI3VJLr+F0LxMpJzEYNSMgUiD6rJuyrztnx2cgrqlLUtEqoXwm7WbxQKNeAowsNbNJzc8e+3IDH7qK1NeqbyWhhTjj/5SFOszP7nr+oGddAB/9ES2gISFR2uLOubzz2Jr8rAUBafkXqI2RWFkzBvH5BwrZb+RdfEXdlSYpYXtMCVnYbwgtRaaTA3WWQ1mQnyhe72a5BKcfEj9Gs5DgGzEFV8FFihs2rQ+q0FcsWHdUQzaStqTVpMKgZzQCuSRJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IahQYpUaTjdTl01s9AEYdaBJOStptk6H9xJm4InvGZk=;
 b=RwJ5gwlIp+e6SQVrWZzdTroF9Xv+Vh9TQnI9OeY1D6Dv4JT+Zz3s66sAxIRLJLGLyV/7bVVq1NP14ch4SeDEE4IIggQRg9y0QIg6AIhPLHM2B4J2EXpeR8pppUr5lL9Xbejz5r6LX+AMsTzxmXU8fpPiJyDIgPXaJ/W+s1ws/xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 08:39:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 08:39:58 +0000
Message-ID: <aaeb5ecb-5ad2-4acf-a48d-e24e29f53bd5@amd.com>
Date: Fri, 4 Apr 2025 10:39:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
 <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>
 <03c838ab-3bc8-4e5a-9f0a-331254701b0c@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <03c838ab-3bc8-4e5a-9f0a-331254701b0c@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: c7612ca4-2352-4bf9-6061-08dd735447de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZJa2ZmTTRJeFZPREFqZjRhOUkzem5VUkZKdDUwVXJ1M1ZEdDNyK3NwSE5w?=
 =?utf-8?B?MUl1ck9nMUc5d1FaUnBuL2lhV0dvU3BYSnB5cW9iQTlabG5lbm5XVlkzZ1NY?=
 =?utf-8?B?cjNqOFljemp4TW1WVUdpdU1RK1U1N0hKN3pBam4zeEp2emxWN2JleSt3S3U3?=
 =?utf-8?B?OC8xcVc0SjZndWZXd3lGVlpaZEFTZzNxcDZidnVWZjI4UGR5L0tmdUVsbFY0?=
 =?utf-8?B?UFpML2xOYzF5VFlnMklSc05HVlJtVXpCZ21aWm8xOGFlS0VmNWN1bG1ON2tB?=
 =?utf-8?B?NDRPZWRWc1huNEFxUDcyenNhUC9LU0s4UXF3OElGbVdnd21HVVJqWHpLUUIr?=
 =?utf-8?B?TWY0ZzFNQWI3a2gyYzBRUjA3Qk9lakhNU05FK1NIbTdRQ0ozMkNLeTFOOVlq?=
 =?utf-8?B?bzdGOC9yMndrZ2tGVXF2QTNQb0lkNjhQU1pyWERDT3Y1b29JbnM0QUxmSUs3?=
 =?utf-8?B?UWRYSXFhWnp0YmVVLzMxVFNLbmRZekNwU0E1M1BSUkFhRkIyR09qb0VOY0JM?=
 =?utf-8?B?V0hmTUVXQ2RFQjBINW5EYWZaM3hsRGMzczFkd2ltN3ZpRm5RSlFPU1ZVYUdU?=
 =?utf-8?B?d2trUFQrM1FzVUZvNFhiczNsKzcyQ2VNU001ZTZiRjlLRnMxb01jcDBZVEFD?=
 =?utf-8?B?cHA1ZzlMSGpIN0R6RjNLeUhUNzRUMGpyQm9nSnIwL0o5b2d3VElrS3hqTTIz?=
 =?utf-8?B?TUlKNHh4RVlHRFZNQVY4K21RSUxBZTJRMGM3VjFaN2NTN1N5UFRvVGR3Z0FR?=
 =?utf-8?B?czU5V1dWSFJoMUYvL2hLNmVYaWZvZGI2OHFPeFhLdG5xbmdiVDBxZnRlWEVw?=
 =?utf-8?B?bURBUzlHdFg4WlZKbkRtQk5TUTZkZVh0TFlmSDF1UUlDblFKbHRaSzRvNldU?=
 =?utf-8?B?MjQxNWhwd3hkUUdTK0FMVE0rZlUycjNoYWxha1FxemdnQkZpK0FzbzlPZkl6?=
 =?utf-8?B?ck52QjUrK1ZMY3BFS29jUkh5WDhpNGNoUjgyckpjYWYxa0VyWUg1cWhqNmtI?=
 =?utf-8?B?SkRMbVByMG5JbnFvOWVHcmU5QStRYmtjZEJ3Y3AvYU1JUmYyaUJuaHlPSGY3?=
 =?utf-8?B?T3h1a2pleTNHRzM3a0Q3V3RDWXU2NGFSL0RBMEZDRVZZU2lJeExiOGpzUThq?=
 =?utf-8?B?bW53OGVZVklCZnU4cy93OVVhbkR5STE2RUFHcWNJYXYyQkgyY2RMWEtwUnE4?=
 =?utf-8?B?bitiUy9hUWZzTGlrTk9ES3BSOFBjMUlLUk9YS2hET2ZiZGpTS3ZRNkgyQStH?=
 =?utf-8?B?R1FJVU8zeDdwTGVHNXcwZnBmRmtBYUhXL2JwcUxMaHVCNnZTT0tRR3FHMmVK?=
 =?utf-8?B?ZVVxUHF6Qll0ampBYTl2MVg1WDBuR2xiUFlubThKNXNDaFZmYVJBQjNObHIr?=
 =?utf-8?B?VDUvK2QrNEw1QzdJaE5RTHR4S1MzSWR5K3gwc0dIQUlYQjl3eDYvd1hVQzgv?=
 =?utf-8?B?cy9TNDRuVE82S3ZyRzdpeHcwWUVaNU5WN1gwT0pOd0hEdjZTRGUwQnN1emE3?=
 =?utf-8?B?c20wYVIwSDc3NjJxVXIyRFRzOHMxeFlwbkFTSktiT095RVdTOE9uNHk5MXo4?=
 =?utf-8?B?bVNJcjF6SzhDWWsvSmpRNEUvK0hMbkppV1QrSFhIQ3BpeWNzaEMxSXNTMi9T?=
 =?utf-8?B?Snd0TFpaay9oUzJ3UThybTBoc2NIWTJwZVhCejBXRkxsNVZqTjlwR2F5S1Vo?=
 =?utf-8?B?bTg4aDJkM3lmWE9SQk1FUnJSOTFtVWhBak14V3RnWUFyQmdzdDRGN1k1RXlO?=
 =?utf-8?B?ZndYOFdnckwveDZBT0pNeVpCQ0JEOTMrU0xhVTBqdFJkbzBDZ3JTZFNvV0Iz?=
 =?utf-8?B?WWFwK290UndBOExJSENLOFJ2cjNGb2tsYmxaNFJQUjJFMC8vTndKejB1bjlL?=
 =?utf-8?Q?pi6kX0b7nt7P6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpBM2JhdTM1czE0TEFHNGZNQzB0YlB6cE0ybmR6NTFTNVFUM2ROelJCeDNG?=
 =?utf-8?B?alZoUlc3TUUrQ0luQjNNZjFtVTMyenl0YWlQSUlMNFR1dFF4RVVZVm53TCtk?=
 =?utf-8?B?NUJndnBBbDdSQ1JyMW9EL3VBSFlmS1JRcTMva2hEbkw5YTJyNFY5WjZMZlFK?=
 =?utf-8?B?a2UyeVNmUUdPVHRkY1Zma1R5ZFpQa3NGV2R0bkZoZFptSlYrd1NwSU9UTDFh?=
 =?utf-8?B?eTdKZXhpMnRpQmZhbnpNSml6RXVWaW9BcUZ2M3NxcUJ1cXpCOGFxU2lsdTVW?=
 =?utf-8?B?N3Nob2hOeE5sa3FwL3h2c2RMd1hzek5iTHZKK2MrY2JjMndNY0NZSFVCNUp6?=
 =?utf-8?B?endUV2VYZmdWNmppT0YvRXVRWGwzR2Jtb2ZUc3d5dmhHVmRoWlhET2lyTDJP?=
 =?utf-8?B?UXVjbEE3YjgxNTUyV0k2LysvcjlVdksrSmRSQS9WWER0bCs3S3hiYXVGTnJ6?=
 =?utf-8?B?UmFPOG1HOXlWc1V0ZzNtT2lqK0tiMnQrOWtMQndic25iVVQ3eCtTWUNGUDZr?=
 =?utf-8?B?MXlZZW1FZTNrK29HNW9wZUhhTnRGL3NDTDh2ajQrSmI5V3kyZkxRaUF3RGVL?=
 =?utf-8?B?ajVhdGxRUzhoM2hsUmk1TklXMU0zS1JTQ3Fwc1BYaUEwZDR5dDN4UzlzVTFy?=
 =?utf-8?B?Qm12Nkp1WDZ6Q04vTkxlUWduTG83a0M5RWR0dTdTV2QzSGhBSVV2WERaUitq?=
 =?utf-8?B?TkhJWXk0Si8rSndqZk9na0kzalpkU3J0Vm1YMEFSVkx0ZlREdjJaeHNSU0tu?=
 =?utf-8?B?V2U2T1I4TXIwckVSSDBzZlRzMFBvK0I5QXhXTS93VlFuaHhTQVdxVHkzdlMv?=
 =?utf-8?B?WXRUai9lYkhWK3UrVnZ2SHRXV3VRZ1Y0NlJFT2pTOGlqV2F6MU96WU1KbUs4?=
 =?utf-8?B?RWVpYXpOYjBFdHl0VUE0RVd3RXBkdVljdXdNSXBKNkNPVGhXenZLalNFdVZL?=
 =?utf-8?B?SFBPQmVRamoxalhXd1Y3Z2hCMEdqWFEzQVJNT3lQRkFuSElHUDRONlk4TnRV?=
 =?utf-8?B?M2F0Z2dxME9pbG1ISDNkclVPMUhZTGlDcFNiRkNsdHhkdFdBZDA2NDM1NXZ3?=
 =?utf-8?B?bUROalBicFJhK0lxOGtFWUZsUks0ckdtT09SUWRJVDBENk9IVE5JcWtXRG5P?=
 =?utf-8?B?cVFpUENzOGViWC9DdDFUQUtQL3hXaVpKcHNoU293S2p6VnRXaFNBRE5ERS90?=
 =?utf-8?B?djN1WUFKVEJpLyt4UUpZN3lBb3NJK3FOanRHMGl4RXE4MGE0V1hOWHFQVFNW?=
 =?utf-8?B?NDRwc0kxdzhJWWNHek1OOTAwbytjT1lkRk90YllWU1ZYbUNMKzVTdnJacGRx?=
 =?utf-8?B?VlowWUdwQzVCWnVtNkVBSU1Iekg2TGYwVmF0MW5NeXNudE5DTWx3Tkl0ZzY2?=
 =?utf-8?B?b2hBRkFiMk14c3RlTWR4Y1g5U01LaVorc2lkYU9iMXpXeFNvTSt6ZWtaczZP?=
 =?utf-8?B?d3FUNVpTUC9MTS9Ja0NQUVZuNnZ5SE8wUm1nVmx5bHh5WGNBSmJiaE04eFJk?=
 =?utf-8?B?TWJ6bDBHOU9WcnZtdCtQWGwwVk1NWis5WFpVTlJvOVQ0YUJoOCtFQldxUlIr?=
 =?utf-8?B?Rk1PN3lGbkFBa1Axem4yZmF5a0tHSmtoajgwV01SYWNRV2VlcmhWeEU0NGx0?=
 =?utf-8?B?MFl6dXdUMzkraHluc1ZMTm5xelhXSytkNFVKT2hIbEN0WVg2RUxkVkpHcE1J?=
 =?utf-8?B?Smd2dDhqd3hKMUZ6Z2NHV0ppSkRBRnA3a2U1czBsSnBJYUwrazBkOG10NUts?=
 =?utf-8?B?VEl4dnRwNTQ1YklxVlZYRTQ0NFpTVnVuZjlUS21lWlpHM0N3RW9KK2w2VFVU?=
 =?utf-8?B?djZIcDlMd2RLSEJjNTlBWDBEQWQ2MW5wbXMzNEtpN3N3SWRxZ1ZQeUNld09k?=
 =?utf-8?B?VUxLMzhsdFRHaVBsWk8rcEVZaEM0M0d1aS9VaFdOcmZmanI5QzhZdXB0cisx?=
 =?utf-8?B?L3JxMWc3YXVycHN6anpYZE9Tc09HWHBjT2lyVVN0eVJIeThzVHgxU2VibGt4?=
 =?utf-8?B?TU9LaGVUZDBBaFllUmpKSWZENVRtZ1MyeGRSeXNhQlNhWDN6MHB2aXZtYkJw?=
 =?utf-8?B?UVdmOGo5bThUMG55M2FLTHRoUHhjamtBeER5dmlGdmtiT1NtZHpWckVTdWxs?=
 =?utf-8?Q?xo9I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7612ca4-2352-4bf9-6061-08dd735447de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:39:58.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYDmkUhHSBdy+UsgsA3kj1pbCTZnM37l3qmIt3FTWTyHidftLP6DrmjiBLI5HgdZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243
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

Am 04.04.25 um 10:27 schrieb Dan Carpenter:
> On Mon, Mar 31, 2025 at 02:02:44PM +0200, Christian König wrote:
>> Am 31.03.25 um 11:45 schrieb Dan Carpenter:
>>> Call dma_fence_put(fence) before returning an error on this error path.
>>>
>>> Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>  drivers/dma-buf/sw_sync.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
>>> index f5905d67dedb..b7615c5c6cac 100644
>>> --- a/drivers/dma-buf/sw_sync.c
>>> +++ b/drivers/dma-buf/sw_sync.c
>>> @@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>>>  		return -EINVAL;
>>>  
>>>  	pt = dma_fence_to_sync_pt(fence);
>>> -	if (!pt)
>>> +	if (!pt) {
>>> +		dma_fence_put(fence);
>>>  		return -EINVAL;
>>> +	}
>> Good catch.
>>
>> I think it would be cleaner if we add an error label and then use "ret = -EINVAL; goto error;" here as well as a few lines below when ret is set to -ENOENT.
>>
>> This way we can also avoid the ret = 0 in the declaration and let the compiler actually check the lifetime of the assignment.
>>
> I had some issues with my email and it silently ate a bunch of outgoing
> email without saving a single trace of anything I had sent.  I see
> this was one that was eaten.

Yeah, AMD had similar problems with receiving mails at the beginning of the year.

>
> Unwind ladders don't work really well for things where you just take it
> for a little while and then drop it a few lines later.  Such as here you
> take reference and then drop it or you take a lock and then drop it.
> Normally, you can add things to anywere in the unwind ladder but if you
> add an unlock to the ladder than you to add a weird bunny hop if the goto
> isn't holding the lock.  It ends up getting confusing.  With that kind of
> thing, I prefer to do the unlock before the goto.

Yeah, completely agree. This is usually also a good indicator that something should be in a separate function.

But this case doesn't apply here, doesn't it?

I mean the solution you created below has a few more lines of code, but if you ask me that is way more readable.

The -EFAULT doesn't need any cleanup and can perfectly stay separate as far as I can see.

Regards,
Christian.

>
> free_c:
> 	free(c);
> 	goto free_b;  <-- bunny hop;
> unlock:
> 	unlock();
> free_b:
> 	free(b);
> free_a:
> 	free(a);
>
> 	return ret;
>
> regards,
> dan carpenter
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index f5905d67dedb..22a808995f10 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  		return -EINVAL;
>  
>  	pt = dma_fence_to_sync_pt(fence);
> -	if (!pt)
> -		return -EINVAL;
> +	if (!pt) {
> +		ret = -EINVAL;
> +		goto put_fence;
> +	}
>  
>  	spin_lock_irqsave(fence->lock, flags);
> -	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
> -		data.deadline_ns = ktime_to_ns(pt->deadline);
> -	} else {
> +	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
>  		ret = -ENOENT;
> +		goto unlock;
>  	}
> +	data.deadline_ns = ktime_to_ns(pt->deadline);
>  	spin_unlock_irqrestore(fence->lock, flags);
>  
>  	dma_fence_put(fence);
> @@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  		return -EFAULT;
>  
>  	return 0;
> +
> +unlock:
> +	spin_unlock_irqrestore(fence->lock, flags);
> +put_fence:
> +	dma_fence_put(fence);
> +
> +	return ret;
>  }
>  
>  static long sw_sync_ioctl(struct file *file, unsigned int cmd,
>
>

