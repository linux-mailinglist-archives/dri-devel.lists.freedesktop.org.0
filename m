Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892A851F55
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989E910E538;
	Mon, 12 Feb 2024 21:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NSa0EzbE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679AC10E1DF;
 Mon, 12 Feb 2024 21:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIOxvSH6GoTVRVCQMliV+06ezfNN1hJ1Seki8DRNkV24epbf4+dnidFe+lujHnonjnEBgD6pVxrNJmsOsNwuZjXz7ojS6rVlDEa7yXMv7ogIrm66D+FBKljrY8DHZgkpN+r1q/QPSpHnSO+s25WdFWX1SnPNdU3AEm+gaKPK2oJmcn6ZqeGDYXehKQJ+tYBfycj0FzmHBJnz17RmCTrg/dObn1yEDXfxrOUnScigvNPEQ1j4mSOXkGlO9DdAsylO0pfinn96JMhGFvHd9OqUpfpf/j8sFV3dDtoVz75XUrpGqE2Xeen1P0QJpMUujF66ncBKGUTzeHT20DoIYpIbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8WZgnS6sU1pSyGQwEw0zoM0TA94kxW/XJbtK1275ns=;
 b=gv9jL/QyUe9CCXZVV83opo4hhEy28eVmgxwJOJvzuKhjUS5SQiWEraPaXa1pZrWEnGwlSTpsLmN94EZ3bEX4Byis0Hw5jAbP8ZXJRejZrUw5OIdaPNRlNeTtT7F6AMqOqW9OY1Ce0LcMrdU8SWyib7tYec4uY5GF5FX2OY833kIfNsi6PNJoUj4C+OkIPlVZ0mOPxd2Huz+wT0+pwERKZTIwnuDNvHWQT7nerLS/M1vAnfOukd4woi8nCvcIX4V2QlcZ8UvGmNd8b5viB9LOFyfC1nFCQfFvpF+IEm7JirH+0vb3n48kj1OjAApVh6CafE6PNpYW2O8gv2gR23xt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8WZgnS6sU1pSyGQwEw0zoM0TA94kxW/XJbtK1275ns=;
 b=NSa0EzbEMedPOB8IGB4hs+/zfn9YdpHMS1abGoPq7NXy7ylUYwVGyBJE1rzTCLjXN7C4yDTYhYur4y6eFUB4mTT/PhdrBGC4VFZpHABLNPSBNrXR3n5+1eJJI9KdAhB5Y8M/ZWiPwhD0dcAch2b3b6XVWXMwtATn3eMNk6alQAjlZIZS2gIedIlyQRDShzl+FfaH0xH7KJQn7jHKhX4XCkvs/Ekqw1BuPes+qxGilutoZ45AL1LtSPjfmj+SVsgS6iGxC0z+f3zvzELITl8Y8BLqIUiy2OJvcxpefBmHmSqqW1uMNIuJM6l/XuYZ6zaBC9sXErtRt0W4T+Nfjic8Pg==
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10; Mon, 12 Feb
 2024 21:16:06 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::c3) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Mon, 12 Feb 2024 21:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:16:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 12 Feb
 2024 13:15:52 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 12 Feb
 2024 13:15:52 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 12 Feb 2024 13:15:51 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@redhat.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [drm-next][PATCH 0/2] command-line registry and gsp-rm logging
Date: Mon, 12 Feb 2024 15:15:46 -0600
Message-ID: <20240212211548.1094496-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e2c506-69bb-4811-c326-08dc2c0fd363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0oukp5sFsdpqfQKq4u+hypYciEbqhIQyDkW1NriM6FlH6oYqEElJe4ImrUU3lDgz18tLMGHrLZqnHZWueUSg5Gx9PPWc/+h8vgnNhpEX+HeYNNmhY5eGp3LgRmXKbGx6Es8ik2hVSoUhFlLxZwq3alZYb8ayqDYb9TXUz4Vmor9lj/K5LSl/UcjRZimSk+Yd1c2lfrA9VOc7vHR24d0wlcUcKsKJH9lIyyxlPSBGLvE/188qTEcQG3TGN4bfYO+ndfTOd4BNGJ8CvUTMj4/Z3m6WZvDMGji2yzl9mysHzOl7743iFvgr7ZxixiG90Bv7PIRLcplNhbeiTtg9JBs8xevNtvuiVe9GMGDSi4kEInCQlcDi5bOKOWTA+YQ+xl2AebK9YQf3NfxuZhTkrRyJ4IVHtOwUQ23YNTLnfxxGSdA15k3IDo7kB+1CJkUmsZDperbRHe85PM/TUB7RcLWV1AMB7NIwKpZ+riBeoCp6yNzMR6REqM2fERozeUDlJkZUaacOa4mAD3HcblyQ33RgbT7pKIPXyJ8PGnAhzeIGFFRTNIMekkmNFLRiY7pmj32V+eK8dBC0Bz4B3ZQ4HI+xwnr4bRhbbmpdrJJ0O09xhA=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(451199024)(82310400011)(1800799012)(64100799003)(40470700004)(46966006)(36840700001)(6666004)(7696005)(4744005)(110136005)(2906002)(5660300002)(316002)(41300700001)(8676002)(70586007)(70206006)(478600001)(86362001)(1076003)(356005)(336012)(426003)(83380400001)(8936002)(7636003)(36756003)(82740400003)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:16:06.1023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e2c506-69bb-4811-c326-08dc2c0fd363
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two patches that were previosly posted, but now updated for drm-next.

Timur Tabi (2):
  [v3] nouveau: add command-line GSP-RM registry support
  [v3] drm/nouveau: expose GSP-RM logging buffers via debugfs

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  18 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 494 +++++++++++++++++-
 2 files changed, 484 insertions(+), 28 deletions(-)

-- 
2.34.1

