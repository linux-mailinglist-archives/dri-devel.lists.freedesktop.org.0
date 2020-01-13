Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DD1394EC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE1089F6F;
	Mon, 13 Jan 2020 15:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC13389F6F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKG6L57PrOWf7nNdwGYDLji9wv5BsrEPPgidcDQeSVA7LPTqt5z9q8qki77jG+XUu2NWKCJzxgU/EVZhA/KqYl8aQnXDCgjYqF503W0Y9XtenY7XEMbkXylUug2fyNbqQXXCiL+awp/j7EV1FIMHYKEXKbalp24owCTDV15A886qThxQLRQQv5KxiXbEIAq8ddHeic1v3Zb5NoozpIcNCrDHGPUDIqF/G1mh/iWHKvxEMNxJAQmQz9LThurh8rGVIpvmFTgZcXoQcU7OofHGoDtg5dGaCt5fsqcE11z9pj0YbH6/6+pxi23Zk0JFEQoz/ntXOJm5fqm1lKLbE/Sknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsmRFEVmj30XrwddG2qG6+/9LY7okiYo3z6I6OKGbrs=;
 b=k3wUn7Sm/p1eM8oj3vDw1KUZLUQySKRao0dXgSGGlajEW/mjBPejDq6un4Slx++bQZ379AbtqZH54QjYNTqy33tIL2eTxX/GRpBwnAb5n2O+7MBuy+R1shHMGJqp0w4BcV24FGULZ5A8wiflhFECZQjdaEURkODdXR6rngCyG/+PNNI4kEx43YUZVW4IofJ7ZjZdvXkPTDr2hV7pZBmz4GxLGJAn22XjapmX/XCM8wzkKgYdKhke+KUzm8NVkOWA4rPnQLxeSJHiLgui3dwBwCBLtY968ZDRlc613owIIJJ2PgIMtCnWKXNB7rpcodJ5JgR1oRVSNXT1aAOcc4rH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsmRFEVmj30XrwddG2qG6+/9LY7okiYo3z6I6OKGbrs=;
 b=derinofgmcsleCAXhujSxeIKTxTl2BzgWy+LVErHA29fDH2jrgZT60u4tanLCqHi05pQiT2Vcp9ND265z/Szh2rn8o4q/0X0/NG4Q9WNRtGVqPoIkSrjflFK+XlmhgNasTzdMYDUY2lMG5ft3kI14ELG9WR0ddT3cyt+bBhkzFk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Qiang.Yu@amd.com; 
Received: from SN6PR12MB2702.namprd12.prod.outlook.com (52.135.101.144) by
 SN6PR12MB2685.namprd12.prod.outlook.com (52.135.99.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 15:37:10 +0000
Received: from SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70]) by SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::d46f:d4ae:d96d:ef70%5]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:37:10 +0000
From: Qiang Yu <qiang.yu@amd.com>
To: linux-mm@kvack.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 0/3] mm/memcontrol drm/ttm: charge ttm buffer backed by
 system memory
Date: Mon, 13 Jan 2020 23:35:40 +0800
Message-Id: <20200113153543.24957-1-qiang.yu@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SG2PR0302CA0024.apcprd03.prod.outlook.com
 (2603:1096:3:2::34) To SN6PR12MB2702.namprd12.prod.outlook.com
 (2603:10b6:805:6c::16)
MIME-Version: 1.0
Received: from localhost.localdomain (221.239.222.115) by
 SG2PR0302CA0024.apcprd03.prod.outlook.com (2603:1096:3:2::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.10 via Frontend Transport; Mon, 13 Jan 2020 15:37:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [221.239.222.115]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 718f5000-eeb8-477c-9e2b-08d7983e746b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2685:|SN6PR12MB2685:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2685ECA91C63E5C10BAEBBD28F350@SN6PR12MB2685.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(86362001)(4326008)(478600001)(1076003)(81156014)(5660300002)(81166006)(8936002)(8676002)(36756003)(6512007)(6486002)(66946007)(66476007)(66556008)(2906002)(956004)(26005)(6506007)(44832011)(6666004)(54906003)(316002)(186003)(52116002)(16526019)(69590400006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2685;
 H:SN6PR12MB2702.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0Mscc4SaGo0WoNDKG7OeJ0AJotO7uJB3M6l0Ufk1IH3P9Pi0JQ8OJCLoJDtgOkZCs8+ohZDatwRDuCSHYauuDFhFh9xegUmiWp5RCqOLzHkTRrs/YmJe4vVETGiDLroxliJG/1kT4xseRr0steGjB1Kck8/X/bnDkTAUfUoSBoO+Tz5i1Pzp/XvXHzjTO6E09/RlaE/Clqo6zz0wT1sncb+gTLD80lzmB7Ne0zDN/7yAOfFjvP0984zRi8u7POg5w8aq9lg99VzOHNrZomlYKD80iXHkPCn+Hrqlf+2dt2weehLacUivLv3IvC8BpHFJMcgghcV2vl+YiZq3BVdGl7QWFGivuopjyB7CROcTQJBCjP7vA1DoBBztJ97Eockyk54KBozGgkQ9g6nm0vscfp92iJgfDWT64V5BOqY6mEuiUotnZhgUcBTCM2JtHz9DsRYysjGcNSAtCm5vD1Uj1Ilzzl450qDY7KlsQofAo3qf1omuO5CR5+0c1M0HqKZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718f5000-eeb8-477c-9e2b-08d7983e746b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:37:10.7297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEPP1630dug7ii2JVSKE+6w0bX0mW2AQjlZR1hQKy4wyPxe42Pk03AqOy3PKgwFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2685
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
Cc: David Airlie <airlied@linux.ie>, Kenny Ho <kenny.ho@amd.com>,
 Michal Hocko <mhocko@kernel.org>, Qiang Yu <qiang.yu@amd.com>,
 Huang Rui <ray.huang@amd.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Buffers created by GPU driver could be huge (often several MB and even hundred
or thousand MB). Some GPU driver call drm_gem_get_pages() which uses shmem to
allocate these buffers which will charge memcg already, while some GPU driver
like amdgpu use TTM which just allocate these system memory backed buffers with
alloc_pages() so won't charge memcg currently.

Not like pure kernel memory, GPU buffer need to be mapped to user space for user
filling data and command then let GPU hardware consume these buffers. So it is
not proper to use memcg kmem by adding __GFP_ACCOUNT to alloc_pages gfp flags.

Another reason is back memory of GPU buffer may be allocated latter after the
buffer object is created, and even in other processes. So we need to record the
memcg when buffer object creation, then charge it latter when needed.

TTM will use a page pool acting as a cache for write-combine/no-cache pages.
So adding new GFP flags for alloc_pages also does not work.

Qiang Yu (3):
  mm: memcontrol: add mem_cgroup_(un)charge_drvmem
  mm: memcontrol: record driver memory statistics
  drm/ttm: support memcg for ttm_tt

 drivers/gpu/drm/ttm/ttm_bo.c         | 10 +++++
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 18 ++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c         |  3 ++
 include/drm/ttm/ttm_bo_api.h         |  5 +++
 include/drm/ttm/ttm_tt.h             |  4 ++
 include/linux/memcontrol.h           | 22 +++++++++++
 mm/memcontrol.c                      | 58 ++++++++++++++++++++++++++++
 7 files changed, 119 insertions(+), 1 deletion(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
