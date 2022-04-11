Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E44FC3DA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFB610E0F1;
	Mon, 11 Apr 2022 18:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977CF10E060;
 Mon, 11 Apr 2022 18:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4YpU9lT7DRW/iBVO8AYGaQpZBtvqLu3yUjKne6YlxzTHjVvoNrerte8BTVVlSoDgt0gH1yY84m2REoXRvU43AfWUbWuD1QW8mCVfCwuvACe9MOKloVPsgz+g4L9rqXGN6+mRRwmAykpowTFRaxlpmtO3UlgE85dr+wtoFiACF04H6/zm2BFd/suMGj2WXrLXsxdq8lF//bEvD/Jkv1TyHgs+iYqqRla5NFsSyp7eUNWrpgRa85S1ivtBCGD0w1ZT003yvHg0ijngsFtKaisS3mEpFn/6QgkhTIJuRZJVgm6N3rOo7ZQuVLpV21Z152vS/legRrSzXvVn4fQ9Uyacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ar+qnC0dV8EIdrfaq+yPKgotP+IbALzbSIqNjGwFng=;
 b=Mqv/gFM4a/8qpxPfN13o6pnfx1pDqqbR/ajV0v0W3T6B7AMX97gqqOhC/E05DpG4ujeBpummVYs6HcChOeu7pGeozK0s0coOJaduckDuBVcGf1u7XtUSCAJHf2YrIs5NteJ5C9hU4N7IGWeBXoITfMWXlijUDnhPbUaUP9Px0Jbtk5LLFYcQSJliqzTMUg0yf8QFfri4Ob16AwShJTriXW5qKU3GQEHu5DfJceyx5eS8f+3ehb9qJVUdRDBIkx926sLKQZUsxTuqxPUhea7hNg/wToTA2u9wDwsmPBQF4iVd8l16SCKhJ1c3zuQD0H8HECRJCterWpl/fYOi3ogvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ar+qnC0dV8EIdrfaq+yPKgotP+IbALzbSIqNjGwFng=;
 b=qeHNXMynbAjF7c1qK/KSMf0c6SR0aWaTpPgTq+GYL2d33qHazzGPNlvwQa+URTMQW18UKhoma/KhxSWNJtSaC0fzoiC+ZfesHXYHq9G8Lk2ZjTDq7Ho5Ymw+muWChq45EgLl/OFLGkBLVWvi5EVFrDohUzC3G/hdc256ixeBQP5q/qTsopP9+lH6RjjneSz+E0JnItRi0JlUX2ASLnEeBp/dIzs8+98U3xWD7UfPUB4roQxUa9tb8R9aRysQ8lcHuippl+hC5gQrK5foHAGMszULfSkZCohAJ5XGQptgYiizEl+XIL3jQFMo5LGSskJbOLgUxZuGk1UZ/arbjAjilw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB3893.namprd12.prod.outlook.com (2603:10b6:610:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:09:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:09:11 +0000
Date: Mon, 11 Apr 2022 15:09:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/34] drm/i915/gvt: devirtualize dma_pin_guest_page
Message-ID: <20220411180910.GX2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-23-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-23-hch@lst.de>
X-ClientProxiedBy: MN2PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:208:238::10) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af949e3c-f909-4a5f-23b4-08da1be6615d
X-MS-TrafficTypeDiagnostic: CH2PR12MB3893:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3893AFD516C7F7F673F48219C2EA9@CH2PR12MB3893.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MM6K5F52tcEmjA5tA5HElv+XAxXceuNiVI7CrJEt7uWcG13PYDNz41NONkMS6913/OlZzVhN6nWTd6A3X5rY6G5a1e3zYms6M2fSB97yPq1yHzN5OW5J8myWs17owYUGdiQl354hr4hEbB0MS4ySdVpOjH5FO/gE3Bg/F1uas5HMF4gjXrH8UVYvIvqbVpBo1EFgPiCGAndvSZxVpdrJL3e3AJakcyZfkbzec0aQnoRUgiX4M9wgP1GSY5T1lCdpUxHppK1DuknI9HEHzk2F1mAsnrK9auYAeeQE6GAXURP0/BAqfS2jePiFb6DW/PDR05Qh16l/mkwtU+9Zzw2buM0gNLDN1rhtYuKbHJ4cT/arxvcrUsnLX+z1TmDWZMgGCX8twEyuumv4+XOLSIe1t6tIqHT/bOElwdxAfdn1Xq6SqEfom20hKFnvJZtm7r5m8h7TR8hAHtMUKk9mzUtYjMA1WQqyGcwVU7RPT2sCYx9P5QzhX5G6eAWDk078SwAtFaorcOFg4v2Hb5Z546gKMD6lu9mFratmTy9iSZtOgY16YVnUcqFVNFld9QghtaF/GLeSfVIJXR3mEOwuII2mDWSxgzKCrxUcPNgKcT6xj9rauaZj0GhJmiF3YTnV8R+Vis9Xbu59rF93HQbrIayC+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(8936002)(83380400001)(6486002)(5660300002)(4744005)(7416002)(26005)(186003)(2906002)(36756003)(4326008)(508600001)(316002)(8676002)(86362001)(66946007)(1076003)(6916009)(54906003)(66556008)(66476007)(2616005)(6506007)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RYBVNJIAjgIkNQB8jkB6q8wkczYB4ZXBQlm30qgBjSnBSpRpow/R9yy6zJyH?=
 =?us-ascii?Q?x3KVoQXz+UhlCn8ADXyueY5kb0iXUBTcFU3z+EhyfXuFUI5SNlJNjMOMwqJS?=
 =?us-ascii?Q?8VgcttaftE0qsWy6eGbfSjkYlrPRu5JnEZNDW13vivrVw6Eg1VbOpDUC7w07?=
 =?us-ascii?Q?6Q3peQ2EyOjbl3JiI6dJi1lfiKD/as7v7C6TXXxtsuEihoX61gi4nU2LqbKn?=
 =?us-ascii?Q?UdIEI1Q0ScM9F005A66sQ0hBUYt+EDOLmopsvHTHKj8ZNwOWf8kLz4HUAcHB?=
 =?us-ascii?Q?GsTQyAtk2c2n27eIWbokBrYxA7gv6xQzNB5u43G4ZdhiUgeaTwhSpKC+dYLK?=
 =?us-ascii?Q?aHfa4SWVnPp1gXkEv19eRX00+7dTQsF9cd9ejEUuc9kgrcsf5aHdY9fjHOuX?=
 =?us-ascii?Q?1DKR0/2IfB6a2MXBYFUhoGu6XvTCwnq2BZIpujrDuPN/Urxh4AZrcH3wp78t?=
 =?us-ascii?Q?xouwIMO7x9wXAmjDsMHuCHa7NeJJHpaVKDxqBGtRaQaQhvMr5PikqT2BHV1v?=
 =?us-ascii?Q?xacyOsFZC7ANEPtZzQ7suc6PxWnGIDMFp9rWo1IQNAhlU4aBnEVMIJvvkmHE?=
 =?us-ascii?Q?cNbEqe3zZtLpJSr8/cWKAhga7SblU8k0go/SDJtLDDrXXGxcn842fTGOVoMo?=
 =?us-ascii?Q?V7Yp5r1S1MyPRucTWTR+8rQWbuMJEcZCl17mXCisRHjmcTbwsX4E0/3N3Z9e?=
 =?us-ascii?Q?76AJbTI24bt3TFVMP9GbeqqkzW3tMJYqLSkG0yBRydRkmr8o4cMuQUTH97NM?=
 =?us-ascii?Q?YfPH9LhXAxgEcgGZzQVuyf10AJH1z8O69xyGJBZfSOvf4uBLT5wMiFBwOtyD?=
 =?us-ascii?Q?Y+2X1avnxwDJqxbLlFkZONoItC177oJUKs2NSssxP0oy49v2D3Pd8NhAgykl?=
 =?us-ascii?Q?GYyCDOOxm8FTBM9SDN0iQwena39c5TOML3Onv+Rr0klmRnNERXO9c0efl198?=
 =?us-ascii?Q?cJa8CaqPrtW4Op6GA89l8pTpKUViHNwWkcDXS2XRpKEQLwKCBTA2vJYBcDSF?=
 =?us-ascii?Q?eP/Gp2izjIgvzoFilCtFuRGX5GmMhkCg7ps7Otgujvys8H/aKzhThz02/Owi?=
 =?us-ascii?Q?/7BvmOPiNnn/IOOhBPH6zYp/aCnynSeamRlxGQ9QcvwXTzZcxuZY6QXH9BA0?=
 =?us-ascii?Q?KArNBzSp7XmigWAHo4pB0Cg0gHbmjv5R9OrtTtkVVW2BcxjVkCW8JOnJEbTz?=
 =?us-ascii?Q?CHL+kS3fdEmFSKgu1ghOvBJ7DAB4rDxpGq7SzjGz//heonRoycsd2tBrBC3t?=
 =?us-ascii?Q?jdDBVXc3hthDeTAg2KfMMfUF41DE1tSq18/rVZyD9albF/J6SjUL8KBvCV8H?=
 =?us-ascii?Q?ZyoctKu6sB64s1GdE+0ptOOIAGxPSGi8b49ZTQEFdCwYoEp+zlzXBpCvejVi?=
 =?us-ascii?Q?NJ+kuxEms2X/eG8PTELBf78W+BcvCB5oFZ2uWm6nqnxWu+ZInG3/1t/LGz00?=
 =?us-ascii?Q?JqWnbIgvEMYOqCkuEStKGAJBxlqu/hTenyFKf2/EMLZ+WWscUQlhwV/X2fIl?=
 =?us-ascii?Q?Bs7Qd46jzt/X9+6q7Mwl2c2wcBbO/1a7IKGKClohdz8BZ4h84r8CcQNKXe5r?=
 =?us-ascii?Q?wO8aiFt5StrcGuXLZ5WVWJiQHC02/ENGRJXLsyLEKaimeNtsxiPH3nJRiRLk?=
 =?us-ascii?Q?LcpC2NOun8A//EVAF6V3LOmCGvzAU2ZDoPxYTCP5Qhe6IM7A7Eym7AS1NFmz?=
 =?us-ascii?Q?gmtGZpaIvri1KbQCNx7/rzHW/JGyc2PsOdiCsbRdyHQLjSYT4v3eJ9wI/k4S?=
 =?us-ascii?Q?Bwr0IGO4fw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af949e3c-f909-4a5f-23b4-08da1be6615d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:09:11.9236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28KZymQzn1Eu0USA/5tipk4/PnkQbZyw5ruPzfskw3+hkr5g/pXIqQRaOd6IMS+A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3893
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

On Mon, Apr 11, 2022 at 04:13:51PM +0200, Christoph Hellwig wrote:
> Just call the function directly and remove a pointless wrapper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 14 +-------------
>  drivers/gpu/drm/i915/gvt/gvt.h       |  1 +
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  4 +---
>  drivers/gpu/drm/i915/gvt/mpt.h       | 15 ---------------
>  5 files changed, 3 insertions(+), 33 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
