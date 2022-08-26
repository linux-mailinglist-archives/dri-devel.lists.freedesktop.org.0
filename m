Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2335A2E06
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 20:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8810E9DD;
	Fri, 26 Aug 2022 18:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8010E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 18:10:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EstCAFLvDH/peylH1Ig571g34OXOIRJHfVjeY13LYAkuKFi4+QXVriK8gK6MuAyVSPFnJjjEge/4R/DRTwPTygH6VFNNBtYUqJbhftl30uWffZvhUac37PywTw6cSvVIE07niPTVb9yNSGUkTEFx1lE3xoUH3KT4+U3Zom8ESrO3JU2tB+NNAn3yr5ndxRpEuUJ4wFnQFuT64Ddvpe1fcqI0GOImrzAdu670Mg/gnQuAr8WI/slHn8/tG/UWdKv9efI83a1sr0RefPKx1s65eWvzO/EvLmYNe3T1G2rVKls/+8s+1e/Npl4it/JLDb8jEroQZFrwGR7lubCCZkUO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuJoj7hld2EeSSN3LhJ3+Si9zZbkdaroRJY+9G8cEdM=;
 b=oRzrTBTs0BpbO1MlUK7CGzBZvACVhQI3QEj8mvEXt8TuLUL/P3sVVnkb51Q3KlioFhqezq1rbNqBUHXltPOV+NibnO9VZQlWxlrSgn/klnHIHtW5mkXwLTjxYXxieO/shovYTQ/05ELC67DQs3ga9T45zAVNBJBFbwKQKpPivfbbmoNHEA5dT+gwM+S4+VfJuVgSwROPMLdn0pse84XlbU4trZ1hhYy7cZGTK3ApvJj2IUJn7Bc1roEQNsAkLOsFBD/0qqgcZrmgo6DId1ReR4w4iMWY7O+DxPzkrcoDGLZ6+ORYSwqxB0SnAxdgGJ0ia+DmTN7ZtjP2YRXr+2MbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuJoj7hld2EeSSN3LhJ3+Si9zZbkdaroRJY+9G8cEdM=;
 b=mIEOsXe/CdvBc53h05oD4SHgKfjEOyyQ3yNEuMw8nRh0IjZcNWEffbT8cBytQAzZuE8dyjo+9xDZKCgR4mESwXMcuhvLqBwYKigJNgnDtSeZ2OIXH1SnV61fxua10a6bCchllbCtJe2QP6n4O+WBuMtShnfHxdxKTcY1o657OjCqESUpgoAMI+P48b0v4plpI3WBbiLxWvs8wWQ6RQ/L+958QpmhYa4H/UJCeFWDbIuOKmeSS/6SmQrrNFsimX3rNNlcVsgyQl6HjVbwOkejXp1i/ygpRBlt5TAnPlQbXaU7DlGFilS6TE1/Ivi+yFJs/zQRJY182Zv+CZa7K5/ORg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 18:10:33 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%8]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 18:10:33 +0000
Date: Fri, 26 Aug 2022 15:10:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: Fwd: [PATCH 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YwkMmFjpsKuJroBz@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <4-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <CAFCwf13kOBri3NDO=6SGHOXq-M=wndbdcMxik9bf8H1AUCE1tQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13kOBri3NDO=6SGHOXq-M=wndbdcMxik9bf8H1AUCE1tQ@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0268.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::33) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 496c1765-6208-46f4-aa50-08da878e4497
X-MS-TrafficTypeDiagnostic: CY5PR12MB6180:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wDBO32CR5YRONTjlTkB73qExBL4EIVO0zEhxQvMDlAvcVGciGfKgfTukqgrb/axadQu++NTMKcnjTCl3i6XqiMJvR63VO3JfE6RGee84AJQOXhCbf2hKwudHYJCjXvnaN2TjbrW9PXxc9i0RhBGK6XQLaOUAVa7n7t1BsEgmA7QkTrx7IT3B/CB0M5fIprvnKvrEKlQH+4VukbUF07qeAW3RCLDU68TT6SBJ8Yd4ozgC0I6jNgedcUNMdnWUsXa9ghf7EYkBfktZgHv6InTkU9H52PxayBWxjQiZdvqhqziRUQ+edN+pPTfTv+kKeDgYMg9x2MhtJAEf0XEl/BBKs1vFvg11Q4CvWnonpngo7Effkx7E4hQjh+tDyItHqMm+Nk6swhFlcOMYS2tVck60i3fk1vGPFcD0zY7p3BW+0Zu/F5uhKqQ5nFytF/jBWxiXQM5YaG3NFP+MAcv9PoOB5/NSb1zPTgHr6q49J6R51FtW7I7A22/mDYoY6sqZp2t/sMyHRlnV/mgbZX+jpcOMMzJxGdn7oZQgZKwGNhFJ/zhBMMCO8Y2M1XLQPa7ibm+0gupuyZ2n1T/T6+feKWgY00d7rN4+WZ1c21RI8dSzlrBUV+Bytv4y6UyL94bkphNUpZPO6eHpVRmeKiC/EjH9hpJrNos+7TPGEYSeaFs5xousDbonZnkz1VKYwmfTcBSjlADRZ+UKv167h0bAqWmanQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(316002)(86362001)(8936002)(6916009)(4326008)(8676002)(66946007)(66556008)(66476007)(54906003)(26005)(83380400001)(6512007)(2616005)(7416002)(186003)(6486002)(478600001)(6506007)(38100700002)(2906002)(107886003)(41300700001)(36756003)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8tIeO7XypHpu0U3gaORBl840X7xXAXx/UGCKaHtsql7BdFGEznCy1DAzH8W?=
 =?us-ascii?Q?1VpIb+I4dZD16shjHLq1UHzJwTfjvZLn7drXWiytercDa7KrHAbGqIgGA1IZ?=
 =?us-ascii?Q?MLHsNXEKUki0o/PF9yU5J7RY2Y3HwqSBvbquSR3iZTlq2oFYyHiMXNoNw7Hz?=
 =?us-ascii?Q?/AffYUtunSZtf/c24XJJo9OGdX7Qa3R5832Auq5BMY1oXlYx6cxCD23z6nGc?=
 =?us-ascii?Q?+68IQxQrwnmulZku2FKVZaOFCFVnZnnbX27+QPMSllwFUUSwGcr1AkEqBC0A?=
 =?us-ascii?Q?6LzD14AdHFUxouG8ZIRaw/ri+6yw9BXqSAPLdG6kTRQf4rseDugOfNOGdu1w?=
 =?us-ascii?Q?ayTAAkXQL8k9xCumptmpsSl8vgSJ1wdfPlbdjMW5HenPYyybI5Nj5adYJ85t?=
 =?us-ascii?Q?KPf9iOK6NBHaIsFPubP8YqU/aXX/hk6+WjCfpbVFiBL8AwADGrL0oJiHCC6Y?=
 =?us-ascii?Q?yOF/UCti0lZE/kB0Uih6kWpsnKRgFdFI3Xw+wx6FHZeHUpnCYF2V/9/OWc94?=
 =?us-ascii?Q?frCmBO18+5xt/aVrRx/SQWS7AaAbRJBTWQ6aybJUTu0bJGU7MrayyFwB5Dgr?=
 =?us-ascii?Q?P7XURzowXpSkSyXxq1S0UZXrgpqgDh2BmEEWHGPfliZBuqgEaZBggcHnM7Ku?=
 =?us-ascii?Q?twC39BO9Ooo1GL/Dir5BRSAcfBt1asLCQwwz2oz50IN3LJ2mp4NVMXZ0oKYE?=
 =?us-ascii?Q?tNk112u7P/LATJwVpwCzzeC4JKFI+e3Syx+DnzCaSc9vYv/KtKEyycH2THja?=
 =?us-ascii?Q?WTzRfdfhBfbTBtjvsLi+Os/slmQ8r/7hkhDkAM7wyNoGnA/wo5Er2t0ohfw1?=
 =?us-ascii?Q?rJzkvnhCCTSUNiQ3i1qATjEAX9PY4ZXr9mFLd0Y2sJ7gkSSd5k4RJ894Oc3w?=
 =?us-ascii?Q?EyZFASCErXagTGcBCXZ1cw1poAz+/wmoOpbZrRFelPZqatyqMqIQPybgLUn3?=
 =?us-ascii?Q?8TAvT/ppfWi1r+Hl+c8FxGQfUuKzQxcLkkxFL9B9T1Y2sZ5BkGe3QCHB2XHv?=
 =?us-ascii?Q?W3a2R2UD+dEu0U4/X2geSQ14R2VVXTFdaWkLKh9Ust454218pQC0QLmI8qH+?=
 =?us-ascii?Q?uWinoQ/+/Zpm8fAFLLIXywHLh0vYfjx8cGAUgW8qOsRpiKDv7Vmx/Sg0zkCt?=
 =?us-ascii?Q?7yurMBb58p98ajBvr39UJ2VgFdIsBhoph83wQWLvmAcoqk9DHdqJuiUpchQx?=
 =?us-ascii?Q?XCPPI73xxnGrCvo+DQYFaMXS+Qzq7bhCrOzo7vxdF1Tvcfw/S2BUu3WW+rjD?=
 =?us-ascii?Q?hlrFaNYWBdYOD9WWrQ/58zjh6EwC0Kv9qGUvABkr2mZG4USZD7Puco4rvweT?=
 =?us-ascii?Q?ygLEYKtBZrXZ9ERzl/m26KiwvDR0qsEaVrvlvANb/j+H3m1+3xoPOonzOGxI?=
 =?us-ascii?Q?BU1LyVKUHcSB9Y9Y775QhFSRIC83zcjY6YJp37xoVcL4hcrTRCM1lpK0NmP6?=
 =?us-ascii?Q?37/WmQLUzRQGqEesPDND3BAaZPm12de9teCQwP97hLZf7MR7QHelbYonhWvK?=
 =?us-ascii?Q?NJ6u6fzN4fYiDRZByZA1Z7WUvrCA3Q0w4C0E/AxTdZGPgSlkky5Nt4DwxRob?=
 =?us-ascii?Q?b+buYN4/lEesnAQgBeDKP1+b5kyHCqM03h5WzczF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496c1765-6208-46f4-aa50-08da878e4497
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 18:10:33.4430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aNmX6VLedMHvn98GkrIymcqtfJCX0BtjGN6bjR7S/jS03Rj3DkVKR79uVxLTVpG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180
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
Cc: Leon Romanovsky <leon@kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Cornelia Huck <cohuck@redhat.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 21, 2022 at 04:51:34PM +0300, Oded Gabbay wrote:

> > +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> > +                                  struct sg_table *sgt,
> > +                                  enum dma_data_direction dir)
> > +{
> > +       struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> > +
> > +       dma_unmap_resource(attachment->dev, sg_dma_address(sgt->sgl),
> > +                          priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> > +       sg_free_table(sgt);
> Before calling sg_free_table(), you need to restore the orig_nents as
> it is used in that function to free the allocated memory of the sgt.

Oops, right, thanks good catch

Jason
