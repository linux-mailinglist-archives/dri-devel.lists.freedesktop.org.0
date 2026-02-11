Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJe7F89ZjGm9lQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:28:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB57123520
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6E610E377;
	Wed, 11 Feb 2026 10:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aOk8Snol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013064.outbound.protection.outlook.com
 [40.93.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD110E36F;
 Wed, 11 Feb 2026 10:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Khel2ellZ+InzVYbTf3UKwlxPI8gmlFY2x17g6OSWynHPD6LQEODF8dQUgMazeoGEt/b05AdewEKutvvfPmJAJ2sqO+GD4CqAwVmxNzz8GeoZEXrC4ptftjarIXavlVbFO3kXKUPNf6cEzCpnjiBHUHsG7RUa5c+mIitzqLnkRF/OlodMY6mcTYBiVtsu49VtW/aHFkTwHnbz9qfHHCR076B9nY4a5o87dGsufN+WBYfV4mWl/8jqh8aSPmzGqTSRQpBmDtrgxYf7ibrqwpsaS6MkA4V1iFgA5bTSx3rmn2dfdQDmOklbACrnewaH2MOyzZBcAgPhD/nyervQ162KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xedXY/Yqm5c8zToaRQudib+AYglzo505F78ZiO6eo2s=;
 b=atG6XR1tksEit5RvQ+Ak80mKuA8Pm9GRknSjqzIdC7dBeuL9DMf+++Tl8nV7q6x6odk3juuc+srY1Qd8B+9F3crt2rhN6JC5OvG+YDVn2B7Iy++4D/dJK6xd6zurg9wmS2fs8cuTx9MwPmOhUP7sbJPp42v8Zkk9wFWs/k/6GHpOgHZyMnZOYIpmkIxcTD+pNwT/hZ9B3lxa28aIC/7sVOhPYoVgYrV2sDLvhVb2gcCL9eB0PM5M+TUAFKUSMSfuFtGe7xrX3Dqd59Jeq1ODmNBr7BkjRx0HeerOgx8QEIcKZSPq/Hak7FG9ttv/iBCSAExmm9V+Ld7wuWpCVUrH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xedXY/Yqm5c8zToaRQudib+AYglzo505F78ZiO6eo2s=;
 b=aOk8SnolKrceDGVELUDrkwlq6ylbf6zGo4jms5d44crI5hZ/e6NF3K8kzq/DOImD84SA+eKzBdAc9Zo2IS8Ew4o8OPlLSfI6XRE0d0mi29t/8IA4rUaUFn+dhfloCnQTKNIqd19VSRQ1T+2E6TZ6jymYKLCL+nlA8i8qTmyFVug=
Received: from SN7P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::30)
 by CY5PR12MB6084.namprd12.prod.outlook.com (2603:10b6:930:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:28:23 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::41) by SN7P220CA0025.outlook.office365.com
 (2603:10b6:806:123::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 10:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 10:28:23 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 11 Feb 2026 04:28:21 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/6] drm/amdgpu: include ip discovery data in devcoredump
Date: Wed, 11 Feb 2026 11:26:48 +0100
Message-ID: <20260211102657.4180-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CY5PR12MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2643e1-8abe-4297-cf37-08de695848bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U5uEK3C/TlZLEptljhZXEI5k4SMlM0umy8prrevh+YJ/11l/fcGCkaWBvYD6?=
 =?us-ascii?Q?6ANwQbkMwAjuFutmnn4RYiW3mVjPTrDwWnwtCHUAHJXHuyCdJVG0L9zOUY4r?=
 =?us-ascii?Q?/sFCVDwaPjlhVQ51zVi3Hls1A+/9/ssl136Kw6Mi/hn1bw70XvhEa+YL08r7?=
 =?us-ascii?Q?MIeBQkHCX0CC2mBKWUv3tVdQhy5d79F6RusxmlTUPBP6NNa+nQDxQa5IyiGX?=
 =?us-ascii?Q?fRX196k6Av76s+3B/eYzOeMH5/ylhcFrrKhgT8E0IZ6EVssUefXft6UG01H/?=
 =?us-ascii?Q?O7d0PgMvuYv9OJXH6/mi0qaLiCy8c72tFZGExvlqmLLeGrwykza0fIq2LvYE?=
 =?us-ascii?Q?7kaQqJXzRcqKgI9N2/8IkZLNp7CdyFRLDp+jEC9glAgjwMZvMU3bhytufiH+?=
 =?us-ascii?Q?b9r7vgLLUdwIftUrhY8/qq4oKfW1kh06ZMgqzu7a9XVdT0JDK9EErE6el0Tn?=
 =?us-ascii?Q?nPk6keaf/g3RVuJyME1o+FY38u6xEItM9bGynqudfCv9ZmlD6Kc9rZ6vNF9m?=
 =?us-ascii?Q?zLiDSC59PVoB3ruBODIfRFSSOqqy6qMuw6LJES0OGvsy7sHpRG+J3ZjRsxCJ?=
 =?us-ascii?Q?EkrF1iTU7rYuS6BwTK00//iomuQu6EUB+2STRXpYP62989bjx/fCML85HEKN?=
 =?us-ascii?Q?JmMVp/9cdVU2C75XnG388FJEE4emj28q1PtzX39zlws7YKCL3O9wU0GE0VIP?=
 =?us-ascii?Q?aTmDvBFs+SEQt82H5utDkBB16U9SOCfoIpXwve2+3rwJXZ8fApqqrtkzo/tT?=
 =?us-ascii?Q?9FV1z/9u9yaHEUF277cBYloUi1M8qbFGep3PPzWwhWtpJo57nPPW3/RsPTvw?=
 =?us-ascii?Q?Vk+1BiCV6Rc63m90gJmK3SuTZZ1VQhrEZTyJ4IFpkjdPz/yl8FniyuEo43up?=
 =?us-ascii?Q?8MVm6MOHOpZ0vVQ4+TjLs9wIUoIU2WMkTOzjWwwVuWgsnEyWMq59O8qbC3EP?=
 =?us-ascii?Q?X3ixZdpL/qTFm3WqJ9EZ2dUKIgyvqvhE3xBbrJ5Uj+N04yQjOjwYvC7kBQOV?=
 =?us-ascii?Q?LhyoQrsFaSm9wf3jrYH0rNC0tnSJtCoSdM+0/h59n+QOPyPKQylKnLLqOyE6?=
 =?us-ascii?Q?eVRwAQRVeQYmLMtrDo5Veu4IO4dGzBLMTQ2V5TAKjOKsry6xtowrr/R5QY7w?=
 =?us-ascii?Q?mllEWPfIpjhjSVdj3sdjZwWcchIfbDBqF67Frpx/cnk4tuueGR7MVsUXMW4b?=
 =?us-ascii?Q?q783Y5XU4U+qz3ROmL1gr5IN4yFK1JYSmkVXeY57s5vxGlUCcswV6pG0wD6e?=
 =?us-ascii?Q?1k90H7spHL1iZ9Wu8FYWIS5j0CNv5Xrl/UvSJOvBMTCoWbnj5Foz2LEcTfKI?=
 =?us-ascii?Q?jkxSz1U4Mew9dDGM8Fau3EuvfMj/v9kZbjt/7MXoHJvixxNvhC1JQv5kk8PV?=
 =?us-ascii?Q?ZuYx1zzeGJiVSUYkVRJq8VWuur5beeIKSBDgQWEGMNozVEbUAihC/Hqdbs8x?=
 =?us-ascii?Q?AXV6EU2kKYnppk8nwhc9Hephpl/5uyBFWdTArPEQo1TzV0EW33+zK0ARqsB5?=
 =?us-ascii?Q?ksAnNagjf9iUpsqa88TcpK0xvU0OOT6HUtTQpB4/tkJXW8S6OgHPSKtmxOTx?=
 =?us-ascii?Q?4EqzP4edhhhYY9LeDbsy/zTKr5sGeNdX/XoU3/s/B5Lkyt3IvP85hvNT3vo9?=
 =?us-ascii?Q?OzGLdT+ntzbyM2F5mbrEHyxuuRF398NMVS4h/BzCmm7tkcWiraNz/hJq8oJH?=
 =?us-ascii?Q?1BJuGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y/7AQ33UBd7/Nw0B+VxEh7kkmnO5S5ADDU9ezSmVal1YIbI+pshXnDkB0n+UnRVubKGLwptS98xRknN+B2/8zDItwZEzsrB7Rjmvm6JCif1MPvYkPh4PuZKFYo2nZOGDzFDd2viaQTm53PIW/+TN2Ubx7TcPTRb1yKa0rX5bg4dJCDfK4Oldq/c42j+O5UmsPImo5ZOPr8yrGicMsSs5jxUbzBCrAIYMhekEA/Bp/gE3srThYnO8oZcV504Twe2dq9n7AERx2qeF85sJK6lwSj/AToAK0J5EV9oKmzmAzOSbDN6VO1M922CZsbbeRQv3RHumRzsgHudBduI6irQFnPP0gZ2ykioDuikDSQ8gdBJ8ny3JMSJOWi4J7qbHZx6uWHwVHb85YDdtGNilxNTmoBssdk6SizCwWYs8qQ+lzWTN75wYryJQHv5s5mT+l71z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:28:23.0888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2643e1-8abe-4297-cf37-08de695848bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6084
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ECB57123520
X-Rspamd-Action: no action

This is the best way to describe the GPU to a tool loading
the devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 42 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h |  3 ++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0bb430853a9f..42a969512dcc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -262,6 +262,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 		}
 	}
 
+	amdgpu_discovery_dump(coredump->adev, &p);
+
 	/* IP firmware information */
 	drm_printf(&p, "\nIP Firmwares\n");
 	amdgpu_devcoredump_fw_info(coredump->adev, &p);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 41e63c286912..d7325c23fa53 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1380,6 +1380,48 @@ static void amdgpu_discovery_sysfs_fini(struct amdgpu_device *adev)
 	kobject_put(&ip_top->kobj);
 }
 
+/* devcoredump support */
+void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printer *p)
+{
+	struct ip_discovery_top *ip_top = adev->discovery.ip_top;
+	struct ip_die_entry *ip_die_entry;
+	struct list_head *el_die, *el_hw_id, *el_hw_inst;
+	struct ip_hw_id *hw_id;
+	struct kset *die_kset;
+	struct ip_hw_instance *ip_inst;
+	int i = 0, j;
+
+	die_kset = &ip_top->die_kset;
+
+	drm_printf(p, "\nHW IP Discovery\n");
+	spin_lock(&die_kset->list_lock);
+	list_for_each(el_die, &die_kset->list) {
+		drm_printf(p, "die %d\n", i++);
+		ip_die_entry = to_ip_die_entry(list_to_kobj(el_die));
+
+		list_for_each(el_hw_id, &ip_die_entry->ip_kset.list) {
+			hw_id = to_ip_hw_id(list_to_kobj(el_hw_id));
+			drm_printf(p, "hw_id %d %s\n", hw_id->hw_id, hw_id_names[hw_id->hw_id]);
+
+			list_for_each(el_hw_inst, &hw_id->hw_id_kset.list) {
+				ip_inst = to_ip_hw_instance(list_to_kobj(el_hw_inst));
+				drm_printf(p, "\tinstance %d\n", ip_inst->num_instance);
+				drm_printf(p, "\tmajor %d\n", ip_inst->major);
+				drm_printf(p, "\tminor %d\n", ip_inst->minor);
+				drm_printf(p, "\trevision %d\n", ip_inst->revision);
+				drm_printf(p, "\tharvest 0x%01X\n", ip_inst->harvest);
+				drm_printf(p, "\tnum_base_addresses %d\n",
+					   ip_inst->num_base_addresses);
+				for (j = 0; j < ip_inst->num_base_addresses; j++)
+					drm_printf(p, "\tbase_addr[%d] 0x%08X\n",
+						   j, ip_inst->base_addr[j]);
+			}
+		}
+	}
+	spin_unlock(&die_kset->list_lock);
+}
+
+
 /* ================================================== */
 
 static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
index 4ce04486cc31..c8242992c912 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
@@ -30,6 +30,7 @@
 #define DISCOVERY_TMR_OFFSET    (64 << 10)
 
 struct ip_discovery_top;
+struct drm_printer;
 
 struct amdgpu_discovery_info {
 	struct debugfs_blob_wrapper debugfs_blob;
@@ -47,4 +48,6 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
 				  struct amdgpu_gmc_memrange **ranges,
 				  int *range_cnt, bool refresh);
 
+void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printer *p);
+
 #endif /* __AMDGPU_DISCOVERY__ */
-- 
2.43.0

