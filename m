Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130925A4BB0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 14:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E5C10EE71;
	Mon, 29 Aug 2022 12:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E01710EE71
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:26:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGMgxgsxFSMOJk5167+7PmOCZ0M2SBsp2mvk+KYesbEZPUPp3akBZeUmiM8nDo+rpgcrEVkO4nC/K4mx9HQUZRaQyoZt+9cCeROsnZiYLfHCAyO37ppqMGHCbspEqUM2+uWpxVDCu8X1sORIrJ4zGZUfWC3dR+UjdPW18NGyBDSKhZBKlENqKZVZGcR1OfktrVDOFjSVpjq+xYwzJkFfhKHuyCADNtSnxEqyhfY48x3DOHFds/DSgDkp6OOtLUVxLvYKC2F99IYQRd1X/glzFMoHXqTjsi+G7bI31Ii2sggL8mt3b8aoQ5qoqCtBoC1PT84IMSJ9MTNS8grDc3bxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbwXDpJGRH+ypHPkiFWe+78jvoWSYu8UMm1FN4DiKhM=;
 b=R4JiYXFXBgQjxc7QI0DkWni/aPXORHq9NbtMCJqmYUqJD5YhpqlrgDzmFXZcKrQokQwiz1V0s+w6nD87yJdUoQxxSrupAxYL/ZT/nxkOqPq/fV8WhitkD25COF9r3FtUOaRVsGd6UQL+LoVDf1+5uPBxHSjrXujwLX+EVSP4EGU93QynIY3X0A+xIFDZ/MgfqNiDRETnwQp/O0EM9GUyJWD+QKy+1BzcCJw+VNg09dQgQu2rIeSZvxWYR4ybz9TXok3at2JSmZNw7vJzTjXbDXYAizjk0BtWA23mQyFtazElz+5zvCV1kiIf8Osdz3xxCv2lyDxQcKLnmNRKN0hJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbwXDpJGRH+ypHPkiFWe+78jvoWSYu8UMm1FN4DiKhM=;
 b=plzzlXD4M66MKhIXDsleLH8gYbSgigMnQVsR93KtbtlcAnXYqIRm794Xgjyd364gCUwdBmvF5vLExV1ABcv8iqKvnLE+UxNihJ2HZCpqlliDmWShgMtE4se+cdbyuUM1bEU8CRwx0ZEKziqkbbdX10ggE3s9jHeAfG3C468ca6rIS7H7jNWCgxGzmUVJOc68eG624wK+PBKaWIVziD3kKskL1Xn6mSPFy0UbjtNrKoL5jW75SrYJ89e2uJLDUYV5xLrU2EIypco8zktiIl6YszrFDLtHVFe/sTUmqTVewLBt83HSLdLIgq/Gjsg6DShHQkgSZlF+UjTD9kUk8bcRwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB2893.namprd12.prod.outlook.com (2603:10b6:208:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 12:26:43 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%8]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 12:26:43 +0000
Date: Mon, 29 Aug 2022 09:26:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 4/4] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Message-ID: <YwywgciH6BiWz4H1@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <4-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <YwxIxWQQ/ENiFak+@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwxIxWQQ/ENiFak+@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: BL1PR13CA0382.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::27) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 793fcde3-ed85-4266-e9e9-08da89b9bb2c
X-MS-TrafficTypeDiagnostic: MN2PR12MB2893:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fdAB9d28xbZTAmkfhcEuIQACPe1GssXLPbdgujwWN2zuw2+45KT/omrW1Ur8ErYKflSWLUtuNIAmkTI6EL7ttRsggNp9klXFTYPAHANTp+2YxBbqZa6x41IQk007g4aV2EHcdPQgnQbZ1rGKEXGY1YO4shPugzvlDHYQS+6Khf3OGsoMB8AtnPAPFV5/fvfdstUin9f3adAEpkGa1TxX3BjyWTg4kLg2ohZvIJKppO4iJtJTXZEvXCrDd8nLg2KkEIa3Rm3PLlJOQMTrbkXTekTYgsuiOfYtG+bBQw1uaTgUAWWgaJeQIHTFCFo/VNi5v6V1I2jSAvFBZd+HLmqHZkKbivuUHAIcge4ZRdusmYueKA5sv0qBtq6DuO/JfRndktjG7wBWIkcPIuWSMR3Z9tmBZssyrqhlsWXPkKR5O6sbAGPmTEBb+38jxLDTkL6uvFZnKzAdaCwuIXSh4ZAmp4arSaDxhUqgFAgUESb8WBRPbYMzk9qooeG9Yi1Sj3Erdx3uC6BZZ9NccAxcqDI/XxyXI910k8MEyqQ2nAXPSn9CRDDW9gFdzWVeNjwJEXKuJaNDQ9F6hRZ2F6raob6oGXiIhMUjlNRiiSXto/GaLjWmdFn+5ng5nne8t+VehTfJeLOb36zxaniolOjx3UnrvzL5Oqb2WRcYBM33yOl44Rjjm5GFxcPN+KX5hk4HAYcaAmWqYPs8p3y5r1SeugRCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(86362001)(6512007)(26005)(6486002)(478600001)(6506007)(41300700001)(186003)(38100700002)(83380400001)(6916009)(66476007)(2616005)(66946007)(5660300002)(66556008)(8676002)(8936002)(4326008)(316002)(2906002)(36756003)(54906003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yofZyt/44rjsZRoYdadLlFutisL3k0YE05zvlw4OF4mPB3swIZ0xeA4PbAAL?=
 =?us-ascii?Q?5aTUIz3wQWAfqQ1YFgTwLjljAcTak558GSxWlIw3ZHKgyfIS65h3Jokzf3q+?=
 =?us-ascii?Q?+kwTF05JrZbb+hsUCZvfglG1mKhMscaT2zGbppuVWLjJ8KBbrJISZCvpz2ag?=
 =?us-ascii?Q?4I+F0+E6uD8ReBUTx1mBbuNOj4n9Qf4slYMNs+t7T887SpfWTnNlSCBT+Het?=
 =?us-ascii?Q?jlJNKteEJvb7/5CHFP/oJhj6FY+x3WDNvBkOTzMUrz6dZKi3BTl0DcQlg4ml?=
 =?us-ascii?Q?QLGSPav+RdB1kV1GkcPtfugMnqBc5u4bCsNSkQ447IuwszXOonVtOT4JXypD?=
 =?us-ascii?Q?AUJcwFJQII9NuJtsg8Pl0IugqF5R67xgOz2eKZlhv712mw5p6iCdg7uBfcG1?=
 =?us-ascii?Q?Slh6qNznwNxoZImOI+FODQnYrVJov5ceZ7KcmdgGeGgiu0EV7S8qq1gHp3VR?=
 =?us-ascii?Q?u7EMK6VdTfcqxuho3us9oN/LptInAy3J8NOJd4Z5X3Sm6U+jiE043agSGfK+?=
 =?us-ascii?Q?QUaoKoEd2hnCDkYFiz/tI8OvH5WGZ8WVzgsAIG7xTe1LFQmc1wRurWN2MXEO?=
 =?us-ascii?Q?D4XSthD9hKC+xmZk+8FUtLKWcj+/3ZMOlwuZHT96xC++0kWbJx/iRXrfcMZe?=
 =?us-ascii?Q?zkI21Zr0Xwiogp6ev9EZfzLDUbeV1859aS4n/UpyMIEgdfumhlQQoPc4IlmA?=
 =?us-ascii?Q?hEKejMkglifXgrggEfchp7h66u1RkIX/djB6c0feHXhdBOUDXT6XXDtAz+Jj?=
 =?us-ascii?Q?uFWfE8kTjS1dVabBJz+KCyv2OoTh6LzEt74KXqVxlyAe/g+MjbQPt0kRxiE7?=
 =?us-ascii?Q?r2o49m49FnxfyoGB1HYZMx+fcws6UrCoG7RBsfyo4eCs7E99JZCRMZ/YX3fZ?=
 =?us-ascii?Q?ZJL1f58yGWMPsRsxY7ePnn2rF8KzLTEOzYVRB3xe3i4gjp7+ymJdzShmZUYW?=
 =?us-ascii?Q?2hYabEoFS9xzojj5piAaqlyWVyl0iZyfmQ+6ZiYSoOyUMZbd7Hl6cEiwNlTF?=
 =?us-ascii?Q?X2cqUvQm3F1+kPIJ8Xhgk2KaUGtudhly9XIn8aPJbgivVvW8u17VCgTv0vs6?=
 =?us-ascii?Q?Aw9DFfboWzNava4IHEs9lCtD33VFSYhDiMJNLs4QbDndiirHLMMlcO0bN83R?=
 =?us-ascii?Q?M3ZP4AzDl1ajHuOqUoB2Pc1/3n7V3qMA/9/m6CDwPy+NJN0Cp+Lz7ra4Nu+M?=
 =?us-ascii?Q?SkvI4RRKzq8ld3RwghRtuAAqQ8FueDTvsfEGA11WKz4K70U0hnwLD0nPWoIv?=
 =?us-ascii?Q?pKyq8DImsGRLFhuniPVwUlfYTizbRzxSYRORItmXZZYM48gijpuBGW4HeMED?=
 =?us-ascii?Q?DEod+qKXuBa0+8jQ3tvi2j1kzzRre3TBXCptpahPdpHv3Vzuhq48W05Kn5Ip?=
 =?us-ascii?Q?J1gClCDb4v53+PFsUZstYH+PPMiQU43j/XE+5CFZlMaLBrKS92mLywm9Lx+D?=
 =?us-ascii?Q?D+g4oSadqXfl3imF2bGZFwl3s34j4Q8W8TYysbyVNDdbuONi9aMQrFE2uTrF?=
 =?us-ascii?Q?joMHkvONx+FqypY+zBGNagk0zuTAUPrFxhaolb46AU0Cu7k5lMKF2VoRphUZ?=
 =?us-ascii?Q?edt1CW0j+m/iE5H1Qp4N41p8GtkLWeA8PwGvuWpQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793fcde3-ed85-4266-e9e9-08da89b9bb2c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 12:26:43.0927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTNGDrCImZGhIDREbRfCZWkQtTUWAwShrC1plgebmlmdHKbCp1oUxr2skncrej+Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
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
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alex Williamson <alex.williamson@redhat.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 01:04:05PM +0800, Yan Zhao wrote:

> > +static struct sg_table *
> > +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> > +		     enum dma_data_direction dir)
> > +{
> > +	size_t sgl_size = dma_get_max_seg_size(attachment->dev);
> > +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> > +	struct scatterlist *sgl;
> > +	struct sg_table *sgt;
> > +	dma_addr_t dma_addr;
> > +	unsigned int nents;
> > +	size_t offset;
> > +	int ret;
> > +
> > +	dma_resv_assert_held(priv->dmabuf->resv);
> > +
> > +	if (!attachment->peer2peer)
> > +		return ERR_PTR(-EPERM);
> > +
> > +	if (!priv->revoked)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> > +	if (!sgt)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	nents = DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
> > +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> > +	if (ret)
> > +		goto err_kfree_sgt;
> > +
> > +	/*
> > +	 * Since the memory being mapped is a device memory it could never be in
> > +	 * CPU caches.
> > +	 */
> > +	dma_addr = dma_map_resource(
> > +		attachment->dev,
> > +		pci_resource_start(priv->vdev->pdev, priv->index) +
> > +			priv->offset,
> > +		priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> dma_map_resource maps the phys to an IOVA in device's
> default_domain, which, however, may not be the domain that the device is
> currently attached to.

dmabuf is defined only in terms of the DMA API, so it creates a SGL
with DMA API mapped dma_addr's

> So, the importer of this sgt will convert this dma_addr back to phys?

No, it is illegal to call this API if the importer is not using the
DMA API.

I'm expecting to propose some new dmabuf API for this use-case, when
we get to it. For now all importers use the DMA API.

> BTW, I don't see the assignment of priv->index in below
> vfio_pci_core_feature_dma_buf(), is it equal to
> get_dma_buf.region_index ?

Yes, I noticed that too and have fixed it - the testing was all done
on index 0.

Jason
