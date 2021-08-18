Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E63EFE86
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 10:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB11B6E499;
	Wed, 18 Aug 2021 08:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135856E497
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfTLQ6YnLWS3A2IrVfHa6nxo2dmdzpQubYbhLvlW9YX2gtY4+Xi/wNb4Q27FHSzsj6UDKxC2V1AmbayBc41firi9RIDb6Hp/TPzv/mqyj/1nDzwfCY2Wv0FeC4MFL3MbyT6V8+w4Bo2JbjawYIiHfLQkzZauebQ22UWcLk/SkLVWlbRq9FMcCoYlWmfw9v9YueRlxx0q1b+waG+zVY0tfBnT74BD33aEu+jzPteJnTRJ6NJ67uEb15Ng4NTLx3G/9ZexxFPhdSCBpKzZjj9xYt/NPqLDJhIHjVRADAsXRRjmkvxoR/XKInp/KQBYZdYC+6A6fEP5KHbjubJk4pSNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1VJbNnnNAYVRN1sCYSkMwltVFzMza62UhuQSUH8goU=;
 b=NQz9JudVos8piNyP8cjeRYJ/4zTah/aVV8OLfyzLRZkU/itEZJhSIpbYg4k1cI7Ljp/jQyTlT2DfPyORfS689Vdubi5QKv0ig65avIoNmSKJltxOSlnvKZGbFLcPkh1itVEuIbT1jZmUJrl9e4HMDgvh/S/zQ8dmMWlvEcL9Vt7CLZAcMuy0Zdh+4+s7E0vJb7bPqmtnWDUMafBusl7ATxO5zBR8TIY2XjIGIozDVuhM4c3SF0nbHJMK4VfvCvI6k3ZvIJHcO8lk+JZPTKrhnb3NqPL/a42JNKXMi31IEdQ3lrOLtqRZsmJF/a3ZOBRhebdjB9jqliHNYLMFHxWjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1VJbNnnNAYVRN1sCYSkMwltVFzMza62UhuQSUH8goU=;
 b=3JgDaRsVPHhZ8SrRVLB0DLWkznfPedRQ5RgTiLdZyEAdlZAdD1ALrtO7vEtIABMdwwlssmvWa84YZ68Fw0J2sEbX6LNBMElmFkkyiWhCpg0va8ZhFSGGlaONIsCzmO/WkgSbw4s3F6Tj1s6PqoKmGlnKH0igDAUh+ZY690yfb6o=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4607.namprd12.prod.outlook.com (2603:10b6:208:a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 18 Aug
 2021 08:00:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 08:00:47 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Gal Pressman <galpress@amazon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210818074352.29950-1-galpress@amazon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3abaef49-2733-8b5e-3eaa-662a2a57b96e@amd.com>
Date: Wed, 18 Aug 2021 10:00:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210818074352.29950-1-galpress@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0073.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR10CA0073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 08:00:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1486a533-9738-48b7-4ef4-08d9621e49b1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4607:
X-Microsoft-Antispam-PRVS: <MN2PR12MB460711431545F71C974C4CF683FF9@MN2PR12MB4607.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QmidLFnxCP9X4zOcKKCFszCW0nxu9kRdvDBarXmWZNxlq6UCQYpBIUTD0jhVtVj4SbjcMQb7JdSxe3BiHmxUwqTTRg2rDUgGyJaa8rPy9XpfSXPjWKosWAQ16X9HctMUzI/LEqdHf45Pep0b5c7BPGlipl8d+3xpKNqdHnAwgzFTSBxcfTQyiQbjMWoNOh6alL38LkibYJyYqq4EsKQC+G4Rn6ZKHcbn/KuQCX2WiNr9Tn6+TKPRoA3mRYYpVCsuyc58vueJaeRbMjWke+dpoq4QXTSfyssKjoqViidiHD2NXAB5fLMZHeIK3OlLB1f4MfAeJ9NRGrA/X3SS+5Clv2GFQtvVydSmEbkyglj+EzRSItqCvqGg4emKzcRdKImDLdgpqRk5njI48ZelDYxl7i5hxRWUaDaau2TKusrdULD+HtrWRqM0rx9RSAHhpAdd4xCmRd2rlZ25vfthElClW6IeUXtNX2MqF4FNej2e+BN/7VeT2Xif9+Sv1OqRvNfN83F8qA289UX7qDq1oo0qvixOGmsFMOrykrYKXAQN5hV2n2zWkilNewyJvpE17SS4PQdkhWJKqQoIOrWDKyXMbN3VcpJQLjxosD3pGGSz/Rs1cLGPYs/I1RA748LXQUlgj7msI9nbDzw4VE+q4MjfB8LPFBcHj3TDSaQPnCSL9SmXiYMJZQYX0MBnm+b4muXgIkbUk1JalIY3w2uPprSffFEN42BzSQOnOAmp8+teBHKkrLWzFA2zhTgIow+N6gB3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(38100700002)(31696002)(31686004)(83380400001)(956004)(6666004)(86362001)(66556008)(4326008)(2906002)(186003)(7416002)(66476007)(5660300002)(66946007)(8936002)(478600001)(2616005)(8676002)(316002)(16576012)(6486002)(26005)(36756003)(110136005)(54906003)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0hrcForZkd0WEhobmtNbUM3OE1BVDJHOUlZc1VmVHMxL3MrblNxWXE3WkVv?=
 =?utf-8?B?WjREM2ZMODJMK0cxTVV3YXpocGY3ZEllbU92OTVMTGZOeFRTdEoxY3NOaFUy?=
 =?utf-8?B?Qlk1U1kwK1Vqek1PeWwwNEg4bWtUZzZlVXZuUG1DMUVYNmVLZG13UW1kOGc1?=
 =?utf-8?B?cnhBdG9zRklqc1RDRDJUeE02blp3Rk14ejBqbHRMU3dBanBSRGl2NTVNb0lJ?=
 =?utf-8?B?MWN6a1hlZUFZeWtoTHltMS9FZ3gyTlVIcnBaSFZ5c1FGM3ZKdVJQNENHNmZT?=
 =?utf-8?B?R3J1VVdDNlp1OFpnVFUxMjRwR21oWkNNai84N1dyd29XNjk3LzhuRnVESXFn?=
 =?utf-8?B?eEJSb2hXK3FBWnVQYWtsMFRoQWtXeURVSy9xUzRYR1E5Zmg0cFlKY1NtL2Vw?=
 =?utf-8?B?SmoreitnT1FhaTFia0d5QUcrYTcxaWJXSVExY2Nkb24xN0lsN0FWbjI0dXBr?=
 =?utf-8?B?Z1RJd3N6ZmU3T0E1T1RHcDBVNnRTazlEb0tKQUY3VjNoNFIxOVNTTzlDaGRX?=
 =?utf-8?B?akE4c1k1VHBrVWtqNkxBUXdPOGdFQTJncWtrempKK1JxVzYybUdxQkp6cVA0?=
 =?utf-8?B?TUpLWnVOK2FXM0FhdWZnYXlrVXN1MWRKbGNkMFdQRUFhKzJhSUpNODdJcFhw?=
 =?utf-8?B?RUhqSXdRS1hXVDc2K1NXZFFGYkYzY3ZralVkSElzdHdoNXJHL2hLaEc0UGpE?=
 =?utf-8?B?NXk5OFkxRlpWdTVyb1NXeFhnWXZkZW1DazJOUGRQWVhWSTVlV01uU2JVT1hU?=
 =?utf-8?B?cU5MMzgyN3NTSU5rYTY1Rno4TThPeVF4VzMveUltV2NTRDJtQ2VHQkxYOGJp?=
 =?utf-8?B?cUFFRjliR1p1Umh2M1BpeHhKaE1wcktVcXowMS9xTGEwUDIzdGZOZlVnV0VE?=
 =?utf-8?B?bVhWd2JIUEFwdG5sSXBEcVRsdHlOZXdseHBpbWs4bzNiT1JiSGlrV2FpUHV1?=
 =?utf-8?B?MHE5MGttZlRTYmdNQUF3S1JrY0tNdE8yQTJtc3JYWXV1YWtrN2prZU9hTU1v?=
 =?utf-8?B?MUYrZ1k0dEZucnhTallvRlAwaGN0U3gzNVZBeThNQk9IR0F6YWtyRmI3Qi9l?=
 =?utf-8?B?YUwrbjYvSllxckNIN0pQeWZtaXlrbEJMRUpQUEp1bjlFWk5JQkE4SDg0Uzk1?=
 =?utf-8?B?QTVNTmF5czJjblNCdnYvRngwaFRBVjZJWHN6cUFueXFmLytIK3B2aW5md2pv?=
 =?utf-8?B?cVhNVUZVWklhUmQya05wQ2tPTDVmQ2x6MHNJNHNtaTBjWDBCOUlTUVhreTV6?=
 =?utf-8?B?b2VjYytkbXBMdGZldXRoaDVrc09QTnh1NkI1Zm5rOHRtbTZvcUtkSE96WmdD?=
 =?utf-8?B?d05HZC9DbHZGcjg2NmMwRWxxaUxROXBValJXRFZuOWJ3c0tJZmFqQVdUOUJW?=
 =?utf-8?B?S1NjekJPOG5ScGt3aVVxdWptVFptOGpIOVpDSktsdWtJRWpsN3dwTmJhVGZz?=
 =?utf-8?B?Ym5UdGZnTzFxSDJPbTBVRlAzbzJlOVFFOGRzY3RrQWhsQ25QYWUrWUhrZ2Jv?=
 =?utf-8?B?YkNySDQ2VEZWZ3o3Ti9Fa3FBUHFyWlh4VWlsTnl5Lzhsa1MyK0FpOGJvZjBv?=
 =?utf-8?B?Y0xBQmN2KzFSMURvdzNVSE1xb2l0TEh0U3NrSERkQTVDQzBuWDNGZW5Fa2Ni?=
 =?utf-8?B?c3JBV3FiVkpxVDVGeDVwQ1d6VnNwY3lnR0F4L2l0UWgwVjREeHdhTEZZK1FB?=
 =?utf-8?B?SmpxbkpKNUtsSXhZQktEbXl0d3J0VVhCN3hTU1o4eVp5OUVEWTRmWGRSekx1?=
 =?utf-8?Q?3L8bBCL0+smhpSUXCIL7nshdgVkp8gyfXnAOUzj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1486a533-9738-48b7-4ef4-08d9621e49b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 08:00:47.6432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEW1rqPws5zSslIyKIWSc2W+GNUfyWL33XpaU4LR/xscRkaZSOylm+qjR4DGGg06
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4607
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

Am 18.08.21 um 09:43 schrieb Gal Pressman:
> Hey all,
>
> Currently, the RDMA subsystem can only work with dynamic dmabuf
> attachments, which requires the RDMA device to support on-demand-paging
> (ODP) which is not common on most devices (only supported by mlx5).
>
> While the dynamic requirement makes sense for certain GPUs, some devices
> (such as habanalabs) have device memory that is always "pinned" and do
> not need/use the move_notify operation.
>
> The motivation of this RFC is to use habanalabs as the dmabuf exporter,
> and EFA as the importer to allow for peer2peer access through libibverbs.
>
> This draft patch changes the dmabuf driver to differentiate between
> static/dynamic attachments by looking at the move_notify op instead of
> the importer_ops struct, and allowing the peer2peer flag to be enabled
> in case of a static exporter.

Well NAK to the general approach, this can be solved much easier.

If you can't support dynamic moves while using the buffer then just pin 
all buffers during import/export.

This avoids the move notification and the framework/exporter can still 
correctly account for pinned buffers.

But please note that at least amdgpu never uses P2P support for pinned 
buffers since we want to avoid that unmoveable buffers clutter video 
memory and create conflicts with V4L and scanout.

If you don't have such concerns in habanalabs then you can implement the 
pinning there while keeping P2P still enabled.

Regards,
Christian.

>
> Thanks
>
> Signed-off-by: Gal Pressman <galpress@amazon.com>
> ---
>   drivers/dma-buf/dma-buf.c             | 5 +++--
>   drivers/infiniband/core/umem_dmabuf.c | 2 +-
>   include/linux/dma-buf.h               | 2 +-
>   3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..e3faad8f492c 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -727,7 +727,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	if (WARN_ON(!dmabuf || !dev))
>   		return ERR_PTR(-EINVAL);
>   
> -	if (WARN_ON(importer_ops && !importer_ops->move_notify))
> +	if (WARN_ON(importer_ops && !importer_ops->move_notify &&
> +		    dma_buf_is_dynamic(attach->dmabuf)))
>   		return ERR_PTR(-EINVAL);
>   
>   	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
> @@ -1048,7 +1049,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
>   	dma_resv_assert_held(dmabuf->resv);
>   
>   	list_for_each_entry(attach, &dmabuf->attachments, node)
> -		if (attach->importer_ops)
> +		if (attach->importer_ops && attach->importer_ops->move_notify)
>   			attach->importer_ops->move_notify(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index c6e875619fac..c502ae828bd3 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -118,7 +118,7 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
>   	if (check_add_overflow(offset, (unsigned long)size, &end))
>   		return ret;
>   
> -	if (unlikely(!ops || !ops->move_notify))
> +	if (unlikely(!ops))
>   		return ret;
>   
>   	dmabuf = dma_buf_get(fd);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..4b2e99012cb1 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -473,7 +473,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>   static inline bool
>   dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>   {
> -	return !!attach->importer_ops;
> +	return !!attach->importer_ops->move_notify;
>   }
>   
>   struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,

