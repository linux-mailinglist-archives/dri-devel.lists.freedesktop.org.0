Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07FEBE5D1F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 01:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E265910E05E;
	Thu, 16 Oct 2025 23:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sExZW6CI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3010E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 23:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzVw+V0y3ntpsI4be8b+hKVS2vjN3qfKRzjVB8p7LEr1ciZUJBTPxX9xEm6FrBcISrwovEZDKvAwxYLI7mu5sam3aJu0JJo/bU0eT7ThIcggJMGTW79QktjI93zODK+TSFA6GnzsatvRtOzpTHRD1Qdbdz4knCyG8gKOwn7W6YeXf3aDyKUAv/8xDAIDdxjkjee+ReKwqsXmkc9SPS8F/XhRvp4kWaDC1YFjd1M4znnjPJuEhES+Q91xjBThuP2EqwkIjG/OPTVkbtHyvq4rfz9UoaO8ahlOpdPW6tLlztXMA59WmMRVOzsp9FCO50l5KDe/BeTDz3hULqQJlXJByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD/xCVRTrLeDxfGMCtcUQXjf8Hu5gk0sMVUTLPCchq4=;
 b=G/O3XDxmPm9fnTUeM4lVCSRolYgasAohhCMPMOcQBgCG+tHD3hTqLenj9TiWbCyLysciJGmMWAVXacJukpoHPyDPd//LfaYEQtURtCnNglSXeZxl3YRM/6IrVor9e1L+Ifj79YaKc0RST2K4CUkk1W3c2871uuc1hkchpYwQLVm0uKd1x8LjBx3QUFC0zftkemzQfjGFWFCBdCWuVpl3u9PC+64DWE6SYS7b3yD2GiwuTuHFFh531MN9P/BbKJlYxcQzoaAQnzjOwB5LokDcUXYNrPWynItUWAiLYvfNCgjEfbo2xzRhWV9DUqSdDw349WsKMA4mXEsfZrnE3baAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD/xCVRTrLeDxfGMCtcUQXjf8Hu5gk0sMVUTLPCchq4=;
 b=sExZW6CITN4sB1IKBxwQfti39f+DtUoF4um3BD1Hzg8j/ajAdbhhxXNvS7WQOHdpgK0J60tKbJKGfXLJCjyiLOwWrCmDJ2UtoKZi9A+Y2bOYM1cwF6Xza/ArVXH4nmxwNePYNnINKoA/DMkaNfE/uBrDBMtkiaoa7xX55iCWpOWRabxrV8N6v97viCY2jKL7QlPJcOYqvXPLCITHFURKrnpzPc5/Iwmt/knV0euWC8vQWrfEBIHll4nTPWnxCp+2l7auwnkyZkCNt3rDShzzhf8a1a67bvTrgcU1j5P/XnV/YgYY/3MhmDjcxumjuqCPKv4YF2qvDG1pD29T2qSc/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Thu, 16 Oct
 2025 23:53:35 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 23:53:35 +0000
Date: Thu, 16 Oct 2025 20:53:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251016235332.GA265079@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
X-ClientProxiedBy: PH0PR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:510:f::11) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b9e1f5-f067-4b8f-547a-08de0d0f37de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rnGVBiR43qrrkw2KiPc0VorIsauBwV5mCkT6wX5E2r6AIUy0QZ9igCmFyYHS?=
 =?us-ascii?Q?iRRyHFQCo1te+/o8kLfhZF+RdMCWA2Mla7l7OFLDsFmB2UlouEb3v1ptWRKE?=
 =?us-ascii?Q?kOH5Gyt9IXs60jzqs0QsMDKrYcq9lyU/O+cNhylM3Z1Z9jo1ModPpdpxoBsL?=
 =?us-ascii?Q?T7gxlOhV+YAQj6v6aiU/IArK6oPNPxDN7QFcVKMHSLG46GTeQhasQLc5z39s?=
 =?us-ascii?Q?/A8CK5RzujiZBcUHZ2zLH95K709+oQMV5SULDxSkTCNsWcO1IToYNJJw5kpA?=
 =?us-ascii?Q?oR6bdR0j8WW0xwJwLAJ3+9SVuiErXpSAViGk8TylRYn7FJDYkJnx1OqPbMdf?=
 =?us-ascii?Q?3U7qQOLNtNekAR58V1ZcwuUSic84dqW2E5ja2CHTHdcbvRUrfvYlhvCcMsBy?=
 =?us-ascii?Q?pMQs9EUQ6mHO8e1AkujRDf+owbgyIVaMCXbjLUcHb9lM7WKX+0xOoQHh6KDn?=
 =?us-ascii?Q?0hDL9XU9sCYBdS3E4FhpUhtUXVai2OuZ8IO49mIifcOlgZbE3KRt+h0aoCsU?=
 =?us-ascii?Q?0ZikxUQHm0wRhKK5iVwE+b6OPI6faBy4ULydJOgAxR3q4ieXyilbQPE03dm7?=
 =?us-ascii?Q?Rhg2CCiVoEKgDDIEcB4UtnIjIQbY0TIcGaIPsxslfxReKGN2GDT7Fv495ef+?=
 =?us-ascii?Q?SPQlOEW+Q9PHW3kmdSd/JFT57VNdHBuWfwx2IK4a9vTiRTkAt99y9r1gEF7r?=
 =?us-ascii?Q?m8Lf8bhVuuOcknXYz9w5FPF4/iiDth9s8+GRgiRfn1ydce5OokHntgQtfGtu?=
 =?us-ascii?Q?cZucSiOQrzw/MEYlRqoi2I1cVhvCOZMlVvUjna9glu6vkOxAm3A/A/wqEu8G?=
 =?us-ascii?Q?Z1/4ywpiOpplfVZJeqfSYn+KAIRmUxu4PMmsRQuG9MvRrpQHfQx8da5VOSlM?=
 =?us-ascii?Q?6uZGuTOmmypbxV+k2sI/v9oRiWDJ/lHtBUSnzAwEL9xQldTVGbgT39R7Hqnj?=
 =?us-ascii?Q?fyeIfBsN+uTzRcr9Ko7y7n4to5keywpEEjekmxn3WJ9JZE9AwF1RW1O9ZFWH?=
 =?us-ascii?Q?fGfkliw5geCNy6i9LXOW++IFdKskAcqfT+YzfSZR9/fnQcWrycqmbUct0Njg?=
 =?us-ascii?Q?NLgrMmMwFjh/22T3odvVKoMDVQPEWpbhgXFQ76MVfOqfmFJ6hjZP4Spktw6P?=
 =?us-ascii?Q?PpczAYp7rTR7bteEvuQPks/AzeoTBMCqGZIrvCrtvePGJMwATx3th3LQvysU?=
 =?us-ascii?Q?OuYov/VwO5KlFHKCA82Jm9DQVsX8eYl+Nd9j6JPXjXs1jLGMuGhLSk8jWeZD?=
 =?us-ascii?Q?qasp2rmqmTZZO77Wbq7y77MCn87Wz1q+U5f5i5xsymCN7LsCUzrJk/NLvekY?=
 =?us-ascii?Q?fI/oilB4mfSG367kcOnBeJ1JekvdXlGei+asIFFhxHURgLzgREmnoUu7HORG?=
 =?us-ascii?Q?24zy4o64oyTZvkv8nQWXjkN41BDQdlJyo0lgD+laCZKbyPD/iPHD9DoBMxNS?=
 =?us-ascii?Q?Y38c6zxsUkchGex7PoJ7p9sNxjAUMunV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?39IpYg/hgaPLPdM27s4mQS8T4DJCdcelKREpNEih5CqGHfhXY25GKB7FQpGU?=
 =?us-ascii?Q?1wlmQI1GBdWNOP2xQlsOerbQgvvOfJ3Ys0l0F2CN4wAbec/B/tTmtO6ecuBa?=
 =?us-ascii?Q?ZHTjeaxpUy7tgyO4gXdj69R8iDMMFtTm9eJIfF1CWqhx7SaCPB5E54+fQT7Q?=
 =?us-ascii?Q?/cOJMt3+zPqWjZHa3Oz8zpNOgFACOD/qrDZwmk5ishyCk256EsEs6QZaaMWy?=
 =?us-ascii?Q?9dn/42TJCdZGLG3mcylwCP6ZI5C7/famSHJ8QDG90NFySPfIPofgsXMZHB3M?=
 =?us-ascii?Q?umeWJuvAqPPyENcHhzRHF4b0ZZLtqzGAP5Su8g3dXM15UzlCjttHbEVe+9pH?=
 =?us-ascii?Q?jCevoFiq1odNZgD4ieKOiM9eFTkta6N6qC/AiGwsnmJVyufwkLQocZSiHODE?=
 =?us-ascii?Q?ocFHHWES0WN0/fziKRTiCW8QGBsJuDBlqOCaY81eJcftAa9G/PN4UFQIwBuw?=
 =?us-ascii?Q?0YVff2+meD0rX8wOoVWkMaYy//C4zWaSHVkQFnr8y37kmnUxgfs1kLkyVbDa?=
 =?us-ascii?Q?vFy8K3H7sZ/IXh21RqW5vgjyGMA/wN9FsKsFIHxm9QugudMxOhedDzaxuiY2?=
 =?us-ascii?Q?vhbUoDpE2D7BA9w9N74SQuIfxPyuBAfkVBAqZR9knFRCyWNYulL0NpngHkMr?=
 =?us-ascii?Q?+SCTkfuzRDbi6cWFRaKnU69MfcAPbCPFQaSQaDvh+zO7nUrAg5IotyFrq/zy?=
 =?us-ascii?Q?lI9Nfo5tGVldpo/OXN/6ueqw/c08MIy/d94to0bDEZmcgolNb3WThtIAdb0c?=
 =?us-ascii?Q?7bUcjrbtWBZ8Pwc8cS58Cf451bo3qOE+S8Aik1QoRvy28QEJC2nDO4Ku14rO?=
 =?us-ascii?Q?Cq6Au+4VsunJDDL+OPYQaamcNzbfil2Mb3dtrZx78f4frebgAtjmBKGpFmI7?=
 =?us-ascii?Q?9JIhvsZcK0au8oKnqXlP/35aiQQjWiZp2JGbKSndAuBWHZrE/rrmkvNjEwig?=
 =?us-ascii?Q?YwQFcjmQuQshLmhzp9bJYT3vAtCG8DkWBPQH0KPXg2Irhyx2SQoLClZkafh9?=
 =?us-ascii?Q?L4EkHye5uSok7uIh5D73QDJsavp0yFmjets0ICGn5cBcegZuNqHkuxHUNEkm?=
 =?us-ascii?Q?IMY1+XvKkSmLVmJgXo5E5i1SJJunZNgjmvlvSSoaoqBtgl1LZgTBxSr6TsdN?=
 =?us-ascii?Q?7wdhLakRX4rHC79s7tQa5PA4VgffcwX1qFIy5DmfGhGPKwqfwdCARAeWYfY1?=
 =?us-ascii?Q?NLYz0gXnWnUAyfmqShrTv/+fwrI3V/cXlDzrcIDQ6k2KELnd/YAibhpx+Egt?=
 =?us-ascii?Q?8RMFrg9m64JSPabUuAB9hZ0qzfSXcO/+B9f0AYsAoaxhuh3Zx818c4yQP9gH?=
 =?us-ascii?Q?z47ukY2r93USzf4G0+vqDqJkyODFn7WoJ7KFndaPjdTwyvqZblWlbvuhjd2T?=
 =?us-ascii?Q?1MpBvmLzDHzzrf89WCbIChjPJf9dPLnhCptzEONgPbPGHFih3yZ/MhJ4cyYf?=
 =?us-ascii?Q?ONaqS03P7jo5buSVHmZrTEKgq6WRs63DXLlADkt7cxXWsLzLQN3l42PyuOEu?=
 =?us-ascii?Q?IaFYjZwxhs3//Ny8OFWTTIC/e7Nq7KmK8fx04IDaXoWBVz7XaVCO2QtPrkAW?=
 =?us-ascii?Q?slXOzxFYhCDN0lX0KLSZQy5LNnclfs8SWJ45j6MB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b9e1f5-f067-4b8f-547a-08de0d0f37de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 23:53:35.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jt9bYDuyBbkaHgYqsT62+FAa/0GFys7MoQUQrQy99mNhrDUn13ZL3GVgoxyajCEU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903
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

On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> +
> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	if (!attachment->peer2peer)
> +		return -EOPNOTSUPP;
> +
> +	if (priv->revoked)
> +		return -ENODEV;
> +
> +	switch (pci_p2pdma_map_type(priv->provider, attachment->dev)) {
> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> +		break;
> +	case PCI_P2PDMA_MAP_BUS_ADDR:
> +		/*
> +		 * There is no need in IOVA at all for this flow.
> +		 * We rely on attachment->priv == NULL as a marker
> +		 * for this mode.
> +		 */
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	attachment->priv = kzalloc(sizeof(struct dma_iova_state), GFP_KERNEL);
> +	if (!attachment->priv)
> +		return -ENOMEM;
> +
> +	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv->size);

The lifetime of this isn't good..

> +	return 0;
> +}
> +
> +static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
> +				    struct dma_buf_attachment *attachment)
> +{
> +	kfree(attachment->priv);
> +}

If the caller fails to call map then it leaks the iova.

> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
[..]


> +err_unmap_dma:
> +	if (!i || !state)
> +		; /* Do nothing */
> +	else if (dma_use_iova(state))
> +		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
> +				 attrs);

If we hit this error path then it is freed..

> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> +				   struct sg_table *sgt,
> +				   enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct dma_iova_state *state = attachment->priv;
> +	unsigned long attrs = DMA_ATTR_MMIO;
> +	struct scatterlist *sgl;
> +	int i;
> +
> +	if (!state)
> +		; /* Do nothing */
> +	else if (dma_use_iova(state))
> +		dma_iova_destroy(attachment->dev, state, priv->size, dir,
> +				 attrs);

It is freed here too, but we can call map multiple times. Every time a
move_notify happens can trigger another call to map.

I think just call unlink in those two and put dma_iova_free in detach

Jason
