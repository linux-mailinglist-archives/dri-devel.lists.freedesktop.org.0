Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72D4FF5EF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 13:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3843910E288;
	Wed, 13 Apr 2022 11:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56B10E154;
 Wed, 13 Apr 2022 11:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ0ORsRjaa6fMTLIu8/VcqC0X9TFvYMaDQIogOhcNv7sdwZQjYVYRzhyJ4UnegARTDtU5MB6OqCbrwL8FzSDUvnYxaSpVaUlS4B2zMym5t3xVdaafxfPuHTD+W8o4aIfJoUDac/hxgP3LTEJnJvkK8IL/yFdzMz82msJW/DfL21KtVY/hy/dqI5FljA4zem6KLJnnfaG2/FbpkNGMkwoi2y4yS7TUFJwyC2GqDkZSHX0LiCBTouPR3cv0BYzoRU+sUZaYju8raGiPG5WUF+X3VkvqRUijpTLgcObjlIJyANx6Zl9R27qRYOv13QCcaczlc432aJYBthCbGMjPqoncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJNbQ28sPo5tjisOrmTEa3+wkmoFQnhGLIkvObyIGjU=;
 b=aV+95oUmEH3ZQTI8yz0fvlnNvpPapJp+qQLNY017d7+nGlunXvqwawqqLzY+BOfJ1f/3DQxsJkVwB6A+Qizo4jYuUG9YsszlExvo2U4S3VZ0b21HzmAaPDLqccATH0XqgSfUs2uL78ZVLMR5vjkOSwzL1xVb36VgpBdRupLoaqVALQtP7wkUEjcBatEi19qzpDQSmdNM7NQjppESieo+SvKxCud+TqavfSPqGnDxkbjDEvuKUvDeLe/SsHkWBnfwVRA2uoRZ3KP9Aee1u+T+PrYRfeECcfqIaokDEYDBWFYrogptajAv4CvXzzoq27yzWfoKlutzUyeZxKixBPHtfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJNbQ28sPo5tjisOrmTEa3+wkmoFQnhGLIkvObyIGjU=;
 b=eob2hbWcdbuWFxvnaiMriQxuoE0KlPZsP3WPpYikRdGse/4J/MlnMM8DUgTz8Sk24afS1Z08ureI+/gEZvLC8xkDQ90Yf2o+fKr3VsuhKFoe2Rv2J704P7f3YgLbHanplEuV16/2O1WR1huOrct7ceyBbOA9hi4wDmlaahVn1+FUpuCfx5GMuWsZ5AIJGib0eBY4XrkZT//GNmIIs2GOc1otIG7wqcol2n2ChzV9MILT3Ocqq7may8afiN7REymeYsm6kWaQ9C5vwWc7IlPc6Kqz6jGrn0St9Bmg+pXG0OebzymZJGcv3KdihV9MosV4eA8r0uzGI24J1m9aM3ox/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR12MB1666.namprd12.prod.outlook.com (2603:10b6:405:3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 11:41:00 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 11:41:00 +0000
Date: Wed, 13 Apr 2022 08:40:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/9] vfio/mdev: Pass in a struct vfio_device * to
 vfio_pin/unpin_pages()
Message-ID: <20220413114059.GO2120790@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <3-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055717.GC32092@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413055717.GC32092@lst.de>
X-ClientProxiedBy: BL1PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd4915c8-78e0-4961-ccb0-08da1d427b8c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1666:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB166663BC603CA5EBB13E30ADC2EC9@BN6PR12MB1666.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mTwHARH1FcqoyPbiMdLQpvPGLH9suHi0Eo1zqXHhz+UDNkTEXKEgN3XlllHvgJCFQQoG+TVeZgZDzIBAeQ0ZFJKRG3TpCEMIRASwqyJhh+PKOd/cG1BZaaCfjuhIsoq/DDjksX1xPjA8VzfvoSlT/XNTdAAJ0n5n0WKu6dDg5OuWWs6S3zwn4qhgP7TuxoQ7qq53laq2pgaLLpC8pyCZY1/E8sB0K4aP++tDhlHJkLwnykVCK23QaqpM7sShBym++Lyj2O/sQPJN2Tz7JmfTHdmtRNvLROGcYowbrVXTrvudbqXW0DWh/K3XPp+MEMIY3KnvZK1058Uq5BPVJgfhIj3STRRcekI0vnDOgUqIdB+AGIejAD+UV4QBl69SqgLOeb194pb6TYXUS8ukaFTocKOs5fa48f7bBmj0EweNL5kuvnC45z9QmLo5LRUEECulRCY8Y0l4m9RFcpZe59KuZAGK/zqHIRsntvCv+6hjsYPERQR2mtN9wx3O9M+cRfBhCTK19zbRMzoIJ9yEYbqOo6oAP1q4+IpBU96dSGId4DkrgYca2tOPeOcx8mkh7u7RoeBDw2oeZskaOmdJTzzH+Ns2EIbP+MUXWoc8row9wr2nvZi+x/pC/JNg4EXbAAJWwKVUM8ZodKKfIoO7yofuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(86362001)(38100700002)(6486002)(66946007)(66556008)(5660300002)(8936002)(6506007)(7406005)(4744005)(33656002)(36756003)(186003)(508600001)(6512007)(1076003)(7416002)(26005)(316002)(6916009)(66476007)(54906003)(2616005)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qCrBGUVazHAlmighQteay7YCew6U+dVtgr90ig3SuZ2sOZ30AMRgsgHK29H1?=
 =?us-ascii?Q?QqYJMfw+Hn0RZtpeCX1eHmPLnOIsziZg+jYaSWQaj8W3qYuJrkYQpybm5jJX?=
 =?us-ascii?Q?uO8AMI2VCAUi2aQistm8biBxW+FLClFGXJae313oEf2HU9ZeToT7e//puL7G?=
 =?us-ascii?Q?mwDe1QcQf06d94eMqT75fWG2HS4Ys1b52vaEfiEvtXYrO11teWo8SMWeHWP7?=
 =?us-ascii?Q?mkwc0ixCCW4+BaqpTCFLvZAO+da01XTTah7gVkkGq75bAbzueQWJtwbl5oLO?=
 =?us-ascii?Q?NWlYrDY0CCPbu1HLb+MUlmSL4aRsnssOpdhLT0YUc0xxzVye0/3phm3xA/ZK?=
 =?us-ascii?Q?X9U0/XiR+zuE5/71pNdmRlg6xjmmfT5U7grVk8PHq1rLlBX95l4I7WHBq3Cg?=
 =?us-ascii?Q?DUnMBo2qbqTuHTwxFI+q14NBVr3QHCrDlYmK3KzGCIlwk4M+4KM5QcdawHZn?=
 =?us-ascii?Q?F1QhRTS0e5uQZyZFHayx4VI1xgMB8uoP883/VcKVeoT4ABP+x+EWzqB91zKK?=
 =?us-ascii?Q?qJ4zz7dFHaPIiJ3bsHaVXiZ3z8nTuE0XHafvLJVVqz/Mfo01ks3dUKEleH3b?=
 =?us-ascii?Q?CdTgli170o1yXfPGOmhu+yPP1Rknw40MUA6qRpmZtTDq2u+gx4+RAPEZNQpg?=
 =?us-ascii?Q?7GsimNmsTykx74ONzwdzgMqRWh3nhOictctoOrSmMSbxwZOGtQUnlX6xvvHV?=
 =?us-ascii?Q?BszTMBj3Ug6fEL+1pXfmKLfKQdxCjl/ueQ7fPlolMdBw+OngTUhu8cEgz2bK?=
 =?us-ascii?Q?pNwbXWrwKUYkiRSxZfVacAo2rtUmYyENa0eHTwdE0bFL2eIPG/8VnWh1917k?=
 =?us-ascii?Q?EDtyfbgBLdEVHiFXOspaiPqkyPJdE8Ce0ZPj27I4FjEGETKCD6SVaXq2qDNp?=
 =?us-ascii?Q?/005IVplwaP1QQVf82f23YoTgZs16cWjnPnLnav+T9bx0bDahzRfotCqFQDq?=
 =?us-ascii?Q?0iE9LTLchxIEzeJwWMUYnRlY+HooDf9b25rmHSxXUagdGulaQCkF1MqWxr5n?=
 =?us-ascii?Q?XcxYZsYrBnrQdz+z1gsTWtUCm2eQ09zcDNCJpRsb0qDNe/8AUzSQaU53kmop?=
 =?us-ascii?Q?qCTK9qCx1dDDJHZsBT9Nc1KrsSMlIpt0wcqbCFHAaGMNR0BMleMA324BexcT?=
 =?us-ascii?Q?D73so2YNVZS1s9kS4qFU+ja1DoWMazNQfCN+kh9hYWRbZc30q6iWYI+zJu8D?=
 =?us-ascii?Q?Lp9AyxhSwCkkpBRWoDCjVdcMt4xzc7ZZUGze/JwSjw06Z0onGi28k+NP6rw1?=
 =?us-ascii?Q?KMAIttubwuct4yM7M/+sgrSQ8jNUhhwnoRCI6zLmLygNAZHjGZdsiU1nvsxs?=
 =?us-ascii?Q?KY7V7sXE0EVbh7X4tE3N8HEYhf/xlUEU/zhmscuugaTBPAWg8MYRQNFWd5mM?=
 =?us-ascii?Q?K+g4T+eZy4zD2yX9TaVKZOqvxyvadFOxMpSHFjABHKaIawJuTRpKoEeee0z2?=
 =?us-ascii?Q?2f1MY77n+mNAiVpY1TiAy4MA1dxGcoV9Dg5D7gfgle61LZ56Jf87PcRA01b5?=
 =?us-ascii?Q?eqk1hLWKPAyLsLdMBijsEFXr1dqCkFzGm8uUnp9IzQETEtCjlsGNLWcOLns1?=
 =?us-ascii?Q?fL4zOQAf19pmRRQdgAB6hVWxz4lQ8sv/TwEspdVAn0ELNFS7VaG8KL/QHrWs?=
 =?us-ascii?Q?ULf8Y0tSYlRItkuC2stsruKn6JXukQOmpF2+lj8ro7BnXOUGuSLnGvb/GXiW?=
 =?us-ascii?Q?yT3oS3gA5p42y8omef/LSqd0u1A5omJaBk1lYLEcfOYFGTJqpU+/AtL98Oc9?=
 =?us-ascii?Q?iE3JeFGvIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4915c8-78e0-4961-ccb0-08da1d427b8c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 11:41:00.6093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avvVGuIiEW285FmYc2o20KQoBrtqca0coXOWxiqeXOjKIRmQCw8UXaQCoAxwqXSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1666
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

On Wed, Apr 13, 2022 at 07:57:17AM +0200, Christoph Hellwig wrote:
> > -	extern int vfio_pin_pages(struct device *dev, unsigned long *user_pfn,
> > +	extern int vfio_pin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
> >  				  int npage, int prot, unsigned long *phys_pfn);
> >  
> > -	extern int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn,
> > +	extern int vfio_unpin_pages(struct vfio_device *vdev, unsigned long *user_pfn,
> 
> Please drop the externs when you touch this (also for the actual
> header).

Alex has been asking to keep them in the H files for consistency

Removing from the docs should be fine though

Thanks,
Jason
