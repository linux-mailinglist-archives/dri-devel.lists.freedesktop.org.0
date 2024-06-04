Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A608FAFCF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 12:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F07210E441;
	Tue,  4 Jun 2024 10:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W1+gdsko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8BB10E441
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 10:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fovz6j+WrU/WWNoa4BOnvebpbfQ1PlMEo2Th4OIsBvPSSOyUsgtE5+HffjVNNMmMsy8VVLWt1+aS9XqEUrYqLU1Jst1yeRc2IPOSUxaisqEy/bExBfVZ2qJqvTovbgHD0m4LkFbO3l4j15aXYUs0dsSCFsELYsxCUwDZOjRm7kNwd/vOcGri/+FJE5IWtVRJq4V3/e6dF6P89Qk9SFii0xVHREpZfsxp7ccBYqlT+by50wDOdgmDaZ/mDy3SIvJawl+lqez4JI+XdyC0pfxxR7xUqCnGXTnwU4wYXZN/7TiruBXmDFgYIy3I/b1uScclDQPTscc4Cl0sVu9VtiZjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZdTWNrkqEj+owtMzEdtt4rr1aEwThRH8J736ELbjkM=;
 b=jq1TqN9TcmtPO5E0HCgbR3qwp/0ZVBNhVSwNFXe8TjgWDDjeqqE4z7CxyDVoD59NbXiJUjmIlj3Ts/tQFskWif2xnbLpjJLrSF+SamExN/iCY5QFgiNNKnFBiXlxCTpwLTikSiDOlZidyxhj7wB57VC0rRe9S3V7++uDb+uA0wpVKK7z+/WjTuNQRdW+DQYnR1OR2mVybcuYssGtIv4VtrXa3WYmVwNcJtpCMnUlvePKSayPyYvQr6JzK90RBZwCJsZyyb0n5y5EZ7x+CMC7cMFRl8abkH3C0b2zdEYtVThWrUyM0m/YnW+ziHzT70F74QUyRM/kVemgtfZ1ZSpIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZdTWNrkqEj+owtMzEdtt4rr1aEwThRH8J736ELbjkM=;
 b=W1+gdsko/xhZmxKh+HnmtUKkZnHt1M4X0/RhGaOKnpwZSesjXTuz62VfdFdv8TLRQxKiTywam4BY1mJGsPNYdFMkXSRWceJmDIkyR6HPVYToZDys+27rwJ/rhbIDLjFlYXIya2ZZYKYw6gIrX6oBdl+nxTeHZgaFWin+ZfGGsTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 10:24:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.017; Tue, 4 Jun 2024
 10:24:52 +0000
Message-ID: <e1ec42ca-7166-4efa-a972-1b4bef6b691a@amd.com>
Date: Tue, 4 Jun 2024 12:24:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/ttm: increase ttm pre-fault value to PMD size
To: Huang Rui <ray.huang@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <Zl7qB1YmMSd43hZB@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zl7qB1YmMSd43hZB@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb5e8a0-5e19-455e-7f18-08dc8480921c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0M0YTl4NFZWMzNySS82OEFkYm0yZ1dmVU1yVUwxdEM5dzVIV1dFRjczWE1V?=
 =?utf-8?B?Wlo5Zk15MFRJRS9pSXZTUlVUUXhoYk5oUDlVUzljSElOcWEwUmRLUTBhNzhi?=
 =?utf-8?B?bGtMWnJKUlJqcFNrVDY0VW5DeSs5YktRMDdKb2UvQVpVQ1BtcTRpaW9RbU1S?=
 =?utf-8?B?cmkyVmV3U0plRDBWQ3JmU0c5STBhcTBrUW9SNW1uMGdBV1FCbm56R1JqRzZs?=
 =?utf-8?B?TUVrckxJS01aSTYxcVhFRnJFM0VtajNiRXFsdStjTVFOemN5RWRjejF2UDVr?=
 =?utf-8?B?Sm0yODBsaUtzUVpaU1JlcnBFb0JUbUFQSjA2ajE0eC92bGF0U3l6NEN5am5E?=
 =?utf-8?B?S01URTI5dnB2RmJRYzN3S0hDdE5mRE5yTkU3UlFqeU11YUg0K1QyT1JrYU5S?=
 =?utf-8?B?QzVlSm02bWozZ2RRelRjSktFMHQwaVBxOXpqeWZWYnhUWCs1WGVRaURXNFg1?=
 =?utf-8?B?NjlNbWVFazFIUUZRcTI5NHBOU2g0YTluWEh0QjhzVm9TNUROQVU3cHE5ZWli?=
 =?utf-8?B?Nm9lWHNsd1M2ZXRBQU5QR0crWms0SXdRb0M2YWVSd2xMbWF6YUpjL0xrUUZn?=
 =?utf-8?B?akxrNnlLcTM1YjRqd3dBUGRjMklCbFVGUWxjc1l3Q3hqV2I5YmwrTUwyekxS?=
 =?utf-8?B?L2lmcWlOYWtEcWpFa0dsdHJuRVFJcVhaN00yTDMwRE5idXV4UnhCSGpraXZU?=
 =?utf-8?B?RGxTazQwRWM1TkZMa1BJUml3bDhHNmFTR1VvYXhUOVllc25Gdk8xNkVxYkgv?=
 =?utf-8?B?ODluS3gvL1JTZEtMK3ltcWhqY3FDeDZHMThEYjVVQUppU2pHdWp0TkZPWmE2?=
 =?utf-8?B?VmNnRzdEMGdzeDBFTHRoS0h6WmlsaXAzOGlwQVprZld5QjZDRDdFQ3BJT2t5?=
 =?utf-8?B?enN6em1pOUhzZ29GcEpqUjBrVHVzeWU1ZDZ2VnFiZXJjMnkrdXA2b0MrK3pF?=
 =?utf-8?B?ZVd4N2dXM3JnOVBLWk9qYkoyc3d0UlBLL0RCVTVmRnRSZStrSmE2NFhsdks4?=
 =?utf-8?B?TlJBc2ZJdGxzZXhCVHpDK1l5a3NyS2hJM28zQUNsZ0FLdCtuU0UwNWovM1pQ?=
 =?utf-8?B?M1N6aHl4RWFIcHBKV0dmRnA5NWcyNlJ2bDVVSnczYm9sVTZFSjZnZnZvcXNs?=
 =?utf-8?B?dHRnVXBOWGVnVlJlUFNmdjFMdTFyTjVuM3czZ2VOVzNSWE0xY1J4UzFzRWdi?=
 =?utf-8?B?Ym9YOUZLRzZLOEdPTHpQaTlIcHc5YjJoZzZqT3pqZTNDdzk3cEc1a2dvWjJi?=
 =?utf-8?B?cXpSMnBHRXhxa2Y3cW5sOXhsK1pKbVkxNTkxUnlYRllSRm1ja1o1Y0owd05M?=
 =?utf-8?B?TXJLaHJ5b0RiVndKeGhJLzQyOHhMSjh4VE16L3VpNTVEUHQvUTZrd0xxWERw?=
 =?utf-8?B?SXJrdEhDQVRoM2NsaWZ2eUVuLzBGeVdFcnkvdkJvSzloMHQ4UzcvTzlGcmZz?=
 =?utf-8?B?UFpLQWV4OGJObWZlSzE1eUs0UHpWUDJQb0NPQXZRR21oQTUwUGpYd1lBcVNS?=
 =?utf-8?B?TUFTcTh3S2xPaU9EWk4rTXNpVE9vM2pUN1poTGE5TnFiKzkyc1UrZk5VekdL?=
 =?utf-8?B?WGtSS25WV1Z5NFdOOWNnNi9wSzJJUWFVc2JKenRIL0F6YTF4STlnT3V5bld0?=
 =?utf-8?B?eXd5c3B1TVU3MWZSWnk1eUlyRXJLc2taWUVDSTJEclJYa1F1V0tvTUk0MWJP?=
 =?utf-8?B?M05ndnc1cGlXYUlpNjhOSG81QnBISWFWYm1UdzE0dk5aMmFrNlJLY2dnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1HTDNCbkY1dVNsVzZlYzkvbWtibmZ1RTNSZk5EY0I4c1ZBZUZIYVhwU1VK?=
 =?utf-8?B?T3R2R250TWcwcWtJek1PdGtxVTY1KzZxbHVkT3l1b1VUajA5SHQ0em5LblRY?=
 =?utf-8?B?TGxERXdaRTdtR3pQcEdpM3gzbHpSckFHdXlONWUrVEQ1N3dVdlJQbGhvSTJ2?=
 =?utf-8?B?YTF5eTFlMndtdWtyMTZrVVpPU2VCaVI0blp6NmV4dFhXbUk5dDBsRENSUjIx?=
 =?utf-8?B?cCtqdnNJVEFqUmxmUHRIQzJRVWUxZGgvOWNhbSswSGFOWlZDYkZWMnoyUHdO?=
 =?utf-8?B?Y0orMUpCei9qWE12VlVrVWorWlpCWUVuYU1pQ2VYWUdmalJZdWRsWnVaWStq?=
 =?utf-8?B?VmYrYnF2Z0lqUlovYm00YzJmNFAydU92dElpdGN2eERUOUFvaW5rVnVreWRs?=
 =?utf-8?B?YTY0R0ljNEwwMDdxSmRUamxRRzNKdUdFOFNUaUdGSEdHM1k1NjY3UUtWR3Zt?=
 =?utf-8?B?YTRaa0xjbzAxM2hLZHA0elVtZ3BBcTZ6dW9VM0dGNE1rU3pkRjNIdmhHUGVn?=
 =?utf-8?B?cThhd2dNanY2RXQycTlKdzlKL2RrUjk0RHYzUHpnU3dPcWJ1aG8yd3V2V1V3?=
 =?utf-8?B?YlNtYnJ4ZHlNeXNxaDY0Zk01cGc2M3lZL1NtSTE3TmsySjVnTXcwRzhtbkUr?=
 =?utf-8?B?a0FSbzVHTjgxUGt1M3YxNm9PRFJNZXlqVU1sR3FONmlaKzY1Mko5WVovaHpT?=
 =?utf-8?B?RWF4c0I5dnFHWUllT2h2MVQrZzFFejJEbmdha1dKT1dvNnJEMThwTEkvU0t3?=
 =?utf-8?B?L0ZqVjdtTDlLVkxPbm56TmIwV2FUMkdIVmVmYUVBYjR0d0ppY2tvMm5XV1E5?=
 =?utf-8?B?L0UvOVprT2h3Sk1XWUJkMmhYYnpUckRvMlNzT0FIa1IrdWVRemNJSnBwZlVR?=
 =?utf-8?B?c1oyMUcyZEQ0T1E1RFhiK2ZMMnFXRmxTSWd0V05sbGpFU25oNWpVTzNKM1BC?=
 =?utf-8?B?TTBrZDJsVXVSZDZmcVk5SUVrWlFEdzl5eVZ2bW85c2pPczFremlHcEQ2bmxP?=
 =?utf-8?B?dVd3M2NlZGhtQ0hFWFIxYi9BQ0ZsTTk3ZzVHWlhaMS9tbjFIcWgyanZjdE1W?=
 =?utf-8?B?VVlOWC9xZG5uSlJ0aVNJTmIxNm1pNnBiekhkNWV3cnNjM0ZseDlZTTBEbGx0?=
 =?utf-8?B?R2dPR1F2dFZvV3ZLWS9xSTFqVDdqMUV4cTNwNGwrSjZTNnpjRW1na1djbHFQ?=
 =?utf-8?B?QUFFTWJKcU1vMVh2S0NxdmViazdvNys1WGZ2R051Y2pVeSt4MFRVdlAxZ0w4?=
 =?utf-8?B?QjNJY2Rsa3ltb2tEM3Z5eHhGUmt6UEZKMzhHRlcvU0ZDVE81QW44WHErR2lK?=
 =?utf-8?B?UnExTTVyUkZaVzRrdFBxL0hJUTlEa1dBT2RXcjR5cDd2eEI0L1NqaVZZUDlj?=
 =?utf-8?B?K2lGLzQvU21EcFM3NklncWhmZ21RR3BYbUl6V1A5NWkvRlU4eXI2aHN0OU01?=
 =?utf-8?B?REd0aU1ZdUM3SUw1YmkxQllITVZTSVk3R0pqSjM3bW16U3R1TUdhblpQSHdC?=
 =?utf-8?B?RkZWY3BrWGNZVDllUERqZkVrbTdhNndwbEREV2FtQ1B0Y2pwZFE4dkJsYnRO?=
 =?utf-8?B?dTY1SllNSjNMTTNzOHdUTVY3a0p4NXdIMDE5UmJBZ3FlOGZEWUpZdE1lS2pU?=
 =?utf-8?B?L1JxQi9oQjdHZHJpT3packJjTlRyd1FyQ1ZWdDRUWFdPcGFlVVdJRWFkb2Rk?=
 =?utf-8?B?d010UDNhdFg0MkhXWE95RklLbXNYYzNjK21qMGlYRFFlcmtjdVNOakdhcStu?=
 =?utf-8?B?ZXdUOVRmRkZEdnM3T3VXTE44MzhqVDFSS0ZLNjVqcWlVWFN6bWlYZ1lxN3N3?=
 =?utf-8?B?YUl4YlVPd2JsV3JyTVVlYkxvOGgzSklhbVNDTUgySGsyc2hVWVMwcUFCaEJN?=
 =?utf-8?B?WnkrOXlhNlNWSTgwZHJraC8venl6K1pJRTNpUlNYKzRDUy9mRW9wNjl5RzEr?=
 =?utf-8?B?ajFzNUhrZ01YeU56b1FtVTkvVUh1bS9jdnRmY3FCSG1mVkpZUXpsOXBaN2hX?=
 =?utf-8?B?WmoxY2pjT1BnTm1mSURQNGRJNG5OTGZ0Q0ljbmVJOUZMbkpZNmxFTUhtUU9n?=
 =?utf-8?B?Q1RaTmNhY3UwR3U3aUZ3cDFYSE9IMUp1QTI4UGdwbytWZkpKNnlsb2RBS293?=
 =?utf-8?Q?KvMpSIRMAz+R7kNHVXfE2NLVW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb5e8a0-5e19-455e-7f18-08dc8480921c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 10:24:52.5625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRzdYn6rlBaiiwR1mU3uzfu/SObq/xcdwhDnMwkuMbkGAfdK9wV0AyiL5/oXq2+T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287
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

Am 04.06.24 um 12:18 schrieb Huang Rui:
> On Tue, Jun 04, 2024 at 04:49:34PM +0800, Zhu, Lingshan wrote:
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
>> Reported-and-tested-by: Li Jingxiang <jingxiang.li@ecarxgroup.com>
> Acked-by: Huang Rui <ray.huang@amd.com>

Not sure if there really is an architecture with less than 3 page table 
levels, but the build robots should be able to tell us if everything is 
fine here.

Reviewed-by: Christian König <christian.koenig@amd.com>

>
>> ---
>>   include/drm/ttm/ttm_bo.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 6ccf96c91f3a..ef0f52f56ebc 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -39,7 +39,11 @@
>>   #include "ttm_device.h"
>>   
>>   /* Default number of pre-faulted pages in the TTM fault handler */
>> +#if CONFIG_PGTABLE_LEVELS > 2
>> +#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
>> +#else
>>   #define TTM_BO_VM_NUM_PREFAULT 16
>> +#endif
>>   
>>   struct iosys_map;
>>   
>> -- 
>> 2.45.1
>>

