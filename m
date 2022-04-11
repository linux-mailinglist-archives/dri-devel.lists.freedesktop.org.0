Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E44FC1BD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F4B10E3C3;
	Mon, 11 Apr 2022 16:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDB010E3C3;
 Mon, 11 Apr 2022 16:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQuaz7Bqlam37SLW6bW7g2YvClhGiw5dpX3+mH5VoLaAXVkzILS/o6uEOev7L+zEl2m1gfina+sCIkmltJty8LWOTkahp2IXDl/j6j786JPsSNwJ0S0+X+8xrVjYY1cJrxWsVN4tZ6jHEMJeDOrLj/3R8OmWXIEMRITkQShk1lQCgtu5T2pP9kwn59DLxqqUlFu4PFybG/Lu6oCwTP75UMg/ggTzOOyseh1Z8RJP6wYOQstFeJmbvW+pRugbyol4+h3eX5QFHuWLdiwa32QhMd+C41g+T+nmc9M3+TlnwLhsbzCzycXDb3tJ7DHzqp0WrqPyDAIaKJ7rz256iU/Vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iI6kcpaMTRYbGey6MEi49l2UOUNclB7CVwCk/tLptA=;
 b=IPN7wQDwF8qy+8TP51DpWakNltcdxJo3ftQAyB8xWbg7c8uPdYFWP+bBbVATG5LJ0j0hldRC7lA77yUpoma7PriUWH3qF8CSA2OEcT+lMP2YDrE9IMdtOrASy5oRtOgyMYu7QTip/mvsvEfshyydaIHlRGJDKKW+Y1Zcoon4YCoOMOroGUfX1BFGFPNG9s5nJ/f5OxMJSA/HhWpL5q0ljyCr8qoo/qFgMfEDk9QsdfpEgudOGUwiQbGlDtfYo61+SA3FbMkf6mKQOikyDw1g19aSrAyeFrABGYZ7qh4IZ2MtN6sX7jnNcr/c7OBxf1cu3Qrr5lSPaCnd5g0KAZDkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iI6kcpaMTRYbGey6MEi49l2UOUNclB7CVwCk/tLptA=;
 b=l9ip/jGprLNuSB71DKOJCFwODa9SlrOZSS57RPEwiEta/rQ/BgcLypbegN7N84FMGuQNfbD8EYu/n97I1YVUHvNHEe6RTwrfg0wx+X4VL1kxvjKThikpa3BdvB/k9XVrsZrpmteReqNnJjkOkTSQt80wWcEyrFag27vT4k60dmXYS0pUW7qR5SGVEFhP/cXjz3KTgzzlyJC/92mzVq/zbja2W1DiSwfQ+qsHGp1514z23CHIfXo8o/yYK3wyPtn1DLJMV7PonBkb0YwtfLJXsN4T2eD39Kd5RmY8+kxcFIuNiVQqqkkORKeOdtUu00hbUzg0RexLvnKgRt/wLuz0MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SN6PR12MB4765.namprd12.prod.outlook.com (2603:10b6:805:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:00:26 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:00:26 +0000
Date: Mon, 11 Apr 2022 13:00:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/34] drm/i915/gvt: remove the unused from_virt_to_mfn op
Message-ID: <20220411160025.GK2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-10-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-10-hch@lst.de>
X-ClientProxiedBy: MN2PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:208:134::36) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 679c8fed-98c5-427d-17ad-08da1bd464de
X-MS-TrafficTypeDiagnostic: SN6PR12MB4765:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47653D4AA5B0B17431B02714C2EA9@SN6PR12MB4765.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjbYaDfMtFxGk0+e6G2PdTVFU3hwUAk49suefNU9JLwoTZyXlZGA96H+7mIB3HWWu0KjvR8AwiD490ST3Q6S2kC+ILog/9bdBB9pdKSsv1HDSemoFMg8/0NhmVDy+6zuFqFpfNGftc9KetWQD4SuGlqqhBjskWH3Nn7EPIk9Nlt+ZIaF4e+lNSEulHc/8XTZNZ1gt8J2gpqoPSmyoRCzka97qZIhAshcXKHwkhpKb88x9bx+3bjGYzorUSuwKlSyibPPfLxTmJzZzVoUojPjDfrJ+ua5rSdlo+P1I0otaXrOi2M7Oxfb3BewdOu2Np6h5NarLrrwSnmNqL7wWnCvl5mxQQdZo2lXXqNHsku9dlWdmDNcxcDTcv/ox5/qI1rIMIwqEuLtmgwesm3Rf+4JomVtvfEgC9ujqjZzFw4m/wUG/C6c/YneeKpvgfT0qf2vIDXDF60IRD8xlYGLGd0yhWcbJpEynH/DYSsXwWmC/0kGUczVOkBIpduqcPeBukPmAvsMVgtxrI9KsOC8Gg69sbmf8Bzro6PV+yV2+aMU0PeHgZHVLOTA1mAaR5qjnJaHeMKdNShx/UIyKv4rl62zUfSoMcjxeP2fhqX7f7IG6Lpxo071JuQ8lWCrJKswC0kgEk0A3xiV5E0mo53UjYRhRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(66476007)(66946007)(6506007)(7416002)(6486002)(5660300002)(33656002)(4744005)(66556008)(26005)(8676002)(2616005)(508600001)(6512007)(86362001)(4326008)(2906002)(186003)(38100700002)(8936002)(6916009)(54906003)(36756003)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8eiygvzlfKVz8PRBZzYMf2pXqc7lM5qnKwBkRh24c9KN48t4eySUdUeO5KL0?=
 =?us-ascii?Q?irOslucJOd87n/saE9Z7mYjyrLV+ADWv/HJu6gXv2aYKvjcNEO99+ktmVjg7?=
 =?us-ascii?Q?k0VFinnM3vh2o/Z7mNGYl8LWsga+3h0rNoJaoIxQH3uTkPa7LoQ58MFWOFWj?=
 =?us-ascii?Q?Lc7TryfRy0lp4LTYyNTY0d0ZnNLhZHsZu5yfKadx/jGtgWopvvRVSW6e6xx7?=
 =?us-ascii?Q?uIFrQjtZ8MF51Bf+ZRisjHKDfbBAWhaSeRwQVXD9BTysPG4Q62Nw0TFZ8Gie?=
 =?us-ascii?Q?Zq5vmUpa/2z6vjGr0oO1/6ZRLILGV3mJirj38sHEt8j+hdGCd9AaD59m6Ycc?=
 =?us-ascii?Q?+QaXMqYf5W9PTa07JTC94H7w2vqqdG26uq7PUdbC9UtROzF8mIlBr0dAW+rg?=
 =?us-ascii?Q?2O/9/PQoLRVT6dy53hgITuX+35Zu/8DAEjv8qTvDOglW+UGPZoOs+F0ywLFj?=
 =?us-ascii?Q?lCBeNAETb5V/tSXOEQGrqvcn3htq1MPyNTRvmTNJZkF4M7BcQBU1BprjqXMR?=
 =?us-ascii?Q?jXjReB+CLE8eUjI2MjCC5TwyRlyL4ZdAZOwmwLxrFrQ2MiNuOuV70VyrCPKn?=
 =?us-ascii?Q?pEln+q2mOpWR7Z3JpDY2koD1odj/TMReGA2RYYWDETWFNvamz19OOPctL8z/?=
 =?us-ascii?Q?e0h/tTA3v5rNdBCkN6kKUGMjQ+Zbpy5OjC5N3MoIehFvHxB/D07aHbXFO81l?=
 =?us-ascii?Q?yrLmRDDLwqSnAxfl0JVdQzTBWbP1r6xTFpjRMzqmed8AslUactoJPnRMyfFH?=
 =?us-ascii?Q?ZdBOLrCMdgAMDKpZqsmPpQIyfVoC4p9vse6kGot5F3jsCilazaivmKPctWxJ?=
 =?us-ascii?Q?NllQu4l0dKwmqGuvar0s9lW4/KSIS0hNVaEOzWbAkq7ZFmdIJhJcqN6aPEJ2?=
 =?us-ascii?Q?Kg9Z3CXk/9B9S92Lwv+uoMVQwWzGM6ayNc2it3hi1ss2G0pOTczCdw8EzegL?=
 =?us-ascii?Q?rVHIrKJOEMRIWWBcw1SJ/b87LP4ctTOhIUT4gDthDnG6r0aTgUmFYS7g4cMs?=
 =?us-ascii?Q?2xqxXFVyOWMc9NcyuPwEfclofyV2Zj6uq1cX6ul6enmfF2tjXtlMgxsuetuO?=
 =?us-ascii?Q?Sio6fdmmdGXjKyECztBpCl9DwB/VQg6JbAlratUZgvNJfyDeSRqtxDda4Ffc?=
 =?us-ascii?Q?M2uk3DHhnvj3lbWqWZWPPOzziPvfHYHnosQi5hR/i0fdvDjoMVF5qyFK9TC3?=
 =?us-ascii?Q?r8g7ns+p9WPmaaRv80N+x1MVpnwmxfxFde2MPmU9fDri6ETae2QHy3mTLS1J?=
 =?us-ascii?Q?SmhJo2RITwrrqv08WnCrRNpfudpTV2bQeLJFgM7iVH2md8LT8QGQ2FQsC1cE?=
 =?us-ascii?Q?M80olwJUgMQIDZGqIsET8D8dTF9BQ8Y0SlpffifmlCyuDX5bE3q3t80hydDD?=
 =?us-ascii?Q?NHEwvnlKs9m0Tr1K+JALW3pKjz09FYqxRql7POu/nNpVmJAnB03bF3k6DkTL?=
 =?us-ascii?Q?Z0TXpUpVBpplfE73vSJcPC55sxgJK6nSZj+CuYWyKfhInTXKgFujkqtBe9aN?=
 =?us-ascii?Q?2GrXaKr3/rGX20sJmAsTVXWunLU7Otv2Zb1mRqN9/oofSmJujbUbqudDiK+5?=
 =?us-ascii?Q?xTqr9g4w4wtfba+Iqq/Z5mZQPhbK11lhwantQYgU5PMj5+n0jxDz5JkXppl5?=
 =?us-ascii?Q?JzP/lp4h2HpxSE6fxFDzCEQP3RJ4RS4oPh4+QYxNEJ2VSFqltnsKgEL8z4Mi?=
 =?us-ascii?Q?lSm2f1kMYvL4sXs39Eeh1/Hl+delRVioiQCY8EyejPLpf6VqOvRFhZRBQ0/K?=
 =?us-ascii?Q?9DPAkwGnmg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679c8fed-98c5-427d-17ad-08da1bd464de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:00:26.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMPYpNUIqJ7LlNUpuu3by0aWjCt0FW5VWH4n9jSdsDP0Fr3vB4CUnwUDjm24uv4v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4765
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

On Mon, Apr 11, 2022 at 04:13:38PM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 12 ------------
>  3 files changed, 19 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
