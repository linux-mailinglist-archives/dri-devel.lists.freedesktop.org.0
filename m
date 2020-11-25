Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2652C3D0C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CFF6E891;
	Wed, 25 Nov 2020 09:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7BA6E88F;
 Wed, 25 Nov 2020 09:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLUWZuRPAvI0Ee4x20OGZRxKXnNJgnUiUrdwhQ/J6QCbX1dOmLJUMwizZljALYhEfd3w41JXZJkcxNsPImswQhFtHu/pUW7ULxOQeYxp2pdMEGHgU9VdaMSjci50pMvPEnlsi/4hoxVnRLJVIeEadQQOV5htfuqxxOl+rxcQLCxUfc1t1txszH9eBv8zZ9+clL0xicwGyDRi+c9m4XULfkJTooc7pUvMuDrA+sQVEgl2LbuusnviSPWB6A2im0ujzrYJcS+tyN79xOXb4DPtUzCcOFyo9AWcCq+KMOqJKNEaHvUZFCCO+YdwYYN/s+J7IErSLaj38+5RcwuvBTTMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXv3a7TfXIyhGn0cO8d1l7rX8BOqAMTA6nJRQfrHsuQ=;
 b=jPEZZSAR1FZT/gupDqNWaEDq2sGw4PSlnzii3TL1YUnXBbEdA39/lAp7EdmNt+/QIOk3nICdM/+B7gNGuh6wrEgY0fyWbJ7usjCNkB7e4Pl31RfXsHh7j22rD36JhgPLmHEq9SiOF+zA/e7su0sfNHMmxpApTD76dEy1RkO8dIhX3Yhqp98fSYnNEPzKcbTHmX3qqG6aFm5o2FCeCHHhvcxBDsmfTd5skNoS8RTNxnsfV+xkoLpY8gxToMC1/G9jLv/C7Mmjnb6sNnETqwED7H+KXSmUx44gZ+GOfXyOcWxFAmi0zehzFE6dygnJbSv5TwaW8/fc1qvXNlJrO3lKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXv3a7TfXIyhGn0cO8d1l7rX8BOqAMTA6nJRQfrHsuQ=;
 b=KcxDuUGSZwaBzc3X3eEmWBODC2nqB/yy8bALxT0z8Uae0vkb2wTBMOkIE/UYLgCoXJvU1j7b8CcIb34cxbaZCHJli5UgzgXSGN63u1BlznH+11m+wzimBfIZT+c35hLGQINlftScq0M32Dnm0x3SPdIRxsZa6jXHa/wP4sKv1M8=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 25 Nov
 2020 09:55:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 09:55:10 +0000
Subject: Re: [PATCH 5/6] drm/amdgpu: Don't hardcode thread name length
To: Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-6-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f430cd7e-8b37-ea42-a751-825c2bbf0055@amd.com>
Date: Wed, 25 Nov 2020 10:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125031708.6433-6-luben.tuikov@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 09:55:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34258cd1-9c52-42f5-7c8c-08d891283248
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386637CA3EF9BAF1913CE4C83FA0@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yl9Lirz5yDGSYdRc8mO7e5iAFr2qhzv99ARASeFmya7ioRz7xsekg81S+5GjeXvSzPBn+prTClas+BquOJh4oY9207FGEGKK4y5QS/RMQ8BCoxifFX7CZDsCy/DIi2yMGJRBWqjMrPQS9fy7/8cAOxV3t/zgk4IO/COVcO4nYOJYVom2JLigtU8yrAc+FjkzIla/xxxrNx24u5SpBJgEKhLBgGcyUD3nQRd14uLG8fSQvH37Gjt8h+DUw5FXqriG94TnAT/J4MMSf40AVS6ea8AYXPpRL/xACxRXle+Nq0J0DFzD4tMfa/wHnL913i+9QQaP1c5WtyLHqrodSddJejUFpSYkg7868jN55rvX75TmZEOSJtEnB4slow7zEgw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(83380400001)(4326008)(186003)(110136005)(2616005)(66556008)(31696002)(8936002)(2906002)(66946007)(66476007)(6636002)(6666004)(8676002)(316002)(5660300002)(31686004)(86362001)(52116002)(478600001)(16526019)(6486002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UnJjTWNoRmZER3JGcjdrbEFETDRuQzR0NVg2ZkJ1aTZHcjNYNTlDNHNwdHhs?=
 =?utf-8?B?TFRvUk1OdGFiUnRBenlOL3dBZWJwRVRTSnFMUUMvTFNremdGNHQ2OS9PTGZN?=
 =?utf-8?B?dEFUOHB0NTg5eHdzdkF1RUxLak1mRHZFakRBNzd3a1RtTytSTkpSTzhIK3hG?=
 =?utf-8?B?cU5CMHluMmhDbWIzZjJ5aVkxd242QjlkNUhkL3R2dUc2L25hUUg0Rk1vdVBt?=
 =?utf-8?B?bFlLaExuSmJScTFTbTNjL3hNWnJhUGRnU2FUOWpNZnNUUkllSkVwQ29EdGJv?=
 =?utf-8?B?YTZUOUo3cUd5WEVNSDY2cEpGQi9GczlTekhSYzJ2YkhMWFBxbVI4QkhnMy8x?=
 =?utf-8?B?VENpdy9kTnVaZDArY0xaRFhiN0ErZ0RsRDRZREJCN1ZLUXFjK2pCdkdxMVJv?=
 =?utf-8?B?d2Iwekk1YkYwTUhjd3ZtSVNXOFpFTExuektCU0FYRFFZWFV1eG40Nmk3WnpF?=
 =?utf-8?B?SGpBU2pNNU5ZNnQzMnZkenNjRHRLTGh4a1JMUjhsZ1YxZTBCdXFTZGNXZlhH?=
 =?utf-8?B?YlFaVmlaK3dIYnE2WXFHRm9TUGM0RHNNSHd2akZFQy9EdkhRS3dBYVBSbWpJ?=
 =?utf-8?B?TkpaREFtT1luSzBXMmdDbFJDbHhVZ3R3eDdRb0NJdmxpQjk3czBEQTJjZnNJ?=
 =?utf-8?B?UGhGeUZVcURVK3A2WHpLZnh1YStjUWh5RWRSR09hSHpmamY5S2o5VUViaHdH?=
 =?utf-8?B?cVQ5NXBGbTgxc3FMTEJKeFVZQklZRnIyaituRllQbk9zRlBnTDBaQ0pNemVw?=
 =?utf-8?B?V0p4eFpKaWt6ZjI5TlJVLzFRU2VXT3N5VEp0ejhYNWI1WUg2MmhCWlFGaFo1?=
 =?utf-8?B?MlhMbGd6Vnh4SWRxVnN3RnpVSG1oSHFocThtSXIwNDBkL2U1QmNONjJaVjJp?=
 =?utf-8?B?bEk0aWZiZkVLNTJ1Z0JMNnV3UHUrTWd3cDR1YUIzemRCWXZZc3ZYT0hhRWVy?=
 =?utf-8?B?Mm02RU1CTENQSnIvVUplL21ZeTFGcjhmZ2l5QnhPc1M2d3U0N2tMWmdUK1Uv?=
 =?utf-8?B?TFNMWVZkLzhBMFg3VkRqWDNyY2pDMkxpODB4NVJyQTJLbzFKeTVDWXpsVmNK?=
 =?utf-8?B?bE5OOTYzdU1XTnFoeE9YOHpEVnpoK1UrTkhJVFRSWUlxYnRoWmFNOWJrL0Rh?=
 =?utf-8?B?bElCYlFBWWFpVTFOQmszMnRneGEvdnpXMnltd1lzN0ZFanJPTjZTNHVLdjdF?=
 =?utf-8?B?UnQ5ZlUzc2hSZVl6VWU0blVDZnBNODZsY3ZRQVFLY0h6a2ozV091a2RoOWlQ?=
 =?utf-8?B?ZkNNa3B4ZXdXS2FRM1AxeUNDV2dTR0FsY3FBM1U2alNRUFlZb0lsOWFrQ2Q4?=
 =?utf-8?B?ck1QL3UzeVhkdkZQM0lBMVJFcVAzUHlCUGNaT1pmRUx6RUI3MWJmRHkvQjVC?=
 =?utf-8?B?SGVDV3VYU0YvMnc2T21jWS9GSUk2S0FVaGMwNkJLalNFVUZaVzhIZUk5Sm1P?=
 =?utf-8?Q?F4DWLY6N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34258cd1-9c52-42f5-7c8c-08d891283248
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 09:55:10.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQZipos/EW45m8/ZTRp1hhM7M8oo2ZnkhuuWZNJxwprKE4wxg9WomugmApoSS2Cq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.20 um 04:17 schrieb Luben Tuikov:
> Introduce a macro DRM_THREAD_NAME_LEN
> and use that to define ring name size,
> instead of hardcoding it to 16.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 2 +-
>   include/drm/gpu_scheduler.h              | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 7112137689db..bbd46c6dec65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -230,7 +230,7 @@ struct amdgpu_ring {
>   	unsigned		wptr_offs;
>   	unsigned		fence_offs;
>   	uint64_t		current_ctx;
> -	char			name[16];
> +	char			name[DRM_THREAD_NAME_LEN];
>   	u32                     trail_seq;
>   	unsigned		trail_fence_offs;
>   	u64			trail_fence_gpu_addr;
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 61f7121e1c19..3a5686c3b5e9 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -30,6 +30,8 @@
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> +#define DRM_THREAD_NAME_LEN     TASK_COMM_LEN
> +

The thread name is an amdgpu specific thing. I don't think we should 
have that in the scheduler.

And why do you use TASK_COMM_LEN here? That is completely unrelated stuff.

Regards,
Christian.

>   struct drm_gpu_scheduler;
>   struct drm_sched_rq;
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
