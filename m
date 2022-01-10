Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95EE48A35B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566310E39B;
	Mon, 10 Jan 2022 23:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2507910E387;
 Mon, 10 Jan 2022 23:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZJmP7rTgS8YTHWORy5asVGbKnfu3zTj9b4w6jT1hq/bMRTHYspmsPJmIv/QHyparZior2XgCllhrUqZ2Jqr1w2ODh0WIBWgiIi1GKD/zY9712W6vdt1z8sVXhybqbH+SMPNnXUn6HPiO/Du4S94y7NV1d4Gt3kPVWmFW/BzGzmuvp2ho4frG+Uyg07nlWQK/Mr4dZGY2rADiUKH4I7fc4YJJOOgDmaiJF7bpezm5Atkq4sCAFI9M8J2q+kpprSMIg60GmX8XxQIArbnhXjy37En+95sEax1VUaFMAnMtzoojB7pw2LwDRfcIFJeBfp4D0K1SPh7SpQmFXa9S0BdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSB2+PPeATLqwLoiUIPhsdUOKgHODi2XO+jDugXp7Vo=;
 b=S08XECjisIg0UY20+L9hy0tciAGwbr+BGxVmCPDdcwJV+jcYfbnEcAtFyKfq/svbQSpJSwQNHl+NhZNeGF4BXSoSkDRxIghkKgpiXqnbwL8L0TU1RoBOdZFh0dnZhpzRTJ6mchirMilzBwpnkoGKllbn+b+M2PvgtU01m0I2FbOzG8twdWsS9Ne+HTAfR31Yj+pBKyqf4lL8Zvvwh5XH416xyEgag91N9zmQs4eG3WVQXcEoQopmcQN4x4LEvDBeUL8sn08U64wzGAKuwhR9lnEkkuzmk+QEJfD2Od+DJDlwEwA7e4MasDt9hr2NHjnfB8h06kzrIMFuhHgIXQOnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSB2+PPeATLqwLoiUIPhsdUOKgHODi2XO+jDugXp7Vo=;
 b=zbs1KNHqq8xi/0WOg8lDIDuZvI8LvS7Ew04OoRW4mz4WxNKfn/EmuStUGUEdj9BUWyVH0sUXczSTUaTYlSVVd4CSUv6UP2Z5gMPyDYQ8Pss8hHqqMIx1rG5ipDf1lUcMhqsSiLox1J6EeU1ShPyyy3/mHQSk5EMzc5xCwYgmsfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 23:01:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:01:13 +0000
Subject: Re: [Patch v4 06/24] drm/amdkfd: CRIU Implement KFD restore ioctl
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-7-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <c1cc36cd-00ff-7f31-080f-7d2c34057099@amd.com>
Date: Mon, 10 Jan 2022 18:01:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-7-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR0102CA0045.prod.exchangelabs.com
 (2603:10b6:208:25::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8de8c009-6c3b-4c7e-b18e-08d9d48d198a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5292:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5292AD34F8D4ADE95F54F8C292509@BN9PR12MB5292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihRMbaOeDV8L/f3EYKVTG0URNw18etBhvKfDN0R0ZoxebVJYm/Ev41sYcLM6B+lEoo181KeDUGBG1tMDeDzPHfd12qBmPo2ZwZcXreZeUsuyzSoW1RZigUS1aS0wMw3mOC//3OJPmmL/uRy3LCDxV0hl4SYtfx5LP2iHTnCC6JJc0xsHjvGZPdc2CoyOh8enRCQMFuGPYgZdY3zCziJK5TnjQrFqx9Y1sOtEtBCeB8XI+o/dH0Oue5MQWuRPawJNOoRcN/UWDLTACPDJR4TcZTxr6935Fp6zMX1Q2qRs3I+hLykhn2TYAbHvPfqzonfnvzd5AoCELR3MiX5J2IJpP6famBhtooFhv0AsF3eAGtVu9WrjgmrpI3Sr5pw6vN0FWFQ22YDwYXJ2PKDS7mYmem8bcWflnumy0pdEIz/pRDLIKpZu9EFtreMPG9BB8ccQce6Ru7iPgwX+IFvf6awkPla9w82CS0ZQB3oqOc5PEwDvsJczzcAUxfvr8h9yYGxuI3Vrg77zEZ93rijiIjRVIH4VLOTzt5gp3bM3q+PFUy9wvtkp9WlsfJZTw9T3V4qGa610yK1tT3Htp1qq65Mc2G0FRK9n4ldGRj27E3pAU5vaFptue4sD2ojXMzH/hIfMy7SSRFXxCv7HAzDSBtQwOYjzgO0YT9e22pMMXypHB7RrTvWxIRviL3kH0KtUNoANN59ROd0Ih/aoxvdhtQZtCbNeyvvlIicA7OpuDdjlcTB2bu+0rSeh+lSVe+aHZHn1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(31696002)(4001150100001)(36756003)(6506007)(30864003)(508600001)(36916002)(8936002)(4326008)(66946007)(66476007)(44832011)(2616005)(86362001)(66556008)(53546011)(8676002)(2906002)(6512007)(83380400001)(6486002)(5660300002)(38100700002)(186003)(316002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REh5TEpzMVM5Mk5aQ3R2WWFDTGNlYVlGU05QQXJsSTZqWXp5cFVSM2hQa1FB?=
 =?utf-8?B?UEc1a1ZuL0ZObGpsTUpuZTkvZlhiY2FMTzlpMmk1RFoyWnFqRVExMzU0U2M1?=
 =?utf-8?B?M2dqZ0lPdUlGRldiclBFT2tqSVZkTnRQcVFCMi9qTjhRTDJ3Mk52Y3hrMHJH?=
 =?utf-8?B?elBQQU1sTWk0V3pUcWpMeVVHKzdISk5HNytkTkU0YW8vVTBMQU5FQzdIVTdr?=
 =?utf-8?B?N29xb09SVzJ2a1VoWmM1SllobFNNZHZja3dTcnB5MVZpRnVUVmxQaGZsMVRm?=
 =?utf-8?B?RU43VFFNWVppM2lFVHh5ZDZmSDJValJ3Si80enV4SjV2ZkZHUjhPQSs3R0ZZ?=
 =?utf-8?B?c2c0RzJxL29mV2l3a2RzK1dVT2IyNU1qYWxHSDd1RmlZNTBiekk4RW5GTUE4?=
 =?utf-8?B?VHhHays4MEtrRHllNHJ4VFVpZ3BTYnR1Ulc3S2VhaHl5cHZCeDVoK0FMbGRY?=
 =?utf-8?B?OWc5SGV2NW52RFoxWjJlN0VpNEtxV3EwQkZ1K1dEenFZVTBPMFVUN0NDMzdt?=
 =?utf-8?B?eEhhRlc1NG0rVVVWK1RzTkZtV2lZT2VpRm9sKy9KS2g0L0puajllWGh3cGsy?=
 =?utf-8?B?QTFZUDRFbGtBRXluT3BUSVhhVlRDVlpvR0ZRNURXaG01MGdvSklQdnJsTzJ3?=
 =?utf-8?B?TW9LTUdMWW9kNnhOcm1hZ2FIY3BxemVUMlAzSm5GdVhJR3ZXR2pOdmU3c09V?=
 =?utf-8?B?V09ReC95UU1lUm9NcTFUMHY1ZngyM1QyYUM5cktTTHVPRmRxY1VMTnZWVUYv?=
 =?utf-8?B?N2plN3NSaHlvZE5hSWJGZ2Z5bW1mVm1YODh3VnVyaG9pQ01mRmhEcXd4WVFP?=
 =?utf-8?B?cVpFc01IR3UzQS82aW5xdmswU0F6ZTViVmNoYVZJTnIxVTRFZCt1OVdZQyt0?=
 =?utf-8?B?S2Z4aHpsOGhWRFN3eFk0Mmw2TDZOeG5jcWJqSWRxVzJEdk9QYUM2WkE0d052?=
 =?utf-8?B?ZC9JU0VHeGwyQlhSZHo4aXJ6U2pjMlNPUk5xSC9xQmljOGp2MU4xN0NacWxv?=
 =?utf-8?B?T1h6aUxtNUNvM01ETjZ2Zi84SDF3Qmt3aVpoQ2xaTlE5N1BMVDh5QlpKMDEr?=
 =?utf-8?B?MjlEa21qY0tNTkRhZkZrcFAwdFpOcFJDcEZkT1kzUEZBRzV0R01HOFVFYjBR?=
 =?utf-8?B?R2ZRU0FkK0M4cVlJY0FVNlVCb0k3UXJidXVDeEpZLzIvekVCLzJuS0wzRUNB?=
 =?utf-8?B?RWFiQWtId0xSRkhDUUpablk4dnNKNFQrbFhpQUs2VkxtVzRvTkd6SXJESnBr?=
 =?utf-8?B?YWJBOFQvL1BtUzJOUk9ueHhuaEpvZkpOZ29veHpRemxES0hGbG5Sejk3MUJo?=
 =?utf-8?B?N2pPWERVQWxTdXBRMXk1YVZiWnl5ZWVxRUx3aFZjSEFYMnAwZ1hKRXNPeEZD?=
 =?utf-8?B?WXE2WHVob2x6NzBVWWRoRUNJYnY0YVlDMjRwTjdGS2Nwc1hnMklkZ0ViYS9T?=
 =?utf-8?B?a29hWmZJTStXMVJmVHg3VTgrOHNkRXRmdDJjcG54YkllNXRhcEhnQ1BSVEFk?=
 =?utf-8?B?SVBwYjFnVmhES3V4b240QUt6TVFxQysyVGxzWUhMUjFGWEtpcndTUElyRVZn?=
 =?utf-8?B?emh4eGc1bjJ3T0pOT1k3K3RJKzJrRTg0VHdZdkJnRjV1Ylg1R29GRUhOL0VQ?=
 =?utf-8?B?VkZCWWlPMVpQQ1pMRVVPN3Q4b0ZoVEY2blRXUDcrODFVZUcxMFo3dFE4bnF1?=
 =?utf-8?B?V3VBN1NQQU9yZVg1MWFteFRnYSsvWDJ6TG8yQXJWMVE1SzNyQzhvaVRVRzZx?=
 =?utf-8?B?Y1NlaVZMNTh3bjh4V0I4YlhWSnUwejVaREROYjBVZzlCclZwMWxxY1BSb3VK?=
 =?utf-8?B?ZGVjYmVXYWc0dW5zSm1HQnZRdFZHcklGcTdsMjhoaEdxUExDVlF6YStuZU1C?=
 =?utf-8?B?a0lOSDFjNnhPcG5YTEJ3MjZnZW1TOHMyMktxUlhKZEkvUHU3bDBmZEh4cm5h?=
 =?utf-8?B?UHU3OGRpUnc5Q3NwaGYzL1ppUFdYRDNrQTIwU2t3RVhiK29LdCtUN0VZZWRB?=
 =?utf-8?B?VUlMY1RWQXBGL3EwQVNGcmJyem1sV2NpUGJBaE56VzJHNHhMUk1YdEFLbG9u?=
 =?utf-8?B?L3ZNS0JzTE9NL1RxK2MrdmpoWUpnRVJIVXlvUkYxSEtySVFJR09QdDJ6MjlE?=
 =?utf-8?B?OWJSbXk3b1pxc3ltRHUweWNJOTFUOG8xN0RQYXUyVzJvNEo1eDhzOUxrcUkv?=
 =?utf-8?Q?clb4pPoiyCNeIpnknwxEDmc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de8c009-6c3b-4c7e-b18e-08d9d48d198a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:01:13.5052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDfPzpoMLJhKOI14BBpXz1dbU2LRDPaah++uuZbazUr/8g7V12n7SCLoHd0u/ZUEQ2u3d/ASAFYcFpeLvrwDoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 7:36 p.m., Rajneesh Bhardwaj wrote:
> This implements the KFD CRIU Restore ioctl that lays the basic
> foundation for the CRIU restore operation. It provides support to
> create the buffer objects corresponding to Non-Paged system memory
> mapped for GPU and/or CPU access and lays basic foundation for the
> userptrs buffer objects which will be added in a separate patch.
> This ioctl creates various types of buffer objects such as VRAM,
> MMIO, Doorbell, GTT based on the date sent from the userspace plugin.
> The data mostly contains the previously checkpointed KFD images from
> some KFD processs.
>
> While restoring a criu process, attach old IDR values to newly
> created BOs. This also adds the minimal gpu mapping support for a single
> gpu checkpoint restore use case.
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 298 ++++++++++++++++++++++-
>   1 file changed, 297 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index cdbb92972338..c93f74ad073f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2069,11 +2069,307 @@ static int criu_checkpoint(struct file *filep,
>   	return ret;
>   }
>   
> +static int criu_restore_process(struct kfd_process *p,
> +				struct kfd_ioctl_criu_args *args,
> +				uint64_t *priv_offset,
> +				uint64_t max_priv_data_size)
> +{
> +	int ret = 0;
> +	struct kfd_criu_process_priv_data process_priv;
> +
> +	if (*priv_offset + sizeof(process_priv) > max_priv_data_size)
> +		return -EINVAL;
> +
> +	ret = copy_from_user(&process_priv,
> +				(void __user *)(args->priv_data + *priv_offset),
> +				sizeof(process_priv));
> +	if (ret) {
> +		pr_err("Failed to copy process private information from user\n");
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +	*priv_offset += sizeof(process_priv);
> +
> +	if (process_priv.version != KFD_CRIU_PRIV_VERSION) {
> +		pr_err("Invalid CRIU API version (checkpointed:%d current:%d)\n",
> +			process_priv.version, KFD_CRIU_PRIV_VERSION);
> +		return -EINVAL;
> +	}
> +
> +exit:
> +	return ret;
> +}
> +
> +static int criu_restore_bos(struct kfd_process *p,
> +			    struct kfd_ioctl_criu_args *args,
> +			    uint64_t *priv_offset,
> +			    uint64_t max_priv_data_size)
> +{
> +	struct kfd_criu_bo_bucket *bo_buckets;
> +	struct kfd_criu_bo_priv_data *bo_privs;
> +	bool flush_tlbs = false;
> +	int ret = 0, j = 0;
> +	uint32_t i;
> +
> +	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
> +		return -EINVAL;
> +
> +	bo_buckets = kvmalloc_array(args->num_bos, sizeof(*bo_buckets), GFP_KERNEL);
> +	if (!bo_buckets)
> +		return -ENOMEM;
> +
> +	ret = copy_from_user(bo_buckets, (void __user *)args->bos,
> +			     args->num_bos * sizeof(*bo_buckets));
> +	if (ret) {
> +		pr_err("Failed to copy BOs information from user\n");
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +
> +	bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), GFP_KERNEL);
> +	if (!bo_privs) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	ret = copy_from_user(bo_privs, (void __user *)args->priv_data + *priv_offset,
> +			     args->num_bos * sizeof(*bo_privs));
> +	if (ret) {
> +		pr_err("Failed to copy BOs information from user\n");
> +		ret = -EFAULT;
> +		goto exit;
> +	}
> +	*priv_offset += args->num_bos * sizeof(*bo_privs);
> +
> +	/* Create and map new BOs */
> +	for (i = 0; i < args->num_bos; i++) {
> +		struct kfd_criu_bo_bucket *bo_bucket;
> +		struct kfd_criu_bo_priv_data *bo_priv;
> +		struct kfd_dev *dev;
> +		struct kfd_process_device *pdd;
> +		void *mem;
> +		u64 offset;
> +		int idr_handle;
> +
> +		bo_bucket = &bo_buckets[i];
> +		bo_priv = &bo_privs[i];
> +
> +		dev = kfd_device_by_id(bo_bucket->gpu_id);
> +		if (!dev) {
> +			ret = -EINVAL;
> +			pr_err("Failed to get pdd\n");
> +			goto exit;
> +		}
> +		pdd = kfd_get_process_device_data(dev, p);
> +		if (!pdd) {
> +			ret = -EINVAL;
> +			pr_err("Failed to get pdd\n");
> +			goto exit;
> +		}
> +
> +		pr_debug("kfd restore ioctl - bo_bucket[%d]:\n", i);
> +		pr_debug("size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
> +			"gpu_id = 0x%x alloc_flags = 0x%x\n"
> +			"idr_handle = 0x%x\n",
> +			bo_bucket->size,
> +			bo_bucket->addr,
> +			bo_bucket->offset,
> +			bo_bucket->gpu_id,
> +			bo_bucket->alloc_flags,
> +			bo_priv->idr_handle);
> +
> +		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
> +			pr_debug("restore ioctl: KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL\n");
> +			if (bo_bucket->size != kfd_doorbell_process_slice(dev)) {
> +				ret = -EINVAL;
> +				goto exit;
> +			}
> +			offset = kfd_get_process_doorbells(pdd);
> +		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
> +			/* MMIO BOs need remapped bus address */
> +			pr_debug("restore ioctl :KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP\n");
> +			if (bo_bucket->size != PAGE_SIZE) {
> +				pr_err("Invalid page size\n");
> +				ret = -EINVAL;
> +				goto exit;
> +			}
> +			offset = dev->adev->rmmio_remap.bus_addr;
> +			if (!offset) {
> +				pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
> +				ret = -ENOMEM;
> +				goto exit;
> +			}
> +		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
> +			offset = bo_priv->user_addr;
> +		}
> +
> +		/* Create the BO */
> +		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
> +						bo_bucket->addr,
> +						bo_bucket->size,
> +						pdd->drm_priv,
> +						(struct kgd_mem **) &mem,
> +						&offset,
> +						bo_bucket->alloc_flags);
> +		if (ret) {
> +			pr_err("Could not create the BO\n");
> +			ret = -ENOMEM;
> +			goto exit;
> +		}
> +		pr_debug("New BO created: size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n",
> +			bo_bucket->size, bo_bucket->addr, offset);
> +
> +		/* Restore previuos IDR handle */
> +		pr_debug("Restoring old IDR handle for the BO");
> +		idr_handle = idr_alloc(&pdd->alloc_idr, mem,
> +				       bo_priv->idr_handle,
> +				       bo_priv->idr_handle + 1, GFP_KERNEL);
> +		if (idr_handle < 0) {
> +			pr_err("Could not allocate idr\n");
> +			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
> +						(struct kgd_mem *)mem,
> +						pdd->drm_priv, NULL);
> +
> +			ret = -ENOMEM;
> +			goto exit;
> +		}
> +
> +		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
> +			bo_bucket->restored_offset = KFD_MMAP_TYPE_DOORBELL |
> +				KFD_MMAP_GPU_ID(pdd->dev->id);
> +		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
> +			bo_bucket->restored_offset = KFD_MMAP_TYPE_MMIO |
> +				KFD_MMAP_GPU_ID(pdd->dev->id);
> +		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
> +			bo_bucket->restored_offset = offset;
> +			pr_debug("updating offset for GTT\n");
> +		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +			bo_bucket->restored_offset = offset;
> +			/* Update the VRAM usage count */
> +			WRITE_ONCE(pdd->vram_usage, pdd->vram_usage + bo_bucket->size);
> +			pr_debug("updating offset for VRAM\n");
> +		}
> +
> +		/* now map these BOs to GPU/s */
> +		for (j = 0; j < p->n_pdds; j++) {
> +			struct kfd_process_device *pdd = p->pdds[j];
> +			struct kfd_dev *peer;
> +			struct kfd_process_device *peer_pdd;
> +			bool table_freed = false;
> +
> +			peer = kfd_device_by_id(pdd->dev->id);
> +
> +			pr_debug("Inside mapping loop with desired gpu_id = 0x%x\n",
> +							pdd->dev->id);
> +			if (!peer) {
> +				pr_debug("Getting device by id failed for 0x%x\n",
> +						pdd->dev->id);
> +				ret = -EINVAL;
> +				goto exit;
> +			}
> +
> +			peer_pdd = kfd_bind_process_to_device(peer, p);
> +			if (IS_ERR(peer_pdd)) {
> +				ret = PTR_ERR(peer_pdd);
> +				goto exit;
> +			}
> +			pr_debug("map mem in restore ioctl -> 0x%llx\n",
> +				 ((struct kgd_mem *)mem)->va);
> +			ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev,
> +				(struct kgd_mem *)mem, peer_pdd->drm_priv, &table_freed);

Are we mapping the BOs on all GPUs? That's incorrect. Not all BOs are 
mapped on all GPUs. Checkpoint/restore needs to remember the set of GPUs 
where a BOs was mapped and restore the mapping only on those GPUs.

Regards,
   Felix


> +			if (ret) {
> +				pr_err("Failed to map to gpu %d/%d\n",
> +				j, p->n_pdds);
> +				goto exit;
> +			}
> +			if (table_freed)
> +				flush_tlbs = true;
> +		}
> +
> +		ret = amdgpu_amdkfd_gpuvm_sync_memory(dev->adev,
> +						      (struct kgd_mem *) mem, true);
> +		if (ret) {
> +			pr_debug("Sync memory failed, wait interrupted by user signal\n");
> +			goto exit;
> +		}
> +
> +		pr_debug("map memory was successful for the BO\n");
> +	} /* done */
> +
> +	if (flush_tlbs) {
> +		/* Flush TLBs after waiting for the page table updates to complete */
> +		for (j = 0; j < p->n_pdds; j++) {
> +			struct kfd_dev *peer;
> +			struct kfd_process_device *pdd = p->pdds[j];
> +			struct kfd_process_device *peer_pdd;
> +
> +			peer = kfd_device_by_id(pdd->dev->id);
> +			if (WARN_ON_ONCE(!peer))
> +				continue;
> +			peer_pdd = kfd_get_process_device_data(peer, p);
> +			if (WARN_ON_ONCE(!peer_pdd))
> +				continue;
> +			kfd_flush_tlb(peer_pdd, TLB_FLUSH_LEGACY);
> +		}
> +	}
> +
> +	/* Copy only the buckets back so user can read bo_buckets[N].restored_offset */
> +	ret = copy_to_user((void __user *)args->bos,
> +				bo_buckets,
> +				(args->num_bos * sizeof(*bo_buckets)));
> +	if (ret)
> +		ret = -EFAULT;
> +
> +exit:
> +	kvfree(bo_buckets);
> +	kvfree(bo_privs);
> +	return ret;
> +}
> +
>   static int criu_restore(struct file *filep,
>   			struct kfd_process *p,
>   			struct kfd_ioctl_criu_args *args)
>   {
> -	return 0;
> +	uint64_t priv_offset = 0;
> +	int ret = 0;
> +
> +	pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u priv_data_size:%llu)\n",
> +		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
> +
> +	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
> +	    !args->num_devices || !args->num_bos)
> +		return -EINVAL;
> +
> +	mutex_lock(&p->mutex);
> +
> +	/*
> +	 * Set the process to evicted state to avoid running any new queues before all the memory
> +	 * mappings are ready.
> +	 */
> +	kfd_process_evict_queues(p);
> +
> +	/* Each function will adjust priv_offset based on how many bytes they consumed */
> +	ret = criu_restore_process(p, args, &priv_offset, args->priv_data_size);
> +	if (ret)
> +		goto exit_unlock;
> +
> +	ret = criu_restore_bos(p, args, &priv_offset, args->priv_data_size);
> +	if (ret)
> +		goto exit_unlock;
> +
> +	if (priv_offset != args->priv_data_size) {
> +		pr_err("Invalid private data size\n");
> +		ret = -EINVAL;
> +	}
> +
> +exit_unlock:
> +	mutex_unlock(&p->mutex);
> +	if (ret)
> +		pr_err("Failed to restore CRIU ret:%d\n", ret);
> +	else
> +		pr_debug("CRIU restore successful\n");
> +
> +	return ret;
>   }
>   
>   static int criu_unpause(struct file *filep,
