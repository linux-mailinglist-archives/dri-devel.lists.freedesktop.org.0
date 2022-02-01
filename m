Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E214A577A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A5410EC95;
	Tue,  1 Feb 2022 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4BA10EC94;
 Tue,  1 Feb 2022 07:06:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJBnV8NXSyQ1MNLXhKAy6u8Wx44H8iybl+tjml1WNaYYNk/5pNiWLKCoL5U/GvIraOkFOcF6blZiNqqpQ9BWY0n3SXtYm79UaJLgYsdslQGi0rHa7mRUrIyN+/9Knu1godJ6nnAhz1ndMtxkISNjSGt3COT1ce1wEvYHy/j+0/vPaoOvxACvu31anDdP5QKSfYFwz2E46VaKZL9RmiMe6ZUoiPz4YqqlI14urYgdxwX6ulkP9rlFkl1ZZ1Rc5crOf7CQ1myFIabYu5m+SdX+lvJbwJ7dSIvIA3pDHzLtafKs+Nl/jQZTQBAMe/On9hUzgOJcW0HLTkUFyckc8FvoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ6LFUw58IhtHcaNI9ZjfoZam2GnuJDjPgplnJRKc/Q=;
 b=HbFBHkLkbvP3uRNECwJyBALjfI/UmSLGXUOZ07446n6Rt6iy1IR4GzC/xkTqgurAMWWyyshvK9AnN/sGgwpSqHBtzOfjF85o2AJXteOrnhX2LAlvR45pdigIShR84rHcEfqrcPCohoLfkO11qyTZJcgODn/eJPfiRyt9iQag7RJ1OAjc1WyFTOuduupk0LlTXKtkyOAg3F87ms/jn4e+gb9CbZWr5hQnpQ6cksnD2dIkyjiTVAG5UtOMcTEG/QIfG7vJ3JHsJm62m9L5EW/dn6V1zN4i65e3FDHafYWeVR3ehx+5Keed/82zs5s9qQa1m5b+inq0rxJgYZgA+KSklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQ6LFUw58IhtHcaNI9ZjfoZam2GnuJDjPgplnJRKc/Q=;
 b=cmGQ7K5hu7bBBamvK3PlJ4u8sZLtzmWBY7uNB6uL2+hyelaWRt99uwZELD3bvmfMMYZEjlpWl/5H6FO1J8niE/LOKv/qMzjBTEUIsCd8TEOyCFNCjVX3KOWtBurUazExJJw2du+jsIZ6KlRECXA8cE/8AsGAK2KMNUmt316qglOQu2LqKteJ+G22Px8rF++hvYe3A42Vapx68GYZy0u7ZUwfuqzwH637hJ7fvH0MwZImC7hU7fiY/7E4dGT+GpDq5gjINy2Zg5N43e67iGmMDKexyxLT4bXcJWMs7wx5tqPcgaGkKZkgcH+2riGL2mT99H4aNlqRjZy5D4GYihOBbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH2PR12MB3991.namprd12.prod.outlook.com (2603:10b6:610:2f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 07:06:44 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:06:44 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH 0/3] Migrate device coherent pages on get_user_pages()
Date: Tue,  1 Feb 2022 18:05:54 +1100
Message-Id: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d45719f-e22e-4606-94f2-08d9e5516789
X-MS-TrafficTypeDiagnostic: CH2PR12MB3991:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB399131E610CEDB601287B28CDF269@CH2PR12MB3991.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dH9+SqoasWTXDJUfFKYQyJWQZLnV+yCmHB2XtbG01x12nWNBDHhft0B3x98+4WvBxCXD8UnaRC04kdw0E1OxiY1d2eOdns4J6g8DMU28wvT1rlxb1g8cO94kw/iYEQFdtOyJuLZqb2ke9z4zsiR9H5pSU+/Ji4DSwxbwmBX2HANY7iES56lStrQGBvJIpf0/pHkkhl+hPaOXQ4hb42X9K7axuMURnyYt2c05XyDYqiBadhfwq+rJyxtLjBxuXsro9B27YR646H+WPVn/PQJVjB+WVij+WAqcN4qXFt3uXNIvPHMsUr94DsZ11mMSouCNaS9XBgsTH9kktnbh7gla1rXxX4b/26SaK8YYYcbO2qskjsX4HEzV9GeLg2CsiGnbaI2eBcjnlcf/kLlrqPaXNw6y0z2J0BPkCA8olAajqsuJCwC5sETnsDVXVLkArfYiuO/h9FkF+3z0JGbzun/IY+e7pX5mGocD72hs0wYeyw6PlGOOWFsCND7q9ZpGJFYDnSfjiK3DnLBYV/Lh9WxNegJcn+HMgdcSe/na86iF6m9pw78h/87kf8+jAgCnGBeKz9RYlZZ6b5l0Zk8fwrtkMZp8568NYAl6xHOChlkmETwNRqFlAHAgxx2dHJmYTuGLw+tYQYNGg9nwfwyPN1rMgb8yuT2q1y9cwWx/+/cljsAkjhq4HCGfXLj009XNBxih++8LdoLRX4qGr29jeyGXpjNxpAz3PFjPVT7wo7FGhxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(86362001)(6486002)(966005)(7416002)(2906002)(5660300002)(66556008)(8936002)(83380400001)(66946007)(6512007)(4326008)(66476007)(36756003)(8676002)(186003)(2616005)(26005)(107886003)(6506007)(316002)(38100700002)(6666004)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJpSR4Ivpl2uU+CRF8EpOKvxWKNIOO1dh8ovOiqjLTAM7XtAKkh7sLDwu9/w?=
 =?us-ascii?Q?nKQmheOLu2ZJaWAteJWn+LLh4XhVd8H2YLkNrdTXgGV4NmaUb1gX28+ZSeJ5?=
 =?us-ascii?Q?2FynX2U3rm4NI3pX3eTsJ3CdE8bKDMeJ8PVNmhv12GTKiKa6hF3VxVSS2Wqe?=
 =?us-ascii?Q?eHmeAm0FXCzvN+mUi67trz/wvY5UvZgM3o+MmY9XPeHOMJ4/YOuaGxqOqVep?=
 =?us-ascii?Q?wW6i7xXRzT869x63D1yuiWJYSoX9WzMxSj7k9BJ7kvFbrg2TtZRoiHaR2BRF?=
 =?us-ascii?Q?PcH4QOOnlJKujdm3hYx5QoFSUNrAnrpSFc3Lp3HR5/FLM0uVFWVrokNk7fTH?=
 =?us-ascii?Q?oBGmD1U4l1KhM/FXhHe3hJPbz3K3E3v/qI4uOE8VA3fqIJe5L6+ipTovsT2u?=
 =?us-ascii?Q?Yx1KJebu7WdwUPj6qUTQMqqy9VaOuI17t3cu53SKKXACHq4S5YQla4PaalEm?=
 =?us-ascii?Q?Ud6Y4BMCQyHCTB9Zul13GE3mAH1B6qyVClBn3NotpYFkOVleR3uOFW87pEOw?=
 =?us-ascii?Q?ae2P4ZqopsGQh9N7MJ/GlfOqlCQWdM/5ps2kRmFJQqpkWsi3T0dq6l9IdUKS?=
 =?us-ascii?Q?PG6Q7+Z5MLXjhD5Xwrs8XoF0+Nyak6+E0AzcYt18ly/C2E0upKPGmusUhyp0?=
 =?us-ascii?Q?LrYVMZojsUtqUe/b1ewB+Y3fqQFGu64VAa+hpkF0UX8qlkktqCt/GCko+Zxb?=
 =?us-ascii?Q?fCUsGDNDlb7l2jX5RL0O/W913aGVDOQxtpSq26XRXLWTyAfmq+Rtpc7HeXsz?=
 =?us-ascii?Q?2xaGO95FCJXMMJuD5y2T1CBLNSvyCEjlQYipnsR4JqBTTiggpG9TdDmeFz36?=
 =?us-ascii?Q?wpQxheQiaAVF8Zd3loHojKvNt9R+hROhGZDxD0cZDbbAVuLJEQGSiNOcDXiF?=
 =?us-ascii?Q?rZrD5PIWpxyCXSy1qU5WPvEjuMXS8KvA4Pzcrh8y1S1meOWylLV7iGRd5Qut?=
 =?us-ascii?Q?pAhOJewIJXO1n3T2+BEc2lqYgeVti+c6WiP5w9rV1XgYBlmtOtXt7fY6/lzc?=
 =?us-ascii?Q?WQFWoFI3G+wpmCZ8qaqtlCAINkXZrinGN0jcn8MXDyjt6+j/xyK1Uh09v2ml?=
 =?us-ascii?Q?GiyzOqu5mjJemgXq+qRIOfsUr3lmgePDFi+CSYipoaYVFmZaQaxq5PecLQmC?=
 =?us-ascii?Q?2l61T+E3sAD+y2D6dqDVfNxHSX32A1+FA7vePqXjHvZMypGyKzfUh5wOWgVt?=
 =?us-ascii?Q?ag8Z3XyVZOCbe3kkwWw4+Y08icSC0YAPAzYMi12kBNuZC0cdO6iBkd+oeHQo?=
 =?us-ascii?Q?Ky22210gwlVuLXm9x5oXZ1LHLisZJbo8brfnWQJUxYKnO5wM7cbxUqtghfg2?=
 =?us-ascii?Q?Q6hWfQ3JKPaGVRLCqgxPi5I7tauDmx5U399bUbDXAMOPp/cx3y60q3ZGufWu?=
 =?us-ascii?Q?H9p5oCwy/qpeZJrQbxFhzdJhMkXMXx34YlG53XKXIwjImMlEDMJknFyG2jDL?=
 =?us-ascii?Q?xbnVBT9C0Vm9DfUEFxet4jerFG/gbnkxNaK0BKSgmG92+WCr6wJ68mv1SXBx?=
 =?us-ascii?Q?JEgkcpftet5qTm0qCHopN6jeMuWaBuPB7a4iXt86J1yGLhZ1+QkHlvwt6qqN?=
 =?us-ascii?Q?JD38x/CEWTtciUyj62TpdPFklY72YrFHj0TbTBb/4mw5C9Qfdt8XByE3WaUR?=
 =?us-ascii?Q?JYpZ5vOYw0rZoNNvM4abkoo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d45719f-e22e-4606-94f2-08d9e5516789
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 07:06:44.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIQg5Zp1O8fPY1y392cb2jjQlTsPm3bFnXXyuTZ19vMOKGGQL2s5X6cQrGWgpBtzTqi65N+TRR5Rm/Js5omEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3991
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device coherent pages represent memory on a coherently attached device such
as a GPU which is usually under the control of a driver. These pages should
not be pinned as the driver needs to be able to move pages as required.
Currently this is enforced by failing any attempt to pin a device coherent
page.

A similar problem exists for ZONE_MOVABLE pages. In that case though the
pages are migrated instead of causing failure. There is no reason the
kernel can't migrate device coherent pages so this series implements
migration for device coherent pages so the same strategy of migrate and pin
can be used.

This series depends on the series "Add MEMORY_DEVICE_COHERENT for coherent
device memory mapping"[1] and should apply cleanly on top of that.

[1] - https://lore.kernel.org/linux-mm/20220128200825.8623-1-alex.sierra@amd.com/

Alex Sierra (1):
  tools: add hmm gup test for long term pinned device pages

Alistair Popple (2):
  migrate.c: Remove vma check in migrate_vma_setup()
  mm/gup.c: Migrate device coherent pages when pinning instead of failing

 mm/gup.c                               | 105 +++++++++++++++++++++++---
 mm/migrate.c                           |  34 ++++----
 tools/testing/selftests/vm/Makefile    |   2 +-
 tools/testing/selftests/vm/hmm-tests.c |  81 ++++++++++++++++++++-
 4 files changed, 194 insertions(+), 28 deletions(-)

-- 
git-series 0.9.1
