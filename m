Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A84FC257
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB71410EA26;
	Mon, 11 Apr 2022 16:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EB310E9DB;
 Mon, 11 Apr 2022 16:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1T5fTGCWeaL8sSy4kxKABoZCGuYdOG6D32PoNrEEIrTtjDB5eAkllFlr0zBGCiHJpmseervhBK0YiNIvDiZUeHdndcUjHSDiHbrct7YowqlnxEMiiNBZk7A7NF0fzJqjOOAaO2qW7iw5BfY3PpEnQd8UAR2ZmLsCIh1BseuoCb16gBTTjKc7DUdz+nLYGBTrR5FQMwA0Hhi8KXufSviHTNI/2fygYywh5LsU1wsssLhkg/AmVNRmK+2Iraq+ZHsRKe280igjeJYLisiQAQ/4fKWQdOhgviXYkyN3z5nBHFNqGCmHkVhbM4aWo+QJCNlWRj8CTKRyNJ/mpHTrCaWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJjcBFxBjc/ujdSuqNuTGtyWtJLruW7TrZs2Ej6Xa+8=;
 b=VGjk5B6hZgU5nM7qkywhmzEoaiCol1uro/vPUcglZeEIHUz0QbVR1L2qH1D25N4m9YY3oJszdV/bkYYYLgKvMPTL9dagpR1R6BBipt2Kt656qCwSae2J/1WfMk20rhimuQYu68vQOv4sbEw+ICWcWmn2hv8GNPgJXnq8SprdmEBkWWrAfPRSm0TeXHD5vjzA4TYg3XYxipU4cc+TNQtT3kD3SL2SX0p+Oge3rz+sAK7JUivD2w5uyHKMk1vCRGLEW36m+fzokAjplE8qpdZFg3GqBZ+upFGOuCAtU2sL7YbIlzvYZbR7pI/eKfyxLeFsV4CIirIYMIFt4TH9pBO2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJjcBFxBjc/ujdSuqNuTGtyWtJLruW7TrZs2Ej6Xa+8=;
 b=GaurF5ZnT+Ie7bmCfdtnTQjwJTw41clthqcD2VpBQ3eBTB8g7kE4/4OI8AGPb9IibtZjAQ9gUF8H4Pq+rJSClnrBJfko7+SB+xkLb/JMEV8WrNrjClibai/WbNJ+kNpFFt6ANV8T+QvjvzmxiVmzj8Zpj+AlhtMTWOvgcb3hDyvryS3Kv8OC7C8cJPwXGG9tzJGVxbTIlA2I5vLuL0gQsJ8yFgxAalqqBvEwowvbRTZo3aAK9EW5xyhRalb9wm9nN9/E+Ttmf75pWyeKzhlBnZsFh6QNb0lbqXz/oPPIQDBzj0HuHfVFiceItdbVajjOoFx7+55WY7BzNXyHYI1v4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:29:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:29:01 +0000
Date: Mon, 11 Apr 2022 13:29:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/34] drm/i915/gvt: devirtualize ->is_valid_gfn
Message-ID: <20220411162900.GT2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-19-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-19-hch@lst.de>
X-ClientProxiedBy: BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d4120a-1f25-44e6-4745-08da1bd8631c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4038:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4038895549A7756068E6AC70C2EA9@CH2PR12MB4038.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0adME/8xK24qNqL6dMxw2OUgUWscRS9pSVQrAAtTgOuqG+S51Yr1xMuxPUJy1DmsB4MbZwbojxq1FBs1Z2jNF9Cn+Abo/pmA8HXV9ubu1zodC5mXnrJkfLAtCTq0oTGZC+mYey/3xtlrsOsa1PG1r/wLLCLqcdmPG5r+LLB3K3UAnMOLbifhy5PACng9lpYAwpTV1YY/5O/utg00pbuIQM816ganm1XJbv7q1zIQESiGqxtVc4S7lW14KGuRAYJ8s0sO1eyFHvYDQH/ScyDlHqiVTCXcol5L9rFBlFYVS7J8hwNG4e3D4GnAMKqHkw9esVOKxlsif3gl44UzdihZk6Pg5rx2k3PGHLfF/iqoBX6jms5jYdZmIJx4bhOJXjm7BSZfDYBYZZWsYe7kNhlCUKPoqbEOxntvRsjTxcn3fiDYQ8RntA5duW257xGpKL52bFN4Cuhyg9cWpTY/yFXeQrRsPoc07Rsm+fIyMmHCpzbH9ZwRWhU2Eus4JnYkxGr2gHHysksyetINzgheh9SzRn38JWUr8PqVJFiD/ADPg6CB7BVY2Oi2veHKYvmSjZfo+tsuuKDV+40SlTfZ97XwMjM7T3oGSdY4RLWVMRvTLCg8E9MGwQXjl0/+twem3c5PgE/74lLPafLAv5cq6aaPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6506007)(36756003)(5660300002)(4744005)(6512007)(186003)(83380400001)(26005)(7416002)(316002)(8676002)(86362001)(6486002)(508600001)(66946007)(4326008)(2616005)(1076003)(38100700002)(66476007)(54906003)(6916009)(66556008)(8936002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0HX7VQ3ofM/zyzFqZHspNzh1fFJDrUWtJ2CAG//ZyUjqu5WC8iNqoo6l5Hf?=
 =?us-ascii?Q?GhcsFJXsqo8+U1kqyRBTOtZ80Bu3LG16wPqyp6XsTSu/psbAMSVxUnRx+nAE?=
 =?us-ascii?Q?0gitJMTCULWg3XpYjE4xei7AO3LTqvN7EiInwf+FHo28rf7ssITxkS/JypM7?=
 =?us-ascii?Q?BA4sZbbNerBzyyIuGSaK1BGtp4zcFwsrBcjKJalS8C/CbfJir1DcVelF0kVW?=
 =?us-ascii?Q?1EoacFgeDYn0ZTT8LSykYDP5LRK1sorLVEAo4Y1pvoYLt4k7apjGPw4/Nqqh?=
 =?us-ascii?Q?4m2X145Gq8kJMMnQYKDxdPqB4WJxzbJHFNtPy4k9x1slqyces7RjemfBZj6D?=
 =?us-ascii?Q?G4l+tHfhHFMWq08r6e9VBogt1DJ1Y1AXtVQN3fDYB0O35c/utOUqENfGD9bV?=
 =?us-ascii?Q?rT1JzvjS7wG39KzYUyniFa0Sri6z9qenhZGKQkkaudM45BTQAJbTEOJIHxLR?=
 =?us-ascii?Q?zFhOaGRcDGHrwv6QsGyE5Uq2F3T35MBUCGSaqjxxYga64nHgKc5Jer9pJBDp?=
 =?us-ascii?Q?HRf2L0mXRK7JeyPZwDrzIdxUV+NF5h+od9lrGyRW4crZ49hsVpmUgvNVlt+a?=
 =?us-ascii?Q?08IRNJcTwovCe8HN34U2HL+eyNiKj13DCB91/syLs1nXPxQMBVJjK2XBaTwi?=
 =?us-ascii?Q?blhmU13hkqDwz+o38lBj3ZwNHeA1raaexu4EyEfz9R2LaILJxCNe4FqDVW8d?=
 =?us-ascii?Q?BzgDNZD3VspkdntqnekLCL1+dj9Br6D3gMJXeaFhPsxffg9Ei4ldoy86bcXO?=
 =?us-ascii?Q?M6Vk6soQsLk/JeQ01TRacC1ZQF3xqNwD5uwwZMuam9I8npV7T3nA1IJzxhat?=
 =?us-ascii?Q?6qG+I9b/5+FtnHg2LcHmw3A1+cT6hl6v6QHkENrVu28qXH+EHDXrf2BDuhPW?=
 =?us-ascii?Q?3RstKoS5Azp7D8tQKdHr7HXFSPoCfhq8LB1uF5CCsKd7Lo9nG/rsgJw3fzft?=
 =?us-ascii?Q?YU51xDwqhUnQliq2uWg+S1t0o5xgCSSo5XcOnfjOBN5bq0reFEHdTQNvNTZe?=
 =?us-ascii?Q?xMHFnSqK8aFI6lm6Y8GIl7UulGNG+wTvf88PnqUVN4BeZ4teMAPPlfkQmxj0?=
 =?us-ascii?Q?2DOHdgOGjBlida8l1Ifc/PHA4KPF1ecfx5Vn02Mq22AMddm5aCi8KO5flw3a?=
 =?us-ascii?Q?BCXsxsHkIEN9Ox5L+PRrOEi+iYXIDWVkiiKEuxB6VueEd3MMxWFmNz6X/JCY?=
 =?us-ascii?Q?VEZaf5r7+iTbjmb6F1wAMbyV68KTwe9JFhRbT5rBxLYrmKqxMXU9WLWzHC2H?=
 =?us-ascii?Q?8YB0R9ZaXptgp1wGqDXwh9Sgz61g7FqpzB3sSluGBN8JBPnpZofL20s5KTrA?=
 =?us-ascii?Q?MBPyPBBZB6I+cye01VF1HippEAV7a4yAq4bvJUMp8IR67QKvbimBf+c75O06?=
 =?us-ascii?Q?Zmnl3EbjpTfGTsAR8UzvdSaN/kpmuN3WcODZsZOPUc1xLg1hOv2aiPg6Xa4n?=
 =?us-ascii?Q?I2pZsTscabc04WHWryCmqC4uheGlUtKytoMZw9cHGuhg3uq4Gx0Y/yuHPN2b?=
 =?us-ascii?Q?WO92qmgpMchms7ySTkw7buQG40bLWIdppnILWDR9wDxcTq1OD9FRfZy07vFK?=
 =?us-ascii?Q?C53K9j1ZuqDfMg0UL6QpEfF65aIOjiRPXsCJuz0ic0kDXFH6Ey6/Utf5Eb9T?=
 =?us-ascii?Q?zyhOOzeF22IOMmoohwEwBvNwwRdL/PvquSEHS8gZ0u98ugHVOBRRtGq+/czj?=
 =?us-ascii?Q?iw8lQPs67+5cPWQLm9+Ow/bN4ntpdgJWYmoEiPdP5xsFbS+UB0sphs609ZGi?=
 =?us-ascii?Q?Xpiy9xds+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d4120a-1f25-44e6-4745-08da1bd8631c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:29:01.7592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a27KlNHeL/uEXpqUG9EhgdFVGQ0THXJHm7ZbQ0wTSNq2tENIE8Z4KVva4Cdertaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038
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

On Mon, Apr 11, 2022 at 04:13:47PM +0200, Christoph Hellwig wrote:
> Just call the code directly and move towards the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       | 20 ++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 17 -----------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 17 -----------------
>  4 files changed, 18 insertions(+), 37 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
