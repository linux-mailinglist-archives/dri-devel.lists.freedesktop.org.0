Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14650798DEB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 20:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF38D10E0B4;
	Fri,  8 Sep 2023 18:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664E110E0B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 18:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEB5BD1IrRDFkW4nZNKy0TL0gH4Q9R6qNRC5P5C8KvVhjfR/K70tC1GkXYJKVgRSzHACIuUyLaOi4nVWh893Po/Bv1uCmeJz9SKevTHcb7Rzx97EflM8A6ckV/ANhui0lSwScJiaUvUPP7wNx/JyA4Mpvha7K3ttu4LKzRtwlAFY0uKf33pa9OyXcp4O83GBWotDBfBz2yFf04UivInoBoidTiLELwh2HiJHoXuC5nZXlh2xyuSq9BmKetLc2PtBjbbsZYHqokxz3cUKOyTviR1lsWu56BAbqMBILqeB8Bp7SKtf+BQXFfBS67igr227dU/f/DmqnHMnbAYhLRC35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyks5DBJoEbbjby9b/ILesPoSrqDxauaA9O65HwaAPo=;
 b=DAPh06ceHUWVgR1fcVsa+RyJFNnVKiTU42DyOG3SAN0/fX3DdVo0Y/8cXxrA3mC8J4KjVos640xjO9jJXrpEFXBAOA2gvIpQ7PD41rZmz3nf5SFbvCtHzRW/R3VtxkybSVWdkTtWLzGocMonmcA0C7yWqvEgWDrnOaNxN2ATNJotwjgrZ4irgrbbkbKzar79VrTB7e8r/VODP6lOuPYQu7tgPW8OdNn/jHNb+ujh9CDFuqjQO/3TU/EVt3cDIEkrGPf4wkIthU6REHOCDzwjLyJ4EvQZ+73cRMdEo/I2vKRgxp+ouIUMbUgmttMwdWaH0xG6+XNWbtFPYlHZPlXilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyks5DBJoEbbjby9b/ILesPoSrqDxauaA9O65HwaAPo=;
 b=1WyOzBq0wHx76jV3AFzBa8l7YUWK0dbf6uurmK+Fe+HJE1Vfk2CwL+0sngqcVz0Z9zZmmc87n5jPFd0oE9Si8ExPJ9+tIebcHRU2Lvi2zVXweelCQFCkS6waLcN0dKzGTxQo2kmwqism5Eqbb+/A99rlnMdXHLthVwqbwIv6fIQ=
Received: from SA9PR13CA0146.namprd13.prod.outlook.com (2603:10b6:806:27::31)
 by DM4PR12MB8449.namprd12.prod.outlook.com (2603:10b6:8:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 18:25:21 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::bc) by SA9PR13CA0146.outlook.office365.com
 (2603:10b6:806:27::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.10 via Frontend
 Transport; Fri, 8 Sep 2023 18:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 18:25:20 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 13:25:20 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <Christian.Koenig@amd.com>,
 <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/sched: test before reading fence timestamp
Date: Fri, 8 Sep 2023 14:24:32 -0400
Message-ID: <20230908182431.12634-1-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DM4PR12MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: c51db546-e018-4ebc-46ca-08dbb098f5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezY7HtccmxIcuTchunS0872Isvn2x0xnmmY/0ezzylYdGasTRiR965iyMc6Z+BIya2/CbJQPolZpbOfLeuKp4TgI0kv+5isrLm4atHAC5LWk37inAZOGsZiZ9I52PfnY5u2sJx37TuzXSyIgG5xFaLqRsfk2GHHG6jxYV2RG9Fz3JVpSJS8RdO2B4DQmINAup92b/6gS7gdqPM4CAos0Vjdxwyhetfgrx0aTW6By5NVoK9999rX4KaVUXPyeO1u16aHc8dEDL96KsDB9/Rq9zzybQ+CMe29kfOA7m6orGX8b2W2WZldHlyOTk7IbloRxwiRPKUPGqGacitFmU0kWgLr19p9DCCSFaDjGyBU2R2tBop1B3pCOAXtKmcsAFBKoScnBSE4Todqm3trf88nK5EockmDlN1GXei8HZ/4aWZYIQmxPCyoXwAg/ePsI9U4XuRPZltaR0lzVGmMWF3poF4cM3rKhcLncTuByHkBjibMs7vYOVtkyeRnh+0gKPqxp9rw4HndALa/FWWKd9mlR7jITw7WnxYlNb9X17sStgWhaa06/lA/QlE1CkobwA+okjTfw+aFehirngFmVtdzPCtXBok/9/bHpklpxmcgibH+59/oniGUPz6Cl6lz297VnccoC6iYQdgjZ+Y2U2PijNWoa5djryzmOSruthFsGyL7Odx3gV83DP6tobZ+pSdYxX/Pen6L2JqwL5vQn0gsNXaX/6saa4ejCuY8U1tTUeo+aEZu4ba/bK1IxKTM7eOWJh2FbUa/+B1H2XuR2Vge4tg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(186009)(82310400011)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(6666004)(7696005)(478600001)(4744005)(336012)(26005)(16526019)(426003)(2906002)(8676002)(6636002)(70206006)(70586007)(5660300002)(41300700001)(110136005)(8936002)(316002)(4326008)(1076003)(40460700003)(82740400003)(2616005)(47076005)(40480700001)(36756003)(86362001)(36860700001)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 18:25:20.9524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c51db546-e018-4ebc-46ca-08dbb098f5e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reading fence timestamp always need to check the corresponding flag bit
before to make sure the write is actually visible, otherwise we can read
garbage here.

Fixes: 1774baa64f93 ("drm/scheduler: Change scheduled fence track v2")
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 506371c42745..8ed00f54c59d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -928,6 +928,9 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
+			while (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+					 &job->s_fence->finished.flags))
+				cpu_relax();
 			next->s_fence->scheduled.timestamp =
 				job->s_fence->finished.timestamp;
 			/* start TO timer for next job */
-- 
2.34.1

