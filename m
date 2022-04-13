Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19554FF7D8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1D610FCE5;
	Wed, 13 Apr 2022 13:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B9710FCD3;
 Wed, 13 Apr 2022 13:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnwVqSv97DWuJmi0WtH1GGf2FJLzdM7aZRcTHCSA1thNIuUhXsNl3UQeJMiafZBdGGIPcMIAIbbM5kTbaCkEXdvIiS3Yw7/KZ5tloWy4OMTRZh/zkxxRakGpfGzcHIpEmEHi+8TcMXCJBgb/OaP4mF7vwxIzv1Ynxq3WXTltupMZC0fCXaUrKulWBTCo0nNeFMGGl88gMdLhC/sHUJbZ91GbZUgy8TcDIQcnt9ktfyZi/VybWHsi8jNQiG0Oy5bKj4mhzIY3X6frWuX7uNrA9L+CE8PaI0pyotKLSTqnUZHUFfU/SgJp9ceIEtLCaTAD3aKigB76whSi+9I6iDky4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmn6EJVVS62U+KITX0ZH07b/njnH4eQ4AO9vkUDxY2k=;
 b=CL6HaSAAREr1Jx4D2ltzJphbaYKM3/Cv4MDXBct00uuCbXZaPAzR3oyyVKrC5XeU3i0nyD7CjFJryzCj5HlPg+0dQFfRn1MBxF2e3DBsUuKgpPtayEaglusvrOqX80ll3IigR99v/EgqPJ7cDfHbQ+34RcRkSpTVUZ4MKUH1X9UMnOoQmfAdVecHbcoIzkPoirYIyZU+i8BVdAe8uTNeRDvxtrxlXwV+AdUfTVSBm5WrL7afdcB6HWgj1vDUlvp7ihjh8lY+/BohS19dUpKXDUhNLGRbG4doU7e+NZAph4cxqqSsIKKNMWIheHfEOM8+dRl4lbrc9V1iaLeeMNacWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmn6EJVVS62U+KITX0ZH07b/njnH4eQ4AO9vkUDxY2k=;
 b=LOkLx4VZo93p2+vJrg4iYSfSCfFIT/17rx5tuxiNbOUALXHpjzQypSqrUdEjzXUGIqZCvD248ZKFgHzoGe0fFH6c45RfuRLM/WMzkEzUEay9hfFZ9QviTfD5V3EidiOieaU/+cCmYDwbQhBNasgMSI+foryitfipgrl7u50S5sewkCpZ8w9ciXrLk444YmQCxG2hlXALpPBxrDJ2A88Afxoz5/85AyS6DJ+2025W99Ady90v1y36GtoDjRgKKJ+sgN0+Bg4bT5ZAlQoJGaFREroJ2SakDy3bNojKMsPMBRWDbivmjH+1IFDwroVDJLePoDMvHQZ9YyUqs4QxdOkvYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 13:39:28 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:39:28 +0000
Date: Wed, 13 Apr 2022 10:39:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/9] vfio: Pass in a struct vfio_device * to vfio_dma_rw()
Message-ID: <20220413133927.GA368031@nvidia.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <5-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413060008.GE32092@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413060008.GE32092@lst.de>
X-ClientProxiedBy: MN2PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:208:23d::27) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c40d68a-510f-4184-d51e-08da1d5307ee
X-MS-TrafficTypeDiagnostic: DM6PR12MB4387:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB43875ABCF79B4CADCB6CF0F5C2EC9@DM6PR12MB4387.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CH3Az0dFf5WqmyVkGWyINu4fvU72FJ7lNzyxbAbNT3nEPkV9Pyd5OlgeD8QCO1F3jPXm0HNnnS17yKmY3Th9Wp86+hkLZDYVWc+SHEyfnR/aR9qWJrKD1FLsrP2k7rOF/5zLCNYd+rZNSCOEXpesXjr24rexzM26nV3jTeCtyS6sgNYWslE6LsnBlwM8Wv1Ff3jJCNGwN5knc94UwLjSlCWVhcVFSzuXbmUV2Vc5qsr4G26pSlINqISeCZDp0D8WF0lRGXSjxnyMqS0/DgFKY9z4hnGrQEX343RV79QUTpRxgC5Y8cClOWuqQSaszccO6mt8FOJgfNP0dVZRRrr6Mavnsmpc1OpizAJFLj+AZY7fXRqaOaqU3k3Cweh/5u/+Vg3SBltZejB7Rp1Xei2n0Y9pz3PLhvSk+h6nl+kEco5M20eL1AUOdc0UAJfcaVA2p57R84mKR8A7xlTc222sccVi2WPp1oS+3Idd+f30u5A7rlexPnLfBVbQitluWDx45WUxhI8EvHiDrtCene2eBsLz7NFJ//HpxjlDNUWIAN79giaD1cEphuRSUPFayMHlgS+kxiYso2qnYvmqMa8Pv4zq09iZYsfeSIzBDOZiIId6rgjUQs8yhayHUNJaTcECZHZreHks0YQ5/yDDKHjcv7yJl4OuNF4jbAkBM+13E/hDDbMQ1se5OLkYV7rZ879DmZfu384IcJ9tluUSArtLhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6512007)(2906002)(66556008)(6506007)(38100700002)(66476007)(508600001)(558084003)(4326008)(8676002)(6486002)(2616005)(66946007)(86362001)(7416002)(7406005)(1076003)(36756003)(5660300002)(8936002)(6916009)(26005)(186003)(33656002)(54906003)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?psMKcl1Kj2Nvqm7pz+Eu8G9xOg17oqS5sI8mHzbU1JZzKoRPXTdSJOfHPI5Z?=
 =?us-ascii?Q?I9q/RQZUrXB1oasA6yE0K3e84tyL6yrw3UfL9gBtNqyYJjTMGfQAu/kVbOAc?=
 =?us-ascii?Q?oYewp0lGphQBsXpd7H+qAypLg9i7GdkSS7B9YRd7wkwHaRnOpmRCB1HZ/E8z?=
 =?us-ascii?Q?JcDcy2c6eMivm22iWuCzkNgv4l5pLuWIZVMLoBPh0HcF65SbQH360LxEhBk7?=
 =?us-ascii?Q?hS+pJzC5IyQMHlrRqa4YvWLILwEGATYDBJkTM0folWeflM+JZGAboopA7FCl?=
 =?us-ascii?Q?VzVXMwcZ4ENjP7PyeR8yX06JPNlKR3q2iM7njOMh/AFLlGvI665gQvOwMEBM?=
 =?us-ascii?Q?thvf8lmiX6CrTzE2OEgDXsaBKiO1rGO5Nx2JI9ieRgOkSe8HKP6B1w8C37lP?=
 =?us-ascii?Q?7/nx50iyjfko8Kv0TSvstZ0xqYCMzUcXRwuhsmyJwkPCaNMOVNxfRj09ZHHr?=
 =?us-ascii?Q?8XIbA4TjXg0IYi46WzRNWEXa9PgpVzzqKfB59dpeQ9YM9ILwtWvx/OT0L7Im?=
 =?us-ascii?Q?GmS9kYgsE7ClOopOxaWz2iDQwOFN+WnQk9MfjlP2kmxkURM5VQs0Rj90Akaz?=
 =?us-ascii?Q?i6cpwkTzg6ymG+Guv1nJaVn4IJFgZxyMUAfl9l5UPVxp4W7B4jPkdy7vuZpO?=
 =?us-ascii?Q?Re/KTcp43zCfgjAY4unv5zV2MK/Zh0+rSTQNmvnmmZi6uDjpUXY2HoNGyD+P?=
 =?us-ascii?Q?8brFq/FAtCFUg3HeYley9PWnFLZxk0IXQV3qIi88M0FKpp6t1ibdvuhl2xfW?=
 =?us-ascii?Q?THl+1736dJg/RvurKXm/Ktu2u60V0rm3x5ajnpIKd7P7YkpyqXqXCDYUe2il?=
 =?us-ascii?Q?QA2wERWKcDeQIlfOlmRP6NaFcS3gvymYDAxH0lnCl4dAoWl8yCO5cpTt/8fL?=
 =?us-ascii?Q?C1gfe3E4SrlegoeYjsxFK0j26rcj8OppXKry8xHc35V2VcKBxs5qAvWBbbsy?=
 =?us-ascii?Q?X3xI4ULF6jDgEGqR9sSWkQpDofGzVaYiP7OfSACFA3Gzo5ls0pf56foYrGHh?=
 =?us-ascii?Q?Nst/KT+nmOFGOuBXapcsHSodyWeFaHUaESKTI+FvaSGYOfgZCkZuwV92oYlV?=
 =?us-ascii?Q?sCjnDYrXbLwZqjIFX4nWBlXUi6aFWL8MQqOZWjwLiexln7aNXgJMEaBndvob?=
 =?us-ascii?Q?efGvwb66ZnMgVTsagalED0t7vvZ9W3D9jMlSksF5yKRZBGESMWPkQCv5BcaB?=
 =?us-ascii?Q?dzORJm4vspiAz5VjQ+vO7PAU+7vN1jWOUs08R+X14kWhnnE/kRspGkF+CzRX?=
 =?us-ascii?Q?yigbQNqGYD1X+JBKoGJNjX/111/b9rb6f31bgPVYS5A7iopK1WUWSP89NjU7?=
 =?us-ascii?Q?wuWrVgqYe2XTuBtXA63xAeZZI7+aFZXIIMRwqJvzIj8MMbNvBBChQEDqSxTz?=
 =?us-ascii?Q?nKO23NRc7BszZjqZoRMVw9PW88rl1l5SjpzjRwb3h24Q+Jhnm5rR5VXd3drk?=
 =?us-ascii?Q?RQ7W3gK0cK/fvpJ20XwTtMmYO69kbXbnajU+KtgGRAAt/B/fwu2q0grLroeT?=
 =?us-ascii?Q?+XD3VtZy/wDp/f/yR3Sm8700b7P+tykiLulLaaGhPjakD17djK9LokqAcmT2?=
 =?us-ascii?Q?ZjAERx4J/mohGldLeI6Ifw0lRSqhlDHUI95Y0YzAazjlFkSuEfTKdCmnwDeK?=
 =?us-ascii?Q?DyM5dKK0OxLa2ZSM/ajKnaPj+cIbAvkhrBXl61PRLgj5+dHCGk4inKPmxohd?=
 =?us-ascii?Q?KHZvwDPgleOEYuvVtMimhne1WdPf5+i7joiJpsVldwYWp9jiWph7d4PSvr6p?=
 =?us-ascii?Q?XCE4v6GZ5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c40d68a-510f-4184-d51e-08da1d5307ee
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 13:39:28.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApvoKbsfMwLgWT3F06Sla7pSRxsvgxAmAc01Psnpycm9saiqVI+aZbOVM7iTcqwJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
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

On Wed, Apr 13, 2022 at 08:00:08AM +0200, Christoph Hellwig wrote:
> This looks good execept the extern nitpick:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> However I'd move this before the previous patch.  More of the explanation
> there.

Yes, that looks good, done

Thanks,
Jason
