Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA675A01B4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814C6C2839;
	Wed, 24 Aug 2022 19:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76B410F346
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:03:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UimPin2EiP40JpnzyEPXzyTbuv1fyZO3hXbaTmr+TyoGyAReLF3pC5djycPw1ic2rzMy+LYJ47WWYJBrbp/g+DJofMy1y4cCt2K93lMxyi8WBJTSTV7XMcHdwm9X+IKqXaEWHvvvFH4yPLaJe5Ao93mE/4c5YrDrEBbwn3Hw5xiVKXcUNYuq3LDaR45p2TMQMGQjtvdVnddp+98k9642OOb9OwMPp/Ll13bvbSEkBHYkNgyO362avkdUYofIZQEvqoIlV/9mVTBfMxvr2ngdSbwWlHgB++s6HhVNie0qH/mNtlqCTeHC7a5ZwJF4EPEAu8d65N83wv9GbzWLjU2Yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YideKR8mq+sGCCarDUTIEGfWSSQf4V8wIykVjq4nJgw=;
 b=NGzDEQtJARCJZOUmhZoUV4dvpO6tkW2iMnzyxAR+z1/6RVttTqz6FX013C24zywriZSAH/0aT13TbRyR1uQT12ahRKEI9xPRUgc0u621iuvHUX8XvCMtTo531R3Nh5gFUYHYff/3KHGdBUk+msO9ioCpuzTmmLlKod5YpQ0zlfflH58oymtm3zhSZD8VM6FUzrOJqVAMCYVQ86jFfaDkEeXVaDoQ5BLOzMyWIbmq/n3TOPUdUP0+knixTi19l1Tew9zukDJKj/+HyO3kOa2U/1cKVCS79bzaDzj3zgy+Hh/fIDAjoW9yushvWv1luln+YMLbcNkaTmWcoGyDxZGI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YideKR8mq+sGCCarDUTIEGfWSSQf4V8wIykVjq4nJgw=;
 b=TTyCU4CoXQkRRalu5u2evJqbPl8gzQvbn5axgRhR9lEUEJae1xY8YorCpSYlNBUnIC5Q1UDLZd5UgfisEHaASw7yldlSJwshAlFcA4Gkb0uAO+7xkoleTE0inTpYjCmwP4PuhxYfESFEMOLumSfD3ijlZsm8vgJ0gGTD++BoNQm3n8f1z5IV3bdHBlftPEGpIgk3SqmUTcnjLx4Kb1ZrX8FY4FjkTiq85qCp+swhJG49NpBTF7viG97KTaB+HbBxZNQMPuLcfsdOsYRbMX+uj1rBqKsU9qTM6hjW9ePZR9yhkzYN1IKrqAAb1Jg2NplbjwhvxXsbtd1110WyOyK1Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 12:03:33 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 12:03:33 +0000
Date: Thu, 18 Aug 2022 09:03:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Message-ID: <Yv4qlOp9n78B8TFb@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com>
X-ClientProxiedBy: BL1PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::25) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f728a750-6cc7-4e08-6995-08da8111ac67
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRhSmc4DRIh6CX9RgXUFJv6YYccirKpUki+amWIa0U3NhZdgvqemTcbAUKFzQ7/oqyd1NqbttOtcXsltXHFFicAXJOsGfYUN0UDNAD6G/N6wpXwktBjLBa+J6NkdA/tOx1ddX4XaRJ0gujiShWr7r0Tc0r58gjSLFkO05Qqr6l17yPVbiedibbqXhiWglFmlYbQgJQhDAZAB9uQ5yW7sB7R8rQ0XNi93bjwSfEJEdY8lSlU4oZp9YTq1dzkg+sUJxKWMWARcYkb8RDP4iwuAvU2PTim+ygQlk4DZqCLHQiYITralE6iDl27Ee0ae6TwPMxhN2NsujhqxqcJlzbfx7x/UWkzhLmXQ6Q9XtigubfDO+tQtXyizUSWcwztJmE5blRfWMBqi5DBc85RRhLIHfdi8WFetlz2jjFscCjDiTIEmdylDpFHOV8v4o5rcilwg/N9QXekZ3tdwjGv017ba7J+h1pPm7f1PcNdnlvM/kl0QQyEzAmXkpmAUvXO1yXnMrOoekoKEj1b4b3rgT0dHSJjbHgelpFACsh9ZS8Kb15oEs2UU6WFjU6BNeCJpWT8xYDjg5NZsIRHDkx//clUMJfRso6nKMsH1hbNPz3cgfQjV8IjCk66tfGAQg+GpQpiUragaqVV0BCQN8/bku8PTzqXHFskVtbE/emlBTgk3T/nCiF1UglYpz1CgKBDJQjxWcxkAiO15gmrfkE6a4AFvwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(6486002)(54906003)(6916009)(4326008)(66476007)(66946007)(478600001)(66556008)(36756003)(8676002)(8936002)(41300700001)(86362001)(5660300002)(2616005)(7416002)(316002)(2906002)(6506007)(26005)(6512007)(38100700002)(186003)(66574015)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdWazZ0SHZqM3VIbnhJWHkrdjVFK05WaTVSbVRJM25ybXJaS29zSkVEbnZy?=
 =?utf-8?B?YUNOYS95cU1WbGZHZ2ZiVnIwb1dKbnBEOEdXbWtPWllGdWZ0TUFpWFRqV3Mr?=
 =?utf-8?B?RFBJNlZ6K29HQkZIb2g2UFp2eHJ1ZG9kcTQweDVoNm5NQWlsQ3ExTjVJWTdI?=
 =?utf-8?B?RGJrc2JqWHBaYTl0K2pSRTJ4VjFwbXdXMktjbk1GaVpYUlU1ZWVwRWlDS09h?=
 =?utf-8?B?N0FMMU1wdklVUHFmbjhBZnhKNjlPVWpHS0lCQW00REV2djV3K1NBV1lveFRo?=
 =?utf-8?B?SSt3eStjVU5VbjdZaVdEcllMblV6ZzI2MFRieEdpazVhNTlLM2xXNnhrdEhu?=
 =?utf-8?B?N3ozSUNmK25pdmtKYVc2VDlNRXN6SWhnbTcvZUFjK21EZjEwYXc1ZGFpUGYv?=
 =?utf-8?B?bFNOVytMeDJ1NGdqMjhGellKa01iNndGVmR3aXhHc2JVaUV2elN0bHE5bGl2?=
 =?utf-8?B?M29pQWRqNmgzZkt2eklpTXIvcFF3RGVkMm1ObEZCZjlDcDQwMW1DT1YyZWFN?=
 =?utf-8?B?bENNK0FjSzNabkNUdmQ3c0RtbTZjd3J5L2k5MEtiZUROQ2IyQWNTSlpyb2R4?=
 =?utf-8?B?czdLYWJaRjBZdENTcVdkSVlNNHUwZDk5NGx4dUI1ckFuMHAvaGdrQ2RLVjJk?=
 =?utf-8?B?cmNzcERwN0pYM1Z2QkJhMVU5QlRDK044azh4NTJXQ0JDWTNZSFpUVWwrR3NJ?=
 =?utf-8?B?bDhyK2hjUlJ5VCtVbVBVbG9rTU1qMlYwaVhUOTJtZGJIQjZqWC96SDBLcFJ3?=
 =?utf-8?B?UVp3Vk52eTJweXIrQ1FuTW8wK24wKzQ2aGxRVjI2b1l0WUpXbnpXSW5zMUN1?=
 =?utf-8?B?Y0dSU0QxL2hWTjdsVERXQ3BQQkhxaVV3U2NVRC9WK2diZFQwcWJ6SjJvOGpK?=
 =?utf-8?B?UGUrOCtmTTBkSDVPMitWTmJsTE9TVm1aOTRKZENlREJ0Nzd3WXhIeUp0ZmlB?=
 =?utf-8?B?TmVYbkhwMHNUUlVNcXE4WlFONTVZaFZkeGxGaHk1REdhbWNPUkVzMjl0emJT?=
 =?utf-8?B?TTV4elcweTdocmo4Z1lkN3hOS2dOUVFIVUxyU2JmNTlkRlY3ZS9GS1ViQlps?=
 =?utf-8?B?T1BYdDFWL3NlZHJScXNrY1Y3bjhDQlVTcnpnOE5neFd1RlgzYm5iKzc5WGd6?=
 =?utf-8?B?RTA2Sk9HMmVQYis2Ynlia0hSYU1HWTZoR2E1dHBVZU1ud3pxMkNHWGd3RlE2?=
 =?utf-8?B?ZGI0VlZ1ejFNeFJBZUdTV1BHWHJ5VndyQitYZXZrRDlsYUZtMDdyb1ZaYmlh?=
 =?utf-8?B?SUJlMnQ3R3VyMC9VZm4rTitpYzJPYzFCN3BLNmhUYVJRT1ZVY0Nob0JMdnND?=
 =?utf-8?B?ZFdyMTUvNWZRcDZaVTF5R3UzS2c0bE9CS1Q3OTNxdU40M1NTdmpLYmJMYWdR?=
 =?utf-8?B?TUNZblVYRWErV3NpUm16bW4yOHhzeTN0Uk5oMUEvU2FTSkVzTVNqd2dWUmE5?=
 =?utf-8?B?TXlWRllsNEEzZzJCM0llcG5HZVNYK1RUdDBaaCtDS09GUGtoS2k0VkM0Rm9t?=
 =?utf-8?B?WEFSa1g4WGtoVXhKTXJJa3owZVJWd1EvRHRNeFBOOFRHc01uNnBZUjU2NmZv?=
 =?utf-8?B?WFZDbHJhSDN6NFBBZkxYQ1lhZWNmZlloMVhZeW4rcWw0d1dkdnpGTDFqdENN?=
 =?utf-8?B?MEtDOXdndU15cHBTemNwM2lYb3pKdDZQUFlsL0NEV3dtSjRUb3BvaWhwQm01?=
 =?utf-8?B?TzdtU1dLTXRhT3dZYmtFMUcwQ0JlN0FmTEpCWlR5NWRzblV1WGRHcGpVV1F6?=
 =?utf-8?B?ZXc5YVozNDlXYjFEakFUaFoyWERxZWMwY05sTER5NmtrT2pDejJyY1NDNnI4?=
 =?utf-8?B?c0pqNTM1VW5lNHlnMEJ3RUdvVVdOTWFYWXpvVXl5Q2xBSVIwYWN4c3VjczJZ?=
 =?utf-8?B?cktWYmxwUE44a2ZKODNjcnlFTXBJVUk4ZldpaGUyWEJWeWFWRnM3VWdGUjVF?=
 =?utf-8?B?bXZuKytRVkpmMkZKdUNJRVlYVDYwUUs3S0NXTTJrOXo1d3BtN1o1eGhBTitX?=
 =?utf-8?B?a0dOcktDYVZCRzg2Mi8za2MvOWordHU5dmttQU83eHRQRTJEQmxuSHlkU3Qy?=
 =?utf-8?B?ek4yTmg1S09TRldodWM4ZXZxRFJ2VFplMzhpTEVLL3VUcnNmbmR5L0NkYTZI?=
 =?utf-8?Q?+ancfe7QLiujrZNH+3YHv484U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f728a750-6cc7-4e08-6995-08da8111ac67
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 12:03:33.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP22cB9FqEoBhJuKULdNkcA363T/+Sqf9AKv1Zlf4zoxWPM7crDvVPgZqQcODBsx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
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

On Thu, Aug 18, 2022 at 01:07:16PM +0200, Christian König wrote:
> Am 17.08.22 um 18:11 schrieb Jason Gunthorpe:
> > dma-buf has become a way to safely acquire a handle to non-struct page
> > memory that can still have lifetime controlled by the exporter. Notably
> > RDMA can now import dma-buf FDs and build them into MRs which allows for
> > PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> > from PCI device BARs.
> > 
> > This series supports a use case for SPDK where a NVMe device will be owned
> > by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> > may directly access the NVMe CMB or directly manipulate the NVMe device's
> > doorbell using PCI P2P.
> > 
> > However, as a general mechanism, it can support many other scenarios with
> > VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> > generic and safe P2P mappings.
> 
> In general looks good to me, but we really need to get away from using
> sg_tables for this here.
> 
> The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen
> this incorrectly used so many times that I can't count them any more.
> 
> Would that be somehow avoidable? Or could you at least explain the use case
> a bit better.

I didn't see a way, maybe you know of one

VFIO needs to maintain a list of dmabuf FDs that have been created by
the user attached to each vfio_device:

int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
				  struct vfio_device_feature_dma_buf __user *arg,
				  size_t argsz)
{
	down_write(&vdev->memory_lock);
	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
	up_write(&vdev->memory_lock);

And dmabuf FD's are removed from the list when the user closes the FD:

static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
{
		down_write(&priv->vdev->memory_lock);
		list_del_init(&priv->dmabufs_elm);
		up_write(&priv->vdev->memory_lock);

Which then poses the problem: How do you iterate over only dma_buf's
that are still alive to execute move?

This seems necessary as parts of the dma_buf have already been
destroyed by the time the user's release function is called.

Which I solved like this:

	down_write(&vdev->memory_lock);
	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
		if (!dma_buf_try_get(priv->dmabuf))
			continue;

So the scenarios resolve as:
 - Concurrent release is not in progress: dma_buf_try_get() succeeds
   and prevents concurrent release from starting
 - Release has started but not reached its memory_lock:
   dma_buf_try_get() fails
 - Release has started but passed its memory_lock: dmabuf is not on
   the list so dma_buf_try_get() is not called.

Jason
