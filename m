Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293583CAEFA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B701F6E44F;
	Thu, 15 Jul 2021 22:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E596E334;
 Thu, 15 Jul 2021 22:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjzovEptQ1Kx11El65RBKQnSULZKQaTU+7AqLOprQUmJWTvDywTUFlBmK5DiqRxapCiEbODcPyWyFYbtSP/Qrr6qK7kxwA/rZndtt77NAhfjeZDzJzGsbGF08p4VlT1jVmvBF8sL1krXw7s9kfzKF50WI5oqIoWEDTpKbVPkGiXskh6MZQPYsdqehNyFSNlopBUnXGILwK8yUwJkAvOIK3mPYMjeURl7BIz7+NPTmdeeIfrl+EYevKCi1A0MEDzVMDVWrjLR0lBwT9VTpTQ9hm0l5gLQ9MdJiN0bXej2iiKcOl3zP70mPbR25tWb5X5G/Xy5zATm/q3p4QweOxv0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRa6WL/7Sz7cBATAupIJCezZXUKpeypA3CUH9nnfBsc=;
 b=PfL2BTG5TPp68wA3fC3mtu/MP5EWmKUb3Ff3PwacT+4bi5q7R41ciVo8cts1nf2wQPzHIZ2seUOcXug25sL2R+e+VN4NZO+NtA1UN5/ENS2R6ARo3aoqdrjaD8tTDEAsmTukMY/fB5BUqt0ZKEAlWfWfb+y/jxYQeA3hN0WfN1Xtp6HHCgypgiDw4NTGyyp2tnythycxGB6LTamqAeyUzvGyTEKx2PeND6uJv96yBXTvux9PEaHOdPo7bI0YRf28WZsGqFL72T3521oRlPxBrdTDNzZ7CtvAxM8hXJPMKrZKjZCou+MOumQM1UrYBOqrL6JPrMsXmT2mgOKFBR1Rsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRa6WL/7Sz7cBATAupIJCezZXUKpeypA3CUH9nnfBsc=;
 b=tGhJuuE6Knh6p8e3erQs1W7OsAKpZl1mdcbeJr+MX39n8qItiZkvkoRYCnloIzGA14waWsacp8AXpRpa1PdrDQb5xdTh9qcpSD15aDLnZaifAh1aWYviwmPEZWSY99qB08senv7ZjelO7l5zH8mziRmFNQXzp8fJgvp2Uwxy17JOsBJWcyGh3wuU/HEtAQYY4jERkq9jfr7tivsiNz2OjbTa2e9lhajxbgU1adgOEcyDLZyyp82fUcpFR51j3XbIAmy0LX7xppHGIh4yapw5U/VtmrhpmifhRPDAdMOigC7yaXtDwhayblDlbmruHVSGdR/TOZ9j5wqCDp3YbzJQhg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 22:11:51 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.024; Thu, 15 Jul 2021
 22:11:51 +0000
Date: Thu, 15 Jul 2021 19:11:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 09/13] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to
 use the device set
Message-ID: <20210715221149.GJ543781@nvidia.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <9-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <20210715150055.474f535f.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715150055.474f535f.alex.williamson@redhat.com>
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 22:11:50 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m49a9-002sbh-74; Thu, 15 Jul 2021 19:11:49 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ffc67c4-ba7b-4274-9d79-08d947dd8ba9
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB507897DF81B77B1C1F91D789C2129@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QQIHEyJEcDYD1VDKW8jMBeCzikFy01FFLn5sbD2PoSDxIN798ZU6Key7P+pPnwgiSDOFhRu9NJQngqUL7hCIkQZFEiOz0laRu2PgSebB7muJQdFnbbx2YoXRYQ8dB1ZQHqNDNDqbBDcAmOVPZYWUDVZpWWYE3UVgs1Tu1NP1aBis5MVeQfyQH5m68bGM/bAgpVJ38gKaxWHA6K1PZfzPdXAioUjjaffV8BIEs540BHyj2tXuLvoe5ulweeNxzc055nnlnmpKMwe9S8E/T2t32dXUjvHHrUboXUfmngEslGdC3L8VqHofZwHReZ31fN9VJFDor0e/jF/RJsJnD2Pn3LWK+1a0/ukaLHOSNHRD8bXT/o18K0eNyMXqC/v5mosN7Kw2A1QaWJHJxVnQACkdXMIdThZNGfVtnZY337bSRKIKXZ9HtNq1QfirM8+ICVm5o0ZxtA6RloVt3phXYSgSIYnwH6aU2EFHWz2HiKus8Y468xkxNdJIYlFBus4z+0IdZLiHeyPue3EPQeE+n/l0A4i1ohNDHFPAGGnddNlHwcoRLdWBDtC1kzSp8fylci5l6knFFDWS0r55doQCtKqwA2Ivv5OBE2lqlDW5pg2u/RRHmhXZ1krHIWVV/P+/FwHZZVtWvudQ8Hi6jItS/GdNnauqolQt705MJF+hUFefTdZfxRnBJkOopLpoZmvz0/5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(86362001)(316002)(54906003)(6916009)(26005)(33656002)(426003)(2616005)(66476007)(2906002)(7416002)(7406005)(1076003)(66556008)(5660300002)(38100700002)(8676002)(4326008)(8936002)(9746002)(9786002)(186003)(83380400001)(36756003)(478600001)(107886003)(66946007)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VyfpNAPsL9Z1ZYGGu1s5XN6lsWuAZHOHZdIHseT0JRJB7MeSP66itwDLzfsr?=
 =?us-ascii?Q?Pm1Lh+OewfF83bk2nxGUl5Q0/g9mAysf6iAVXl5s3zhAUObAL/f8zpgen2oj?=
 =?us-ascii?Q?rHgBXzbbAIREtEqusIikEubn3CJ9CO01THUzJfk/4KLGgJjjGnk471Ay61Xw?=
 =?us-ascii?Q?jSMgHaLZG2y6aobi3JQxGeAJqktF050A8nwXz4g1b1bMTnzaaIUAo3g1mF6a?=
 =?us-ascii?Q?44R3QInZNYiArXPEWrQeYJxobKpUsH4PPpjLDaITzvvUURJwH7M1ukDa/JzJ?=
 =?us-ascii?Q?JOvlkHsBwVMEPQY9OyibkDtZKYR4CzsGpTxw9v6/q8aXEiWO6PBhm8u6UTom?=
 =?us-ascii?Q?NVBzSRRkTg+YWwsr3fUOoOJDPUvZ4AWrZkLmTNenZFkqRIntOXHDUkIPktDJ?=
 =?us-ascii?Q?4NLfpFn40ETgsuYTLfQFg0Hm77c5PYHq8AYJTAnJTC0ItMq0SrT6ExOlV4sB?=
 =?us-ascii?Q?J8RJ5SLCiUrx0ylIdruATsHnHnVskcbuah2fDbi9BJG+U1xDutErflqc9uXQ?=
 =?us-ascii?Q?/U3E4+u3FKy3tzSPIg4bttNBxzMyOt24lJ008PttHb2gvmSp/uOjQPdOyZXL?=
 =?us-ascii?Q?SKc5SQui/hNil66DDWVXI2+hk4VfI/PPp7SaGOAm72m/+ficMyztSu1DRzO+?=
 =?us-ascii?Q?a8ncsgwvkSJhdlKbiBt7fWiV0CNbXsSrMwOMF1is4syotSw9DgAfbiw9nxnd?=
 =?us-ascii?Q?x1Hakiz9qVrbJQbJov0mGrAQiEaeQpaGGcg4ZFM2930ebGXqNzPNN3Xggulq?=
 =?us-ascii?Q?7Y3GfKx1wRDXH91trUa80yOHsg4/QrkSElhg/TJyhiilPzGuZZMwzWGqXLvR?=
 =?us-ascii?Q?MMMYI45DibKjhgaIIZgmv0h6On6HWnkKdF43FIdVh1Myc0i+8JX6sOOs8Jh4?=
 =?us-ascii?Q?gomU19SEcf8yBykrbt50fiK34a1Pz6kU0n/3yEGRoe4w79KUjWUfJfk5fC+Z?=
 =?us-ascii?Q?ajZUbkhIDqzidvtUEab58CJsq/1Sh/3WKaCkjrEnnRlQCJbghgBY+YbpK8aK?=
 =?us-ascii?Q?ZucS8/ySENap8di4jBDpNT0LjRVTG7qJMn9Ow711HpsGkb6kNjzDa1zGTgx3?=
 =?us-ascii?Q?HNjxiB+KeT6gzrx1axvvhuwgRx6At92hvMYeWO/5w8cbbzIDNuFKu4mqad9H?=
 =?us-ascii?Q?SuKfL408BoRo5BNBx6bD4zyTx/VFTNXnOA/YLbOiw7AokjNZvCeWPQtf014K?=
 =?us-ascii?Q?AI8z+Rdif9cGEsoUPI/+gekBZWUCHQKNOytJAhdXN3HZkl6LDKpRhSuQMMzV?=
 =?us-ascii?Q?tjSx8dlAglm9WlOLuSocycrymuwXewkZjSMj6yJXuwNmyD2KcDFX6dso9d7Q?=
 =?us-ascii?Q?ma++UjY05SYI9qUWImpXPC6A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffc67c4-ba7b-4274-9d79-08d947dd8ba9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 22:11:51.1326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cH4AuLJO/ysHm0qh5ICYmLCC9C0V3Ngyrpv61JsVO6E2ZE3NUMdG7xxBY5h5S0W4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 03:00:55PM -0600, Alex Williamson wrote:
> On Wed, 14 Jul 2021 21:20:38 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> > +/*
> > + * We need to get memory_lock for each device, but devices can share mmap_lock,
> > + * therefore we need to zap and hold the vma_lock for each device, and only then
> > + * get each memory_lock.
> > + */
> > +static int vfio_hot_reset_device_set(struct vfio_pci_device *vdev,
> > +				     struct vfio_pci_group_info *groups)
> > +{
> > +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> > +	struct vfio_pci_device *cur_mem =
> > +		list_first_entry(&dev_set->device_list, struct vfio_pci_device,
> > +				 vdev.dev_set_list);
> 
> We shouldn't be looking at the list outside of the lock, if the first
> entry got removed we'd break our unwind code.
> 
> > +	struct vfio_pci_device *cur_vma;
> > +	struct vfio_pci_device *cur;
> > +	bool is_mem = true;
> > +	int ret;
> >  
> > -	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
> > -		vfio_device_put(device);
> > -		return -EBUSY;
> > +	mutex_lock(&dev_set->lock);
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^

Oh, righto, this is an oopsie!

> > +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> > +		up_write(&cur->memory_lock);
> > +	mutex_unlock(&dev_set->lock);
> > +
> > +	return ret;
> 
> 
> Isn't the above section actually redundant to below, ie. we could just
> fall through after the pci_reset_bus()?  Thanks,

It could, but I thought it was less confusing this way due to how
oddball the below is:

> > +err_undo:
> > +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> > +		if (cur == cur_mem)
> > +			is_mem = false;
> > +		if (cur == cur_vma)
> > +			break;
> > +		if (is_mem)
> > +			up_write(&cur->memory_lock);
> > +		else
> > +			mutex_unlock(&cur->vma_lock);
> > +	}

But either works, do want it switch in v2?

Thanks,
Jason
