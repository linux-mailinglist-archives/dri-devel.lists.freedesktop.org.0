Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A9598391
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 14:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F31418B28C;
	Thu, 18 Aug 2022 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A4D4FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMCaiu/Q7ATXdrhBIql9hU8ud0zTvfiHRq+IWosAo3atUpYDsITXIOCLBQ4ixGGevVhLDr2UwNEBYvwXwcxkp6d2bhneLFI+JAizgLxpPPcnKaD9jEKT7RF29dHr2wXNLBT40aJx2uOF3dkdcBn8OfxTfxtgdoG8MQLxZbyh9QOnfOlN5FiA5ellrefooe2EDPL9xAALXNItWI0W/9AXc1aO9mWiApov+zYqB/3U+DS+IE4BS7I6YpS7cfkgJ/s/l4J6EqzZc4ScqOqcTnuHR01Hqgv5iymXgx866mWJqTFYNQ8t2MAN+iR6zrrQGENH7fxNh+feUWuN4fpzMDzVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIPs/IsdXnNc9z50f5GGLkCzHreGuc7Pb+vyFs1Y7yQ=;
 b=Nq+eaRldviwW1fKDe3s+rDn1kGrgXfKBZyuYHsuJ9snH+NKmaGtQSeZ2F/ZLfm0QT28/rKhqzonz84vjDUuWIU73aApDOe8vV6+ZX9jO1sb0HQzqXKUdosT2eRNJSrY6gzQ5YEX+5Y6gNQWGRirW2BPrjMClBojKWTlP0RuoYfVvfy7BdVc6L8kM1i0w3Qkz8EpyBQL7qkSXdWE5ODJI9AvbmwC+/GkbIbWhZPpVEamQhptU2KChbNLyQZ3eJ/QIQxXDix4KnhW/RBlfbZePCJ6vspjule4/okdzEsNm/1mJo9cYiYd2q6f/6Iq2gW6RCQz/ayfwXZRbArjhnyf5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIPs/IsdXnNc9z50f5GGLkCzHreGuc7Pb+vyFs1Y7yQ=;
 b=kg4i994i5P2iKEH/WGURNIEp8JPGYqYAF+UCgUe3YExPV1JKm3GhFRxqe2H1qZ3IjcUJWgt9+lb+gqY/dnH9oLpiOY5qJKAs3mJln7ovhxvBT/OOGGqdrt/M06CZLVZrp5Gsas2gSFoijCmWjp+ltTAHDB3AhNMPNU21b90sORY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1619.namprd12.prod.outlook.com (2603:10b6:405:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 12:58:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 12:58:18 +0000
Message-ID: <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com>
Date: Thu, 18 Aug 2022 14:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com> <Yv4qlOp9n78B8TFb@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yv4qlOp9n78B8TFb@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56987e2d-df19-4da1-c001-08da8119525f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1XOE8iLaRqjf0erimBlctNdZj8NPO2GjDdmAwNaYoFubl8TnlslwhilhwFxNH08jt1fUvVEwxBRPF0JnE4hbIFjrGlTvQqI716TMAnh3YBvOzRKLTzaNHZOtfRiK69+jMWx6s9iE5lXaozkpWCg5i4cSyXlKR9d09NWs3kRrRnSsbpcSpC3yCi64fYwGdZDNy+KlUrYgAKp7jKLrGrp4wlVQ1T0HcektUQLOwGbVXwV/RF6WLAY+yuA76UcQjT+zaBWH158pTTGhcmH5vosuLbuEOMfdwbShWAQOcWEF+Uo72Cvhq1IaGXwKBKRZ89ZcMFiatuC06UMlbktK00hlO308ZBnvhtCVrxhi3uXf7OpvfkvI+Su8gs8o/FxI9Xx0Pme+fPNW+hIQgg92SuFI39RmgdrMN0+iSjxC7XfMA4KvKx4L5nA/q8PT3VoR2jz35gXjez2Yb+4xDAYWn1LMhNcqGfIbiMAz9e2lhJ9+tgh60lU9MSCnO5FkiRUerUlELpb3+ma1Wpu10v0eolCuuWaqlcUnRx75tGTBSk8IezsU0eZlxmZmzF21hney79JkctAsHjuA1v3YvMeDliO2r7ZWgMNNRJ7oyGdNvwMLm2338tZrAznzfvY9umgO3Co5WTE/0VNel/UZO/KzfWYN80B9Px1g4c15N+H2tE2ilJO05oGH2Rbcg4BiQu1wtoqWcqTuU8XxBadwuzi4O2ZHlb+UmvvV/KgoKhIrznFVaVTllB9zgr4rZifshlit7jBK4GLBu2+BiNPXI9UOhCCwHdDkYkEvk+5uD3LCuKCarw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(6506007)(54906003)(5660300002)(41300700001)(6916009)(6666004)(316002)(66556008)(31696002)(31686004)(66476007)(7416002)(86362001)(4326008)(8676002)(6512007)(36756003)(66946007)(2906002)(26005)(8936002)(66574015)(2616005)(186003)(83380400001)(38100700002)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjBGR3NQcDJkQW9ucTJTRFl5K1hvaS9UWGlBekdFMXF1TzRlSHlWQnFQZlZ5?=
 =?utf-8?B?MTQ0YmlERlp2L0pGRHd3UGtJWmorL2hId2diY3VrNHVQdVc1amIvd0k5NnBW?=
 =?utf-8?B?ZEQra1M4NURvSkZwWmQ2bEhFSTFlODlKWGR4blp4VEx0ZWlrVFZNem9LZmJi?=
 =?utf-8?B?Z1hwU2FGU2hzWFE3cWg3V3VSeGZaMFZPcGVET1UxYVZOWVZoY29PRkVGb0pD?=
 =?utf-8?B?MmFQWFgzVmczTW1nL0dBWWdPcTdpSXIwS1dRVnYweG83TjVVeFdPTThJYnFq?=
 =?utf-8?B?UGFqOHk1V05Kc0J4ak1FczFuNDk2ajdYVEt2ZkZSWWQ1djRqSDE1ZFBBcmxF?=
 =?utf-8?B?T0RSRTZpSEVTcTBXTmdmV1RWcFRzc05vYWpZYVpFbVVFY3VPc0xQN0pyZ3hL?=
 =?utf-8?B?S2cza0cwMjlTUmw5MlEvVkhFQmxDMWZkeEVSaHNRS1Q4TEQyeXZnMXVjV1NL?=
 =?utf-8?B?SW5XV2lnWllKdlppV0dUclkzREdiN1ZSUlg5NzRVaW1NWlRxQUtPT3BySlFR?=
 =?utf-8?B?Z1UxTWl5NXR3KzBkbjA2REtJM3VnN3BPS3pSM1FCRGxNNVRhOXdqU21MM2hZ?=
 =?utf-8?B?SmlJVGU5dmUvRVVURVBpeUFtdFkrQ3ZKajUwdzNLY2RPWnRRbjVJMmdFUXM5?=
 =?utf-8?B?MnpsVnQveEEyY3VOZ1RFdGErSjdrZVRxeHZnVGpISHYxcThPeG1PckpJZy94?=
 =?utf-8?B?STdsN1A2NmZHQWlhSmpRYlplcEtLMDd1dmd1WjVFL1V5REloYWVrazU4cFFv?=
 =?utf-8?B?dmhKOGJkSVFuVlcyVGxrZlBrYU8wVHBWRkFtRTE3MmNIVlliOTFJQlVFa0pS?=
 =?utf-8?B?V1MwbkVVNDBnY0k1UEFkbE1WV0MxNG9QU3ByOThsSDVENHRxWW44Q1RYRVFs?=
 =?utf-8?B?SW82YWZmSXBsR1krMzFsRUdBRDRmRldQVnRKYTZ3MnFxZlJqMWdGVFpLa1lR?=
 =?utf-8?B?NEszNG1JTzF5MmgyQTVDUGM4Mi9aUDFzRUdEWVBySWNOa0JqTHJ4WXJqTm4w?=
 =?utf-8?B?L3NDSC9DQlgwT0xmMnBOL1B2NGdSbDhYcHkyZHY3WUd2WWFkTS90ZjZhblFB?=
 =?utf-8?B?VzRERHhJelVhZ1R1R1BFZW53WWV0ZXJDN1V6R0ZqZGJvdzhzNXkySktvSkZ2?=
 =?utf-8?B?TlIzMmd1amdpMDlGUFMxL2lLVExQRzRWVk1TR3FOamttUU5SeE8zMDZ2QU5E?=
 =?utf-8?B?ak1jRU1LazlxYVFmZlJHZy83Y1hEYVVoN2Qzd3luNkFRUy9tZkRGcXUxWWRF?=
 =?utf-8?B?Zk9NZnJGWlVxS2pkMG1GdjFzWUpQOUIrTTd6WmFEZUFsMjJURzRNRVFWUGt0?=
 =?utf-8?B?c1JRSmtrNlVkOERybWhzUGduR1ZrdWVWN2JnQVhUdXczc0hqOXAvdU1nNTVZ?=
 =?utf-8?B?N3dxZTlzNkdkRTF2VDZJdzE2QjBRclkwNkYrcjYxb1lwdEh0Rjc0cEhGb1ZJ?=
 =?utf-8?B?eU5XaEZhbXdCMUp0OHNUMHFDM0R2bjA1eHpFU1NySkM1MXJoamhXRCtEd0JO?=
 =?utf-8?B?R0hPTnJHZXNuclZmanpKL3pJWVliK3J5N094RmlLdFc2YTdZTGM3VXBMQjFD?=
 =?utf-8?B?QmkxRys5ODVaTmpmR091SXpiZ0xRUVlydmhQSlliQ3NqQys0UEVsRGI2OTln?=
 =?utf-8?B?UzI1Ym1xeDk4bDgzY293aTg2dDUwUVhIWjBCQjhadEhrYS9pWXFiV2NGSlB5?=
 =?utf-8?B?bFJGQ09TaVZEeE1lUlBHa0VJalhUazZEL3U1bk5oOHY2dkNyeEhWV2hMcGp3?=
 =?utf-8?B?eUk0VjEyK2xtYXpoN2MwREdOSHBMM2EzNm1LT2RObXROdjhOS0puM0RCOWNz?=
 =?utf-8?B?RFVpQVVBZnlyRlVkTnJoUjcxY1h4NzlwSTdyS1h6TmM2OUdxbWRySzRrWCtr?=
 =?utf-8?B?WG9LR1dDQ2c1QTF5QTZTNnlGWlVoNE16b3h1d2E3K3N0L25NRHdRWEtYK25v?=
 =?utf-8?B?eVNuWjRQOFFNV0s4T2FibzlMTlRLaUs4a0RWb1ZzcXJwUEZzZ2VSUklpNGsx?=
 =?utf-8?B?K1VtZnZERHIvQ2J1VWNzU3hlSXNsZi9HeDg5WXZYYy9zOW9JeU1yYlE1MTM3?=
 =?utf-8?B?aFptd2hzSURpWVhUeVMrVXZrdklHTjlWaHJwbWdFNlRRb1NzSjB1Mis3cHdl?=
 =?utf-8?Q?RGFYGJN1/vkNId18Yq1rAQyQa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56987e2d-df19-4da1-c001-08da8119525f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 12:58:18.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzWAUlME2ibZjlmrhZCq+3jPnSJvV1+9EENb3V2FsPOVGbmuS2LIsSejsft5FTts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1619
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



Am 18.08.22 um 14:03 schrieb Jason Gunthorpe:
> On Thu, Aug 18, 2022 at 01:07:16PM +0200, Christian König wrote:
>> Am 17.08.22 um 18:11 schrieb Jason Gunthorpe:
>>> dma-buf has become a way to safely acquire a handle to non-struct page
>>> memory that can still have lifetime controlled by the exporter. Notably
>>> RDMA can now import dma-buf FDs and build them into MRs which allows for
>>> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
>>> from PCI device BARs.
>>>
>>> This series supports a use case for SPDK where a NVMe device will be owned
>>> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
>>> may directly access the NVMe CMB or directly manipulate the NVMe device's
>>> doorbell using PCI P2P.
>>>
>>> However, as a general mechanism, it can support many other scenarios with
>>> VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
>>> generic and safe P2P mappings.
>> In general looks good to me, but we really need to get away from using
>> sg_tables for this here.
>>
>> The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen
>> this incorrectly used so many times that I can't count them any more.
>>
>> Would that be somehow avoidable? Or could you at least explain the use case
>> a bit better.
> I didn't see a way, maybe you know of one

For GEM objects we usually don't use the reference count of the DMA-buf, 
but rather that of the GEM object for this. But that's not an ideal 
solution either.

>
> VFIO needs to maintain a list of dmabuf FDs that have been created by
> the user attached to each vfio_device:
>
> int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> 				  struct vfio_device_feature_dma_buf __user *arg,
> 				  size_t argsz)
> {
> 	down_write(&vdev->memory_lock);
> 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> 	up_write(&vdev->memory_lock);
>
> And dmabuf FD's are removed from the list when the user closes the FD:
>
> static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> {
> 		down_write(&priv->vdev->memory_lock);
> 		list_del_init(&priv->dmabufs_elm);
> 		up_write(&priv->vdev->memory_lock);
>
> Which then poses the problem: How do you iterate over only dma_buf's
> that are still alive to execute move?
>
> This seems necessary as parts of the dma_buf have already been
> destroyed by the time the user's release function is called.
>
> Which I solved like this:
>
> 	down_write(&vdev->memory_lock);
> 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> 		if (!dma_buf_try_get(priv->dmabuf))
> 			continue;

What would happen if you don't skip destroyed dma-bufs here? In other 
words why do you maintain that list in the first place?

Regards,
Christian.

>
> So the scenarios resolve as:
>   - Concurrent release is not in progress: dma_buf_try_get() succeeds
>     and prevents concurrent release from starting
>   - Release has started but not reached its memory_lock:
>     dma_buf_try_get() fails
>   - Release has started but passed its memory_lock: dmabuf is not on
>     the list so dma_buf_try_get() is not called.
>
> Jason

