Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFBE4FC448
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580B510EBE3;
	Mon, 11 Apr 2022 18:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791F010EBC0;
 Mon, 11 Apr 2022 18:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkvVTjdr2kWFwo1n9nmQd1CLABTLOFV7813jri9yQ0YkLLfVT9dK8rAdUMC8otfnc7JHwxa1r3UhCBZ6EAty7TlPQdMsKfxylRRpKOBwq+2ipcXZG/sAaoeFIFqa1vRtK/FN9qc+9hV1uaL55UAkg26M9RAbftimFNKNakaXvdd6HJ5vM0On5DEFZGIETKJatFWMah6cpovoUXth4Dq29CY8/75B3+vGOgSsUh/jovtoSxHDOdvSutiRX3f/DnRU38flZGp269eG9cimg1jfJ+3BrOyBeIhk0BGnGAEkeDFx85RGGdfnBtfBfit5XSPkSZJV2H9Y4XMvxXN0y22Kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5SLHBKh96sDYwSj50vo2N/E08E4SKejJOxBlLhKb5U=;
 b=g9kFVFQ6Mgq/2+zRpR2KihAGA6qZkA8NWRFiNQcwkfhDO9SgIrEMqrEvKkywTSMvr6cZWdLOA53DP8iU+mLlWiXYoF4VJz6FULKXzn+gqTmT+UWdw9Z50wE8oklm9sVWj7n63S1eiYJ83C7PmEg4gorJETBRY6gNiSiipUC3txBYybKdlNrCxEpXUaxGKqXvYWCCSl45an8jl+r26yN1qxdxoo3VVsnXnAOE9HvArwraBzy1HEq/CGf9PCS2XYdS4wk62qtwLSczSUc5EveHJsQbHtliQPM2Mxs0oC+fqYWu4wo2CFh9cV5kdQPtYpQTIwuXHezTbiPaXvkUfTrtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5SLHBKh96sDYwSj50vo2N/E08E4SKejJOxBlLhKb5U=;
 b=ZG1hXP+Xjadrj2jOKlPGWWD64yvZ+pHLDrgsTh90OU93zwE10/RzlOhBZphmA1gahDHLMdD2SjrcNJyHAntBQ6LMN0mcRnpeOXaUD/f46uqC5+/YerxxEU5yVP1KX4HRi2B/CW70fL+rBQ7yjtCVDDKxBq6DKF0Nf1lNcJW0hNeAOG3dF/cVruPhvD8usvBZGXvnXXxTLuEXikH/mNldBt7Pi8rr0Uki8L6Dx7AU7eAzM8j+5OnI3oQ7BNZ+OixiHnwb7DUtnJE9U4Nlixg2+2163/Kzo5N8SG3Jw+JuTA6SY5dNJ04lyI2vz2mPrIBoJC+vMXzRYKAKkpsHpTnIew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR12MB1610.namprd12.prod.outlook.com (2603:10b6:4:3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Mon, 11 Apr 2022 18:43:09 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:43:09 +0000
Date: Mon, 11 Apr 2022 15:43:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/34] drm/i915/gvt: move the gvt code into kvmgt.ko
Message-ID: <20220411184308.GF2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-7-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-7-hch@lst.de>
X-ClientProxiedBy: MN2PR14CA0022.namprd14.prod.outlook.com
 (2603:10b6:208:23e::27) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76dee174-4330-4059-60fe-08da1beb1ffd
X-MS-TrafficTypeDiagnostic: DM5PR12MB1610:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB161037F238CD4AFDC106387EC2EA9@DM5PR12MB1610.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mmuy3W70GzT2FrrGuL5QiPEIL7SGSn3+yZcllgMaLpN0pDvZEZVy0zap8f/Eublk44Cn/siJcVqf656mc7qqvoD1vkC8Zz5+nqYt+rqU8k0YIzph18EIwLtfauyuhV2M2CWh0TQcLSk0gelV3vBvcaJWjfu8X1d0G0h1MJufo1Uz6sserh5ynmrXHUc+qHLb0VZ/QaWUOsT4b8x4Jsd+wzSSYAaChziw4jn4wpHflEaL7F8WcUn0JSPerXOlCoxK0PHQD0LE327vzim+5qH288M9Poo0DsalMRIFQ+ZpA8pyDlpJBlJVoHvGiNVYdRMh3Qd/I7Ls/y8n0s4HjnTmR8pCATHK2Isy9XJLnXFcOaDbYxPqBkGLL0IN4HYDrQafCRVyeOGen++KFf5UonIOVPerEx60DUkPyOXIeO5cEW8vMmC94G8S80q4n+YiXwbFRvHrqSmcdj6/95aA0s/G2/zKlfJ6or4u8IjUZn9YBnMpg1F4M8128d6TGF352CutmYYvsanoCfWXmwnOm3pUxGVCh8acxcYuH4hIzsRVZg0JtOc4vpx4jf9qyfUt6Hi1p9HsaE3vjXGp/1JgJ8DB9xPSnU6aoJM12X6K7SynzibZeSWxVXF0g9/WD3CRy3YHFAdVz4HrZdpJyDkSUNSfWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(66946007)(4326008)(6486002)(83380400001)(86362001)(8676002)(38100700002)(36756003)(1076003)(2616005)(66476007)(66556008)(508600001)(6916009)(316002)(7416002)(5660300002)(8936002)(54906003)(6506007)(33656002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2T3E2PVcPBByBOX+9dxFNNijrpPBa+jPRfawL7jOeqzYx1MD86mSKASlZeGn?=
 =?us-ascii?Q?hqYgQJ0TnY/XHpqBy3P7K1W4ec2KZCCSUQ5uZtYwZvoPqgC0JBywddPXyEa4?=
 =?us-ascii?Q?/ZlMnkpZgwyd6grHbawZTbYthtjVLgxlbNdK4HzX/tiJ08N80c464kFVure9?=
 =?us-ascii?Q?3Qp6HeMXgSY+LXbOY3YRSWmrjVen4UwlMGsOEaFR6OAj6DRDH8dGTMfbkUhB?=
 =?us-ascii?Q?l0q4aHZVTvDn62A2R/3+o5+X7ncIPJooFD9I/iLQ6wdp12D2dhckTue6htQi?=
 =?us-ascii?Q?vbGjXB4gxk/HWi+AeblwwD4x8B2gqmxv9r+tl0uVWLR3JLy3731wzpYh/ve5?=
 =?us-ascii?Q?i6tE34JkgcxotzR6S+GsLaMmjraxhYp37SFnNqPGZOiv7ld1qIXkzp/fn2t/?=
 =?us-ascii?Q?7iOfHW58uL6xBA5Pv2aOF8E1mpEO/8GUDViyWnXdtWZUTWoza0bkDrf6glQN?=
 =?us-ascii?Q?xMVnj/rRh8SBjBd+trGKrEGZ4W2U4au/1v8JQnC7DLeZOyd7lnBJQ7zYyPnP?=
 =?us-ascii?Q?kT2Rc9emeM0kna86H6r56e3tj1btrQTb7Bt5L51lgKV1v5KAcex0TVWQ7m10?=
 =?us-ascii?Q?+cP5z64OHsszmL6kbkrewd5DyKSZgdwlk4v8vUW2RGaPtVJufKE3uLycWTiI?=
 =?us-ascii?Q?6xjR1yNaQ7DNVCJQVyQn3zkL5VvjijZB0JkFYDVp2r81WOSlBAPf+X806k4u?=
 =?us-ascii?Q?4CtMarbUmAaw0valZL8TQOswVqysI5qxm2ZIQBDAGz2U8WySghqNMUfBne/a?=
 =?us-ascii?Q?kzkULZKF/BUA1LsFIlON6zM1rZNesLMUQ4xaEyfmvNswsxXdrxaVpj9dUZ97?=
 =?us-ascii?Q?NFx7YFBlC/aDbfH0eteUofApsVTKv6GijtAxe99hlhuC5k5cgSDVOthhn9Gs?=
 =?us-ascii?Q?8KC09r0IZ0JWl5Ge+2CbIOUmsfQTpTdfIcHaMfw4VMjw/ixhQqXzduccSS5U?=
 =?us-ascii?Q?4RjQieSETNuhNjCsjMsPu9/xPqYY+gfWXWYQ+vGr5MB+3NMLSZCbOQ2CqVIQ?=
 =?us-ascii?Q?Hv8oJIt8J9UHYzRlz8++Px4IsYjr3rpyBLHzhPqFUBpo5wXWtZHWxUUo0tKJ?=
 =?us-ascii?Q?f05Ji4/suWFSrcAWrlhaPUO0QT4TxyAQXyYotna45Lpzv75cGlchkg8T97bp?=
 =?us-ascii?Q?B44+FkMDuNyw7ItT1Paw8eOx8C2gzKZInlmrLeDFWCpML4uGrD/SCAsMjEmx?=
 =?us-ascii?Q?plcrG5BVsGJwR5DKYdQkZte5aaE2LWrlCLJtBrgrrqDqaKKlxxxahErBbE0R?=
 =?us-ascii?Q?+W712Sh4bS6/waMV9yxaue+pBeg5Oty0q13MkGUaGbGlP5HnLmtFCVv8riWy?=
 =?us-ascii?Q?wFJ4B4y/+DLbH6w10XGNM9wKFJXRhvmWRl9qQIxSuDlx6hxBikV+7Zs2HPnx?=
 =?us-ascii?Q?7Rxw8foQCYCwlNl3B+jR/4pks0GjsAtvjF/cM5/k4djfDiszaB5RMNkaFAO/?=
 =?us-ascii?Q?L3DtUFFDQPxYez/S5lYEWayis1Av/aXaV5MoYQ0H23vC1GeKN2+1Xs63W2wG?=
 =?us-ascii?Q?fKI/P2xAYNCTqPzByfeE3E6WXR2kbJLr0xa1DwABxuxDyvnZxOlEqf2fp244?=
 =?us-ascii?Q?Ds4u3pguqCUMOK2f+Fbc98qalYBThlkdM2QEQ+mi3n4FJskb/j46HkOCR5EB?=
 =?us-ascii?Q?sZOjitdZh4PoY2u50tvl5ZfpmZcO3mMw1Iand3HlySz8fBtgM7FPK1oNyBOO?=
 =?us-ascii?Q?yB6rghKRUQywKAL5N6o+Omk++IUVovkF7Dq+d6nvpEnYn8/eDMvJ83z0CBCr?=
 =?us-ascii?Q?suKIYq9Y8A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dee174-4330-4059-60fe-08da1beb1ffd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:43:09.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3Cx/2EatSnMclBlDLI2rzGFiaKUi3i+3+DPOLxtM5aU0P1w6KFkaYswMm/+nrK/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1610
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

On Mon, Apr 11, 2022 at 04:13:35PM +0200, Christoph Hellwig wrote:
> Instead of having an option to build the gvt code into the main i915
> module, just move it into the kvmgt.ko module.  This only requires
> a new struct with three entries that the KVMGT modules needs to register
> with the main i915 module, and a proper list of GVT-enabled devices
> instead of global device pointer.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/Kconfig                |  36 ++--
>  drivers/gpu/drm/i915/Makefile               |   2 +-
>  drivers/gpu/drm/i915/gvt/Makefile           |   5 +-
>  drivers/gpu/drm/i915/gvt/gvt.c              |  55 ++----
>  drivers/gpu/drm/i915/gvt/gvt.h              |   6 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c            |  14 +-
>  drivers/gpu/drm/i915/gvt/mpt.h              |   3 -
>  drivers/gpu/drm/i915/i915_driver.c          |   7 -
>  drivers/gpu/drm/i915/i915_drv.h             |   1 +
>  drivers/gpu/drm/i915/intel_gvt.c            | 200 +++++++++++++-------
>  drivers/gpu/drm/i915/intel_gvt.h            |  17 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c |   1 +
>  12 files changed, 193 insertions(+), 154 deletions(-)

There is a few things going on in here, I looked a few times and
didn't spot anything..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
