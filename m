Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B583CFF09
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 18:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CC86E466;
	Tue, 20 Jul 2021 16:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE0B6E466;
 Tue, 20 Jul 2021 16:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hksGAYTD4Jn1zzf7L8uSYDn5ks/XeaMEQ400Qc7NoFOswF6BciOrvZRUKlLmltWxQ0t/CUfk9pdjihZB9LJar/HhQdEdR4vJaI/hqPPovR8xjyuOe7JEpP1iouFQSIUO1Zdfvu2QvMkyVx8DpewqCU/6OtM+X1UVd7CjyV4RnZqK45lnNtTb1HaPp1E25YAYX3Sn5BPMYVHCi7EWN5OBh+fznE1d+bJASaKIQISdBakejO7IQJttT7BfzqZsWkzbJcv+6vLX5VSIvQu2Ewkvo/PFBYAkqiPcT+94YPmGP9eypuDqhCrSdBdFO2eIiI8ms0VgcSWdONpqwa5zNCmFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqPUoyds8KdUnJuCf2kr1fz19OwmfvxJeXpims53vos=;
 b=MunBjocSHDPDY6AuqzvjQ8W6h4ggvPBRzI05d+B/qRiU/sULsk+9EIdhNrA5UKcFgv9MBGxniKXb52r2r3R5W5NemwlTPZ+ZO+z3Ch9hp+vb+zIeyFiWwo6MHMgxGr/9hGWP0wPj2eEBQEoY1VAOa2ZFCcrQ73Y6sgL5HFduHhdT8F5+hi9CSZOPzYgFNxcxecU56d221pobAoJDey8LGSgSRO9RBRRMVNE6zNsVP4RZ5K1s0f8Os2RV8FvAJeB5akHejvVDTkpEfua0ZEGyKeQUBhb0U8OJTb37QAB5lWmUmXbmCMnYi2UtqLzvLLK2Pykc+AOg0Ep9RT0tljVm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqPUoyds8KdUnJuCf2kr1fz19OwmfvxJeXpims53vos=;
 b=Xyfp8iW06k63Q+JYLp4WpVQnSQQVgTcUwfSe96Ha5wnVSmgq6jzH7EnACe0KG3DkDzZYg1t2yvXf0LyWSYS+kT70YlTVEQX7BqzXQxTg8DpHYtQVo/+qJDleMRp6S64wdXq1WYVIVhZotTVBsRSsQwzDSvgsxELAg1Zjmcka9yr3LeLb3bOUNFOu9pGoUQZ85j0+KDo4I9aoMbEv9ZC3DAs2FS0KOTeHag1iuZThNwer5T4oYvr6W4OyDp4eYhsF0E6ue/Oubzfs0l7Pm3o2UFDfzl50X5y6lG27Pc+47nATqWqCAKjdfKKUJpeg5MVmHBzfuMFePPbBbGtXiuq1Mw==
Authentication-Results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5380.namprd12.prod.outlook.com (2603:10b6:208:314::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.34; Tue, 20 Jul
 2021 16:17:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:17:14 +0000
Date: Tue, 20 Jul 2021 13:17:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Subject: Re: [PATCH 05/13] vfio/fsl: Move to the device set infrastructure
Message-ID: <20210720161713.GB1117491@nvidia.com>
References: <5-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <44639398-d50f-ac6a-d52b-4e964465ca6f@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44639398-d50f-ac6a-d52b-4e964465ca6f@oss.nxp.com>
X-ClientProxiedBy: BL1PR13CA0389.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::34) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0389.namprd13.prod.outlook.com (2603:10b6:208:2c0::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.13 via Frontend
 Transport; Tue, 20 Jul 2021 16:17:14 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5sQj-004yv2-Nq; Tue, 20 Jul 2021 13:17:13 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 086f1c93-3705-4852-b4d7-08d94b99d630
X-MS-TrafficTypeDiagnostic: BL1PR12MB5380:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53809ECD44DFCCB9350231ACC2E29@BL1PR12MB5380.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I787L4j6c6r+csd7BNMfAt3o+Rr30yViIIhOYh3qhkx7xKK8ysSM6c3tZZu6NRrbjslMZQRHmyPGXNcjqL8btRSrjPf7JZXTlrwWWog7u8Bi330cNjEK6qhmUU2jX23zFFGphDj2lvQy3oNMaH2B0CtHYXIkb0lXKl8uQvzyrd7L4QRPbWS9lfpApeAT5aUebI1AXGZHu3/G/v29b80KwTfOGn7PYF/XZg6Jc6KFo+y0NfJBAwX0I3NwyH58EkExvI/DprG3ytfkU1HBLi/ip6Zcgz8cizGJUmiVh2Taqcmp/qRY/9Deal0e2/7k0FYkEWpXL0PaFCa53VKXWqxvjNpqSfPbX90vrwSZeDaRMC7OJAqQIO1tjdoH0vXjQihvYy57EUSwg2i0YGdwu+WGJV/3wKsi4qHCeeNEZDTiDTOj04u3D5foIpJrHfnuMDuJOwogukr0tf7IpAV0gmx+SoyonNU0q3jSmbyPBdrrODNHE/3I5P/ausaQREpl+ppiWMXn/+8XptsbaEH1tR0Bp8rtTicOKM917+O1fuc+2s3IvV5nghVeapWARM/S/sz418RZ0Z+SZWEaw+znUX5PMfMv1VwoJqbB0SpSztEFgItDVRGXB/qNDTpAN44m8mpHFcrPX3+3K1HQqC1cbAPGnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(38100700002)(2906002)(66946007)(7416002)(7406005)(54906003)(53546011)(66476007)(36756003)(66556008)(5660300002)(1076003)(2616005)(426003)(316002)(8676002)(186003)(86362001)(478600001)(26005)(33656002)(4326008)(107886003)(6916009)(8936002)(9786002)(83380400001)(9746002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Js7nwKvqfQP/Qi9xvqhR99D3EdDrxEWTJioa3inHFWDw5bXA/mriys4kSzZe?=
 =?us-ascii?Q?55dguNTUXmP0SbmriCL5UmfUepVkTiiGCAiM29my5ckuHeLLYslXM0xv3ScA?=
 =?us-ascii?Q?6yDm+ycK+F642vEKWyROe6bSjbxzVr4nnO8Y3VCYW1MKtNBX2FFgJ8ddAXy6?=
 =?us-ascii?Q?+Xg1rxqwd1C61uXuqwXk2/ul370XKKqUHJKbtAazUi8iKhix5g3k5V+KGGPP?=
 =?us-ascii?Q?JQ7fLQoJETbfzWrCnHEISo0zGo5ZN6BirJvOz/NbW2SMEGPTzSdojanEqDYh?=
 =?us-ascii?Q?lNNFNSHalyWNPsb3GLHYyyVKoH6TMq7KxbySUXusTWPKKyDR8+QRbfE+sP7L?=
 =?us-ascii?Q?U+OPAi5drF0KOsQNUlzN2CGkTE3eKDwpKHR+DTLf74qy+4sIfBI0EWNRz1SA?=
 =?us-ascii?Q?cGfJJ2EWdJc4V70e5wIFv6+w/tt5p5Y+q64KAdvWTv+s9wBq3lIyhxmxRJbG?=
 =?us-ascii?Q?GwwwIGb+mrQMqi4Q3IXjMmdlxULs/6mQsle4nafwmtlhVUayR/ldAPUHP8Kb?=
 =?us-ascii?Q?5zgH2vjxOxfo6MGrFAerDBkSoNWEEK8Cqy3mATp2qygKnoo+XHtHvPzqiRjS?=
 =?us-ascii?Q?0cCdrlZaa7kQ92BQ9RFrUhxVBYfoxXmCjVCQToaBQsqrQRHNN+1TYJanOt9Z?=
 =?us-ascii?Q?2WSoxpTbziHavY/FwD0IZKVRLjeZS9XKiVhGXJd07DgUTlimytWJX85JAw0m?=
 =?us-ascii?Q?p6cYzF0+8WUGCMetZ+Od+9xO3dGx3r+pKxilmbsp2SKAw3Dg3Ohr92kViJrj?=
 =?us-ascii?Q?06VYv8WKd6aDH4F4A89oyPynOLd1eqPgEm+09xow2Zsw96g/GL032UDKMiu1?=
 =?us-ascii?Q?zDoyQzSFZr7QcRgzmC2XvojdBjaUNCBX2Sulc8i+lYt0thrPor8fNyKVZ+FL?=
 =?us-ascii?Q?NNeUb8vdaQQlbv8yB7nAwXBJm0v02vWc7RH+K6P5xWZU4AVNsHkE+nmxyb3k?=
 =?us-ascii?Q?1cta2JCIvwr9zpleLt4anZJ64prfJ87j8kPxdGR9zwMl4sOIKNdBYwWfLXv6?=
 =?us-ascii?Q?fMg4ed1RxdXOq0T/pN/xJQLf1hImdlFr7JfGR6hxDujVXUWtOgpZRu2jTyCY?=
 =?us-ascii?Q?EfPhH7+or1JFbmSS8JXafdj2ht6DzL81fF8aZyDRV+lTuQoGSXOfgEfLV5VK?=
 =?us-ascii?Q?vPKEUPTVQAl0lcuWFo70HSnzFoVKRkYvQphtpNlGsX0+jDlI5jiTqGQuuT5Y?=
 =?us-ascii?Q?hDYNkIUvNCFt+8+JHPUZu7Uhpxjq/wQj3jk3znjhi5SeaUk/pU1LjAlZPTTh?=
 =?us-ascii?Q?PTYqwmaKXQF7FOMHZ0nYC2pVZKJt5bdlJTUQitlmtLSGyB8Pc7INOopppN6T?=
 =?us-ascii?Q?QtoOHl4CpFPlDuu9+YJEPKq6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086f1c93-3705-4852-b4d7-08d94b99d630
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:17:14.7551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Riy5h3ND3IsctNXgueojJbLTB89u8npd/y0lqsOai9PD9lgEYsBzE6u6pF/+wKz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5380
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 07:12:26PM +0300, Diana Craciun OSS wrote:
> On 7/15/2021 3:20 AM, Jason Gunthorpe wrote:
> > FSL uses the internal reflck to implement the open_device() functionality,
> > conversion to the core code is straightforward.
> > 
> > The decision on which set to be part of is trivially based on the
> > is_fsl_mc_bus_dprc() and we use a 'struct device *' pointer as the set_id.
> > 
> > It isn't entirely clear what the device set lock is actually protecting,
> > but I think it is related to the interrupt setup.
> 
> Yes, it is protecting the interrupts setup. The FSL MC devices are using
> MSIs and only the DPRC device is allocating the MSIs from the MSI domain.
> The other devices just take interrupts from a pool. The lock is protecting
> the access to this pool.

It would be much clearer if the lock was near the data it was
protecting, the DPRC pool seems in an entirely different layer..

> > -static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
> > +static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
> >   {
> >   	struct vfio_fsl_mc_device *vdev =
> >   		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> > +	struct fsl_mc_device *mc_dev = vdev->mc_dev;
> > +	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
> > +	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
> >   	int ret;
> > -	mutex_lock(&vdev->reflck->lock);
> > +	vfio_fsl_mc_regions_cleanup(vdev);
> > -	if (!(--vdev->refcnt)) {
> > -		struct fsl_mc_device *mc_dev = vdev->mc_dev;
> > -		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
> > -		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
> > -
> > -		vfio_fsl_mc_regions_cleanup(vdev);
> > +	/* reset the device before cleaning up the interrupts */
> > +	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
> > +				   mc_cont->obj_desc.id,
> > +				   DPRC_RESET_OPTION_NON_RECURSIVE);
> > -		/* reset the device before cleaning up the interrupts */
> > -		ret = dprc_reset_container(mc_cont->mc_io, 0,
> > -		      mc_cont->mc_handle,
> > -			  mc_cont->obj_desc.id,
> > -			  DPRC_RESET_OPTION_NON_RECURSIVE);
> > +	if (WARN_ON(ret))
> > +		dev_warn(&mc_cont->dev,
> > +			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
> > -		if (ret) {
> > -			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
> > -				 ret);
> > -			WARN_ON(1);
> > -		}
> > +	vfio_fsl_mc_irqs_cleanup(vdev);
> > -		vfio_fsl_mc_irqs_cleanup(vdev);
> > -
> > -		fsl_mc_cleanup_irq_pool(mc_cont);
> 
> There is also a need for the lock here. Eventhough the close function is
> called only once, there might be a race between the devices in the
> set. 

vfio_fsl_mc_close_device() is already called under this lock:

	mutex_lock(&device->dev_set->lock);
	if (!--device->open_count && device->ops->close_device)
		device->ops->close_device(device);
	mutex_unlock(&device->dev_set->lock);

Thanks,
Jason
