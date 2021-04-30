Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451B3702E9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2DB6F5D9;
	Fri, 30 Apr 2021 21:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A936F5D9;
 Fri, 30 Apr 2021 21:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYadA9zbdE0hkw0PEVX5ffV8gV8MZrKiAfje49yuVM0cAm25g73Dla2Mmq/87zvP/1NWlmS7raEUJ7Eyxw3E68pH8kfRxPDCNvUUnYy3fMLoz1FJTRyqm6h6tmGikEdRJ9DO5yj9z3jZ3YbewC4aedAcQgNIr6n266xvye0tfuN0qxX1ZUnGBpEUECTV0D6HAVSSYoolw8XvV1W/tFNMxCAVMXMQ7LKuXX6UHKIhjiD2vBYuLrCbMg3gwew43bbepjLU4ycPKnQ/soNTexy8cxKkIxPJ4EGSZyW7WU5hhytd2DpQq3VFFmI0LEhJMYvLKJY5G3ynXB+1gLgSZSYmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7PjPElEJTmGwcG//Oh12kv8xeKZtz2lWgOVrq2MHOU=;
 b=lgStLtcNc7D1WrQQclx9pzT4Y0b2CxCNrwvDhk+vLaT2LomvCS8uYbjVv6QbOmfNtGpFbTvt2f6bJCJ+R2B824kCufCvPSSb4ywokEWZZYr4pPyYYKBk3/z90U40RNtFiXrfOoRtZE0wUVOY85qyJT9B+kQJwoEuUrys9PEZfB6PdU+fsu05aEOGK9Jh2iUSmqUrZuQq+Km8uK6uipQpvN/Ja3+zRe8hdLxpl8NkV8uzKysqnsr3lS5p99zHWedWp9Wv2lrf0/kh+wfm3dNja5/o3SKHzU8KBsmKIVMlcF12Ie5HIcAwZ0p8pgD7tsotshsur9sbLoKraEsXrSaGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7PjPElEJTmGwcG//Oh12kv8xeKZtz2lWgOVrq2MHOU=;
 b=jtZI0EfvrGVfVy5PxzDd3FuLskqs7MsxQi+TLY2tlQhQgcD/hk0xHM1umT6oXrqK/XuaNUesqur4vHFobEbwqdcE/AXxfukUqVO/w2h5eOaoj4oDXGCv3strxodyUfyVoCtVulc5xLGGGYQBKma8YXH+r/RZLGBWLvBT6bHZcn4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR1201MB0122.namprd12.prod.outlook.com (2603:10b6:4:57::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.23; Fri, 30 Apr 2021 21:22:38 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.034; Fri, 30 Apr 2021
 21:22:38 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 0/1] drm/dp_mst: Use the correct max source link rate for
 i915
Date: Fri, 30 Apr 2021 17:22:23 -0400
Message-Id: <20210430212224.21588-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Fri, 30 Apr 2021 21:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dec0247f-405b-4c89-4914-08d90c1e14b1
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB012269042B449A8DE81D91F3EE5E9@DM5PR1201MB0122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NPr1DkvGdSs+TtyFOpqae48gGHPxyJOgJ71iERmy3ew8zcXoY4C7VENhcDQLsofk440O9vtCfpqZd7dnpCs3HwMWZ/W0QTB5OLtaupmYKGwtlxTHlrdPqFkNnfj7E25/0ndD0ST0KXb2vbIHiSPk3E2d7PcxT46nVNsVRVNoher0rxumsmnftlaGtxZenKORJpRAoQC5UEK9OCz92LoytImCfgjxGRqIs2mGZFUEatuaaQPsd5kQtsgePPWKb9bFeXLM5Vm7Err9Isoi4ONborqtlk1GB9kWhvG3HPyRsLmAqo1kPoDtvNNmHio1a1yg3zP415Qu/+iuYYQHUJX94/1PMqOCUUxGX5HcFDD6lCdvevdfuqMTajtDd8RWUA+EXNyspVKM9SS8heUZvsxOBVokrxlVSBkApQF/YM20pJQYj+xj1aUnSzTdPR9QK5Ox9lngsY4rGhcx2sbbubY6ZJFWSCL3Z384EFTYF5kAinD4p5oisgUcKw3MFhSIlyfi/fF5WGu6LAlGDk9qVx6beCC+QB5zI9DZ4mhiclydLAjSm2BWPrKk04by/8fCabdD+oUlqEC7Cce2aeZKrwPtgySAkKQxfwSDCec+glIBEE7bA19EymQmszdmxNmnGF5YGkfMbGnnC8BCQ693rPPJzk8R5PmhB19FE+m2zw9urMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(956004)(6486002)(44832011)(52116002)(38100700002)(6506007)(2906002)(36756003)(316002)(86362001)(5660300002)(66946007)(8936002)(4326008)(83380400001)(66476007)(66556008)(1076003)(6916009)(16526019)(8676002)(4744005)(26005)(2616005)(6666004)(186003)(478600001)(6512007)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1/rAZxJJoXSbxY3sgjajpyH/U6CcalLRsBR+WHLNiwUOsnE/MBTxMykDRu4T?=
 =?us-ascii?Q?cSpN0bmDHLgW4lDXpasuT+YXswiLWsw23+u4oCsXQP15G39NLF4U9heJDfch?=
 =?us-ascii?Q?6SRjTVXEWL6WrMBlpDEYXsu6Vr/E+C63mA4pvXGkdMefpKBbozyDoAR4cO7g?=
 =?us-ascii?Q?9qnGiqgkZqkzxy9Pkc4Vfo9U7/gTuVggfI1hmEvD++kFVcaGyp1/+OoTB6pS?=
 =?us-ascii?Q?g8S/08aJgvVg45pGDP+OteZgmpINU+mslV23sIIAtT2/UK7rxoiif1znhGIK?=
 =?us-ascii?Q?qvnHO/5usSF8NcnuNIpfVMM5FsDjnAe8ZCcoYs93pmNJszusqvo0l45YxcLF?=
 =?us-ascii?Q?mzOPVluANybSEr9htgEiZ1+D3PmzGs3RtCGJr8eAWsxX4b7brZmNAalmEBia?=
 =?us-ascii?Q?jjxDJKzApJM1qs3BWO4YFmNFcwp1lP38jVtXojX5Y0SJYUOyTPnYhtQ0Yjaj?=
 =?us-ascii?Q?pVAeGbzdvV4dMgr94cUCGaBRySzv3ckmwQ2yFpmBcL1wq35xp4QEgs1sqqrX?=
 =?us-ascii?Q?rGY/j844ShoOvwjJWpsQEuqnLXGUT9D7b0P4Jt4gxawG/az0sJIajr1Dh14/?=
 =?us-ascii?Q?zNuYavIE29dF044iwgvIb1YKBAD9veAgJUukwLFcyr4O8LV6XWSit0FCeUTy?=
 =?us-ascii?Q?P/eAsBXbA3Juj7k0nMKmUkHVTlyNdLPzP+odJlebWeqV/6Neroqad51Qeu+s?=
 =?us-ascii?Q?WjRUqTp/zTT0kgT5w7AwYWPdqn4S+m7u5vsngN+WVM6TIC2vnen+1iZBURDn?=
 =?us-ascii?Q?cqFOHLtXIv3p1ke2z38lmSOkqEv3Wzy0d3vCygSmAk4KnB/t8CwmP1BDRhT0?=
 =?us-ascii?Q?uRK6/iNmdQsb9FoG7y0Nm2o7WEPBtu8GWHLu6bGBYv9FtB3gezLM3DUg0cz6?=
 =?us-ascii?Q?q6LdYggHCgokEHVj3mnOV6TJFIS1J44ebRHHWWg8AP1x6PkS8tAXY+qq3cg2?=
 =?us-ascii?Q?bLKuMLicqngg0u71Wwlba4FI7DZ9nEKCE1yOm+Tj70yPA3K2MBQGgkJ2SoX/?=
 =?us-ascii?Q?Sm5sKN+HimJXCdQAYRspwCfGRgSE/deMwk7iixHoSL10Fbvn7+YlXWIm/XDs?=
 =?us-ascii?Q?YT+mWT9/Yfsy7I3TkXmXDaMJkhpaZ1tZkN/PCXCr5l4gyaXgoVwaaoM74xDW?=
 =?us-ascii?Q?8JVlB2ESE5cnHYlNUgQ9saPnLCQL235C1i2uqZHBAnPSqviSdu3gRBgpH7VK?=
 =?us-ascii?Q?9xFlPEyc/RClI/srsKDPio0bAMff6dhXcEre/Fwota7uPn9WsCdhE2Maei/z?=
 =?us-ascii?Q?ocL5iZ7uwt9X+fy6m+zM01pUHGJTeW8HDcdBxNe9SY1louxwoS2Uph0RUn1v?=
 =?us-ascii?Q?3kLwRuDUZnqssiUKWHBv0Lae?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec0247f-405b-4c89-4914-08d90c1e14b1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 21:22:38.6840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoKxW843Urhd0BoNV5ngSP5DdytqBv9Rs+Qi5E6NunbrINfBmxcRhvCBqgKf/0wJ3wgVj9BSK+ZBC5fD4/RDUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0122
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow-up change to fix incorrectly used max link rate source
capability at MST init time.

Change history:

v1:
  - Initial

Nikola Cornij (1):
  drm/dp_mst: Use the correct max source link rate for i915

 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
