Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E73D3ACC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 14:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100486E150;
	Fri, 23 Jul 2021 12:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EE989F49;
 Fri, 23 Jul 2021 12:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE58zL0l4kqZ2zIu3Bf0nB52CjPPBaTP0nAXQQ7TSOR7R52yDl/6E705pCEJurdKX/ZsSBAPQW7c8vrDayikHR2gBuFmgRorfVTte+e2g8yWnMrq327XPJitAQgIhj+VzhPqXbDGrrnQ06WxAxqwWaK/4a1s4KiPIkAkSSbSSEufMGpxhN5tJO/9m8JGPyeLK/cyeK57PwFT7Fo+9rwhPZ2h9WYxNDT32TUTu5AdkVjc6wExj/kCAfp+qbc2z7CI0xqkIHDu7nbHoMxX0IGnmuTiTHMu0RL1GIGsdHAtMOr6jIOPRuE88F1tBWYjdEDJyC/ATKl09Fq236dZ9AFEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE5sKyInBapmjBCbFdUSxCfyMVKnif7XvEUvp4KSTsk=;
 b=nS/Qhvb9gr1dfBr1esdxunJ4Ng13dYmOFTjp+pRLMqB+Cl12xcoHo72U7b3lvRXqvzBOyEPKrX4ezGxE/G3Xo6PFf54W8K5Z32gTxM20qGEY1j18Hbqlw5g00N4A2puKryVPnVwzn8XeY47ZE002HfF70IBb/ZlNGdPUZ8nDQWGaz11imYexIudqSPgX3jps/a2zmqKlpxy9FXpMx9kW42FGr+xB4qmScCbhEcATfp/LtWoT0fMgQXvk9hHpUTv7oVZMQHqvjblHTDmFrBr9BOwPz2qWiyPYejSo6GFdoJ2Fw78+dASQBECVVS9twhbWwEzG56fhWpAg/ER8fbk5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE5sKyInBapmjBCbFdUSxCfyMVKnif7XvEUvp4KSTsk=;
 b=tOzNjFeLGRh/dC6tACZco7ucz1CnoC8eLclO2YwRMnr+flf7YbPoWu1zs4kgIP4z6PRycxpbCCxXJ5l3zoR8OPaXm4Ad9lCFxIMg8+UQG8txm5vrPmRFEe1gSoCX1CJORZVikxdMWEE68qdnzQbANnvDRSPAeNiUEx7FKFegAZbzlRVikP2F8N7NUB7nQMyvuDQtbC3/SF92mTCuG5SWDrh7m/9wnnLkD/d3EzvhUgvNRniOl7oz1CVDG2q1EWNI+3+mVLBIiN4cTs6wV4CtCzazm2HSEkgk8Nn3FBHZ31AkAqs7kwTCgucbUoyT+6WFAedztdNjkKNwPazMNr/4ng==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5271.namprd12.prod.outlook.com (2603:10b6:208:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 12:59:19 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 12:59:18 +0000
Date: Fri, 23 Jul 2021 09:59:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 08/14] vfio/pci: Move to the device set infrastructure
Message-ID: <20210723125916.GT1117491@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <8-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210723074749.GC2795@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723074749.GC2795@lst.de>
X-ClientProxiedBy: MN2PR15CA0049.namprd15.prod.outlook.com
 (2603:10b6:208:237::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0049.namprd15.prod.outlook.com (2603:10b6:208:237::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Fri, 23 Jul 2021 12:59:18 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6ulo-006zuH-V2; Fri, 23 Jul 2021 09:59:16 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcdc494c-9f1f-4e7a-8b73-08d94dd9ae82
X-MS-TrafficTypeDiagnostic: BL1PR12MB5271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB527176CAF2885637B6AF81AFC2E59@BL1PR12MB5271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPUDY/5vQ69JtFZoagZDMwDcrpj8bX6gpT6AvsjYrHMw8wXa/4WiAZW6ZQjsjLCS8L7d8Hl9dZQkKXpGe+Jh/KMuQ1KIplTQKdYzWQhkAwUcFfAE0+Mn4n+o4j0bkUQ++Z8MdeT96Y0F4nkHPXzhs0zLt05aeGSI9TAQG6/gizVca+P7cKB5/3pcNz91oqX7gaJ0P5UGr/UlT38OzosF4mdoqmXrC5dsrjXSRgylt1qTyDWApKTT9wNbsRtBKUpS/yz1RiaglCyry5pNhF5+m2dNdaylBfCggs9C0Y62x20BuCHHl3N0ZSc3yrHIA3ThjNwOt8yF0P4FEIlSyxD6KUs4CfAemeu9YZES+VAPo/cH200i8vvBZvwatcSB8dp8sQL42uCCVKO+ec+faZchORqCoKQSAJgEyUlXGCGYESfN0gxLBSB3TH8i7taHVBtWF+qMta+4wx4soKAqnFRwr4cyAaYAvvd0oX+FH3jZGNpyrO9XCQ+eNDXe1JIjbNeJbUFe/ZcHgBcWQDAxl68wAtCJRu1SHFVcygvJTXrDBv6aAdqges2cKlyrbRTheGO9+LFbxhJlLthSFpWcnAQ8Mx7UggX7BllE6ojm6+AdVtx2ID6RwshR6fP4AEu0F29QJhrhT5I9RvCM+2fzXp2O+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(508600001)(7406005)(7416002)(1076003)(2906002)(8936002)(33656002)(186003)(86362001)(8676002)(54906003)(9786002)(9746002)(26005)(426003)(36756003)(66946007)(6916009)(5660300002)(4326008)(66556008)(66476007)(2616005)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6cjci35iO3W9fH0vOsTgZbunGL9X6iaJ1vOcUN2tM5F5uKzIKzAgrtjLfeIE?=
 =?us-ascii?Q?IQIdOI/KFx6FjoSJTHBsy6fGK7q4AiL8SnhGyC25cTJjAqAdzr64BschvG1m?=
 =?us-ascii?Q?rnNuUlJlo0Kt3Mz37AittTF+IeEPOGQ/ttTY7knuDxCHeg6Na7svEv6ykiNI?=
 =?us-ascii?Q?q9Nq7xNLb9oFEFYMJtSFyzC3R5hIl3s2IjCi66vaL/8TnDBbrO/1gnMKswsm?=
 =?us-ascii?Q?JJf5WoC1qeDNP3+CmHIDu2AYqQ/3UmVYMmfz9GSmen78X96l4WXYc1A+lxEN?=
 =?us-ascii?Q?OtQFOGGx9F77BMjENAjCGoVxNr1K5PgTtTv9H2ZCn1KNq2o/3FGU+TcZWJLX?=
 =?us-ascii?Q?mPQL2dsARZrxfGXAvM8PlFCab3VuMz+sGuYNmOtPPySFPHx9DUOTB2vXy+Fs?=
 =?us-ascii?Q?QVVwIcWLcKE5xYbUN6Vmd31cJJqSDCvSX/UJl3M+WfyyGvFaaPkCjd3MNuXW?=
 =?us-ascii?Q?bCEXLJb93lXVPOtvXNa+S3KJH/kk5HxqwFtJaGKktgsLMhYEIO43KS+wxY5i?=
 =?us-ascii?Q?naj4ZIbAVo6cF+YWzcfF9I77o1mHFSPOz7+Ei+3QgFLAtMTNrtrr+DxC1ni9?=
 =?us-ascii?Q?1uWj46qZ4zZPgqoNi5MLc16IZ8dtW+Z06KazBjm9hFDBQbhxMUheGe3XB9hi?=
 =?us-ascii?Q?UbH4psmR+igYOXYjMfmzURWsWts/dr6vCKlF9NbnJAU3TRfF8uG1wsBkAPSi?=
 =?us-ascii?Q?8IIgL+D20PUtLLt5Hf58R7EhgdOChv3w/F5wP2LeG9YKeolocA5ufMBpwNf+?=
 =?us-ascii?Q?wzoZxEBE3T1rc1ew/4AMruMhmyR0zh9LQVd5xp/yKLsS7GOnnQY2ZUHOwtFe?=
 =?us-ascii?Q?yPpDfEXyucy+kzFM36sVqGiNbidAiVvrqswNxRXaY/YUGgtej/P1sbytsXi0?=
 =?us-ascii?Q?YpbomQczJB2JfT5sfFok1evSa5N5QHrujg7BeXSZKa+MnJbepXLDCqtNKfAp?=
 =?us-ascii?Q?P76uzXeJiN3Oa27XR9ONIGjiyWkj28EhXOosjfF8fNh3kBPsr+lSI0N9B2WY?=
 =?us-ascii?Q?vEvGeuu2BBMwvGnnpiAOURM540vuXI1qZwF/3wNKKyqUt0kzNQBQri/rw1y9?=
 =?us-ascii?Q?1+sluWbeoLM10fVIkCBoENORkiXPw03AoLSKn/1pUYEwoNegbSfniIm7MF72?=
 =?us-ascii?Q?BwZv1UpdiCWE7EMkLebWAG1cnOz3ct/Sm5ZLetHmN++5ydEyL9ZIynSxYQ1+?=
 =?us-ascii?Q?BBqCebXEkqAnqP49X9YWWh89bGEm+ZEb5Kjxi5s7273UjkdQFjpHft/BT774?=
 =?us-ascii?Q?mhLmSCM+rm3N573qF5v+6a3O32rOZIEXLg+I8k2tr+Wek3gYPU0+HLmSFaE+?=
 =?us-ascii?Q?TuHsefeDhdBunPRzWAx81Bq4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdc494c-9f1f-4e7a-8b73-08d94dd9ae82
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 12:59:18.3745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msEhKJM73HCSlLeEilj7qcQxjSqUbUpzVQCOZvODZ6qSty/G7+3mistklrsMkOcN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5271
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

On Fri, Jul 23, 2021 at 09:47:49AM +0200, Christoph Hellwig wrote:
> > @@ -2020,12 +2004,17 @@ static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  	INIT_LIST_HEAD(&vdev->vma_list);
> >  	init_rwsem(&vdev->memory_lock);
> >  
> > -	ret = vfio_pci_reflck_attach(vdev);
> > +	if (pci_is_root_bus(pdev->bus))
> > +		ret = vfio_assign_device_set(&vdev->vdev, vdev);
> > +	else if (!pci_probe_reset_slot(pdev->slot))
> > +		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);
> > +	else
> > +		ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);
> 
> Maybe invert this and add a comment:
> 
> 	if (pci_is_root_bus(pdev->bus))
> 		ret = vfio_assign_device_set(&vdev->vdev, vdev);
> 	/*
> 	 * If there is no slot reset support for this device, the whole
> 	 * bus needs to be grouped together to support bus-wide resets.
> 	 */

I like the comment

> 	else if (pci_probe_reset_slot(pdev->slot) < 0)
> 		ret = vfio_assign_device_set(&vdev->vdev, pdev->bus);
> 	else
> 		ret = vfio_assign_device_set(&vdev->vdev, pdev->slot);

The consensus idiom here is the !:

drivers/pci/pci.c:      return (!pci_probe_reset_slot(pdev->slot)) ?
drivers/vfio/pci/vfio_pci.c:            if (!pci_probe_reset_slot(vdev->pdev->slot))
drivers/vfio/pci/vfio_pci.c:            if (!pci_probe_reset_slot(vdev->pdev->slot))
drivers/vfio/pci/vfio_pci.c:    bool slot = !pci_probe_reset_slot(vdev->pdev->slot);
drivers/vfio/pci/vfio_pci.c:    if (!pci_probe_reset_slot(vdev->pdev->slot))

It reads quite poorly either way, IMHO, I'd rather switch it to a
readable bool, but not for this series

Thanks,
Jason
