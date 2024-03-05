Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FB8725CD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5BD10E1B8;
	Tue,  5 Mar 2024 17:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xNhXW1xT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F8310E1B8;
 Tue,  5 Mar 2024 17:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZysn3ZRBp9ZUbVArv2IybgbhkzKFuv9cseDfI1GRfFE7m6kXMDm8yZ2LdBY6DESoTgYSAbAk72EE7B6TLrp+oTQEWzd/h+jI8gZHgNLrCiGZ7kymf38hqmIyfIzdRL5lEKvfN4PhUPA15Y+OSD/5SepxU7EVo2AzJ+PZb1YnxZ6E5e8wX6036wpdWMQ8wrAOF6CPSmw2eiUxpcEk+GKkzgTkgeAgf9xm0ir+jnuzBX3tR06rqV1L/UJLc2Cw4AXFP+QULjk88n6BZzXlTDBeyoT8M7WgzRoNeclbygFzkyyVsp1rSie3AgCuTVSlc4w9iPSm7luP68F+p+54szEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC6PG9C6Ebr1aEhO2RbBNZaB7daopVk03fZg1/SZ8xw=;
 b=PLrQsvd4DmYatMLO522QO86kNwzCSQVWaIRfGyvCHZDfdp2ckJQgRzh4zUw5QWlLvVZL71DWJeRUtY5oAmbokrJbIgY6vsIPsTs986kIEeq6DRPGI7jBnz91ELHAeieMvfYpfA7STdgkoRSJMVE63/zZn2tAAT8L9s2FqoVhIQXyCbNT0kpu6POSRsUjYubZB+iw6yAiksbqbdZdOowWrUkEcxyvdVkytsoWMg4IrGVbEpMehCeMqGeqJcrCIjAG4RWigXnbzoGFnESCnxrkYq1rdBRTtJ4ELb0b/dFIGqEtNN0JKy8A39ALKFSXLmDf6oK7H99fGbRw2Xuwk6gRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nC6PG9C6Ebr1aEhO2RbBNZaB7daopVk03fZg1/SZ8xw=;
 b=xNhXW1xTOOVtRYthLksOOvID1J7SGCwUzOTc776ePpUJVmTwp9pafcGyDValAYiWak37YgxxJRYN8/R32UdvbXZRMUNtchvV30SZp/txhPERhne881qvtmnM5Ecs/OmhoZNpCsWifmMjRX/1XNXwzk1uARTuS0c1SmH26F5E5U0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 17:38:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 17:38:28 +0000
Message-ID: <0f572801-8dcb-4124-94fa-cb219f60730d@amd.com>
Date: Tue, 5 Mar 2024 12:38:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: make kfd_class constant
Content-Language: en-US
To: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240305-class_cleanup-drm-amd-v1-1-ea99b37f26c7@marliere.net>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20240305-class_cleanup-drm-amd-v1-1-ea99b37f26c7@marliere.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0024.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4529f1d5-682b-45fa-e621-08dc3d3b117b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnSs4r8SXxuvFWtx06c23JpGy2n5a+igUVzVH3+f8iE9es1nau/1NEtANyrl1dDisGiO9D4+uVXmgirJv0YWB9R7Eylp3hlgD+O1MGhn61EQW7yRWB1ybHSoog8oskrQt9sbQHnZTHjlnI3gNhLD5UeJGMd63Fz3KTF/ZTbiDHvZnnIeL7ytNPDjihX3ujv1SuU9IxCnRRPJvmMnqz8JQrwb2lLh4BAO3z0nGZYhGTOvI8SlSiNuDkxeNT0NDw3UIe6x9RsSvqOurLcvGPujuIfAi+bc7CiEQX07FDdUxk4lBSMDLoMM4b3yHqiLngKRm28QM8qDWXPRPliZhgQfQOHKN+NmEvwiZMHHbHHl2y8KoDdALVD/CQqh7mvnS85362qg2M7XPtuJx4Iodq2ONFD8SXPNA2Gfs1a/qevhj7oUuBExYpA20D/GrqEsKZzgXZz7UjBeG5eqBQDEsIfbAGAwfwZnFm41acsMqgaWGzrScGsqnv9EbLZEuOoLUo/FQ5kP92JESak33WFVIR4DK0gJ/UG1v4iqpblLnStleodFkK6jUbYtZbcZUEDD0+RoIjRc9jhvNn8Oh8WJebuuILr0reJ/uFUBaeov1eAIbFDMcPFGEjhy+nYPY6GtNt3CV53f1BOW2LHR1pznLPJsNLKgD9xFaJpnQE0rokALkPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWN2ZHYwMzg5Y3UvR1pXc3Z0cDNMcHI4N0VLbExmY0hzT1U3eGR1Nytqb2Rj?=
 =?utf-8?B?OXpBa3FrZGxISlpwRUhOTDM5QVFKK2cxUHpkK2pwNnliMTREbWF2c1JDNGFq?=
 =?utf-8?B?WVpkR2dtZjNWRkh0emFVVmJlOEFzODZwQzJZRUwzaWlSSUJsYVB4ODd2WEVI?=
 =?utf-8?B?VVJoRUZYOWwxVkl5VEFvbXBIZDlRakJJM3lZb05DNHBROXBsYWRhNEthZk41?=
 =?utf-8?B?bmpMdGFETTc0SW91N0FLRUVSeEkvTUdGVVJ1SWF0TWs5OTcrTmdsVXJWM2Rz?=
 =?utf-8?B?SHZXeE9aeE83ODFiZEtlMW5Eb1pWVlIwaGhwWUczcTJMYzArNVVCZGp6UUNi?=
 =?utf-8?B?ajd5ZEU1NHRKYVAxWE12L3M0bmlXbzV4dmV3N01DWUdoNUlDY0hVMGF2MTJj?=
 =?utf-8?B?NDRkbStmeG9xSURsQUFzenZMVmF4K01sV3BVdkU1bmZHZFppVk9pVjZ4MmNX?=
 =?utf-8?B?MXdPUi93dkJUL1E3cmUzY1JGRXhRVndLdVptR21zZ2JrUmFEdEIxaWh0dHNF?=
 =?utf-8?B?ZXVkd3g5djd0QUFZWTViajYxY1M5Wm93UEJManBQS0JPQnRDU1Z1a2gwNTVC?=
 =?utf-8?B?a1I3bDRkR1dkK0podkRDbERqR2lEUVJPTWFWMW0wSEhRL21OODRJMmtjN2hu?=
 =?utf-8?B?L2RjaVQxV3R4OEF0SEp3ZmZqQ0ZTNzlXRWF5bUdlRHd4RnptYis1UU52Q21x?=
 =?utf-8?B?bWlyaTFDV3l6WWZhN1duZkloSjBweVRyR2I3elJDVUZrRWhEYklIN0VNbVMw?=
 =?utf-8?B?VHI1SjZ5V3psNHRHVmIzaElkUU5iUS93RXhad3RoQ3dSRmE2MzJrcUJ6cmNO?=
 =?utf-8?B?b0EvajQydE4wcDJKb2kzazk4RWQydkxZNWJ5bXZ4NDBIWXcyekRHU0JGb2t4?=
 =?utf-8?B?US94MlNqaGs5aEdUaS9OMFNUdkNlTDQ5VzBnZUhyL0xydWVxeXU3WFVXN0I3?=
 =?utf-8?B?djlRRSsxbDNDVkJhQThNV0RLZE5ubldUTldNRTJoQmRvRjl3L2xCM2VmUXo0?=
 =?utf-8?B?cGNxeWZrN1BzQThQWlU4SVZHU2RIbGpTdnFZd3hQcDR3WVZONTBEdzFXU1g3?=
 =?utf-8?B?MERkY1RLNUMza1RmYkRKWjBtRGV4czJlK0RXQXl1S1FzbElYaGhwZXN6K2I1?=
 =?utf-8?B?UUV5WGdQLzIvNGhlSmFzY1EwTFBTNHpMSk1TYVhUbEtiaGUyZDlRMUxtdWsr?=
 =?utf-8?B?MzZNU0NJTXFlK0dWVk9GbGJwTFNKVUQwV29acERONDdZelJhdUpQa3VUd3g2?=
 =?utf-8?B?aW5vTnJVZ2FPZjNTWDJXanhNUUMxYkQvWnQvcW9xYm5ZNERYK2N5WWZjRGl2?=
 =?utf-8?B?cDdMS3pCcy9objVJdDVuWWRuNVdIRWdxZmNqNmozcHZma0NMZDF3MTRYa1kz?=
 =?utf-8?B?TU9EWGFYNFhXbDM2RE5VMi9DZENFVVE3L2c2MGxwWE82Q2N6cXR2UFJLU3J0?=
 =?utf-8?B?TXZ4bkRzNlJjR0FzK2NSL2xGcUh3clRHRGx2akxuTk5yUkdSWmZhMklMZmJC?=
 =?utf-8?B?S1AyRWlvc2k4UkFYdG9pbW1zRjhka3pnMzNVSjVUSkNzT0hLT05paFdDUlRK?=
 =?utf-8?B?YzBDcW12WFp0RVBsZ0lpa2JMdW8rNzZIaE5DMG1HWExoaXoreDJGcGxnNnBr?=
 =?utf-8?B?SSs3YzZKdWNuRXZ2TXZwN3FMSmFnSEhhSnRIVEpvTEY4OFl5dE9DcnIyY3Vp?=
 =?utf-8?B?SmdWMlJ1YVRXTlQxQlZMS1FJd3llVTRkMy9nUWFYTGdhZ3pLZmZ2Sjhzd0NT?=
 =?utf-8?B?aXkvVmpQcDNVZ1lGZCt3UE1kUUVrTGtyZ3Bac25XYnNDMnZOR2EwMHBHUVF5?=
 =?utf-8?B?aEdTWFRyYXhoK1NldjVXTW5UWjRROEFJODZ0djVXZlNTWDlHU085L1FGUjJa?=
 =?utf-8?B?c21KNWVhWmExNWs1d1NmSHZSMDhwRFdub1crMGlicVlaMi9tS2gvSGRvMVov?=
 =?utf-8?B?ZDRQTEtBVElIL05wQnlVOHVaVzh0eTNJd256Tk5mcGYzZk9JckZ0VENFc3Zm?=
 =?utf-8?B?emFaMWF6SlZmS2wzb25kd0dGNEhzSkVQejFMMk9LL3RKa2ZKNFJDN3I2Tmx2?=
 =?utf-8?B?TUNQMDdwR0lTZDhQMU1tNCtGeUI1MW4yR3pHaGdFS3NTSlBjZTJnK0QzMWFq?=
 =?utf-8?Q?xRm8lALu1yHPhJEeZh6TEX3NV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4529f1d5-682b-45fa-e621-08dc3d3b117b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:38:28.6805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fLv9O7H0woLRkGLNLxTCG50QN8MfTJ7Se/BgS5L+MveJMOM/Yvl7ms2DKAfZXXGsobrvaZ2EDwWYlmOpIMzeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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

On 2024-03-05 7:15, Ricardo B. Marliere wrote:
> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the kfd_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

The patch looks good to me. Do you want me to apply this to Alex's 
amd-staging-drm-next?

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index f030cafc5a0a..dfa8c69532d4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -63,8 +63,10 @@ static const struct file_operations kfd_fops = {
>   };
>   
>   static int kfd_char_dev_major = -1;
> -static struct class *kfd_class;
>   struct device *kfd_device;
> +static const struct class kfd_class = {
> +	.name = kfd_dev_name,
> +};
>   
>   static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
>   {
> @@ -94,14 +96,13 @@ int kfd_chardev_init(void)
>   	if (err < 0)
>   		goto err_register_chrdev;
>   
> -	kfd_class = class_create(kfd_dev_name);
> -	err = PTR_ERR(kfd_class);
> -	if (IS_ERR(kfd_class))
> +	err = class_register(&kfd_class);
> +	if (err)
>   		goto err_class_create;
>   
> -	kfd_device = device_create(kfd_class, NULL,
> -					MKDEV(kfd_char_dev_major, 0),
> -					NULL, kfd_dev_name);
> +	kfd_device = device_create(&kfd_class, NULL,
> +				   MKDEV(kfd_char_dev_major, 0),
> +				   NULL, kfd_dev_name);
>   	err = PTR_ERR(kfd_device);
>   	if (IS_ERR(kfd_device))
>   		goto err_device_create;
> @@ -109,7 +110,7 @@ int kfd_chardev_init(void)
>   	return 0;
>   
>   err_device_create:
> -	class_destroy(kfd_class);
> +	class_unregister(&kfd_class);
>   err_class_create:
>   	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
>   err_register_chrdev:
> @@ -118,8 +119,8 @@ int kfd_chardev_init(void)
>   
>   void kfd_chardev_exit(void)
>   {
> -	device_destroy(kfd_class, MKDEV(kfd_char_dev_major, 0));
> -	class_destroy(kfd_class);
> +	device_destroy(&kfd_class, MKDEV(kfd_char_dev_major, 0));
> +	class_unregister(&kfd_class);
>   	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
>   	kfd_device = NULL;
>   }
>
> ---
> base-commit: 8bc75586ea01f1c645063d3472c115ecab03e76c
> change-id: 20240305-class_cleanup-drm-amd-bdc7255b7540
>
> Best regards,
