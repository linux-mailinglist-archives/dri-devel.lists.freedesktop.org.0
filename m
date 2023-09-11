Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D606F79A6C8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E4D10E200;
	Mon, 11 Sep 2023 09:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2910E200
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGBp2h3UrOEeP4aIgkCyDAcYly7Rvu4gcG4YDm/QIC78o4DCtztUpB1JRwi2WzUIBct0an6Sr6Zzznrn0vlRK0y9qUDJV+EtACWPgmYPWZW+ZDj9EFipcL4PgoZseo4qwEs0Cvu9YBfZW/KAycawrmc5wCnO6vpScnvf29dSpxW+WHE8B5V6QFFUi7M7EDx0PR+LxSZ8V6JWDp7IogAptfLeprmZo4vYFknAVQkCtMK3XCKujGmDjmBIBo6iG/eeERlTc578rFfVV7Ra8i57yKIGwwJjdvFfsMKj3rUOaY3FtSDl0XXdrGHKFVBQm/KSHBMt6pVoZPx+E6y7n4uUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSJWijDAIXOwwc7SCmxmXIcPnlUkIEVZAB5v1yecs50=;
 b=kBzoFC3kKtunDVAT34ZsKf+sNImdtdq5cDhaYaUZCXTrr4qQYVG80Glo8jrZmEnAPhETunodOEiJMVLwdUpv8FnUOwkkjQUuVbBVBc3Y5raX3CsKBqjnW+rTT5MzrNNx4tGekhFmtR3WZJvzWvbKmgyP7VX9PqLsbrBpg4RMuWqiu+xcdtYBHM/JsACwUjHDwEoI/RieARP6xA+Ws+F0esbClD1OS46Bt2O/NSunshLv4hC5k1zVPBAdRrUdnQR+ZRptla2DOn2BCCoxMtNbjfYiJZyTVsfh2u97CyXHSUBZmES5LZ+0StZhSu1ByYjka/qpQmPJ0Vc5fcunI6uB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSJWijDAIXOwwc7SCmxmXIcPnlUkIEVZAB5v1yecs50=;
 b=ZwB2vbXeFe7w9Xfvto5iTYWaBe3RFf4FA0rqUkdFSQPuRr9n+6A2JRa1LKqIWc6L1FrEtzEFcloSICLUTkoUHcH1ujFYQ2Qdmx9kx9Fg1I+dDOQgl4Id7eZJ6JFSVKxKg9+CwVB1TBjmzteBslRuJPRsanq2+DOayyQqeaNjLzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5455.namprd12.prod.outlook.com (2603:10b6:a03:3ba::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 09:36:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:36:35 +0000
Message-ID: <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
Date: Mon, 11 Sep 2023 11:36:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/9] dma-buf: heaps: Deduplicate docs and adopt common
 format
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-2-yong.wu@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230911023038.30649-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c775f60-3539-4e69-439f-08dbb2aa9706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBPbPFxO52HhErnj0f2dKbdkRKJPw5h8I1OxJzwzEQfRekexBMOg9Fig+czmWyB74E/1xKe1/6vbD5YNhDCPRekvp2FDDqd6cNlE+jLyvf3nFxQ55MQmu1hgjS5qac7wqxBHbGDX/fZYxv/prWo3XELr0I5iGZtfzAud+XNjnR2hXMGwX1aajfjujtEDAKdsP+m0Wxy5GUYEoKXSNcjDBn4FlCFnBr3GZlnT2uc7jeJOB+LmZx1xpiBsNsf/cJW9isU901wDmjC+8HdZLQuNs8h7BN3xf6xMC85Tmoi0VOY1dTzz4yJcIfYh7eIcfjOj85Qkk3uar0lDqu9ivZryhjNQ0qzJxKRxKyIasMp1rbUn8/cDO35tkynFoHkeaw0BtGAQfcZruMuF1Mq5bCdHUjeUaQerDLHOKAD56zszpPNt9vEN5TToQEjLNeQ7rZueUWJRpKsfJ9yCm/Qc8EeiB4SkhKPkYLLDLRGMDabvxSLHgiPHzVcudg8MPhxD8fvFYZrz8i06RdvhfJdpV8FCkLzDeg2CErXZc6ibWjqn1KjKRsKVDZrqakW3cmyZfVxsn/P411j+MphuHZaK9v0BOEqDVQkn5VfhVUPtaxXeXC96NkOWrPGrXkCjHUD8fCxAJRj88aL7+pnsPFlsMaSz/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199024)(186009)(1800799009)(31686004)(6506007)(6486002)(6666004)(41300700001)(36756003)(31696002)(86362001)(38100700002)(2616005)(2906002)(6512007)(83380400001)(478600001)(5660300002)(316002)(110136005)(4326008)(8936002)(8676002)(26005)(7416002)(54906003)(66476007)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWNacEMxUm5rdVNDUVgzdVAwemlMRU5ZdVpWbXNEcWxBUDV5TFRXVjVtdzc5?=
 =?utf-8?B?Z0xrTGRUV28yaVo0aTdFSWVWbzBEQ3JJUGFjZVlQT1VLSDJPdUFXQXdNdXdN?=
 =?utf-8?B?ck9DT1ZsakJidWw4dk5ZVE9ISGh4em5YTVJNamRXMUNZUTk2bXV2bUptZW9h?=
 =?utf-8?B?Q0ZxVWRxQUlJZEs5QklzNUlueTcwNnp0bXpkRlNGREV4QUlldFRhZHA5U29r?=
 =?utf-8?B?UDd3NTRPeElLblVZMEFzSkg1dmtOVEdOVUErU25xTUVEOEUvNWlhNG51bS9R?=
 =?utf-8?B?eVNJZ0hNODJPVFBFYTB6cEFiZ1E1TlR5anhFdWtTZFcyakpWOUU0TXhaeHhQ?=
 =?utf-8?B?am1BSmlLbnB1blFaSm13WHJGSXlOQ3QrYlBaT3VhTUNIdERuN0w5NE9QYTBl?=
 =?utf-8?B?SzdESlRHQW9nSG5PMHZMY0dQN2ZKZGlyN0RUVkZLYTVveXM0U1FBS1ViT3ZP?=
 =?utf-8?B?SEtxdEZ3aCthZ1U2VGRWeDJoTTVVSGNQUWZGcHF2Q3dzOG5sUDd3Z0N5ZmZB?=
 =?utf-8?B?QkxCMVgwd053bkplOGxSSDdxN0t6Smh6QlNnbkJ4clUxWjgzTTA0WXQzY3V5?=
 =?utf-8?B?Q1lOdnRvL0FGejcyOE9aeTNIeWY1Qnh1SWFhQ2ZUWmNaZW5Kb05VRGszVlZu?=
 =?utf-8?B?by9Ka2gza0MwZkdESnorUG1ZUy90QzVxb0FqejY5VHJRYW0zRDM0VkNCQlRJ?=
 =?utf-8?B?aHh0cU8vSitxbzVDNEtSQ3VoMWF2VVNXTEg4NXZ3TU51Vm1XeEt2Q3pBQytn?=
 =?utf-8?B?TlcyUUZGb0VZWVIrOHBSbXlsSm1lQUgxT3NvYmpKTGo4cHFHN01pN2JtMndN?=
 =?utf-8?B?M3ZzaXI3ZkZEMk5CTFVTSGFTT09EUS8ySGxDUXE2RFZXVVhtcFV5aFhRbTc3?=
 =?utf-8?B?bHExZWFBOEtheTJKREE5QiszQ2dvTkhiUmtzRnRTcUd6RWZVby83Wm9vaWNB?=
 =?utf-8?B?OXdWVnNFZFRQL1FBMmt0SXdrYmdhUjd5d1VGc1orREFicWZ0RE5ITUdoY1Jx?=
 =?utf-8?B?VU1UUW44U3NKZm9ISHorNEhhM3BPelkwMy85YmNrWHlBRWxsS2xMYURFRnZN?=
 =?utf-8?B?ZkJPcGVBMU96VHJEeElFeW1vcnV0K0tGQUlHTnM4WFYvM0pjT2ZBVnl0M0wy?=
 =?utf-8?B?YVExSHd0NWU0MFhRWmFoZjI1czNwNnE0bnR4czBJbjFtL2NrdGk4ZVpKenY3?=
 =?utf-8?B?dmlRQ3N3WThiR1NiWm8xT2dST2pJSHVMdUV4TzdzOXo1TDBSaWM5YkNhbEJM?=
 =?utf-8?B?azEra01ldlNRL1BCY2VsYitWYWs3elJyL0tyLzVJR3ZQbHBXRldQbVcxR3h2?=
 =?utf-8?B?VEwvaksrazBHb0F1a2hPM3VULzZpNnVwcnpkTGZGN1dzL3VZczQxUWMyaWRr?=
 =?utf-8?B?NjF5RzgrSGlkUGVEejBKVW1LOHlvWjh4d3FuWHpwWFd0Y2s3K09UM3FVSmVR?=
 =?utf-8?B?OXFnQUZjS0JYdkhFTm41SFJLOWdZMnNLQ2Z5MnZmdlNtL25aa3BzYTlSZTRR?=
 =?utf-8?B?aEdDSFFTMWJpc2Rlc090NFFRWEJlN1ZjMllrVHVFelV2MmNYWWRSeWF1UWhR?=
 =?utf-8?B?MTltYnp0SVU3eE1EOGZvMU5XajVxU05ROVdYd3Z0SG92cm1IdzRuT1lVSG5X?=
 =?utf-8?B?dmxJMThZNGgvZXNmQjVHMXVsdEd3ZmVicFl4Tjh3OUFTY2VWbjJ3SHpqSVVa?=
 =?utf-8?B?UjJ0WlY1VGVZMG84Z1cvcTZNRUpXbnFtWmJNSi9qbnJ1UHE3YUE4U3g1NVRF?=
 =?utf-8?B?K3hHMkJQQUZwbWM5QjRZVmFGK054UFhFcmtLbVVLTGJ0bzk3YThNcW5LSXAw?=
 =?utf-8?B?eWFDZGtvd0RzbVMzaHJiN1h4azArOW5HcEM5TW9YeGVWVEJZVDRSaUxiYTg2?=
 =?utf-8?B?aS9RSmF2K2tJNXI3YXdLeS9SeFdNdnU0NFBobFd1bEJ6bGREUE4zSytoWW9k?=
 =?utf-8?B?d25pTS9mSmY4Vld1OW4zcDIvRzBXb2owb1duWlI3Z0lLYno4VTdDMEd6ZzAv?=
 =?utf-8?B?c1VaMUVMVkJiSTJrM3VtbTdFUTZqQ1gxMFBNT1FWdUZBNjBEbHBVMTNyRlZR?=
 =?utf-8?B?Wm5LaWwxSmVySDh6K2dqVkMzYTBXdEx5MXJXVk9VYUR5VkMvVWlZbnFTMkpZ?=
 =?utf-8?Q?l3LscITCPgw1jQZNklv6KpT9s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c775f60-3539-4e69-439f-08dbb2aa9706
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:36:35.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOMpsTvrz/VtuBFxsXD+tKOsrijc65Uj/8WFPAo67+ankSMniXPSd/0+jko00N5x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5455
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, jianjiao.zeng@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

m 11.09.23 um 04:30 schrieb Yong Wu:
> From: "T.J. Mercier" <tjmercier@google.com>
>
> The docs for dma_heap_get_name were incorrect, and since they were
> duplicated in the implementation file they were wrong there too.
>
> The docs formatting was inconsistent so I tried to make it more
> consistent across functions since I'm already in here doing cleanup.
>
> Remove multiple unused includes.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [Yong: Just add a comment for "priv" to mute build warning]
> ---
>   drivers/dma-buf/dma-heap.c | 29 +++++++----------------------
>   include/linux/dma-heap.h   | 11 +++++------
>   2 files changed, 12 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..51030f6c9d6e 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -7,17 +7,15 @@
>    */
>   
>   #include <linux/cdev.h>
> -#include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
>   #include <linux/err.h>
> -#include <linux/xarray.h>
>   #include <linux/list.h>
> -#include <linux/slab.h>
>   #include <linux/nospec.h>
> -#include <linux/uaccess.h>
>   #include <linux/syscalls.h>
> -#include <linux/dma-heap.h>
> +#include <linux/uaccess.h>
> +#include <linux/xarray.h>
>   #include <uapi/linux/dma-heap.h>
>   
>   #define DEVNAME "dma_heap"
> @@ -28,9 +26,10 @@
>    * struct dma_heap - represents a dmabuf heap in the system
>    * @name:		used for debugging/device-node name
>    * @ops:		ops struct for this heap
> - * @heap_devt		heap device node
> - * @list		list head connecting to list of heaps
> - * @heap_cdev		heap char device
> + * @priv:		private data for this heap
> + * @heap_devt:		heap device node
> + * @list:		list head connecting to list of heaps
> + * @heap_cdev:		heap char device
>    *
>    * Represents a heap of memory from which buffers can be made.
>    */
> @@ -192,25 +191,11 @@ static const struct file_operations dma_heap_fops = {
>   #endif
>   };
>   
> -/**
> - * dma_heap_get_drvdata() - get per-subdriver data for the heap
> - * @heap: DMA-Heap to retrieve private data for
> - *
> - * Returns:
> - * The per-subdriver data for the heap.
> - */

Kernel documentation is usually kept on the implementation and not the 
definition.

So I strongly suggest to remove the documentation from the header 
instead and if there is any additional information in there add it here.

Regards,
Christian.

>   void *dma_heap_get_drvdata(struct dma_heap *heap)
>   {
>   	return heap->priv;
>   }
>   
> -/**
> - * dma_heap_get_name() - get heap name
> - * @heap: DMA-Heap to retrieve private data for
> - *
> - * Returns:
> - * The char* for the heap name.
> - */
>   const char *dma_heap_get_name(struct dma_heap *heap)
>   {
>   	return heap->name;
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 0c05561cad6e..c7c29b724ad6 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -9,14 +9,13 @@
>   #ifndef _DMA_HEAPS_H
>   #define _DMA_HEAPS_H
>   
> -#include <linux/cdev.h>
>   #include <linux/types.h>
>   
>   struct dma_heap;
>   
>   /**
>    * struct dma_heap_ops - ops to operate on a given heap
> - * @allocate:		allocate dmabuf and return struct dma_buf ptr
> + * @allocate: allocate dmabuf and return struct dma_buf ptr
>    *
>    * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
>    */
> @@ -42,7 +41,7 @@ struct dma_heap_export_info {
>   };
>   
>   /**
> - * dma_heap_get_drvdata() - get per-heap driver data
> + * dma_heap_get_drvdata - get per-heap driver data
>    * @heap: DMA-Heap to retrieve private data for
>    *
>    * Returns:
> @@ -51,8 +50,8 @@ struct dma_heap_export_info {
>   void *dma_heap_get_drvdata(struct dma_heap *heap);
>   
>   /**
> - * dma_heap_get_name() - get heap name
> - * @heap: DMA-Heap to retrieve private data for
> + * dma_heap_get_name - get heap name
> + * @heap: DMA-Heap to retrieve the name of
>    *
>    * Returns:
>    * The char* for the heap name.
> @@ -61,7 +60,7 @@ const char *dma_heap_get_name(struct dma_heap *heap);
>   
>   /**
>    * dma_heap_add - adds a heap to dmabuf heaps
> - * @exp_info:		information needed to register this heap
> + * @exp_info: information needed to register this heap
>    */
>   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>   

