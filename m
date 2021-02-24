Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67992323601
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 04:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DE46E4DD;
	Wed, 24 Feb 2021 03:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290F56E4DD;
 Wed, 24 Feb 2021 03:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1Z4Nc/hi7lNuatlJ5LeAzWFwvyOa477ewedpghmCqrZBCMBXb5b4yuNQzgn1QxJev2B53Ly4Vm7w3syQCGWKUuo+5fRj8TQRY6z6axN6sW6MbJxdBW4VgIiUEcHHJzrOA+pDvhz89pM5hYX7WYbkFtz5DiZ08tjNxTG/cVSmrVEVhJd87Uj0u3ONzV9mBordGTYvIOzwUrbdCkcBkCIUXYFZluDZb7vk3m1vFhoU19QkZ89y7HQdkjR9oe9n/+eM/qTBWKSYVCiqwFVC5f4kbO0ddroUTFQsn7MRnxKVyz0T1ITAdOs39mB6PL2UIss3+p/v/CxaDCdEnoEwZV2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+aiCrULZzJPi4UcSX3i+ewhutuTyqlHbmBIHlymalE=;
 b=Oa3kVU7Tio5/XYtFJp2zYcW4Sym1KA4yOE3+n6xr5eUxBXTbrniLTodye0ID2wxG/NRKUx0Hs81ukkvizHjijFJFGRwWxjqUNmA0oibRqNmZUS3JGDNisiMMutinbIJSGWcJagg1cKWM2VZ1TBp84ueZWo3UmktIrxBA/IeCdC0DWJQMwjY85LSE+ZqFZs7j6wKT/iumTO3gOTzz/UlkG6G4wVFhA2U4HeK/+y1zPGQnUaFPF1al6fNSVZ5molnQ86LPE6ZqMeeIZkSskgiesX85PPve/vh2X2bMU6B9yYSZovNBdAbA7USxznN3VIiVV++JLM8hRv1fpMyJNi0aNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+aiCrULZzJPi4UcSX3i+ewhutuTyqlHbmBIHlymalE=;
 b=Nn5QyH5WzPSUTssEX5nbM3Xa3zGEP2RomR/QM29GxYrirqUnGvwkA0ykDQ7ezCMh5+n1smWOO4ETbKIZcbO5bbjPHENoYZ+kqaBoJFIo4m0diKPAONYugObg9PchjW4gh+56uCukPX/c3riryjC9zJ0bz/JbRGu2uWGD5FTykf8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:5b::23)
 by DM5PR1201MB0251.namprd12.prod.outlook.com (2603:10b6:4:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Wed, 24 Feb
 2021 03:28:26 +0000
Received: from DM5PR1201MB0057.namprd12.prod.outlook.com
 ([fe80::99bd:b7c0:520d:92dd]) by DM5PR1201MB0057.namprd12.prod.outlook.com
 ([fe80::99bd:b7c0:520d:92dd%11]) with mapi id 15.20.3868.033; Wed, 24 Feb
 2021 03:28:26 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Do not add non-system domain BO into swap list
Date: Wed, 24 Feb 2021 11:28:08 +0800
Message-Id: <20210224032808.150465-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR03CA0051.apcprd03.prod.outlook.com
 (2603:1096:202:17::21) To DM5PR1201MB0057.namprd12.prod.outlook.com
 (2603:10b6:4:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (180.167.199.189) by
 HK2PR03CA0051.apcprd03.prod.outlook.com (2603:1096:202:17::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.8 via Frontend Transport; Wed, 24 Feb 2021 03:28:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee6b026a-865f-4aa6-4ac8-08d8d8743f19
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0251:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02512AA11DC52B1929DED639879F9@DM5PR1201MB0251.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUN7dKevQt8bi6Lg2I3g8nIzzw4kVM8lnxCV5LKfhSLaaRZ1XWkUkTAh0FuBHcMwelB7yBAKLzwN6mvI/oNOUIthi6fM9hhakrdY+xDgdHoAxquDK8vz5SBzjFTU2GFdGcsMw4w0mMbSjq1wO4ye63+ur7z90UVTO/el0UzdqrAdGEvry+eTYKwwVyBF6gT7bV0cChYJGcW35jGKSWRQfW32JHJzr5peu7zyDPcgsPX5SfMrHFszon+KzLhNj0t/qXUH3iXKHWJcLAddW09JGL1+z0i5eS+AhJTlEhs43YYFHVWeJfFAk6QxIU5mdS6ej16BY4pH1P4ObStrMZE7J1dUYJ+J8QeG2u3a/WrUfYS0gYIKmb3gYMuhxbN4XRNZtP2atUluRzoNA2MKWLp+bO3KoikQsQYTS4Ts6IyZhgIpA9N7sE/J5ldK0+UVoh93JFREd0YYDJL0WD8rmIr0kgFW0xu6XLSG2cS/yL+i7woLGwq219jQq9vvzNLPN9/kNcVOfQgzF8WrfpsMEGOyxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0057.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(2906002)(4744005)(66476007)(1076003)(316002)(66946007)(83380400001)(186003)(86362001)(6486002)(26005)(6916009)(66556008)(8936002)(956004)(6666004)(5660300002)(36756003)(2616005)(16526019)(450100002)(7696005)(478600001)(8676002)(52116002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W/ENnYu9J8oY+dPs29uUz6qtaeaAQTLNq5/U5BDadJ4Y53TkrlXjFEQs3FhJ?=
 =?us-ascii?Q?b2663sug/eCXkgPjVagqt01keIfwSxWixuUvtlHxJ1/5HyieRgttLnXYum86?=
 =?us-ascii?Q?QnJptXXl4GCOuJgZ4yiij3ZYNmd52b4YAbeP5zio068HLbsF/JN+MhHPGhhb?=
 =?us-ascii?Q?XOis1ah+i3iyO2cSEiXy3IggVKVqGUn8jvGzmcAVcwqBDb38lLM/KyS2TI2W?=
 =?us-ascii?Q?kFbksgIyD4Qtsp8xR+RZ3DELfrON+mUEltyl6a/kdekkHlgbEcLrWD8gbB5T?=
 =?us-ascii?Q?YLNs1K/gQdFWf3vPPWV5cz8Sl2OfrHUSISHb97dJemvpPW+eF24kCzh3Z4Ye?=
 =?us-ascii?Q?zjEUBWgtnKGAixCtIdVBB6A+QHaEHhyKqKtJ6G7DbT80Gcb6hA9vSwOIwTYi?=
 =?us-ascii?Q?s6J2p6fS4wtLFSfnP1VaXETZADysmeoPWVtHddWkdyQ59kjqNsRelZEwDMxA?=
 =?us-ascii?Q?uITpI/oFZzW9buyA4/eBGXTmDZm0LkdkPxlWzPqULNRzqUQ78D9Kcnh7Lah1?=
 =?us-ascii?Q?Ee2rm1DVSTHHLM4zBZY/haQB5Pclkx9CvCy+7Io/ItVxfRn5BwkQWg77sOpz?=
 =?us-ascii?Q?qzK77HrllOKfAxm/p38lg2N2xJgom1y12mQRRlGOrdHGrwnWMSEAQMbZZBGR?=
 =?us-ascii?Q?tUvwOU/R6K6qxm2TAiUOo+PrVWyRMMgPdu5UhpksrUp6xg3XyC08w+bztn1h?=
 =?us-ascii?Q?hjIAjCt3PANkqX0xGzK172WsTYs1p4Ao9f9A1PvidKGxtAu3I6dRoI+CN2SM?=
 =?us-ascii?Q?T+mnzHzWpeAP83ww6lLvpauRkYoWjD+jK+n0B9Wy8iD2PFQec/SPhHkjv7rw?=
 =?us-ascii?Q?TuJs06YLJj0YC4B6klc+Xx9u1jqseOk66O+1c4OqRyXZLp5x466MatzQTu0K?=
 =?us-ascii?Q?+SFu+VumbxqO7tIvR0TgyM3ShyRpEyK8U0h7uA54UlWTNMa3mUjXFhq3w4qZ?=
 =?us-ascii?Q?A6I3YheZoira7HyoFwXhGwp2LlufMe7hWz2I+s+WbrFFwJyP5l36JltyFd6v?=
 =?us-ascii?Q?CBNBR+TnRHXj6kgkR16ECsSf+xj1HjorrZYDoQnByBnjgs6F5Mp6k1k5D0qV?=
 =?us-ascii?Q?Jk35bw3OK0p7WSCL2q+DrrqQ5AxAHXTyxF2sZOUWNX01iwH0bdFulYwOFN1X?=
 =?us-ascii?Q?6tIC0YkM/epIey+K/yU5vpfVq+ToX7yhqlDHL3L1g1R2Wfl4ll2cwib2gjZ4?=
 =?us-ascii?Q?/pD1A2Odc04nZpzv414DVAW8UqARgNO+Z0ivea6/T6CWHdZq0HyOXCfuR5J2?=
 =?us-ascii?Q?DQidX3h8gSjnwqiKYHm0iymOGtGvy1JyT7ZCRHXTFp2u6iedq065dxDRNDi3?=
 =?us-ascii?Q?cyA5Feo/BZ2aYh/7hIxj2vX0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6b026a-865f-4aa6-4ac8-08d8d8743f19
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0057.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 03:28:26.2941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9CyIT6fSnXB3wtsgethu0lcMJX9UmxATFqp8CNra4bz3SAinJ/4pQ35pYn4m2HO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0251
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
Cc: alexander.deucher@amd.com, xinhui pan <xinhui.pan@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BO would be added into swap list if it is validated into system domain.
If BO is validated again into non-system domain, say, VRAM domain. It
actually should not be in the swap list.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a97d41f4ce3c..3a10bebb75d6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -111,6 +111,8 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
 
 		swap = &ttm_glob.swap_lru[bo->priority];
 		list_move_tail(&bo->swap, swap);
+	} else {
+		list_del_init(&bo->swap);
 	}
 
 	if (bdev->funcs->del_from_lru_notify)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
