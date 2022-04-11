Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A030B4FC1BA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A9D10E759;
	Mon, 11 Apr 2022 16:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B170E10E454;
 Mon, 11 Apr 2022 16:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK7rhmoxZ6STyHs1GrjhlFU5v889uxmjCNUTkayPlBdU9yeQVMs4MwJsZMkZA86WjM2DJHZi2fB8itYgfh0WtNEqYHpLgUdi8NNUai6mQY0DNnMN+RgDTWeiWLqUMXyZ2Hyg2ID2LGtAZusubM9yYsIT9J119boBi31oYQzKMlBcSe2PHheZUuMPwd1ux3Ih13pLDrgymuklCtfetoXmI7X9G5Mt1RyMpaz9Lu8GIc1fHQxgDgZ7FEjxt30mKVAJtVorKx89FmjVTRVuGf3DdkBW0fB8zi2xmNCIlrMB8HcJjydg7ViMUHDM57uUhyM0oBqdPx8bYre5UWh6h3sAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJO8kzQEH2ezOO0nuZotzK5Ke0j7s4JBH233Yr9AxO0=;
 b=HE8NuoRqWV3LDsfWouJR+AJIOvGkPy2WOuyYW3apUQDLBw/ipD+qcTAVg8Zw/lb56nF8ZLNx3ReH5o+h10H2x9yT9EknNfrWPZceYI4Ehpn1riXyP8kHTh5LIyriis0Bc5z0tRsHmBiW78uKo+K6P/p62icP0QbjX9ctVHGSvfUlgXNrZBvTwACM2cxr0bn+Za1jFvqkQVbJjuyc/u3uWvizux/H38apV8LLMUlEB/4iayPPKGQeJQ+49IAwqMeinjY8WWCN79N4/hbrWIfmVTiPjryBwdZYaIN+qR4Kpoa3vpcadfDkvaMmrTTYvjklmkuFj/DccP2EpEdU1iKIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJO8kzQEH2ezOO0nuZotzK5Ke0j7s4JBH233Yr9AxO0=;
 b=aFNRvCBqR6qlet/S72bwkLn4uixDUMKP66+hquUQ3XtmIqCMoupPG2/+0YuNi/Ty9PNmzo3gH1AIKUzirxq6E0GMp3jIyrA0ABW+EwCr7Qck+X4NRNdmz84Z5PMZ6JSgmhVeW0IYyt3tJKw8ur46zOkrxQhSXhesUmbeBbGQzTo6nqi9V7Mn68kDzHrSeGXz5cW4e6ySZ43JgnlLQruHxxBCYILcT3TrzluDZ0G8GLMWoxMtuJCT7QG9R/Wz3stUxMCJtNoKYfXERo6VmdfoOPZH+lcePrDuJkr8sNNcI5+oeFmkKJvDek4JUR7ND9V9OtKfBmKsYtdZWr93ha4bBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN9PR12MB5354.namprd12.prod.outlook.com (2603:10b6:408:103::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:00:10 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:00:10 +0000
Date: Mon, 11 Apr 2022 13:00:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/34] drm/i915/gvt: remove the map_gfn_to_mfn and
 set_trap_area ops
Message-ID: <20220411160008.GJ2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-9-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-9-hch@lst.de>
X-ClientProxiedBy: MN2PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:208:236::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d882cce5-07c4-4c86-f91e-08da1bd45b04
X-MS-TrafficTypeDiagnostic: BN9PR12MB5354:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5354A354119C5D99324AD789C2EA9@BN9PR12MB5354.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lDjF89vZwq54jhbUbVEJJLic3ANTmj7Ber6ODhFbSDSIKFR/X8KNCeAPsaYw/TRoZVWOITbM1jSg5rnczrKTmKh8twlLDbURA35QkHTrCH21WFYgtrr0AdgolI/HonH4MOQ5Msxt6VLy5pAh32UnGU7+RkCgz7DC49WAQ1Uj85NXP4cq4oczS5hlbt+kdH/CkGp0B6ucYSC2EXJdQWA2ZGBvSjbprt7Lpj3k4ddo0+APIbSjZ3xXjldt6VJp4LnkFUiWEsn1kNI+5fS5eqcH53zqYdFpEhhgw3GHz+p/uKsz2xXNDSBIZ02/dqJncQ5w/zNO85kHzyPo4JEoFJUiRwFJXFCqJJgP/QrcN6Ru2VdlCcOXummGva09P4Hc71KMv6zjYEKIItzqU2EMPDSoPoh2Gz06TZRZE1qjWhuJxgaBcN9rPAh79EyLUb29pCC/egVXGYSEf49CSR1zSjhMPhf+98VyM0vul5WJDPRV2L+/8dxISx0qP/MeN7UP9XjG5MBtcUtF2CbWJy2aKeTKGJPjMZmsa+OXiymbKcvaRvVHX3o00GdwH0O+VReV7H/COsLppib/wkTl6IW52HCLGIKsgRTuXcgG7wLxCd8tlZMZ8aCVtQ8nyeB/qqZWLlxoIT1o6zYJ3CqN62yrihCNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6916009)(8676002)(2906002)(66946007)(66556008)(4744005)(8936002)(7416002)(86362001)(66476007)(6512007)(83380400001)(6506007)(38100700002)(316002)(4326008)(1076003)(2616005)(186003)(26005)(54906003)(508600001)(33656002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/9Y3XZgUZt+AZugbG43raT3rWsPOKH6Gx8oTvXP66VNWWsArEWlbL0my0r7k?=
 =?us-ascii?Q?ss9YR+jZqSJK5dJBspJkb9hXT6YWsPVbckmgYqFi+ZKQECfMGEqsNh+yHFOV?=
 =?us-ascii?Q?xbZ5E2kP8iGdu+KATiIGH3SMM1F4m7dk3ZO96u6noqSrqkB7yoM4DAbnPf5X?=
 =?us-ascii?Q?+oEcfEuOIJm5a4GoT1uUHqhK1eOZgjteK1lTgiLYgfNuo+y2KgYGXUdSWIZK?=
 =?us-ascii?Q?BoGQfE4eQnb2sqio+w9QSTTaugqDrCR0UGp2+c4pJgXH8HlVWZvbwQnHPQO7?=
 =?us-ascii?Q?um/+vSgrKVXhk3dTeH7i7eWXwdSPVkfGFg5zxGFmgK8x15g7bZELRZmqx302?=
 =?us-ascii?Q?fKv8mwMPHgJoUb97GPkR9z3UJxE5fEH7PU2et11o8GymKosryGBWpxIHFOI8?=
 =?us-ascii?Q?GvEvzmgUrALMFXexYTs7/WwxMzknHO29GOYCpnm1LoTgHFBCWGABnaVNZJOm?=
 =?us-ascii?Q?q51VAiO4fHpJGY3CRzf9syfjT0VtoaVA+NWB1jCowtMonSJPfwQSuzGyryh3?=
 =?us-ascii?Q?6+D6vot+GonasrbMEpQK4ihOwihJGRpKHoDuimfCz9DOQ9WyIEA46g8v34IX?=
 =?us-ascii?Q?iKiF2KD+X8idY/7mVBQwz8V4I4LyVkokRXfWNRp4MCVnkymrL6+o2OenTR+S?=
 =?us-ascii?Q?puuzQ1019pq1TAJIjgutE774CIgj7Ff9ci7OOhCW8FCiA2JgjTn5/giKoOJQ?=
 =?us-ascii?Q?58zlqUzJSrLEl/p4fYhKkn9C8sujDedld9kbMTSvmCCqmkNzmvlZr+00iFrX?=
 =?us-ascii?Q?84x1BaclEM+T9RnsUydpKuE3j/SDRfQ+oM+7Qhd7JE7lV7fYJw3hx+thM1rW?=
 =?us-ascii?Q?wNaD1+17Tjs9g5oxWaF0niAF9FpqDgGNK4tyIo0jvGihw0Law+bao51QMh4O?=
 =?us-ascii?Q?2/A1hULUWKGcp6Wq1ivKCKITVZXxPL3WN0D8ER27P+6o9o46FxCl5gjjvPT6?=
 =?us-ascii?Q?1j/5Jos6KxGvxJ6yVHjpmviGnDqJqW+BYnZ+lXR0HT49A6kzszNZ5s/3y3zb?=
 =?us-ascii?Q?quZNO38Urbj5JBEyujpjHxWVxEpnWmya9u2uJQXC2TO1tnBOUBoARHydHfZx?=
 =?us-ascii?Q?zf6dqHVhP2asxp6I/44HBD8+qgEWfcA7o17+uC4WOFVoaIb8ePyLubo0dSp+?=
 =?us-ascii?Q?NuNaV7/12cCPchBLDI5qOZfaF+iKY/KbL47n6lBn0VRuCyYUqVbazy2GpSvg?=
 =?us-ascii?Q?o1IngXTHdEZEDrbTMovI4Xgk5HLFtrxU+EeXuT+awLwETKK6qZnx0EWIxaec?=
 =?us-ascii?Q?1QykIbI829DmhkXQ8d84vXGkcnsQsg/Wh4az2Zri8jdKolL/Vmn//M2Oa7LU?=
 =?us-ascii?Q?jUm+ErqodpPLNnFJWE93Qv254M9Bomf6LrXH+Xb+F707nBNg6bQ8/DdgaWkE?=
 =?us-ascii?Q?HRp57xX7OD4FLSodSOD12nxiXtbPWVgJaizGe61672udfjAtbn38R2mLkJpM?=
 =?us-ascii?Q?YxZYYk9I+x9qc5eltCJdx76CC/ylvVK8lu55OiUI4Ii5iRAjE2bUag2Dda4v?=
 =?us-ascii?Q?YERf/ssWmFBNCzajoRPwWB4bHVRiDDlSR/x5IB0pyz4QQRpy3omgNA4W+eo2?=
 =?us-ascii?Q?BgS1+rDw7oDwNwrDcn8GgvtGFw2vxK/Wo0RA6cx/XrwsNs55HgXwhyDuN3jw?=
 =?us-ascii?Q?trk5ZNhUYJFbkbbvKq1n5n5zexN/XhhDmaAzshdZI/mFAPPiadr4LZQrAbbs?=
 =?us-ascii?Q?GiHqavUujRsBgujBxVxZAji4k5oSbu6P/piLG481j4ts5koUUbXfS+y+hclY?=
 =?us-ascii?Q?6WrHqldhGw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d882cce5-07c4-4c86-f91e-08da1bd45b04
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:00:10.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqHkZ/XjvpHPg08X184AmdgPiJDtDW5Yk558BJK+m0QZWDebyT2wVbaN4iyY2r4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5354
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

On Mon, Apr 11, 2022 at 04:13:37PM +0200, Christoph Hellwig wrote:
> The map_gfn_to_mfn and set_trap_area ops are never defined, so remove
> them and clean up code that depends on them in the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/cfg_space.c | 89 ++++++----------------------
>  drivers/gpu/drm/i915/gvt/hypercall.h |  4 --
>  drivers/gpu/drm/i915/gvt/mpt.h       | 44 --------------
>  3 files changed, 17 insertions(+), 120 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
