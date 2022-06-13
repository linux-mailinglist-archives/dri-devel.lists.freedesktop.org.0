Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EF547FD0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 08:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3175510E8F1;
	Mon, 13 Jun 2022 06:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608F110E8F1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 06:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkwIDUpHbKDd6xvWMJqEoggAqpQxj3oFMvklgdgEhjTFNxuu+XMIIlo0VIlUCKQ7KsvlqLFQlOGDN0xnvFcpCnDRAHMzU2YhZAEA5GJNQXP8kjiYpOUGIX/DLDvwt+Djhu4aaRqtBiNXdF1R2QFXaUqJHdhFuVskEkdFbB12YVan+dfO1TLWTkGgthNFbdNUnf8WEnUhFPN8cB0k5GnjrtXo1I3TAPYVTyffdLyytPdbj4h9wQXT6EN2dTIfe22rUJZD4zKCSOItr3MYT2AeHbIZbjVJuIv8t1HJMUEYxtGE0/cXJ37xKzCWnVqCBZM0D9l1tKi1kG+hwnrDmBozAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arDNSCeXRsklq9mW+JL7BqNOqyj25pMBpThfU9iVk0M=;
 b=OAKVcz8OriZhwhoTc6WwizZmhIjO4iv7r0k7JN/CyPPYOa9g/bOw5b5pSNAn3AWJgj7IZaPU5O0WgIzOeAx9zhqLYRggMkcVko9TQoHcixOIczGA/18zU9mmDiClgamZe0bgOY9S8cQs4pLOT9gflhQKgxUsw+mTnHfcw57mVn8VFoP3txG0WXu1/vCOugAHf71NqKtBmuBxKtR30MxjVEkivOimSNQmcgwfye4ZpR3A/q9Y8Ai6yHHl0CWAtKuP+0f0VR8ue6jg00P1WVlX5QGwPZHjHnYhvQvD/+eRmwm9jSIQcyQwFF5fFufGwRgyWf9IKoZ/2GYvUrHU1f2oXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arDNSCeXRsklq9mW+JL7BqNOqyj25pMBpThfU9iVk0M=;
 b=BwpnMHJSTKKWMzlzY2mddDnKmDxW/9pyJXDbmTO6/4JD6sNydegtYSaxERNwnABQ9IiSStnsIEYU4LAOQZqCGNrNMbuplTIGKqyRA8aNc3GV536E9iU/qV/wZUnubTbfvWfjkdbMpYhCc/OibCLxZMtLVwT3fKukgxoL4Z0uaTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3300.namprd12.prod.outlook.com (2603:10b6:408:6a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 06:51:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.019; Mon, 13 Jun 2022
 06:51:28 +0000
Message-ID: <4845ad23-476c-97b9-9b3f-d8aaa9027d26@amd.com>
Date: Mon, 13 Jun 2022 08:51:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH -next] drm/syncobj: add missing error return code in
 drm_syncobj_transfer_to_timeline()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220613063454.2609364-1-yangyingliang@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220613063454.2609364-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf0cc945-79c6-4763-d6f8-08da4d0923c1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3300:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3300323E4AEF79D0CD85E0D483AB9@BN8PR12MB3300.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DFKMJUuoQvNmt9odTI55KqP77WhFIiPfnO6Frnmosv2Z1yp0q9/7RbyGzMTbTf0lFjKdguzwGMq5uabnb2pFc4QezaITb99RWn5JdVagsGLEs7j7hcrrGbvX5Qx1Rvu60MA16TuYD6wre4kl+i6xqm+D6Enyv0cNSdO1JmGC2LSCxejQQ/beIgbjildU2yKrKfo73gLD0KSiLTaJhvUjBt7p4dq375t5ZONc9Ye7Xx0lY/sMOVj8vqLxMvPlijwr8+El2jDrmAhdeNc7gFl4Pn9nQwOvS9xFXBTzoD73jyIbfwCC6KvH8qXDUYLh83UBHiZl0Vlyi76+ZvFqTkflDcvNNiDCz1mVtIRYsefTwVqD3qc54p+oiY0brsWA/Uc75iTyaHRsuGTxENlYJEY0zBTKbqRYr5Cmw4oixS1b2kchZMx2elkwnKCg/Jn3Zt5oDVZZ6wpmsnl0dxrfCEpx3hk8H0XMlkSZHiQxZ0h2q4wxJIEnqI1INCCHr85CNH0evQyVWR9FqgzbOUGYpmsaC07tZLyM4YrVB2g9k9Wotjw9XBtDImUUWeRHxQs8Dybfo0Gt+sJd42dE0bVUxsF/E0X3zEwYQg4AtfS2QurtxASEKVSKfI1MYpmMPGzJZanuaVELC+2bBWXC1nm1oe/ckd2p/uFx1BRo9V2z8vY9C4lr7dTlODS0YMzv8eiw+6sPsy77XhPlyFAt8AkBZly8ySV+e+KL9YOb7lCXOcI1FRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(31686004)(38100700002)(86362001)(31696002)(66476007)(66556008)(8676002)(316002)(4326008)(66946007)(2906002)(6506007)(5660300002)(8936002)(186003)(66574015)(2616005)(6486002)(6512007)(83380400001)(508600001)(26005)(36756003)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFIveE94YkI1TlorN0NabFJQMEg3YS9UTEJPWmN2bmFUOWMyYVBlWWRHYlRa?=
 =?utf-8?B?OGlZNVJ4a3Fzck9ualZIMzlvcG45WE9vWHhYMEhrbC96YkljWUthRmRJbjYr?=
 =?utf-8?B?R2FzRUhiekhqOEZPSEhaWDN6VHFUUGRLYXViM0NtTXB6MlVQSFZKSVpDbXZP?=
 =?utf-8?B?RzVFM2R0TlVzbTlaUm96YVZWdnhtMFNicnZEVXlhTk1na0xRb1lmbkRxS3hv?=
 =?utf-8?B?OEhsRjVINnBHYjZjQ0Y2SXNFWEpXV3dXWVQ0NytEWEkxS2NNT3grQWd3YkZX?=
 =?utf-8?B?WHhiem1nRE1sVXp4S3NRTkhSQjBCT2JlOVdOQUZiYXdzRnV4UFFRUHRSR1RJ?=
 =?utf-8?B?SXZUZ1Ftb1NoS2dPUytEWlZRSzdlaXRnc3pWaDcrNWVhbjNMaTREK3dSdjlL?=
 =?utf-8?B?d3dzSUFPYlgwSFZKVVc2UkprdUk1czhpd1dDeTBXemU2MnZpcFJ1blNHaU1u?=
 =?utf-8?B?cmp6QzF1WmZzMVZuVWdSMVdmM2d1SWhuSXlPRlBFMWlVbVJ5MXYvRXVLa0ky?=
 =?utf-8?B?YzZTUG54d0hFTngwdlZKdktMNU1kaVoxRlpjTGo5bmtGS3B1OFFaeHViY29n?=
 =?utf-8?B?M3c1bEUrYVRTSmVsRFlwcHFFWHFEMlgvczkxNmFuMkl1dzlBcytHRHVLckR0?=
 =?utf-8?B?TllQQUVhRU50c2F6REx6S2xIRWlqMzFoN0RJaHBBcGxVamlPdFNSdkdqUHc1?=
 =?utf-8?B?MjdrZFFWeUo4d3pmQzd0RFlFMHBqWi9zcHE3WXlGQ3FiK0ZRV2RUYlhNeEVB?=
 =?utf-8?B?TXpRenh6aVpvT3MyZ2lXcFRBZUtNaUpGbWZtdHRTQ0hPbGdITVp5SGRHcnpH?=
 =?utf-8?B?NEFWQXMvYXlLdHpPQkxqRW5INWdaZzdnM0lwUWZTQWIyQ1d2c3lOWnB5U3o5?=
 =?utf-8?B?R0pSdmZESGsvUUJFUGZ2MnpUS25tQVYzeCtUbkdyZzFiZk5rZ05BZ1dxRHZI?=
 =?utf-8?B?cFdwQm9CQW1YZU01SzBhdkh6d0JxbUpCa0ZqTUJMTlYxbXJFK0FuNnpIdzNH?=
 =?utf-8?B?TzlRVVNoMDVVMC90dUNOUEFpaVBHeVlCU3IzT1JKNjZqRVpyclhFKytGTjNF?=
 =?utf-8?B?V1NzbkxyVTA5SElOSGE0NzV0d3BtZDR0YnJGczRPN2xBUXVZcjYwYVpPWmxJ?=
 =?utf-8?B?SEJVOXB5TGkzaFhxRU5HbnFhN1VQZy9aNWJLMjBtenNRNUdxT3JqelVWQ0ZI?=
 =?utf-8?B?dkxWKzUxMTdDQm8xQjdvbmN1b09qSFZvcy93dzFGQ3BreGRPRWZtTGlZSm5Y?=
 =?utf-8?B?UHdGN3MzeUswSU9lVnpXQmx6c1d0eW1kVjlrU1UvM05IQ2xJdUo5WERYSi95?=
 =?utf-8?B?KzI5alRKZ01FL3VzTVRuei9RZzRUYnlrVUZXZENVZTlBQzlML0Q2T1U1T29K?=
 =?utf-8?B?YzBzZlZNemZJa2ZkcWtJeUw3V3haaytJbVFZSWx0Y1JGc0VjcGFYa3Z1ZTFz?=
 =?utf-8?B?YVZBc3FjWU5aakJmLzhoZk9VejFVQkxnNEM4UzhOVHZ0My90bGN2NlhVT1hD?=
 =?utf-8?B?L3FRYmZ6QzBrYmo3bG1XZzUvL1lNc2FNcXY0YjNIbWh4S3AyS0ZCTlU5MW42?=
 =?utf-8?B?dk9NVUZvdmRuVlZRMjMveW1zcDJSeXMyam5HSFp3T2Fla2o5MUwvMFNISkZP?=
 =?utf-8?B?RUlKOU5OcVJMM1dXU2JRMEU2TStvN2xKaW1ZdldwcEdjeUp1NmkrSGpSU3FK?=
 =?utf-8?B?d2s1aTRHazdqcDlkVVNEZnBhNzJCa1d0WmVnQ2RhSU4rZ0FlekptS2FGOHpE?=
 =?utf-8?B?Y3BZcisrbVZlanJCZWJtdStidlpCZVZaTEZZL2ROb1c5NVc3ejNSR2RnL3ds?=
 =?utf-8?B?dC9xeVJOL1JjeEZFd0VrQUoySjNGM2ZvVjY0S29tOHkxaG9TbUV4K1M3OG5r?=
 =?utf-8?B?NkxVQ0Z4Z1k1ZUVGVHlQOExhbjlXYm9Za2VLQnhJdTViajBJVVFOUFhRbDh6?=
 =?utf-8?B?b0kydjZnOVc4MGJtMXlHeGtXMU1BOEcwNXpjQnovYWZjeVZyR0FMRlU3VmZF?=
 =?utf-8?B?MzZaenkyRGI5NUZReXI4bGpvKzVCeFhYdWRnT2F3bW1RcUlVTGNaMXMraC90?=
 =?utf-8?B?RU14YTZYbm4zS2ZCc0prTGlyMFJFS3JrMnJIWDlSUGdMcHZiblhFSFA4VWJS?=
 =?utf-8?B?bnIrQVRiSmM0K2pnRG1Sc2M0bVg5ZFpubXNRVXZKQ1FzT2FaK3pvR2ZtQlJV?=
 =?utf-8?B?RWpMdVdySEhaREtVZ0RXcC9kWHpNQm04TVczdGxkalEwUk0rVmRRb3dHN1Rl?=
 =?utf-8?B?ekJXcFQ0RWpOb0oyYktObVJlSDI2R05Rd2d1QXNrWjlsamJzckZmUTFvQzRK?=
 =?utf-8?B?dm9IK3pjbWZweUVwNXc3R1ZmTW8xKzdwZ0lXL1UzVldSdHpZSGpwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0cc945-79c6-4763-d6f8-08da4d0923c1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 06:51:27.9265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vLu/xK12Df/98/3aK4DLkqT1f6idNIyUfixFz5jTMdNkcJJEr0qcEr5/KSw5jZg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3300
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
Cc: daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.06.22 um 08:34 schrieb Yang Yingliang:
> If dma_fence_unwrap_merge() fails, it should return error code
> in drm_syncobj_transfer_to_timeline()
>
> Fixes: ec8d985ff26f ("drm: use dma_fence_unwrap_merge() in drm_syncobj")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that in a minute.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/drm_syncobj.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index bbad9e4696e7..0c2be8360525 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -874,8 +874,10 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>   
>   	fence = dma_fence_unwrap_merge(tmp);
>   	dma_fence_put(tmp);
> -	if (!fence)
> +	if (!fence) {
> +		ret = -ENOMEM;
>   		goto err_put_timeline;
> +	}
>   
>   	chain = dma_fence_chain_alloc();
>   	if (!chain) {

