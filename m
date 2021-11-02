Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A8443259
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6E730E4;
	Tue,  2 Nov 2021 16:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5742730DC;
 Tue,  2 Nov 2021 16:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0Gk4XI5ojzj303GuIjoABSchorsKmRyWqCgIOglzMP+ezcSgGKVd3/mw4WGA1ADJ34S1EjNuz5tFEoO146hIrSoayPAXWgwf3fh97+AjILAZS6B8JhVRVozbcfEJ6gvCDm6D6mdJ4jiAya8cBS8Ql0W5wClB6xI1ETeHliCLUmCU9WB20SU31HAgzzFPkXQ9cnitkgA9q3abzvHsrgDzb060lK0jg+KwEGm3gQKzWnAZSDMzcA5xKRoPMk6Uc8b5DwsaQWkjmsIIo4hdfMtfDh2KUL06kSIphcEADJMsurDcT8fQegBvjk3n8+wOj2UsbJxcbpfcCzIM7hwMwOVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5WwDkYqhjHjiOrVkpHX8z2tKqxiQD1GahnIKYZykrs=;
 b=cEDnI5XkVxgr8KislFj1+cm3h+taMABmhPltMzSQC9OA7lSWykXODh7FpHeU3/1LKNQsceraCB3neAlnKb+qPFPzG4/vZ1ALSPkvA4FuKnt9gA02Szta0Pgp3mVc12bpDA7kWwTh4r7/OvFUl4mGgVW3D80joWIwgRgSYAXAUSNLTOBomP1Gtwb9IKjHPvVBmaQnByf9Cy4bh+Zzmbi/iCPXqtzYhxzW+mpqcLPsy8FT8CY0iClTYNGjTgh1q7/xmxhkY5YsZg/sUXFXV8FaHOlUKdgKNb2zh/bjExoiGA28qeei2vnyDzS/UWvGphQA76+mJnkdUxM2OPC0Lobi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5WwDkYqhjHjiOrVkpHX8z2tKqxiQD1GahnIKYZykrs=;
 b=gRpzpkPkWjJi+ddZKZYCNijtLGol+VVCX0zn9r3RpsE2eUxCwxBOVEavphKhcIwcWbaGb1+8WJrFOj3NEo7iQtKGD/qRcTbtMp5wojhFjsCgpQ3wo9bD9NgI2xR8tcjepNHG5VoBeaiJ7NDoZIlfKRb8dqoQ1n2Aw5fYpX+8gjn4pGa7GUBFjRViEP9l6G9AcuQBP9ia/2D8F/iiYDokkw1YDGrTOILiPH6IpHwOu+fz8wSp8E801odYR7xnynf/SKUw8afaOFgjZuZfrCjBGiKY26d/U8xDC+0Nh6xJgA/l9xxLpf+iaTpF7W45lRvZmoIBdIJjy4HoZBybA5RrJg==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:07:26 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:07:26 +0000
Date: Tue, 2 Nov 2021 13:07:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/29] drm/i915/gvt: remove vgpu->handle
Message-ID: <20211102160724.GR2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-13-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-13-hch@lst.de>
X-ClientProxiedBy: MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.18 via Frontend Transport; Tue, 2 Nov 2021 16:07:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwJo-005ALd-Rd; Tue, 02 Nov 2021 13:07:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e715fe6-f436-46b6-9269-08d99e1adcb8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5110F4740447EADD9AD7629FC28B9@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bXBRTgiN9MZtZcYss7avH0ppzgyOldSbN9OXe8a4OFgwWhSsatlnSj3FoU2F3JEf2lCK1peh9ueheTfJ2UhmaBRsSqq+Q/TP/+L4hM8aVi7VIG1fsE2KVfHC0nGzOp724e40h7wS+SWnCmSJIKtLoCv3IIXnUO4H6+8q8/yDnlpyabDvNYm+ebMMIV7ey3jJ44yG2h1Ou1gYPhauqItEzxvx3okee54RzPxfadSKmzrfKoQgKMKRhNefkNknnV5Ndu7BwHKoHId6YIBhzu2DOoF7rrM4lhMxMLRAlb/4eEkrbnVPZuAszHWEVeTWUI3Hk4P5n+Sa6fmf7Y3Q81Q9DwSBaNCGTWJXlUTgZcqpwa+eJL/rsr0wfg1OhPsYj9ixbBEBB5PrIMpjmczkRY5s7cR8VilVtZVQtKm+W/LLwd0pCy5agiDqOtnZo0kfJtCibK+wbhz5YnnkCaib0UIpG11+N3kxYcvjO0fpHyJHIXdhhkRUignqwPWEXxxBqyO/XDyuDIvTVGOUisxL5F+PP6RhvX9H0m+BsexIw0qrHfCHuiQFnRh1iskeRUBD+FQK/0C9SIxhkGDCIOa3gzWzxCM+7rhO5lkcwbMU5Fht3yz+t7kziHzACEWHCVSQXf3qJw8wp3Bca8S0gW6CckGscg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(9786002)(6916009)(426003)(2906002)(38100700002)(33656002)(7416002)(66556008)(66476007)(2616005)(8936002)(66946007)(9746002)(83380400001)(54906003)(5660300002)(186003)(86362001)(36756003)(8676002)(508600001)(26005)(4744005)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fu7K3kuH1bgl2Atnyhw3cAxdSsa9eWYtr7JsUdo2hqsghm0x3fIjxGhP/W7k?=
 =?us-ascii?Q?Gt75qKWh13VXBx7ZNYGjyNWKroJnc4s4gDfFKg0NPAh0qOf9okShCRNH9fo4?=
 =?us-ascii?Q?aYXrr+Mxhtctte4ofxBz/5yN7fiY0dM28rNamSo6mQcjInyp/aBCUc98T9mX?=
 =?us-ascii?Q?cAUK2eXaIRI2SOHWjkNGY0QwGkHfC5RrTqe3uI1HhygsMBzmIcy6SfyXfdLM?=
 =?us-ascii?Q?atiHnYpANHvWFdRdsJHlB0vsRaV+COTv/M1TrQWSo9XhhpOP7el5jAX2uoHb?=
 =?us-ascii?Q?BXycU2MTF6RqeZtOjU3WGBvyDSjIlU7qlS/okYOHn6KeV1Ib9uM183NdhzMv?=
 =?us-ascii?Q?fVoXRLarI8bSLnlHLRBXiOaJzQM4JAbLf1bVANCXyrVBYkbzDSOlKSPfwEhP?=
 =?us-ascii?Q?Zlz5IyBjdPgBdlVpQxTRak5+Hy6CtD+MPFya2fAydDEVinc4zhG93SxNhmwN?=
 =?us-ascii?Q?+GkfNqapM6jFafUpdtGyBOLRV8dPBbUGNEDlxsifusN7rpxrk4jkTgm1JdEY?=
 =?us-ascii?Q?2G2330s4EkcO6RE1Qvs/VBF25lDZ7N3nyL7ko5hopIiLB7tL1EknoD1wz+BB?=
 =?us-ascii?Q?0UGmtqzT0oPE1qNgj35Yr87OpkhFkwaibWiWLLEbMKE8ph2JTxcYkJcvXqOU?=
 =?us-ascii?Q?Sf+fQYU4Ggprl0F8XFia0Vws3znBAAiwF3oRlg0yvG7mrW2QxmsjH+vBMAiI?=
 =?us-ascii?Q?BSR/Phdj+0qUhNyBUbHG9rxRBZGWrAcBqibfZvYvs+eAPjdcQgcJXOmtxgWc?=
 =?us-ascii?Q?vLQ7qWiCQtIOlYIjze3mojxYnAU/OYc5LA+BpR2SJVo4bkJZTLnlWCOUPgnJ?=
 =?us-ascii?Q?Q0PGwNRMXaKfPIr88RPUplH0r2WdjWkBWdvDdODS85HUKq0BdCg5ZJVNc3Di?=
 =?us-ascii?Q?crq4n0xsfKFukLrEymNNj2LdLWpvu5s9OJFeeq5oAUmpx+c0dMo0u2UYmLPk?=
 =?us-ascii?Q?pRpxv6hSp0Flzp/C97RGe03J8QaKRVE5s5E5oaacFttBvgogztJeVyXU/y6P?=
 =?us-ascii?Q?83p8sSe5sLsbfZML3G9eJk3Poy6x63WbWw3cWDjRVV1WRRDIDGW6ennfo4di?=
 =?us-ascii?Q?zZ0mS5XGGSVVE+Z8kOrr6dSve/dxOHfR+Byc7o0ramDGDN0h+xqPqfcKj2Tk?=
 =?us-ascii?Q?eOr2EPnQoRVt+DNVi78dfkGc2+7h1IdWW3DDJk4KuX0odtZHGCd8K6r6kX1z?=
 =?us-ascii?Q?logGzBKuLc7ay5jWu8AoxHLhhDjo9WIyZYqtJ4s4qGErgAEty3wHcm+mvts3?=
 =?us-ascii?Q?EimLBsj8bJoplOhbX9bSySoDj7+qYMUguj+xrrS1k+5bJ1YGpgjkaEp1zN1w?=
 =?us-ascii?Q?t/MRk+1d5CldC7wtfHk66M6niwrZxKFXv/GmpAmb7mMjSDbK0duhpShBisJ0?=
 =?us-ascii?Q?VPL8rLaqSqx0lK1PZGFoXsQH5pWN2aUDeppOWLxnjILJ5X+9Zi5hLca+4i5f?=
 =?us-ascii?Q?a+uOhA/5mV3MYJZg2kx7wWwBB4kofNQd1ViYzQEN/YMiHhn+ZZCkj3P66Apg?=
 =?us-ascii?Q?QKZKPrGaHWMctXduLc8PYS5PezxPKG6j+vuQDFU/JWcMGA9i+qyLqdV8PCMk?=
 =?us-ascii?Q?1rWcgKXjhPATwBtlhRU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e715fe6-f436-46b6-9269-08d99e1adcb8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:07:26.0292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZLm7vF6JLwMkLiXL4lLVq/yFQSypSSPZiEYe3qlSDvmaEtM9Zhnqdm3wPmm0do0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
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

On Tue, Nov 02, 2021 at 08:05:44AM +0100, Christoph Hellwig wrote:
> Always pass the actual vgpu structure instead of encoding it as a
> "handle" and add a bool flag to denote if a VGPU is attached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |   3 +-
>  drivers/gpu/drm/i915/gvt/hypercall.h |  32 +++----
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 126 +++++++++------------------
>  drivers/gpu/drm/i915/gvt/mpt.h       |  20 ++---
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   6 +-
>  5 files changed, 71 insertions(+), 116 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
 
Jason
