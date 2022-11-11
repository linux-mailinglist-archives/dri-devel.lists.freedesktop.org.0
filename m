Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AE625A30
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F6C10E810;
	Fri, 11 Nov 2022 12:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733B010E810
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwjDOkpyuoKz/T/nh4RThyyWNZoR6PgUMCnT35zdCWDlVar7I6oU1oxwxXR3ZKQah2gMX4d9rw66T+t2/YqsAhztjY5JmZ9SRXaZKettzqiztN8SARVctRXSiBr0Flnwp7T9xS24+tJhkhiWayo60dpi3Oex0BmBKR7rO+fm2zZfELwtTkYY6twf71a9oZjQ6mTmB7dbufFeI1MtQS0E2yKnvnQRlMcrCTDY+S6NuAmjtXtx5NeprpqCqWSf+wDAyfROql+Kz4LhzoyFdUnG5UakK07+a97U86NZfqwLaLkRpaFp5scYXF4+82h2PyKiD7YZNgVoXLruzmJxaVY7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+95Fq6n6fulU4+nqRdI0trBuiLw6s+41/ZNaunRCyJM=;
 b=X6NIhHs1BvMWMgbTbnXKsIA+t1xOL0ECZD0YYc+8VZH4iY6EIa7fVVQtTrEbApdGxoWjZwIEaNhbRcvv/YQao5skZyScXbLT0gPW1ngm0nMW18FrEWr2qOWZWdxu63lXLsOE6KmXV2uSksAzDMZwJV+267eA6A8IZgHdVz6esrRGTa0DTe90IoH4duNDxiOgK15DWAYkyU+ygAUkOrbZzcmKD0U0ZcARE8r8zqKGmO16u3zfHd1W1BI9py4Mx7TDWThYvi5u9vlnEyYFZRU5xrDTXVASMqsVUswMqnnw39UG4TwxSXikgNAUXqjaJWagxFbQ2S7zYu/Ht3JCTEO2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+95Fq6n6fulU4+nqRdI0trBuiLw6s+41/ZNaunRCyJM=;
 b=o9zWL8+YCMllvlekS510P/1GHBIH1ec28QcqgjEFPl5fmGS9TKGq1Tii3ZHksFyJrhxrGHTRAtw4Gzf5UK+LSoK4siZrnaGrmIwldxvIprmVb8EFhl754uFQkf7OaQdoU+fbqrIs3BytdynlWRSbsX6KTLwCKcqOxTo12RT81vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 12:05:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 12:05:53 +0000
Message-ID: <2ee10e0e-a347-71a5-051a-02b9bac0bbb6@amd.com>
Date: Fri, 11 Nov 2022 13:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] udmabuf: add vmap method to udmabuf_ops
Content-Language: en-US
To: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>, kraxel@redhat.com,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20221111114528.608801-1-lukasz.wiecaszek@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221111114528.608801-1-lukasz.wiecaszek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 1354d40c-a14c-465b-22c8-08dac3dd14b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKiDVNKO+jdzbu/5tHya9rm0mi2PdxfDLLSFoO0H+E5SI7sbHOvvSYCTB85ZcFASmgZ0OZbHHr0iJD5ea+afXW6j9uLPyAq/7UXliHGlrElw9kx6XRVqf6Z6AGVkzSFHN/tPNbem7AlNT6iKkhfoJX/6CVb40uOxvhHGAMDn5NaZySElfQGPu25ztPBbSm1hglxbd9HncUhDLJkrZ83ieH0URVeKsMKx2NymmT6vNYmpSp4ocSftcPcvx6zl3SD2sPWGuF1tMuyEfapwDrEvgGOogfBmShobu4vcPdLdwaoQIIUbttdkhLEn+wD1DXHbnrQrfKN3rWa9g1vlSpOczTcoa6qNlEuoOg3yy3K2Or44EAt+FtgxikpLXXE/igy0JN2zDG1m0O5uvC57VaeUXpij0PrqQiA4NfHSX6FqIgspcLhtgZRJJSJZ1xD8dSGetFJu/6pXT+XUk+EPRPPTKckDLDXCfxutqQ/LeNCFIFdrsO9s5fg4dzm4WzaIY8hYh1CKUv4ybwVdtokbyp4QuIizrPFNPO+b0wwvofTqKJT0ALzlysvyli0HA33CURExOrduamDQZ8lUIKU5xnBuLih5eTSPFeeDop/pCh5cf1NtFxaZdUEziwebmzoDfmepMCAMVJYGTgTjenH2JL7p4dZ+lwrUN/d2wVuT35gippuvh1Rt9aL/lueva2Vp/oTG+zQn5ZVXSQW88GCBmTvphNrBnJ2OSr/9rgQJCKyXCLUK66mTiJr7AWho2G+dD2SJZVrTpk0axe83FRzIsNOWh1vXwE29ga2VwiGy3eXTa3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(66899015)(6666004)(83380400001)(6486002)(8936002)(478600001)(41300700001)(5660300002)(2906002)(186003)(6506007)(316002)(38100700002)(4326008)(66476007)(8676002)(36756003)(6512007)(31686004)(86362001)(110136005)(2616005)(66946007)(66556008)(31696002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1FqeHVCdVNjbTlFaWl6NW56V1h5RFFHdGNKT1BnYnpISmFGVHc4S3VNcU5X?=
 =?utf-8?B?YjhSM2swVVRsbzFMZ3FML1VsRkpVN2N6Y1kwbXUrYkhKdFkwVTZjVCs4WGxN?=
 =?utf-8?B?TE9WUGNBYmZVdU1tRUszaVh5MytNdjk1RERWMEt4S0lzVFpsaVhVMlhCU3Zq?=
 =?utf-8?B?M3VSSWZjazNVK3RMWVc2dVFxaForcnRqYlFOOEhqaHNPTGNrOXQzd2NYQkxF?=
 =?utf-8?B?TW8vN1VVQWw5TUlsRTJ3eXZ3bjRleWM2UGIyOFM3UUpyNXhzSnVIc3U3U3pk?=
 =?utf-8?B?ZTlINjZ2SmVETUlpMTFxWU0zK3NpL2d3cTc1WFVpa3hWZytQNzZvT0t4NC9J?=
 =?utf-8?B?dG1zQnpJVGJaUnZrck1ZUDNYU3NZN2l6VWJHMmlldGN2djBxK0xLeU4vMS9o?=
 =?utf-8?B?ZjZvVmk2Q3gzaWdsOUpHQUhaMDZCZGxxUU90K2hlVHRxVW15cXpZbnA4akdG?=
 =?utf-8?B?K2djclNkWThkRllKUkloWTBoUk9XM3F4anFrTlRIQ1BQY0trZnFXSDNUZ2JY?=
 =?utf-8?B?b2c0NDI2VU1OSlFuUTIwajRrb0grUHlYMnh6bEw3VGRyS2lWZk8vMjBuNGxW?=
 =?utf-8?B?cE04Wk94T1J3TmptZVVucnMzd2lzWmJFdzBhQ05RMXNscmFZS2owSEVnSW8y?=
 =?utf-8?B?L21jM1NZZEU5THQ1bWVnS3pza1NrdEhHUWtjRGwzdFZkV3A2S3k1b2NSSEI5?=
 =?utf-8?B?SWlON05KbDlBSkw3ZTVXaEc3M0VWY3Ztelg5TUllVm03dTJWbHNzeGp3QSt5?=
 =?utf-8?B?VVJaZldtSFlVYnE3ZGpsQk4zWjNPZ3B6bk8xRTJlQjdHNTU1SzhqajVoOG9w?=
 =?utf-8?B?dENDWjBYc3N6dnZKWFBpdFNKbm44M3NSQ0x0bEw2bDk3dHpobU51ZFVrZm84?=
 =?utf-8?B?Q1AyekdKV1VsMG9oWjA5VlZKOXdMZnFxMURWR1NwRGFrVEpBdHZQTVUvWGFD?=
 =?utf-8?B?NmdwZ0dOL29ncEZwUUhDZnNDR2tvL2lCYis0SUdhZU9rSzFyVE5ZcThWbnFk?=
 =?utf-8?B?cGdYZG5JT2JoSEFqWnJTRC9YK2hvMnFhT1p4SFdsbE9WbTI5Vm9LU094Qy9Q?=
 =?utf-8?B?bG52TlQwUGpkTURSL3dCY1NSU0lyMExhdDE0WXNaNUZhamwvaGxKY3BHWitQ?=
 =?utf-8?B?d0lwdXkwQjdtUUdLdmZ5SnFTbU93ZU9lcXJkQjVIOGJ0NGlSZXRsWGpoVmN2?=
 =?utf-8?B?dGNTRGZJQ20wS1l2ZmNyOGhzcWR5SVlldFNIZnp6V1J5VW5OSEY3VUx3OE1E?=
 =?utf-8?B?VThPK0hidGhKYldtbEFvTGpIL01WR0JmNXJ0dFRhRVIwOXRXV2FPRXIwUUlX?=
 =?utf-8?B?NGpTdm9keWhZNThOaUR3MHNWNEZPWHdOR2N1Sm1jaHlpb2NaWFFEaW5VbUdv?=
 =?utf-8?B?b0JxUzJIck5jdHludkdBZzVpbmxVTnZMK2w1M3NvVk5nd2t1ejI3MWl5VTVv?=
 =?utf-8?B?MkxJZmRYVS82UDhhRWw1WnlsVWV2anNZUGNKN0IzS3RwZEoyUEh5dE1XWHZ0?=
 =?utf-8?B?Z01zN0RYOTF6dWx0RFlKTk5xTHltWjZ2T29uRDQzSWxvVGM1Q2JtZ0dCL2Ri?=
 =?utf-8?B?RVZQU0UrelhKYzhQWWNFWjV1NjBoQW8xL0N5OWpnVW1ac0hWY0RDb2d3cVpU?=
 =?utf-8?B?cm0zWlBXRWgzblZWMjFUTmlVem5Cb2x1eU9qWXg1S29jOXNUWmNVQk5lQSth?=
 =?utf-8?B?NGhKT1l5KzlqRG1oaC9RbnVydGN5WEZ3emd1TWZCdlkyblVrY0R4bFI4UkpX?=
 =?utf-8?B?NEoxSTBPWVh3NGEyUWNRWkpOSjhWYm9aVHV6NHZFblNUaytxSi9QVjE1MEJF?=
 =?utf-8?B?VFRSOUNKNVp4eDNHaDVZUXQ0OTd0VVZlNTk1aWdKdURXb1NtVC81dC9haXh6?=
 =?utf-8?B?Q0FUK2Q2cTA0ZUdYVUt1Z21xZnZGYVpQalBhalpnbTBUOU52SUVsbE85QU53?=
 =?utf-8?B?cU1jRzZCVThHRVltT05xTk4zcysxcklmZzc0QnR0R2U4aWZVd3VwNzI2akUx?=
 =?utf-8?B?aml2cGNkU25MTnVGOVNrdHN5c1NwcS9tdEE4akx0eThmVExxc0QxOU5zSUFY?=
 =?utf-8?B?bDdObkVBTE1rdE5aRGQ3dkxyNStVdE9aYVFwNnBNSFNRL09Wck5naTdMTHhD?=
 =?utf-8?B?RHM4U1VhZStlc0lUekJnTitKNDNhK2V4cTdETktnbEQvZEM4TEwzdDQrY2Rl?=
 =?utf-8?Q?9aAbRNhCdqWZAEsxI9++GcLJ9olvSwYOcmQCHEJS43Qu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1354d40c-a14c-465b-22c8-08dac3dd14b1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 12:05:53.0563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vD2w0w8oeIreJaFvaxyG3ZLBbeV1fZptZ9SZXRlqDjHpL+JYy35E7Bwi33Mjav4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Dmitry as well.

Am 11.11.22 um 12:45 schrieb Lukasz Wiecaszek:
> The reason behind that patch is associated with videobuf2 subsystem
> (or more genrally with v4l2 framework) and user created
> dma buffers (udmabuf). In some circumstances
> when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
> wants to use dma_buf_vmap() method on the attached dma buffer.
> As udmabuf does not have .vmap operation implemented,
> such dma_buf_vmap() natually fails.
>
> videobuf2_common: [cap-000000003473b2f1] __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
> videobuf2_common: [cap-000000003473b2f1] __prepare_dmabuf: buffer for plane 0 changed
> videobuf2_common: [cap-000000003473b2f1] __prepare_dmabuf: failed to map dmabuf for plane 0
> videobuf2_common: [cap-000000003473b2f1] __buf_prepare: buffer preparation failed: -14
>
> The patch itself seems to be strighforward.
> It adds implementation of .vmap method to 'struct dma_buf_ops udmabuf_ops'.
> .vmap method itself uses vm_map_ram() to map pages linearly
> into the kernel virtual address space (only if such mapping
> hasn't been created yet).

Of hand that sounds sane to me.

You should probably mention somewhere in a code comment that the cached 
vaddr is protected by the reservation lock being taken. That's not 
necessary obvious to everybody.

Apart from that looks good to me.

Regards,
Christian.

>
> Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
> ---
>   drivers/dma-buf/udmabuf.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 2bcdb935a3ac..8649fcbd05c4 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -12,6 +12,7 @@
>   #include <linux/slab.h>
>   #include <linux/udmabuf.h>
>   #include <linux/hugetlb.h>
> +#include <linux/vmalloc.h>
>   
>   static int list_limit = 1024;
>   module_param(list_limit, int, 0644);
> @@ -26,6 +27,7 @@ struct udmabuf {
>   	struct page **pages;
>   	struct sg_table *sg;
>   	struct miscdevice *device;
> +	void *vaddr;
>   };
>   
>   static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -57,6 +59,21 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   	return 0;
>   }
>   
> +static int vmap_udmabuf(struct dma_buf *buf, struct dma_buf_map *map)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +
> +	if (!ubuf->vaddr) {
> +		ubuf->vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> +		if (!ubuf->vaddr)
> +			return -EINVAL;
> +	}
> +
> +	dma_buf_map_set_vaddr(map, ubuf->vaddr);
> +
> +	return 0;
> +}
> +
>   static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>   				     enum dma_data_direction direction)
>   {
> @@ -159,6 +176,7 @@ static const struct dma_buf_ops udmabuf_ops = {
>   	.unmap_dma_buf	   = unmap_udmabuf,
>   	.release	   = release_udmabuf,
>   	.mmap		   = mmap_udmabuf,
> +	.vmap		   = vmap_udmabuf,
>   	.begin_cpu_access  = begin_cpu_udmabuf,
>   	.end_cpu_access    = end_cpu_udmabuf,
>   };

