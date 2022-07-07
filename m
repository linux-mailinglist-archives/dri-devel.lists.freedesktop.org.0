Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFA569898
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 05:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8506B112A5A;
	Thu,  7 Jul 2022 03:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22DD112A5A;
 Thu,  7 Jul 2022 03:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD/1RhAKCMacZwXIehXdnvPiev7txtkFirh6PLlgRI6I1hdMG6C3Vv8PYfVuzD4rhFo5AoAKx+evWLgIYWUabeRF2H24D0Dj/r1TRUKCST3AdOdAMj/pTwPlOUWjCIBWiz9LoZiFw4IrmDl7WpLipXUdRLi+GeqZbhA2ViQdvQpjI4QUTsTH04Tm40IUElHfWpX7Nmxu5fBBf+LIJG8mXTcfaOel2K+xiW0wN2UCcz/FvxKRs1iwBWiQmP+LAtiVnVhlAmTRzky94WwzdhlXivcEtvI3iRog5UFFAydY6P/YvT40Znh53PVHE2oUzXC2288XCOOrsC1qDxx0Jq8jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxRGhgWWZLBaMofv67QO2JJLLoym+6H00Y+ucZcT3bI=;
 b=MynYTIr4nD+MQB45jMP9yrQBtsJ6VnTL1trRheApwYo64d//rC9pJAcRN92EI0yXoa0GvA0tRS5gV8isOj70z3wOx0Hg0f2F3CkGPJ2mRN5MAyBcAJR8Rw1Svj43H2JmXb6GlLBfbYGBlPmX/cb8You5rze1UZ92vNCL3vjgRQUz1HFYMkLidyzYkDoJN1mqEbWKKqS/OXatIVlfCKD49ttfBbfNOc7LzrlvxvKk7isxadKD1jGDxZeZMNDkDApyoulOO0PWmf8WJ8lZEuHRl4Jt5rX2Otx2+QNeqzDrXlq7WCEOxCyn1c/KvKPooIkIHPG/QpxkiZndKMM4AiLQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxRGhgWWZLBaMofv67QO2JJLLoym+6H00Y+ucZcT3bI=;
 b=JaOGXRK5pX1DwybyKrLI9Gg30aKCLHU8SqEetZqs977IUIl+PNtf+9MxShu6cOKdsxt5c2/AY3Q8DYrBNnzV9m9RvVwywx9xYCOAXUcbXpHo3BavOKvb3RmjJYCZN/t97tzc4j2G7DcuVVmkGinqbu5sh6QF0dseW9szbE3gq08=
Received: from CO2PR07CA0066.namprd07.prod.outlook.com (2603:10b6:100::34) by
 CH0PR12MB5154.namprd12.prod.outlook.com (2603:10b6:610:b9::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15; Thu, 7 Jul 2022 03:08:57 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::2c) by CO2PR07CA0066.outlook.office365.com
 (2603:10b6:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 03:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 03:08:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 22:08:55 -0500
Received: from dev-desktop.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 6 Jul 2022 22:08:46 -0500
From: jie1zhan <jesse.zhang@amd.com>
To: <broonie@kernel.org>, <dri-devel-bounces@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1] drm/syncobj: Fix sync syncobj issue
Date: Thu, 7 Jul 2022 11:08:45 +0800
Message-ID: <20220707030845.4059465-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38cf8906-ab21-40d6-0d92-08da5fc6081e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5154:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnN0dXY5OUdIcGYxWFZxQ1p0TWpMQm5vSXVZNWxKaVZZekxleEswL25IZksy?=
 =?utf-8?B?VVdzMlA1Sm5tQXpaek9zVk5WK24xV2ZoNnlzd09mc0xsRVFST2EvWm5qTVlj?=
 =?utf-8?B?bnJmUkhQNWN1ZngwU2c1dmc3a0JZR2hqamRoZW45WjczUmR3dmlPemRRL2FE?=
 =?utf-8?B?TStUK0xJSHp4OHZIZ0tCZFpnNjJVUGVrQnYxaVh1NFp3WUozR0dBem00UStq?=
 =?utf-8?B?TUExVm1xNW1SYUlweWtwdVI0VXhPWmdGTHNuZ1NwVnYyYTdocm52NnBoOE1H?=
 =?utf-8?B?RmEvU2pGZVVNTFJpS25ZMDJZcHRmS1hzclVVcXd3YjJXMXc2SVNFUHVzOE9X?=
 =?utf-8?B?MVdVbHVCUkxoY1BCMndCamg4WkNNbHBVYTVZZjZ3NXdYOCtlNGJ6RFppaUd6?=
 =?utf-8?B?a1NKRWRxcmdmNnZDY0NqUUZMWlRSWFJNTVU1NXVTVWk0aGtQMlJUL2pGL2Va?=
 =?utf-8?B?dzhvYmVreTZRSFRHcU9mRXNDQnQvZms4TFFCdXQreW1hRjZKYnpybGUxTVFQ?=
 =?utf-8?B?WnRnbm9tcmUvblFZRmlMTzhGRFVqR0RabTNtMnVNVFRRc2hsRmRwQ1BwazRD?=
 =?utf-8?B?QnRDZytONjJ2cmZIM0hDS0FETkR6Q0VINnVnV25HL284OU5iYldoU2h3R1Fx?=
 =?utf-8?B?K0ZsNjRGQnQrUWFUdEVFY0RmRHdocWJsOWFmdHZOdHBTdE13UzIrdk9QR3BQ?=
 =?utf-8?B?Vll3ODdOa2Q1a2psUXYzMlJqNWUyTFZTeEZBZ3dLTUtZd1p0Sm5VaElaWTY0?=
 =?utf-8?B?SXptTUI4cGVoQkFTdnVSS0M4ZlNrazJndEN5ekthSHlvTnJqMy8waStUWExZ?=
 =?utf-8?B?VHBEMW9zbTYranJTK3VneHBFbnNnY3dNckQvelBTaWxvZlYzc2F4ZVRwTVdp?=
 =?utf-8?B?TDNwU2lFY0lTN2loSVYxQkxvMGovaTVYTUM5Z1hFTWR6TklwZWpMVEo5QVhS?=
 =?utf-8?B?b1ZaaDlGY2hSakNXd1IrbURJUHArb2cxd0Fld0cwZzAyNEtJQ20zcFlRZnZi?=
 =?utf-8?B?VDBZUmFqM2pMbzdQQjFQMG5IbEdxOGRFYkJ0Q010Zi9GMGxITDJnZWc2d0Fz?=
 =?utf-8?B?RjBobjR3L29yY3ZlY0tRMmxTKzF3ZUZaak8xb1JkY3lyNnVQSWxHN3g2dEF5?=
 =?utf-8?B?em1xN3A4K2JsSFRXb1kwR0loSWd3REg4WjFldkFMZG81dUNVWUsxaUVJZWty?=
 =?utf-8?B?TWh5NzZXZDYrbDQvWkFFek00OXNCc3AxNTg1c1ljSlJkRzc3N1huYWNEc3Rx?=
 =?utf-8?B?cGpXMW5lbWVlNWhzRVJVaWNrZnAyM1NRdDU2SU91c2wwR3RnZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(2906002)(8936002)(5660300002)(81166007)(86362001)(7416002)(82740400003)(36756003)(70206006)(478600001)(356005)(8676002)(40460700003)(4744005)(70586007)(186003)(4326008)(40480700001)(36860700001)(82310400005)(34020700004)(316002)(2616005)(41300700001)(336012)(47076005)(426003)(54906003)(7696005)(1076003)(110136005)(26005)(43062005)(36900700001)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 03:08:56.8822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cf8906-ab21-40d6-0d92-08da5fc6081e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5154
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 jie1zhan <jesse.zhang@amd.com>, lucas.demarchi@intel.com,
 open list <linux-kernel@vger.kernel.org>, lionel.g.landwerlin@intel.com,
 nirmoy.das@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Vijendar.Mukunda@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

enable signaling after flatten dma_fence_chains on transfer

Signed-off-by: jie1zhan <jesse.zhang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 drivers/gpu/drm/drm_syncobj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 7e48dcd1bee4..0d9d3577325f 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -920,6 +920,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 	if (ret)
 		goto err_free_fence;
 
+	dma_fence_enable_sw_signaling(fence);
 	chain = dma_fence_chain_alloc();
 	if (!chain) {
 		ret = -ENOMEM;
-- 
2.25.1

