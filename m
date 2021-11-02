Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243F443280
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B257316F;
	Tue,  2 Nov 2021 16:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963D27315E;
 Tue,  2 Nov 2021 16:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ471DKUqDdCvPnlPy+6dtctQ9yc9R7ygGs4tOD3i1cwXH2/rhs44wLhxFTA08cQk8TTvfXYNHL3Rx3SRsQevP0/qF42isOwRtIvWQu2zK1A/Cr4xKxF+1VZBpQz67kQG2nq9h7Q+AGXwTPG8/e92dFGgD+7Mq73LPgQkhzahU1s0rTeNuuW1AlJoVuCzXYE1dtCDs+FLqZEGWbOBfh9qXrgVEBJLsO7uL371NoWV1Xr8jGqbWQjNt2fXCcwu6KWiPApGYol//s/NGZvJ+yubARKkJvU0e/zXt3MGn/Z+JI/Rt+nu7c81ZI1srenK1Ue0wf7+D8S/1wNVculZ6+EPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgsO2TWwIPnho8LPPqJqMLJSs7XoId7DnGYzAzBuz3M=;
 b=kjPuh74KDOgj30fYA0Aeb0gdPOsxqsM4j8nf25lRRfxu+9YKq4Iuq9L4T23fvy1F2XDudb+UOYdKQj6yMjIGvmt9c8DnxMAYAGjJrOvnB7QLOfuduNFDXIs5PDyZOLXJ1AfS8nANvOhLPVjicG9AENgDdEXOg+TXUllH438F1eLB8/U4x5VfMc/XRQskgUOQFBIyDNI3ybOoZc1xg3+lXzVrQNdpNxMNRkX5e2ViY42Xd2ahMMRVObtfe5X2g4qcBidbUk6OEq3HDmWxxy/Zt3PBg3553p19iV7eO/is8KKRL2w3vz29cl4e8mDp6RMOBsBKICHRTqxI0O63Yu5yYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgsO2TWwIPnho8LPPqJqMLJSs7XoId7DnGYzAzBuz3M=;
 b=mQ3Xifj4mSFoBfJsc/DL+UNvd4SwT+FEfRZA/iMW0Hh5dKn6Pgol0IHAtZfJFybLdMDrsd03xU68Kfjhz3rdkzxP7P1UwQKulgSG9NIEkHmWP5YTq4CBlj8YDgYpKZlBWwj8X/eZGeWSF8XygsTDcijuHSAlp3RFlrvEaI0JqqyJ/5+yLBe1VrPizqpNrXjH4Gq9chq4jwVatp7JNh4q4sZhrf3KnDYC2C1WJgmGCThex9ht96lRYJqxRpopYz1+mVKACcE7WZlfRFPAOLpw8h5BXcLNo9tKJ029jTirsmQtNoNZzoOnBibLyJGYergzkIoZ3aQrDpOva4mJ/BgBcw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5063.namprd12.prod.outlook.com (2603:10b6:208:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:14:47 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:14:47 +0000
Date: Tue, 2 Nov 2021 13:14:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 19/29] drm/i915/gvt: devirtualize ->gfn_to_mfn
Message-ID: <20211102161446.GY2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-20-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-20-hch@lst.de>
X-ClientProxiedBy: MN2PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:208:23c::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR18CA0003.namprd18.prod.outlook.com (2603:10b6:208:23c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 16:14:47 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwQw-005AVN-Db; Tue, 02 Nov 2021 13:14:46 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ced675b-f583-4304-3b04-08d99e1be3de
X-MS-TrafficTypeDiagnostic: BL1PR12MB5063:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50638B11C0DFC136ED14F70FC28B9@BL1PR12MB5063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NzaDBkvRYw2DRjXAEeJc2LBgYsWUiTlwQxoe+O3p/93n2+iOd8i2HblzWio4fhI6v+NkuidR8v9jnnuZVA0XRgRtHnu3xd75/u+tyXKaF9OM3fTF874odykU9qvY5R7dy5mKJj3O3548W0KMeFmebi6GzhmCU6FGxD7v9BV7NbtPychJ0Otg8O4BFtPs6nITQX3PXi4CWh+BOQ8BVLQ3BYC0ti6YFio+djLfaJR1sX/z10V0IHMFGBPFnhEVi3XlIxv9GVkDbw8oyRD9w4syQ88z+Tdhzrxs6/al48FGHfvKYL8y+sJoeJDbJ88xOpU7oesXCbczpcFlsKnTEF7URSuFMbl4+8k4wTcnZWfiT5lb+HeZ5r35AZF/g5UnNst39D2/uI54aIvQrKTJawWLVESfU+0VktTHZGZazF/jksHWhNpPNcmdj1r/ce4GDSFBkcqcnm37urB6u5dVzVakk3+Yq/WxVAmRwTK6rfCCgUSdi0WLHshTFvL8B8IaATSyDBvc759mR1MaqJZGwgdusK6RkRRwj1rVcdpYcsRje0yDRqRKt7kP5A/IERQScjSZ5Zkw401n8bNyNnD68QTTpoboeUAhSZFQyfKmC8pkvpNcEEyaAq3ZSOZjZseUpa53zZtGkaGbc6tPLf+XlvWFUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(2906002)(316002)(83380400001)(1076003)(33656002)(54906003)(2616005)(66476007)(66556008)(8936002)(426003)(8676002)(66946007)(6916009)(9786002)(36756003)(26005)(7416002)(4326008)(9746002)(508600001)(38100700002)(186003)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1rvUZ/5uNWH0oBj3EMGoCMGdZHeFoFltosf7R6WNMGS1mMLdNHg/WCwYJJn?=
 =?us-ascii?Q?rEGFHZnPAMzj9wqG+/aSU8PGqzlExreOOXMC8xoXV45C+RTi0N/IfoJlS5s6?=
 =?us-ascii?Q?5xo8F6uKrEYVfjZfwSF0GEamY6oA939NJkVjignxGq4sIhljy7/3d6F5xGCZ?=
 =?us-ascii?Q?mT8PUrcnDsbOnYrJ7WWofQbAl0PFwbuB2IsAUBVaLKJEw0ZOUc5R9ecx4Q/9?=
 =?us-ascii?Q?hjZG2Aeq77m9SoW4YXZgPqdBDMrPwM0KTpujA4EBF2d2aWpulrXeOJKKgoIP?=
 =?us-ascii?Q?SKS/b0sdBM7PvOg18ZkHw8znnydh+5m6jtCSwU4HwH5Xwd6sX2fczt1ZQJLX?=
 =?us-ascii?Q?QxhjcUWVB/AKOektrPi3ry/XugwO6scakyovKhiLpgjp8yEnfQuvX7UgHtRW?=
 =?us-ascii?Q?4ZhpUcl+XWSXrW52MkSvOzX2mrHW6SAZuNaNFGUgUC3tIi4hlcPKB++OR+vT?=
 =?us-ascii?Q?HOhlkTZdBAURfLEModVt+0rmh0tzgzWqbLPBYtF5FfQNEGElHwSsCo6sw80B?=
 =?us-ascii?Q?7SlPz8Sy912eGobpo7ksZ9ovPILIDaAziJV78JQnS0WWT6hLdjF76K+DWEgF?=
 =?us-ascii?Q?zFESASkmpuFtbUxBdUxgMQxHyDS6YVrm+uXL+nak1qAeR7tcFwHlf9Uw+THX?=
 =?us-ascii?Q?MFWSBgNxz0t+QaEnv1/sVwrENOeS5EIeRsVEYU+M41h0hTZxE2ZkvhlearIz?=
 =?us-ascii?Q?OcivQ01VZ/bVZNB1smZHe/soWBNeehVVEc7FsK434xwfFpSg3vTjzNqhHcuR?=
 =?us-ascii?Q?aMHAWpipsYNSiuJcewI0iXBGh2ZrW6WBz+BkrOc1ZU2zPAWxeQOkyTTNYK3G?=
 =?us-ascii?Q?HakV+72IUmxa79xkc8FDbpps7mYnMusSFj+hYclhE4KA1SifbPfdSwNwFPVR?=
 =?us-ascii?Q?8KFwZpFdss93kMS1kya7g54vGKSntKRf7+NCit8KcrLby2o56TLyHbZISjFW?=
 =?us-ascii?Q?zC8vHdMq68oGa5kAyHG6EZKOP9xrUrv1M1/iuRiLUrIVQuAmYHI0/b6K/o9r?=
 =?us-ascii?Q?CrSVwD/2D5tFCj63ycLWOVJHi0/57yb9e26eonKGPIzNw6AIrx3cav1670ge?=
 =?us-ascii?Q?bxb99Kn1TlqwTNFI6ROy1d29XKca6IHZywEyLDrxGXpPl0dBnm3i+XvwMayM?=
 =?us-ascii?Q?9r/Dq/CmB8BIVi2urVocChShf+x0jnIJl1kqMTBnPDVqEIIWQ83yYsV45zCd?=
 =?us-ascii?Q?gesKkBFM3+/jLd8bGPQ4z8zco2Kb/i972S/2h9Ydq3O3RQ/RgrMCOuJMKVsY?=
 =?us-ascii?Q?Av+3PUxzINIJ2Vaqcb7VLrlmv3AsOuyaHOPlOqS3AUr2tPTO+GX+IhCqWiXu?=
 =?us-ascii?Q?+vfAPaxfxiST7QHOc3cPwxZdEtQqm2mg1LqRrMMjjh23FMdibcvOVHQ+1yVe?=
 =?us-ascii?Q?3K+cmcXGV++nYc9vN/vGb9hxkAEqmnUW0ZjHk60BU+i5BaFguGlqTPKJ0F4v?=
 =?us-ascii?Q?M0ydw5qJ6D5RTqQan3o6ZmREN1PZkFffhRBFmn8TXTiCECqZbpzOCYjDqPgt?=
 =?us-ascii?Q?cHHTB2Jcb1/WS+3Vh97xzBz/EgNWj/mzm+X+f45kIyybssRn2NCwsws96aZJ?=
 =?us-ascii?Q?416ICV5pqDu8wjSrSOI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ced675b-f583-4304-3b04-08d99e1be3de
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:14:47.5636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8fb+uyYQWWiMon2enoxMHvT6yuYDTcxJk6Mbr/FxyuwB1cRgisuQFPKfZuV5rJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5063
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

On Tue, Nov 02, 2021 at 08:05:51AM +0100, Christoph Hellwig wrote:
> Just open code it in the only caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       |  9 +++++----
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 16 ----------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 14 --------------
>  4 files changed, 5 insertions(+), 35 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
