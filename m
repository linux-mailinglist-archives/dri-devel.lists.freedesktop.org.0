Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2D3D04C7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19646E45C;
	Tue, 20 Jul 2021 22:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5676E3A0;
 Tue, 20 Jul 2021 22:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0xx9U4ljDSuzVXDf2FTdiFzD2n27NxvPtp2YWNMavkXnHnj7hvTfWP2AjD/Q2gzVGLJw8TlONYPjZpeF0w4VX19BuwTELl0kbZV2QKMbTrP8v6vP+131d13dMa01ohDrh7GMkPNP5aYi+sxOhlcD5NpztWpIl2fS7Oy8evgbQ2wiG0p2NlkoIAyEn2v4BbwidKGgZI/JpRb4AR6yM8yqIQb22G51vEoIcPXDBptdpz5RBRZB86+WEOviunJkdi7F402+dlwAa5fLgMuDK/eBe3Qb7hyxxYkqdQdrCd5iJcT3EK/OB6dhYmYTIB5jru2rTZHwPS1atcfew4ac/rVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEzZa841vkeBoC2mxG/NMGrzpkXdRWDE4qhF5crkf3M=;
 b=XAzQAR9ug/xqBMGerkJioTYojxTvtzDv6ENn1CEzmvDmKGtU2XjOrYYCDONmE54Bal3JEWqy0z/r8rj8Mi4EaOVUDxS1WW6Rwlw54V74M0a2HNpUzxGFWvtwi5RWgLdibKWMNcSv8ePO7ffa82HCwfh7NS/gEyujSQWbeu4U3dg95k9kkaPF9/qNysHbzY3n2crLNGL4p0O9VJpebaUCrP+Q2bLIGsKm+Pr0h4Am+lEElL2ef1k73Mknxnvf4/mmh0gjw9GVE7UvEy6Oxm6DbRWD9fdfCzYUO9axEElrnQBUNBIw5YuWtV4efzU1kTQ+M5yGpbg5l4HqHrAcBYMSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEzZa841vkeBoC2mxG/NMGrzpkXdRWDE4qhF5crkf3M=;
 b=PQF0uLxHdqWTKdmgDzVnbX0/VGjfFrkW//h6oMm8zT1SdEefOrEuPiukiM8kHxCHQ5xKCiRLr8KdAXBHOa78wTZ7nkap83xGfW96DQyrv8jCeSewe+jOTnM8VOKoZayNXLrhapzGCqN5qrWA6kgG6Uum3wA0HMadyRdQNOG8QtXSOAeaXROexODKJ1I4wY0lcZA9y1317Jo5X1zDzDyRGICZPsoIpwlSHgQH+7pAwjPuoXbD8j4skIKp7SWw1quWNFYJADoq4CWk5ZSqvBdu/vYqsLT+e2JCzwtOhgAGy3HJScYLpxTVA0X3vGutorwQ1y0DZiiGTKisN1DvKT9HPg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 22:49:56 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 22:49:56 +0000
Date: Tue, 20 Jul 2021 19:49:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 02/14] vfio/mbochs: Fix missing error unwind in
 mbochs_probe()
Message-ID: <20210720224955.GD1117491@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <2-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210720160127.17bf3c19.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720160127.17bf3c19.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::12) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.14 via Frontend
 Transport; Tue, 20 Jul 2021 22:49:56 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5yYl-005FvT-GW; Tue, 20 Jul 2021 19:49:55 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e149845-a2b7-42d8-af5d-08d94bd0b215
X-MS-TrafficTypeDiagnostic: BL1PR12MB5093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5093002E4432772CED8815FAC2E29@BL1PR12MB5093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izSsyVeA01tMbZ9LxfYyca9ju7t7qPT/SkFHz/Sl0j0wKP5NBy8nDkxtafo8429B/Y0wNYvUICYKaTxHoQdA1NJcBby6XHhWMn8pGJ9rMylCPz6iykqD5nia71KHek2r0sPQwcdodrpQnm54LMoLR4Iqn4xW3NZEChuQNIJjoHctj2TQ9abMFzvAqxkarQQLrQdTtZ1f+AQ4yiSdpKkLdKS1Et/SzKX3TctYq+FIsbArOTLv8D42BZDcCFV4SM7Zg9o0XjTLvRa6WqRfcI1cnZw3LUYJ6iRrGpsiRBlF56vaDzxD5X6nTdBo7y7+i32YROH5DZKrIY/5V7W2r3viiTI9YQ4Q08iTtWMU43BVKpLa4dBYL9xqYuLMTM8qVJTv/pOKAr0J7UX4Gd0VhO16nv/IDsuccoyOP4/wPcuMDtCpNXDwDIQEmoz6hdK2Pkw8f9XB25Puj3kNocWO3zvnvYwFldMmvg5Wyt1Rg7WQe1aH8GKgGNUlQRuoim39JkOhMa6xFrXoGI59w1fcKzqr+aXHq4NlRQ0lDJZR2+X7WzoTJzLrx1ivQ0RnaiIHfwL5Fb4yguggRwmaIFe/V593BAVjKzszlGP/2+qjDzxxQaoXYm1VodLWt1yELsETM98M1YlWdSWQhyVKaONLisjf9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(7406005)(7416002)(38100700002)(5660300002)(36756003)(6916009)(26005)(83380400001)(2906002)(1076003)(33656002)(86362001)(9746002)(66476007)(66946007)(8936002)(186003)(8676002)(2616005)(426003)(54906003)(316002)(66556008)(478600001)(9786002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6voRhEnl9cUve/9Gf1xKFyVnrrkcTJ4oDBhyDqSDt7lsc5PSA4jjkr7LpshN?=
 =?us-ascii?Q?+wQVlZDIS9g4lVJyMDwGJefYZtKwZzmNVLfbfdchSoEpLWtDy+bbKznKBvNf?=
 =?us-ascii?Q?E9FwIAz7m+WEvGJdxynxA1/z7N8G0RukAP3EkGZzBxMPJcIJWuFPacos2CVF?=
 =?us-ascii?Q?qju3nzfAJvjKYQ/1a9aic8GlXjSOUZjKJIqL1VZnzx8oZ9bBwPIYxdd+rVPB?=
 =?us-ascii?Q?on15VU0srb85L8z6NaV3K5mhfWWSiD4u1BCQyBqQH51vYA97ydYSYX9jWRjD?=
 =?us-ascii?Q?hmWne5HKUNR8aTW4VHTjb2dZJd71LS8Ny428xlTQPRhirvpS3T3cRKqGc4oI?=
 =?us-ascii?Q?YDH7a/dY0dqqprEYCVZ6A5z8NAJZy4Q8IG7nJA/JGV+Lar9ThwAjUTW1FFvh?=
 =?us-ascii?Q?c92jhU0vzSBsdiUlDNYIs6yxe8icGAbuFupfqx/5B8QlR+pLMvGaoL8/gktm?=
 =?us-ascii?Q?cY0AZqXInkOwo0CuVQdqA7L8KdBjBkzTHwr/wl5DqbFuFYbg4IBRHLMZxwmb?=
 =?us-ascii?Q?OMfF/B+A+quWw23i3f7esRX3UAxHewCsv/svoaZhA9iwphv+cjxvkMPLFyna?=
 =?us-ascii?Q?WKfrhwa/QUBbTe+86rnX+5SyPFmqNq92veAapAccPw275yS9sXg9vwjBZ1kn?=
 =?us-ascii?Q?zLI0ZMxggWa8fcynWAv8W+U6otLDzyHD5cQ8scwaZ27u69awlz4LEenajPgn?=
 =?us-ascii?Q?Ooi7BAfMcflsQyfBOnLOZtU4L20bQhY0CIcHkEWVPZj13TWC4dcX6f3qiv9j?=
 =?us-ascii?Q?lWEUMLbbUwQGxR/CkuVyb9d5P3MuFgEHeaYjh7A/2kWkAWIEahvzSUx/9641?=
 =?us-ascii?Q?kqsTqAQ35e8SQ3XzH88jWbkMPKmks2Cmd0zdFuknvZZhVpfMJUwUD8zWRmqq?=
 =?us-ascii?Q?PJN75d/9nI25OIYPUuFy+uSg3EyfPqo0AXcoOqxIEccPCiBKoiB2AYYNnjwb?=
 =?us-ascii?Q?njUlquTXm6pkBH+7h/UeU3wZCuJRZA+QdNLtALmEl9DAQQkc0DIQJ0t4RjYz?=
 =?us-ascii?Q?pM5R2SgvB2rm7wrAIlBDr9tuK9J30AQ6TTcZSVEWQQV3E0GxS3IZStRXfXZX?=
 =?us-ascii?Q?qI8MqMvFiIli2Wc4O7ddKLakfzDvlfxslMsoggTdEwX0mPU3l2cuvhrQrZ7W?=
 =?us-ascii?Q?XhTv//1jG5jWlifFq/aHqN36tGi2wOHYONG+odN4J5H7fgLWatyG+F191ubE?=
 =?us-ascii?Q?oj6RKX6F0YZYWHtTpluSv3ouuJ+x1pasNijJVr+PBuGI+eCuE8UTp1LSH8WQ?=
 =?us-ascii?Q?gWOAMmQho8GCg6ALW8Jpkcw7CUlW/s5QPB5jLrBvmn4js6qAQ068jcbWC9ef?=
 =?us-ascii?Q?ZZT4Na8XCekWBOlDVgKslBSs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e149845-a2b7-42d8-af5d-08d94bd0b215
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 22:49:56.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ULIbNaI/rq0lQXSR/MjpYJwcaIUYXJVinwrAmjUEfjP9jIiIHwD3CNeQ2gr513w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
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

On Tue, Jul 20, 2021 at 04:01:27PM -0600, Alex Williamson wrote:
> On Tue, 20 Jul 2021 14:42:48 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > Compared to mbochs_remove() two cases are missing from the
> > vfio_register_group_dev() unwind. Add them in.
> > 
> > Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
> > Reported-by: Cornelia Huck <cohuck@redhat.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  samples/vfio-mdev/mbochs.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> > index e81b875b4d87b4..501845b08c0974 100644
> > +++ b/samples/vfio-mdev/mbochs.c
> > @@ -553,11 +553,14 @@ static int mbochs_probe(struct mdev_device *mdev)
> >  
> >  	ret = vfio_register_group_dev(&mdev_state->vdev);
> >  	if (ret)
> > -		goto err_mem;
> > +		goto err_bytes;
> >  	dev_set_drvdata(&mdev->dev, mdev_state);
> >  	return 0;
> >  
> > +err_bytes:
> > +	mbochs_used_mbytes -= mdev_state->type->mbytes;
> >  err_mem:
> > +	kfree(mdev_state->pages);
> >  	kfree(mdev_state->vconfig);
> >  	kfree(mdev_state);
> >  	return ret;
> > @@ -567,8 +570,8 @@ static void mbochs_remove(struct mdev_device *mdev)
> >  {
> >  	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
> >  
> > -	mbochs_used_mbytes -= mdev_state->type->mbytes;
> >  	vfio_unregister_group_dev(&mdev_state->vdev);
> > +	mbochs_used_mbytes -= mdev_state->type->mbytes;
> >  	kfree(mdev_state->pages);
> >  	kfree(mdev_state->vconfig);
> >  	kfree(mdev_state);
> 
> Hmm, doesn't this suggest we need another atomic conversion?  (untested)

Sure why not, I can add this as another patch

> @@ -567,11 +573,11 @@ static void mbochs_remove(struct mdev_device *mdev)
>  {
>  	struct mdev_state *mdev_state = dev_get_drvdata(&mdev->dev);
>  
> -	mbochs_used_mbytes -= mdev_state->type->mbytes;
>  	vfio_unregister_group_dev(&mdev_state->vdev);
>  	kfree(mdev_state->pages);
>  	kfree(mdev_state->vconfig);
>  	kfree(mdev_state);
> +	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);

This should be up after the vfio_unregister_group_dev(), it is a use after free?

Jason
