Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2E59FCEE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614E18B02D;
	Wed, 24 Aug 2022 14:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1BF113392;
 Wed, 24 Aug 2022 14:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nnu9eRxdokgHHfl+/+uOoH79qxNcD0SVs9cWBq5ZoF9j0UFCd7XseYc3AhPw0jPm5ije3Kb6wQMUBTHEKZJmSaYp5RYFbgoAnJokP/VVhMmXhpXevr7VDpX+b6lvqhfYrb2M33K6mb9uTqZMNxoURPJ/edrWyIhWvQkTKp8RA2Omz2Id/NOzDW9Mojlqq/FWsNBeA8JBs46rl/9bgYq59XXJgdfietMh2Dh3LxhxDI8tovBdESun4HH6yTY84u7eFpJqSTBs3iTVmNdeygetn7jWArP0HnTsaYJ8mLRL7cRR8U+PaIEl1QlfJOePwEJcMDAhZm6EgRc3/rwuEeUbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqPUQCej5vuqxvtj8Chlk3T/0EwQ6MX8daIfGCr7o8M=;
 b=c/XYxqdneDEH/DkMoLFAsRp6iqvullaPOshGTd9IJExYzhHSUDR/lvxqVU8bJzAi+bG4bVC2GDFT/AnfpIM18YW45lz7zeybn1yJkTdHE7hbwZb8HQitbHjRZTPQPAJCtILuFDjiq6MJnMDr0rs6JHqgaZXccGMOQ/VfNaRGyHZhlVOPOFWV3yL9WKyaG/ol2pyw5Yhhktf1m+JEDiYO1maA0JSV6+adQNTgnaMt3LTNNXoWfng3OHb8k6jn/t9ivn02jtvgB9ELg5st2eo3ocrTnLV3fTfmCImt5aCCfCHbK//xhu/L84jCLav54YuhJIXO1RRAPH3QKLJKdTuHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqPUQCej5vuqxvtj8Chlk3T/0EwQ6MX8daIfGCr7o8M=;
 b=Qh3ShTDqYljGuzDiMNRcnLnEVaa1TnymlG57SvJVZ37XrCkhCzlZlcOdBD0onKcBMrrCqvRssSW7RmGJCKoAHPW84c+dPgar3Stm+B3OKYTy5D4B7HrG14exTta7wWOM7t7TfMu6ixQrqLYLY5bzTUWcfh5BsSrXlomsiN0ejSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB2921.namprd12.prod.outlook.com (2603:10b6:5:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 14:11:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 14:11:16 +0000
Message-ID: <ce79b696-339b-3505-5884-14a20489de57@amd.com>
Date: Wed, 24 Aug 2022 16:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 9/9] dma-buf: Remove internal lock
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-10-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220824102248.91964-10-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0185.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b7ec6f-b4af-4832-23c0-08da85da577d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2921:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9NG0WZgeddmHQwKb4RZcp7HqbpXvkRxGZjf8wyn//i6nkI+GbEM6NxR1/40CDNMCQElwy/eStwFCrwZgaEyUVVlX2goeVG1d+IQ85CzYj/TM3kHYZit/pEWPukn8aSbCIFi0anF8TVxbP7sASoCyTZIE1JRZp6lyp2s2j509su11JpbWVYzWD+GMVOPNEDtRR4OYz915Thgdk7xVJ2aIMeM14Vmk18P/VO9HQzDaCXdRPXNIDnA2uaRBbor/PXHXcmWK7OLyL42WYgMYcuIIjzFf080beadL4TqaSejUCXWRcONHkmHJaPkVYXLMgTHxELmO9hsbZzEd4PZ1jaiUM+2mBFpuPFo4PMJKcxmPsaYLpu6Zih7foI2FwwEO1cOPZSVC9fWr5Ix4DZEdJLzvLi0rj1QRdV5YjptGrnc8bCCP0dfsWSRiuTLu2IdHfPdG/64xaxIBYO6px9rdwIwYtSXQgYQyD9vsloEdRthTFDTGjJZcc/P4R+DFz6WnrnNfnlxrpu0VlgKsIrKlAkHIcZBSZcdwwF2p8gBxzQVwUXi0WflZ2ElQ6/jr9rU9LnPlP8GomqxPPBiPxpJn1uP/FsU5Noi3rdri6PH3W7+3Rtui36W6VHY52RsEBfBbfX6yBqsXVMPXyEYvLM+vvK//37+PYV9Rb+oSE1O+RFDYGoBf4xoUnIJWkzCXxRDymyHOteQJ2EM/q4FwGctUsrXrjHNy+N0TN4Bg8cYeKOX+g3DGsGHY3AU2O7KPNi+UD3mdGgCm1LFf9tN8wWOLxEa5TyLAtup+3YFphHEvgVhuw4zMkKIsINbnr8+q3pGTt6f6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(66946007)(66556008)(8676002)(86362001)(31696002)(110136005)(316002)(83380400001)(6666004)(8936002)(186003)(38100700002)(2616005)(7416002)(921005)(41300700001)(478600001)(6486002)(66574015)(2906002)(36756003)(7406005)(31686004)(6512007)(6506007)(5660300002)(66476007)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHZvZkdGS242YVZNUWVVU0x0d1dTYi90OXFsUW5vN3U2aERzQ3ArMFdpUy9q?=
 =?utf-8?B?aXdKaHVOTGhRTUgrMnNiWFNNRWxWai9hbWdEL1ZFV1FTWUZzYkltUkVtZTNE?=
 =?utf-8?B?UWV3Q2t5R1BYMGE3WFJZN2NtQ1BXaTU4RkJMbUF2Z1Nxc2tMNy9NRHFLN2hJ?=
 =?utf-8?B?K3BJWnVqaU5JS1lsOVl0UlIwd0w5bjFNNkpWZWNDZ3hCbkcyc04wR0VLSjdo?=
 =?utf-8?B?TXBiRFVMcWI4S2swSk1YVks1K0ZPSkZwVkJZbUhUSzR3anpWdTV1Z21ZRlJC?=
 =?utf-8?B?OS9xeXFZT1VYWnh5dWxaMERpaXdEd1NvUThpUG4xQ1R1SjJFRXIzQVBNRjFn?=
 =?utf-8?B?Mm5GaVg1ZjBXVk1BSm1yMlV2ZGNCekEram9LRXJScGsxeDZqVGZaUFRSTG5m?=
 =?utf-8?B?dU9PU01YU0FkTVhsZDZ5RzNEOGtCQ2t5VzhzQUFUK0prNmFSTGtyVjRCK0Y3?=
 =?utf-8?B?emNIakUxTXM2dWlBT2FFNGJHc3NCSXM3L3NybndiYmRmdmpZb0ZtNVlLVTFZ?=
 =?utf-8?B?YmorQmZRU1NLU1g3ZXJiaXRqTjVDZjNrcVB3USswdFRMVndJVHJpcFdZckRv?=
 =?utf-8?B?UEVVRFg1YlFQbEM2Nm4rVmNsaFl4a3grVXJsVGprQU9PR20xTmRyOU8rSkgw?=
 =?utf-8?B?MWxFbFlvSVI2T3dQWGRCWVZvSHRLb1FzWHdwL2lPUVV0VExmUVpjY3hJSGtQ?=
 =?utf-8?B?cCtKVHZ6REM5ZEdSdTNEdnhtcmxQWjNrMThhYzVQNTdqc0tuUEs0d2hsL2ky?=
 =?utf-8?B?cGxuSTd5SlIwYysrR1A0V1RKK2dYRnpvQ0RMMFl5M0NaalhqZmlPd2FYLzAw?=
 =?utf-8?B?dGxyZWtPUHhrSlBUOFZtQk5UOThNMkg2MzF6Z2dpd1NUODlIUzA4ZUJRd3Zy?=
 =?utf-8?B?d0JHNVR0cWNSYW1qSFdscWNYZ3ZIWVRhcm82Ymc1VzZ2Znh0VEVPQkJDTWVy?=
 =?utf-8?B?TUhNclNkcEdjN3ErT3g4NTBuNnVSQ0tQb3NTQUJqQnFaN3NNSUVXVjJSYkRQ?=
 =?utf-8?B?b0JiS3BHSUw3WHNRajlVbHUrUWRuczFnRm9hRkdBdFJyT1BVcGR5UG1lbkxy?=
 =?utf-8?B?dktzaHV6MksyTmQydzRCb1FHTnUyUnlmZys4Z01XR3VTeW1JNHQ1RWFtM29Z?=
 =?utf-8?B?cm5heWFuWUxsUHdtaFo5MHFQTXlUcjhwMHpwL0p1SlRoSFRCM2t0dG1vanRs?=
 =?utf-8?B?Q0pmZjVtdS8zVHBCamxVOUhzdGlnNXR3Q3ZpYWFpYkZJaCsvaWVlbWdWYkQy?=
 =?utf-8?B?UUdpa3ErSWlwdjAwY2ZabUQxS2p1Q0ZjcGxGTDRCcE5GOW4yY1pQS3NYNnNW?=
 =?utf-8?B?UXRSSDlIVksyUnhqTlIxVDc0aEp4YXUxcURnV0psRkYzMnNsMmszMG9HV1hV?=
 =?utf-8?B?RExuMU9xQmdLQ1paZUQ3Tyt3Y0pXVEdoVnRuemFCYmFCVXBrUHhyOE9GdTJt?=
 =?utf-8?B?WnRta1JEcWxlMEFpelJTYnNLMlVJUElOaEZ5MnNqK3NQTzhORjRadlhiOXhl?=
 =?utf-8?B?VmhFMHZYMTZuYnFqZGNVRDBySkI2bERRbGV3cnNHZ29HTm5MVCtXdFBZQmFu?=
 =?utf-8?B?d05QVnFVd2F3TDh4SEsyK2lSWVI5bHJYd0dvREtnV0dmelh1RFNhcVZWWFZC?=
 =?utf-8?B?cnBwdHEwcEl6bTFCOVY4RW95cWc1M1VDdFIwdmplbnA0ZDljc2d6bTZQSE5L?=
 =?utf-8?B?Q0lKOVhxeWNwbGVORGFrZ3RGNlBMVWxOeVJXM29sakplZlFkVTcvYy9oQWNN?=
 =?utf-8?B?ZzhFYitOWkRIZVo4aWptUWNWY0F5dEtqWTI5SkVoRzRyRmNZZjFFZjk2VG9G?=
 =?utf-8?B?UEtVcmJSNGJSc2VXQlNBUWFYWFRXRVBFakpJVUNHQk0rU3graGx6bFIwYnBr?=
 =?utf-8?B?TGVSYmk3NldxWFQ2NGkyZysxd01QUUpJUVB3MzdlalljMlluYjhlQlhGN1R0?=
 =?utf-8?B?dXdvczhUOWlMb1JmL0NGK1NSUEhiWGFia0NPTHlZVVNkdFRiL0NJbGwrV3Y5?=
 =?utf-8?B?M2h1SWhpa1pZZGtOcGU3QWV5QWxSamlRR0lpcEZzMU4vYUZzcWRtRytoMGhV?=
 =?utf-8?B?bjNMTXBVVnI5S1RmaHgzcSs3QW9GaDliWFBoeUQ3U0dVTE9BMGxNY2hFOFdQ?=
 =?utf-8?B?RGJwclNBQVhSSlg0Vi81TUZ1NEwxSThHU1pValk2RnVMbUsxZEw2bFQvVTRk?=
 =?utf-8?Q?u1j+2hwCp46rKu/IcbQa2dXCfG+/oPZl9unLUmkSzpyK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b7ec6f-b4af-4832-23c0-08da85da577d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:11:15.3638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTY5k8ED+mNcVUDjvJ5HsDVekfcgtBKL3p44ies0fA2tsJvqTNu1kTc77Ran8cDH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2921
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
> The internal dma-buf lock isn't needed anymore because the updated
> locking specification claims that dma-buf reservation must be locked
> by importers, and thus, the internal data is already protected by the
> reservation lock. Remove the obsoleted internal lock.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 14 ++++----------
>   include/linux/dma-buf.h   |  9 ---------
>   2 files changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 696d132b02f4..a0406254f0ae 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -656,7 +656,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   
>   	dmabuf->file = file;
>   
> -	mutex_init(&dmabuf->lock);
>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
>   	mutex_lock(&db_list.lock);
> @@ -1503,7 +1502,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
>   	struct iosys_map ptr;
> -	int ret = 0;
> +	int ret;
>   
>   	iosys_map_clear(map);
>   
> @@ -1515,28 +1514,25 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	if (!dmabuf->ops->vmap)
>   		return -EINVAL;
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (dmabuf->vmapping_counter) {
>   		dmabuf->vmapping_counter++;
>   		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>   		*map = dmabuf->vmap_ptr;
> -		goto out_unlock;
> +		return 0;
>   	}
>   
>   	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>   
>   	ret = dmabuf->ops->vmap(dmabuf, &ptr);
>   	if (WARN_ON_ONCE(ret))
> -		goto out_unlock;
> +		return ret;
>   
>   	dmabuf->vmap_ptr = ptr;
>   	dmabuf->vmapping_counter = 1;
>   
>   	*map = dmabuf->vmap_ptr;
>   
> -out_unlock:
> -	mutex_unlock(&dmabuf->lock);
> -	return ret;
> +	return 0;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>   
> @@ -1578,13 +1574,11 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	BUG_ON(dmabuf->vmapping_counter == 0);
>   	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
>   			dmabuf->ops->vunmap(dmabuf, map);
>   		iosys_map_clear(&dmabuf->vmap_ptr);
>   	}
> -	mutex_unlock(&dmabuf->lock);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d48d534dc55c..aed6695bbb50 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -326,15 +326,6 @@ struct dma_buf {
>   	/** @ops: dma_buf_ops associated with this buffer object. */
>   	const struct dma_buf_ops *ops;
>   
> -	/**
> -	 * @lock:
> -	 *
> -	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> -	 * dma_resv_lock() on @resv.
> -	 */
> -	struct mutex lock;
> -
>   	/**
>   	 * @vmapping_counter:
>   	 *

