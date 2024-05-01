Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5D8B8AA6
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 14:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C5B10FC34;
	Wed,  1 May 2024 12:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r+GYLUj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C0B10FC34
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 12:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NB3MzPJlwsEBxKZq/ERluTc56ihWqqmT19NAOgBwNYYwjC6ROAjFVIZwdfoC/QAje44p/qSKRBcUxq0n3SjsF39RIPEQUj9S77eGny6Egj9R4EJdf9HXDSZoDi2PwvOJob0VsCjAW+bapR8LhNCj89gDbM79xZsXHmeCt8Sg7P4WgZ/TgBOHNODHb6zCp5igLoj1rDflV1st9YQlsI5Y/L/kf2GU6zv9BuZlqFgk3bQ03g06B5jtV6+jQ+rRiB56ObkncVICZa9CV2VU8ST+m9Sqp8vIdL0OuLNEfBzJmfcsjJdy+FX8a0JhVLPgg8rZVnfhyeUQKpgMWtSvOPs5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+dJjej1HOQ3hx2PmhuvUAE5ACd0PSVv9WqnYMJku70=;
 b=Fgkr7eIhtHFjnYGvSq3N7uTfYY7kUJoUG9KFqo0clXmC9ZxRV2w67fInMTZeCO1WwoSjf7znywrutFlhn7nMU6s4fXOWljpEVGSj0X3Lxje3Y9QhcHcqiY+WDjc7MoGL/aSNEzhjR2k6RgK0qIgO2Z1D0A0TLUWzP+v5Ua2GkrTzaxMo0JbrA3v8JR9GTbiYCqWJm+iHXaI8SvJNRxKjuYpX1kKfZbNPAI1ugjd/3xpTne93kzQv3bus3aJjAN+bvxlmTBn94zanpmIiIodo6JFSJDok0eijrMLTui7ht0bM/9L+DLKwm2GOmUyy2R2r6oyrZK6ECo57aq3J3tDu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+dJjej1HOQ3hx2PmhuvUAE5ACd0PSVv9WqnYMJku70=;
 b=r+GYLUj0EESv8yCQdKaFxU+0dKQXc7wf3o6PEGXCVlRu8vhCuNsJvtnDM2VHPDYx6TyDPV2GNY1mSMDi195ZrpAoXos61+QeSTVk/mPhNaTalSGK4IJS+4kqXs5sRK9TpZhlPE+6CUO7vY1t+BnaXBTAedukcbE6SaH/UU1LtiaAPeibnYs0PL2OZAMOcvZwquYHVFiS4+bkcKW65AuVvznY8Fx8UiT2+x3VPl++aMk6i2K4JuPBSpFotX0d5mg8rRYTwYvI3x6W0Er4MxoIer8bi0dVNP0v7j5hAJ5J4n4u9UAN+O2IhyrNHjermbwVhlU+zmxX6O6kyuIm7L2geA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 12:53:10 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 12:53:10 +0000
Date: Wed, 1 May 2024 09:53:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Subject: Re: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20240501125309.GB941030@nvidia.com>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
 <20240430162450.711f4616.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430162450.711f4616.alex.williamson@redhat.com>
X-ClientProxiedBy: BL6PEPF00016418.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:7) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac56b27-c555-4db8-a9a0-08dc69dda78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SKHvXhuuQDHM9mOE5TMYDTb5N3yejzk/1isQ8Y7vW4oYwwTnHbGxcfm50BUc?=
 =?us-ascii?Q?fdU6XXpjq/sIpEW2i+1P3yf+kZ8VN64tOnxW9KJaX22Ap4vKkpd4on51Dl9F?=
 =?us-ascii?Q?ydJJQEEo8s9EY+Lq9qtcdkhOEZwopxP8u4dluZeN2InK1A6ZGb58grX8zxQz?=
 =?us-ascii?Q?t5nPMlj7G5jSgiuBDwex2VNhAOlIn5IoLfhfpfN1UHW0qgFYAZGxz0aT0oFo?=
 =?us-ascii?Q?yKoDv+rdXDLPvV/wx4yn6PSzpCZdBXs0qZzBFPJzERNRQbYBkxZuVSSuZsFk?=
 =?us-ascii?Q?h46JTInGF+scR3qHTnDo6sgSItDPuRn8A5/XEOSNBi7nI86t3KgWWmjkUAeX?=
 =?us-ascii?Q?Rab0rWnoHKY1Do+h2SoLKwhAwNCAehRM7+Ka3/82Ifbc4bZ/yZXIeJ2l2Lj/?=
 =?us-ascii?Q?VT9dVs7Njnr7HVufJx7eJ/4WrFs8u2Z+m65mPi+4VmVC0T+0P6XbagpyZHtG?=
 =?us-ascii?Q?fvbk5IdNz6cr0jopYALPXa9/T/AtgOIb0BwkBiZqQCULWVa8o9FNGQbXYxT8?=
 =?us-ascii?Q?pOhDj5ug2tsOSai8BsD86oeKsgd1l0kjGY2vOA7eaxH8n2IDSg06I7IVh8/J?=
 =?us-ascii?Q?mEpabPOxm/eMS5mCrbUjaUG6eWIyJNJQ6Z27PFnkf2Z4NUL5KO6kvNbJqPno?=
 =?us-ascii?Q?FVJwbFeSSdbermcZVhhEdA3+90/DbgQn37K0ajfGkcbtpOVQQ482GgH/cBOx?=
 =?us-ascii?Q?oeG5QkY67AQM0fgoBeK8i1LKhIYSUp9kSToOTTlH9p21naDqfy8YADrOweqx?=
 =?us-ascii?Q?1gDhLqDJE3/jRcP72ryYPvK1vHD53KRDFHR9AJJju7klgX7CBSLZUO78S3wo?=
 =?us-ascii?Q?NVvApClEUfdyGiUTcfqo6qIaiXeZ//hdOPLg0xbMcIzdgGrwgPhu3Do8BZRz?=
 =?us-ascii?Q?y3Kyh15DfYi4/oLhNTKHurLBfu5iZlnPqhLY60pQMhADZPgBj0Akis32oq7t?=
 =?us-ascii?Q?VkL3Ai8Fx2MJMwi42yy51YXKpgnAY5jQyBxbghA1PLkZg09uG+lveS2vUaVr?=
 =?us-ascii?Q?GpqerJUmftx0tg2T1lPSy8S8+jMm4vSGtQEohNOzXRoTcjSfTMMetlNh/uUm?=
 =?us-ascii?Q?26699y2+ZoQ1j+XzFniE3LxR/80/nZs3Urku5AyLPLW8rpIl5ScKDjVecQNu?=
 =?us-ascii?Q?YscTkP7nqAzO3v4dsIe+bq6CP1UZXZO7/lZoM9Dlv5ETDFUznWsorZlHtBQv?=
 =?us-ascii?Q?PKHVIKEZXUvzYnLpbJgT3lr1h9aPumBSVpjMyiva2okSJxcmnVhF55Dy3jqG?=
 =?us-ascii?Q?iDqKtaVLGzDUBxVWkWwgJZRrBgtDfJQgut16MGIxeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2eppYtYAZJYS1Zrdw/hFC/qVMuUrFinQZFN+wvI/2Y2XJHhy6lMlWpXy+f/?=
 =?us-ascii?Q?pDfFXVPLxnYqz2eqcsbmP7kVD5UKUibVCUbmP398eF1DyB12w8mGt7FS2BCl?=
 =?us-ascii?Q?nAM/no9gr0+lZF2/kvSOKZSr7jdetvW/aYTe9QParu7ZwM271BEJ3WDc9fmg?=
 =?us-ascii?Q?hHVjxOqEhFihM31VPB2jsX66uWzWUnwwGVbfwZz77t4xHV2ZGbdq986R+tII?=
 =?us-ascii?Q?2mTgn91ErNoWdFOB4qq7eeGFMxEZTFZdmoQcfiCbIqyCFa2fl0usHPB96+1p?=
 =?us-ascii?Q?ZsC5ZxfHQdoEwaivX7BxhPHXAtJZ9VmXJ/x1vKr/dU1Y2HI1eCp9QdipnwIY?=
 =?us-ascii?Q?JXxZibfatHlAQM2Qj3HH1HU8IlS+DbJlGS4GVZte4efT+zh+slO8a6Li65S3?=
 =?us-ascii?Q?jfkT7UW2Y1/bHR2orVTFnG8bxkWJsBmK0x+7vXoN6O5RjEB4aKz1lx4OJqna?=
 =?us-ascii?Q?6k9oMDiAUNMGxDDuHYthexHqVWx1h7ywXLFFvrYCu8F7RhCxqhnV4z8hzZCr?=
 =?us-ascii?Q?z6jILfSiau/rwKnJSI5ZpSHmHx5N4K82UpZ3uONul0mmrLxf6l7T/HBsvifx?=
 =?us-ascii?Q?Rla3KaiPKrH3udSF3BqtmYSoek+ArYzs5TwGDjAM8R+uqsVIbZWgZkIs75aJ?=
 =?us-ascii?Q?mMTMf07I65dhfIKZET2l9++4P13Z/gKr3ma8s5M7pcgy5KUNjN+XCi4vGP/h?=
 =?us-ascii?Q?m7jILSocja4VURq33nZ6jhbf1x46HbrvsRHH1UZ2OqeQubcr9CxUFIrSHGCM?=
 =?us-ascii?Q?LqTsXHW54SFTrdm5avzPHDOoH+g20bgqGUKI0nI/UewmRDwkNs68+vp1AJrL?=
 =?us-ascii?Q?iYlbCk44DwJEZ7m4uYMIpWPSKGzm5X4sT530i/9BQimvf0qtuWtm4aFokaaO?=
 =?us-ascii?Q?yskozPYf0FkBZFFLul9QTYYisY91NyiI04h6YqpuceXsHqvk+maVdlUoAQU3?=
 =?us-ascii?Q?AvEdn2b3o8qwHiPXqBDGJYwtdtqScQBSl60hcGEJjDy91icCkYj5gcc3NmVv?=
 =?us-ascii?Q?vRjPLKUw9lHak3tJwc/ePHWvGZEZQejxS6vYMvSSCgMJEgd/l9RFPLCJDpcO?=
 =?us-ascii?Q?elvISSdNmRofuxokBhfSht1Y+EfyI51MBkjd9eHTKcqSaIMvSQG9reDyuzVh?=
 =?us-ascii?Q?o9B05Nadqm2IFSNMr5ABI2g/mUoQCdc0QhSiMN3DE64GHPZCs7/gNyxscOPS?=
 =?us-ascii?Q?CzsvLbyMmUDx4uS7JWhJb/Ym/zqdk4Pv1qXy/Ozk0WpCa2zQQeYjYV6OWG5O?=
 =?us-ascii?Q?aY/mmp3zdRZ7gpxbOopq4h7HF3rNzVdRwyf56oqDnXv+GfvHxF75rPmimHgD?=
 =?us-ascii?Q?wgK88rb3ehjhbOpUnYjhrsCMzzJfj4A+/d6APJtmSMZ2BN0clD8XXrTV2iTm?=
 =?us-ascii?Q?Teo9DQYGeqzBeV3t8/IyCFWLEU4ObyP4i6hXW+lXWUvfLYQOWeehhQQSMq1M?=
 =?us-ascii?Q?HhPiSliqVib/frLUdABjg4a/5sjwugU+a4MNxhQXQf9NbEl399OTC78hLqmd?=
 =?us-ascii?Q?zw5hTbKrvfQj2VhzjtZpqb/+bhClSJbZu/bF8PPB80HmCmQTtefOpecTNt6K?=
 =?us-ascii?Q?0AJL4h5m2l3La5hAHfuOmQ6KdusVhdsPg7PWwC7r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac56b27-c555-4db8-a9a0-08dc69dda78c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 12:53:10.0782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAIT/ROyCUxo3V884utFdMm4uTONfZBnc0/X7HuLaiuEJKpgnhx702yNF1x+vB20
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697
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

On Tue, Apr 30, 2024 at 04:24:50PM -0600, Alex Williamson wrote:
> > +static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
> > +	pgoff_t pgoff = vmf->pgoff;
> > +
> > +	if (pgoff >= priv->nr_pages)
> > +		return VM_FAULT_SIGBUS;
> > +
> > +	return vmf_insert_pfn(vma, vmf->address,
> > +			      page_to_pfn(priv->pages[pgoff]));
> > +}
> 
> How does this prevent the MMIO space from being mmap'd when disabled at
> the device?  How is the mmap revoked when the MMIO becomes disabled?
> Is it part of the move protocol?

Yes, we should not have a mmap handler for dmabuf. vfio memory must be
mmapped in the normal way.

> > +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> > +{
> > +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> > +
> > +	/*
> > +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> > +	 * The refcount prevents both.
> > +	 */
> > +	if (priv->vdev) {
> > +		release_p2p_pages(priv, priv->nr_pages);
> > +		kfree(priv->pages);
> > +		down_write(&priv->vdev->memory_lock);
> > +		list_del_init(&priv->dmabufs_elm);
> > +		up_write(&priv->vdev->memory_lock);
> 
> Why are we acquiring and releasing the memory_lock write lock
> throughout when we're not modifying the device memory enable state?
> Ugh, we're using it to implicitly lock dmabufs_elm/dmabufs aren't we...

Not really implicitly, but yes the dmabufs list is locked by the
memory_lock.

> > +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> > +				  struct vfio_device_feature_dma_buf __user *arg,
> > +				  size_t argsz)
> > +{
> > +	struct vfio_device_feature_dma_buf get_dma_buf;
> > +	struct vfio_region_p2p_area *p2p_areas;
> > +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +	struct vfio_pci_dma_buf *priv;
> > +	int i, ret;
> > +
> > +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> > +				 sizeof(get_dma_buf));
> > +	if (ret != 1)
> > +		return ret;
> > +
> > +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> > +		return -EFAULT;
> > +
> > +	p2p_areas = memdup_array_user(&arg->p2p_areas,
> > +				      get_dma_buf.nr_areas,
> > +				      sizeof(*p2p_areas));
> > +	if (IS_ERR(p2p_areas))
> > +		return PTR_ERR(p2p_areas);
> > +
> > +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> 
> p2p_areas is leaked.

What is this new p2p_areas thing? It wasn't in my patch..

> > +	exp_info.ops = &vfio_pci_dmabuf_ops;
> > +	exp_info.size = priv->nr_pages << PAGE_SHIFT;
> > +	exp_info.flags = get_dma_buf.open_flags;
> 
> open_flags from userspace are unchecked.

Huh. That seems to be a dmabuf pattern. :\

> > +	exp_info.priv = priv;
> > +
> > +	priv->dmabuf = dma_buf_export(&exp_info);
> > +	if (IS_ERR(priv->dmabuf)) {
> > +		ret = PTR_ERR(priv->dmabuf);
> > +		goto err_free_pages;
> > +	}
> > +
> > +	/* dma_buf_put() now frees priv */
> > +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> > +	down_write(&vdev->memory_lock);
> > +	dma_resv_lock(priv->dmabuf->resv, NULL);
> > +	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> > +	vfio_device_try_get_registration(&vdev->vdev);
> 
> I guess we're assuming this can't fail in the ioctl path of an open
> device?

Seems like a bug added here.. My version had this as
vfio_device_get(). This stuff has probably changed since I wrote it.

> > +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> > +	dma_resv_unlock(priv->dmabuf->resv);
> 
> What was the purpose of locking this?

?

> > +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> > +{
> > +	struct vfio_pci_dma_buf *priv;
> > +	struct vfio_pci_dma_buf *tmp;
> > +
> > +	lockdep_assert_held_write(&vdev->memory_lock);
> > +
> > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> > +		if (!get_file_rcu(&priv->dmabuf->file))
> > +			continue;
> 
> Does this indicate the file was closed?

Yes.. The original patch was clearer, Christian asked to open
code it:

+ * Returns true if a reference was successfully obtained. The caller must
+ * interlock with the dmabuf's release function in some way, such as RCU, to
+ * ensure that this is not called on freed memory.

A description of how the locking is working should be put in a comment
above that code.

> > @@ -623,6 +625,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
> >  		*virt_cmd &= cpu_to_le16(~mask);
> >  		*virt_cmd |= cpu_to_le16(new_cmd & mask);
> >  
> > +		if (__vfio_pci_memory_enabled(vdev))
> > +			vfio_pci_dma_buf_move(vdev, false);
> >  		up_write(&vdev->memory_lock);
> >  	}
> 
> FLR is also accessible through config space.

That needs fixing up

> > @@ -1246,7 +1248,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
> >  	 */
> >  	vfio_pci_set_power_state(vdev, PCI_D0);
> >  
> > +	vfio_pci_dma_buf_move(vdev, true);
> >  	ret = pci_try_reset_function(vdev->pdev);
> > +	if (__vfio_pci_memory_enabled(vdev))
> > +		vfio_pci_dma_buf_move(vdev, false);
> >  	up_write(&vdev->memory_lock);
> >  
> 
> What about runtime power management?

Yes

Yes, I somehow thing it was added

> > -static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
> > -				       uuid_t __user *arg, size_t argsz)
> > +static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
> > +				       u32 flags, uuid_t __user *arg,
> > +				       size_t argsz)
> >  {
> > -	struct vfio_pci_core_device *vdev =
> > -		container_of(device, struct vfio_pci_core_device, vdev);
> 
> Why is only this existing function updated?  If the core device deref
> is common then apply it to all and do so in a separate patch.  Thanks,

Hm, I think that was som rebasing issue.

> > +/**
> > + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> > + * region selected.
> > + *
> > + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> > + * etc. offset/length specify a slice of the region to create the dmabuf from.
> > + * If both are 0 then the whole region is used.
> > + *
> > + * Return: The fd number on success, -1 and errno is set on failure.
> > + */
> > +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> > +
> > +struct vfio_region_p2p_area {
> > +	__u32	region_index;
> > +	__u32	__pad;
> > +	__u64	offset;
> > +	__u64	length;
> > +};
> > +
> > +struct vfio_device_feature_dma_buf {
> > +	__u32	open_flags;
> > +	__u32	nr_areas;
> > +	struct vfio_region_p2p_area p2p_areas[];
> > +};

Still have no clue what this p2p areas is. You want to create a dmabuf
out of a scatterlist? Why??

I'm also not sure of the use of the pci_p2pdma family of functions, it
is a bold step to make struct pages, that isn't going to work in quite
alot of cases. It is really hacky/wrong to immediately call
pci_alloc_p2pmem() to defeat the internal genalloc.

I'd rather we stick with the original design. Leon is working on DMA
API changes that should address half the issue.

Jason
