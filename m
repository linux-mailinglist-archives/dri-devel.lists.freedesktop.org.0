Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B52614A68
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D476E10E3C6;
	Tue,  1 Nov 2022 12:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9975B10E3AF;
 Tue,  1 Nov 2022 12:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1kjNqpwllY8YpCQHYWer9oyqxLNAWBVC7aKmB9zaS+1Hp10D2Mm9zR60djbRkxGllg8xiE9FRfgtTR1B5tTgORGZaMtfHrA4hCgZgeLGTpO61MuJ/XuMvps/Z1vRDKMnIUTmWB20HqJHBw/v8GZcN604YR5A7SKcndK2EThOn1TIW56KMzW030kgWEznB9+A3TkPEhp6piEJWehKcQ3lRWRtuQLlwMWATdrquZcZfsltNGdsQUv98RpddJ4aEWJD66P3w0NrIrnVUsRZRZzX1nVc72cH1OXtlMk5hZoCTLNWHMEMixGha3hY7WYdJ/aUqBgPUIBvnB1hBOk+sXqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haZdwYp2j+WL/UHs2a7Gk2pu7OxVgNZGuk06qWZARPY=;
 b=e7AA72RUQdkR6x71ljbvK70PaQqYoTtZ5+qqp3IT7f0dF2k2reIOINmKDcscqz6nVJ7azxkVzneD8Nl/zoyZpBQ0z5Y1TZFGVEbvIowqx9xNDq9VkbM4SE2zEvTOHiEesPqYP10IFuTVc3BUBQYkgVB328Gn/bcZ/2rFsrzAZASnMinsCK69LODdCv7pyhiw/+0fDNmULi7lUgN7bORnDb899+HRQxQWOrD15qU1Qe/j3OvjgLTBFS9AMLm8QhDwGvinkJJ+zjIcYlm8C/iByL59LKOtlVrU68wLF92gF5l83wdQ+0FXX3axtjZZD4vpjFl8JdcDgCLP84jpQ3QsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haZdwYp2j+WL/UHs2a7Gk2pu7OxVgNZGuk06qWZARPY=;
 b=ZKU/75rLREMtaFvcaujoDFKLJ/2qBkJV4GLgvtpBpNy5RVXs7x3L/DO0AmAtSyK7eLKvPJKmdzYHt9wlBONpwIp+0vEUF7uR5BjC2eDjYpGmqGrB0LWeiVHrR9gRzvs936QesxVVxQWMat1LjRMWTDT+mvE9CD6q1ww7mSzfBjd3x2NlqIOBM91K2hrhTagBA4Ybobi3hymX8ZcyZAKWqaE9DtSmcueLEbIE+DtD5iXigVTL4nSyZ45QReWmMX4HupY4tS5mC9FqtyRLV4cAFpCRy5f0VGwV2XwaSPqX8AaFWkBgJxEUcO4j8SVuvjnYk1yUD+cJ3o0Lp/XJNW4mCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CO6PR12MB5426.namprd12.prod.outlook.com (2603:10b6:5:35d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 12:14:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 12:14:19 +0000
Date: Tue, 1 Nov 2022 09:14:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 02/10] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
Message-ID: <Y2ENmed19F6byTgO@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB527665C826A0CBB68EAFC6588C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527665C826A0CBB68EAFC6588C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR20CA0046.namprd20.prod.outlook.com
 (2603:10b6:208:235::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CO6PR12MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5c7ff6-fbb2-4076-e72e-08dabc029a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lt2fhI0cG7P9QS/Zvoxrh2MiH84/OT/g4oXyN+jkvFdXvBa8ffXHhBySWcQ6T5cibOSB/0OdxSqQcEUpS93QwvUGX7shXmMjW/qzjdPjoIzNL2R1wfsMnE7TBwZw3IidVg58wpEqu+oeSbEkn321gRBSk0stUK7Xja8mGjphAendKRoOJRH6ly2pmbWDYVvO8hz7b0cbBdgJvXYC/ShLvrzK95+Z8wBZZ0tFZEMIHtG43beYjh1NK1EHKb/pPePW04sEk2ib6krBfW1Lm8vR14ADzo1MetlF3n/1VOOx0RvQT4PvI6aquZCuq192erik7B35dIhoBFjP8KTM5bCVMVINTBrO6d8ny4fIWlCGnb4MUU0EZmrJCEza1ny9U6rUeOo84lzykMR3x9DYRlKlETAHSpFAlI7xnL4nil2jKvRALE2mSrKP7DVWWUDBgCTC2Ra95fZy/ZJG6ZNw7RZAsSlp2lGaqxQgI0oJbSbkgEfniyiICcSveBCXCstcvBF3vs/sQaytph/ub3arZUKwjB0q9hzoLzvHYhen7iFSIhkgzpD8sQTsCWSfW7jtsi2jA1b9apdAWsh7Hg0G5xlf/OzHzOWvZJhIloOfVouHSQjkEx9xFqYBQctx005NTol2SFB7sRaUqFC6hkqsB1xj4jKKP2CSdrc5MIN1ZViksv9HrmEjv0Ri4e0cMGathtSe5IqQ4dnZG/oeWPsONxv26Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(8936002)(41300700001)(316002)(54906003)(6916009)(38100700002)(66556008)(66476007)(8676002)(86362001)(186003)(2616005)(478600001)(6506007)(7406005)(7416002)(6512007)(5660300002)(4744005)(26005)(6486002)(4326008)(2906002)(66946007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LuYk5+iiY19NHIv3NU74o1AtEhXJjZlJRo2b1/rRlXFrmRwbNjQjyZYgUV16?=
 =?us-ascii?Q?aaFHvBIAZVLX+mvV4Nq0GK729P3CMKuJcZWlKPNQWWS0FUiXd8tosaUtyvL5?=
 =?us-ascii?Q?/dXo1Y+UX4mf4BS9W0yCutmKxHt7WtqWFFq8Is4d/mUiJBKUC5nB44gFPUHm?=
 =?us-ascii?Q?RyEp4kt9BWyK2g1LGUTif8VS2Fw0KqXldvFrnL7UYPzPY2Y0xc7xnvYZneTu?=
 =?us-ascii?Q?w5M0wOjtOwampQrWJEj6eABIolHf9GztAb6d54rOvz4DSxPxpoZyUs9H64UL?=
 =?us-ascii?Q?zbFdsbAdMNpNSpuhDB2wwta05dW62i0vp5zdXFWonqfHTYOah/UTux4rqP7b?=
 =?us-ascii?Q?BMO95gEoTSqC87uTj8IqqxwKxRrAXg9BXwqf4KZkfSFImvcCGNLZ2Gr0vLPz?=
 =?us-ascii?Q?CDotOFBJ4AFuYWFcubMYTKhhB8BfNkOpHx5ol7qNTtUTlSTOl1YBpxoiSfgZ?=
 =?us-ascii?Q?aCp2ArTW28NdXq9KFkUsBkkKS3kRZ8xjQ9gR69ZLGSwt40VH5n2vLP6AeAwR?=
 =?us-ascii?Q?IzOEjrQJhSvYZUjUtKMktq/274lZ1StgO2h1CoEAGcWae7tBJnkFzhOuQ+Lw?=
 =?us-ascii?Q?it7Jic/qsPWixxJcjb5gNxZxnH55pVLGSYvhiUGAwkw/Ul5ZMM6NQUHmQqbY?=
 =?us-ascii?Q?2yZ73VkpM5F64E0O0E+bTSNE743NgKPNSuHFOe4K61cyW7oJRCwje3zZC6l7?=
 =?us-ascii?Q?w1AsFGuz3W04tWeXtQ4RXhw8BY5ABWrRdGBSiJph+gxqJgkbGBZYsrOKP9PA?=
 =?us-ascii?Q?5SWZPb0tzpX/gpCJN2zM13LsHHv07U17YjpiXlhgGtELAxnuYmU9M+/pXrhE?=
 =?us-ascii?Q?dLVVTD6MehFp78qhNwaMibZAUHpACQs0mQd2N+QL9ydOi6QzHKKeBaqmSvrM?=
 =?us-ascii?Q?28bxiA1zxFAh/FZRAZM710ohVKAS3CauByhQCjGu9HxF8ujSV40aLP+l+ncz?=
 =?us-ascii?Q?XP8GGZkfJtqhgQTSUe6qAyD6RjT8h68yyIA7bWIeAqinZwIWWzdtyDeqUyri?=
 =?us-ascii?Q?AAHdwaQQD7sQVWFA5cp1nMa253qjQVPwTlazaTjY1rk5/uQqKG7qGfPpfQSd?=
 =?us-ascii?Q?iENijI1mpCw16WWErEQWqx+3+MtF4hcJL1cSxqI/igtGYDePbw9rSlJl1uGO?=
 =?us-ascii?Q?+tzXIFZPaHip33nrPR//cvDKhNS3Wruo+p3/r4T+9Uk9fLCOpm0PoS8vNoOe?=
 =?us-ascii?Q?MnVQu9AV4coI87nIyzkWz4fIMliBPrrja6UeLOpaleIYZLo+t8E3NFY+Sr90?=
 =?us-ascii?Q?PY+u9KgP8P7Fircuuc97V+GnL4cKx0j1HyWni0RPyJd9k93AWMzHHOKqxVeD?=
 =?us-ascii?Q?V3bzkOD/JC/nwV12B0h+c2mInvn2BQpHCW+LId+pN0RGU91BQYlwEa8tOtrZ?=
 =?us-ascii?Q?0tJQvscjNGTIg4Jf4pjOJjy+pkzXcwAQYNbdVFrTu58fCamIOG16g4kUm1Oq?=
 =?us-ascii?Q?7v0Nyj4LMOYMQXdjG+V3HpbxJueb/XJ+dOUdDOAviIzr/8AYR7xmSQdVp7Ba?=
 =?us-ascii?Q?epON9Y3ZG1WKemW73y+OBy0IaNXcHv7Ca1LawNQaHmokgNTVNd/VSS9x8n8j?=
 =?us-ascii?Q?GXt2GWvd/xLgksuLYwj8IIhdpcw0/dXbCEO6g5oZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5c7ff6-fbb2-4076-e72e-08dabc029a09
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:14:19.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5Wk6GV4wojSeMHffgD6ZN7oAC7udCg7903ZnGf4YXU3tBD+jeXdm73BEgcYtJWG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5426
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 07:38:47AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, October 26, 2022 2:17 AM
> > 
> > +err_container:
> > +	vfio_device_unassign_container(device);
> >  err_module_put:
> >  	device->kvm = NULL;
> 
> err_module_put should be moved after nullifying device->kvm.
> 
> otherwise it looks good to me:
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Done, thanks

Jason
