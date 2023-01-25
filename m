Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA7167BB3C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F4B10E13F;
	Wed, 25 Jan 2023 19:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5F10E13F;
 Wed, 25 Jan 2023 19:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHUgCJGVu9GjFkXe3hDJ83Y4+DJX+vKYVn/koQuBkauO1igplJuXkNfF2M5FX0cQYJuWN2E8CY/BV3g1BpWCU9yl7xmWJTNbLYh6GmCdaZfEQHxjOWLYhUkcEwzsThgJVGgl2VB/OLB3UE9QHHE8FFTOgbShjhf4aegWKersjJvxxSIJ6SrUT/4Z1FPDwtPlmEGX7iRrdWkqa9kK1HGUvFCXDkcd9m/cztUlKNIGv0H7s3eevJU1L+igo4VPQ6tPnoUmL+y4hu9gr4U34xW60qJHamI/a3hKe/6AK49I/y6RZ9H2pNEZA2P1BV8l08ACyDAufbw5kQNWYeDMnY092g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC9JwEC02RE8chSbzvtM6IelZlH4tjE8iGBODDuhpLM=;
 b=ZDb/04f4A92ftuUKqyS+A4h9scR4a9vIixBSgjLVWTrkZj8ij67tYEOENLZ/mF7fGzlg2ct12L4gdtCBIVHf8PxKMYl8u6kLeFS1RO0eOV4PloW1/+nL1gdUXcaQQNxtu+5MvkTGArCB9eWiNEKWBLVKwsZiTHtmqIJuZ7+UuiavEKoxM/1qEX2W7+3HYntJx9yf8aLqX1xo4AgW4FwjbAPwMbSqtp9zvg8+QNFRCIDFxPnepv61qEvo7szBMh/CJCZEItdl3eyHW+W+4+UHpXUd4iC4R9VtxNNOrtfgpCXdW0PuzoEwV+thAUf4F1zb3eYwY9kQ/ddx0zL+C8n1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC9JwEC02RE8chSbzvtM6IelZlH4tjE8iGBODDuhpLM=;
 b=wX5oTgDS323gDni5I/82sdcuVoh0g5d+gALy850XDvADoV35JGdbYwkiva/LbGGOqGBAcr/GBLuNy8O9g1x5gt3mxowr/2BXtNQgmMA4BmAt9h7K8nf0498170a+j2AXRWja2xVUP36JgS7lCLAf4U4zpLkLWIZXErNJLk0pspQ=
Received: from BN9PR03CA0810.namprd03.prod.outlook.com (2603:10b6:408:13f::35)
 by PH7PR12MB7305.namprd12.prod.outlook.com (2603:10b6:510:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:54:15 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::8c) by BN9PR03CA0810.outlook.office365.com
 (2603:10b6:408:13f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 19:54:15 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:13 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/32] Upstream of kernel support for AMDGPU ISA debugging
Date: Wed, 25 Jan 2023 14:53:29 -0500
Message-ID: <20230125195401.4183544-1-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|PH7PR12MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c09e86-e298-42be-46bb-08daff0df007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQ+3o5ToxQBBZoCoAkkdIiic2Idxoiz09RYUMmVluCyr0E0vOlfcDt/U7VkPd0fD4oD4H4T3k5SZ21zX6Jgy2Ch76yKJdWqIFPCUidxnZk/Od44bzNo0lb8WVjKOOWs8HFs0RWAYXnfiOV/TuCc8gSrP8p+RU3gFxI0ZgW/uLeaNH9uImjNCDX654Tdlg8gaJ59OVDzyKF2rG18eb+hFHkXbo4AcFn2n1eVFrQnZkt7KoOb1nssfUgMypZt0n1Csf+wPrRXPBDBn6How4fzIWnWQepv3r6JL4RAF8SywNynw2NSGbENOpgtSIgTKc3sabMyFQyK9S6QW2cmOwDJ/waktNRNLbUyO+wZdRwRILc0HYUXyRNHPq3IQCR8wkRjWfaMX7UwutqoSeeEUy6VaJSUt5OdGSLirSPIfIVq6geklm8dLoI7tqiIFE8N5zO8vN4f4wm4K2Rq+X1xW/9kAVTDRL6tpZZXBUB8V4iSy5w25vDD08jXPTo202ecA+ijNMoKiJ+e0g2PzlaGJmqq+IYazc8d4d5weQm2CMt4wsfzqdmhLfs1deC+LCSRxDD9ZweZrAehxhr3jKYVk9vAA0JNQzj/apY7JuEEAfQQBYYyXEsx5OqvRgKv7IL4Tl1xhr/8p6XzaR/pW3W6TR9nwaPE1OHQkE+qvGWqFj0hvIGEd8PASA18Q9M7zjAE8UxxEE4n48qbbbqKgl69LtPe0cw2ilCSBwYAJScquVfmqdLhGpsKn6TdHO7eeT1Aydd2ImnJNnUF4UMxDaBmHpL/kICCj5RstsFYv8Pb2YOKTXZT00m6qYRnbB9d7EjVNDUxs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199018)(40470700004)(46966006)(36840700001)(426003)(186003)(16526019)(82310400005)(2616005)(336012)(70206006)(47076005)(36860700001)(44832011)(4744005)(966005)(2906002)(8936002)(5660300002)(478600001)(7696005)(316002)(110136005)(1076003)(8676002)(4326008)(70586007)(450100002)(54906003)(40480700001)(86362001)(40460700003)(36756003)(26005)(41300700001)(6666004)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:15.1763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c09e86-e298-42be-46bb-08daff0df007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7305
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMDGPU kernel upstream support for debugging of compute ISA.

Current production ROCm GDB interface for ISA debugging:
https://rocmdocs.amd.com/en/latest/ROCm_Tools/ROCgdb.html

WIP upstream source for ROCm GDB API, ROC Kernel and ROC Thunk can be referenced here:
https://github.com/ROCm-Developer-Tools/ROCdbgapi/tree/wip-dbgapi
https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/tree/wip-dbgapi
https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/tree/wip-dbgapi


