Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9A36CF8B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 01:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563FA6EA01;
	Tue, 27 Apr 2021 23:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1227F6EA01;
 Tue, 27 Apr 2021 23:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWQvrncqvR+VybB+vy7kJpexQw9T8Y+TUQJvr5d7lp8suhyoV9gqlWQoWexzn35sD00mIYdIRKL5Il7Y3FZu+MlDk2q6nH/cj0skWiGmXhjPJFM97qUaotSLFgZjl1cMfzBkdrKDFjm98uq0b2g9HXfa5IwIWgtCYY9lcuEmb43+tYdgT4Q/3DGDV+gY0l2lluX2+erBEPaGxwd4N4tIKXHO5dnlt37Txq3gvu4kzt4YOZSLzV7bG5ykh1TDxKSj7QaFHr5sEiD/6R2MAy2nLUHQflyRe4Wny5942IaDrkb63xuAkhPY0LjgFTWtCRqmnfAWlmhhY/hAgSuX8KwfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw+ldgeibEAb6ePjntCWDxhqKGfl8RTtOJJUaN7YDc0=;
 b=Wxwj4XdyGEijvGnFWM1CPtIzMQwXZDf1SsYZ1LdsV+eK8EDS1ikRk0D3+kXPF4/4jFdHj2JZQiz1z9wtzhJ8HXp6vnyV60CcCekQ9tZq8IaXwJQqNxX1mEMwVN9xdIRlLCQZuIdRjS+MziMtcTN53/rSmbGdtWSdDb9ziqNF9wuwglW5iQAXIBK42jBZbG9JibVCs3AEG5Pc66guevrWa92sbX1qmfp/D9n/rJK7ozPXBG7Wq9GB/ggCjqv8IP1vFZi6Pbyv2seFg2DOZp61lpGKqRUTN7sZeTt5Yj9e9ejoxeZZCIejBZvN8Kcu5s4S1HTpnQqiVBJr+dz92KPI1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw+ldgeibEAb6ePjntCWDxhqKGfl8RTtOJJUaN7YDc0=;
 b=WuJzVxKYKwXzDqEaHhfxRbzL2C9otRrE8MIo6naAsN9SJsqSnye1vXjW9/J/p69WgkqsiG5t97gdr6vOjEkeh8LCjUmyZUy5q46c30WCxyeiJT0z2kGBqrSnKE3GQvGVvR+yWCt3pF4uGWcSDTQAZSO//GoBKHIv0zMqT+oATdIRYq8MeXj/kJE4BHyYRcLsJCY2FfTavY2Hj2uhia29lxGhjKiDJ//jQBams44CkVUJQmEcvvI31pQumhfxzMJKQdTbuXKYqwDHmfBo4J5lja0bRjUpTYPotRLnz1IZ/v1ijEx25uCpMCGYIYlzJUhCrxeb30z1nTZ3D9YAv4bXlg==
Authentication-Results: de.ibm.com; dkim=none (message not signed)
 header.d=none;de.ibm.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3514.namprd12.prod.outlook.com (2603:10b6:5:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 23:21:14 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 23:21:14 +0000
Date: Tue, 27 Apr 2021 20:21:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 00/12] Remove vfio_mdev.c, mdev_parent_ops and more
Message-ID: <20210427232111.GN1370958@nvidia.com>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <5def83bb-599c-27fa-9daa-efa27b5ac1d4@de.ibm.com>
 <20210426174250.GW1370958@nvidia.com>
 <2ca13efa-3876-9496-edbf-4b12b93d721c@de.ibm.com>
Content-Disposition: inline
In-Reply-To: <2ca13efa-3876-9496-edbf-4b12b93d721c@de.ibm.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0119.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Tue, 27 Apr 2021 23:21:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lbX0x-00Dnr1-QE; Tue, 27 Apr 2021 20:21:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9712f4ee-1c36-4ed8-3f62-08d909d3265d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35143406FBCD68E46E38B390C2419@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5TM+F3LxSORBy57rSmdnNy/5Zl25oX69IF6WNrB7DqNQePjjONwi6eiM70D68ZwDOGSY0GZ5l0ocCisNguWvimiMd7wPf3baLk1PiX2NQWHLUfZLrX7uD08GiTP8ANUOa1yQV5fYHjN+q6hN+F08m8e58r0SO39We9WfXAAMNzZSNE2bEDeRmzGWo+mzmNg60pbWgbPlP5Hm/FtWcRrApFPmsGkRF7Va2U2nH6Wzjo0hHBQ9k8MAVMmAMnlpdb3GhsMTDs4zQKOt9w4o+TLM/KemgbcQSTwgb0aj5gKTeeUeWUIb+KFDNWuxEfglnTIlHtjxMuHozIldKwvy4tuq3LxZTNPNfcUiGch9HfTh/h32kGa1yp+HrJSQrCDu6yt2p03PQ8FcLmw7kB3eqf++BVFmq8AnFYUWQMpkWE0ew9yFB3Agt/furP5DmHCJdaP+12BjRUQHDVwngCFuJt3VaWBEiG5tF1Q1RdbVF3o9BX5mbA7Ds26ORFvwWpWJrmj679ZS7pkJJUSUGvLt84b6KueymzQeEtvcrWomxBE4TTa+0qEAZxB5fKSWBicxQsG3wkkNeIC3+5MhnKgWr88r68wdsX8QWdpfpGNa+hFVuJ1WltHBpIzOxLUHTuf7NWitPZO47BUK5ZhOxGPn27c2FZXWZmKaKHBk5F/CRKIzx/k3vdku7J6GZUVA6ckd9fT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(9746002)(9786002)(83380400001)(478600001)(6916009)(53546011)(5660300002)(316002)(26005)(426003)(86362001)(2616005)(966005)(1076003)(8936002)(66476007)(2906002)(8676002)(66946007)(33656002)(38100700002)(186003)(7416002)(4326008)(66556008)(36756003)(107886003)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D46+CloXkoscS+3ktAwhPbHr4+YkAcBLrg3zxvdgymf9eoellsZENLLU59/j?=
 =?us-ascii?Q?QfQQdBLuejqWjEbF5Bb6+T2uGxmDh8IOnzIPyMh7xI29RaMCOkS4wQHlZ8RE?=
 =?us-ascii?Q?zmpY9WoVdYdk33Wh+kWxXyga/ArSI3DsaiD+rRycj+sYgcNKraVDRoh/VBGK?=
 =?us-ascii?Q?kz2BcQ06+S46/EqtnqA4n9DKzWwGzq+rYiU4/x5630WaFy3TYVYRvAsR/pvx?=
 =?us-ascii?Q?Z8Rbo4NWOnGKlrJbMjN+K7fcwfSuwSA8iPCVnNALWDSnenctxFyhLQyosuyl?=
 =?us-ascii?Q?0c5aBKW0zIUv82g8gRNTcx4kZd4g/sb1JwpZlaWsDEs2wsrWaWriNTjx/GcU?=
 =?us-ascii?Q?6joVe0A06Stw5mR98tyxQal8UzxjWaUkAWi6V5F0MaPEjH8X/lxQlexck9HN?=
 =?us-ascii?Q?jYQQzOQ+tw5UqbbHGQyU87VKwtDI3vlnE0OPjpnFNireijIF8B6QyY3t5rqW?=
 =?us-ascii?Q?s4yHyH1/WtmZ6kPAMM0rLw2I2G9MulSzTPLI7cC+hzMMxma0DfT6mDMmpesK?=
 =?us-ascii?Q?vXH+EOjUhjxrWnfU3I2eaIWo9H/AFj6w2fmdMrUdv/ywTYXLW/BDQlURgs8L?=
 =?us-ascii?Q?KYbLGqX4Uy9DWo8nvHiPyOFdfEq1mY1+bQ+VR0G7epaibZXFCedYISaR4Kkk?=
 =?us-ascii?Q?F1aa8Gqh6mdekz2X44ejSB+3TBNjacM4M/wUFlSf1GOXJCAh5UXDyOqGT5mP?=
 =?us-ascii?Q?Jp2JmVbNzF+QVFa+GZuqhNy1LO7/KddCvZYpksiLD4xw0KoLxK8TOvpZdL7Z?=
 =?us-ascii?Q?CJ4u7LrGi3Lf3xrfPu4UBEzO78Q27DfaPLGgISd2hae6flY9A3wSVQtRmWZM?=
 =?us-ascii?Q?TpRJJkHCqWdLJi/0LQUokthIRWGxcvEsgEBrGMdkQ/5pOBVNTjQCEqyvIZsH?=
 =?us-ascii?Q?+Np19QwUg+KtG7KHpfNaWC/Hdba8EoyWd1+UR+pWaKN6A3Q6Ab/nBOfQhZWG?=
 =?us-ascii?Q?moN97xESXBcYHML+L2ppN7fdYJGjFEl4PyFAlRIa+VugSExOZZwky57FGTFx?=
 =?us-ascii?Q?VCPkjI70RQxB7Dn8xvL10vQmKVdJ5OMPvdpLC8fW9XZRCtj9wfw+S5/ML8UB?=
 =?us-ascii?Q?tlioGBdX/iLEsnGuYUyJBc/sE2cTo687UmhlTbmRtDGA0PEDI/WSXWU0ZpxR?=
 =?us-ascii?Q?Tf8zIryx8QGCUTGum1zLGthnegK71ip5mVFfJswMdCTtyHUQIWAHoLdzkkzy?=
 =?us-ascii?Q?oAo94dChjgV+hCpKmF9gK4zoLCC0NmIKuIWkWjXuKasaCjfR5LKXhEM1balq?=
 =?us-ascii?Q?GBxJsmCnKlJV3O3u0wfqthyzvEeIdN1hSy0AAfK8jtsFCijXJ+ccP3H9zH8p?=
 =?us-ascii?Q?95uo1aPjiUbjucbu8e66/gp6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9712f4ee-1c36-4ed8-3f62-08d909d3265d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 23:21:13.8219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxCUIJRY1AUJzG+aWzbgRgtS2QVSpgmoI/0Lpk0cgEUnLDtOd2SkBH43+cozsWvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
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
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 09:33:56AM +0200, Christian Borntraeger wrote:
> On 26.04.21 19:42, Jason Gunthorpe wrote:
> > On Mon, Apr 26, 2021 at 06:43:14PM +0200, Christian Borntraeger wrote:
> > > On 24.04.21 01:02, Jason Gunthorpe wrote:
> > > > Prologue
> > > > ========
> > > > 
> > > > This is series #3 in part of a larger work that arose from the minor
> > > > remark that the mdev_parent_ops indirection shim is useless and
> > > > complicates things.
> > > > 
> > > > It applies on top of Alex's current tree and requires the prior two
> > > > series.
> > > 
> > > Do you have a tree somewhere?
> > 
> > [..]
> > > > A preview of the future series's is here:
> > > >     https://github.com/jgunthorpe/linux/pull/3/commits
> > 
> > Has everything, you'll want to go to:
> >    cover-letter: Remove vfio_mdev.c, mdev_parent_ops and more
> > 
> > As there are additional WIPs in that tree.
> 
> I gave this a quick spin on s390x vfio-ap and it seems to work ok.
> This is really just a quick test, but no obvious problem.

Great! Thanks

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
