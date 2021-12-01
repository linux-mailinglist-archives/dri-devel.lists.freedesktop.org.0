Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FB46513D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7476EC3F;
	Wed,  1 Dec 2021 15:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BE06EC39;
 Wed,  1 Dec 2021 15:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=am0tENs+u77hx1Q4eWYNNLy1Q++VEai6SIqiYF5gBaOdheVmMSTgy/LHg3dhq2xbIhev9PzU3A6L8M3+YX/uSgWI5l1gS2vmhbqR0FHNJrb9m7IKCI/r6ljQOwlunuWM6AGbTuXqvl5yLJPTMk+JXWEhnRU9LDV86L5wFyxoX2YYNYrYyG9XB7QJPb4wk5uBug2GoM4ZY4hkghXKJmiSKnLaA8xKak2/x6Jjn8b5UjMr0PCnsNwFZYNCE+gVP3Ltcp1BiLeLmAhDan0htFZVmqViQEygdy0CxRUrXSlsTtUJ2snw7wX698QSgEr1u576TGEJnqyLVl85/hD3Yg7U0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0wWtlQzS138PV6j6YitHVQSA++mDv6izkZub4nwTu0=;
 b=VrzIt0gRYKTTSiQ+TxDlYo0buLBKrWgfsYeOR2F3+5VF+xlt8yxMrpYtxTUz58yaEu5haVH+0AGMCPo2Nvqczse/1FxhjQ0mVj7bVcCPxEB+CmcO/01KUzuq0Gk4QIYfhUcfwNefk4VcPdbn6QAHrDcq/P/dy7kEsEb2UBQh8ehQOz88eu+xP8/RFiKj5QccjxSRr6oy3qM3GmvboP1SK2O2Tcxl8AQ/ZI223XS1hpjsaaC1O/hZM49GGQGouTphkuRIxjP0J0kkG+dO+2pp4BYdp4iHcNPFvMVOys4NFDUMJflc21HRZVTnvDnL22IVv8ifH8uyqsj81LOYd+MiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0wWtlQzS138PV6j6YitHVQSA++mDv6izkZub4nwTu0=;
 b=drq5BJsp2nZ8mkK7NfCAf3LvH98B1VFQ5wwTNcvFGDCNm8JD2t6GPTuS88CmAvILK5b2E/rRzQyLyxm9QbGtolu5i1edkDpKyLObh7Y2hhlGfREKLXnGldBm4fQsrMHtmqujhzU9IMYILoS3AdlEGgZ2Dyngt/66z8kWR97uFsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1535.namprd12.prod.outlook.com
 (2603:10b6:301:5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 15:15:54 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 15:15:54 +0000
Subject: Re: [PATCH v5] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: Zhou Qingyang <zhou1615@umn.edu>
References: <e2685075-fbc5-6f36-907f-76b6f76a59ce@amd.com>
 <20211201151310.177671-1-zhou1615@umn.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <77fca7d2-b1d8-fe11-322a-3d32f40f6f65@amd.com>
Date: Wed, 1 Dec 2021 16:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211201151310.177671-1-zhou1615@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0371.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::24) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:c980:c3d0:3f34:db36]
 (2a02:908:1252:fb60:c980:c3d0:3f34:db36) by
 AS9PR06CA0371.eurprd06.prod.outlook.com (2603:10a6:20b:460::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 15:15:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e8ba661-f0f5-4c15-e752-08d9b4dd7810
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15352AF03E3649A90FC0881E83689@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75yT4EgNvzxjka/knnO5SMjYGyMnHMWuVsANEgdNAlzuZbE/oXFn26Rn4VsNlHK0p2Wuvh8Xjs+ByH9HCaQPQRkELQa8gp8TQwMpUxySkH8d5TeD6E2o0cyQSBzV9hwYzTTskt8RzPh42K3vwh6DFYrdIsuLA1okeAGKpz9PU9GJ/QQoFDZif8BJiDhq3yYdTCtQLFKGRtwmTp76KSANsOA2MDee2NQ8XW9cNgpGquUsegMp2ZG0phEzmZ0Ug9FiLNerMOP+5cEGwYkUofypVZtvfy1hKcmarurg6WrAH2fclpha32OLJ9dw/LJeVUe+6mVAZc7LK1M2stRg0HL9q1uEXBk+hmvMgyUBjMmqrJPc3eqOUXGD02MeKbEwaLsNzSTQcq+UgvoC/RYX8v1ePBLZ/ziHfegQvq5aDqc3tYzmzUbls+phpiLoT34yBqirO47sex41paqT4XmA0CQVZjdGq7wXn66WjSx1ZIdIJr769UAsNv+cQl59jRzqxtSScd5rVVjqpWOXJi+vD+EyAcCCFaRwIdz0srPvcLkKK5xMgaGcBzN+RZ7DJ6/k4EM/sSwFtrhq54UbiXWTqbH5nG18R+7jr0MrusGfx4HR2udaFfvLfYPXIiD6dH/okMhGfC/+pQ2kDiD9adqEnFozSpWEOdLJ+FxCoFQFDtL1uDuxQ8+5FX3bPvOJpfmhIUeKfP1uAqHPM2MfZ35IWWHN0Yl0/7KTJmP6AwqIJ/HvBCQl1wq9Xkc/nnyayjUuxHTh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31686004)(66946007)(83380400001)(66476007)(2906002)(6666004)(6486002)(6916009)(8936002)(38100700002)(5660300002)(66556008)(8676002)(66574015)(508600001)(186003)(2616005)(4326008)(54906003)(86362001)(316002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFNbmc4Nm9FcmJVNHE5anU5STVQaE5ORzhoNklFdFpmUWM4NUdkcXpMRVIv?=
 =?utf-8?B?SGJFU2RWemhtKy9JdEZ1RWpCaHAzQ1JJcUNidzhGWVhudXlBZTBUeGV1ZGM0?=
 =?utf-8?B?WGRuYXpVWXFHRnVDNUNQcW5TbzlmYzdMdkU3S0NuTUFjTVBaMzlLUUdKaFR4?=
 =?utf-8?B?NVpFdisyYW9UQk1pdEdITFh1UnVZbjhGWUlIV3U0b1JPVHZSajRzNFVPNkxw?=
 =?utf-8?B?bmgrc2ZWU0VqbFd1QVMvdkI5RXZnZ29Td2ZzblFoUDcrOERWcklhMEg1VkNn?=
 =?utf-8?B?czJKZDJWRGJWTmxMaUlTRG40am1IOXVCTlJNK0tIOTE4UHoxb25RSnhEbW5V?=
 =?utf-8?B?bWNZUzh4czB6ME1EeG4zNVBEUkhNejFzbWw1Wm94ekp6Vy9Fb2lwaUZGWkFT?=
 =?utf-8?B?bHl1WmNvQmJsVHYzUytaNUFMWHYxMW9LMGNJMUFUSnJTakpiOVpaM3JCL1Nh?=
 =?utf-8?B?VDhiUlBEL1FoYTdPWWVjWTcya2NRbU9pUkVKUDJTVU0vQmZVOFFmQ1NmRDFK?=
 =?utf-8?B?ZGdJZVZOcHd0anRiWEZNY21jbzZ6WjRxOFVwVnZBZzZXVHl5TE5jZTNYMnVz?=
 =?utf-8?B?TDlkVE5Iemxab3pxaVE5ZVg0Y2JjbHFydFZzSlMzOEc4SVM1S3A0MHpuci8z?=
 =?utf-8?B?UzFSbDRkRE1yQ3pjeW9nSzg0d0FuaXgzNDEySTNqcGhhODM2WG5BbW8vWUNJ?=
 =?utf-8?B?T1E4YU42RjVoMU1KT3k5YUlOYTZocWZrMU5Td0xXdWpJY2V3d3M5aXQydU9l?=
 =?utf-8?B?RlFXUklkL1JNTUgyOFhSMkhILzgrRGM0TXBybUlUWVZpWENGWWhaeUhCMTA1?=
 =?utf-8?B?M2QxT05xSUNYeUxjR05WbXYxTTJSajdPckZQRGh5dStXeTZyVkRkUVJ1bWZY?=
 =?utf-8?B?U0ZGL0R0VW1qV0tHWEdoRkxaNUljTjJYdUhYWjdYbk9uK1o0azJneFJONlpp?=
 =?utf-8?B?TzVlTnNTbjdMUzYyK0d5VndZc2s4bjRPMStIWGZiZHJXVjRPbDVvNnF0dUdZ?=
 =?utf-8?B?eUNFZ3hqZG5vWHFMQ2wyRUVDS0dhdFN3WEk3Wmkza3pYeXV1QVBpV3R3a2N1?=
 =?utf-8?B?UnNLRjdqWGRWUUhNVksyU1JiUS9RSmdhbkU0UXNhQStaazVBN1ovTkJPMzVP?=
 =?utf-8?B?dGJIeUdVdFJsR2lLSGM0SmRCdnRqZFBHTlJWcFI4OFhmK3NoZFE5ck10bVUy?=
 =?utf-8?B?MjBjOE02SEs0OW9XTlNwajNaYjFLQ1RidktPeEQzRStSeWhZSHU1dFR0ZkNR?=
 =?utf-8?B?SHpBQ1AraXJtWlJTVGg3UFU4OGhjSEx5NEJOSE5GUUs3Tm9wekZLb211czYr?=
 =?utf-8?B?UGRYTmUrMW4xQmlqY1dxNThGMGN4K3JGd2hYRVkxbk03Wkxodi91YTk5M0Zp?=
 =?utf-8?B?cHJuT0w1NjN0dUhjb3A3ZU1FZzFKV0pjMnpxcXhmTUhTTWMxS1dlbWFXZmto?=
 =?utf-8?B?YWxzYU9qWEVSMm5HQlFJdmJxam9CNTlTNldGanFsSExGaGp2NEZWekZhRTBx?=
 =?utf-8?B?U3FWRWJ0TDNkaWl0WDRHWXZra3NHMGJKb1dyR2hmR1FmK3VkcjJFb0Q4RUI1?=
 =?utf-8?B?cjVFWTcyak5MaXpqejM1ZzYrU3kyWExmYWUxZTZZS09qVHpqalI3VDlxZHp1?=
 =?utf-8?B?K1dYeEZMS01QYlJYWk9NRGR3OWhEY3Y0dHNpalpUSjVmMklQQlpSYWFiUzJj?=
 =?utf-8?B?RWl2eDJHbUxZN1lHK1VmdDFmam1xWUM1ZTZJaUYrOHY2eGFhMWZrYmlDR2ZS?=
 =?utf-8?B?VTFQZmhsdEdsQklGZVlsMHNvcEd2WFExbWZCRmoyRzRkZ3ZLbzlUU1ZaNlhj?=
 =?utf-8?B?cE4xVkovVkhaeENPOWYrOG9MeUJSSVRtMDBEL1NWdUU3dk9RSG1aYUN1bFJa?=
 =?utf-8?B?Rmw2dXZ3QnkvanpBaHU1Q25YdHZWRHA0OS9xTWN1YXBIY1V2anZDNUFVUmJp?=
 =?utf-8?B?dUY0bXBHT0lJSEQwWERVYkVYNkxqaCtZOUlodnRyVlFXOXB5MXJPOWxKb0RF?=
 =?utf-8?B?TFZBRml2YjZPdml6WW5DWkVSVmd0cDFaWWxJdk9udG5xOVloUWM0RWVteFFG?=
 =?utf-8?B?WUhGWWR2TEVJRERBb28vR3lWTEkzcHRZUGs2RlRUTTkvV01DQTM4L21sczJ1?=
 =?utf-8?B?Rnh1dzRESElkTmhkOGhCWVM1NHZMWUNxQXd1UWh4S3lXbSt5amtOZHo2ejFi?=
 =?utf-8?Q?P2Rn2x5bTYYNTEAXrMOgASk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8ba661-f0f5-4c15-e752-08d9b4dd7810
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:15:54.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOIo3GlkEUJybcfh8UyKzZDbNlqa+dPCy/iXW2sL0H5JZ0McYdEZkmOgUoJR0r2E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
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
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.21 um 16:13 schrieb Zhou Qingyang:
> In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
> vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
> radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
> which could lead to a NULL pointer dereference on failure of
> radeon_vm_bo_add().
>
> Fix this bug by adding a check of vm->ib_bo_va.
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_RADEON=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> Changes in v5:
>    -  Use conditions to avoid unnecessary initialization
>
> Changes in v4:
>    -  Initialize the variables to silence warning
>
> Changes in v3:
>    -  Fix the bug that good case will also be freed
>    -  Improve code style
>
> Changes in v2:
>    -  Improve the error handling into goto style
>
>   drivers/gpu/drm/radeon/radeon_kms.c | 36 ++++++++++++++++-------------
>   1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 482fb0ae6cb5..66aee48fd09d 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -648,6 +648,8 @@ void radeon_driver_lastclose_kms(struct drm_device *dev)
>   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   {
>   	struct radeon_device *rdev = dev->dev_private;
> +	struct radeon_fpriv *fpriv;
> +	struct radeon_vm *vm;
>   	int r;
>   
>   	file_priv->driver_priv = NULL;
> @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   
>   	/* new gpu have virtual address space support */
>   	if (rdev->family >= CHIP_CAYMAN) {
> -		struct radeon_fpriv *fpriv;
> -		struct radeon_vm *vm;
>   
>   		fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
>   		if (unlikely(!fpriv)) {
> @@ -672,35 +672,39 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   		if (rdev->accel_working) {
>   			vm = &fpriv->vm;
>   			r = radeon_vm_init(rdev, vm);
> -			if (r) {
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_fpriv;
>   
>   			r = radeon_bo_reserve(rdev->ring_tmp_bo.bo, false);
> -			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_vm_fini;
>   
>   			/* map the ib pool buffer read only into
>   			 * virtual address space */
>   			vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
>   							rdev->ring_tmp_bo.bo);
> +			if (!vm->ib_bo_va) {
> +				r = -ENOMEM;
> +				goto out_vm_fini;
> +			}
> +
>   			r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
>   						  RADEON_VA_IB_OFFSET,
>   						  RADEON_VM_PAGE_READABLE |
>   						  RADEON_VM_PAGE_SNOOPED);
> -			if (r) {
> -				radeon_vm_fini(rdev, vm);
> -				kfree(fpriv);
> -				goto out_suspend;
> -			}
> +			if (r)
> +				goto out_vm_fini;
>   		}
>   		file_priv->driver_priv = fpriv;
>   	}
>   
> +	if (!r)

I think that test is unecessary now, maybe double check.

Either way patch Reviewed-by: Christian König 
<christian.koenig@amd.com>. Alex will probably pick it up now.

Thanks for the help,
Christian.

> +		goto out_suspend;
> +
> +out_vm_fini:
> +	radeon_vm_fini(rdev, vm);
> +out_fpriv:
> +	kfree(fpriv);
>   out_suspend:
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);

