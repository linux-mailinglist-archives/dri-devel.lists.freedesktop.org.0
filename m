Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5833D3B3C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 15:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB646F937;
	Fri, 23 Jul 2021 13:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698606F3A1;
 Fri, 23 Jul 2021 13:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqIIF/LVO4GsPYwfXID8lfAPR0/eVfhJUl5prsWPva86+Is6wI4OjQI3bMPPt9IxFE5lcqPhx1OkG1bd0hLaEgvaQ4CrXaKQwWUAW18nzfygKaYHhElZiGYhFuV44ZBozJysfwDK0sw9lsfzJRfB9ukhVZtRQzXrJQS814auu+p31+PBy1/rY93G9AqsKKmcC6o4Bvy3wLjuPCF0TOGkl2j7qCfj+qwytXoBF1eesZGbk31sJLUhG6dCp6fouUaOXEaGSRNVfI2dAr15GJXlzjUzVIC5NiST+zopNMUwjaRCOewwmU3UYBwM0ruHaPx6Mtl2ogGVAG/OwmXkLnpQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UgQmdcOwZoGNJSYvTm6q40S0ic6VmgDaIAENmAbUfM=;
 b=Zk0xAJRSKxox4bf2LZIIKiOQ7FHS45kTnzNBQ1Z4Stva88A2qQBCNHD+J3wWx+Bb972/ippqDPYaGoX2vkAyNybD2k/9VWMp1ZzEAnwsV66YID+kQwTQk75ZD9EQKf4VgJAKcBQRM+X0cjh8p7w7mygG+K3+mTuuNtJ+LQOrOwgcoqdRqFmqvJ94xxnDeC8Fwdq/CBFebIaq1wdi/k66swFh/9UGehAtvU3kyhqPfmhKWckinfujeYJ5IGjEfeW5h+L+IfTsEdNfjc/j9z6drzlHSGII6n2h16Ns6dOXG7FoL6t6FrHlfvcbJS3rWsczZN/hdkYP1b8UFBOnqS4t7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UgQmdcOwZoGNJSYvTm6q40S0ic6VmgDaIAENmAbUfM=;
 b=HZAXW/2crHIHquFPh2PACACywWdMm09HTMInAQCagBjxU7RHOOh+vwgK5ktkQHQvT+nC1ujcdmrOPGrDzxgBWHR7tLrlPUU4Ky1hBaAY4ye1zMnP4tbjqoYsXX0R0W3NxxU+BxkOJsY+dcMytnVmJHDwhincYfvoREKgR9oXAoinGm84lgwUvilo9B2POa/kweq1ctWWs+wGcu1uP/uA6IZqDItceOjgeG00rxIob8xQAHv6u80RjSSMnG0uobhcORvKhcmdBa2LSz5ZfJPIqYTOU1NQ2Yy/ezZ3b/L4o8qtaf8Sv9V0ALTKvyKhbXLfBC5OCH0VKcVVp0bXLx1ymA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5350.namprd12.prod.outlook.com (2603:10b6:208:31d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 13:31:20 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 13:31:20 +0000
Date: Fri, 23 Jul 2021 10:31:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 10/14] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET
 to use the device set
Message-ID: <20210723133119.GW1117491@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <10-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210723081208.GE2795@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723081208.GE2795@lst.de>
X-ClientProxiedBy: MN2PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:208:23b::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Fri, 23 Jul 2021 13:31:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6vGp-0070Lu-Ae; Fri, 23 Jul 2021 10:31:19 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd4697d9-98a4-42b8-dffe-08d94dde2844
X-MS-TrafficTypeDiagnostic: BL1PR12MB5350:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB535071EA8BAF4793912D7068C2E59@BL1PR12MB5350.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1v2vmlTacvvsz0iAGaVo6LyEk2nzI2QCC25O3tNE35kkCImHGei0T80S6smsoxCDiOCmtd7dkk60SBoDmdRIjOfheRn2vSjFgmia1eMtnjz3IOl5XNZAdRshNyB/i431GEMVqh/rxziXdA7MbyZfTCKd7ckuTqZCEiKx7WNdM6QjqXSasvOFUXM6cmk4B6AxLmAt3T3ieN+5IE5PuO0bq1b45Q4ZCBFGEzN4k3r+72ZO8Ui9taMjHRmrmWHXheQ7uay0g9DbZ+ZYdhf7xAdwzZfPOyuHvtBQe7FfDMhzIRIgy43L1We9IHrW7Bb6SasGzCBqixzaFO0UuUIm10txgXK1Qyh5tEANd/QN1laE+VQ8wyS6oJECzPcLcbouOk6hPpnUDutRD6LqOJEYleODwaIVH3+ULsSShIQNoVuUXh8IPErcjE/FIwcwgA2XqBJWR8FMw8uYT0fC0utiQJ7NKJj6FV4II4K06lZRv7i9dp6wpwK9FA4uWdN2UVaEaNly0QDCSkTjxu6Sud2KMVsIet5rF65j2iO9OWzFRPUob9YpLo3UwVJtSWHTQClDgw9p7oCxsinU2TMJdzzQKOCxwzvrLwnI1pLERNqrAI8PHgDGaYS63zfI8U016rTYJ8vef4nguzZydntkA2NHEK2Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(8936002)(6916009)(9786002)(9746002)(4326008)(426003)(2616005)(316002)(54906003)(5660300002)(186003)(33656002)(7406005)(1076003)(7416002)(66556008)(66476007)(66946007)(26005)(8676002)(478600001)(83380400001)(38100700002)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMaJRYT3IS3QDpU1LpJ67J41N8of2dgfmWWKYB/OKbdgIXwl55NmTP4xvB1r?=
 =?us-ascii?Q?deENz94fL3zvQTJfsYh0EcsF7ckp97YKKQlfjNUftSLsKfHlx+6bcMJls1NV?=
 =?us-ascii?Q?X10jdsQgWlg+i6k15+B5vNxspVL0pm8835Dzr4PaV3r8CoPpP55pvz9gCA++?=
 =?us-ascii?Q?mw37xJYDe1bk2SIlFnkKieELUig4aKnn7CupDykBEJjOV5yo9uVGX1H4g/BX?=
 =?us-ascii?Q?9N0WKt/mybuKmsqcDeJ0wvnVAUjzAKtJ/smI2qQEMLs0pu9GtLCfH28tjKmE?=
 =?us-ascii?Q?a+egPOcr9IGnhQMIQ3iqhowa1ykq7S5yVkUGEXEYVKjxKt4TAK2Ux3By5HUQ?=
 =?us-ascii?Q?mUJasOU8/Ye91+4JcFt8nI5cqkw3Cob70UBmRsmzT5gqNN2w5F7NXHlp9448?=
 =?us-ascii?Q?6LQTos2GfEeGy124hEaBVsvurG8h5JS5q6zLoEqCt1XC0G58AELjHQ4Aym+y?=
 =?us-ascii?Q?Ee3cUmnOcwcg99sBy5ZBZCzfcZQjAcwAcqCtSPNu+1c29E+x4QHbM9QQYbcB?=
 =?us-ascii?Q?o+21aCloNy+9yjEz8B+Km86Y7vu7Dx1Uwl+ybOeSSGx70MSJosrDz/s0fQDu?=
 =?us-ascii?Q?CaSl/KL9ASBf3+hpzQCGZv0sjSJlWqyNLJ8b5ihuId2XXlWlErEU/njdsx/B?=
 =?us-ascii?Q?nVUNelHwSACYEM93kiTZ1o6t0uXEnQTxagQn4f6RFJBfENSVGRfxHdbew18X?=
 =?us-ascii?Q?zY0T03Cbwj6jjlXfhOIBVMdZ9/zyGQUx+tIYyYwykqXkNLKde8VCnTYhfxD7?=
 =?us-ascii?Q?IlHkwCjIm4ClvoOdsSLep/0UNCLaSFvKtXZ8pNeVmCwJ521/AxUjPkylkuyi?=
 =?us-ascii?Q?9x0v6RBLjYeUik109EKJA856LCkvRhVbdB9g1astnJIOupL4pDVhSy7vVq4c?=
 =?us-ascii?Q?AtF47xJv3Oz4heRHzwGs8ChXqxSP3nhiC5TsOqpNT9KIlJkelII+qioH/RIO?=
 =?us-ascii?Q?QZnAcHy8g/5aXPZWt5C++rpPUNy+WWrt35lUb7WCvfJ/GU7d1z19c1Wp5wZL?=
 =?us-ascii?Q?h7pPSxabCdq2QjHC+/XbQghqab/j3ibdXQftWoCWAMyivupLvM4ahoK6ZJpi?=
 =?us-ascii?Q?2qsADpuR8W2CM6fyqAL7YGYuesj9MtlwJ49GXLgwHyI64VKtgTM9t9ImDU9k?=
 =?us-ascii?Q?X6udsUq5ysyrxdLvX32P6fvZnZQDdmVO/rNDPAloFKSPL9fWIhTQ9sYl7C1O?=
 =?us-ascii?Q?uEzVuVTRzNFjMxDWuoFXMB/72AR5YeTdYXCfCHzOqtl0Q96U6b7AMwcLdS6z?=
 =?us-ascii?Q?KJCn12IhCW5BezO8B5rXdLcnh06S6qIT91daNpKKRes4WwIJKXhnwyAvVce9?=
 =?us-ascii?Q?vr/gCn35oj4Ni2A+7gnyiKtn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4697d9-98a4-42b8-dffe-08d94dde2844
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 13:31:20.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KrMGyWkVYL2EjAHe5HJbnUwr5x65B88pGy0N8bKksxmvpg23uDWVDaOGi6tLR/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5350
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

On Fri, Jul 23, 2021 at 10:12:08AM +0200, Christoph Hellwig wrote:
> On Tue, Jul 20, 2021 at 02:42:56PM -0300, Jason Gunthorpe wrote:
> > Like vfio_pci_try_bus_reset() this code wants to reset all of the devices
> > in the "reset group" which is the same membership as the device set.
> > 
> > Instead of trying to reconstruct the device set from the PCI list go
> > directly from the device set's device list to execute the reset.
> > 
> > The same basic structure as vfio_pci_try_bus_reset() is used. The
> > 'vfio_devices' struct is replaced with the device set linked list and we
> > simply sweep it multiple times under the lock.
> > 
> > This eliminates a memory allocation and get/put traffic and another
> > improperly locked test of pci_dev_driver().
> 
> Looks fine.  But oh gad is that locking scheme awful..

I hope that the address space patches Alex has been working on will
help this.

And as I wrote it I was wondering if we can swap the dev_set lock for
all these other locks and just delete the whole thing..

Thanks,
Jason
