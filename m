Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463854FC23D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE0B10E3EB;
	Mon, 11 Apr 2022 16:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253E110E3EB;
 Mon, 11 Apr 2022 16:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuWA7cVnrE75YwaCwEbSNlTSUfsIzm++kL0UnMZKnYQq69Z/OoyzR3oYK7YQst1gE4DeMd+li4d8J5bzMAl0DSnGJTEVRUXcl0/iM5Ob+juxkJ1iStshOXeVo5FuRVE40Oghv+tng1a7uWX6Ah6XZ5znNeZc+U9DzcVngiGyoyLMf+lN6qdU0x76IEuaHieyyWdASq2KEg9tr6AT4yx+Leg5up6vcaXzAJRtlZGtAhk8u0zERMHruaxjEMFNn4lQiPVm3xAs5GEI8fablPByW0hFw5iOTMKEzWk7mzOOwRi0Ruapd4WT+k7pOu5eqUXW8Ov75Z2Gy2U5qwrYX86Gow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9lMdZAEWtGWcaUpaq+QIyKpxqEa0tXWVZR8GI1VbhM=;
 b=b+9uU8JgtTZpZaA1gcfEhBH5FaNtsWC2uVh2MAyxTDv5EVtLaCPy2x8FAlKD7/aVnMU0V/IxGDRCp6n5Ri77a/ax3sIRo/GJkbo2ZBM2vaEppV3zqkuO7aZyHGXz8vaDOdRfwfovY78cMx5SDE9y2qFbAQi26LL4GviUxfZzb2M3Fd6QofMVQMc7ZjArwG8Ax7oPiKqajjzn+4JM1wxYB9ZYl2iG+5xgZjbCbKA9jobNFqoZaHTRY0o7sKmiIl3dIOOGt3M0GHvL91kRva5Vi6GdQs4FHTp/kdjbjQ33+Tqou9d7uqAwXS/gFXm6n4YGwFIsknSj6GtHigDcpWNKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9lMdZAEWtGWcaUpaq+QIyKpxqEa0tXWVZR8GI1VbhM=;
 b=NzoDNT9GXwVQp8ppnti3nAsjBR3u8fAgzEeLPrXHjEvVji3Xap3xCWMdMW44mIeTqyiOGakO+PtvbJsaZORq+Em/SoiO0NF0I2wt44fBD5klZVCdTALvB836TUPWW48BnfDalCDFxXtAQ9AOm4hyTofEcErBKYoIr5Dg6n5rB2266b6lTY2K0zN9uwWVZPeK8xFPL1sIyJHFMfwD6mzWqEG8KztV6zqttCH/zvCx/++8VZ9YFeqXj9nHVtrM5BKT9CZvK/0PoVp6DDXw9ICLOF7s1wxPsxnrOt6rBY9NiJqfwD3FcqSA+D+8IF5BGSOaWyUE/5q7ffM9mH/mhQOd9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4908.namprd12.prod.outlook.com (2603:10b6:610:6b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:26:33 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:26:33 +0000
Date: Mon, 11 Apr 2022 13:26:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/34] drm/i915/gvt: devirtualize ->{get,put}_vfio_device
Message-ID: <20220411162632.GP2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-15-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-15-hch@lst.de>
X-ClientProxiedBy: BLAPR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:208:32e::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d808e852-e09e-4a47-032d-08da1bd80acf
X-MS-TrafficTypeDiagnostic: CH2PR12MB4908:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB49080BD1B942DBD812134CEBC2EA9@CH2PR12MB4908.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AidimZTxgearZCDRfo5h8koL9BES0xOK9aHAR8AMytqWT+vj2ilR9fFGRKqCU+0qaAxjYLFes1N0YWbamHSn5lYK7yhsM/3o6Yb9oqHyXsOmKZ2xB7DWmZwbO3KoHWeVb2mcme9gBpYjqexmc/c0PAp5xugcRAr3ctbsARnLEwOURdSa17ciummexVkjftmdTQQ4bUCZOkP6RLSAQwdlw3cMnULj93hPV4/BRgCrimuwUC9ZoeGM6sDezE30Odb1CmMSL2tomhhMqLUG1uR2FGTxKRuqCA8yq2NW0oGcoxcKlCpHPgvPRq8wHJu9FYhpnY954lJbczOJy41LFxm2VQE8b2QdryR/H62sOLOVgxs5sQyGhxaOEqRkrSMrpcEbn7WBzDparvAGn1GXHDhlrxhwB9Obd7roE5L10c969dtkTXQNr0NK/ZAhYgNtl2r7YHDwXbdHyxllmkkVYC9m0GLLnGY91u2zlRUhh/wAWrRhOE3pgmVmvbNXzkgOVJ0wK27P3HA0j0OQzhKMCVsAiF83cEdh+UkzM+DZlH3nb3Ijmsn2ED5W2d5jGP31ZT2h0c1ijzhxevfXSbQGHX3CICqphVVbA7lbuTT+kqeSQ03xbREHRR2U9IT67WMimx4EO8xfkPWzFC4Ga1bhyyR7Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(316002)(6916009)(54906003)(6506007)(6486002)(83380400001)(33656002)(36756003)(86362001)(38100700002)(2616005)(6512007)(1076003)(2906002)(5660300002)(7416002)(4744005)(26005)(186003)(66476007)(66556008)(66946007)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z4r2AH92XI++qMVD4Th0P/LEsrfWKBzp54FSsfqng6IctUO5p+1+LBeLgg0V?=
 =?us-ascii?Q?i773bGWM4es9ADuDIW1epl2DIdpEdhRJpGwKTsZuJlRFcoLML1oUeu0Z6OAs?=
 =?us-ascii?Q?hG3+VrSTx5ag43b0/WQ81AttzA5Par6MyPCglK4aGrbyHImxRY0DuHTUCbKS?=
 =?us-ascii?Q?+NvdHm26wQc6pDrm5XDzzmkzRZz6ciyybYbX7BYxfWkgqo54GYSLThJlRSIP?=
 =?us-ascii?Q?vAx2hAhLACH/XkA2ASP5mzzyoVpr+Ho9IR1SOcB679gHj7G901xRJTG8FtJs?=
 =?us-ascii?Q?2TcP2VMI1hDhhh7GJpXja+VxLa2yTTzdiUeQ5VRafhvhMQ8ydQGcV13TsJpe?=
 =?us-ascii?Q?kqOBrc0iA1pXE9hSvX3tuQGjVBZZ8Q64WdYW18nrwYPKyBZka2J2eeX+KHuW?=
 =?us-ascii?Q?Hnlbekyn4SopWCyKILO3e6oiyrVgDyXcbEDB/BzV9kJ0fzYEZ0dqORx0EHTo?=
 =?us-ascii?Q?VEzVboVby27VilyqnrwBKLZl1N9qIdpcAI0JDiR0xT/Yt8x48flQPuDR9cWL?=
 =?us-ascii?Q?aJsXbyJ6U0BA2+2yrOmbb3G9ZdMCZp3Kjv1NQbOgkfvx1e3KbaaiZ75NxT6g?=
 =?us-ascii?Q?2bhO+TFRPc9U2Kcc/oWtC/KnV8gV5xYklf438IBSPfOTWvlh6d0D+t3zq8Yn?=
 =?us-ascii?Q?t7iIHMe+P5WB0bA6i71oSks0evLlP5gJV1YKohogOqyeSiJRMFW5JPtdPbbK?=
 =?us-ascii?Q?VaBNRPTUwxT04LUtn/Pk8mlK70dRg3ElB6db30wEXocdnYbCaAYzDMedn5l8?=
 =?us-ascii?Q?J74+k8XdYuAQDXSBM9tNKqROw/x0GyBJoL2ssMMu3AI+e7GKQJpudEsf6Clw?=
 =?us-ascii?Q?o3E2djG3UNaiihASQivOrIX7QZPP+o1fTtDPwX6rByIL+v2ig+9UoPZwSQzt?=
 =?us-ascii?Q?sxNZv3MNv6Jo4TX667e+9zSdJoP72OoEyAfkijw8NHozLXikbijcOeTH9A65?=
 =?us-ascii?Q?PbCvWfvbzPljtP101op35DBfcmH7RWJXu3491Y1Ngc20kGsITMi1sWg3UMUW?=
 =?us-ascii?Q?28JTvcOS8cVNAszztUNaO2dzStnT6GvEDMlOuOPGr7WHRQ+zKeizrAdjyfku?=
 =?us-ascii?Q?gg/3I+NKAy8GWvxqWuwbfljU5BNHqSz9fpeG/9DHSPOVfDYZW85u5xXAemZE?=
 =?us-ascii?Q?uNsJ2vewXohQV9nyypPyXHPOAHT6s/IEZwTHb4n3xFnNQYhbilh0z2ZONE5J?=
 =?us-ascii?Q?nxvGzIZhbUaCftvuwUzefWlCYGLXAg5qXftgW8rtqU7/pXDZZk2Oy3dR3ZjA?=
 =?us-ascii?Q?HRgQAmdBQbn0odJa3YfMQQemIFCn2Ei8itHPw62KHQKchQVO0NYAFRSh9cHN?=
 =?us-ascii?Q?mBeNoRzBnD8018+cGCqlf6TXfIMZBx8SzvLrO/7Dg4wBOqaI/4ruGL+es2nK?=
 =?us-ascii?Q?djIuKSADqrjL/r0uZ9P0TE0dvwBnL7SDrqSrrOomcO6mxKYKnz/MUpjTzs0X?=
 =?us-ascii?Q?yCaELrgjuHR571jH0f8yZgD1wRQLhBs13scegQW/Z7PMm1L1ENoT+H3yJiVt?=
 =?us-ascii?Q?6NHCr+JvQSPSthsv+BK+kgl2UvaGK57R25MGVRxVW8wGRip2bnzF7YzcM4/C?=
 =?us-ascii?Q?0vMFn14P5knUv26Ou7qrzSchpTG8ZaIPDPrCfrbUBufZTQ6VaNXFi8heY+qy?=
 =?us-ascii?Q?P/wm++qSaZPC7SsfqA0qPJtnBL7iNK/oz9sHGLpFINRhKCsqObbarED0mg4M?=
 =?us-ascii?Q?8o7RklberLv15GRLU3AvtY40vjgV7CfV3kyfxqZNCDLetAicW+Zg5IbKq9y3?=
 =?us-ascii?Q?Dr+JqGo55w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d808e852-e09e-4a47-032d-08da1bd80acf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:26:33.6148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtCUoqeXHuol6SAwMAuJwMSc4r4t7Rz7x1qXVmMrSiMY/vTe7fNgF1JILJ5+3CDh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4908
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

On Mon, Apr 11, 2022 at 04:13:43PM +0200, Christoph Hellwig wrote:
> Just open code the calls to the VFIO APIs.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 12 ++++++-----
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 22 --------------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 30 ----------------------------
>  4 files changed, 7 insertions(+), 59 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Had to look ahead in the series to see that the
vfio_device_get_from_dev() was removed too :)

Jason
