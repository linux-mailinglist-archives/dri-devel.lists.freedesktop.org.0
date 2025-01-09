Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E7A06CFA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D629210E034;
	Thu,  9 Jan 2025 04:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pCg2nraL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718910E034;
 Thu,  9 Jan 2025 04:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnAcaGl4WBNZoY615m4Xg4Pl/7Nv98ZZwac4wTwiAp5R4dKpNSLXdOE42czPOv4S3KTHiDmZC+VQxJqg7zDhlcR1lqteSI0OrzaQ6ItTPh0FI950zS626bK60Hnp26dWSrQaBov44Vt3ue4KtcnXv6S0hHnlUoKKxEjltsbH9+jkNnD4rLPHqYkrOKcA6u+ejPJBGbI4INd5KtGRff8C1rIOBY6NDqZGU8stk0xxczMOmm9muuhMGpiW7hqf4L+c7BT6Ma97MshhTeYJZiHs6Y/ThMFnSjDKcOk5vEkb56AYk/YmLb7dpfwIlK35wGOvVytrTxBmrmdQjiaKqenGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VOkhU87lh3eb6/1eLLPvwtKaULdY9Zdr3A7g3gORo8=;
 b=akS9uCPQHfMF2vQLgLEy0rpVYCzv4IYTeFPfKbqyaz3Ai9BAM6pxsEnFVzxEwxmMLXhrk9esz4hRd31AB4VKkH0/GlllwJPFLxx6Nke1BHvT6XbzXkz5nDLbDxxSWOvzdgQn1EsEjygT8nLTOJXbHid1h8GJVt/QmAZ/2kOWtyGgnZ41lP9dglNwlwWCRd6pKmDmDfWEWYGXcoTiQ4jmC939gyJnaGcHZIJHlvs08ORCSD1xtN96AePmovRJt4+4TjFU2OUR/oxJZp0NLXwOCAH17neHxF3+FvEtr//e+EQW7M2S7lQowQSTLygSN1ShgtGftVw2MNXaK81xi3+7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VOkhU87lh3eb6/1eLLPvwtKaULdY9Zdr3A7g3gORo8=;
 b=pCg2nraLYmMaZJ6D0+2p/wuGvBAJ2FxecJbC3aeXVK3wtWkxHx29YnEnuOXR7uM/aMWGPHmyygLxn9JL26I+c90FG2q1URaOqzF+BZIzRyksMvuCJkiRi/zqZHUmgg8MK/XoqOfmaD6m+GvhwvCjJV2jYX5TMwKip3jF8nlgZ6pAXwr1TUeRi/LIbAwXDA0YXs/2Kal3ZGNBNKYPxmogGLvH36qAkg8PZbu3WhGQY7cLwdqv4kEYI9xMf+q3nWJvkBANOX0twpCztGwZAYDEIL6CltfDv+TZlA8TUnpqCoUdZstvkTWQhTbb3Y/7eWMUzPfUIMa0+1EUay0oxLBTqQ==
Received: from SA9PR13CA0153.namprd13.prod.outlook.com (2603:10b6:806:28::8)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 04:13:49 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::3f) by SA9PR13CA0153.outlook.office365.com
 (2603:10b6:806:28::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Thu,
 9 Jan 2025 04:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 04:13:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 20:13:38 -0800
Received: from [172.23.93.240] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 20:13:37 -0800
Message-ID: <cbe98670-a196-4764-9175-040018eb2682@nvidia.com>
Date: Thu, 9 Jan 2025 14:13:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
From: Ben Skeggs <bskeggs@nvidia.com>
To: Dave Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <nouveau@lists.freedesktop.org>
References: <20250109005553.623947-1-airlied@gmail.com>
 <64e2c9d9-17e7-4607-87e0-eb9c4005ee1c@nvidia.com>
Content-Language: en-US
In-Reply-To: <64e2c9d9-17e7-4607-87e0-eb9c4005ee1c@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 70848487-9f9a-4d5e-cf94-08dd306404bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1BQYTYwUXlmbU4wS3RoYjdmUURKWUo0MmZNY01YWWtXOFNhcjhYR3Mrc3N4?=
 =?utf-8?B?Y1BjamVtZ1IzcU1aRDZtbUtqLzROM3VMTk41RzZzU0lSOFUxeEM2TEdXdVZ4?=
 =?utf-8?B?MmlnVFhlaVArV1gvZ3k3NWRkSHJjTHBnQUJmOGp2K0Y5Mnpyb09aaVJETnZv?=
 =?utf-8?B?WFNFNm42RWpjOVF4cFpXRlQxbWh4ZlBERE91RTlDVnF0N0NtNS90OTBCeGRh?=
 =?utf-8?B?amxGSTZzVkYwMFZvVHI4d0ZXM2JtWVpMcUpXcGNlam16K2t2QWVKTnZDNDJv?=
 =?utf-8?B?Yi9NUXU3NjBJT0xMQ29YekZNMzV4T0xHcEpIYm5USHJrWHA0L0sxT256anZP?=
 =?utf-8?B?VklkM3JDVFVwT0VWdkZZa0UzeGxHSEFwNXZMd0EwOGpPOG9PTDhyS0phdlNF?=
 =?utf-8?B?TFprVjBvNlZtQ2FxaDhodjBZSE15QTlmZWFiMWI3NjVZVDZNc0FqOFpFNW5u?=
 =?utf-8?B?WWRzUGwxMzR4Vi9xQXpncHhkdjNvSzY0WXUvTW4yUGsxLzhCYUNkM0tMb2Vo?=
 =?utf-8?B?R05ETnk4amVVODY3cFRTTklCN3NoMHppYWVDNUR4R2lGUllVYlV0SGpYeGxl?=
 =?utf-8?B?OWNtUU45cWhVaGFhZ1VEWEVHOTRZdUZLa0tHWnEzMU81bEE3YlVWYUdwWEcv?=
 =?utf-8?B?a0FDQ3d5UkdvK09nNE9YRjY1V1I1OVIwVC9JNUphNlV2YkxSajFtZ0p6anpG?=
 =?utf-8?B?VStsSGg0TFliSGVpMmM1WU5USFdqZm1EYjZtb3BYYjRRQmZKRUZqRU5Uek53?=
 =?utf-8?B?NVV2LzlzZFhwUDRVNG5Qd0NjSzJyaFZUY0pFcUpFTzhkbitiTkJpT0tSSytK?=
 =?utf-8?B?cVR2QTlVUjllUzBLK1lnQlp0emdjTnhpLzZ1R2FUU01SUTg0cmZ6S0Q4RnBp?=
 =?utf-8?B?dEdYTUxLVFRCM2JOTG81dExOY1JKOWgwSitzSW55alFoQUFGaXN3cU5VQWRm?=
 =?utf-8?B?cUQxQ09tRW1DTk1OalNONUR0UkdJVWs4dnRITkg4ajRpUHRSUjYyV3VSVTBr?=
 =?utf-8?B?U0pKVGh1bjVFa044MXVCZGQvUHNjZVdpQW8wbHFKQlVYUXhMVWxqOURMSk93?=
 =?utf-8?B?eW5wMzJIQVVUTlBMT2hrN0VURVNpOW5wbnpPVWhpSjJpa1pUSCtaNU9wZVNN?=
 =?utf-8?B?ZHFUay9zTy9KMGJFVDJHYzByTmVUcE0xWkdVUUxVQWRPd1VOQjIrb2JuUWJR?=
 =?utf-8?B?TFNxM1NVVk9UbktCR0V1ZE5vNE9UdFhDOUl6TnpPZHhLVXY0V2htMVBKU0pu?=
 =?utf-8?B?YkRUQkMzQVFzZDcrZW9SM1pMV1QzckRPSVhnb29yT25vRjJWaVRpcVlHYk01?=
 =?utf-8?B?eGI0SHlRaU8rOGdFN05qYUdma25ndGN6Zk83SUxpVm5aYWxra3ZNbzRkRUY0?=
 =?utf-8?B?Nk13WGRiK2tLWGJlSlJJUjkrNHFuYVlzaUlYOTJEeUUvNkNneE9EbHhpemlF?=
 =?utf-8?B?NkNZOWZKVW5sM3JYdzRFMndPaWUzQm1pQUpYUFZyaTlJaG5zaVk2WTNPYmcr?=
 =?utf-8?B?Z2kwNzJ3QnBYL0VaVC93UWVCS0ttbnVhcjZSRkpKYkdIUkxmN1cvVHRzWEsy?=
 =?utf-8?B?RUpKakgvQjUxTTBtbi8xMHlUTGg4ZEIza0RRbTZNN2hMNkNldUF5ZXcxenZh?=
 =?utf-8?B?MnRlNVNqUTFZRVhhbFJ0b2REMzVUb2VyVWJQL2V6SmtCNUVTeEt5ZEc0dk1S?=
 =?utf-8?B?QVAyc1YwYmI0ZFYxYXNTMUV3SERMZDU1QjEyS0VUNUJDY1g5NHBSc21pa2VP?=
 =?utf-8?B?cFh5NnNYSHB1VGh1YlZVQnpXYytRMVhaWDN0U0xURVRDVUdjTFZZOVFJTitH?=
 =?utf-8?B?dHN1UG5EV2w5Z1VQaTRqc3BpWk9uLzZpUXMzVGh5L0VrQ0NyMDlvN2hVWHN6?=
 =?utf-8?B?Q2hvam9SZERCcXI1UVlQM1JSemNNNkxKQ1BFdE8vR0FxT2FRZ3VacVNYT2hH?=
 =?utf-8?B?WnpsZklka1hnVEdFeXRFMzRKVHRFS3lDODVuN2pHZTAxeFc1MmlIbXhrdXY4?=
 =?utf-8?Q?Gwafdvn0R6O54qaQiu9ZItLjbrb/Dw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 04:13:48.9483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70848487-9f9a-4d5e-cf94-08dd306404bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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

On 9/1/25 13:42, Ben Skeggs wrote:

> On 9/1/25 10:55, Dave Airlie wrote:
>
>> From: Dave Airlie <airlied@redhat.com>
>>
>> This is the 3rd iteration of this after talking to Ben and
>> Danilo, I think this makes sense now.
>>
>> The fence sync logic doesn't handle a fence sync across devices
>> as it tries to write to a channel offset from one device into
>> the fence bo from a different device, which won't work so well.
>>
>> This patch fixes that to avoid using the sync path in the case
>> where the fences come from different nouveau drm devices.
>>
>> This works fine on a single device as the fence bo is shared
>> across the devices, and mapped into each channels vma space,
>> the channel offsets are therefore okay to pass between sides,
>> so one channel can sync on the seqnos from the other by using
>> the offset into it's vma.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>

Err, not sure what my fingers did there ;)

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

>
>> Cc: stable@vger.kernel.org
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c 
>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> index ee5e9d40c166..a3eb1f447a29 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -367,11 +367,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, 
>> struct nouveau_channel *chan,
>>               if (f) {
>>                   struct nouveau_channel *prev;
>>                   bool must_wait = true;
>> +                bool local;
>>                     rcu_read_lock();
>>                   prev = rcu_dereference(f->channel);
>> -                if (prev && (prev == chan ||
>> -                         fctx->sync(f, prev, chan) == 0))
>> +                local = prev && prev->drm == chan->drm;
>> +                if (local && (prev == chan ||
>> +                          fctx->sync(f, prev, chan) == 0))
>>                       must_wait = false;
>>                   rcu_read_unlock();
>>                   if (!must_wait)
