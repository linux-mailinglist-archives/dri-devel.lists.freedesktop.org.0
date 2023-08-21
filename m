Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AB78267A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E58510E073;
	Mon, 21 Aug 2023 09:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5710E073;
 Mon, 21 Aug 2023 09:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjj97j5LygrbIbEWjxRme9EALilVYftH31Pi0oqMYDSK9PylsSSACnTwt1Jec7R98R7JQW48r1Ks1mrDPwbIFNO0Ys3EsNlTfh8LBzgnly45FxdeV+4YKoL9TC2+Xo+kSD2ipfvyNGKkpQKJM3doLlnY4Y/69s3txhTa0XrXj5o090n0Pjp+IZZC3efvBm1mAHcHkXB21IQQ+jtAo+Qj4U2eXip6UAuUVCDGhn9YXaIBk12DL50jPKRuX0Iq9TBDNQdRbB9p7mJgTP1B447DYB4naAmawPfF93GqkjBENAA3JusH0UG6+gFLLPExCp5oTWgC3Uyjse0VVnbCiWuPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN66zaP3lwfoqV2UOvrXFZpdCKp+a33OVKOOhVgUkXo=;
 b=cEuszYQ7uZXrhLPhjFv6SUp3URqwrw7ld2eQ2beJ1HJ3aDrDvg8slvxwdRTFWx4tpLJB+vR/cEVpjq6FUeZYRSuORmv5+M9LZ7L/xppuBptZGZmm+qL4OrfU3Xv39WaUHIWinNk4ObUgEPx6LuZJ4kyEkUDiAgTtmOgBhIELTJmOY8cN4RZsc4YpHjNVHX4LZyQfLfXMV/XfrKB2j46Q5t0hFXEqVfMbuPcOFfx1+yDYuFFPcKwySM2442FK1D3ZsBajlA1RzI7+EE0KUS3peJieUwS+x4gTraU7jOZPKi6nOGlnOBNKzRzfz17s7C8f4p2o/O+0i7p3flaldofF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN66zaP3lwfoqV2UOvrXFZpdCKp+a33OVKOOhVgUkXo=;
 b=dWsbUZ5sR1oyCrN+8ZVYUBhAJMV5DORRTzrbunWWSJivxI8eFYM7rGZcqvHP/MAZNUQzEFVMYJn3J7DEZFGc8F/LDgxhZZ9fPq2iKeFtz7bFuwvJ3R2toYau8lXMpgzjG5FGrjsWYZmdFn7pM5hBaX4usQhGxqBFv74Z0muejL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Mon, 21 Aug 2023 09:47:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:47:44 +0000
Message-ID: <50271db0-ea6e-132d-adab-23689bbd4028@amd.com>
Date: Mon, 21 Aug 2023 11:47:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/4] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
 <20230821062005.109771-3-ishitatsuyuki@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230821062005.109771-3-ishitatsuyuki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c6a5d0-395a-4c58-a361-08dba22bab3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZijOlXvE/GHaeQPEwFOC7xr+FZEgCGofrlLduJmrRZAd65Z3Ryxh/0BWsZuxpWRIlhzehSZuxtW9DMqyxPlEG8SHQgaIw88Rw7Xm692Lv5c1nP4ez3jjgYluRJHgSoWs7VQ6Y8beIQ8Khha1YE3mghr1Sy/K8OpZOLDuitCyNJKkOaVUh6hzVv96BFT5Q6UY9vRcdS2sD3eWF2JZqxO8SkjRtL2EqeRjMyJSFLtradYoFIawIlrnMcvYFeFcHHLzJTiA8rIRZl8NXNJ9GrxOAKJPwtbt4HpEQn1Yt71WTpIzvbwgox73URFcKXV9+2+n5LtQjK5POkIv/V0pRTMVeXJH9qSsR+wfJbntasZ7aSz9EY5hrni46V+hQG6jgkodAN+mwzeczrvBzSpYL6Vd/jdkTLColbrBnJsNKTAHMg+Xhj8/+RxCZwIazEQMWrSWSZo8mXyw0KXG0f/aq9FJKGZHU+SdNO7uwc3bfGATL5kFlNS/4KWs+EaiNzGJ3+1dhmEdOh/L9d8saoxQDV+oHLLc8u+w5GIArRrYhVEQ17sz2/jr+/3gFCR73C+sy1JM5GETnUr4Y+QLaEbaREJYtClN9AP9blS8uokZqzdyPSwUR5e8gZQnD6T83sSM0sp7Jhap50/V0EQPx72q+aTfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(2616005)(8936002)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ordDV0eWlZa1dLWmgvN21JVTNtTzB3TEhRUXdSMTlPMURJa3YveFNwOS9W?=
 =?utf-8?B?Qkc4ZUF3THlkUDg1UWIrUHBwOHFGTHZ5c0UvZk0zSldSMTM2bE5qdDVxaDAx?=
 =?utf-8?B?YjFrM1cxTTk2TmdrcWZ0OXp5VkcxUDVia2xsU2R1TzhzU1ZZdVVCdncvcGk4?=
 =?utf-8?B?eWZQd3pmY04zcHd0UW9teVFySStWTlQxS3Z2ZkxMNElvc3QwcFRzTm83dzhs?=
 =?utf-8?B?eFZzWWdGbXdDb0p2bHY2QUwvb3ovYmwwdWYrNjB3NzI2UG9zODhOeUFGSWhq?=
 =?utf-8?B?Sld2eDlONTliZFlCVkkzSEt6K05lcExMODE5ZnNLdjVzWlFvNDF5ZmwvZEpX?=
 =?utf-8?B?ak1BMG5WdlBiWW5nbTM2QTRyUFdXaDRFc2NpTDJOSVRndmhxNytHam9mL2Vx?=
 =?utf-8?B?aHBGemx4eXRmNjVvalpGcFVxNEJnUXRaaGcrTUI5VTFoZTQ0V3ZkRmZ5YjFx?=
 =?utf-8?B?YVR4cklwb3k0UHR4OHYxclUzZlZmcEV1T0JnYktjUVl3VDJnQmI0RWQ3eFF1?=
 =?utf-8?B?ZDk4VWVWNS9LdmN5c0U0K2FKVlZGM3JLRXZUR0xJTTdHaE5jKzV3WTY5T3Fl?=
 =?utf-8?B?dUhZSTJBN0djeDdGMm0vTENxZ2VQSXJPaDBqRVlreUlZMlRWa3pEZVF5K0tX?=
 =?utf-8?B?VSt1YmdnQ2M4RXAxeUdpQ3hwYnpGUHpDbC82aDlaaTRmeFJJdkpjVWFWUzUr?=
 =?utf-8?B?SlhSY2R1d2ZTbEN0cXpNUG50bkRUK0NUUDRiOEE0d1JCNUYyZzNheU9od2lt?=
 =?utf-8?B?YW1kcHM2Rnp3VVNSVlVYcU9VMW1ReUVZK0wvM0FQeHZ6S0dpeEordFdhcUU1?=
 =?utf-8?B?Vm90bHovc0NoTnZWM0tVRU02MW16VlkxNEkxYWVNaXNjSXVwMm83MUsxTzlN?=
 =?utf-8?B?dE9FaU1SZXVMUjkvUXNEZDI1MFVtWU5MNHNFdjJIb0FNQnlVQ0ZESVhZSkNY?=
 =?utf-8?B?NFp6UkxLaFhTYmFxSEMvWGxHdFh0Z04zR0duNkdyWC9lUjNJVFh4VkhUN2dn?=
 =?utf-8?B?c28vWTNhcHFXM3JJWXhJaEhGNEdwazV6eldKME1lQTdTZUtsZ1JSOXMwekt1?=
 =?utf-8?B?UjJxSzhyT1N5Mm0ybnJXZVp0Nk9RajBqVVhFS01pdlk4YkFXVHk2OVFVRVlr?=
 =?utf-8?B?Z2hPNGpzdDJMczh4aUJ2Y1NrK3AvMk55ZWcwSFpBTjEwNjdocDcwZmlwdkp5?=
 =?utf-8?B?ekloVG03cEllTEthTzBzQUxPOGw1MkMzZ2xkZ0t2N1ErQkpiL3V0Zk8vRzFi?=
 =?utf-8?B?WWcrWXRVN0pWVzlJaUhIWXl4RkYzb2Z2dlUxb1k3YzRGb3J6clVhYjRJM09P?=
 =?utf-8?B?SnNzUUtqRzZoWEF2NnlRL3dpRFlmU2o3VG9NSFpFQ3NEdTBaZnk2cWNua0Vo?=
 =?utf-8?B?cld3NytsNi8zZGwzVVJpd0wvejN4R055ajhhc2xhYlZVQTJYa3FmSXp1dGxR?=
 =?utf-8?B?MmdnTmlGNVUzVU5MeTFRSmtsQ1AzSUpYbWJjZGVLcmFzc2NBcGxyZjNYd3Ja?=
 =?utf-8?B?NEZyRUo5clp4dkVlTDQ0TTVaU212NmxqbllaWjlKQlNKVkpwT3BlRUdvbTJy?=
 =?utf-8?B?OVBXMUttZXFNOTJTamFodzNYcEFjQVpZUFVkSTJtaG1xb04yUzI3RldVdDZ6?=
 =?utf-8?B?ZVBaNkM3ektkWWlIQmwwdzYwQlFlM2NkRW83a1VwQTlGaXVQY0h5VFRHNTYr?=
 =?utf-8?B?aVdkWHE1OU55U282MlhOMFFkSHFLVS9PeWRrT1Z5cmY2YjhNdEJiSzlzSzhp?=
 =?utf-8?B?UFNwZkVjdU91dExBQmRuVWQvYU9nTTlTSXBaMmNlaHJNSlZFSkpDS1k4U0pa?=
 =?utf-8?B?bnFXOFFkcDFvSmI1Y0dnTUlkL0tBYW45bzdoWEptNG93WDNLODZrQkp1TVBo?=
 =?utf-8?B?N3B2a1FMRkZ6dDV4cEdWYk9rWCtaSWNXaW1lUkdyWGRRK2hlakJpQkNEMGxI?=
 =?utf-8?B?K2pSaWI4cHVzZldhd2Z2bk9iL0ZQVXhvT2ZpWHNCL2RHelhaQjI4VjhDZ0p0?=
 =?utf-8?B?SUgreVliMENvclBnRXFBY3dqSVdob3FqOGZQVXpnYUVpYnpXeUtQTDhrbFVY?=
 =?utf-8?B?OVF6dFh3SzFTeUdnZEl6ZWgxS2ViMEJSdmh4YXBTdDIyMW9NVU5sYmgzT1Vs?=
 =?utf-8?Q?twpBOmHcObGoIYs0ixYV5xmhP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c6a5d0-395a-4c58-a361-08dba22bab3c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:47:44.4172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQB5Qr4h3pP6tqeZatxJjHNSGAGHbgF/wr4+A7Tme6GVMrwx5MP0lY4n+WTWiMBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
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

Am 21.08.23 um 08:20 schrieb Tatsuyuki Ishi:
> From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>
> This should be okay because moves themselves use KERNEL usage and
> hence still sync with BOOKKEEP usage. Then any later submits still
> wait on any pending VM operations.
>
> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
>   way around)

Well that approach won't work like this.

Basically the whole approach with the implicit vs. explicit handling 
sounds like a really bad idea to me.

What you need to do instead is to give amdgpu_vm_sdma_prepare() and 
amdgpu_vm_cpu_prepare() the information if this is an update triggered 
by the kernel (because the BO was evicted) or triggered by userspace.

Take a look where the sync_mode parameter is determined instead.

Regards,
Christian.

>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index f10332e1c6c0..e898a549f86d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -51,7 +51,8 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
>   	if (!resv)
>   		return 0;
>   
> -	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
> +	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode,
> +					AMDGPU_SYNC_EXPLICIT, p->vm, true);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index e259a51e7c56..8cb427710d66 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -98,7 +98,8 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>   		return 0;
>   
>   	amdgpu_sync_create(&sync);
> -	r = amdgpu_sync_resv(p->adev, &sync, resv, sync_mode, sync_mode, p->vm);
> +	r = amdgpu_sync_resv(p->adev, &sync, resv, sync_mode,
> +				AMDGPU_SYNC_EXPLICIT, p->vm);
>   	if (!r)
>   		r = amdgpu_sync_push_to_job(&sync, p->job);
>   	amdgpu_sync_free(&sync);

