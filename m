Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF84FC434
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527B10EBBB;
	Mon, 11 Apr 2022 18:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B3F10EB96;
 Mon, 11 Apr 2022 18:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNXSpEK5pJXyK37WKES/xsNBoFEwMliRrYqMs9Zj7yClWsnL7hiBotb4hdKtP20b2ey1vgLd1KLA9ts5Eu0kmGXDeoxTJGMxpxEF3Rzy+MaiXxlQN2PQPw9rdCXpYHpzoTShri3LmFh8vT1DR12nhPWnX/zp3nU7hSCLhmyXtlwKTy+gKadnZazX8OWCIUgFJlu8FknneY6fDait/YaqYMLin6xSkb7j08MM3Z+FwFzTzOS1OCXXs+FV2YtVcCeLfEHq/0WQe/HC/ZN+2txKTwjUKu59yOXVigeE1oeAMFFT8zWEPByaRI3gyXXUjUq0Ei3LtTuhJ6V6Cf7mrc33Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6jK9Ypkx6w3piuLXDn+Mh4yBIvmcEgVL6PY6E26hjs=;
 b=CZphjTFQ4mYz9FQSTUg7wmd/S3DpLnyW29pfUEgbHlcbcWDbOpDGy5vGWo5X/WLdXz7tb1n2Q8kXpX5H7cZwETZ3mwXwFtmqBzTkt4B4GYw7pZ06FKq8jc8Psnw9fZoRJjjinNkasC44msFn4qWKpHJelNOgvmw7/Ar/pKSZ24VnsBhknz3q5MFwWhRp5FGyWiGOoao8wTyUpaUYPdsFLPIhrNTySADUad0UD6n4V/t6tG3bG+1V+vv2EcHM3+uSkLjZkHOX81jNpgxpDYYCNJ+9xlVEApMZRvBxckcLH0x3ikjLXHT2wO7ckYp1LIvEMryESCBCMWal5OFTql/p6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6jK9Ypkx6w3piuLXDn+Mh4yBIvmcEgVL6PY6E26hjs=;
 b=Huq9XBStB0Wq/hMlPfoR/tb/kekbWIr/qF9MUWxOhd55R9U57fT1x3N+CFRXd0YBdYqOAnyLORq8IZ+dfzn6uCzWUdp6ZCtB6RWrORDH65z3Mvkt5E/NO0BS/CZDofjhdP8vsvWxt0UUR9oZBPTn5lgaaCFFTGbndN5G+4TxpxlohNkU66Y4rC16BQUZtuUxyMgCGmquwcEvap8UodoWlUPgmSYnZdCJQTLfEjhmzBbENV5n6c7B/7oVz8GldaPboczugUfKzIpNGUG26WGw9qLPXwW7KH9U9ZDdXyEGGsMevBEuAUYj8GLK6KAD3B1Y/omd7dg4yRYEzXukxpmRaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR12MB1290.namprd12.prod.outlook.com (2603:10b6:3:74::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Mon, 11 Apr 2022 18:37:57 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:37:56 +0000
Date: Mon, 11 Apr 2022 15:37:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 25/34] drm/i915/gvt: streamline intel_vgpu_create
Message-ID: <20220411183755.GB2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-26-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-26-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0417.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::32) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c676e5ce-928e-441e-0671-08da1bea659b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1290:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB12909B3D9603C27C52F6C21FC2EA9@DM5PR12MB1290.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WInKDCwWphCajY2CAzfK4o4DggcK7XnNk80g09rWC7BbARyfXQi1RK2Lu/6ZIvIpzf5UwNR4mpBLAK2RJVsp7orIUlnO5GunuMc6+6IF3o93xIEVxoJ94dXl27Dq2Ff8u7CpJnW70jILbEKRGMWmAnHZvWyBpvmwAT7Fyp6yifQJEy68Wop6QoMLzFX5C0KXmD++gSgo1n2lvLuO+xQii+FiLVqNAsvil0n41eu7LyC5eq9pmw1llmX1cwaNu1To36F7zjrhpKiWMsZpCjuC+Z1RsyssfACv4ZlO+riehoMCNTjOm4zpXEQeo5NRZKFH6/1+Oizydg6V/FzVFKnRtd3TJaz5JmTnXs0mvRzK2o0qQtmUarMF+rGoxCWBTzMKQTPNgSy2lW4+GyrM3lEWiA0kAdZhv2IrmQi3aBFJmRQgtcQgaQ3O8M8V3S2CkcDriX4Ztsb7DMvcqx4VgLLOMuoDqQaMX7OcZ+l+zd8xjE62PJdOUw8SoYuIx3+I8gIRAH12gAq3ws25672NwLCMkbRKmJBltoQrPtPmu9x3qoyUH+LBGqXBvjxfD6I/YddvvfTiiOj5JJ+yM5u4/IKHn85Rg6rrss302zSmPNrbO0meMdyUjW31SUWlWMOQ5FwJ67Smbi8KcGGOcLGam10+Cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(8936002)(7416002)(5660300002)(66946007)(6486002)(66476007)(6512007)(66556008)(1076003)(2616005)(33656002)(26005)(186003)(6506007)(508600001)(36756003)(38100700002)(2906002)(83380400001)(54906003)(86362001)(6916009)(4326008)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y5ZI7GKULJCGXw111+m2jnEqRKFy6/eRVth8QnQeUGxfuanzdUSz5DrtD19r?=
 =?us-ascii?Q?NPptlfYLw1Wvl6LpmXsQWcUirN43X7TBL0sVmBLQKo42wHSG0XPP0yaYuSvf?=
 =?us-ascii?Q?jwh+jUpPtIVT/jcAO1xANMN8WHlW58zIlLaBgVlIkdtQb3PtGNSVr+gqAKR9?=
 =?us-ascii?Q?3u0jUGD2MWLDJ3o9F7Rnaog6p929Q7Ve+1XWCVzLLVDdvG5cBASjqDFF+cgI?=
 =?us-ascii?Q?AzxfOarxnsAoykrrSzQhpxRE5Af+PeSM4nUs9Ld1L2gfcgXsZIw9SQuVjf85?=
 =?us-ascii?Q?Mlekd18j72zHTRpFGc8W7bVF8ehlLh1CO4ilagmfnVfd3WZMsUDnSAxmmP3S?=
 =?us-ascii?Q?vBzI6OFPviWq71Rmuc1btleqHczEvhNMY7L+f18VxKZUkdZjIJo7x/hEzvIF?=
 =?us-ascii?Q?IdUQfvzK2uRVuxeOkJZmOpfQtBXbN+AtOplZnXV0j3ewVM/qmGKJxHCMiBpg?=
 =?us-ascii?Q?SCfvx+yiwMKoAxZXTamdI5N5DBE9krVPi9B7UmnSLKev2+ZLvqmsa8OrLz1C?=
 =?us-ascii?Q?peNxdJfeWGeQ5F3QKSDLDCcdu9lkeQS6c1FTx/phX6Shl4PlkZYA1ocLLLxl?=
 =?us-ascii?Q?2SqPmsLjJskd4+cVnb1ofKA4LzVT7GUdny9/HSbvNTaDDxGYZ6YR59uFgqQB?=
 =?us-ascii?Q?uKe50VTSyYBWAivaS9MgtMzr6YtGG6OF4m337+CYmwewI+D7yEk3mQgJHzL8?=
 =?us-ascii?Q?gOJgnRvzNvk6Z6LE7tPh0mGdoH6lIVTylt8Oc3inI2bZMkHRN2Z67bILTiIJ?=
 =?us-ascii?Q?4Uh/DzQfQenOv0Ay0CI07jn4odjuUHnQKg3F4aNFLYnGJ1uoM16gSm7enhp9?=
 =?us-ascii?Q?35IcVmMOb7Zq7GudF89r26fXBndq+ZcQ2MZbesLKUfvlRs3jwGCSInnY9rBj?=
 =?us-ascii?Q?2Ca2FcjosUk4lDKjfN5lA6Ggst40n/1zyO6WHCKYIC8RPgSsFulSDvmqe1Tq?=
 =?us-ascii?Q?8OjcoXGiJwze1DIQH5gyjrhBDPXgrrWNjRKnnUOr2Qx2H3HX7gWv6AYQgHUx?=
 =?us-ascii?Q?g16QH0J7t+acrer9u5G9iOzcemVD6c18uWKqBqaomQlNRIPto68RQJoYt0JK?=
 =?us-ascii?Q?rohFKQERsClUHbBw5AfTPX+USMpFu1ytO41gqZue3NUUrl7pdjYmRHc9fGA3?=
 =?us-ascii?Q?hBUWua2D2lMqL+tcmHrFqa+/uH65PHtZxpsPUGrDPK5mAlBfcZuHWp+/fMae?=
 =?us-ascii?Q?zQf6Ai9/rKr0+8b8JBgInjwfsSRYxQw9+IAoSDDa2f4cspJC9oRhE9lkSXjW?=
 =?us-ascii?Q?JcIqGZxkXwtLqnmG9L4EYpJhdYQN4WvlrcWyapz0BZTa2omqnLbX1z/knnIw?=
 =?us-ascii?Q?aZZHefP9K67I3aZeBxoTN2InlB8vYRBDGpAwvZzozsuE5Vsoye175t66WFma?=
 =?us-ascii?Q?+lZwnQPStldpsk9nHaOZPuxo0GmOFAMn3wKxfIOZjYHAAdIpxHq1/PWgJScZ?=
 =?us-ascii?Q?l9lDrh1GtHaJt2Ctvs24tJ42PVbtIZ8tCBjAY8pSLwM0QWd+ZJKFUYDc7Lrv?=
 =?us-ascii?Q?dh2GRdkG9/F33kET1X/wcA3Caf95Kq42m3r31MsByYYPQShkNzE+gL2k4aDR?=
 =?us-ascii?Q?nypFUREOxsGHzh8iO4ZN/N/5Fh/R0ZocPzZoOW5Q38RESq8fouLxOaS7qWN9?=
 =?us-ascii?Q?7esyQ9JjbaBpNphaO2u5xN0T+jzw666HDFKncdjfuq51xAW8437f8vY3rYEr?=
 =?us-ascii?Q?ApcSWCE9xKLn7g/QLI6CBljeEzMcQT8WHdaLSwznip8ovAQV6lhJP6qjPDqi?=
 =?us-ascii?Q?ghmMYjRPZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c676e5ce-928e-441e-0671-08da1bea659b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:37:56.9645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QKhqUnxyPkXKBIys2wR2zq+d31L/Dlohm2qXErE0ZeUlsoaFiLEalKncLRf9+PT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1290
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

On Mon, Apr 11, 2022 at 04:13:54PM +0200, Christoph Hellwig wrote:
> Initialize variables at declaration time, avoid pointless gotos and
> cater for the fact that intel_gvt_create_vgpu can't return NULL.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
