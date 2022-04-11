Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D2F4FC3E9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EAD10E02C;
	Mon, 11 Apr 2022 18:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2854B10E02C;
 Mon, 11 Apr 2022 18:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wfg3ys8m0HtxLEXXcQEBJjnLE3/dtP4CwrGWCtwwwHxBJnRBHG/huHitVbPQvZEdYggNYcjvI8IbtXjmctxr63b74O5lVQF8EHd3FjOrz9L01+WRm/cTyHA1hdsamhCEmNLFQXLbyYFYHhJWXJiXtlmw8DufTFMqn+7EsXnjjRHSbVbqIUkfcfq+dAMugmotQ9U2WVbwFolfx0aX4UdIP+H2JOauwMmbiEafbtM93bH2s+1t09tuBgMQsBYS5FYx0NSHe6Tk2IVkx9ZvbCoMVI3j672zOSM4hEhHkm9yO0RZJX0n7o6+Kr4SqlXzelGz8hX1hEfn2YOJgfeOgfrdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4zLgUssKzYY0rqWs1+oa5p0/baT1vYuXFwoB27zXJo=;
 b=JxrF0cJEcHUGtL+QFtDmGdVqkhIILztNA9C3gQws1VBH3MZLse0ztGl2c1VeUxIPCoSQad6tU+31pkOzIx/Q3XfEFSLL/ukZTnz82NgYlHMd44Ui5wssip985C+YMq0GdYQnDmq3o/VcYHawA1863MHPQ/ij8TKs3L/7+mqRfybQfBVWCJKPnHI7U9BnJVAoWtkR0v+dSUd6qmYOB4AaAFM1yP7S8ChhM2Cuyd8/B4H/0NX6dT21DJ9TKlbOFQ1uaDKHLHfsVFdrI9WELmmB3WxDUHC8wI5aEqMUhL454zsQZFhsCtbv6on8DC9s/9RSWnLbtCdoyIKc/nAbza2MiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4zLgUssKzYY0rqWs1+oa5p0/baT1vYuXFwoB27zXJo=;
 b=YpT31/pTQcG8XmMUUGrhKKiaVp2/HSqz+FvAdt0MIl/q72PZE/ldDQcufTow2RkF2qR6tLyYQFcj7TZJtzqAp4rpagReodA30qVIBZzI6TxoYZZ5CrDCY2kidzsF3q1SehkXwqNAb8Klb6nzMBffsI9atpnc7nGvpXb5nV4glT4ef0TckVNO6tuQoCdKDLySHDe5I7EinR6tbnWhXOT0p/iAv94h/lgkhMGCyO8eoczW0XQYUaWWKO9fvkW5UzOZayWXySsuellPWMTw6BjYvGyOMkFN+6MQptf9UobFfqGdVxuM35ORWQAAQSvaPiIxxIfyXYjAP6mzhlBSe7rSnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ0PR12MB5470.namprd12.prod.outlook.com (2603:10b6:a03:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:13:49 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:13:49 +0000
Date: Mon, 11 Apr 2022 15:13:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 23/34] drm/i915/gvt: remove struct intel_gvt_mpt
Message-ID: <20220411181348.GY2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-24-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-24-hch@lst.de>
X-ClientProxiedBy: BL0PR0102CA0029.prod.exchangelabs.com
 (2603:10b6:207:18::42) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ebd11d-199b-4417-6698-08da1be7070e
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5470:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5470CFF9D204195BCA263752C2EA9@SJ0PR12MB5470.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/hhP2yqlnezcCpD0bzxe98KkT3+HI1bPNhPQGZC0stTCT0JCrvaY1mAXqfRzS3QG28IdIubqGd3U59zuGuKMalbDEUUEnQZneN4sqRIoZ5RCZi3WhFJjOelW/8S0Bj2SR0oQaCflfcF+/hn7jbfYpIjq5oTsAe8Nvj9qSXuQq8Mzv/tBNZAOeyLKMLyZIwhXi1eUu7JnKtXFc7nLBtj8mUV7rVzl2eYwDSKx6pC8qyNxr5vkS6i6vY0Tx0vSploNpyugo5T0mvaYfTVpjznbSXKCDbgHIgH46wuBK4oCFDJItmQT8VCaEINYgp7YYv7/7Vhvt+zytbeUx7BBz3zlf84tG1BDmoPy1S87QwhOpW7heAAAU0ySI/BN2DOd7ZCLr4a70O6CfJPLb78X0B/QN16yj4Sv7x9ln8EUzH0lEp2pZ7c18ZCLtDhtAZ/oXs1OM4jwsQ2Wi3Af2jVXK87X7CwGNBZIiMoOEg1xYDmUlg66mEob2GPuEwNC0ghjDk4OlHDgPd0cM4SzLg3zLx+ygM/YzTTOxyT/3MlKLpX/atHysB8oZAMRly8RF0N6kCmYORQqHPDEYp1pCGKhe8fwEu4C0pWoZQ0NtDdBhsJMm+fvj5hNRBye/PMG49BUZBxNF6snncN1T+PVwjA7RlqRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6506007)(36756003)(5660300002)(4744005)(6512007)(186003)(83380400001)(26005)(7416002)(316002)(86362001)(8676002)(6486002)(4326008)(66946007)(1076003)(38100700002)(508600001)(2616005)(66476007)(54906003)(6916009)(66556008)(33656002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hP4EWR+N57YuPwzViubq0sxTDzs6ybFOOB+SkKrKpjL3EamgZyg2WU4lksA/?=
 =?us-ascii?Q?Nt3I3ElPNCt+GDA7n+JWvq+xEp6Hf1v7xIy7k3FBlNnL4xvynh2TMKSzv3Q+?=
 =?us-ascii?Q?GVaORf2NixRfZnvFrNLMLIIX8HtogR90zP3CQrHejZumuadY2PpWiW15hqoA?=
 =?us-ascii?Q?2tGQppVPq8mrO5zQKFDniOda4tKjG3p8RsqfGX021V9BT8vIYeparSQnvo/I?=
 =?us-ascii?Q?8yucgeFdriEjwvOXl3PlTTzSGl5oqq7tzZEdQDyvHoIvrmRIlVeuADYF6Au5?=
 =?us-ascii?Q?ePXK8qEHPLUfzaUqXSuBgxaHm3zlCANJcavCy8X7JhKy469lf+AG6LZFnfs6?=
 =?us-ascii?Q?dj/E9k2KMnopTC1fem/u5kUxQcf4h9CDQJSe6urEZ4fqB7TjkKyJKWc7I5gJ?=
 =?us-ascii?Q?apnZJ9LQiHVoDNRP4WsqpYFJS2QDk5b1S21DUizc27Ax2ZjuG2VDAsiMmXAT?=
 =?us-ascii?Q?f4LHcm+N30zl7PkcUDhR7LiQPC23BTDUzb3+yW51VWzUKYGJWuWC83YR7k9N?=
 =?us-ascii?Q?yR27j5xqm0JBQ+ftUHFPfoEuGE7GaIMPMIb1H6NwGlNAM+LpTD0WIMhgxiwB?=
 =?us-ascii?Q?t5NcMfWLPqd4SXPgCEBp6FOgnTnz5F9TP7SYunIBEN/YPMYumDIdyuK3E2W1?=
 =?us-ascii?Q?V6rAsUgnT0oNgPJSEXjAZpH/1lXueScznW/rZ5zg+Ln7HQlaiD9B9cF5T9x7?=
 =?us-ascii?Q?mYsaGtCirMt2S3WW5xY+qlzx4LxM55fJz2dHS50yiZ1IxJGEdj4KAYWVHCLe?=
 =?us-ascii?Q?zNzY5isbPWXIJLBNCSMq+HSAItbTuWMroOBjFP6WBLWjjRcz+7+IM/ns/i7k?=
 =?us-ascii?Q?2xgbr5OEoQp79zkiVlhw9+i++VcGNqp1jS+KrNHPFL/LP7WYI7izFTybP6W7?=
 =?us-ascii?Q?TwMWGnF6bBR1iEplN5NCc+ryaCx3fpCAjxPvYltkPLp3PBwdHgmqAGgzQf1K?=
 =?us-ascii?Q?GCJmqS1HFrB2NGna2XDB/W7pYPiGa1JL9UP0W5c7ExzPiRvPca6WLuTNTYUX?=
 =?us-ascii?Q?U56VJ0k5Zuw8NwFmUiexKPhO6tfqddWteVFAWspXxyfcjAbtaKA2/0j41PhM?=
 =?us-ascii?Q?VwVICL+py0PpY9BJHsZsHIBOxiByf39trYfT21U+mAhcPzj+j6K6IqLSQS4n?=
 =?us-ascii?Q?mYofEWUd/Txf1DDbcLm8AB5lI4Sti/BPnmmLKAvdRFf6JUumBvRDrFrxQxGc?=
 =?us-ascii?Q?15erHbSeQzm1zmIqe6XvHJIb17C06mkbo/XO9sbF5Ani/ngtF8qNVcbgEXVl?=
 =?us-ascii?Q?AUkWh9BGcrt/kmKf9afnJbVjgyXjQe2I1kkzcJdLRIXy/V9kX6i9xSubZ5fq?=
 =?us-ascii?Q?QiSH1r+xhTHZQT8z5cZG3EQ83NzDFsltjK8OW61NiCNYk0MrpLwIPA0VxN09?=
 =?us-ascii?Q?UuTnCzsF1uBS0qHS5DnkOD4AxToRYHGw4ZN1zFS4fekoL2WBkJJ6X1s3yi6g?=
 =?us-ascii?Q?ojwP0d+cyfXOE9+J5wKbewZQKq9hrDkPej1xDyuudMDDZ8/AI/sQAkhQPKtz?=
 =?us-ascii?Q?Bjr1B8jbtz6YuzACG8eATGrvtz10VsAf7kznqPs7ld8kVDfzo4JmZj7h5Dbz?=
 =?us-ascii?Q?+041KkuwlSvXt656jE9S7z1RA8joKdSOIUENVwik+p1I9vTzu5aPRczmrRF+?=
 =?us-ascii?Q?bKxgGOCHRtfaoKGhJhDdi8iUoHmVtspVrRLY/9nBmcJqBHl4MkKNl+eQDVGi?=
 =?us-ascii?Q?3slVBaCcYic2Q2Ss70JcCliqe1FQ4uOcSsrc/qlRiXxaX78vRqIr9OGlUHNN?=
 =?us-ascii?Q?LxLTPxdq1g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ebd11d-199b-4417-6698-08da1be7070e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:13:49.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdSJ0bKFplr9ryJcRGswDhjY+ypKeDvWraELmqmVy8POoebQCzvcexR7r1590bwE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5470
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

On Mon, Apr 11, 2022 at 04:13:52PM +0200, Christoph Hellwig wrote:
> Just call the initializion and exit functions directly and remove
> this abstraction entirely.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       | 11 ++++-
>  drivers/gpu/drm/i915/gvt/gvt.h       | 12 ++---
>  drivers/gpu/drm/i915/gvt/hypercall.h | 50 -------------------
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 39 ++-------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 74 ----------------------------
>  5 files changed, 17 insertions(+), 169 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
>  delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h

That gvt_vgpu_type_groups stuff is pretty wonky, but it can be left

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
