Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334938D4674
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 09:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FAC11B7DB;
	Thu, 30 May 2024 07:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vO8vb1Md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258F711B7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:51:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5Cg+IjFZ/M0q3nro2Dc8oxD5wlVANXWnJBCHRYVL4TQRnSmLLwaXRzbk4jKE6HPXtcZtWuj7E+3tCEs8BY6tsjrMfCzymqaN9hktcGzQDbePAq2Ka8r1t+TjxPBrUaBypxyXV3vm9VFMewUtJzZ9BgLV5BaVA/J4iSvYdI3AB0VwiU83St7wqkZPG75lHEgbUjnxXnTngphmqq9SqbYS9m0ogq2KJZWOP+NsuEsP4zPvBgS65EPRPTbGNkKAKD/XDg7EnINHQmGzPixwwtlxHbh1z1aDAMbwhy7ov5lyH+N5dUrHNgnQzdR3cHjLDAQLGDBJayQn9SQT05wn6QruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3Dme36JhO4slauClVosfOl5ejYhwG2bIxZCN8Vx4x8=;
 b=YVeSUSJlhd4OgzV0CnddAGGhgQ8ou5mFSl0BRIWAfL5CipkRFcsTC62DcvkKXuyhDjiYjeZuiHS/ASuf2rJlCt48NuoIIwvLYXT8StZ9gStbd5+DxSEF3wCqz9+u06h17Y1qP6ICwENcS8xHn3RMeqi6CjeY6a+ewGALu3i8iHbR78WBKHwI9VVWCcNTao7TektOwBSgLK5B2DSAY2nwGXmihCf7fRTIZx7z60+mh62HQNFycsyQqRkx6K9r7xkDmu2ivSFPzNbGLFSj56EU0q2KVvi7wCIeyqtOxCKPYoYmozTUsnbepyO8FCJivZSVmFT8H4YOuDFZcG4bAhbHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3Dme36JhO4slauClVosfOl5ejYhwG2bIxZCN8Vx4x8=;
 b=vO8vb1MdvaiZ7s0t+DWPyi7r9IZ+bM3SPIC21qfvpr9foO0bVGzarteuxqd5bBDaORbLCORnrqhIPV8HCiwPAWq7yp5OSqjMHWjAgmNDe+HTOfutiyR4lxZBk4lcS9rYg6JkihlLhJom2SeTM0SL0Nsl5InGIQ2JBDA+n9c2P9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 07:51:52 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.021; Thu, 30 May 2024
 07:51:52 +0000
Message-ID: <8fab8a51-a37b-4aa6-b574-fd1c641e85c7@amd.com>
Date: Thu, 30 May 2024 15:51:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: increase ttm pre-fault value to PMD size
To: Huang Rui <ray.huang@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jingxiang Li <jingxiang.li@ecarxgroup.com>
References: <20240530034104.338561-1-lingshan.zhu@amd.com>
 <Zlf6be9KcW5xyVC0@amd.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <Zlf6be9KcW5xyVC0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: b408469e-4bbe-4a98-31d2-08dc807d5e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHF1MzBnVXM5VGRudDhvcGtGZytaVy9NOGZFd2FoSTdjdGFjZHBsVGRHbE1y?=
 =?utf-8?B?M3hRVGJMZ0RLMkZrOC9VcUY3b2VRTSt2Q05SQThPak9JenZxU3JwNDRWdTNZ?=
 =?utf-8?B?dm5YbVhwRzZnaXJ1OUwxWWwrREdFSFA1aGdmd3c4M09EWTRwMDNkSlpFbnhL?=
 =?utf-8?B?MnFqTmJyRlgrQ1EyOGkxM1pKNUh1bEFwR3ZIanNaZUNROXFkYkhVY1ZZMGhT?=
 =?utf-8?B?NlFQQ0JYUnlidGswTTZURXpWL2d1TVlkVXVFbU9yQUhHNnNMZU5scGpwSDlz?=
 =?utf-8?B?YytkaE1iMWFEY0p1TFpBTFU0Z2pwZDQ5QjRQM0JSeXFFWnR6cS91ZVVYSnRY?=
 =?utf-8?B?L3drVnh0UGxVRk90WGFhODQ2Qk04RTBiR0N1S3ZNMnF4TzNQUlpXRVNqWnNZ?=
 =?utf-8?B?U3hIbTQvZ09IT0VHUWFGR2VHL3ZySytJSTNoZW9ZUStDTFV3Q0VhWFVkdUNw?=
 =?utf-8?B?UmFzdHZPbWJpbDhteUVDd1d3TEN4WEZFYzF5RmJ1TzRuL1JIbEJkeWpMZWIz?=
 =?utf-8?B?U3VpUnlTcVJzRkNMOUZaYWh0eXVtVDFyQjZ3YXZsalRDV1NGSjVEZ2VSNnJQ?=
 =?utf-8?B?NnNDMHhrUHJzbXp6d1lVVjJDZWE0L2lsajhGbXQ2K1N2aktBMkVWNHdWa0tr?=
 =?utf-8?B?ZG9LNnljUlNQN0JIcGNGajIwZDVhNnc5emcvK29rNDA2Y09mVWZCN2ZEWXUy?=
 =?utf-8?B?N1dmR0hJc1Y4REpRZHBPYnFGcEVzbUcvenVrQ3lyZmVsT0V0N3RSQXJWREdP?=
 =?utf-8?B?RXAxUTVXNjFyYnZ2VEpxK25yc2FIUEFjZ1pyZkZPVjYrcjRnVTFJSnlNZUMv?=
 =?utf-8?B?dXZkR0JIc3QrWVJMNGxJd1Ewdm1ONFZpQ1ZRb3ZPNGtjTWlrcU1HL2c2TnZj?=
 =?utf-8?B?VnIzcjUxMzBiOW02WG5Ud1B0Y0RtRmZRTUJPY0kzVlBOazkrVVkzd3U1WGI5?=
 =?utf-8?B?ZExmSEpnZCtkSXI2UUhVSkV2SUovc3F1ZEVpd1dnbmx2bEZTT2luRkdqQ3k5?=
 =?utf-8?B?cnJWV21nOUpKVWh0N2NyckJZSnpQeVRGMlp3bnoyL0hKMWV0eisvQ0dsMHNw?=
 =?utf-8?B?RXZJZkJoaW0vSDRyZjVVa1R3cEhhdVVLZFZqd0RTMGlYMUlBd21vaUhmcXF1?=
 =?utf-8?B?Z3VSdm1jaGhnZmtsRE4yUTVPc3B0U1dCendQSHZhR1pnRXRhaGNsa2dpYUFM?=
 =?utf-8?B?cUJ1NVppSUhhaWV3YmNxa0xGa214OFBlNGI3WGprVHFIc25WeUdqUGhzeitj?=
 =?utf-8?B?YVplaGZnTytOa1QzWWZUK1RUalROS0hnMFVXNmV1SWxBV25FVTZDNmE1MlhX?=
 =?utf-8?B?cjVyRkM3bVVKaFIrekd6VU1wRnd6ZzhTSVRsOExOU2NFbitlVFBQVTFMbTgw?=
 =?utf-8?B?czRiZXRpUkJSUVA0L01yZlJlNG9BYjJGbG1lYXI0WFU2QXZZcFV2QVFGVERM?=
 =?utf-8?B?NmJCWWhYOVQ5MWFKWDRIWjdSelp1aUhocjNSbVE1RnorMlpoc1BhUVBZUnZm?=
 =?utf-8?B?TEtCMmpPUGJOZTNRYmNoQ2dRbXpDbS9EaExaTnZBdEFFRnZQZTVKank3emVk?=
 =?utf-8?B?NHNxbHF1aG5QZExpSHkzTlh5eUxpS3d4Yi9NRHJ6alFkcHdHMFJJb1pGVHhv?=
 =?utf-8?B?RkFaMDAvRC9lVVg5WVlkMm1DVGpIaEM2bVhlM0t4V0ZyY1RtbjgvOHlUbS80?=
 =?utf-8?B?OUpvdnVjaWU1czFFK1VDcWkwa3hzSkk1VXF5MXJLeTJRdnQzaUhVc1l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB7835.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNONlNtSjBIRGRMakJMWGZxNk9kK3JIYkFyck9JbS9YcGNrS291UHF6QkJY?=
 =?utf-8?B?RnpOMitJNXBrRE1qWmZveDNyem54MVkrcmNKeDl0YkxXSUl4UklkMTQ4Y2Vt?=
 =?utf-8?B?ZVhVdXJWOGZZMXIvWkhUenQya2tkVjlOYjNra29DWGVtaHRmOWs2cEhFNnF5?=
 =?utf-8?B?ekdwK3lFYVdQUXZKUURGZVhveGhkWnE4amtQQ2FNblQ3NktQRzFocFhJU21i?=
 =?utf-8?B?RFFwcFEwOVNleFBNcGZjdkZ2RjU0QVBLQzRvZXZma3pOZ2E1cXVmK0xWUmlz?=
 =?utf-8?B?ZWJMakhkLzRoN1MrS01TNUN5SGJDajZlS1ZKRzkyNUZ3RWdrVlFialdSK0J6?=
 =?utf-8?B?c3p5QnJsbGwyNFplU3dyM2pHend6RFhYZDYwUXF6YTdsN2kwcWRVRjlIQ1NP?=
 =?utf-8?B?WTVpdlpXZ0dKdk1SYnlvQVlJajk2cVRFeFVlN1lmQXhKa3dIcDlSdVBQSkxs?=
 =?utf-8?B?SnNPR3E3d2ZpK3JyZmxjSnVKU2FBcngweG9TUHE3WFdPc2wva3duQ1F5eVdK?=
 =?utf-8?B?bGJsTlFEUkdvZm1zMmloM1lRKytQdEljdVhYQ1R6eUF6YVhNeUNrNWxoOTlx?=
 =?utf-8?B?TkRhaXd1d0dPVzQvMjQrMklqTjZ1VUJub2ZGOHVBZjB4dzlrSjFFb1FPdlVN?=
 =?utf-8?B?b2lVbVE5YW45dEhacEJYeDVlN2t2cXlPRmphWE5Qd24zVFptK2o3bG9mSHdH?=
 =?utf-8?B?K0IvKzR2dHVPSUx4NEt6bjlQclNQa1FaOVN3WVA3YlJJRllxRytSeDFzOG9M?=
 =?utf-8?B?bXNCd2NtSDJJRGVJelF2aHBhUDFIVFFSRHlaRjIvc0ErNHpxcFdJQWRxUEJL?=
 =?utf-8?B?RERvaWd0RTR3NVJPMktMektEM0F5UjAwMXZ4TnlQOXliZFlQdEhyVS9YY0ND?=
 =?utf-8?B?bTV2VTJkYzcrZkliTmFEWXpUWDhDdzUxSFBvVUEwOGpYbkI0L3N5TnRQc0JL?=
 =?utf-8?B?V0hkQjJhTzZRUnlaZXJyaUR5c1lMWnhkSTFRc0ZadWJmVGxzUlNjWGk0dzl5?=
 =?utf-8?B?NFdIUmJkNzdqeE9tTXl3cDkzSzNIVnhhZm1rS29ha3hSM3RkQVV5bURuS1Br?=
 =?utf-8?B?M011bWovR2FwajB4WnNDdUtlbkhOMkZUZFQxbFpGeUV5UmZIdHQ4V2pyZXI3?=
 =?utf-8?B?N05LS0tXbFVEZXI5T05Fa1VMOSt1dWcrSk5RWmRCNkQxdjU0R1hmb0tDYVdB?=
 =?utf-8?B?cmg3enQ5SHdIblQzSnZSOVNwWW9mZ3VnYnZtRmwycXdRbTI5ZzVqWHBSWkZl?=
 =?utf-8?B?MktYQ0tCa3RwSjZVMTRrV2NBbUhkQ0h6WWwwSXEwMHRWMjlQWmZhdklUakUr?=
 =?utf-8?B?S0pMNjMwTnptL2lOZnNYNk9UaEt5RnQyYTRMa2t2Z3ZqdXVHVDJKa3NRR1lw?=
 =?utf-8?B?WDFVWlhIMUdZajdVYXdUVmNlYjBPZFVHcWo3aFlYSVllSGJNbVJ6ZGgyNXlh?=
 =?utf-8?B?V285ZUNJd3htSTZNZStXM2RzWjlXTDdscnVmWWMzYytLSmRXQ0h5Wmttb2ZG?=
 =?utf-8?B?NC93dHgwaUNkclhUV3VUMDVOSjhXQjVRTE5oVWtpWHVuRVFOWHVaQmdiT0Jw?=
 =?utf-8?B?VXNDQk1Jc0MyMVJlYlA5bVJDRFZ5UDloUWxyS05rTDM4ekppdU9YN0lnWFg2?=
 =?utf-8?B?K2J1UmhpeTNaTm5uVU1IUnNJYnBLcEZndTU0RzNKNnVQam5ZOXNrQUR4d0Fw?=
 =?utf-8?B?L2hPM0lIV0VxdU5CRDU2MzJXbkp3VElmMkpnbm1KRDM0YWVTSHF1ZWE2UURQ?=
 =?utf-8?B?aFcvNXgzdVA5bDhER3pvV2F2LzU1R2h3K2l5VkhOU3BSdkxubTN6cGFjSU9Q?=
 =?utf-8?B?SVRmMVJyOENLYzE5UzBNaW5XLzZ2T1NzV3lQVStVWjBmWGFxOWc3YUluMm1B?=
 =?utf-8?B?MFV0a2MvbEI3T0c0aHFkY1FhQURHMUcyUmNSUWtMWEJ2Wkp6Qy9PeVNpZFVB?=
 =?utf-8?B?bXRhRHdBdGgrcjc2SlFlTGdLZDBHQlhvK2dqVmFaQzc2RTZYbzlTS1Z4WWt2?=
 =?utf-8?B?YnJWL2c1SzJaRlhWbC9aK2pRbldoVHRSckU2SkpIclBLQk91WUdGaGwyd1ZJ?=
 =?utf-8?B?ODc0aVQxaHhSN3E4cjhDekVjRU5XZmhtaEZBVU94d3VHaXMvekxOcHg0ZXdl?=
 =?utf-8?Q?an/DC8sDwvUEVPvuZC6dWUlj4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b408469e-4bbe-4a98-31d2-08dc807d5e3b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 07:51:52.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4h+XGRAq977eckx1Cg3n2Z93lvo9om+Nq0FSvkZnzBDYb0aeqezL7lFHREBKdP1AFPOLUMu5hH6AuuN+/Fp2Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583
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

Please ignore this patch, V2 will be send out soon

Thanks
Zhu Lingshan

On 5/30/2024 12:02 PM, Huang Rui wrote:
> On Thu, May 30, 2024 at 11:41:04AM +0800, Zhu, Lingshan wrote:
>> ttm page fault handler ttm_bo_vm_fault_reserved() maps
>> TTM_BO_VM_NUM_PREFAULT more pages beforehand
>> due to the principle of locality.
>>
>> However, on some platform the page faults are more costly, this
>> patch intends to increase the number of ttm pre-fault to relieve
>> the number of page faults.
>>
>> When multiple levels of page table is supported, the new default
>> value would be the PMD size, similar to huge page.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Thanks Lingshan.
>
> I suggested to add reported-by from Jiangxiang like that:
>
> Reported-by: Jingxiang Li <jingxiang.li@ecarxgroup.com>
>
> Jingxiang, could you please test this patch? We expect to have a Tested-by. :-)
>
> Thanks,
> Ray
>
>> ---
>>  include/drm/ttm/ttm_bo.h | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 6ccf96c91f3a..c20ef44002da 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -39,7 +39,11 @@
>>  #include "ttm_device.h"
>>  
>>  /* Default number of pre-faulted pages in the TTM fault handler */
>> -#define TTM_BO_VM_NUM_PREFAULT 16
>> +#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
>> +#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
>> +#else
>> + #define TTM_BO_VM_NUM_PREFAULT 16
>> +#endif
>>  
>>  struct iosys_map;
>>  
>> -- 
>> 2.45.1
>>

