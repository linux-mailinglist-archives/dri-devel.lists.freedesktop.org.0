Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDiADrkXnmmcTQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5AA18CC10
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525EA10E62C;
	Tue, 24 Feb 2026 21:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uEcOsx3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C1610E627;
 Tue, 24 Feb 2026 21:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcE5cg0jtXIbgNaA6LG7FAskmbFn6IahFwUpjF656x9PLFVCofk+JhYa5oO4IGYXpbA+Ul5sds5fhI10+SW4EBl1qU11nYb+M59xBL5wGkZL+aMsQfoB4jdALpHQW8fn3onggETiOXQN7m6TGXMGyt+BI2YymeJmWgpAyCAaXjkI0TI2+ESV5lQ4VCIZuSice0kmTemLPfm1YT+svI1dRIZ23c+pR6xekK0bBWARq1mWEVj8Rtl9z7rGo+TaA/Vlkw11JdBdBaTdRulA1RMakHG4d/52NnU1bpd7mDXMR+Fjc+zH0nF3Z2OfQrhYiTa6Qud92dHiWWBC4HgHP7vQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Epy5uSdDDUCMjHsuZyLdL7oElWaJPMzvAzdMWd7QBCw=;
 b=svUZLLZwaWLDIyONRojWpAe4YQ0wDhEJkLjlMvR1C390V42Vb9Q/XPhP7z++2GPrLAKd+0RP4SAfKHOwgdraTjONJ6JE8SwZEvhK/TbvZulI+Sgyq4fLHvtjkTbMK90qbf+BDrp1UNZcjK3xAEpCzjDATT7fxiUutkCzMGru9XQUnczNN9MdvsJlXPGoVqVRkW0VoedzILc5z16EFO01FX7CXM/OyWAUl5Tt0PFffi+7DbMMNtpCnnmLDbhEohPTqcFFJYgVdcK66A1UAVGFIEx+++qMqFxcHPUdQMcUFNhbsk8uB/7Mw8xdNuyI6uGMcg3bDKOpinZHlYoTnBqAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Epy5uSdDDUCMjHsuZyLdL7oElWaJPMzvAzdMWd7QBCw=;
 b=uEcOsx3vswD+JvDhyquaTXbwncctFJsd+YDjnqO2Hq1lFlBdXK1ExwiV64PEVpPkvFWb63VWzBAr4Gath4LiHFMIHkPrxOiiQan3ElWxjvtqD9cBeNJL9H85kjFMbeRN1UbTwMuJXkjOgfix1H/6lCfTPtlJreBY3KhOtxUZrR0=
Received: from MN0P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::18)
 by SN7PR12MB8132.namprd12.prod.outlook.com (2603:10b6:806:321::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 21:27:03 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::7a) by MN0P221CA0013.outlook.office365.com
 (2603:10b6:208:52a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 21:26:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:27:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:26:59 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:26:59 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 24 Feb 2026 15:26:59 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 3/5] drm/amd/display: Refactor amdgpu_dm_crtc_set_vblank
Date: Tue, 24 Feb 2026 16:26:37 -0500
Message-ID: <20260224212639.390768-4-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224212639.390768-1-sunpeng.li@amd.com>
References: <20260224212639.390768-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SN7PR12MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c981d4-f034-4be9-35ea-08de73eb73f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVTm/tp0nP3ubI3TEvq08TX1gNH6y1UHwN5tyRClXJ24G1f8PV3kdRbPeFz0?=
 =?us-ascii?Q?QyN0NN5yy4FOfRELXtIMJzIlEaO5ugyJTxqtZtah7wt+sNKo+8n1Sb8HquEG?=
 =?us-ascii?Q?I/cgaoRcdCenTP12BApgdEerJaw7hilxXj18YntyV73TROS8xw9pz9I3iphO?=
 =?us-ascii?Q?2rgS0jCjSWc+UKPmrwYAg4vURPrQbIsCrHlmCGBlOZ9FAR9ozF7HCf3Hp1ME?=
 =?us-ascii?Q?ofIU1yvKMyBS4qB0a3OEyWfo40aoJWXYRXRWWwPGLOLo1NQS3GBw3UIAdTkK?=
 =?us-ascii?Q?JEHgACRcRC9vRh+P0tWmS8C3iCXA0j7k5Ih4hRf6bll+LL+1Wrl9BK/qUBin?=
 =?us-ascii?Q?3spL0JJQOr7yqPG3Y3hyAzL9C4SsQnZSozixSX5Z8HFvDbRiPLdM3t9d1/0s?=
 =?us-ascii?Q?40NpxGEhjJ5uJyxOchx1PjaXcZOm460ktH+cLGF6UExkICrvAdtG5vqX620H?=
 =?us-ascii?Q?ZBLfV+bnee4IClOFZo6bYO+fZtlWj7489vZupL/PdDv8Umj8EytJ3qheneRx?=
 =?us-ascii?Q?cKKzBHWPYAR6U/Q2lGrRIydawagTVNL3TEJk4IrSPkJH2GpwEeHdo8IcsBpT?=
 =?us-ascii?Q?P2dN9KARzvnQ9q+RagIc50NIKCN9lPVpftGoO4q+yaTeKcoxB6fhkLZZtLu8?=
 =?us-ascii?Q?luaowo3kAQWqb3wd6/RCpPgyvvMLWF1zq8iqjYaNnuGqApbQYqE2mRcKLgxv?=
 =?us-ascii?Q?VUN/7nS8vHcHwlml9CgjGkPciEhQd+zsq1LV4ps4JpLcM3a0DbI54cz+t2Am?=
 =?us-ascii?Q?sqG0noUnQty3hAMbkMy3Jqk65SZCIRsJlBaWkZaOYnEbVdJ3Obag1PePCGuf?=
 =?us-ascii?Q?wZvi98Hyi5ODe400x+QB6WaJ/iE93ljhh7duCAVKbq+8hY+hk1NTLYyslbhD?=
 =?us-ascii?Q?Xg6T1do8IlyKZikv6jK2djzZ2lX/Qc9MmGMF7CW/P3soZZfm+8vRekx2OPKJ?=
 =?us-ascii?Q?/j5tXxzfRdiFRE2C17a88W/Kvv14RA1YO++NGQcZK/sg/7HEyFTh2qNP9USb?=
 =?us-ascii?Q?YI3SyJ29BHBYEVlAw8NI469KZzCA7nHLm02l41j5p1Fz56OcIkbmjvvK9MlL?=
 =?us-ascii?Q?WAub3LI6BiO5UgWW2KyGfWjobAYovBYs6yTVsOerwN+bLsETuM2arApYhqcl?=
 =?us-ascii?Q?wsCkvYOmCrhVQ4cey0rgkEapQoB9xe5YNILAnHObGTKDAqNF4S8acuUf37s9?=
 =?us-ascii?Q?r1ZcrYOAR8IuQH2lN1JQibZA6mg1KDZXIkj1qCHXOIE5dFNy9HQLXCPUrZ4M?=
 =?us-ascii?Q?xKo6CZWQO4SS79+HdRrsl1Izkz8ymK9wA7GYdptTMxfD16SqOVW8JUb+isme?=
 =?us-ascii?Q?TVMGiVmUWJR6TlC5AJlWI9ufjgLuYmje791RmGAProvymz7pX6muwJQD0qYa?=
 =?us-ascii?Q?NZcesSVB4+uuc+9NZqvzG75K8xAj/1g8Zv3h8GCNG38BDD0ehIIIaRTq9weE?=
 =?us-ascii?Q?cXqUwqFTqMepk5vtgW7Q/SUoHz8pB8RLa/xC+GvYdONsDVgbUHR+Ex9IHqqF?=
 =?us-ascii?Q?FT1m0yFxyNWR6GwtNLt+mJcd9bzgyNUWPVx+gLXRMJsNMsqlM25OkAwfQ3fX?=
 =?us-ascii?Q?GpIAWwV9LM45eb2JO/ZW6lHG7LcHgKSfnjYj01Jm+lnVGy0+SjACYxyMlIBj?=
 =?us-ascii?Q?6+1SWOxzdvPEqwIcZStVhayroNIrM1ucW1rC/8F7NBWvA+GM3umpglKx9ZwS?=
 =?us-ascii?Q?f1bF4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mFdr73hdqw8Czyus4mF77sHo2l8wqe8sRDQDU4AuME4/faW4FYCc03nMWy3KUg08nK7H7IqXPeM3UkZ0/tI8xOptEONKpF6gp7k92dwVMcsj0jORhLOvlF5/P3i9N8F6OT3bu+8K58gn05FhZXx+HsiGU6C8pWSMLaWsPHI2CGtZT5C5uQGyMZ266n9auAX3YSIXSd9CRq31uDV0mZO4FmD5DpqyMo8wvwp2tf0s0PEVL9miE1+GUTsskV9ycxr3OJzazdHil8Y461IDvgyrBMLhsW1avGiwItyRj5nOAtU2NoVXmZI206Soh5soSmW/DwtoOdfE+W72uIV7gmFcNblyZnXA5rjV8MgT+Z/z4/dScaqBUe2Sir2AQJMrGnWFOJInnta2isQ7bSs0CuymQp7PuNBZYb5mr4lmQPJlVq25kc7HuRg+4OnQvSdkYF0k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:27:03.2869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c981d4-f034-4be9-35ea-08de73eb73f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8132
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DE5AA18CC10
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

[Why]

In preparation of implementing deferred vblank work, refactor
amdgpu_dm_crtc_set_vblank to split out the actual enabling/disabling of
vblank interrupts + restoring vblank counts/timestamps from the rest.

[How]

* Move the vblank_control_work init and queueing out into
  amdgpu_dm_crtc_queue_vblank_work()
* Move crtc->enabled check out to parent function
  amdgpu_dm_crtc_enable_vblank()
* Call amdgpu_dm_crtc_queue_vblank_work() from parent functions
  amdgpu_dm_crtc_(enable|disable)_vblank()
* As a drive-by cleanup, make amdgpu_dm_crtc_(enable|disable)_vblank()
  static; they're not called from anywhere else.

No functional changes are intended.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 88 +++++++++++++------
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.h    |  4 -
 2 files changed, 60 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 130190e8a1b29..3df38f3cb7423 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -293,20 +293,12 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
 	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
 	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
 	struct amdgpu_display_manager *dm = &adev->dm;
-	struct vblank_control_work *work;
 	int irq_type;
 	int rc = 0;
 
-	if (enable && !acrtc->base.enabled) {
-		drm_dbg_vbl(crtc->dev,
-				"Reject vblank enable on unconfigured CRTC %d (enabled=%d)\n",
-				acrtc->crtc_id, acrtc->base.enabled);
-		return -EINVAL;
-	}
-
 	irq_type = amdgpu_display_crtc_idx_to_irq_type(adev, acrtc->crtc_id);
 
-	if (enable) {
+	if (enable && crtc->enabled) {
 		struct dc *dc = adev->dm.dc;
 		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 		struct psr_settings *psr = &acrtc_state->stream->link->psr_settings;
@@ -387,39 +379,79 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
 			return rc;
 	}
 #endif
+	return 0;
+}
 
-	if (amdgpu_in_reset(adev))
-		return 0;
-
-	if (dm->vblank_control_workqueue) {
-		work = kzalloc_obj(*work, GFP_ATOMIC);
-		if (!work)
-			return -ENOMEM;
+static int amdgpu_dm_crtc_queue_vblank_work(struct amdgpu_display_manager *dm,
+					    struct amdgpu_crtc *acrtc,
+					    struct dm_crtc_state *acrtc_state,
+					    bool enable)
+{
+	struct vblank_control_work *work;
 
-		INIT_WORK(&work->work, amdgpu_dm_crtc_vblank_control_worker);
-		work->dm = dm;
-		work->acrtc = acrtc;
-		work->enable = enable;
+	work = kzalloc_obj(*work, GFP_ATOMIC);
+	if (!work)
+		return -ENOMEM;
 
-		if (acrtc_state->stream) {
-			dc_stream_retain(acrtc_state->stream);
-			work->stream = acrtc_state->stream;
-		}
+	INIT_WORK(&work->work, amdgpu_dm_crtc_vblank_control_worker);
+	work->dm = dm;
+	work->acrtc = acrtc;
+	work->enable = enable;
 
-		queue_work(dm->vblank_control_workqueue, &work->work);
+	if (acrtc_state->stream) {
+		dc_stream_retain(acrtc_state->stream);
+		work->stream = acrtc_state->stream;
 	}
 
+	queue_work(dm->vblank_control_workqueue, &work->work);
+
 	return 0;
 }
 
-int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
+static int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	return amdgpu_dm_crtc_set_vblank(crtc, true);
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
+	struct amdgpu_display_manager *dm = &adev->dm;
+	int ret;
+
+	if (!crtc->enabled) {
+		drm_dbg_vbl(crtc->dev,
+				"Reject vblank enable on unconfigured CRTC %d (enabled=%d)\n",
+				crtc->index, crtc->enabled);
+		return -EINVAL;
+	}
+
+	ret = amdgpu_dm_crtc_set_vblank(crtc, true);
+	if (ret)
+		return ret;
+
+	if (amdgpu_in_reset(adev))
+		return 0;
+
+	if (dm->vblank_control_workqueue)
+		return amdgpu_dm_crtc_queue_vblank_work(dm, acrtc,
+							acrtc_state, true);
+
+	return 0;
 }
 
-void amdgpu_dm_crtc_disable_vblank(struct drm_crtc *crtc)
+static void amdgpu_dm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
+	struct amdgpu_display_manager *dm = &adev->dm;
+
 	amdgpu_dm_crtc_set_vblank(crtc, false);
+
+	if (amdgpu_in_reset(adev))
+		return;
+
+	if (dm->vblank_control_workqueue)
+		amdgpu_dm_crtc_queue_vblank_work(dm, acrtc,
+						 acrtc_state, false);
 }
 
 static void amdgpu_dm_crtc_destroy_state(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
index c1212947a77b8..655a6c4f83fb8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
@@ -39,10 +39,6 @@ bool amdgpu_dm_crtc_vrr_active_irq(struct amdgpu_crtc *acrtc);
 
 bool amdgpu_dm_crtc_vrr_active(const struct dm_crtc_state *dm_state);
 
-int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc);
-
-void amdgpu_dm_crtc_disable_vblank(struct drm_crtc *crtc);
-
 int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			struct drm_plane *plane,
 			uint32_t link_index);
-- 
2.52.0

