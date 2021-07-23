Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02883D3A17
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 14:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DE86E049;
	Fri, 23 Jul 2021 12:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94276E049;
 Fri, 23 Jul 2021 12:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q23C+mhL2A5NJmZ89u5idnNTNT7/w4tHBl6bLbWv0cL+Wy1WFY+FTAFOnXaBxTxXjLfDd9eYpvdimkC4Xwf2VHbiWioRZxyxAyfq1Be0UlSTiIGXV1mQbcWObChBPR/zwXqw38vvgXA4/hU7m5JkFhS+ChiOz6rJE8lrVRJUH+FYmGJ99oTN1LgzxCow2R1Jwoez6roTY1PSBdpXcUjawywANqJ9Y+jCc0aUgLFDLOm3LBVKHTPRHxvCmi7K84OgiSY8yBC31nFz069W6C5uL8jB+6gw8I1zJ9u8YnEZCnceseKFi7TYVvqA1GGNQSSDEa6M0VRiiJ/KGxeByIsBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGgar3StRWl88lp0HD8kv4QSlWMmPdjMsaovB3KoMDw=;
 b=ZW8eezp09DME/YtvGQfXYS+Ou24c/sIocLG+5Kzc9kA5MYqQ1odXlimqtkj5uH7874DqY48QPWx8gLrxqkrDgg6irv2vrLuT3D6Qc8UGxzaotBG2qU3C/QU45eWO1aLDpT8Nx6hF51gpRRBoGiSYhh2rFDFh61fgqPiVfrH8nI1AhUHFatFnBpq/8SLWVMBTM2MTVt8XL0243eV+/ENsDBpBXp7RTYXdUyTzzP+moMRevge0OXOuH+8p3zvDGnSp45wEUFNBel6GPfHAUgLDXDNo+UHFAm19/YHGvJvEHnByQobCTDOpGjPnFDuYm/PMVOvViysQlisiRr8xoNy3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGgar3StRWl88lp0HD8kv4QSlWMmPdjMsaovB3KoMDw=;
 b=nqW/6F01k2LYKU5gKDYNEJsazJZIrOg5iThOw/KtKyqhYbDI+2GsUcMzJ4uW6BEHvmW1Aj+j4NtEG7oUhPUsIKRAd6ISwP8mOlJO96Z6JUuuup4GcdzxrSj+Paoc0b6INSa/SnM4NgTB+iC/Vg+kyH/sBW+nFbOgPIMvxx9eFQDF403X6LkqFztCiN9c+cnnFO5CsCGbJ9tR9ryGFc/w7dQr9fxsQ2RO/P4Ay18k9Juiz542sWStS0P8RGCsaT9JqT8AVFpYvKDTl7CC7QCcBmHAsDZ/zs7k04URWlfpUsC6TlXIbW9fzTGgz5fHObSN0g5zFSHqWCISkK6+xeDR8A==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 12:22:29 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 12:22:29 +0000
Date: Fri, 23 Jul 2021 09:22:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 06/14] vfio/fsl: Move to the device set infrastructure
Message-ID: <20210723122227.GR1117491@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <6-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210723074435.GA2795@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723074435.GA2795@lst.de>
X-ClientProxiedBy: BL1PR13CA0341.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0341.namprd13.prod.outlook.com (2603:10b6:208:2c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Fri, 23 Jul 2021 12:22:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6uCB-006zR8-JQ; Fri, 23 Jul 2021 09:22:27 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b65a7511-5375-4a26-43d0-08d94dd48998
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55545F97DA540DBE61424CD1C2E59@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3jlU0+ee84zO7ClZzvU5D1YWgHO/KJWh0DKyLBlA/HVkea8bow9PICKRq8ElDU/WDBjbD7Z8zs26Z/7u4yO494KM7nfvwmqudZG/bqTmTZRY+KczJajE609t9ylC/7VRKsVk18PdF81+DYSX74Z1R+hhL/1gywxBiAFcZLUq4FoN1G3UUmN+W94eITDTTq8j9jKjaNZMYrGGPyZnU1eYYRQMy708KZFI547WX6Gc+dAQfb9YnE+6qMEOt7NEAVG+FlKAIVPgwnXXFPn/CLNUyHCxycOEBi7AQZIwGkmzoQay23fzD0+lLlW1ZXZ+orNwViTKtBc32T0p0ELWSX4i5EhbqFr0X7cfBVApKd3PPIFXVwfqwJRp8Jkvs3oNGY8y+41rEJlLRnZHQxZygR8oEKyms3pIFq1tIwjtxNDpLKprwwUjwYCv7JnRVVDp2Z0gv95UO7p3Ya6H/Z0of6vmtRSpsvfBAptzcH92lzaUlM9mXkSgk56BUuC3IL51Vdq85wxqChw1fAQ90G7If5/+gAHYmltQRPrc/Zvke8ttHBq4VtRhHAeI6lNTuwrGBEWRdG8170Hc8+Cwm1cY/8odMehjWTOwRkvg9q8SJQiTG1YDg84Iba69BFbIcTPDNdO5SbjyxtCuD1GLLjwffStyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(36756003)(38100700002)(86362001)(33656002)(66556008)(2906002)(4326008)(316002)(54906003)(426003)(7406005)(5660300002)(7416002)(8676002)(6916009)(8936002)(26005)(1076003)(4744005)(186003)(9786002)(9746002)(508600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?euhHZUgK2kMTwaLNMblgqh7YptTB0b8FZjZgQ/4Wm7bPhJYGsMKElIFaryQl?=
 =?us-ascii?Q?11uMUf6v1L5stmf1cd6gCh3rL4jsGkutEcSsuKfJ7GA7OpMnm2v5omS0OK77?=
 =?us-ascii?Q?ffRV26eDNYA0bemrMxpSq+hctVtZhSGcN04sCDM1MJHkNEUXCuJdgsXh9AvC?=
 =?us-ascii?Q?luZnK1/2U0k9IB+TJozuo/3zp91ETNrELEU+I9zKYkfeuh5vNhD3Rw/A+DJW?=
 =?us-ascii?Q?4b7YHuf6wC1y7akAYxElEykjDH6c+KVBKSRgB533WgaXJ3eRlnffHuqlMUHj?=
 =?us-ascii?Q?FhlihMkX5fS2V0e7urRUhP2fF0qQk5YWk6LvvC8vDlrRHfkaMPyGau9fjcOa?=
 =?us-ascii?Q?qAWvhbcBY2kfv9f+Og8Ycdg+rRQaPeH3/BRFS437pz00wWpWAd9MKZb3XV3A?=
 =?us-ascii?Q?gDyeyJwX6Jh0VczxKdrGYQtG92KgNUTFH2Y/D3Pl9w05w5tTzfzM/xFZlnKS?=
 =?us-ascii?Q?ejTwtCru/O/eHafQ1y8/4n2OacmUEWnIr5yK8LCg8vJmdvqKUx/IUgSYEqqf?=
 =?us-ascii?Q?fITqxIVWHAcoDn418eWF0tiiveWPW0mSv0duIjZpTJ6doobv+m5KJM4Koxxz?=
 =?us-ascii?Q?jr0BuCJQVqVGQADH6Id2gMZcVvtgz1QnF4L7J3TdtGxMzlp5zdDQdakREz3s?=
 =?us-ascii?Q?IxOnQbOzjc+a7zS8BGFdcXhYiG5XbS1be4p1MYA/ttcEEahC64jHX9i2Vxoh?=
 =?us-ascii?Q?EBit+sF4QnTuyjdgSQ2nKCEDnqZAwtUgcxjEbnYxTB9BCYTmsl0I0wpvVhaT?=
 =?us-ascii?Q?023gTmElLPpmV6ICtf1PzlKNXDoP+qDstnEtlaY+aq2j/qRMsseMzxA5sA8D?=
 =?us-ascii?Q?dupn5Bj2ktKxBJSEP3zqMXqu6QJnw4kf+glpGeNqJ1KyAvGtyWbR1EjE+Sno?=
 =?us-ascii?Q?JyVDsymbOYVA8fuQtVmZgQGxVe8d+jKlSrtL+NMQmBjhOcy9YiseFsfaDvqR?=
 =?us-ascii?Q?upfV/9PcMD/nPicjDRTB4loA9BN171JLSdegLsV3B6bDIQVFkQMrg4yVXe3Q?=
 =?us-ascii?Q?+fo4Sgk/uw5NR6IYCQbATmCBzH+PrllifwlEodKBjY/zJO6a41jzLn8riGLP?=
 =?us-ascii?Q?7qMBkppx30awfO26urjyQJH639q8NUiffeCa9G4mLP6BLAX034NuVUiLpaaX?=
 =?us-ascii?Q?pplisbCg/o1/U0rPq9mSzOgh9OGSn8svmhULSOm3TRd5c/9HZRzgtZthcDv5?=
 =?us-ascii?Q?rVD9PA8TdemSpmoLhCo64psgU39/JZW7NXcS6kuvfTe4EIpEf+uKjdUNYFyV?=
 =?us-ascii?Q?MMY9crTDqVj/m8wNyElDVdBvbX7I4xYMF34g0+FRjFg3wD0aNmmd6YJfgs1w?=
 =?us-ascii?Q?HIaFLqgUDnnzWk9zu6N9uHaQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65a7511-5375-4a26-43d0-08d94dd48998
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 12:22:28.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZwa/tMS3yqxL9UuzKhp6yDmrXc3ALUGSdizqU2D4iTRbZAcABfmVvYav8oxlFqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
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

On Fri, Jul 23, 2021 at 09:44:35AM +0200, Christoph Hellwig wrote:
> On Tue, Jul 20, 2021 at 02:42:52PM -0300, Jason Gunthorpe wrote:
> >  	.write		= vfio_fsl_mc_write,
> > @@ -625,13 +526,15 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
> >  	vdev->mc_dev = mc_dev;
> >  	mutex_init(&vdev->igate);
> >  
> > +	ret = vfio_assign_device_set(&vdev->vdev, is_fsl_mc_bus_dprc(mc_dev) ?
> > +							  &mc_dev->dev :
> > +							  mc_dev->dev.parent);
> 
> A good old if/else would be much cleaner here.  

Ok

> But do we even need the else part?  Assingning &mc_dev->dev is
> equivalent to the default per-device set anyway, isn't it?

Not quite, the default is this:

        if (!device->dev_set)
                vfio_assign_device_set(device, device);

Where 'device' is the vfio_device itself, the above is connecting to
the struct fsl_mc_device.

Thanks,
Jason
