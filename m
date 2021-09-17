Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4E40F851
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035186EC6B;
	Fri, 17 Sep 2021 12:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC556EC6B;
 Fri, 17 Sep 2021 12:51:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKdo1qyUZpBNpdy+0dTS1JitrLsNyMP6c6Zx0E5X9ef8V2Psx0b3DgJ5/DRwZJtCh6MhW6CVFFwz7DfORnjT1Xos6Q7VqShpZzCzWnYVLUYbyQTUMfCLCXkmrsKFb4pcB3Iibl49TFSNKOPLqwHNaIOk/uilL4e9wbAzalxy2lCelRXM83IqxobydnljYakS/kPVouzXtyDyIi3Fm4rHPwAYKy1ndLiUoe7Sjl7dbFQlS5SR/sX8w4ezL2AhSGP2N5mRO72yv+kaOwSw07VT64r7wWhLUZVd5rT5ZkZSruOoaILmWOVYJ68eyh1bU1akNioasaz9n86F9u8hDXvT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dyyZGHjXktmTbel+r8nnOW3wp19JjPu0VfBJTz7A4ZY=;
 b=Z0S2O0O94rI+FeHnwqDTgeWY6JJq400ftR7IojPaqOq+AAnhD3I9CmexV6aVkzaZT9vnjAtOqVKt2b0v8maV6HVf7ZojoArFVeIgPTOMwlFeKasZaU0qy/uvaFXmC1P/nTSdOaC4m2JV/XW9TLu0HZXmrPtF2Ae9dpVQ7mT8OeFpAwJKQGoL9Oh7WCgagwSjc+BWzo+swC0tygxn9efWhrnN8Sg7LDd075HcM6hAzBpblvzh1c1BEHEP8ZSVIy6+9Rsmp814KFp0rA5KhCLTqoy4cWc8Be9vIxY1DgVPLDOCKyhceSuXmuFCT5wITFTExJ5QxHByiZcDesaZuKBOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyyZGHjXktmTbel+r8nnOW3wp19JjPu0VfBJTz7A4ZY=;
 b=kqEJlpd2+2aovEhCipG3LHPIsFyZLesyytg2Xo/fuU0gYMD1ErvvzJzRU64+7t576UCYAWlziw1Ul4emKH0Dur44LTj0e9I7frN8KFeb5A76Gqa57GACMXJWMelsg91vBDlHjLurENQNk2LKnnatDU7hAswyhoqj74/0LCCRdVIy1zLWp+1VaPo1wd1Lhl+nEqywiKbzwP4oH8Qw4XFyrFmqsBoVZQwkzf6Ve6gep23kKzVaChQa2SwI2l6eJOtavNhJxt+CmqHMgB3Ec3PERg1+lusfGpKreCJ5MKJyUKNPusbikJpgGOdcAyOwjxTFPcnhQxj8Bht75OMVGvSyxQ==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 12:51:10 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 12:51:10 +0000
Date: Fri, 17 Sep 2021 09:51:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Eric Farman <farman@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
Message-ID: <20210917125109.GE327412@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
 <20210913192407.GZ2505917@nvidia.com>
 <6f55044373dea4515b831957981bbf333e03de59.camel@linux.ibm.com>
 <20210914133618.GD4065468@nvidia.com> <87h7ejh0q3.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7ejh0q3.fsf@redhat.com>
X-ClientProxiedBy: BL0PR02CA0106.namprd02.prod.outlook.com
 (2603:10b6:208:51::47) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0106.namprd02.prod.outlook.com (2603:10b6:208:51::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 12:51:10 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mRDKf-0024Rh-5C; Fri, 17 Sep 2021 09:51:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c86e99d7-0a52-4545-5779-08d979d9d2e1
X-MS-TrafficTypeDiagnostic: BL1PR12MB5125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5125EE197A1EBCAF16B4CAA2C2DD9@BL1PR12MB5125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MYs0xyX/0zhsiIG1UDx7pwCePmSNsDxrG00I4ytYtFlSga8xre1nLXDIOvJp/IgxNUF4ebJu/6IK3enMKJI72NEa+9pJKa8I+YCuNSVw2me7fhjFjuvf/zuLbXxZebKEj21L8WB0nHUp6Q7p8YAx9utWjzxgmOikF+uSKl2utreUWkyfEqHVCZisGXKGMAC7JbKKEyUyn77JszEY53zJpAQaFJb4Zjdu55yL+VO7s71cBhNt34ccp2Z9nlVt7C8ikUWH9XcNgOYjvtr6GmwJJKu01N1EcLZIDyg/73siN2TYa8q0MIB4Pq6/E5UBBjeJDeeL0dH5J2BiBIWpfWTI9rMP/HpbplC2MXP/gmNJxlUHtk0cLFIox1njengGp0eW+Jg7xD128DYd07KbBdKtjkem5sp0BIQQUiDS+RNbBuplimLS44soy2nPcNp6ZHJh0e6FP8nOlGYZeZay9kku7OIPwe1p0r7UrdgkcVZRlaYymFKxRyuCCILpeA+v9DH/mx5NKxIazZHK+PVlaxhWe8eh8UZKRS9e2fpMNV2qv84oxVjcYY1vqqRpGSMxcF5sZX3+jHXlZOXpEURJ54s+owY5EMpt3ZDcviUp4HJQgRFhV0QLqvbFS0Zz3QZlkSgaScpqwafg9nLBsfvcxZIQlWKkRb1CYJjVoLxLEaxnIaOA+1Xx/ATxAMMGhn6kiG0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(36756003)(426003)(1076003)(6916009)(38100700002)(8936002)(186003)(316002)(54906003)(2906002)(83380400001)(2616005)(33656002)(7416002)(66946007)(478600001)(4326008)(66556008)(5660300002)(86362001)(8676002)(9786002)(26005)(66476007)(9746002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvOMimYqEO/wydYEW5TcBDBRdDfDgxFDYvQjLnvt0/ntb1ndWlVRLiPQm0+k?=
 =?us-ascii?Q?l46/qsp3xHIPBxvjBMD3jR4s3Xua4WVJeUL/G7B0TF61OvpwCVPAJK9O9u/w?=
 =?us-ascii?Q?VmEmPaTo5LgLSXGMjeNUx4fBSIUSqtEkM8QOpoEjqDpFcE705CJL/A4fmAeC?=
 =?us-ascii?Q?N0Rju0h0O7RxfHRcWYpQ5CSWWRTaRJ/pev1IHmRsslX+O3Xlqx4edHvK0bIC?=
 =?us-ascii?Q?ok0wz2ECDPvHe0TNkeDDYJbhE3D5GOQD2ZOxQph+/D5WSF8BquuecXMTcKKg?=
 =?us-ascii?Q?5ggBTCbeaKBv4pMCY3BpivFlOfzdtd9S3I13hA8xaUfkoYSwvD9Qn9C0PdbB?=
 =?us-ascii?Q?4nOwfQxAISg5FPbn4/wBWlx5bqV1t8ag5jgxYv9KujzwJcM/GWAUtzDmYONg?=
 =?us-ascii?Q?zlNBGnsECqsOVU/a62YgUn0NmEC2HWaAByHewEhC0gQGiBKRYjDtYaiYIyRw?=
 =?us-ascii?Q?MrH6RWrfQJnkRZ7ZS/HRPdyO8Y8DFvPuPz++KUNH1HWtnpw/zfK25POVKLdM?=
 =?us-ascii?Q?1zQBZ3VsRFiSA0W1atuOkaraawlgcexGo3PLGeIR/HKGCPlmN59sNGIJf62V?=
 =?us-ascii?Q?1AdVQWkdLBStaIzhMWGPnAaK1ze5jiV752RmQ/IhgrNUiv5HYrhmJr9HlLtJ?=
 =?us-ascii?Q?ntajVI6KnBEUcIEU8zlHHOJqK0SVGAzAhRZlz5rBFTyU9+QHn7hYWJKX/8FY?=
 =?us-ascii?Q?33XeS/5ZenEYcu0Y27jC/txHvyv9ge82wBc4hf9jHUB3n3i3kvV/K8TMGGpw?=
 =?us-ascii?Q?T9IeCpKhsNeCC9/RGzuFMsLjZpx8IalZX3juGbwJWViJQxOOfVxp3+mDO+wm?=
 =?us-ascii?Q?rm5+rlnJvs2JyEXJqM2NEcc7gjjDOaeBPnH3Ih5ZmmX2c+EqKLi/WKFYTqY7?=
 =?us-ascii?Q?1XFJPN8GIroOF9D+shhejUx273K80CU0IG4R2PTduetHwgdDAJph9op/vpZz?=
 =?us-ascii?Q?SbCLyXZorYNDaZnJe69eof6Uyy5fjYnDyvlOmwn3jU5QDHYKyXRhiw9MPW6Y?=
 =?us-ascii?Q?vAGhGLNzb5eay0ZtL6MLgNP5/J2jhx9Q3fNE3KCvCfW6IVhALX/SejlIM2iV?=
 =?us-ascii?Q?H/7aQwpEilaXGLPIVPH6S7xYmPyLhBTtpp5HlmUwBPhaK86UsOEzaOiAOUmY?=
 =?us-ascii?Q?UTGLruBiTyMgCmvYh6U3GKI84l/xuPvDTTnYJ3rCo8lGbaUeQKVkrAgISq4T?=
 =?us-ascii?Q?MxW6v3gPPrDDHq4vVTa4T5NCAEZGYKPxzsjGZ841xhwr77O25v2OKraVG2Qh?=
 =?us-ascii?Q?ys3DUxIThipsgaUaZr3Qhhlzcxngszo9xYTrFGvWbPlrhhTUXwiwHRYX4YSJ?=
 =?us-ascii?Q?FqmKf31jXV6RC6A8cZF1eSH2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86e99d7-0a52-4545-5779-08d979d9d2e1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:51:10.6913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVwOGHykLHvBdA9Ah8HXvklZxiHmAA9/eLEpGOlEhB5Bj/FDCvDZtDJ1ThF5Wsh/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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

On Fri, Sep 17, 2021 at 01:59:16PM +0200, Cornelia Huck wrote:
> >  		ret = cio_cancel_halt_clear(sch, &iretry);
> > -
> >  		if (ret == -EIO) {
> >  			pr_err("vfio_ccw: could not quiesce subchannel 0.%x.%04x!\n",
> >  			       sch->schid.ssid, sch->schid.sch_no);
> > -			break;
> > +			return ret;
> 
> Looking at this, I wonder why we had special-cased -EIO -- for -ENODEV
> we should be done as well, as then the device is dead and we do not need
> to disable it.

cio_cancel_halt_clear() should probably succeed in that case.

> > @@ -413,13 +403,28 @@ static void fsm_close(struct vfio_ccw_private *private,
> >  		spin_unlock_irq(sch->lock);
> >  
> >  		if (ret == -EBUSY)
> > -			wait_for_completion_timeout(&completion, 3*HZ);
> > +			wait_for_completion_timeout(&completion, 3 * HZ);
> >  
> >  		private->completion = NULL;
> >  		flush_workqueue(vfio_ccw_work_q);
> >  		spin_lock_irq(sch->lock);
> >  		ret = cio_disable_subchannel(sch);
> >  	} while (ret == -EBUSY);
> > +	return ret;
> > +}
> > +
> > +static void fsm_close(struct vfio_ccw_private *private,
> > +		      enum vfio_ccw_event event)
> > +{
> > +	struct subchannel *sch = private->sch;
> > +	int ret;
> > +
> > +	spin_lock_irq(sch->lock);
> > +	if (!sch->schib.pmcw.ena)
> > +		goto err_unlock;
> > +	ret = cio_disable_subchannel(sch);
> 
> cio_disable_subchannel() should be happy to disable an already disabled
> subchannel, so I guess we can just walk through this and end up in
> CLOSED state... unless entering with !ena actually indicates that we
> messed up somewhere else in the state machine. I still need to find time
> to read the patches.

I don't know, I looked at that ena stuff for a bit and couldn't guess
what it is trying to do.

Arguably the channel should not be ripped away from vfio while the FSM
is in the open states, so I'm not sure what a lot of this is for.

Jason
