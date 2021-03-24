Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB143478DD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FA76E9D1;
	Wed, 24 Mar 2021 12:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DFE6EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZDjuRJo8QoF78RollJlR8a7XFa5JV9w0r8hax1qdaCwgw9Wk0c7tpHz8BO5Golv5RAKZHyhElGBoH2dQDqY3cUNN6uXBqZ54chjxc3XeRygeEh1OhwOFvbuTU/oDIiUWr7MIoKx+OHEkGIzrP1f10xpayIirtV59hwKmQ8Ry7hG6xFfCqoK5LSKzwvqwqiO6nTnX6+O52kBSXqOGhvg2D0hbfBAFDcG02QeWxoedpM+x/CAzRqYsEe5GSs/wrDIZt8wt7plkL80wgpbvxU48l7d2Y6p4ntmGMUC8Lue47IHanGxyoJGqc9GIvlElS/AoA0i4jLiMpYB5xs8Eeo+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=virzPQYaXKUPsr+L1QO0o363UBskPNhnaofgEK/cBfc=;
 b=addKtd/UPEUxeX+ulk/dJ4/F9MIkiyMh7K3duA/htfb7b2oPcNQZLjQ4WMdGJ5ereAyurYLNaI7nUkzC4cvAB0Twiy1FOwxbHKgp+GbRbM2tJPUX8FO2LXFUAy7AgTGe0MC7rm7GjWthuiyr32LcbjFhVEcmiMvkkDhwYiiH5+/YozS0vVeiWA73LAXRXnIZB23ieM/fTNooeUyWqonGepxwwqjKBv3m1Z3D6/dy41Ok0ejUKPEMOFCLngceaXTM2RL11pdd4K4Fg7lqHFVlwpgQ6MSC9hG+wTK4p6Jw+6to1fa9yLRWsKLIdRmksbJcz66qOLBZ/5yxP4ui9oxZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=virzPQYaXKUPsr+L1QO0o363UBskPNhnaofgEK/cBfc=;
 b=EerCsytT6fLtZkm1AxR77xTGgrZWUBzOKOCAOECa5mZl27gHm8WjSppC1Ro38RqAfwYRGTbt5GdcDGcaCHU0brvQ6ZW7oif4hsHcqVV8XVIX6mPzLftRpRKGJO8FoaZZlbver355zMPunaaaY022kbpTVq5U04XV7bl0JHT/CYHT8H+XVXX6bwSDGH0nUC0ShtRXqM1A5c4WSUXhbPKCTkexjR3dongUVEevWJ1xepR3UH2CWnYD7nIivB3f3C+5x+gLqro+iycbpJcYCMRR0x7ehhMcBSkF8y1uqqhCGOI7VYZbwG2qU+cUtfJwb/3xHS4ie1FCggMrLVuqp7+2Pw==
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3212.namprd12.prod.outlook.com (2603:10b6:5:186::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 12:52:14 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:52:13 +0000
Date: Wed, 24 Mar 2021 09:52:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <20210324125211.GA2356281@nvidia.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
Content-Disposition: inline
In-Reply-To: <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BL0PR02CA0099.namprd02.prod.outlook.com
 (2603:10b6:208:51::40) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BL0PR02CA0099.namprd02.prod.outlook.com (2603:10b6:208:51::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Wed, 24 Mar 2021 12:52:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lP2zb-001zXG-Jx; Wed, 24 Mar 2021 09:52:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94232592-f759-4a61-1317-08d8eec3a541
X-MS-TrafficTypeDiagnostic: DM6PR12MB3212:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32121CCFE106F1BC0EA53C26C2639@DM6PR12MB3212.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zHLzF+eNkuKy8yzdMZK+LoTfkokwdjDd8jky3cFPWc/5fc1jCfiutHlcjEC+EqkbILrBOz/AheYUSP/RWpz7ubWqYhJuongNzND5aiaRZN9eTC6o8cYzRTiNE7UrUFCROZBDetPvg/TEdl2uVhmluc8dDs+YDPzykpuKw7POXIwIcMJiCNY+ioRR/1m1y4OHtc743vbVbS3aPUjWkowDXtrghl4nPyYPerDchoQBihZ1EPgqsTXf2cjwHzzipIc5QxXrxP3B7oDq0wNN6rAPQ7fEY7f37gUF12H4imAsiPHno+crCerHSwBPG/4hpYeVMaiYI6/O+pwiLFMo8PUmJNN7qkTv8d1JRulQpPeKc1FHucnPvxppWz1iawCOoqJKiW/iBgYgahhJob3gSZDiW4qr8ntyTqP9nRp7bxmnBlM+N6ikFPBIqpxWAjE39F/twPv8HLS5xugVvIp8UXjBNfYNjKgsTe8j+QAZz20sPhn1YlHaxZ70OJoCMDFT9i/57i1QOvtQgFHBnkXYvJHxaLO8VTFc2fs3Pf6muWxoSjfdJCaHRFjk3KtROobtFdWPVI8MzO4DjJBPkwNkyWaD3JJ5TmUudaMngYhQi9VAznAHpyv23K5v80cFmANz3fjvyVSGaswY0qVVivliDi8+4RKEpKfa7pXHtMTVIF7CdRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(38100700001)(5660300002)(426003)(6916009)(2616005)(316002)(1076003)(33656002)(478600001)(2906002)(8676002)(8936002)(9786002)(9746002)(83380400001)(4326008)(7416002)(26005)(36756003)(54906003)(66556008)(66946007)(66476007)(186003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pXqnmPyrju+pmnh9UReFl17sRNRkx0+uIajM0CYPh0QkgJvL9WJaovBtB+NA?=
 =?us-ascii?Q?SF942bq1f0J/gtCcLu53fbN7CuB+MXvNPdExDQy07u4hbhJxaPc45ixF7Ivb?=
 =?us-ascii?Q?+AphOJ5WArcPL8IAY/SwpowGtQGjO02hThtun7eLsYSDXvT91GXx8HyDORlU?=
 =?us-ascii?Q?lYpcnRxyfoE1BVaMdO8mBH31kKe5yVhB7yi26MjJGFTKAd3WumQYOaBU6hAZ?=
 =?us-ascii?Q?UbP39i9ZvYRdfsPTzdIZyTdkE9SOcc5MhKAtQ9FBcsGSqxWZNpIl2Nvu71jy?=
 =?us-ascii?Q?LqZRxogNGYK/NvQqky+UW0sUAKi+og9V257KmGI62K3X7cPRpoxSIXZZ0pLZ?=
 =?us-ascii?Q?vzmmvOfP0OlhH9ps7eHXAM5EvX+h2S2USMXLcYrUgwc6UxRIt68N5QhJauM0?=
 =?us-ascii?Q?WlrZ/cCmw2i7Gh7+qDME8bwd0nuQHaNyTHxJe2Y+BWcAXdGkryos1t2cw7vd?=
 =?us-ascii?Q?MfnCfEuFxSNMNW9BDMXsTID8GwYe90pdP0CMvK5RZPJ0kZ7ItTAqU/KGPAuj?=
 =?us-ascii?Q?wm4cDqUHPYR6TBqbeQdeacV/6kMeF0zOy8w4uE8rfC9EQ38v8fRbEv3VRObE?=
 =?us-ascii?Q?LhB5BDXCocAAmDekEfoKr+dvA7RekLzUW2szT5pBHJ3sowUTljm496u/goKK?=
 =?us-ascii?Q?5x/XdLOkDQz959lNbA54SmEItzVFV5yJ2Gh50FZyvTrpFT64efJiyoiDAtO4?=
 =?us-ascii?Q?KwN5Ik0MiyP0zFRBpcBlCc9ssLg9tQPqXqSblFXz8aKjt3xY1g1h9uRD7xoH?=
 =?us-ascii?Q?m5euZXD9IW58NPc1yD6xvI0CpYWoSHvZ7Jccg72gnGXOB8e/3z+SsubwA1tp?=
 =?us-ascii?Q?wbmpPYVf13ma/xy39oi/sM/FIE1H1cVGeXsLE6ZfFEYvjh/o/3CAqbk/bjfy?=
 =?us-ascii?Q?xRsERaDIa994ZH1w8SJWLvsdKlCF828xh8OZ28LtwIfg+M1a/hKz6u35f0Ku?=
 =?us-ascii?Q?JhTHRMh+GTnWpohhw32nC2pO9s99bVj9md5A+8fMQ+5WYIU9OqupTCnfrVrD?=
 =?us-ascii?Q?fPMrMMCuPYgBaEsIlAGEPjYRspT6BpS71SC1mu2erigG6+rAi4oItX49gZBz?=
 =?us-ascii?Q?7ZV18+75yOaYR2YCScpld/FJTTWoj6e2PfvHSnyWq1ejhzE2FvDp5OjZBoaF?=
 =?us-ascii?Q?tJ2WG2YlgekmBYMOjFH4oej5lXCbO5HWWLOB9Yaxps0eIE6uUoPJ8UJXCFE2?=
 =?us-ascii?Q?F3auATak5U48UrvLv9Jo/vm4e9NmcfmekSO9YmTRBNwg5UWxtO+k0sbmrDhw?=
 =?us-ascii?Q?pPbgsiuePQaDcIi6hqAjxrOTjTSMuqXY+iTDy9lb1E6IUXnCuzDdjNx6+FjV?=
 =?us-ascii?Q?8U+Gqik9U3RvAJ4syEmD0gYC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94232592-f759-4a61-1317-08d8eec3a541
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:52:13.8380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeDWFZZ8l9M/AY1DpbroOjzwaMH496YuR61Pd7Y7ZComCNMpnzSFwT+2JBpEmPeF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3212
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
Cc: linux-samsung-soc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Jann Horn <jannh@google.com>, Cornelia Huck <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 3pvd@google.com, Peter Xu <peterx@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> follow_pte()")) have lost their callsites of follow_pfn(). All the
> other ones have been switched over to unsafe_follow_pfn because they
> cannot be fixed without breaking userspace api.
> 
> Argueably the vfio code is still racy, but that's kinda a bigger
> picture. But since it does leak the pte beyond where it drops the pt
> lock, without anything else like an mmu notifier guaranteeing
> coherence, the problem is at least clearly visible in the vfio code.
> So good enough with me.
> 
> I've decided to keep the explanation that after dropping the pt lock
> you must have an mmu notifier if you keep using the pte somehow by
> adjusting it and moving it into the kerneldoc for the new follow_pte()
> function.
> 
> Cc: 3pvd@google.com
> Cc: Jann Horn <jannh@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: kvm@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  include/linux/mm.h |  2 --
>  mm/memory.c        | 26 +++++---------------------
>  mm/nommu.c         | 13 +------------
>  3 files changed, 6 insertions(+), 35 deletions(-)

I think this is the right thing to do.

Alex is working on fixing VFIO and while kvm is still racy using
follow pte, I think they are working on it too?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
