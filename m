Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458344FC0CE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122710E38C;
	Mon, 11 Apr 2022 15:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A9410E2C2;
 Mon, 11 Apr 2022 15:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dim4kAh53hD+VRiwm/VifrLYkZ7fGw1q68aEjqUWMG+GbeyADFJNTX6mmepVaN83DBBSVF7yq4TwkmifelppuXTMefFpsxjXDxlV9a1DBnMuqPbcdDpW7LuGYi1SXMUsPcdCuZS8bYY0mR9lZyiAZn4QKpBNESNzrqNBanaTMXyKF/5nVbiLe5uccDger53UIMgSoUNVwq3BFdjYN7nrSQ0lMlUkRpRQcwhVcpkkG9F0BUgvc1A/DZULjStF/wtPWnlcJokXVtwAgHvLr6vagxerykAMfVIG1Z4Yol1steHowiOZFXyDGn7HTWff0phG4l1JxfpjS/TyjStlyy1MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzVcFCBXrPU8/+PXqEclaIDQWu8oS6vJnSpaq2u9e0k=;
 b=NJWmoZvbvW4OO3J2luXOdtpqQe09Cur9wCbQNFYSd6JD0KT6Kj7wpPxbTON7ouzQs8mvbgBPu6kC1v8k4v2yCTwQPrpsqRUMDP6Zyu6nhMDIZCj2AfePskseZn+JPV6fh2Z3QAq1qg2kvq+SzoBl51KiVdRZbGo+w01i2ScYpYIp4SAJaJ+3SOyEgfxU62sXSWokf2gfHm5MStECraMmG8mpz4CFLf9blUpWNecLiIubEDqM9jtYRszNd1Byk96SffXRroOXthen3nNVm1ZYtAFwBhq2CyJzX+eGkcXnn7qRb2cdqvUh4OaVB9A91W2o8GGJjUjFd7RkdmepflmLmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzVcFCBXrPU8/+PXqEclaIDQWu8oS6vJnSpaq2u9e0k=;
 b=ChLjmc322r3BOHCFFQNZ1CfqcoSDYvFpiGIiiTrqajBYVnmuc+2qCzEYeLluMzx0igbnf85r4SxKQXADExYSN/jv2xAPNv4LeLpqsljoEaM0aqiMwqsii0BzVIqq0HFcxlFjTYmkDfx+sZVHE6Pw2VSCSly1dPLUH4MG6SQVbmd2pj0G7S56kjp/L684OWkciiqe9e21BYOu11xAXrcw9vh1L6BmEr+3GVDQ+0E65/eK9TejUujkZ6cR9o1pTeC1xa3dSnUN16NLZTNKfD0a+AXWC23Q493KwPFOLsWVMikWH1Wj+9rGCYy6jrEfkPvJT7T1mCQwORaYBRiz4iNchw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3421.namprd12.prod.outlook.com (2603:10b6:208:cd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:32:37 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:32:37 +0000
Date: Mon, 11 Apr 2022 12:32:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/34] drm/i915/gvt: remove intel_gvt_ops
Message-ID: <20220411153236.GI2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-8-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-8-hch@lst.de>
X-ClientProxiedBy: MN2PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:208:23b::35) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1588412a-e357-4256-4488-08da1bd08216
X-MS-TrafficTypeDiagnostic: MN2PR12MB3421:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB342156EA54E21887FDE7A713C2EA9@MN2PR12MB3421.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pA/nZA4VjByoDq/zx17Di58DMGt9NR7NbTbsLhFtIiqK/LH3am8Tkf28yjhDAMD/uB7aqdr8/xd9KitPCt0a8KUCcAtVU9SgShyeX21Cr/zwgovjbrr2lWBbw69bH+UFdC++A2YhJIfrKxl06bNnXVcwv/+BIw9OmuODMc00yaqU0SlHAsARs7jd+CBvO6SLzh9jhkq6ODTHimjQQamHxsQoxsgKLmcFuMDiYnxp3VAvXNRIh96UcpePE8EQpPqPf3Sizr+/ePoh9x0+cKqiD62rs7mKM8tdVlkySwgC13F+1ucSpVDLwRJeO/f9VNPg/91OAECxXZRJ09YRcsb/I7jj5k5auTyNwn5+XYHesDrlRSysKx8EuVMPc4lznC1f9JhT4c00zrTItlT2fLj+qOWj69AbhMGvscHXiNXNqVp2rflHXRkCQ9CJWOrGu2ukZRGHUIp9AjdmC4d4H0DH/XEfQTUE5nr6JmUkh/9ZbLnSm4B3r02lRxcUOcQYKEN/QTTBGsMIPTQ96aIO0xlnshLAU03kvOxO1bQpJh7oGfo6vx0R8kMblaJNviLHOO3OfQdo5EtNq1seQSSZeAYfPlSS734WfmdpZ6nMF6QcVBl8v72Ozc6c0MPU83udrewzv6csmd5lKjk5M0TMgibLnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(33656002)(36756003)(2906002)(558084003)(2616005)(6512007)(6916009)(66556008)(8936002)(86362001)(38100700002)(6486002)(508600001)(66476007)(186003)(1076003)(26005)(316002)(7416002)(5660300002)(4326008)(66946007)(54906003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CgZxZAJOmON6Sy5SCaafW9w2EYVI7KNKDTHD1GsmPHS21hkPLfhFnYmbe0wu?=
 =?us-ascii?Q?ePALfy0T7nIvIZy7QBZhY+6+Q1nUXWwHL2uE0pK0sotObEKj2HOWZ6MQZcLd?=
 =?us-ascii?Q?dHPm+oBsWyRYfYZ5sabDl9LntSyekBcE5N67QwWVXa7oGbpNerb3UYiEa0XD?=
 =?us-ascii?Q?juGY2f6p2WkwUwjG/E7MPywCwELWQ3tvUm4Engm2laSC3L2DISHnBKC4h+3j?=
 =?us-ascii?Q?yIHVn7/BaQ+NFJ6iVbhjpoFc7INCj69cIL5MGbfV0MXX+8erApECEoF1kQ7i?=
 =?us-ascii?Q?RBZAYXUvZIPRr4A+Y8MFoYh8lWR5phLjtZDwAkOr3xRx6fvYeL0CUU35u7gt?=
 =?us-ascii?Q?Dx3UwArVRkTxkAVRfrbpFVorIJd9Fap5LvYhScxwjUSXfSbqXtS6j8ZyU8jI?=
 =?us-ascii?Q?TCQ1688IKM7/YbLzUvMEApkrgjauvMwk4x1xGz8Pad9LYUEO1vXR5OEy5ZUs?=
 =?us-ascii?Q?JtwoTOdcVv95wNfUyiYIYh+ncd8L5anhb757d/QF0Yhw8IJzP5yQUSs5m6jf?=
 =?us-ascii?Q?jVZx+p87BYl7qGxz4ZP9aj+OeGMDvioMI7ZWPER7Z28wqlFimkugQIKjxYDr?=
 =?us-ascii?Q?sQw83g14dkTUiVbK2nivoL+s7FbnuqrT8BpQfCusv5HZ8bqwhqN9pMgGmzdu?=
 =?us-ascii?Q?XhSLnheRRL5ASbVO5mZDopanYxGPEt1/UUVWFSJAkXZnPARiGJojsoRNXvcx?=
 =?us-ascii?Q?hv5dt1qDlJrY3Ctg4VTztLaMVDpxJ4eOB9DCLxtvKwZYlCcBrjFzw5nuex5f?=
 =?us-ascii?Q?Fcxu7RfeKGolnVk/rqfJ/9lEsb0d/1jfltjMwpwBMctXaiOQpMsY2McNxl4G?=
 =?us-ascii?Q?YJAEItmcdHshfakEmLRqi6Odh8yInlpbrEypZ4yPPUIrNd/1lPeDD2KVQBNp?=
 =?us-ascii?Q?Tty2KLfDPXRbuaFxSFW4cQf0mAqI+R0tBUrw5SW/Y0UegmCVa7RA/IBGrXEJ?=
 =?us-ascii?Q?9b9A3uRHnjSGTqFBBmOVrxJEqOaIwCQxjbMMDXDWW8hsYkXd9l9TUebez3Qw?=
 =?us-ascii?Q?qGMCYYhk9RgyTdAGYUBIHYVLYh6eZx4BKuFBi119Nw73i+DYoIkOO3k+gIKT?=
 =?us-ascii?Q?YKg1Qk67Tb5Ic8qhVDQG0ZF/I08J97FR9kiktEp/TGAfP8fk8wGwxapHyvVg?=
 =?us-ascii?Q?zkmzCPn/mZS8BWbGJd5n7PV80Fe1oamSbtdN+sc9q++y8jbj5XI6HhhIbvzl?=
 =?us-ascii?Q?+/KnNn9Qo1GdhoT8Gx8F+Q2a/pdiO4aOZ2BZSXYARWHRkJJslYo/Wb38lG1Y?=
 =?us-ascii?Q?dXvn2ugoGBw0UBiJaboUntPITqN3g23o7ZMynPeY7w//iY4vi+KLi5HpeIdB?=
 =?us-ascii?Q?LWud4uzIKfS98GVrA4NFeOXsvCRPgeYvO7N6H1o9mXqzK9GfcPXHF79MrRJF?=
 =?us-ascii?Q?jd9Xo08jaz+zxQyAIJzQEvAOnpPL2NiDsbFqcAU6FKzdtzgaJHG1d1Fb1kkC?=
 =?us-ascii?Q?f1fsR7UnFeg26F42RdFvntoj5eL4ecwy0xxaGFx9f/79S+lx/oI1K209q1yg?=
 =?us-ascii?Q?TtAKoLjLSQG0zmcW4cPZoPDwn3WIQ0WYOL64c0sJzbXgSg+am17RuT3D0iYC?=
 =?us-ascii?Q?zIlLEacCnkljDkj/fFr553jyoMrczln7KzjX+bsjiRHF8anKqduTYPj98do1?=
 =?us-ascii?Q?7q3yAAvD4KELQu0+SZ7qXm5pfdQq70yYFpWkAgnCOCsa9Dv3Lfkj6fd9hTiP?=
 =?us-ascii?Q?mBerJB2DtQFY+3qMbG10IWQa1ZOp0aDI6zuS4fClbuXpj6drAADJN5++ohbI?=
 =?us-ascii?Q?0FyiRFI8zg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1588412a-e357-4256-4488-08da1bd08216
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:32:37.7084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ey+WQQFq/ljYKAFtod7XA5XCxvsYGVtAZwyAYpzna9b1EKxb/vSiLsfA85SHBl1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 04:13:36PM +0200, Christoph Hellwig wrote:
> Remove these pointless indirect alls by just calling the only instance

'alls' -> 'calls'

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
