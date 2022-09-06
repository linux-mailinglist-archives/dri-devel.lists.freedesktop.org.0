Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24595AE57E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 12:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299410E604;
	Tue,  6 Sep 2022 10:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB20310E604
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 10:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jow1jx5C9LbpG1atzs1A6EZgHfC2h/nlNpf6ej4YS7VA7cq4VLxagY/46D76HPFt86G8J+CuRI5sOmf1vYNFAkAWBn+t0Sp+5rhxtL2t/U0YIt+owdZy2HkXRVqilWNcWdj7qDbqnw7yFpNHQdvzivtx4ZQ8Of3h/y8XBgbFVeXWbImKY5oFUT5eNKh1GapOIMnFZRiMgP1Z3o7GhltMnHLxu2VExHzmRagD8Bjt1i1Poxh19FBQLKGby5OG5l5G+0L/XfTCy1c+O9LkVZQUwk2ZvcubI081MfBBRgWJ4Qm2BWgnT8R3V0TzwC1eVq1nYztC/+bnSdEqFlPYrg3aiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr4EDWpLnsYuILnRSxc1CuC25/AiG4RHheyQ1toR+lc=;
 b=V3k7aaHWmYTzIsQybmfy6BUgxt+kqacIvi3ToDejmFUC6I/J6TFu8QM8LEFeCk9LswFOdeGpggCHOoQaY+0KNZbsBT/QZh6tNhftm+Sua5koed4xtFsUnRrGkWgnw5XnIYWF8cM2CpbWeIV5ETSdK54s6wXJwAoJKujOtFzOYSA3S+frsRgYtjtKrmfq4YeRRMW9lTaRRLJ+kT4ha9kS3RsVwf25oHr1isFlsyUo3v89tNT2ekwOwOmEoWSFPoc3b+EVBeJaN17OhVU9DuPwuj3flngQadwzUozWN2Z17xhDpJyRGFB9ycWikgPU8duzfnbrnbwIK71U3vPaL0C7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr4EDWpLnsYuILnRSxc1CuC25/AiG4RHheyQ1toR+lc=;
 b=WEJ1GquLyepXqC2/kIfAB8hqqyku/ojZTwgXihp4s+3LxAPT+175TMcsMRWbfDZCtniGYNK/LrTNY6W4Hnro+KUGfDHD6vnHuntSscjQlYABqDUNjC+jQYsHNIXjP8WG+bwPfMJjwu4GXW2JgVwiWow3x/+fO517mcKNEZ33LrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 10:38:52 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 10:38:52 +0000
Message-ID: <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
Date: Tue, 6 Sep 2022 12:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YxcYGzPv022G2vLm@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:206:14::30) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c429373-5e6a-446a-6cfd-08da8ff3fdab
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NccnDpnHpEKCmuF6gxlC1cKltXTl2A9lBSS0H9LFyywP8Wd7lA253t+PuU8svTOEsdtxpLs8bttGdxRVgjVz7raoPJxVAPD3RmiUncM1n/UeGnvNZcpS02fNcZvuGfeDG73gQgOGbhByS+UmgyL2kdPX9Xq1Anes7AqDMIKhyTFspMWV5P5TOCns/JfqCrE8rJXTEulJRWUu478H84ShuSjs6/GXUI77XWFDRLbrNI97Kt//5Qya4jbO+GUL7H19wPRzR5IXGoxouJdS6id8W5SHqpahTHQSaDB/8gqhJYQdSHN9uF7IbjMV+8tL6zkWmjnnyl49JM0COLHENxBhTulN1q2Cwjv4Ni/eS6bwT/8C1Tim+VTpZp5uafgfcGGe7ryn4oRI4nrOZJ/NtejFxA6nEZEK8Uu7zREm3PpONapUdtpeG8M/Imb1azJ4w4bMK9N+dgWweLuqVO3ASUyNk+HYxpWiOqJ9wy5O7aqECXDDn49WBFbgzmvbNVDv00PTmBPTQhnvb80AmZbCMUSIfNOxHg/4PW23LkCMJCtFbeKABqoLwVlD5pCNBwf0BbQnlViQs2meAR2OIw0/vD0klgpF5yXpSSYvIf1ap6qmCO3d/cTdjO52sFrn4fu/FDc2qlM1CJTrismjY7ehCwiYDwJRIaNC+qDLXnQNGWkAXBxoBqnvQdNogl/bM1YKpX/iQiBO5amvbMrC/VB/LDP8GA7xdxlFTLQivhqc48FU45wMeCNByOvNC74s++R1NgKO+tA8nTW5PMPJXlcij2/C5Nr4Xptx6HeT7USyBaYNqqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(31686004)(186003)(54906003)(110136005)(83380400001)(316002)(2616005)(2906002)(6486002)(5660300002)(36756003)(6512007)(41300700001)(8936002)(8676002)(4326008)(31696002)(6506007)(38100700002)(66946007)(478600001)(66556008)(86362001)(6666004)(7416002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0crNUtydXNTbzA0Qm1ZcFJaYWtBQk8xMXhQcHFIN2JEdjJuWXQxeU1EUXBR?=
 =?utf-8?B?QVVFQVZtRWVhVWR1WFIveGltbkFBTjN5M04vNnBjZmhvTSt1b05pTkZNSWk5?=
 =?utf-8?B?SFdlT29udnkzVWZMNHBvM0NNNEdtYVVNVDhBTHRCd2hGeWs4bDRicXNFcHFQ?=
 =?utf-8?B?ZElLU2lxZkE1MXVDR3lBdUR3YmVRaXZjYzdqeGx5RUpqdlhmOFlWOGFFeFJX?=
 =?utf-8?B?WlJhbzg4ck1wNmVkSTRMSnZzcXhJWVk1czZMU3FaRnd2bytTd0RZZThXUzRK?=
 =?utf-8?B?aktSOXpOdkg2V242VE5ERVN2TXlGRkt3TGNlTHFOWkhZZ3c2NlE0M3NGM3U3?=
 =?utf-8?B?dzFkSDBCdHN2YXVxMEtZTjdncW9nTnVES2RGZTlSbWlDUWpzbnlLUDNqVnkw?=
 =?utf-8?B?UGtpZkIxVEJqZlcrVWViSEtndEtRNHl0NUQ1b0EzaVdBWXJYY2pOODU1bTlG?=
 =?utf-8?B?MUl0MDNUYTlTWDVmVHNsb0MzdzZrZE85OXM5aVZyMkIwU3c3UExuVk1xNFhy?=
 =?utf-8?B?QUVoeVJLMDJyTUlqanpSREQ4L2JPdEVwUVNaTDRFM0k4c0pKcTRTem9aZUY2?=
 =?utf-8?B?MytYa3E0eFl6RmxLdnVONHlZT2FrR2hCNzhnSHhWTHV6VWY5Vy8zVFJwZHZl?=
 =?utf-8?B?bWUvV0k5NzViS0kwWE1hYXZzSzQ1dG1POEJVTy83V0ZNR0w1WWJ2aHFvSU9B?=
 =?utf-8?B?K2x4UEZQMzlFRjZobUJ1MWRNT0E3b0VNVVVaeEFKR1ZSVk9OOHQyN05SUmdX?=
 =?utf-8?B?b25KSDRodURLWFU4WUtLb2ZVdkR6amNjT0prNEwzb2FBVGlEaXN3cGtsaVVn?=
 =?utf-8?B?RnRSbDNEbDJ5L2FVbUN5MlFDck5OOFprSXkvaWh1TWxSYmkxTHBaYjRPYjRq?=
 =?utf-8?B?MXp2aDB1NndoamliOFJIRjBPc0FHKzVVMElMUDl5cjkvZjQ4ME00eE1XSXdo?=
 =?utf-8?B?SitrbGlLMkVFSFBCRkRCbVhSeW40QTQyY2FKU2hTQ2tNanNyL0p1OSsyK0Rn?=
 =?utf-8?B?T3dRQW15dGZQeC9ZZUJ2TThaN1dheTBwWUhOdU9mUGVvRG9PajlRWDNkVHBs?=
 =?utf-8?B?QkFCMXR2QUtFV2hCbU5ES2pxTVZpcGhtN2FralUvRTZNWUMvbzVMUlpCeTFG?=
 =?utf-8?B?eHRGRk91Y25zVzdMdWo4SGRaTFYwSXpTMlkvM2FlTTZWSUxkQWN1N3dzOFpU?=
 =?utf-8?B?Qk1UUU9LWVcvdG9LVkRHYnYvKzRiWjJ1VVR2RC95NnFTbG82bHBrSkZQTDho?=
 =?utf-8?B?aFJEWGhmb2VYU2tibENvN1VSbVNkNFpKQUFUaldRMmZLT2x6M2ZVMlpqMjlB?=
 =?utf-8?B?bDBXbVZtbGtNaE1CekR2L2xnMTVucnp5VjE3eGxxL2JwRlpWVWxHOXE4UmdM?=
 =?utf-8?B?V2RBT0ZBVzhXUVc2c1FJTmVITkFybDNMVmlMVGw3UUVJK2ljYzNTelM5Mmdm?=
 =?utf-8?B?VnJ4dlNVRFlicWFOZm14L2JmMVkyZGNLb0E2Zmk2VzN1NUpyYjcrNE9oYXE0?=
 =?utf-8?B?RWYzVURtd3Bib2w1blFubEc3RTdKZ2ZzL1pjVnhzMGI4R2dRR0UvS0UzWGdE?=
 =?utf-8?B?SWZOSnRhOTRRbXNvL1NjRFM3Vk1HR3VWSUhENktaSlhYd0NTOXVmZ2hCTElq?=
 =?utf-8?B?aDFCYTExcW9ka1o5R1o5d0syTXl2VXVoTWQrYXk5SVhmd0dmU054c2Vva0hj?=
 =?utf-8?B?ZlE1QUVaSkhIQlVaaTUrSHVTWU9hRWpCSW9FYTh5UzJYTW95dXprU0E0NytP?=
 =?utf-8?B?bGlYcUtpRlFpRmY4TGxjYTlJa09FSnlUT0NlYklacEsxM2xPQnJhWmptSzc3?=
 =?utf-8?B?M29OdVJSUWNOWlNGNGZSSDZzMHdEbFBQN0pwcm1kckY1b0xDTzJ2WktnMzRH?=
 =?utf-8?B?RUplVnpRUldMZ2x1VHRFYUlVRERLUndtUkJ5dEZWMlByVXJhYi9tcENqRGhJ?=
 =?utf-8?B?WVpUS3BHalg5bUpRM05NSC9lS3o0eHdhVk1HT1hVb0lUZVpjQjlOd0R3QkpL?=
 =?utf-8?B?dmdzSTZyVktLYnA1aEVEbUVhSlhOT3ZJQkVPN25nRk02UEFDTWM3bG0zVjRO?=
 =?utf-8?B?cFNvc2QxWS9ucWh5dkhDOUppMzg2MHE5bWl3L3BSdTJibEpBbmc2STRLbTQ5?=
 =?utf-8?B?TUo5RGNuN3ViTUs4UHRtSHdPOEIwa2JRSmdHRmF3Wm4yVlRjUk5xWnhUaFps?=
 =?utf-8?Q?RbvqgE+nadsbxpBUmHbWtMexlR77ZbzmQAp7nQpYUGXP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c429373-5e6a-446a-6cfd-08da8ff3fdab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:38:52.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ceOS8WXNT5rvp/uADK6huKnbfe79yet61rZ/G0Xl6W2yFpopWHqNIJHb2QzOBY5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.09.22 um 11:51 schrieb Christoph Hellwig:
>> +{
>> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
>> +	int rc;
>> +
>> +	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
>> +				      true);
> This should just use pci_p2pdma_distance.
>
>> +	/*
>> +	 * Since the memory being mapped is a device memory it could never be in
>> +	 * CPU caches.
>> +	 */
> DMA_ATTR_SKIP_CPU_SYNC doesn't even apply to dma_map_resource, not sure
> where this wisdom comes from.
>
>> +	dma_addr = dma_map_resource(
>> +		attachment->dev,
>> +		pci_resource_start(priv->vdev->pdev, priv->index) +
>> +			priv->offset,
>> +		priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> This is not how P2P addresses are mapped.  You need to use
> dma_map_sgtable and have the proper pgmap for it.

The problem is once more that this is MMIO space, in other words 
register BARs which needs to be exported/imported.

Adding struct pages for it generally sounds like the wrong approach 
here. You can't even access this with the CPU or would trigger 
potentially unwanted hardware actions.

Would you mind if I start to tackle this problem?

Regards,
Christian.

>
> The above is just a badly implemented version of the dma-direct
> PCI_P2PDMA_MAP_BUS_ADDR case, ignoring mappings through the host
> bridge or dma-map-ops interactions.

