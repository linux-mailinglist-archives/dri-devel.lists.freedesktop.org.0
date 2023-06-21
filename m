Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F6738B18
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7549B10E089;
	Wed, 21 Jun 2023 16:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056610E089
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgiNCuFnp97N31kOcCGK7JqZ5268ZkpkJavk7XTZk1DhKzepT+QEMxcqDhd1jcJ8xmXY/JA3R6/uPpXz99/Q3CXnBk5QRv/WOndHBVr1hrdjds7FiKrcTeZZYvJEQbeus3fPUTEbSFZQ83iZaLF6jgFdUn0rjuk1sAeHyUqblrJNQ+Dt5x53TpQjtnsXgEaFYWNUtNWdKG0oUoNjfbx+yWLgD6WyFmPF5Tx7lcNgPj/nGQI5+nZUazYlDEbfhmwib0jXJQT/OAco6UY4nmAwciNVI1aKVx4FCesx+iTTQWqA2E72yVf/txhZJx2IASbT1HF7xvoV1NNrHUlrpnIMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHfjTUu7tVBXV3LGHhUGP2B7C9bqRLYoiE0N6egvxcU=;
 b=i9I08MfKRZDclbIe0w51A49RcKCQZQar4mp+QwNkTcE/E64QuCBVOrsoZQB7WpDxYBxVepZpy8HG5rc4iNmikhbAMXZg/mOpz62/yNZZZsBcXKLXWPp0Dx0vCNe6uBNJOIlYoEMPjLVSIIs4sK+573civMOEHN+aBn7cmeDaRTdkqpepB8Y5e7zUv1pZxL7z8vIAfGBNopWDi8r9Xq3YFPzPwv8xupad/CUGbN56K7N94No56JUjCl1Pw/RgyuOZDq2Ae3Nw8ZTqcVEcVL6WQkgKKdt2JIIXWjAY6Tk2ON8b0vPOpJakzHry0cj9bzQn6oDiim6DA4oEPUGJTfViQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHfjTUu7tVBXV3LGHhUGP2B7C9bqRLYoiE0N6egvxcU=;
 b=h29OrOKu9xTZCjMfr6dfL2EXTK1c+dOAStMCr5GuFdcl9S1ciPLSh19SzGuUK5qIeu4BtsqH0KV0hm7hxkHULZGJMO4D+jV1IWQC1fO2HtNkcxoVGlVoaiXumxCn8faZR4OCfS5kpEk5YEdOW5Qt2w4WoTaZfmR/MfOPaTOWKWc=
Received: from DS7PR06CA0004.namprd06.prod.outlook.com (2603:10b6:8:2a::19) by
 LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Wed, 21 Jun 2023 16:27:14 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::a6) by DS7PR06CA0004.outlook.office365.com
 (2603:10b6:8:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Wed, 21 Jun 2023 16:27:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.40 via Frontend Transport; Wed, 21 Jun 2023 16:27:13 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 11:27:12 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
Subject: [PATCH 0/2] drm: fix soft lockup when saturating vram
Date: Wed, 21 Jun 2023 12:23:42 -0400
Message-ID: <20230621162652.10875-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|LV3PR12MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: bd200cb0-e61c-4d5f-1e1c-08db72745f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Caw4niYGOFQXMrnBKlncQQgEHSKvBxV2yvPS+q+BJ+L0iFV+2CGZOh8ty2q5qswAzbF4WT8u7Tjd3/ASMT/dlnkm/bs5TJa01G0aGKJyc0jog0LZcyZ7xBKSxgJQ0H11CILM3PfUQcM55FBxXeF4iXEbw9wcg7OsZBAsypnVJkksjJy2Iko43K7fa1SM+/k/OqVw44zRNIYpBUVm+YlvZU10/kLPad4I77rBA2bJDsIwZ8ZNCZwk+bRUGpOtVSnhlN3+K32Hv35uynu2ZJ9l/zou3LeB7K7hBIo2LF2VSwan5LkjnhD2/3XN3y4rVEhbz8YBOUHtY8Q8m2i9Cvh62NBpUlLqAFZQTV+Oief3njf6Fe0d10V6CjdAfnHGzDTGP2gndZAXsj0Djo4rtnKimWUvRd+NRf8Nlq+aHUlzcW8kLLu/CkSS+3Mh+kqHZkvGsD+QQRXXlVl1VUXWY4AujCj3Ay2Lzh4L5eB8Ai4nPlpzLouCNcXRcY54Gq2SLhrbjyfERrkifPQ8XZrvVylwryMTX0ab7h6IxOTGA0SDJFXi4GKTjHy5d79+DzA/v+/Qg1+jXCKLzRLr0uG/oX8UOjg35glXzzwFHEBkm6NBgjD31X6xyFCs+4WQSCXzJqGXUg6RyRMmFfIzRP+WixRn4HZpcMlqfMnNiXnzHX8x4AqxO11Vfvv1a/J/v/El2vOmjr2HZ1h6jWpzMNvkrLyDwUFn7NPZDI1vCSZUUrOKYg8gdWSCru8FlbFsmROHhsXluC2SOutmwWG4c1H5Ru6v5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(6666004)(478600001)(36860700001)(82310400005)(36756003)(47076005)(16526019)(426003)(336012)(2616005)(86362001)(186003)(40480700001)(81166007)(356005)(82740400003)(1076003)(26005)(40460700003)(8936002)(8676002)(41300700001)(5660300002)(4744005)(2906002)(110136005)(316002)(70586007)(70206006)(6636002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:27:13.8350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd200cb0-e61c-4d5f-1e1c-08db72745f07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119
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

When running multiple graphical application and vram is saturated, the
excessive swapping triggers the BUG_ON() in dma_resv_add_fences. The
root cause is that calling dma_resv_reserve_fences twice would shadow
the second call and this happens in amdgpu_cs_ioctl/amdgpu_gem_va_ioctl
path shadowing reserve calls made in ttm.

The first patch fixes a missing reserve surfaced by the stricter reserve
check below.

The second patch reworks dma_resv_reserve_fences to allow it to be called
multiple times. It also makes the error check more percise and less
costly, hopefully this would catch missing reserve more reliably.


