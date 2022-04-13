Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E028C4FF7E1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53610FCDC;
	Wed, 13 Apr 2022 13:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFC610FCD8;
 Wed, 13 Apr 2022 13:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B91/fuB5WVBwvUVxSt09fU5g8MO7v/+asgZdzkfLoCNXj/VTOkfvYvgQuaZYNuFW3pSp4KW1kOdsSkU5AKIi8+QTbloAEmhdSjcDATuOj6fomO1rCv1TUIQYn69vGUnYmBR7VyeACNj8PCxjRhBYwY5AQlxr3LrGbLI4Zdy6ftGi8nGwP2+L1afaHnlb8kWuXrI/o0LuWbSC+je1guP54raBmOE3/tss3AaJXoDjUn/hHTMtFk/r8pFzFJJDzVLsRV7QwjvyA0yerN2ZD2OIgUoJclWVTPhBrTYEOXD+g2jG2U6k3er0IVetsJDBquwGJbvMj8o6rZgrNohmCFENQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyC1liFGWg65H/pnFsRl27lsaAT8Ch67nMhmx+SHPVs=;
 b=RUGC0m0HYUzq+GmS9mFftxAkKv335tmS18DGctahoU9HXBdMxiyW0pe6UVbWcnE+6DftTLbZfx/6qRGhZlF4r0kQCihz+WhpDeeGOYko9D++XUKLF7Z7wWs0uSV18WQpK0QhleYOCwLmyJyvCexhRxdtlccIvav7P05xXpq7qxaNjcG2tzT1ujeqnL+oeSSh192Z9fWjua58h/Gkq6g6uvkWLcgFnxdS7liPSCe/tfCwNamMPH2HB89CNaEm1alCFW2lrwmQ2EZedpsL3+a+Xwp2A6LComCoJyTNKUrmTYJblVSAyz80ZB8gAOwmHfWVz/mUJtI30/pQFfzJh4GX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyC1liFGWg65H/pnFsRl27lsaAT8Ch67nMhmx+SHPVs=;
 b=VvVymrg++/JgpSgadoGR2VNLHwvyfjrhyf+qQcUm4ClYZo+UwORdeKhFiihW9W9ZwVsjEHAMc9vEGbuyM52/hJHd2yHBll9IBTau0ShGQp0bLP2/wc2iegI2vzqOQybGrRRSgiC2mHILiYutzOTG4y+lkY0Xy3od+zdSoOaawO2KlPi3yp8yVRaXrEm63MUjYr1ztJwEtjBNxP0fgiP/Pv2kdglmqcRKvwTD6Vd/peQnXogn98/z6a+8gM21MOu6G7oVbk2B59LMsGcGxi5oyBepmeYdgQz2h2KrAUVZIx6qWMO0aOUso4WyVJuA0jR7tS1eCIyj5AlBnDZzUXzt+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 13:39:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:39:50 +0000
Date: Wed, 13 Apr 2022 10:39:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/9] drm/i915/gvt: Change from vfio_group_(un)pin_pages
 to vfio_(un)pin_pages
Message-ID: <20220413133948.GB368031@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <4-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413060110.GF32092@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413060110.GF32092@lst.de>
X-ClientProxiedBy: BL1PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac2e0fc-1623-4060-14c1-08da1d531546
X-MS-TrafficTypeDiagnostic: DM6PR12MB4449:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4449B29CF644C1EE08CE1357C2EC9@DM6PR12MB4449.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/uWQ+wxwqPmeuM/NsdffkZFuN78lK0SqjggQZeMJh9c9133PvSw8o/AK+jG7pMbW7RghnKrmZ1qx2gsRhlRWrjErIGwsEUyX+rtUVhdapKiaprrPfCYuZWtB3S9Ug8N/lpJD5M89LsVctwVkquPfLtTz4FcRhxUX7vCK/xtE9mYbAp7tTa2HFPFbe3H9NX8WlFOVK9Ii2a00vGv3auZfD+hhkTI5LQqZPEtfFrIJx/6K+ZJwmem+aIHHd4vBZiP7L0kfdiwa4T+n48yYQaoDhqYXbdzCP8eZ3vzOummD4iD30cCO+WHdrQn8513JIXXN8CdmyThqChMo67i/oI8cpp4BgSi9Vxx9BIAsf/IDPcMilfvz4wcuzd3RFV7RGuoHY85c9/5ZzmV4lKlUuTUBHF/K4BqqoDSRQh3cNYVqHPvcOVnecrODKVqzH1ap0hdTznVNbRuu8yE9XmB/3DaL5etQE+st+ZzSSVfUydDbmgA5/2nfCJrArahX6Nul5Vjw9030dtGGDbpaXaR7o7OWZxYC7syQ7Ke4GQiekTAtB1I6/GBBALUDZrcsFXqrQOXmYW/aM6tag5eFPfirGDz/Cky+mfu2LMsX/4SogX/3kUj3FqPyOgInLyM3x0mHmHIOFJRx8TbY+V3iYj4QyVuUzVbt6agZHwNB1XtrQQD1wPPNFxNwZ90PY+DKvdw/JlGbTwJrUp7WMs7vLkDK4vIqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(86362001)(38100700002)(66556008)(36756003)(5660300002)(8676002)(316002)(33656002)(54906003)(2906002)(66946007)(4326008)(83380400001)(6512007)(4744005)(6506007)(7416002)(7406005)(2616005)(8936002)(6486002)(26005)(186003)(1076003)(508600001)(66476007)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WNb3TDJOhocOStX1vRKevXCR2ZOBfg4q8si92q1+SQjii5mJy+D7XYVM9A/E?=
 =?us-ascii?Q?W/Qjina6PD61+Vfs9h4LRRhml2oPVrdThxo5as1G5VM39LqF1NMFotLGSGJh?=
 =?us-ascii?Q?XgBI7/Cg9MejzXrgKhBXv1LOhOAEk19K4daHAUwKoauwPBHZDEaZYYG7Fjie?=
 =?us-ascii?Q?zrdYNqS8UwENaWhd0LJquypQxEHXjyd1ypbVQ0d9aYUgAUnHbgb6wrx6elkE?=
 =?us-ascii?Q?tUNJiYVOjgtyVtUHFWNLNu6t2z1Udh3GtkXgm9/EZSzO1tJDzXZy5vPUlp3I?=
 =?us-ascii?Q?IAUA5ulUg3QH5eQbgviOZRyUCDhjpoZUPLuUdsyPRSWP6hcbZO8W6H5nWsKI?=
 =?us-ascii?Q?3UnLxKI8/zGQFbI63jUZBSwIpTLJmOiGOWvzttCDF13Xf19yhGeU4XjIpq0v?=
 =?us-ascii?Q?6UrG8e9knWQE6a0nmFCcUcQZQohA+mE68yQQ4SkTHdvqjdRPDLmU/+lc1cdN?=
 =?us-ascii?Q?Tago+2mJFJ3SEadpLkX7sNv593X6gOdppTNH0MLpyFkjmyOIc90FEfkzQisr?=
 =?us-ascii?Q?EDrjtbm0X7zYxsI26mJ+RPJa/KqbmM8sxCuDhIZ7NW+QPQ7TlGkDvANlEDm1?=
 =?us-ascii?Q?3ZBwXYPygjI0SftSJxH2BcDTfqiwB0DQFnCGkU81ltFI1XAkjD4/GpVn5z1o?=
 =?us-ascii?Q?CXd0KC+ewy2tRHqRKmlQfVcwlPHWGuum1Kw04O5SYOx+vKuEseIRRp80Mlb1?=
 =?us-ascii?Q?i8knx3US/ERSS0CpxJMHGi6/xN4gS6hjB9nl9rYQ3Q1saFtyRq2HjT6htliV?=
 =?us-ascii?Q?WlOv4QOAFjoZn01ZrxRvrNJXWflSTjGrrNT0ag/gkVzM8SyhNwdS+ar/CPbF?=
 =?us-ascii?Q?rlnaiNIa/z1D/oemN+GkN/KV27yxNJejkcsH/bAFTOKFHsMd480Foih/Z/WK?=
 =?us-ascii?Q?R++1DAbJsIbFNwgIkyXmnqEJAWKJSo7hDbEkodZOywt9V1v3H16sKL6H/Tud?=
 =?us-ascii?Q?YOZ+zxQsepuXkLzOCDGaKBNPdimK365UfiQAuGOCNg9DtCfx7nvzyhxvvxqt?=
 =?us-ascii?Q?vrdThQS8VTVWd11qTnbVpc6gcC9oul3Vqr6vm3dNfTRBEf/HRVneEZJM2DcB?=
 =?us-ascii?Q?MUxWiI8R3X+xq/vpip6UZsByH4AilofWQT223BS5iQFYQAIYwEpQNLXDqrsA?=
 =?us-ascii?Q?VWjikdQYxnZqF0NbS4E3jfjjheOKY7iM2feUD2pKFjKvxt0pkTBi0r1lv4g5?=
 =?us-ascii?Q?rbvdWS/brB2nfjt8Ngxrwa8uL9CrgWJGDemXi0zBegTXPjR9nLKSLkQv4fCL?=
 =?us-ascii?Q?nD5SXx4RFw7zRgTUWA74HMgXSVKILZToBOcWNDlyxnFEQPG7Ub0dtk0l3+TZ?=
 =?us-ascii?Q?PtRYStOgGLsEopZoquvq5ZyXfyqAACbfXcqjhsw7WahRmthxfzWjC2CFCgqr?=
 =?us-ascii?Q?TEuoNbxKnw7P9eXSNXBDzw9cvkTi5zCaqnww/ElH6mx2lFF0RtlyP2i7LakL?=
 =?us-ascii?Q?lOgnCAJ0tM5cX79ojiwE/m5eHMSwD+22WZSWTg8UnRJwWN9SNDRv4VWAq7LX?=
 =?us-ascii?Q?rwj6F27KDO/XUpTEjIfHb4X07BFGtyrnmFDwNNntPUbp/jWyUtxlNDTx/dMP?=
 =?us-ascii?Q?jOwxhuqqm5vFXIoiNyrNPgwjLw/Zw9IJoigKdUuJpCdeXQD+eKeSb+zJplPP?=
 =?us-ascii?Q?MleDrA4MhJKId7eyo9/eIPFtQQmjDof4oAe4gDWXgXKynj5IUR3/vDA1wT0Q?=
 =?us-ascii?Q?ZoFxwODtjswvHE1QkkKqWMC+bcMUX/OAuUzfiark2Wgj1dJ0MQ7TQh0nCRtO?=
 =?us-ascii?Q?9Euat/TLYw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac2e0fc-1623-4060-14c1-08da1d531546
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 13:39:50.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1FMSiyX1O5+cyvicn+oub52BPGz2TdYXXuR+75rtC4g+nA+nnZnOKldoRKoMxIn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
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
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 08:01:10AM +0200, Christoph Hellwig wrote:
> On Tue, Apr 12, 2022 at 12:53:31PM -0300, Jason Gunthorpe wrote:
> > Use the existing vfio_device versions of vfio_(un)pin_pages(). There is no
> > reason to use a group interface here, kvmgt has easy access to a
> > vfio_device.
> 
> Once this is moved after the vfio_dma_rw, this is the last user of
> the vfio_group, and I think it owuld make sense to merge it with the
> patch to remove the vfio_group instead of leaving that around once
> unused.

Done

Thanks,
Jason
