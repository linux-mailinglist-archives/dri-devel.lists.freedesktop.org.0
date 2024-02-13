Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5CE853542
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DCA10E83B;
	Tue, 13 Feb 2024 15:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T1NDcGrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5097B10E837;
 Tue, 13 Feb 2024 15:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO8Jp4RG/qUoL+W8s1clLJ5BSBK6Sh2IveoSQLt937ui3Bhn2Yiou/uFd0xe7x8RO//P8yzHOyLZS5Cpb4PL2pcWIf4N+Fd+30wmTVWc3lz/KiantZrz2e0wxQMq4S/zJQFXHTlYyrDqKgIxiDzXqtWBLVzkV2Q0+lPls78rAGKZroHLJW6LgiNzmfrnmIiKcJKzYFfNEXX6CzFt+Vbd6gErx7nHHBqmXbQ9Dhbw9Zu9XWJJyqvsJhIEx7XdIkopMgGMMhhmChXhz0x3l13ED/lpQZgPZ+CEA1JGgey7uGL2HXEEsVRHpMPsLjotkWBNsM6ZVx9BLnd1ubE7F1EtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej94dIoLfuB8DjPgfxYfwN3IhhVQaxWcWhfsOXlYPQc=;
 b=X5/AXbk2flgfJWOw39PtNw29wfRwvphxwskyKbVDWnSCUsxooISMSiUVFyfQ36krgNcGE10KfT05ptDfU8qcbYdZHNYgpGbDoj73lbgMW3wmZMXZBp67Kq01nFvQPK4GTZHNyCTHN5fkEeHjA27N2FvvFaHSCDPTfCwXsdC5LujEwaR7ZQ8Sh1Y/0FBmNo2IMFE9SgHV5uwyReFqBJ//6J655cvTPJ/1zPdsAM30iUztTkyJKHgsaZIlOMegQOQjeMXoCqNxByhsC3oAYBgSs7nsAyEU34EZT8U0rOMUMpFKuSre7Zxot5Xih6ZAyDryqBxuj944z9bH2Cjc+5k24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej94dIoLfuB8DjPgfxYfwN3IhhVQaxWcWhfsOXlYPQc=;
 b=T1NDcGrXHfK1JqNuKhb2QohoQ1PdLHNTXq7L3z5dRzQKfDTyS0mxt+85L56/LNmNJHPOHgj51e9wut1bWe9OHNpWt6Anzp/Iy3p8x53LGuPSlH+ymVTZfwAkaY+ykK0hhHRwGVDkStIdNQa/Wux7M+sNUgHHQD44Qekb4uzRbLc=
Received: from DS7PR05CA0018.namprd05.prod.outlook.com (2603:10b6:5:3b9::23)
 by SA3PR12MB9106.namprd12.prod.outlook.com (2603:10b6:806:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 15:53:15 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::e6) by DS7PR05CA0018.outlook.office365.com
 (2603:10b6:5:3b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Tue, 13 Feb 2024 15:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:53:15 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:53:11 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 5/6] drm/amdgpu: add a amdgpu_cs_ioctl2 event
Date: Tue, 13 Feb 2024 16:50:30 +0100
Message-ID: <20240213155112.156537-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|SA3PR12MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 0902db57-d82c-4a33-3147-08dc2cabe3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DOmw76whJN4g5lbPsUaJqGAlq5P/uqmTr7pMHrwSY5mVRct0WwdDyjXlZkA3ofsuXb/5A4QblKcA2btrjBVrYudYeI4qoP/egb1veAyUVaDJK8lf9R+/mRtCSpwpBUocs4U2Mt9iwJKrp385TOaoTvRwDSm+fjfhPqH+v/CEjkHwsnen22FRgqeR6wmgXBS21ujDeNl/nZDR2t0CTguvEu/StdClJG4WW6kqXg7g0LOwOPOly6vF3WVl465ywHClAjCe88O0Ffybt+879rIX8bFisPfjS5pdTlJl2iky8VRFLGc4XBiGCapQwLLPt1pdx6N8dL3j4s5KxR+R+zve8svw+uuFoc88PN5HUh5OXyoj6rXhdSu62A3SLbTYzmMTbsGOx0PihRAlU2IWBb7ARxEQOKAEvms/msT4dQhzT/7y96yd95U1oN4XWuhGV07R2nx9wwtZXB1d8lD4Dd5kSDxYH9W9FGStBLat6SZ0UkSyxEE82oOtdFpYjjPbK5eDgQfHTeZ9yWT+lEID37niDA5Th/OnUB3ZK2rTMujdsQOb6euSt33uvL8X7nvzFJ1IAwQhJjC/0fm4JKv+EgpqNwIJ5h3+lhuu7l9B3tiTlXSuw0/20tidHKZZhn3dIv4Krt5Sm1lgCaBEa0XOVmebdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(40470700004)(46966006)(36840700001)(2906002)(6666004)(356005)(478600001)(7696005)(36756003)(1076003)(8936002)(82740400003)(81166007)(8676002)(336012)(2616005)(426003)(16526019)(70206006)(86362001)(70586007)(26005)(4326008)(5660300002)(921011)(110136005)(316002)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:53:15.2718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0902db57-d82c-4a33-3147-08dc2cabe3dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9106
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

amdgpu_cs_ioctl already exists but serves a different
purpose.

amdgpu_cs_ioctl2 marks the beginning of the kernel processing of
the ioctl which is useful for tools to map which events belong to
the same submission (without this, the first event would be the
amdgpu_bo_set_list ones).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 6830892383c3..29e43a66d0d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1402,6 +1402,8 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return r;
 	}
 
+	trace_amdgpu_cs_ioctl2(data);
+
 	r = amdgpu_cs_pass1(&parser, data);
 	if (r)
 		goto error_fini;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index e8ea1cfe7027..24e95560ede5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -189,6 +189,18 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
 
+TRACE_EVENT(amdgpu_cs_ioctl2,
+	    TP_PROTO(union drm_amdgpu_cs *cs),
+	    TP_ARGS(cs),
+	    TP_STRUCT__entry(
+			     __field(uint32_t, ctx_id)
+	    ),
+	    TP_fast_assign(
+			   __entry->ctx_id = cs->in.ctx_id;
+	    ),
+	    TP_printk("context=%u", __entry->ctx_id)
+);
+
 TRACE_EVENT(amdgpu_sched_run_job,
 	    TP_PROTO(struct amdgpu_job *job),
 	    TP_ARGS(job),
-- 
2.40.1

