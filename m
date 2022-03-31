Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EC4EDBF3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B97C10F1AC;
	Thu, 31 Mar 2022 14:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF3910F1AC;
 Thu, 31 Mar 2022 14:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWKDV/APZG7vumt3n+Ob6bB08EcMVrBfejphB7vCDDA0FtJgp2FjQpoVEIet9KTvSh9ZJ1c5pnWkF1kRrmNTG0u1ZUlFFfnvSJdJ8T1JHsulKSLemBbt28NtQmJI9EIigGRbc5OvshMECT5yiGhj6osngaGN1fTgr8IGGYUSJFyvrx1fqC/bPw1mf96hDNkSIEYvdlfHmNWPfD/qDM5Y/rAGVd8nnJ6hkJdjW13m/heK+9NSEWG98yYcrZh3bNtsKhn1u2Jhglwu7fvpT96IvEaPr20qS3K5GHFkQs+AIdPBuZtFSlqIau0SV+TfPNpsuf9jcqKfS4a9pocqRqnVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EpTsG4L4+E2azzagf/+J69eNkAMRiJYQSTgdOPAtj8=;
 b=bHUi2rbzTaakSt5Qr79m3oxdMWXkQGdFnMVGmVEBIM6lzpCb+4wN3UZ9sEijK6t5945Q00baCkl13dTb906JWzta/zS3lDJxaLl83LD9T2g0IINRd8uQoERoyENbwczO5FUP2wRJKTOP94oh/HP9SVuhZMHT2LbrrW4mbih+DdnXfsfzhh8kJXvkOxHvyLjAKmx70LiOBeLa8Yhqkd3zLJdL5RZBa/sAx+krbbA9FTRcQLcO05JPYeoII0qDOXue/3DM5kIst8MJV4M56xRclFkCxF/avvQhH8I4PWCUGxxbba2mbV6btJmWSVRISQ7DP+/y1B0U5pFHQ3M8vmJH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EpTsG4L4+E2azzagf/+J69eNkAMRiJYQSTgdOPAtj8=;
 b=OE6jntdtilYq0XrS6Dlhh4wZmYruK7DCEd3KyxB2sFV6YJR+wgfYIhYB0ohkWGSyW8nYNNj4yqWS8IzHuvUQlBptVLX4PFgv1dJGCUzRRd2LqSFIx1C/C6Mm+KqXTnqlXh5OSqokm9OubffB96dE34q2Cki78ATbBMvq0RgzYmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 14:44:42 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%3]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 14:44:42 +0000
Message-ID: <f38e4782-1959-d1f3-e8d7-f60e199514e3@amd.com>
Date: Thu, 31 Mar 2022 10:44:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Create file descriptor after client is
 added to smi_clients list
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
References: <20220331122117.1538913-1-lee.jones@linaro.org>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220331122117.1538913-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef748709-d63b-4fb1-8e97-08da1324fdc5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4881:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4881C505956DF35542DB88F192E19@BL0PR12MB4881.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OI+2crcrUdfT2V5by1iCFJ+eml77Ps3fbZ8Qaf9kkTFogcvlQ8u9N23THBn9iRALF6/J+3qbWTacZp7+hdCf9K+Nl2hygms5A95+6e3kv0XAabfqCeM+Ch3dWDL2k3FwCZ4UKBkpqHuwavhdoC0CpTCU3w9tvgEWk54BqHQdZFavojd5GhQEA3U3b7jNdNMdDlaMo7HCjJxztK6ZBr+wuf//nbSy9CASC86ex/iZFyP36fgOtzfLmRjchqZriTejIh+SfgDttvrVslnpIkVaYSBDH0E31Dftjgmw2SwIsQzNMeVe8aNbzQGkXQeZCDooJGSw79BSHJ4kHjG0gFGmqO1qcfQwACA04qF9S5+iCxxOGUpIDjxtcSD+iCedIq7GoNbLWwvJbHSTQW8YlR46Gkd9ZjrwSqllJBs9fAzZnGheexu6XMLzGGRaBAGyI7VMONuQT2srocc+Lmu5dNMRH3pBHREaK63Fr3H1C7Dzm7aoD95/j8PVRse8iGXugre/RJ0/TDvvciEwAEADM5pUvS3wJgV+atnQehgknrshnReT//7bf44/zbXIwMB1hSpOxnJzmlZzJhXejoPG2Npes19xidVck1cwrjUHIJnB8G8IqNO0zFX4w/tDuEWLGNZBofOrcTZZ6phBpADcrhTDe512ma8Ig7lV2/0r0NS9yMLmKIWxZC+jFv3bOcM1A4kyz3v+lOty1tFNyV9JM016GkjaSnlLVIH8aQyKhA3yrak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(2616005)(5660300002)(2906002)(4326008)(66574015)(6486002)(66556008)(83380400001)(66476007)(508600001)(8676002)(66946007)(44832011)(8936002)(26005)(6916009)(186003)(54906003)(31686004)(316002)(36756003)(38100700002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUsrU0w0QzlNMnpSdDF5NC9WTWZMaUJhVzBvUDFWbjQ4QXJxbHNVTlBUZ1p5?=
 =?utf-8?B?cVo5NWV5RHNVR3JLVFN6c2NiTHZCUnlsb1hCNVVmUlRVMGFhL3BQYmljS0xR?=
 =?utf-8?B?VHJ3WkhOdGhYbFNkbjR4YUltR2tBdFlZbWVhY2lweFdMVEJvWllOWUx2RnY4?=
 =?utf-8?B?c3VieUM2ZWRvOE5JZ1NGZFhvUTIzMjhLVm1Ld0xuTTIzQmwwTmFROW1VcEJO?=
 =?utf-8?B?VE9sUEM2UUtzNitScVJhNmh1eU9ieGI4eTJqbE1ha1pqNnJydy8wOTQvMi9k?=
 =?utf-8?B?dTRBc01FMi9kb2FGakd3eGw4YlFzb3cyNTFPajkyNG1ENHhLSzdObHN1U3d0?=
 =?utf-8?B?OHd1RURDcU1BTnpweGpHNmpHWEFBOStIQ3lPZkxqVGljNlB4SkF5U0NKYmJQ?=
 =?utf-8?B?Y3F2UEVrcVZPeFVLTE5NdS9rcTVLQzBhSnFWVlE3QkFwWDFKdTYybStVeEhx?=
 =?utf-8?B?NVE3aDE4Qmk0KzFtQUV3a0JzYjV5OTVsZ0xjdkNna2RiUDMzU1lDanpWYTZG?=
 =?utf-8?B?RzBXVzNIMFVsZ00zdStnak1idjBzTEg2T2FpNHlVRWxPZzcwSmJoQ1V6amdo?=
 =?utf-8?B?TmJYcDFsZkN0L1Zab2dvTjRhWmozU0ZybktqaDVKTlc3QWVkMXRvZVNqY0N2?=
 =?utf-8?B?QWlSRXdWSTBQSk9IWXgzTXphNFU3cExZSG1YcmtvdzNuQUtpaktlYitQdjhP?=
 =?utf-8?B?dEU3OHJHeEEwTVo4RC8zQSs2ZzlaaEhxNldENTEwVWdXZ29KVTdHLzk4NzRu?=
 =?utf-8?B?SlhQVHV1SGJlUHJTaFlBbnVHb1MrbUZRenRibGxRV1dNblJ1WEt2SmZHWkZ1?=
 =?utf-8?B?REYveDN0NGRCQjl5M2hzL1BMYW41NDJGVjVpOU52UUZkZ05KbHA5bE9GUE44?=
 =?utf-8?B?djBvWGpWNHBDUHdQQ3hCOThQdFBMeVlJR0wxTGdlcm1kem9ueGFZWElmUE85?=
 =?utf-8?B?ekR6dFFZTUJ3Qy85VnZKRTZPOS9BQjM3Qld2OVJIb0RnK3hJa2hNcGtqVVhQ?=
 =?utf-8?B?Wit3VVB1TFRLYm9qakVGWnhSclBoUHI2YmhpcnpTNTJXZVlZeThmUmlPanZU?=
 =?utf-8?B?T1ByOEI1SW5kODJBNldEN1pXdU4vbVFyR1NHaktZeU1CbWFBSGFrREo3U1BW?=
 =?utf-8?B?OTNwemJVZ2NwakxsQVgrVXB3WXdlU0g3ZEgrZml6aVpVQXFnU0YzQjlVamM3?=
 =?utf-8?B?WFlqYlJjNWRwYkNlZmhxSE9sSTF2aW9aaUZ3eUlTODUvR1Y2OXd6MnJTWEI3?=
 =?utf-8?B?OVpkSHl5aEowMjZTb1VtNmM3TUdZNnp4R3BYVkpTUWlUZGxDUk5NY2x4OXNS?=
 =?utf-8?B?a0pCVGM0T0h6M1lObmQ5b0VHRE04YVE4Vm5iS3RuajA2dG5RL3hmenVzWUZZ?=
 =?utf-8?B?ZFBBTWJMY1FQdVplc2UwcFRQajBoRnI4dVdMQVZ0RmxySkZqL1kwMU1Ed2hj?=
 =?utf-8?B?LzdaUWVzbmFoSlRZRXZ1bXU5cGVNbFNWSW1Jd2RPb2thbzNzbmU3Y3NGeGlx?=
 =?utf-8?B?OFlUaVgvK1RwVmRCR1g4WHBnUXdyZkhiaU55LzU2eThpVCtCZnBrcTVhR2dF?=
 =?utf-8?B?Z3ZSeUNYKyt6Yy9zTWtiZkNudjlaSmRRYVAxSmN0VlVZM3RGeXIzNGpBZ21m?=
 =?utf-8?B?b1BYVVFOdkxjdjkrME9qR0E3N2J1OHpKZnpnL2ltcHFjbllrUlY0NUg5ODJa?=
 =?utf-8?B?aGNPNEQ4TFBiRU9aeTVISGR3bk1DSURHelVIeE1yNGtvNWcyR3dFTzNIaFpN?=
 =?utf-8?B?YVdXbmd5bTdzYkV6SENXVXFMN0M1QmZGSlg4eVVCWXNhQUVLSTlSZG1YRjNU?=
 =?utf-8?B?ZUhjOE5XeEcxSTROTVQwWjMxYjJOWXNWVXA4K29VMnFwK25qdzVSdW5Mdmd4?=
 =?utf-8?B?a2N2VHNLQlFISVlyT3NBY2ZqbXA2dmZqNFhMQWRWc0xwZmdXMGhGc1pnaTdM?=
 =?utf-8?B?eWUveU9nNmVXb01HN25FRWNBRFc4MnVZQVo5WWZQZVkreGVOanUyc3ByU21C?=
 =?utf-8?B?OTEvRG5tVHlQWk5CQjJVdGo4Y1lrcnkrZGJaVlVoU0NwZWhnd3h2cmVFSzFs?=
 =?utf-8?B?VmJmUGpnMVBMZHhzRFdRWUVqOUpMajQ2UWg3VUFOUlpMQXFkbzJ5emFqTnEz?=
 =?utf-8?B?MFlGUFN6Q2NHRlBYZmtnQXhiN0crdWdHVXJKMDV0SldCM1dFTlJmUEorOVdH?=
 =?utf-8?B?aHYwQnNUWVdHU3VndnVXMVI1dDRNcThYS0JJV2dNa0hVRkJEUDgyWW1weWRu?=
 =?utf-8?B?bkg4MnhhZEZHTEMreHhnQVFibE5IaXN1c1BGWkIvL2N3UG1wMVViWVEybEE0?=
 =?utf-8?B?OEpIMmw3emdXNnRYZzBleTJ2UGFKNkZ2TVlraXVCMlJUcGo4Skdvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef748709-d63b-4fb1-8e97-08da1324fdc5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 14:44:42.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpAn1LZ6k2jZHZVa4hnBppJDNPjZs/qqnQel3tIrZybUkZiI7UGAUDy3ZGa8O7YkK2hKmt56W42FzuSeskCFqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-03-31 um 08:21 schrieb Lee Jones:
> This ensures userspace cannot prematurely clean-up the client before
> it is fully initialised which has been proven to cause issues in the
> past.
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I will apply to patch to amd-staging-drm-next.

> ---
>
> CAVEAT: This patch is completely untested
>          I can't seem to find a configuration strategy to compile test this
>          allyesconfig and allmodconfig do not appear sufficient

That's very strange. It should get compiled if CONFIG_HSA_AMD is 
enabled. I will at least compile-test it before I submit.

Regards,
   Felix


>
> v2: Also remove Client from RCU list in error path
>
>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 24 +++++++++++++--------
>   1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> index e4beebb1c80a2..f2e1d506ba211 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> @@ -247,15 +247,6 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>   		return ret;
>   	}
>   
> -	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
> -			       O_RDWR);
> -	if (ret < 0) {
> -		kfifo_free(&client->fifo);
> -		kfree(client);
> -		return ret;
> -	}
> -	*fd = ret;
> -
>   	init_waitqueue_head(&client->wait_queue);
>   	spin_lock_init(&client->lock);
>   	client->events = 0;
> @@ -265,5 +256,20 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>   	list_add_rcu(&client->list, &dev->smi_clients);
>   	spin_unlock(&dev->smi_lock);
>   
> +	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
> +			       O_RDWR);
> +	if (ret < 0) {
> +		spin_lock(&dev->smi_lock);
> +		list_del_rcu(&client->list);
> +		spin_unlock(&dev->smi_lock);
> +
> +		synchronize_rcu();
> +
> +		kfifo_free(&client->fifo);
> +		kfree(client);
> +		return ret;
> +	}
> +	*fd = ret;
> +
>   	return 0;
>   }
