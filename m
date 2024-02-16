Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98F858051
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BBD10EBAA;
	Fri, 16 Feb 2024 15:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kW2k0nVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF0910EB8F;
 Fri, 16 Feb 2024 15:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We1dKE8s6lOJqOlkDuPwsFqai93Z1TbikYXsZRjerTVPzeSuHIidBTulR9U/XeWXcnRCdO9O8fDuvOxXGe5A7i4gDrYvDNP3FHo4S/Ow5Kd8QAAiewONgyqEpUoboxrKMbrRujVlQZITB5kA12LC9KgeShvf2nXJjyl7ezyyFRDxIR3/6rsewiIGO9CoBBKiN0wX6CW66wnE/Lr09s3CpwXTQJ3XOmzF+KqL0OGRFxz35pOcDlD7fkEtm/1iJRVquW8kxhB55U9P6KpFpB3gl1VQNF+Vx5fZeRF6qgwNLBJd1idLaJ6dBRJckGcIfQ21mfnwpN/psiXW4mfkA+zuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJDNg0QGI964boRyWOyUWRBgcjJuuIEqVTso9xHO8mM=;
 b=ZuHfqCImb08F5lsavfJw6IG5twr8M0Iix9B3CE+U1N+h5Ok5DGoAMUJFdbsf/0q68t2tWVlGsN0icQt16FvU2CvT4zh6EL1ciaddFjHnRfDBMCBb6enGRlJszETg0k+5ZeZET8IAb+/o0YKdSdoJxjTqDBWiAJj51qRQZtoMU8hCBmcp78FPbt0uq1z8rjTUDwwEHdG67YADvqJ9WYfCFJTsUT4TmAcHbTtL3iKs9SxQgiErzDQP55NY5fW/q3pwuk9UPoj4oHWh+RXW4Y9liRKSu1ypzZlgz2rT0+PbGI41Eid4sbfRwt2keWInvX/A/OF7Gfw5+xvjpwVJXTLy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJDNg0QGI964boRyWOyUWRBgcjJuuIEqVTso9xHO8mM=;
 b=kW2k0nVGNDiq79YxEVozojUGJoWFwSc/dWLOTEDPbjHV5Dmr311MUPSuIuZ3SZN+Q5Up8Dj10ltYdKQXRL+5vtMfKfVIxopgXNqZ1A57yvSbPQEr6oPPcUK2Jzn7r1Xsq5LKMtCozK9G3dCy6OoixQwhYwM8Tfo9VeH6hb3lPXA=
Received: from BL0PR02CA0095.namprd02.prod.outlook.com (2603:10b6:208:51::36)
 by PH0PR12MB8029.namprd12.prod.outlook.com (2603:10b6:510:26c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Fri, 16 Feb
 2024 15:12:37 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::f) by BL0PR02CA0095.outlook.office365.com
 (2603:10b6:208:51::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29 via Frontend
 Transport; Fri, 16 Feb 2024 15:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:12:37 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:12:33 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 5/8] drm/amdgpu: add a amdgpu_cs_start trace event
Date: Fri, 16 Feb 2024 16:09:54 +0100
Message-ID: <20240216151006.475077-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|PH0PR12MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 5651acfc-45e0-41b2-ef02-08dc2f01b5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OI0BUkxCH/o1ZDW0zaNAbayQWsvh95h6agGKjg93vraoGqv4eobO//7dD3h0W9f/mQVO5Fn4IFrf3lxjk3UwkePv4Eldkekhjx7xVeNJBHzOKt3MqC7fOgl9t3qvEODOcEh3QYx6jUA31sTsYg17HkmHD8yP2eYdUSbtinQnJ4RhGzDbEeCQywVk4dCWu8d/Zkuozaqjh3T/no1zIRXwypXXfJ4CMvkrRAnalfxuYjMMKcrrR3pz39WeyxKBvlbAyTuRG/vlyzvq6FgGC5VPCocLOZewlBS9QszOr/GzYGktAiXMIkCow7rPpbznNjYxZf/jHVGEOIM3MaBPkO8WdgOLjgKM6ce6qlSWXrjSsVCqYAR0oLi45rmIDZmaz0UbF0s1UyqQFSNED9glFzL1dEE4QXAHLEuvG2oJAfgXqwtcLbD7XofYMjRwTvziiaRAJVQt29aTO2BpAdKPXURSTP9nFjkRzQboe2KGhE5q9445Eh1At539ObGT8uWKxqOUTZTe00F7ue9SHtZrmBU76A5/LqY0oDn92Vhg7/ds90k2B66PPFxmezJIagKoDhi2qsh6UAclc/N/bIFxJPRJz92KuLPwkQprZAMI0uH7/bHyHWlW+UivFB1YCocAvyJGUQ0jfDT37YHY3F+obHpOZKUIXkrsiSDjMv0lG2Ug8+0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(36860700004)(46966006)(40470700004)(478600001)(7696005)(41300700001)(2616005)(8676002)(2906002)(8936002)(5660300002)(70206006)(70586007)(110136005)(6666004)(316002)(26005)(16526019)(1076003)(86362001)(36756003)(82740400003)(921011)(81166007)(336012)(426003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:12:37.0485 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5651acfc-45e0-41b2-ef02-08dc2f01b5c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029
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

amdgpu_cs_start marks the beginning of the kernel processing of
the ioctl which is useful for tools to map which events belong to
the same submission (without this, the first event would be the
amdgpu_bo_set_list ones).

v2: renamed to amdgpu_cs_start

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 0a4b09709cfb..f3369cd0d9a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1402,6 +1402,8 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return r;
 	}
 
+	trace_amdgpu_cs_start(data);
+
 	r = amdgpu_cs_pass1(&parser, data);
 	if (r)
 		goto error_fini;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 0e47cbe7e0a9..3f18f570e5ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -189,6 +189,18 @@ TRACE_EVENT(amdgpu_cs_ioctl,
 		      __entry->seqno, __get_str(ring), __entry->num_ibs)
 );
 
+TRACE_EVENT(amdgpu_cs_start,
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

