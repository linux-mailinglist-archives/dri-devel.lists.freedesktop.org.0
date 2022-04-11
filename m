Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40C4FC066
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6710E294;
	Mon, 11 Apr 2022 15:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A5F10E278;
 Mon, 11 Apr 2022 15:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK5yqsIS00bju/u7tCKfHjYpGmSqkQEgGW/q6piz0a1mDNk9KPxWgfvUNjOWYGql95GXeAkP6XfWOoKhzaiyqCqSxkUOWFAD8UnTnvb+NvqYgWaomyr4QPItKndvbPpfbJ/r3bd/4wfxNLD/VzZKZdMByTEYyqKu+0mlQsj9hWdclaeiYkmKZ8gpqiVZnwl6rULZvpt5wmauCAd/ToWO9+PqkN5c/yox89Tca1Dnc3n/z2z3ciloapjVZDAhcCVaJWt2A9K/PUzP4FOt+PlVnGb2MaL0yNW3bZN0d2D0KyhuABW6PEw+i6XKvlQNtiL9VZ9fV1gAhyGF2kgvZxmf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lizOn1FaBcTlsp8e8liLrWdXraBvdMTitYHOD6Iou9Q=;
 b=ZkHopXE9CCq5bd/Sltq9Aj29K+5WqPrdIFtjdmZrVmGf6j5weK+9sMR13GhHEBtc1yU9+h3cG5PFmZbr7Cf8Dgxj4JBbqGwAhxqPytvJZQ3oCWvBtBxNdFYwWPrMdCXvmqtp8sSvjeN8AYTq41bYmPjse6wJ+WbPw5u8xiq+cEvSq8Z6iTvmCqHBj4PB826RqVzOqeCmuU8/FiR+ivtr+UXYai0JnSXPE5Ep/Q79nuzuPfbLGTj8RpBIKiQG7XHTlhPDZ04Q6jzkgJCxiWKewPBMt2FvyC3XifSlmeDfhwvxHxXkrlnasfb9u6IuRKdhUv9KY5EEp6ijXZCloP3SPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lizOn1FaBcTlsp8e8liLrWdXraBvdMTitYHOD6Iou9Q=;
 b=daRU611ukHpBEbqJFfP0txGsjV4VryVN2ZZOFI9rlFf16sg5P6++QJU2Z4ARGCLksoK0KrsZVZGrnjVsC5x1wO1OBf8LJlWkPQNRUTvjq8rrHg8gPCbYFzkXuXobVk6zyTWJ8C5xJREpxBq7L2YMBYJuP/MYYN1G53Y+qan0Pu4eo36/i4ErKuziea6If4eB+ttaJkPWHXNzAM9btiJLgTxITSdrsBcJITBpLhVHtpP4zr45z1gQiE8yCnpeAu1FzeViDgykmcdu9zBBoq9vzpqJy54AsLMKEGQykh5tp5Yl2z6z2SgnLJB2J2qYkR0lQ7VdWqVvev5Iunek9P6W6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Mon, 11 Apr
 2022 15:23:33 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:23:33 +0000
Date: Mon, 11 Apr 2022 12:23:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/34] drm/i915/gvt: remove enum hypervisor_type
Message-ID: <20220411152332.GE2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-3-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-3-hch@lst.de>
X-ClientProxiedBy: MN2PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:208:239::32) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45dc33c7-c807-4428-cda6-08da1bcf3daf
X-MS-TrafficTypeDiagnostic: LV2PR12MB5871:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB587122237DC28CA6DB5BB9AEC2EA9@LV2PR12MB5871.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAmjgG2rpvC5oU8PRK0lHSanvohYh7uUiddrDOVMQclEp1y94eCmqceqn7hclIIYUQlmeAF6lW5l3ESdOdkRK7H9IqRklkBES64UBqmBoClgYYV7GwhvC5HGuRvKD1hIiEXpfmv7YRltW/m1fjSgykShvtq5GV2dGxhxbc8uNbdsVDGDwyB6u42mHCeeYrIOFb3AjiWNRylRKqxsoxjBRx75NUXtw95v1DctylNkY8iQNEgQRonn1Kv3OMcBAJck621usDhhoM2/r7WLUo6FCBELavwa5vC490VA/HXB5nlL7n55KAPExiN/eBl+dTZzQTOc4YC6yB6sfRcRpkhOXFRQh1gqxcG0NfKuk1Vdiggs4bxZ4eBbwSQ/6XcJCM5zPjuHYFmPjZdFfjHifHw8GqeKNhn2wAz0cQZA4oy+t5D38UMszipr1lJ7y4TaSRVIUZxO1ewt4yNHs0z5o3bPTlHiKRZ8mX+idHskNGp/H9xqXpw2eeUbZZl1WMUsJb72mpwJjB+ISvytufjBWTTtDjpBwFB2GGLizED+46fCTZTE2Ip4R9erGLqH8K4nvyjjjOQQs7RWUWIxZv7/gEa/nG6Vg56IF9g7zr6TmZMBZx78c4DYIdbbSYzBQtim+Zl6HD/eXok0Tx8e85qVaUFh3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(86362001)(4326008)(36756003)(2616005)(508600001)(33656002)(4744005)(316002)(6506007)(8936002)(186003)(26005)(7416002)(5660300002)(6916009)(54906003)(8676002)(6486002)(2906002)(38100700002)(6512007)(1076003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7B7gbR1wg+IgWu9MPsj4y1RlACtGpT5s2qFvpoadea20PyuRes7kM3s3cQ2o?=
 =?us-ascii?Q?Aulxb+5DcK99LHYjPfOEi803hxpI1FR4jRAmFebdA5nHzGD0xK/o6YDBmUHA?=
 =?us-ascii?Q?o5AK1rONDGeY9f8D3hkiXOMRsLtldj/gD4Ej+DC1bVz2+YfNUtr3KbdvPoWg?=
 =?us-ascii?Q?k3NBOrCnshWcVZoEoZxa1+vPZhZy6u8k6CQ1vurD153Giv7dfPaDNBptn1tH?=
 =?us-ascii?Q?C8XdkMJSopm7dq4yUwTsettcbGSvgNBRmbp23BJIK7xQqLWX1U1tQx6tsmB4?=
 =?us-ascii?Q?hq/yNVbt8LIa7wcjjEkI9WjRMUFSCHAqh9SO2XIpM/FK7Agp44DKv+T+UkmX?=
 =?us-ascii?Q?gWhEKCNitj7RNov1Vms4Ph0GIyPI+YQRLENdcfEJXYBsJf6SNcD4r+huds6n?=
 =?us-ascii?Q?5etk7D8mTnwh5bIJnTIVEu0JK7HEjoyixQk+cEIJ6/AUBIC4+kurfc9s9Jhg?=
 =?us-ascii?Q?hp8b9K6lxmqSkkzgrf5JDqojgwKJTPtJV6MujVEVEzV6gLkjsRifDcGYB8F1?=
 =?us-ascii?Q?hwlNeo0YjyP7G0vD6bS8JFAjjdhjvS1k3I6Cp6uSZDOm/dHRJlycM2p5e+Fc?=
 =?us-ascii?Q?yQxYRR4c+bDG6uTZOzAG7hzAvI2WsqGDwV8/pYcM5SND36rdeSmMYPVeWCs9?=
 =?us-ascii?Q?YLGamKlY1nJBCGL3QuxlmJ/PPZ/FmRhrLsdXIIPpE00RVUosT/Vcu6hl8nwO?=
 =?us-ascii?Q?j/PZ8XdgiI8qsbtUQXJQb5ERu/hFLJ3zh+yBeMGAxQfy2ogtluNsItK8C8Z0?=
 =?us-ascii?Q?dK1kmQ1lXwKYFwpvByHSkR1+KGnRLDe7v1E5IuDe5r3Y8ys+7MDyDzXL7dF2?=
 =?us-ascii?Q?gHKoiX/nApANG1jNnZSmIWeg2UI21PQ2e8cHxeMQMS0O1vvqb2IGHLQYOTPZ?=
 =?us-ascii?Q?yTcGzJ/PzZ77MCo2UbE7VZQhzL47tDzAzLjbEjW7df+QUu3+bD340b1KEfbw?=
 =?us-ascii?Q?8kv6tv1iGPlJlP7+/9uPdcmbQ5p4v7Z98zTZjK8RE9azynrNIEHlUtUUFxi/?=
 =?us-ascii?Q?2dJ9XGvupYC1Opdqvhe65qjd9I4EAC7Ynn3BfCsry2CPrQTwyMrfw3ciyRH8?=
 =?us-ascii?Q?uqxO8UEblb68GxV2i2AEnOhlwkmSd3mga8TbyTlSD9wotlDwRua0k7gM3kG0?=
 =?us-ascii?Q?o/8ZxCzK6WSIPL2tOHPTgIOjUniKE/xCPQC+qBe1l4MTL9eWv2ek4w5QtWIl?=
 =?us-ascii?Q?P6paEKPUrJ3bet+Pgfh0BT+vje4/GzQBqzg53XTNNFOL5A0vh7yGrahzSVIm?=
 =?us-ascii?Q?lS2JotvUXxDnLO2MZzT2V2t4+bshjdsvRHPCVduxHycH9oO1SA/Bpv9tVL6a?=
 =?us-ascii?Q?cwO258dYBwuqDES1U0SY7XmuaLq7xRgJ5ld7FeFnC48+yBAXGpm7s7bfqyu2?=
 =?us-ascii?Q?VZB1dupBy4LMKfhyHH7uK6eC1BdWaiLLhYrzqEtZ/kezf3Q6IPYClZ5kRlal?=
 =?us-ascii?Q?3Tw63Tfb7iLVh1ZJH1/dCrg/XZt58tKCz6ApKKjZTPrAN6YXsrPTXi1OL+/r?=
 =?us-ascii?Q?8k0Sl4EkbOyxfL7j+rv8n+zbZlOobD7XYxsal17bJJgCeTJHfLaav5rPnFdf?=
 =?us-ascii?Q?SDt2h8opFK7wlvZr9OgUDDe8JbZCtKDEpbtrj1lkeHVcTh1M4T41UTxjn3FF?=
 =?us-ascii?Q?5G+r1rE9Hus2rGQW/1PacXWGBBaT2oUe1/+X8TfdJsYTPgmdc+J8CYI518+t?=
 =?us-ascii?Q?/p++BXGVihi1QOiXPa4CJqLIBzbfVLGGM92jB3pCzW6sqRCHVT6DxH1NhdWS?=
 =?us-ascii?Q?7CKJk0Au/w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45dc33c7-c807-4428-cda6-08da1bcf3daf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:23:33.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEr3KFKH/Wwh+QJX9X4cJtrAu4P8rHC/qaNTRJmQERmyqG9pgyW6tPPY/nIB3gTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871
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

On Mon, Apr 11, 2022 at 04:13:31PM +0200, Christoph Hellwig wrote:
> The only supported hypervisor is KVM, so don't bother with dead code
> enumerating hypervisors.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       |  17 +--
>  drivers/gpu/drm/i915/gvt/gvt.h       |   1 -
>  drivers/gpu/drm/i915/gvt/hypercall.h |   6 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |   1 -
>  drivers/gpu/drm/i915/gvt/opregion.c  | 150 ++++++---------------------
>  5 files changed, 34 insertions(+), 141 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
