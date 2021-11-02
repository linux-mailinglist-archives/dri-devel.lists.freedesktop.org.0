Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5744334B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70CC73212;
	Tue,  2 Nov 2021 16:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650BF73211;
 Tue,  2 Nov 2021 16:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmxs5lZvtks1S8MUvyMWrlqQa6VYuIsLgGEq/Q+MARcud8S9S139FXCWZ8x41EgtwOwcdZYYzgaSnuOA146H37541nqmjpQxrAjoLX2J37X7tvmySm3UhTw9d5qb8AcBs292e4GqImrPvf5f51f+RbMcdnl84xtzSI0lKsHqN5tpYyWbAThhf7Xlqtfx/IR/VYqlMiuzUTWm6Bvt3azYkSRIsVqnb5hvjPoXFIpwdfxNbtGRzjUQU5dM3DmCP3/UnDOGELwmnN/akqokxILBkrpJfE5x4wdRSNJ5W/4CiOVIEAafg/R1eh76nGxZCBGVt64lxyopTBW4hJ0SjVceoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx1sdjsA+OelSPA6F+Ak9DEU873zu6Bia7rJa6FvUKI=;
 b=Er3haAQboDl5BmWa5SZh+bHFd721SEzJ6W+eFSGeiDoWMKShVVvFPNWvxSbQWIxL+gjT7mUWt0oh6DJ8TQtse0LZ4j+PnFIL1v6TSG63/J8fj/lnuTtESg08vGj5iQ9j85Fy4YQHDLBvusZilQB8mAOaL76EApNsXcbZPOb95/T4DORklDzSK4JLOFVWiQw9uTytKZF5Eub5+zEbBpX/Tw7XtE+zyTvCYP111lOM3w/a4pokqibej9rJdaxGWmb3Y0eC7F4T+C1h7yFV/Wp+XyPGqvhf3Y2WVwZPI1y9Swh52iSgrhDJNBDX8gLvWuwL3U/Ux0opQ5hwbP5+WMfzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx1sdjsA+OelSPA6F+Ak9DEU873zu6Bia7rJa6FvUKI=;
 b=q0wOoh37cPC9HLYXbYBAL5tn5LZsUTX/BuJy2m+JBXGKAvTlBX0xpr8sTQw3C8EkQBo4JQzQGBhpYZqWsRvroVbOFnZ6w6nczgSCSBj8YlBaewDzr/Qo9uAfgEYqrAbwhorWASb61nFv+i9eA+mBc1A9avvzD0x+r4iqfjSFRmBi8+ITIjWnRMvCM7GIngPsh2eygkcMi0cLIyI8SIw0Ms8cgPqcNcooI0UazHy2whvR+ORKJBDw2BNgl3vZPg1Xe+LM2BbJeb/4mx6z9RFICXi2CaaucJF+qogRU7AIjK5B7mPMrJPKBOFc5kFvk4L5ebB0b8BKXo4z63uAKnKYgQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5556.namprd12.prod.outlook.com (2603:10b6:208:1cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:41:37 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:41:37 +0000
Date: Tue, 2 Nov 2021 13:41:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 28/29] drm/i915/gvt: convert to use
 vfio_register_group_dev()
Message-ID: <20211102164136.GI2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-29-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-29-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0224.namprd13.prod.outlook.com (2603:10b6:208:2bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 16:41:37 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwqu-005Avq-P6; Tue, 02 Nov 2021 13:41:36 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a663149c-5673-4824-2deb-08d99e1fa395
X-MS-TrafficTypeDiagnostic: BL0PR12MB5556:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5556E6BA20FE31F9141541A1C28B9@BL0PR12MB5556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XrmqAmRm761zsDRhJFBLQTPobK7gVhTlqx1RqV4T1gs6pS9XQZ8TfqsGawgfvIdDAk3gex+Bb/tkMN+U5cdx7KxnvtE/XGAOfKMyVo/jg91KW25RgCbey/sfFUz4/aSGO8lEYFdgtHjtkvKUzRns0VBfqDZ1i/8pHA9Y/BgyKwKdLFP9Q04osgtrRsNWB5xQeAtyxMDOg1qZYnp9lyzCYjpDk+t+lALf7cnMj/H4GcTkXkAawwuiGQc4rBuPNKN9PE5pb5l9Oy8aH9wJawgloi2KEhvNUxAapUCSPAMqbgYqKQCYcBtA+kWzH3zF/+3Im2kAw7JI3O1K4wUzd4RVrDGsPQEHjllnKOe0D8+7QKflkxftDWRlP9vaEmIXZtHF+rwERoFqGLclf1ClbIZHuCcthp2Zmi2V9IlWg7iUuyFRBEKsbEsVpagsU/k54HUUR35HESIAJcl+fPFC5xVAqx8uvR3/d3J2D0bX9Z4vVADYTcnCRF+PX8mODTGJToa9w736TSwA1rEelmjQsgp6lWZoUAKdKzyjpQZly42GANnE2/zqyQXrBOjSzygKDxD1sBfny9kEOnSDHazYbB8C3VDhhnifl9hQ/sbgIIf8aK4NyQ9iaFplnD/OznWQhi0Pii4Md2zu52mVfWy+QmjwuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(2616005)(7416002)(9786002)(2906002)(36756003)(26005)(186003)(8936002)(508600001)(5660300002)(4326008)(38100700002)(426003)(1076003)(54906003)(316002)(86362001)(33656002)(4744005)(66946007)(66476007)(8676002)(6916009)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJ7T9fiPAfdbAPOzYGp3SyL430UvcDKpXdIlcn30uckv17LG0iUf4Vb2m5zJ?=
 =?us-ascii?Q?Zgd2SpmU6//A6jDZX73f73xuswPengJygWjv2gxevHeAJzE9TbF0Oqi8rfV7?=
 =?us-ascii?Q?uB3o9xJe0XZwcWMVQtsjzOQaEtDINpftaIF1Jqdq8oTv95wmEdh+OMVWRh8v?=
 =?us-ascii?Q?fSzkw+MjSxAEdL2WLuS1Dz93aUpiynSHHjumUmHnI1xD3KFSD8DENEld0a0R?=
 =?us-ascii?Q?bF5V7gopGqCOesbucRiOubA2t8YVnbBGrWyS50gqBYHG9+9sWE1PL3Vm7OjE?=
 =?us-ascii?Q?TJyYuvwbJwkdrupQiaknf29bnGvKFlm+cIIuO1SfE69Fb9JVbl980Eb63F1f?=
 =?us-ascii?Q?ha2pHYUcZz7VPFKa59pWKfjEjL6hTlW0rjYf64nR7YsbRQT0EPKQfgIB1kKN?=
 =?us-ascii?Q?mk8BOjuLlKpqra6YALYZZSolv//aqkJKhi1F9ZC2rfAYI//OOcBzqHXWqI3O?=
 =?us-ascii?Q?bt4g2NOPDio7cJHSICUnI48mbkE3PBfao1Bx8N5u6JXLSJSXmsFXkqfZW5Jb?=
 =?us-ascii?Q?Vh4o7O7gQvcEpIeYmpMvEZ0Xu1QKDwfilC/I5yE9DpYLZQ61uCvuZOfC3B4z?=
 =?us-ascii?Q?guMMPKjz4+cuIo9ZjB3rHAMQFQRSOsdfoWmllv1GaT6E/wDs2EyUohHI9I5X?=
 =?us-ascii?Q?+2vlcy97F4iCn+N9L8YGQZoBznx4C6j+Jj/9q7Bruw3OU2mQfcZzF9v4qqXQ?=
 =?us-ascii?Q?+qtPpdsZ6vGhlQKbm8ROBqZuPG4/qwxSGeCCpXfnEjevP0BSr6qMGrGHekyc?=
 =?us-ascii?Q?gWMC76JNa9KOsei+Ez8wUmknXU21vg2usQVoYwKXWvYXYErz1dvnkr9vmY1a?=
 =?us-ascii?Q?S+3VZAXZ1W/FP4YFSQ8vAknqYF5tx8fuBqcwtMuPwDIzdFq2qh9xh5OD6iEE?=
 =?us-ascii?Q?beWzaHSl/RPj8kQsd5zMH7cnwWe3jf/dsnt1G43+Ekfj+YWi7bxOXbqlYM0V?=
 =?us-ascii?Q?P2d1+pTkjVAH80yoTzLKk+IChzedf8TQKlHscU8zBq+kZY5gon/DYGpof7Ky?=
 =?us-ascii?Q?8MMgM5s+/eqgU6Su62wv1zZMBkj1vAU1OZ52CpoMHJJL3v1vG6PZnYAwfSgK?=
 =?us-ascii?Q?+NYj9pTd8QhVwn49GeDpV+2DCdFUTE+jYJBC2gpi8dpE5ZYmIyKXXc0wM+kU?=
 =?us-ascii?Q?3yL/fsBfb/o8btw7n5siRQ8ojPbyKlbXxIgny51u9F9PLUVaQZ8330z6kG7u?=
 =?us-ascii?Q?TNu/un131ypnDU9tLn5Yw548J1BfRY6khyUbC353fN14QlcsWf4hKmkEau66?=
 =?us-ascii?Q?RzWClCcStyp7uqr0GNw+5u9hYLWFwJYOVV9LBvXYfUbv8BwPG/rS3g2zW68i?=
 =?us-ascii?Q?mPZ/i4dlr5sljeR/dCKueQSC1sJNz/3pWXU4sfWsXtwQfGp0oRNvfl8Dr8pk?=
 =?us-ascii?Q?jhC7QOPEHDVPIBl4mDYu+BGGehwnfenQYVh7go91bYRJa424gOJ5DWcENAhD?=
 =?us-ascii?Q?cFgJcbznHBDbg5ajGoOEpwHvradYhdK4cFisGko96y3JfNjLkFMRgY96Y/1F?=
 =?us-ascii?Q?Fg7nl4+vlsNhc3CvvfiMa7x2jSUp/O2Z9JtjS/TgcgHbQuIZhCGX9+Eh6HgA?=
 =?us-ascii?Q?xNoq8oTXCLtt8qtW/yY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a663149c-5673-4824-2deb-08d99e1fa395
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:41:37.6896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTTXrnOCWPys9rmjzI8WeK1GJpxMsopL88ThVPib7NO8Cok9BSQkXk2orzthD2zk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5556
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

On Tue, Nov 02, 2021 at 08:06:00AM +0100, Christoph Hellwig wrote:
> This is straightforward conversion, the intel_vgpu already has a pointer
> to the vfio_dev, which can be replaced with the embedded structure and
> we can replace all the mdev_get_drvdata() with a simple container_of().

This should be using vfio_register_emulated_iommu_dev(), right?

I expect drivers using the pin API to use the emulated_iommu_dev()
interface at least..

Otherwise this looks good

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
