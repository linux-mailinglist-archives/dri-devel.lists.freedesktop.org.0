Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCF5981ED
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 13:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68D110EAE3;
	Thu, 18 Aug 2022 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECE412A532
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 11:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyPn7w+muA8xnfl73Gsep5MJudZ74qIJ0QYNBNVcDfHCpVGctMGGjKbnjKga8Tuqx7vmrrdtNm98pqWQwbi8OxQzMrnKAmDwmtj42nbRzQzXrxdfq4isN7o4oHXFWT67kmKYDxjemhQBF5qD4xTB29estE+974UrHGEG4JMWX1p90hqOZESuRvM9/l9NNmpfN0zJQP6VVIyKfBdYsqCZJ54ZisFAmOwZVXMmxlctU7mYn4nTWwqqRqkCSmpS15Ngl6L80sldM/Vu5PZJClJ5/1Kx+m8+Q2QfzCmQvq3OSGKsqXqXKKPS2pC8y8bO78A62q9urBWRo3QXTLQOZ5KOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us6TlYHLMxPdE4hYt7W9gTHkpE1RbdXfDEq8ZfiRJQM=;
 b=VTW5Qim020aGWqgFA4uSe0HYgHFNHMBckmnX9uoA3rJ0B9Dh+SZghnPwNcftYWJvF/8Intcwt1+xi5B5i+6nFG7RsOO2oCZ8X5EhxZ3P8FsfkK1zjEu2iENDY+zUjHtxymJGBnhUa67HKfib/d34ylEHQKmEwju2uj5dJVSDxiSzXGA5E1AiHhQzldEJeZ6hXVsOSQGmWivXpa2IaMejvMSt0eETdCgIIhhK6gG9D4JstG4oK7uJdef37ZtK7O4nwKSwkUwv6EDT5f0MfRao41LGj2AfgVYXryJ9FsebX9MG219ximHt02Dm+2nqgnUaS7RUF+9ddkmMbWxqAZHQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us6TlYHLMxPdE4hYt7W9gTHkpE1RbdXfDEq8ZfiRJQM=;
 b=vR1b4yNjpQ7WOoSsV+YPbsRhTK8wer719SV45C1lz/OolKS+ZXFWkeNAP9MJ+I/DhEEW+ER6QYhHUwY94QRdMliMyGwp0PA/LUkHinDGVe3BwWn68XlJ0wQefEnuLhL8QrBIaCW0GNi05rq/o1GtQ8IWvfKtmG6S7nMr1mhjsTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 11:07:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 11:07:23 +0000
Message-ID: <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com>
Date: Thu, 18 Aug 2022 13:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8de71c2-81f2-4a5a-0758-08da8109d3cf
X-MS-TrafficTypeDiagnostic: DM4PR12MB6277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OafRzBMxtX1br2KNDTkiafwrT5RFEvqSqxyp7OLDrnV3bSsK154GNvuvcbpYGQl2rjikYMRHppRs5PGSYuh41lpsiK2iFOe+CIby4Q4QRQlfukEiQOp6YDbf+BMBVrIRxRQU+4OSSoiXURD2FBl5S9elA5KS4S+8FcHHZf6n7YzYDuNhBxpFhRL00Kinaz9xv5/Dn1WFjzDCAbFBYGO27Z0jUWBKK6sVglwwO5RcpanCkh16GtbjuShKByQnEuWy+XZEKMhwNWjCBRGpMPcX4TPRiiEdgJ/AoA3JW+KpBl4nr0ji48tFBlqkEz/Mr9OO6qTWhVncBSRRLWT4OH8aLhND1yyz3LZT5pvzQ4xTWVfOh9G3YwTyAy7JxLA5i6aIJsCxUmrkNmlnuIzXWUFonn4CJKosCflb1DhV6tTRUwHPilpCL72jdVspP7u3dVJvRPMv4+95hP6CoOH3rt4+j+be5Ra/IEh53Xpct4YcohSkFGrDZfouuxT7xeNNveZkWnIusKLhV+iZh/ZuTgp2b9K5ek+SqFjM7MS9kmUIOQM68Zz4Kv4l96Go7og9Oe7dL6724yUpcDSM3vNDC8IDwv6HmnHA6hYsepaaexOg0i/eNvMDISX0h4pj9En8aCm6UYvepHBXfJ66eD0q4Sc1l5E5p+qwQ3P6QJYBmK1T5T+meDmvW48X8hI+1BSoWqc+HGIFPUJTJfGfcdTz1LecOzBfxEz6wTLZ5YSQy7BNbMSOY0cGOlVjs/ucBdmPXmkCkEORXTL2RjzKD4tFXEUf2NBzS7OdEV7mxPH+u2/SpL5r+DIlUjBzXoWSge6NfgWGThc4tOAbplJsxiaMIZI/KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(966005)(41300700001)(54906003)(316002)(478600001)(38100700002)(6486002)(5660300002)(8676002)(66946007)(7416002)(110136005)(66556008)(66476007)(8936002)(2906002)(4326008)(31696002)(36756003)(31686004)(26005)(6506007)(186003)(86362001)(6666004)(2616005)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1E5L1dPMEtRd1NlbWpTSGRjNmhVaHBUYjltcFZIdEdnb2xjMXBXUm5uNlZO?=
 =?utf-8?B?VFZodHM4V0xtY2Jad1BuMlNPRVQyZGxzZkVjYmRjRU1yY1ZxemI5KzdteWdS?=
 =?utf-8?B?Ri92L0VKVjlKcVlpNWppSVpCbk8wMVRXUGdYNSswdW5WWTlSTGRBQWkwWURZ?=
 =?utf-8?B?QkR1b0NGalErSTJ1aWh4ckN0RHpVSEFvcHVPVW1ZTXlzclI5VVpENFZPNnF2?=
 =?utf-8?B?K1RkREtjRUxlb2t0YTZVUHF1SGpOS0M1S0htd2htaEZ3S3B4TVZrQ2pXU2xu?=
 =?utf-8?B?ZWNHdExKbWpKOFZzeTkvdVpjNWdFOHBGeXg5aTYvalMrQXB0T1o4VzEwUVZ5?=
 =?utf-8?B?dUhlNHQ1aGRxaHkxUlhoL0QwR3dpU2doTyt0QnkzSkZoSVZxVUp1VjVVTUlw?=
 =?utf-8?B?SFc0YjRTTkN0SndMSUFwdktnOHBaRVhMSUtwWmo5MjFzY3VBdE9sZWZMTWRL?=
 =?utf-8?B?L2hUWE5pUXRub1c5cERMcmUya3dxaS9HSHcvSzNmYURUKzczVFluY1ZTSlhE?=
 =?utf-8?B?Wkg2bzByUkxyWVA1c3hLSVBjMXRDSW4xYUxBS0ladXlvaGoxY3RKU3dvQkRO?=
 =?utf-8?B?cE9sdlhVUVpzVTZySlZsYm5jT3EzZy9MRDZQU1dMSDBXUkZQV1lXNkN1dEll?=
 =?utf-8?B?bE1EcjZOSUZ6REo2WW1BT2RVaStXUi9lb1pDdTcyT2dIOHZWKzNKclZYMjBD?=
 =?utf-8?B?SGFZc3RyYjdWUkZZaHJhVEcwbGoxOVhTTS84Q1lVbnBnbFNxQkUxaHdIK3N0?=
 =?utf-8?B?Y3pOZ3l6aE45SDlRQWF6NkRyUkhKM1orS2tsajVNL0UvSUZLNWV1YkNLcWN2?=
 =?utf-8?B?N0VVSkM1dE1Ha2NjT1RXOWwwbzVlUnh4V1FkOGgxb2RRRFgvQ2wrZUl1RGox?=
 =?utf-8?B?bC9McERkc2FDQzJrZi9JVUJ6bzFvUnI2WGVRcGQxNGRQaTlhTGdHeEtKN0kr?=
 =?utf-8?B?d1AyVGhWZHhIazJVZ1VYaGxWTncxUFdLZUlkWFl5MDFtcVplOTZrcHczRm50?=
 =?utf-8?B?aW9JNEVBdnZmSndNZHpBQU85cWhDRHR5cUxhRXJtZ2FjYlp4UEpydTA1V1pt?=
 =?utf-8?B?eDBJZ2RueFhDRmQ3UG9uRGtxMEZycE44UG1NcFNad2p1dXZUN1NRRGtaOUNj?=
 =?utf-8?B?QXZ5ODZqOVhvQ2wwRDRvKytUSlhNbjBLMzd2RTlRRXlZMjU1ZGVqYXM5RnFv?=
 =?utf-8?B?dTUzeDFyU1lKbXNFUFZsb1NFQmU3NXVZeVIzZk1ncVdvYXFHWkNtUk9MQ1lL?=
 =?utf-8?B?bTd2ZDhxWDBZZlRkQW10MzhZcEZ0cC9TZnd4Z1pNcTd5MDZEckh5aXJGZHJl?=
 =?utf-8?B?WkFYb3FSMnBGYlN2UE4xbktiWVFielVkV2lhOFdWM212N21QMFcrbEhKeSts?=
 =?utf-8?B?NkJiQ0tGQ0dYUGJieU9LeU9rTTJRM0FXL2lwYW41dzMwU3c1UTJMTW5IQnFi?=
 =?utf-8?B?MXVrUWppWmR2WlllRjhZckU2dEpZUTExNW5aZjFna280M1A5VGVrTFZwRk1R?=
 =?utf-8?B?dkFtRk14MGRhaHYvNkNOVGw0TlR6U2V0YUs4N0t2MHNIQnlHUlFwUTl3MmdE?=
 =?utf-8?B?WXNvZDh0ak1rL0VBbUxiNkdoclRJVjZtaVVVTnBySWFFOGVQcXhRMnVmQ0lJ?=
 =?utf-8?B?Q2FiRVVsUmptbGZqOFVYMWl5TENwdkJxcytvbkNvR2d6QXN1Z3IzRTg4ZHYz?=
 =?utf-8?B?eGx3TzltR1c5Y1V4bFJWdXNWVkVleThZRFg4dlNLVGQxY3ViWXM2OGZ6R3oz?=
 =?utf-8?B?R2FWTFp1N1BGUFB5RUFESGlLc2h4aVhQSDNQZ1R1aXdndmpoOTFXdk5yaDI5?=
 =?utf-8?B?MXdFc2xJb0orWldTczlCdXJNWnZyWmo3R3F6WFRHZUdOa3VLNXRrOGxxR0ov?=
 =?utf-8?B?eWR5M2dTSzlNa2VRc1U4MStwVHFzdDJCNFp1M0NzSmJJOE9XdkpYTGZ1TzVi?=
 =?utf-8?B?QmJ3SUZ4dFdTcTFPa1BqRjhwQ1I4RFF2MWVCNnpPNVo5ZWtsR245SkxRYUdl?=
 =?utf-8?B?Tithd2dtTURkRFpCb2dnbVJmR1l0S0ZCak01WGF0aVNlQjRYcWp0UEdBNWwx?=
 =?utf-8?B?V1JEd2xYRnpjWTM4dyswT2VTNmlGbURyRVZZZ1VHM2doZHNySWJyU0xhd3Jr?=
 =?utf-8?Q?PXLzKBr3/xa2VgsBTxOH17IoV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8de71c2-81f2-4a5a-0758-08da8109d3cf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 11:07:23.6470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuMu0+Njn/1/XlMOZQtongsO2UwgXtWWjqq+oz2u1blxKXH/QkJBmcrLfvWrUqC7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.08.22 um 18:11 schrieb Jason Gunthorpe:
> dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
>
> This series supports a use case for SPDK where a NVMe device will be owned
> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> may directly access the NVMe CMB or directly manipulate the NVMe device's
> doorbell using PCI P2P.
>
> However, as a general mechanism, it can support many other scenarios with
> VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> generic and safe P2P mappings.

In general looks good to me, but we really need to get away from using 
sg_tables for this here.

The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen 
this incorrectly used so many times that I can't count them any more.

Would that be somehow avoidable? Or could you at least explain the use 
case a bit better.

Thanks,
Christian.

>
> This series goes after the "Break up ioctl dispatch functions to one
> function per ioctl" series.
>
> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_dma_buf
>
> Jason Gunthorpe (4):
>    dma-buf: Add dma_buf_try_get()
>    vfio: Add vfio_device_get()
>    vfio_pci: Do not open code pci_try_reset_function()
>    vfio/pci: Allow MMIO regions to be exported through dma-buf
>
>   drivers/vfio/pci/Makefile           |   1 +
>   drivers/vfio/pci/vfio_pci_config.c  |  22 ++-
>   drivers/vfio/pci/vfio_pci_core.c    |  33 +++-
>   drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++
>   drivers/vfio/pci/vfio_pci_priv.h    |  24 +++
>   drivers/vfio/vfio_main.c            |   3 +-
>   include/linux/dma-buf.h             |  13 ++
>   include/linux/vfio.h                |   6 +
>   include/linux/vfio_pci_core.h       |   1 +
>   include/uapi/linux/vfio.h           |  18 ++
>   10 files changed, 364 insertions(+), 22 deletions(-)
>   create mode 100644 drivers/vfio/pci/vfio_pci_dma_buf.c
>
>
> base-commit: 385f0411fcd2780b5273992832cdc8edcd5b8ea9

