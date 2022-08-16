Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8AD595530
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256178B176;
	Tue, 16 Aug 2022 08:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69778DA9A;
 Tue, 16 Aug 2022 08:27:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU3U4ZqdUiTdqdyqUB6K4Ivc4HbCetSb5S2WEilbMeaCDd8ikY3Z/TT3qWnQG2YCBKcJel+gtR5Zn73rFdGooE27XbDTrujKZdB1Zd9eLXFrjFBAmzeifKk5GL0LHk9sfI8bz1wA3+0o21zO4JIc4omYuJqlngGj72vTbv+SuPGXN2O4O67KfJrZdQ6g6Z0ybshFUkRIXTm2+Buftf5b72C+CW6IS/kJ5hjcO+nFbOC+zAHbiAncvoCHAKgupw6l5O6/OeTTl2OgwWEs+B8XPRlxRm+/9CNfHT+f06JVoaInbuOYs01s0GJ7lzr6UutaVggCqcSqIcC/L+74nkahWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOubXvrRDcyx/MQMgcWpc9/cXRkd/m8ucNk64I1uR8Q=;
 b=g3MNxsqNUMcrvIlzJuStppfQ+5s5+XN8RmrUHkdmvJOqONXbWRx3WXYslHZhJNOfhHY2gPTdS/JW4J0Z9QYwhDMb96zIq0XNzf2ZHnRE6uole4hEZ4jea9UJVR/Xuoo3PDCfcwpktnLrZEmc3NNdCVn2CYIk4q3YuwdRwurjMY0uxYVvMCumUDTGeqPn+Ldm4lcanTbR0FstwVtL1LzHM03fAVbupviijZG9KDc8CP7hSqyb70nUrKPonKF69Jh3cKFu8hAERW3KLLhsYzsdz7dukfXPnRw+CAP6+/GyIzyMCrrXPEFTZ3R7oyWJaYNbldnkAoNrEAvuip4wbcdgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOubXvrRDcyx/MQMgcWpc9/cXRkd/m8ucNk64I1uR8Q=;
 b=0RN2+C6TX8rjxPAd+qC4KRLZJ4Kwj9eovgApP/o6l2QEIDvUsq97ZwycQIa3L11C8z7JLsTecrmP6sDCpONt1h7BvL77lIxzwABNYgQc9gB0Eukn9uvrULlqGtOIOA8nn2fbTUxxAnFjcinDaO2cvOxcNMHykeld/CCgbDrL7OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0245.namprd12.prod.outlook.com (2603:10b6:910:1e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 08:27:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Tue, 16 Aug 2022
 08:27:34 +0000
Message-ID: <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
Date: Tue, 16 Aug 2022 10:27:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220815211516.3169470-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39dd0c79-83e2-4630-cc09-08da7f612ba0
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0245:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbvWhSf0aj2flxwtAMBU/338I+vtuiXTy0kkjyLHzqLVPy0UW+XFExXROBlQ29LgrXifQpymNQKJftsU4I78Vk6umdX9PdvaiVBUUsj1K6PEeNYS7I69OhsgEZ5NpBXomYYREHUGQb9iYY3fF4PvIQhmCdhpM2CROsX1tbPhlw0Qrs2ZfYoBQSrIRn5ULkUVBlYnsyvpCTWKu34gsaJh2/cHHqYKG+vFBZPx4kUsaZ3JhUDf4ji0hThXXsDjMpG0lqQEd0Z829JJHxsvGHGZQrLzUgZTsLPN6iy9MIlgPZgStf+8JFq/26XY5x0/hX4s3nb9opuA2A/24N7hyONqTqALuA5gCVr27bXgOJ+laSfYPyUlzlgB6OCnzTxFCTCMMto5EgH8PHI2Wx7M1ai/5mvwuYFVRbsvlfSRuudm2Y44PFZ+ZNdkho27E825Zokb83vXfk0SazOQqxdtQ3+MhGBhukhkouba3G7XamrOb1SlYr0pt5ZP730+WihMB7D8l+jL6lhWJJWfgLC3DAk+ybsG9D87I2j7QzPZMMnpN7VRxBqQpTrA5OVaybmotL9hFIcXXcUO2g/Et9LkbSCQd2sAR0wIK1VN/vGoq7kCyYqfS7oe/WrJ/+3d0e/MVopONpaWPF5mSXnl6Bgz44YpWtHC132LPxj/INTRPny5hY+ZpT576H7klaY/ho9iNqmrPZekiT3aK7oIXI4BgzhD2yNo5YetlGApfGSyS+oU4EaQbOREnbAR+Z3tQE3zrUYBMzNVp7xwP5DfW+U5+YQXzO7q4ev+9LgoTWKeVCpsBp8q+HjXxo+2t9Yfi50pLXp8mON5VJpenx9uDVak/xhnGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(66476007)(31696002)(38100700002)(86362001)(66946007)(66556008)(316002)(478600001)(36756003)(83380400001)(6486002)(6512007)(8676002)(4326008)(54906003)(186003)(6506007)(41300700001)(2906002)(31686004)(8936002)(2616005)(7416002)(5660300002)(26005)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FQVEtweWc1R0l3TkFpTjQ0V2t5eWs5SCtUL0JuZTRVU3EwUEM0clBRWnQr?=
 =?utf-8?B?SGJub2JhdFo1cHFPRGFka1BZUmcwRjNwOEFFNjJyODYyQWhLYlNUT1VBUXdQ?=
 =?utf-8?B?MEJMNlRTM3p4YlVBM3JFQjc1QjE3Z1NkVm1PdjZLaUNjUWpQaVRXUll1RTR3?=
 =?utf-8?B?aGY3ZXoyR1FweHZ3czNPaEJyZmVZM1grWEFjTlhZc09WeVZyZFpGTjh4RmM3?=
 =?utf-8?B?RUtqZ2lZdlRiUG84SVBIMlM3Y2F3TWc0UDBaVFRNY0UvZlkyK3BDT0E3eEZa?=
 =?utf-8?B?R2xleGVPYWV3dG5wRi9wbXJuTG1BWUdOZGJFUjlaY3lpd0hkUm1BbXZnblRB?=
 =?utf-8?B?V2gvMTQzZDRTUTFnT2tGUHNSVkZ5alN3WFdpMndFZ1FNR1pmTlZEUkdOT0Zp?=
 =?utf-8?B?STlHUzhKbTlKMzNoeVIrMnd5cXR5aVlwcU11bjlrdDVjanFqL0oyT0dsMHV4?=
 =?utf-8?B?U1JBN2RVa2Q5Q1hPa04zcDFzNWJlUEtrY0Zya2dpc0NYemNLOXFiNWczendS?=
 =?utf-8?B?Sld3RkNMNXV2ZUJ5TWF4aFV6dTdNdUFmVE1NYmtCc1IwYXBwN1VVT1R0aS91?=
 =?utf-8?B?bWNlVjlsOFFadElTaG1aMlZsMWMyUXJUem5jWUtHbXhBQnlUVzdUUjg2OS9N?=
 =?utf-8?B?aEFKa24xd0w3eVR5SW9nYnNMc2JlaDN1NVBhTXZQS1N5NDR2b0JiQkIyZzJi?=
 =?utf-8?B?RlNXMWliQUV3SE5pU3NOL1QyQURiUklSeE05RXNiWkhCQWthbG1lOGFoREtO?=
 =?utf-8?B?dVRaeEpRWkVyalREdzFYeUNYMGFGUG1wM3JTZXYxYmhpS2prQkFycHhaZVdZ?=
 =?utf-8?B?QTFkYStNKzM5Rm03ZXBlOVZGaVVDQm5xUkx3NTFja0FIbE12eHF6bE8wOTEv?=
 =?utf-8?B?SFlTRFVFYjM5QmpqNkc4MnRwQXhEVEdOY2wxcnVTeExEM1ZkbmIrR3dQOUxz?=
 =?utf-8?B?SUl0c0NyRmtSYzRlTys1dWlmZG05STNpZGFzUjhaU3JrbmxpUDRKYTJuS1hm?=
 =?utf-8?B?d2p4bisxWVVaNVFiQ0tYZ09aVnp6WXNQVFZERjlpOThlZ1RRREY0MHErclZF?=
 =?utf-8?B?QzRFM1J5L0lIVWd1TlFqdG9sbG5ENy8waGJpaTFlTUZBSUZpVlo1VWk1bVUv?=
 =?utf-8?B?Rm1WTEFlRjRGaDNoamJjc1dGRlk1eDJQbGU5cHlnNjdpMm9YVVcwZ21NYnY4?=
 =?utf-8?B?NjNNdUhRaUJPTXgvRG1keERYVjZ1NVh3bHQ3VTZLMmNNQnd3cjkyY2tyY0pv?=
 =?utf-8?B?L0pTbGJuN0N0Yzk1U3lCQjVxMkYweTV1UHVScW9aOFBRL0ExOUkwejBRbzl3?=
 =?utf-8?B?bEh4TzU2bFZxaDEvMkdWejlvazJyUGw5QzJCSkNvdGxCQjh4VkU3c2tEZ1hW?=
 =?utf-8?B?b00wb3RGVW1hS011WE9Jc3JNOE9pQWZ5QXlaSWtmY2NhcXN6a1dSUEVpUDRG?=
 =?utf-8?B?dG9jQTBsbWRrZzBkWjhsWnF4Ly9Sa0VBVGxBUjF2YXBGYVFCeGREdzBhUFNL?=
 =?utf-8?B?RjNNQXRaR25aalZvZ29HeVBsRmFSb1BMdEhuc28vdm05RFJXMkZLSVE3blQv?=
 =?utf-8?B?RVo1SkxCZWZzaFJsaUgyRHlTRk5xazRUN0dRSjhwbTg5QitGTC8zeUNlTk1h?=
 =?utf-8?B?TXhVQXJCT2dSNEdjcW05Z0U0ZGtTaDBLZDRUOGV5cTV0L1VDQm1XZkhISFgv?=
 =?utf-8?B?UE9wSzJDYURrejdHZWhjLzd1SGEwTmpNYklMd0QvUUpvd2NiRGF4emF5Zlhj?=
 =?utf-8?B?VnlhUHJ3cG1XampUZVo5Z3hQQkQ2R1ZhampiVUw4dnFPK2NrOWRkZkVmUWZI?=
 =?utf-8?B?Z0R1eUhDZVFKYUFvRHlVbm1MN1A3SUQ1V1dUQ2lFRW40aDJydXR5NXk2aE40?=
 =?utf-8?B?aXhyZC9JR2M1dzN6cEtZZGk3bmloWHlmVnNXK2J4ZHhQY3QwbWhTSzFnTHEw?=
 =?utf-8?B?OWRvdXIrWmpRd092MDdqVkVKbWZkdHpMZDZqTEQvVVBtZnp6QUIvZGRRU3NM?=
 =?utf-8?B?Kzg5L01sT1c0YlRqcFp3LzZVbVgwMGhzM1RUSzRzY2lIR2NCRVdSd0FFekE4?=
 =?utf-8?B?Wk43Vnk1endic1ZyTStKL3JhWk1PM0NVSHEyRFBsWitCWjAvcWNZSjNZZWdw?=
 =?utf-8?Q?dR65M0xpha/izjGx2LOnmKCst?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dd0c79-83e2-4630-cc09-08da7f612ba0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 08:27:34.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zVwVVy8UGAlA7bPV0DEsQ153Ucv803tPSwRu4/LwlHBW/RuKXZEVrc6RKp5Uh68
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0245
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 23:15 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> This is a fairly narrowly focused interface, providing a way for a VMM
> in userspace to tell the guest kernel what pgprot settings to use when
> mapping a buffer to guest userspace.
>
> For buffers that get mapped into guest userspace, virglrenderer returns
> a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
> pages into the guest VM, it needs to report to drm/virtio in the guest
> the cache settings to use for guest userspace.  In particular, on some
> architectures, creating aliased mappings with different cache attributes
> is frowned upon, so it is important that the guest mappings have the
> same cache attributes as any potential host mappings.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> v2: Combine with coherency, as that is a related concept.. and it is
>      relevant to the VMM whether coherent access without the SYNC ioctl
>      is possible; set map_info at export time to make it more clear
>      that it applies for the lifetime of the dma-buf (for any mmap
>      created via the dma-buf)

Well, exactly that's a conceptual NAK from my side.

The caching information can change at any time. For CPU mappings even 
without further notice from the exporter.

If the hardware can't use the caching information from the host CPU page 
tables directly then that pretty much completely breaks the concept that 
the exporter is responsible for setting up those page tables.

Regards,
Christian.

>
>   drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
>   include/linux/dma-buf.h      | 11 ++++++
>   include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 132 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 32f55640890c..262c4706f721 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
>   	.kill_sb = kill_anon_super,
>   };
>   
> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +	int ret;
> +
> +	/* check if buffer supports mmap */
> +	if (!dmabuf->ops->mmap)
> +		return -EINVAL;
> +
> +	ret = dmabuf->ops->mmap(dmabuf, vma);
> +
> +	/*
> +	 * If the exporter claims to support coherent access, ensure the
> +	 * pgprot flags match the claim.
> +	 */
> +	if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
> +		pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
> +		if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
> +			WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
> +		} else {
> +			WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>   static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct dma_buf *dmabuf;
> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   
>   	dmabuf = file->private_data;
>   
> -	/* check if buffer supports mmap */
> -	if (!dmabuf->ops->mmap)
> -		return -EINVAL;
> -
>   	/* check for overflowing the buffer's size */
>   	if (vma->vm_pgoff + vma_pages(vma) >
>   	    dmabuf->size >> PAGE_SHIFT)
>   		return -EINVAL;
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	return __dma_buf_mmap(dmabuf, vma);
>   }
>   
>   static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	return 0;
>   }
>   
> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
> +{
> +	struct dma_buf_info arg;
> +
> +	if (copy_from_user(&arg, uarg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	switch (arg.param) {
> +	case DMA_BUF_INFO_MAP_INFO:
> +		arg.value = dmabuf->map_info;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(uarg, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
>   {
> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
>   	case DMA_BUF_SET_NAME_B:
>   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>   
> +	case DMA_BUF_IOCTL_INFO:
> +		return dma_buf_info(dmabuf, (void __user *)arg);
> +
>   	default:
>   		return -ENOTTY;
>   	}
> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	dmabuf->priv = exp_info->priv;
>   	dmabuf->ops = exp_info->ops;
>   	dmabuf->size = exp_info->size;
> +	dmabuf->map_info = exp_info->map_info;
>   	dmabuf->exp_name = exp_info->exp_name;
>   	dmabuf->owner = exp_info->owner;
>   	spin_lock_init(&dmabuf->name_lock);
> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
>   
> -	/* check if buffer supports mmap */
> -	if (!dmabuf->ops->mmap)
> -		return -EINVAL;
> -
>   	/* check for offset overflow */
>   	if (pgoff + vma_pages(vma) < pgoff)
>   		return -EOVERFLOW;
> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   	vma_set_file(vma, dmabuf->file);
>   	vma->vm_pgoff = pgoff;
>   
> -	return dmabuf->ops->mmap(dmabuf, vma);
> +	return __dma_buf_mmap(dmabuf, vma);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..37923c8d5c24 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -23,6 +23,8 @@
>   #include <linux/dma-fence.h>
>   #include <linux/wait.h>
>   
> +#include <uapi/linux/dma-buf.h>
> +
>   struct device;
>   struct dma_buf;
>   struct dma_buf_attachment;
> @@ -307,6 +309,13 @@ struct dma_buf {
>   	 */
>   	size_t size;
>   
> +	/**
> +	 * @map_info:
> +	 *
> +	 * CPU mapping/coherency information for the buffer.
> +	 */
> +	enum dma_buf_map_info map_info;
> +
>   	/**
>   	 * @file:
>   	 *
> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
>    * @ops:	Attach allocator-defined dma buf ops to the new buffer
>    * @size:	Size of the buffer - invariant over the lifetime of the buffer
>    * @flags:	mode flags for the file
> + * @map_info:	CPU mapping/coherency information for the buffer
>    * @resv:	reservation-object, NULL to allocate default one
>    * @priv:	Attach private data of allocator to this buffer
>    *
> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
>   	const struct dma_buf_ops *ops;
>   	size_t size;
>   	int flags;
> +	enum dma_buf_map_info map_info;
>   	struct dma_resv *resv;
>   	void *priv;
>   };
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index b1523cb8ab30..07b403ffdb43 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -85,6 +85,72 @@ struct dma_buf_sync {
>   
>   #define DMA_BUF_NAME_LEN	32
>   
> +/**
> + * enum dma_buf_map_info - CPU mapping info
> + *
> + * This enum describes coherency of a userspace mapping of the dmabuf.
> + *
> + * Importing devices should check dma_buf::map_info flag and reject an
> + * import if unsupported.  For example, if the exporting device uses
> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
> + * CPU cache coherency, the dma-buf import should fail.
> + */
> +enum dma_buf_map_info {
> +	/**
> +	 * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
> +	 *
> +	 * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
> +	 */
> +	DMA_BUF_MAP_INCOHERENT,
> +
> +	/**
> +	 * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
> +	 *
> +	 * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
> +	 * However fences may be still required for synchronizing access.  Ie.
> +	 * coherency can only be relied upon by an explicit-fencing userspace.
> +	 * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
> +	 *
> +	 * The cpu mapping is writecombine.
> +	 */
> +	DMA_BUF_COHERENT_WC,
> +
> +	/**
> +	 * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
> +	 *
> +	 * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
> +	 * However fences may be still required for synchronizing access.  Ie.
> +	 * coherency can only be relied upon by an explicit-fencing userspace.
> +	 * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
> +	 *
> +	 * The cpu mapping is cached.
> +	 */
> +	DMA_BUF_COHERENT_CACHED,
> +};
> +
> +/**
> + * struct dma_buf_info - Query info about the buffer.
> + */
> +struct dma_buf_info {
> +
> +#define DMA_BUF_INFO_MAP_INFO    1
> +
> +	/**
> +	 * @param: Which param to query
> +	 *
> +	 * DMA_BUF_INFO_MAP_INFO:
> +	 *     Returns enum dma_buf_map_info, describing the coherency and
> +	 *     caching of a CPU mapping of the buffer.
> +	 */
> +	__u32 param;
> +	__u32 pad;
> +
> +	/**
> +	 * @value: Return value of the query.
> +	 */
> +	__u64 value;
> +};
> +
>   #define DMA_BUF_BASE		'b'
>   #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>   
> @@ -95,4 +161,6 @@ struct dma_buf_sync {
>   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, __u32)
>   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
>   
> +#define DMA_BUF_IOCTL_INFO	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
> +
>   #endif

