Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEFE5982F0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 14:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEB914A48E;
	Thu, 18 Aug 2022 12:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E29888C5A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnpYRw8wc/bY4UndihlURVUp2bqn3D9p9Fs+KzfqbQ9pRATt77UHux4nG4cQL69H4jQIJxol3W6QCMXTnXHljziCaAgaxIhGughlucbpSwxxnvmNe493gott2YTJCvkOJPeSninJLgQLI1Dhc1Qddvc9vuVLDiCQUo/DvMjZa4UZhI3llGrE6fFri5ikc2T/MTLbOAqiK+eennhPW7Cx2py3ivTcgrKPmXnhQbEl1F9abE9aIBpEp2aY2bIXf4/PuibOm56v/wK+GY1uIE2Mdb2cKOkr76KbW3839/Q2jm3nyAKUxIjt2UwXhwzGd/vK4RNGZpGZVokdCLNlhEHvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP8MSOtF3dL1saDG5XPClaJlssrJanTms9US1iaCdnI=;
 b=gxt9NET9wMTD9VEOF2LlU7OJ7bj0VbWpVS5ulaor7GVT0qWLxdwjzS4R3Zy8wPvWi8SdfaniiDXZUz0dylBBkoorR5YcvE0cD5dwL6STwjASTUaFbl1I8soR8I3UCOqOH5fim4Lo1nj2wKhNM/xXirylMfVc/lVgPVjuOzODIRugrZWmOcMUSkXsMC7zmSDv2HNcXdqzlMj0ABg+Jb5et3TnTQBNGYwR77YlQ6qXOprJ7pSh13AgDkfa935INjn4634OPZbJzHD0pd+9FYbV2UsJe1CKImXnQnHIKOZ2KbA3MmyyUt3TQaVYKmM9HXuy2qcFxhPcvP1RT9/LgaeEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP8MSOtF3dL1saDG5XPClaJlssrJanTms9US1iaCdnI=;
 b=GklZkeM3N9hYGfV2quTWXbSI2z6Hx+uv4VmX8fMWRYN6+g98wH9NnXwd4dHEHN1vCSZ3+GotkpnNZORTykv/ImbrDGPv5p6Rng+w6h6A2pcSILc4bSZ/QJFUow+BbQhi4Wwkji3XnDyVYYUy3wmhi+p0DahV6Kqv/YINEF57U8h0zmaNr2ZdbuKfTfNRcxOSOyA88Bxz8FFnjX2BGdI9OrvDV4FsH2lLgPOf2Sg04+I/ZJ9EZ7OeUWGjIGtgR0kK6XIWdEs2qyTfj+TZ4Yq3QBsmOjYgm+QhT066AfOr4Jc/Ug2qhN7agXRxAwOkRx5uBU99kKiSJUgIAOTHHnQlcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 12:05:25 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 12:05:25 +0000
Date: Thu, 18 Aug 2022 09:05:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Message-ID: <Yv4rBEeUMQyIdEzi@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::11) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d963fbd-e890-4481-5913-08da8111ef4e
X-MS-TrafficTypeDiagnostic: PH7PR12MB6933:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4PHKi+rkEFdv/HFvFWP94w3f+t0EBS/W2K1nYxHzgUUFazudU6LIfMJHKVs+EivAnvRTY5qzvovzoyQxZhBCeW0kawuki6f8f+0W0OoODjZQEy+zSNEJXJXBQB9KRU7pwlzGka1HXh7eAovxFO72RESts63fzGDnVJ1JK7F/XRNyIs9fC7aU3HzsoFAnAah603saUs9DTbOVfhINsyz9n2Osw9HUHdGjlaW4+rppVOZeSXcZKVIJvHywU+U+NMGKSIFOwxZWfDV95FE3ufRyeya+xuAtzgkATan+LSIShvb9eN1Qfr7TP3wgW/hKrNNEGnkjiNvZo8PjvTBDETwNU8feBdC489zJtPIY4fTmaNcZ8npWHduQrMbURuBQ/fCKXbMlu4Ma7NPBLAbNJ0Q1Bw+RhdAFOc02gH17s2czOA/d8DgL7O+i9WS/0V8K9IqMhgNFA6XP3nJDB+1RhuSbNh4q5Ed0VUifqL4Vz6erN+KvAqeT6mgxYHcuhISlJFw0Ar+LJUzLDnZzo8iPO7dPz6r8I826sCTfj3+E+73q/J47Chn4/dKoq4Ncjn/AWeQBPnQhhnHzvX6SJdeE/Bdtu30bxbR2w0NkRP8LRMKym2BJfxWSLQ2ftBJoC2E//HTME4K9dJsry6SeHWxLTsWQwe0vZ+60QonRq7xhS+3lk9FXKQSO6JBWyIjqxEuFk8AOf0vJeSehCTXP2Jaj+wxH22J+JHeXzkl9bLK2q4gzXmaNeXWhH32m6ZHoS5ADMWHaZEEB6T4kScJ/TiE8ephcuF3bc1ouMlN51dka0ZE4EY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(26005)(6506007)(86362001)(186003)(36756003)(2616005)(83380400001)(6512007)(316002)(54906003)(478600001)(966005)(41300700001)(66476007)(8936002)(110136005)(7416002)(66946007)(8676002)(66556008)(4326008)(2906002)(5660300002)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vkHMa7D5EO3NiucPq8lx0/C1zLj9/nyCpewq32dKFSETP+a44kEg91tPvTRT?=
 =?us-ascii?Q?JaUGQjZGvQIPtc16jmi/f83QOpESOXk6tHy3nfxmVCo2BD12kt/IhbuhI7q1?=
 =?us-ascii?Q?EUA61YPSW7hS3aGJ6+UMcjqWfcO+8Xa0JNrwTllFqvqmI+5v8q0mF021BSux?=
 =?us-ascii?Q?yXVjQrALyE5QSDJDj0bby8KOwPqIHBccU2/fK4t6GCLz3VIZXPwKcSy65yNj?=
 =?us-ascii?Q?JxcFfxc5JS2FGXcPTQ87RC5CzjDKnTWamoe6VQLBk64q1q1ArDiQrSEEqnWS?=
 =?us-ascii?Q?qMBjR5boutfzRJsYBfs4p+viQqKa+kkpTful4g4RAZDXCveg2guMK94jqG5r?=
 =?us-ascii?Q?PhURRtT7AEugXh34xN8uYyKxMRSN05nCwSLveeD3kF5efN9WoObiw22I9M/c?=
 =?us-ascii?Q?l6g75Apva/nbXyCSSo7xomvocDaDS2ENNIHAD49gS+nVZp4Ffkik/g5VRTer?=
 =?us-ascii?Q?QOTDWNa4uDothLx37xDdwZCTrZFogLdmlrOeB8R1ob+ocdvqwK7svWgY11ay?=
 =?us-ascii?Q?OJtYgcPw7zKtvk1/HwYdpeQKiWBIh4kp3irGUHIQWo+uhZsyhE2bx3g0zANG?=
 =?us-ascii?Q?8jrg9B6Vmz/F7Pk/ndh7yLpDV94WfMrf9HOQ009ao8AFN6EQnETVVos6PZpq?=
 =?us-ascii?Q?8fBPTCeOsy7gGMKtctICcACKNOhOgbPqM9LUjxbIFM59TXDIVmWI4FUXE3QT?=
 =?us-ascii?Q?tty4fVmsozr8qfsghg1HpJhZzy5dqtANzow6z1HyVqwIV5rTayC8DXl6D6YN?=
 =?us-ascii?Q?oaICi9bBP3RZDZmRQIwMfjCMabfoyDK9fIyV3ZcLRkf1ILkMm+ZcoMGLulVf?=
 =?us-ascii?Q?4LRxGpy4iZpBCY6K3Bnhs1wmU97VKNiKCw0gaI1AWOyWmePsBGmFcb75hM1O?=
 =?us-ascii?Q?WA2O8u+wcA/SxqOmAQln0T7D5HJTErGnJ67a/gYqw6jXKFR3Bk6fbbsD4Us0?=
 =?us-ascii?Q?cNpalFDeTeCVkleJsru3s2R8LW0KQv9LnhoMHINmIP/e+j9J0JG8KEwhyPI2?=
 =?us-ascii?Q?58NCcpwPOeAeoXhGHTnpIEmVzs1wklCavpvVj9+Fhrv26PkuEN8Ca8Rln7ph?=
 =?us-ascii?Q?0ls2Vb9BOhdxREEcgWXLbs2xP2Gw7sMSpwOybKaZpKl/2PItZwjt/kehJb9x?=
 =?us-ascii?Q?swVlOCyjqCYyg0nnT/0GgNEadBKKrly/k8YsTpaxwAI528h8csq6vmRnSgqZ?=
 =?us-ascii?Q?xuqt+1aKdROfM+NbM5u2SsBfbhj+FJgY8KHdDC0kOxyS5qCh9NfNfhCbRoK4?=
 =?us-ascii?Q?jhMRZU86CFrjwX1yQAaSJqvuTq+rSL03Fjl5fVDFLG9GggdfHdyxIIuZv7hx?=
 =?us-ascii?Q?WvJO3JJ9AoyhkDg0+prPdzwd+CXnYszeFLDOLlvmqBJ5IhAS3YvqsCa7IkqQ?=
 =?us-ascii?Q?lgJd7b/IiM+nz51ToVYxcAE0LsJBg5Po3W42ETpcVGUb6hDHQ1lCScRxzKo4?=
 =?us-ascii?Q?tqy41IwK5LrbP6YaL02BkMY65J7aY7hRDCVa9Mcy9Hvvg8PUhXNc0n4uBfEh?=
 =?us-ascii?Q?K0s7LvQlbL5rMWGxlKJSRacUSX2jfhlHrJqpAbfkRPm/dllBOWLiRC0Oc4q1?=
 =?us-ascii?Q?vi+KhjWDJImxgv/Q4mu57rr/u1L+zYYr1ZUGzEha?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d963fbd-e890-4481-5913-08da8111ef4e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 12:05:25.6912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwDkrUNEqB6zt+C+lVIEZShnak/ZfQmaQjnG67ND3AQx8wtfSMc/7yt8bu8GS7fC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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

On Wed, Aug 17, 2022 at 01:11:38PM -0300, Jason Gunthorpe wrote:
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
> 
> This series goes after the "Break up ioctl dispatch functions to one
> function per ioctl" series.
> 
> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_dma_buf
> 
> Jason Gunthorpe (4):
>   dma-buf: Add dma_buf_try_get()
>   vfio: Add vfio_device_get()
>   vfio_pci: Do not open code pci_try_reset_function()
>   vfio/pci: Allow MMIO regions to be exported through dma-buf
> 
>  drivers/vfio/pci/Makefile           |   1 +
>  drivers/vfio/pci/vfio_pci_config.c  |  22 ++-
>  drivers/vfio/pci/vfio_pci_core.c    |  33 +++-
>  drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++

I forget about this..

Alex, do you want to start doing as Linus discused and I will rename
this new file to "dma_buf.c" ?

Or keep this directory as having the vfio_pci_* prefix for
consistency?

Jason
