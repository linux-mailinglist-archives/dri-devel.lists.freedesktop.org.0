Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF521443353
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4E47321F;
	Tue,  2 Nov 2021 16:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6C37321D;
 Tue,  2 Nov 2021 16:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMP2lRE6CXG6HPplPUAlxVFbSWWN0L2A6drvXeiYXetVyYD2sHLYeJviY2ZjU34rJdP6Kxqq+fmLS6VjOIatSX99Mk9qf1ETw5aKaOjoPtsJaMCEZNJCRXtb60HQdR300umXU6xZdtFdo1wGuADD+Jggfy22DDvSVWwewkSi21Jm1yLqkgOnZFGP9DbMROLM1ncO0hxqhdASZ5NsLzOuuOD5/XHPP7+SHjt8SJhUJaGHThx9C1ZqqnCTTfNtUNBlUHFJeg1+wekEnWJE4hNAfXEnvbxaVUbGJJWEwgoVpsfP2bhoMjoT0kFlCRtjBrM2q+bdPh8UeFtsfbFIydokxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E+DvoF7M0M9S+cShR1tV4Fq7E5ooV9kmwBtBfO9aek=;
 b=g3qug43Ic/2h0vhsAiY0T+GUTqVE6ywNef8VKt8l/LEk0enPMnijNRrUbNUwuII0teWku2r+GbbhhNpMhXy2UYKGTtbQ9hnL2jhPZIsKxqTtrzw+p0V0UCsrQDn+DnuVlM+eyx8j0gbZk7GBjBJylqPMFfeePH3ev8xQ9jVcoXYVm7rNxdINFD9gEDbOQKlLWzJXMysKVdjJ/JFyzhKAwlHdJtOcCj/rP944W8tYgKpuy557JkKyj2Lk8gpYqGBtITnowD20fpAvrf9k671R7EuWX3Dac2nmmMzfRniILczhKpLwKyYAIL1zWFKWqevQMRdvbuySqbXntNuE1OkNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E+DvoF7M0M9S+cShR1tV4Fq7E5ooV9kmwBtBfO9aek=;
 b=V0JYcM4SyDfEq9CAZzVKMDYO2DBz4WFxHpSymF3s4lsP/ggv04x8Ck2ScjH6AOLdDxi2/WuXxWmq1WNugbW5gvthh8Yb8zKxi7Q46lLPoKTqkvt8+doUSriIX0XZeOX3niRS4DtEY2uGTvp3sjr3lWl3Uy/TcrEdioWjzEZLxV824IaeYnjhh0Lq9oRq2awUnoxb0LmOhpjLAnWJDEXH1FBOqpv2R6R5r0ha+wwy5Vtk9wUPGFORiH9nrQes6HFPlOm4nKt8wK45ymjiIiS1mh2WW3EuZThCHIKlZI9+Scp69joUqOaKh+tXYZB5IBQJHo+4g1NxYUqiByXtEBffvA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:42:11 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:42:10 +0000
Date: Tue, 2 Nov 2021 13:42:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/29] drm/i915/gvt: merge gvt.c into kvmgvt.c
Message-ID: <20211102164209.GJ2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-30-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-30-hch@lst.de>
X-ClientProxiedBy: MN2PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:208:15e::49) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR17CA0036.namprd17.prod.outlook.com (2603:10b6:208:15e::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 16:42:10 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwrR-005Awn-Vp; Tue, 02 Nov 2021 13:42:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 838471ab-a84e-432d-8f50-08d99e1fb757
X-MS-TrafficTypeDiagnostic: BL1PR12MB5253:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5253EE11657C5654445CDB67C28B9@BL1PR12MB5253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqODgJCPMocrNo4KVjcirdHWCZ8Wex6GQfu5oZw8f8u5NNYBu8OXL2jB1zCLksMUaCXpodvxKGNFdO0mzPchoKEZx6H29VAaxDFCYeGqI3rtutxjzxO3UzMsyVWPyIpUBGPomN/FlzfZFun6YxUAH2iUdKRrOewdHzrxRDysBACOAQZIpUaZLte3v+r4nXU6FUviiEXURzaGFwWKmHQmli4PxCSU37UapID6hmQJed+uFTwXw9i+ed4FZAj6T+6tkuOkTOiBIQBXY95xaASNPKQSEpyMmGhJe+cFfJTMA7sWEunZoghvBaMG7q0eRRYOzeMudoqnoCg+hWPqV2hy5JTqObZyi4GTKyNNtCNQoa6Kiad3CnoWlJwTCBbsC0OXtO0beCfCYrzRJjwqs4LpHfXgZqurq3Jwlv+QF7JJxwpXKKMWG1ITVgoCp6F7kZr6mEE3Lba5t9MX2hCLtIpohcNJZYCB378GWexy9yDVbnr1BqsExmcKeGVo4/b17lLrTHqrWzDW62IBm41N5NjK7zfg3QB2mGF7sFlOEznfdmYE078/9b6H4E+lekRkWQIVSLs2kx8nI03kxoJSq6D+055EVRNCCa407mlE5L57wWCrWmLxiedie9udEm+n/u/K+uvD4Kp/HnjLiqStx6Rp1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(66476007)(4744005)(66556008)(2616005)(186003)(86362001)(54906003)(1076003)(2906002)(316002)(66946007)(83380400001)(5660300002)(7416002)(8676002)(508600001)(6916009)(9786002)(9746002)(36756003)(26005)(33656002)(8936002)(38100700002)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gsXF2qCVWMbooezl3a0nrJkTWsNxYTDZVQLWpZkdzwMpp9Covdw5HaiMbPpn?=
 =?us-ascii?Q?P5BA5Q3wSCFWPSGRvpxwso5q0Zz+HvcRG0wKrHc2QrLrONbzxJMxb5N/GyMy?=
 =?us-ascii?Q?A+l9pF59sBil8fXCR04ja2HSHyrD0gsyqyOJwZ/XGzDgVVcOvSv+B2VW5RBD?=
 =?us-ascii?Q?MjLCh7ye0BqhDGqqlk/Gk/D1wYwflDVk8jU2Qty+TsoWqnDixqSjCnycjax9?=
 =?us-ascii?Q?z9qytQUnuPVO0nItbJvKKke9TqTBGI5dPIYzZ0rGtWFR5bD5v8WlSFFvZUuK?=
 =?us-ascii?Q?EmWkGCJUCH4SBhNoPJMBSxNdK6pg8w6sqF2fvlwaDMn6QTGQzx+ubKsvp987?=
 =?us-ascii?Q?6fjpxZ42X7nNw0vAVs2ev7TsSZFoJ4/+3iZMKWQP7S7+FQBF//80e/CcyBSX?=
 =?us-ascii?Q?IuDlshSiUEp2RKrvHFbnEONKhXVxP9+PqFg3mbYVPZOrWqIVagCUrbJ4PBk6?=
 =?us-ascii?Q?waktIgYFCucqpVSbRIiVez/PHWWD80jJzN8Lc7BFv5HFj57pc3cjZ5JCPFyf?=
 =?us-ascii?Q?w3VswPAn566zEVtxBmd00Ri171SLhVyLUu42ON9dZ5yxtnAreeM0VX83Xetz?=
 =?us-ascii?Q?RugwJdGkPZsPs35exLwjZIPtiPCWwqjiVL7Tp7zuwj/mVtLcNj40tola3BsN?=
 =?us-ascii?Q?L+gPDhLhj9VGQbWI8hW4xUxLJC02gwZytmoKsMcus97sogqugN+P28FU4A/f?=
 =?us-ascii?Q?O6Cq3JfAjGEWAZCtVQuaFuZ6MUDeoKHyGeEQJBs47sOmqN7e2AQQJ7v3TUmk?=
 =?us-ascii?Q?MrSFMhMOhK/OQI11g6G/mFL/PSedL3ykITOG61cBGG6lZ122H4GX/zVvRIsH?=
 =?us-ascii?Q?CeWpFmN70TDd3nnxW9nQRqrhAfrCN7NasCt1Trg423Kny1VVhAsWXUwY5QXT?=
 =?us-ascii?Q?VUuE1zwOUtDzEBbiyH1Pasuy5JjjBULkXnGdsgvOlaOSuRqutEmdEmNwPGTY?=
 =?us-ascii?Q?IMK0Wxl3mOymB39XPerskQQ2W5nCDBkprdfme9NOR5wAgFRViIhhnWogjzdS?=
 =?us-ascii?Q?CdjRTtIFOxcbf8mrZqxAKp1AGIsmHXeoR/8YLE2DIPTgHSSNHBCAiXwo+StL?=
 =?us-ascii?Q?bTXBIZg3oDD7/7hZLDD/MY0NrivVHxLJ0wEh4LE9oB1tSNN5QRriMJEwf3x1?=
 =?us-ascii?Q?cgJDBkgnEfAFg+z5xLBu6yzkVdofHQyjKt//XiNhkHBpTJxp8B7wr4Ig99cN?=
 =?us-ascii?Q?H8ZQWzxCzAly6SbS9WJ4XYxwMllEGEPgZUt1G+BnnJUGU5HYHivu6nhdPv5B?=
 =?us-ascii?Q?Rr3BDe3/t/+sR1z6jW8OZATl/NIpcNURbeCJ2IihJXYhZI2qbXVg+WpL9OYZ?=
 =?us-ascii?Q?CR0wrJctlXgIxHr1FMotukzL4g31ZM9HtE8JNJ25deB3NIzb2l8l1MEehgxn?=
 =?us-ascii?Q?59M0EJH8jOs+bc4XQ5NmC3w0QuYFOxBGTr4n52YYkDqQ4XAOMDMOQnnJgNed?=
 =?us-ascii?Q?ycINk62JuM6UFhkV478JOwYobTCW5UB51WDomxemKndcYuO8rRkMunVH56ae?=
 =?us-ascii?Q?HtQA1sYcyf0rAZeFjbJLTPcGl451MNWxZHp/5MGYNghvTixl+7BuEARQ+YvN?=
 =?us-ascii?Q?w+4JenhP09uor1lBTOc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838471ab-a84e-432d-8f50-08d99e1fb757
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:42:10.9009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twO4aJclD8LzJ110paRYbXRU42K7D3yNzE907N1QlLEmLfB3IxdB2wpPaLgm6paf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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

On Tue, Nov 02, 2021 at 08:06:01AM +0100, Christoph Hellwig wrote:
> The code in both files is deeply interconnected, so merge it and
> keep a bunch of structures and functions static.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/Makefile    |   1 -
>  drivers/gpu/drm/i915/gvt/gvt.c   | 291 -------------------------------
>  drivers/gpu/drm/i915/gvt/gvt.h   |   6 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 264 +++++++++++++++++++++++++++-
>  4 files changed, 260 insertions(+), 302 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
