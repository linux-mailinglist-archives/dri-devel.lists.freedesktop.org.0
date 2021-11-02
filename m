Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9920442F8E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 14:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455672CDB;
	Tue,  2 Nov 2021 13:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0709272CCF;
 Tue,  2 Nov 2021 13:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdvpkiRwiBKAiTWsq5AZh1oA+crBC/g/F1A7NQetRNThqUFsiT6HCcvEASbV4Fd6dKBRG1lFOZe7uiDRK66YwYXt//z1RKOnl+o0bcROxsatPFrYzOLJqd8KbCNlSBUTgvWr6TIIylYgDeBQOhuvBxaWtEoFBlDu1s5ONOD8LYHA+Zs++Q/NvM7VfAdCmyi8994ANRoYrFe3VXWXAqzBzwPgpLjh7nJsizC8RfQFpmvooTWcc3tHLy5TqJqZtp4r557Di0Dwkhi4KR0yuJ3fPW4Pi0NaLpKtPK4NMOT+R8G1mMyc7Lj5ToYm3wQV5FOKrBgf2G6NupyKdppQwJcouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcIGyA4ST71YDMoHlEUqKnICcaJra4kzaT/70hRB3jU=;
 b=N2zvOltRCPPmI3IWyoFuL+we2XUxevMyy8fCLNyG+JwC8QfiPW43AVQYFMkEyYq+Z3/8gtblMfXWIaJkZhUen0ec9RKu2Lm5KJTdguN5O4nfaJW721QrSCIVs0mbD5r7xmbKmPcoyYVUtFZF+0Afq3IUZNeKvT/lza7msHNv/FutjOSlZhToA2kkJIy1hu5OTYMGRDc/8wgEf9OTleLEikpZvNH5waMomf2RMZA7KHNHythAJdByCBzccLeUiicyrTH56mNh1XMY90iqezsS7zGcAVpmLv+ujg1Ys/kRsyJvBq4gcM5qo9CeIYmATDY6vwkl8x8p9PT1cV+mOoZLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcIGyA4ST71YDMoHlEUqKnICcaJra4kzaT/70hRB3jU=;
 b=h4xS81WtSq1VLSUvPanm/jcPMAJf3ZZ8pF84A2glj6edcbHfeKqB0dCeujFp2ZIt/cnpF5qW9Eqpnizct0WtQEUbv47Pg4qUnYbT3uF09KcxpJLUAO9Ip6qxqJ5//tByEB3PHprkFX8YosSliSOgQh5F5j7rdk/C4NaOb/x+250BPBoLALqL9o1b/8k3jdElBfJ9gjSEe3H4WC2ZEHSnX9jFdS4Bgrb1a+nDdRSlt+4+yAYLizNWdVlPcEsoa4lrYM2oSIkX3FITCISYYhIU5oPhNGC+hq4708C82L8KKSsffcxmXeO3EM7zLVcxccMGpudjB3nR2nLz1KSDMcmFlg==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5556.namprd12.prod.outlook.com (2603:10b6:208:1cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 13:57:01 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 13:57:01 +0000
Date: Tue, 2 Nov 2021 10:56:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/29] drm/i915/gvt: integrate into the main Makefile
Message-ID: <20211102135659.GG2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-3-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-3-hch@lst.de>
X-ClientProxiedBy: MN2PR15CA0041.namprd15.prod.outlook.com
 (2603:10b6:208:237::10) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0041.namprd15.prod.outlook.com (2603:10b6:208:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 13:57:00 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhuHb-0058Xi-7r; Tue, 02 Nov 2021 10:56:59 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e72862ab-fefe-43db-6724-08d99e08a4a8
X-MS-TrafficTypeDiagnostic: BL0PR12MB5556:
X-Microsoft-Antispam-PRVS: <BL0PR12MB555613D83108B8968E5A81BEC28B9@BL0PR12MB5556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0iRAUMyFiXB7oWFCoa5o4lmtfoIdkfydcX6/b95I2/Y6uFVQzwqk9DvtxYcGejwLUQe2T4s5ykw75qFxKrZlPUgKG2QBFpTxR46qi4pgAmvWsT/EKB2Rji8Encl10YeDmqbf/hRfU94KtMd4eaqzXKFO0eX0zEmv45LJE5lKW+NuTEugtXcJw0fQBi7QoMggbMp33ItbuzGn83VZ94lnBGEPfbflIitRjHb8+9lukry18CGBfFwWhA3zYQDCmExF0CiVGl2F5d1D/YXLyvOGbk+3Xox+2KT55CYClPcMJgaEkegQxZ4t1gAhxP2Ero1qI3hk3DIfwPvF81C1r5V91MlClOV1j8qgrfRpcJ6PBcvGXwt5w7fCYi0W+SGmfBn5bQZszTLeEX5TftUWTmnwT2WDp/18t9KwACDUDGVOMTV07/c6vEpqoXXiua7X6vqCGdItOPuo3eQ9VbPDadCy+wwMP2cNuossm6Pg7NdaEYMoS7Bw+vWOkMhnmjyR46WHoiZGN74x3n7Lko6Stkr6/2BOBwRXPUiGG2ae/jjJqy7mp8XU59M1YJXD8Kg/NrTK+uMqrEY3iGGqL0XhsLUnrU+rMR8ALE1xXzsGPeZmZu7cPz37u75WFjUZ4iFflFa0vZqaRxwfeLZrUBamjgE+Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(426003)(38100700002)(5660300002)(8676002)(66476007)(66946007)(6916009)(66556008)(54906003)(316002)(86362001)(1076003)(83380400001)(33656002)(9746002)(26005)(508600001)(8936002)(186003)(7416002)(2616005)(36756003)(2906002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+FaOzfQLpchfqN3CGwFToyYDOr/a2umxns3EUaT2T/4etAQ1p5sKkgCLc8Kp?=
 =?us-ascii?Q?EiRk59AMzIPR04DbkRT4o6AmnAAiXzFa9+yGZUY/TZhFomRsQlbikwWsNec7?=
 =?us-ascii?Q?0Oxu8jXcBtxaz2doAvhjnN8xWCyWIAINYTlVKc6sCI/pmXCRTabGDlH0Q1xu?=
 =?us-ascii?Q?v7bRYDc490OU6rQyU1aR4t0xY0AiG/bvf8SsEKm62cf+Q7Z5eJNkNNrGktQw?=
 =?us-ascii?Q?KeTwBlQgnQ23QGLqpUypVmqw1XprGk+8SL/A/R7+ejhqR/MuyHPaNLhjlA6R?=
 =?us-ascii?Q?/MHeM3lJp/IcvKbYd5mfTRla03rlaUlmkBwRP3GtKus2GbnQA+iyDAsPjQgm?=
 =?us-ascii?Q?tcNWzIsedc5YZ/OQyB3rZSk3YWHavFHdJ3cB5NNun1psjXpjdVL52PMt3TMG?=
 =?us-ascii?Q?7j816x9gXNWzdF1tqaRDdnLBJGsmDKqODADc+lzFDjab3hyFm/IWdL1gx5PN?=
 =?us-ascii?Q?47hpzLeE4kOJs1mMqWJOdhcGNhOyZ2yHbCL5PaACayxT1Kae+VUKTbIE0STi?=
 =?us-ascii?Q?qV4rt33BqNf3y5jh164heR7BwkQS+PVlUmpx0J3pgDOApK7ypeaNhVu9saoE?=
 =?us-ascii?Q?Few+Pk/xoawZx5fCVNX2Bndd8/jVZIEgGMyRfawPZj6c6nuN2v7PxaLmv08v?=
 =?us-ascii?Q?BswVRpVXjMQ3tFYg2X/kZt/qGSXwenYX4AnpGZcR7LwlbYFA4yfyVar5Zsis?=
 =?us-ascii?Q?NEIdBAgmxvJz8A/+dTvxVCV+AANm9+Ml8HK9CN1gNDV4JtTIfywuXIht2IDL?=
 =?us-ascii?Q?DTZioaQynouWKRYUJ9+RfmaWHwVj4o5nZ+bewarXPYhGxjdlFmzze6JlaJvo?=
 =?us-ascii?Q?uHzsJEPXvznIsuq8ZYrTuOkhMs9CH4FgBpORRNPUoD7Y5ubeFukAz/CaPmHH?=
 =?us-ascii?Q?hhNDj1x2dvFVSRVz73Dv/hTSPP9J1ahhLVWdCM380DEKGwtHgg8DBv2ikDtQ?=
 =?us-ascii?Q?rBXYO1egssF878yOkIU+h3L7GuaW/M1+BCG19PJxgZR0GikXy1NBaJrb6UFG?=
 =?us-ascii?Q?0U0dCTrkfbHLPSedYlCSbQWKce6ejCOHysd8sdLLxpviodCOx9znuyHFgMv7?=
 =?us-ascii?Q?C/wEKB8SuadlSPUkJYYc5lLxMn8yWtQIsb1GdLjYOtD60w7iE2jwfvSv4rQq?=
 =?us-ascii?Q?We9qKn5C1xVD9akBx8etx0gWpUmrI5gxYJouMqgPN59r3I4VvxkBkM8XIXR1?=
 =?us-ascii?Q?RVAIp3CaWfxjSKq1sM4DFfyTAAnSuCwtWvSdxjYKSARo2vt7S207SGsLg2QM?=
 =?us-ascii?Q?V8OLfusKWigcjDyZ8XDyvhVO0ZktVNQOaloNbI2uE39mPhliseMJp4mAfyrq?=
 =?us-ascii?Q?G+tKxXlu1X2I5AZSmuG0Vnbt3BVbdM1ubp4vfUNaw4QF957wEQ7KQQVresCc?=
 =?us-ascii?Q?JpmOPkYcryit5LxgLbrNZlAOPjAKvlPL7XftFsTx+YriSQ8jXV/JbL3pvwyt?=
 =?us-ascii?Q?d0GthbXnD1vtQegjWRVYvHKaQLvNJu7tt81h+fcPUzLOraz7RnlrlsA3ap44?=
 =?us-ascii?Q?gXqQoSJGkVyUVp7KMlcqxZ/QhVCmpGIlwS15FzHu/4ppYYRSVC4aYXZusmQt?=
 =?us-ascii?Q?r++9yCd6wfP/fHNEjy4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72862ab-fefe-43db-6724-08d99e08a4a8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 13:57:01.1900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzQCwp1gXgsKxnxnYTaYeW023WxacnLbybMMsQMcvTjenOlU7yGosrjpcKt7Ec7U
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

On Tue, Nov 02, 2021 at 08:05:34AM +0100, Christoph Hellwig wrote:
> Remove the separately included Makefile and just use the relative
> reference from the main i915 Makefile as for source files in other
> subdirectories.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/Makefile     | 29 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gvt/Makefile |  9 ---------
>  drivers/gpu/drm/i915/gvt/trace.h  |  2 +-
>  3 files changed, 25 insertions(+), 15 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> -
> -ifeq ($(CONFIG_DRM_I915_GVT),y)
> -i915-y += intel_gvt.o
> -include $(src)/gvt/Makefile
> -endif
> +i915-$(CONFIG_DRM_I915_GVT) += \
> +	intel_gvt.o \
> +	gvt/gvt.o \
> +	gvt/aperture_gm.o \
> +	gvt/handlers.o \
> +	gvt/vgpu.o \
> +	gvt/trace_points.o \
> +	gvt/firmware.o \
> +	gvt/interrupt.o \
> +	gvt/gtt.o \
> +	gvt/cfg_space.o \
> +	gvt/opregion.o \
> +	gvt/mmio.o \
> +	gvt/display.o \
> +	gvt/edid.o \
> +	gvt/execlist.o \
> +	gvt/scheduler.o \
> +	gvt/sched_policy.o \
> +	gvt/mmio_context.o \
> +	gvt/cmd_parser.o \
> +	gvt/debugfs.o \
> +	gvt/fb_decoder.o \
> +	gvt/dmabuf.o \
> +	gvt/page_track.o

nit, nicer to sort makefile lists

Jason
