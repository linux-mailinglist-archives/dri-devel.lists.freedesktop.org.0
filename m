Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKavKLUXnmmcTQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D5C18CBE6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632AA10E622;
	Tue, 24 Feb 2026 21:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pfd2qCd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011024.outbound.protection.outlook.com
 [40.93.194.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D88F10E621;
 Tue, 24 Feb 2026 21:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNTnBZxtSIog9yO/3+WywT3sRjdVztHWo7Rvt1CJ2h8IFojIaa9WXWzgp2YMDnkig+JRRFSjd3RhwjH5/IFK3sNRn7iBueU6n74H8bhtgwe3idTcbDkiODXgMi8VPvwuwuC8ugRE2YYwYmoT1IrfKcoZPZ3iOth+BWeo8C+X1Dfci5Lj2+b/6/y7VtUBIbIAVt5umRaMNyL7Xsdd/L/cAsVVJ1UDYFzwbdaWSpEEKu8JqeZJJJYIqIbdCqcCir4VVOadENWwtBcnOXnHGXbgUjTIR4eQ1CSsPxJLLzQX97cPmseZg7qGI7opvfakB+aeAZmWW4UIsfibuCFA+kXRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDtE+6TWauy29w+ivpBO5J5JVU5CmX15dW7d+6y3nns=;
 b=VEzBdQ1WjlrDjm3AkHQriM9FjYhsN9xn3BS9BzW1J/Tdl9lyRRK4YxnjZKo7rpvfxMEzvgjSTC8tm3e6E9QP9jeH5YmwyOLxzUZnlQvZWZMHr+QPuQaoxwrXndmiG83QIVfc6MHFi3anK4Ri1EJmOy6tGwKTHIAMWkS3FUC4H11AsWTYEvbE+tKggiw4cdq3uErwRdLONyQK7IR11HX5jp1vx3wUhwwk9sWJqqtiaWX2S3gJthLGuLSciezLNAprWGwUBim6yyVDGltACFC2pxKhmcr8ew1cdI5oOYAPPQly8HyZj4eHrEFeqosFTyS8o8+GbCv9yv7mzvrWiDhnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDtE+6TWauy29w+ivpBO5J5JVU5CmX15dW7d+6y3nns=;
 b=Pfd2qCd5J1SBHyFKWKOcQjRmJbNXKRO/X5FzAzCvHDis2XYr4tCiN3puqpgSq0jNMKrhsZjjqommkIjOdRRi5IuIduajF/L26J2m9LW5o1gpy3Nm4RMOwkaCErF86slIudsXgpQDX6PeUbFV+UvljMqVLaCn6PSsWexgErniMVU=
Received: from MN0P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::32)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:27:00 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::92) by MN0P221CA0020.outlook.office365.com
 (2603:10b6:208:52a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 21:26:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:26:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 24 Feb
 2026 15:26:59 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Feb
 2026 15:26:58 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 24 Feb 2026 15:26:58 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 2/5] drm/vblank: Introduce deferred vblank enable/disable
Date: Tue, 24 Feb 2026 16:26:36 -0500
Message-ID: <20260224212639.390768-3-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224212639.390768-1-sunpeng.li@amd.com>
References: <20260224212639.390768-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 37515373-1da6-4f54-a350-08de73eb71ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vdsd6i2wnFP6uizx18NGYSSBvKakv5ahir0M7/eF0ZLG7kFsGw4oFyJRWE45?=
 =?us-ascii?Q?lvU32FfjJzw3xEiYqfR3GTE8facLODuYi55PtcQighE0AnR8zgynWO/fHh0U?=
 =?us-ascii?Q?bERY3sqIEaTKEGAbot/gzGxKd+QSoPnd8LodnASIhFsmgb4eMD9bUjkxc7RT?=
 =?us-ascii?Q?OGJdWqPeBL5Dj/L4Xv5AHAjlUD2rwPlhqz8R4hvOgJSQvyTQ7fjrEPpUIx47?=
 =?us-ascii?Q?JITNMuM7tJjOxpC7Q1+2PIxKcVngiDP4QotyHpN/oQeXhvWIG9oomiNEjLcD?=
 =?us-ascii?Q?+3rKKb4PoIv2BCWCNoCK9ZDA0QlnJwyFHME/bID9PKJVpWTOVexZrndOfu8Q?=
 =?us-ascii?Q?6ZY+E7ZsGduyZHeVULYBrGnmwO5ZlUNXJDbG9k+aMwWgEAZiPa2V8C9C+CZn?=
 =?us-ascii?Q?0MUDVYxFiGoVcxYaOQjuJQZ6y3SrBXPvo03YyqWjpaW4BjN5Kobjz+ri7xc5?=
 =?us-ascii?Q?v7xjBa41ldJQmk6JO0z76RAwSVKbwUYY1GHbGPg6LMmVKrq2bXlKZIgTKN5i?=
 =?us-ascii?Q?F35ecnXRQbnVFe7nmU15tixVer9FP2+KgbuKsrPpsr8WZfSSCZhwHbNYG+7B?=
 =?us-ascii?Q?xIYe8GkNDYPrfuhfjZCVsTkx/rZxjX6BbFu2NvgPMXXmLjijjEWO72OtR+p4?=
 =?us-ascii?Q?oKlR39PvldS3QSKBftgNKNA/6ZtXWVEHju8it28sPJ1fc3Rxu8klupcEhe0l?=
 =?us-ascii?Q?ISd0vyUkF6Pw1qv4pp5gQGca3N2iGR2J/vv/NuFX8dYMWG2UYlNMCf/LEdsx?=
 =?us-ascii?Q?mpZ48vD9USaLWHbPnsjXMUxw+xdTNlzWaBWbRGx1G1PRYOMYajZMFtrpXEkp?=
 =?us-ascii?Q?z8VT/xXGwEcFjwiJA6hsCNiVoxq/8/rq6g+8hr5g9o7HNMY+EAQbZUVpmjkS?=
 =?us-ascii?Q?J3EIILBlOieJDO+7MDD42vldsGce48r6xgiIGxCLZRlwdnt9YwO88EtTx9WZ?=
 =?us-ascii?Q?Zx32kmcUHxSnlfH2PnUAawjG//PSgWZT7q4XDsIzMTcQe7pwKFOUXacpSa+Z?=
 =?us-ascii?Q?5iDvMKVlFa4fD9Kd4D2On+5h6T+bujlS7uaU2dqAskdr1ddJ2PMJ75ZuXj8I?=
 =?us-ascii?Q?3pFui/angVlyJ9wni5AQ0PgXtlfH/m7zSYlXWKyZVFX6aSGDFMsCnmyTSKxF?=
 =?us-ascii?Q?bJQ7Gd7JVuBPlg89XpT0lmMC7Zph60j5PfhHUWjbg5mLfuzeeB8coXMTo5Ji?=
 =?us-ascii?Q?mGOewAbMSGjD08Itqxrr1fFSuQFpLFBQQmHEaCCCyaukDvmjADOD0gMoar0m?=
 =?us-ascii?Q?RC0MyJgMXXp0E1okhvsEREIUtuW7IlyXUW8T3wS3viHVdVV8tGnrpyzjtEOy?=
 =?us-ascii?Q?yrX7ArnaHfX151bYXZimLClgz0GpYsKn1gIDO5JYrikkUu61qftAPKWf9+VT?=
 =?us-ascii?Q?3ExscG07AgD39VoH3QhLD/KvQYQM6JvKdTolkP9OGksQOG7bi/Jvb+88ieQc?=
 =?us-ascii?Q?AyxrRfYoNDo+Wttkp051lUq+zvfKLsduiWCQ69T451f+gOxZXzlM0y4w2uCd?=
 =?us-ascii?Q?w0d8GBvZXhbEeuH8i9eBV49HTCn9E66DYAABCvdRAn0lJ7PSDDFMbsVldjwo?=
 =?us-ascii?Q?oDy6pOI257x+dmkwoLi5Wj9tW5HauZ1fqe/WBkB93u+ODRGUjXTIY1be2OJ3?=
 =?us-ascii?Q?Ze5UH58d5R4yI2Fmq8Xl0FUfyIIW5na3H4qAmuMxReE9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0Xz8D7YL2ciZgVCf0D2BVyFWKq5jEwhJ4lRZOpSkzs8smuITbCxX4elQ+mWqaHGZBhmirWBn0BVeeA4Hicorme572+uqqYgxCc6T7fMP9vCHdDEeVo238Fh2iAHxANDMr3dwMhAc69cChtei4E0umhgjfmsWDo2NyoOcayEdCOBZ/PKQED+xTaz5ixrEoakn43AVHrItSvrkuBB5A5LuZFzUSWfmOHHMqdsjHeX5wmbBsPX0zNqOpWDflGmseyDgfRF/nG4Luz7Ra1Fe5uKrUsAn85gUZ5r4FmHFbw7Dl2YIX3Vpr10xPDZGYPUHvdLvVXAgBcXgspM2cNiLut+A5Uy9q0STwt6f1DRzJcUESb7Fl2kozstzGC4c0K0QeJvjaFUXtNJDu599e2gPbmobDVVN5fzEZPaRugROd281VD/jjAyX0j1cm0V+a30qSk8T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:26:59.4438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37515373-1da6-4f54-a350-08de73eb71ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 52D5C18CBE6
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

Some drivers need to do blocking work as part of enabling/disabling
their vblank reporting mechanism in hardware(HW). Acquiring a mutex, for
example. However, the driver callbacks can be called from atomic
context, and therefore cannot block.

One solution is to have drivers defer their blocking work from their
enable/disable callbacks However, it can introduce concurrency between
the deferred work, and access to HW upon the callback's return. For
example, see drm_vblank_enable()'s call to drm_update_vblank_count()
that reads the HW vblank counter and scanout position immediately after
the driver callback returns. If the underlying HW remains accessible
when vblanks are disabled, then this wouldn't be an issue, but that's
not always the case.

This patch introduces a new per-device workqueue for deferring
drm_vblank_enable/disable_and_save(). Drivers can advertise their need
for deferred vblank by implementing the new
&drm_crtc_funcs->(pre|post)_(enable|disable)_vblank() callbacks, in
which they can do blocking work. DRM vblank will only defer if one or
more of these callbacks are implemented. Otherwise, the existing
non-deferred path will be used.

With deferred vblank enable, it is still possible that HW vblanks are
not ready by the time drm_vblank_get() returns. In cases where the
caller wants to ensure that vblank counts will increment (e.g. for
waiting on a specific vblank), this shouldn't be an issue: HW vblanks
will be enabled eventually, and the counter will progress (albeit with
some additional delay). But if the caller requires HW to be enabled upon
return (e.g. programming something that depends on HW being active), a
new drm_crtc_vblank_wait_deferred_enable() helper is provided. Drivers
can use it to wait for the enable work to complete before proceeding.

The &drm_crtc_funcs->(pre|post)_(enable|disable)_vblank() are also
inserted into drm_vblank_on and off(), as they call
drm_vblank_enable/disable(). I don't see a case where they're called
from atomic context, hence why they're not deferred. If that turns out
to be wrong (for a driver that needs to defer), we can change
enable/disable to be deferred there as well.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/drm_drv.c    |   5 +
 drivers/gpu/drm/drm_vblank.c | 188 +++++++++++++++++++++++++++++++++--
 include/drm/drm_crtc.h       |  34 +++++++
 include/drm/drm_device.h     |   6 ++
 include/drm/drm_vblank.h     |  20 ++++
 5 files changed, 242 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce8..84884231f1f0e 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -696,6 +696,11 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->master_mutex);
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
+
+	if (dev->deferred_vblank_wq) {
+		flush_workqueue(dev->deferred_vblank_wq);
+		destroy_workqueue(dev->deferred_vblank_wq);
+	}
 }
 
 static int drm_dev_init(struct drm_device *dev,
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 983c131b23694..db17800f58e03 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -127,8 +127,11 @@
  * maintains a vertical blanking use count to ensure that the interrupts are not
  * disabled while a user still needs them. To increment the use count, drivers
  * call drm_crtc_vblank_get() and release the vblank reference again with
- * drm_crtc_vblank_put(). In between these two calls vblank interrupts are
- * guaranteed to be enabled.
+ * drm_crtc_vblank_put(). If drivers do not implement the deferred vblank
+ * callbacks (see &drm_crtc_funcs.pre_enable_vblank and related callbacks), in
+ * between these two calls vblank interrupts are guaranteed to be enabled.
+ * Otherwise, drivers have to wait for deferred enable via
+ * drm_crtc_vblank_wait_deferred_enable() in-between get() and put().
  *
  * On many hardware disabling the vblank interrupt cannot be done in a race-free
  * manner, see &drm_vblank_crtc_config.disable_immediate and
@@ -524,6 +527,9 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
 	timer_delete_sync(&vblank->disable_timer);
 }
 
+static void drm_vblank_deferred_enable_worker(struct work_struct *work);
+static void drm_vblank_deferred_disable_worker(struct work_struct *work);
+
 /**
  * drm_vblank_init - initialize vblank support
  * @dev: DRM device
@@ -548,6 +554,12 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 	if (!dev->vblank)
 		return -ENOMEM;
 
+	dev->deferred_vblank_wq = alloc_workqueue("drm_vblank_deferred_wq",
+						  WQ_HIGHPRI | WQ_UNBOUND,
+						  0);
+	if (!dev->deferred_vblank_wq)
+		return -ENOMEM;
+
 	dev->num_crtcs = num_crtcs;
 
 	for (i = 0; i < num_crtcs; i++) {
@@ -567,6 +579,16 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 		ret = drm_vblank_worker_init(vblank);
 		if (ret)
 			return ret;
+
+		INIT_WORK(&vblank->enable_work,
+			  drm_vblank_deferred_enable_worker);
+		INIT_DELAYED_WORK(&vblank->disable_work,
+				  drm_vblank_deferred_disable_worker);
+
+		init_completion(&vblank->enable_done);
+		/* Initialize in the completed state, the first deferred vblank
+		 * enable will reinitialize this. */
+		complete_all(&vblank->enable_done);
 	}
 
 	return 0;
@@ -595,6 +617,29 @@ bool drm_dev_has_vblank(const struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_has_vblank);
 
+/**
+ * drm_crtc_needs_deferred_vblank - If crtc needs deferred vblank enable/disable
+ * @crtc: which CRTC to check
+ *
+ * If the driver implements any of the pre/post enable/disable vblank hooks
+ * where blocking work can be done, then vblank enable/disable need to be
+ * deferred.
+ *
+ * Returns:
+ * True if vblank enable/disable needs to be deferred, false otherwise.
+ */
+static bool drm_crtc_needs_deferred_vblank(const struct drm_crtc *crtc)
+{
+	const struct drm_crtc_funcs *funcs;
+
+	if (!crtc)
+		return false;
+
+	funcs = crtc->funcs;
+	return (funcs->pre_enable_vblank || funcs->post_enable_vblank ||
+		funcs->pre_disable_vblank || funcs->post_disable_vblank);
+}
+
 /**
  * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
  * @crtc: which CRTC's vblank waitqueue to retrieve
@@ -1208,10 +1253,88 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 	return ret;
 }
 
+static void drm_vblank_deferred_enable_worker(struct work_struct *work)
+{
+	struct drm_vblank_crtc *vblank =
+		container_of(work, struct drm_vblank_crtc, enable_work);
+	struct drm_device *dev = vblank->dev;
+	struct drm_crtc *crtc = drm_crtc_from_index(dev, vblank->pipe);
+	unsigned long irqflags;
+	int ret;
+
+	if (drm_WARN_ON(dev, !crtc))
+		return;
+
+	if (crtc->funcs->pre_enable_vblank)
+		crtc->funcs->pre_enable_vblank(crtc);
+
+	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+
+	/* Deferred enable should not error */
+	ret = drm_vblank_enable(dev, vblank->pipe);
+	drm_WARN(dev, ret, "CRTC-%d deferred vblank enable failed with %d\n",
+		 crtc->index, ret);
+	/* Deferred enable completed */
+	complete_all(&vblank->enable_done);
+
+	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+
+	if (crtc->funcs->post_enable_vblank)
+		crtc->funcs->post_enable_vblank(crtc);
+}
+
+static void drm_vblank_deferred_disable_worker(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct drm_vblank_crtc *vblank =
+		container_of(dwork, struct drm_vblank_crtc, disable_work);
+	struct drm_device *dev = vblank->dev;
+	struct drm_crtc *crtc = drm_crtc_from_index(dev, vblank->pipe);
+
+	if (drm_WARN_ON(dev, !crtc))
+		return;
+
+	if (crtc->funcs->pre_disable_vblank)
+		crtc->funcs->pre_disable_vblank(crtc);
+
+	vblank_disable_fn(&vblank->disable_timer);
+
+	if (crtc->funcs->post_disable_vblank)
+		crtc->funcs->post_disable_vblank(crtc);
+}
+
+/**
+ * drm_crtc_vblank_wait_deferred_enable - wait for deferred enable to complete
+ *
+ * @crtc: the CRTC to wait on
+ *
+ * After vblank_get() queues a vblank_enable() worker, wait for the worker to
+ * complete the enable. Drivers that defer vblank enable and use this to wait on
+ * HW vblank enable before continuing with programming that might race with it.
+ *
+ * If the CRTC does not need deferred enable, this function does nothing.
+ *
+ * Can block, and therefore must be called from process context.
+ */
+void drm_crtc_vblank_wait_deferred_enable(struct drm_crtc *crtc)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	if (!drm_crtc_needs_deferred_vblank(crtc))
+		return;
+
+	if (!wait_for_completion_timeout(&vblank->enable_done,
+	    msecs_to_jiffies(1000)))
+		drm_err(crtc->dev, "CRTC-%d: Timed out waiting for deferred vblank enable\n",
+			 drm_crtc_index(crtc));
+}
+EXPORT_SYMBOL(drm_crtc_vblank_wait_deferred_enable);
+
 int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	unsigned long irqflags;
+	bool needs_deferred_enable;
 	int ret = 0;
 
 	if (!drm_dev_has_vblank(dev))
@@ -1220,12 +1343,21 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return -EINVAL;
 
+	needs_deferred_enable =
+		drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
+
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	/* Going from 0->1 means we have to enable interrupts again */
 	if (atomic_add_return(1, &vblank->refcount) == 1) {
-		ret = drm_vblank_enable(dev, pipe);
+		if (needs_deferred_enable) {
+			/* Arm completion before queueing deferred enable */
+			reinit_completion(&vblank->enable_done);
+			queue_work(dev->deferred_vblank_wq, &vblank->enable_work);
+		} else {
+			ret = drm_vblank_enable(dev, pipe);
+		}
 	} else {
-		if (!vblank->enabled) {
+		if ((!needs_deferred_enable && !vblank->enabled)) {
 			atomic_dec(&vblank->refcount);
 			ret = -EINVAL;
 		}
@@ -1255,6 +1387,7 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int vblank_offdelay = vblank->config.offdelay_ms;
+	bool needs_deferred_disable;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
@@ -1262,13 +1395,28 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
 		return;
 
+	needs_deferred_disable =
+		drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
+
 	/* Last user schedules interrupt disable */
-	if (atomic_dec_and_test(&vblank->refcount)) {
-		if (!vblank_offdelay)
-			return;
-		else if (vblank_offdelay < 0)
+	if (!atomic_dec_and_test(&vblank->refcount))
+		return;
+
+	if (!vblank_offdelay)
+		return;
+	else if (vblank_offdelay < 0) {
+		if (needs_deferred_disable)
+			mod_delayed_work(dev->deferred_vblank_wq,
+					 &vblank->disable_work,
+					 0);
+		else
 			vblank_disable_fn(&vblank->disable_timer);
-		else if (!vblank->config.disable_immediate)
+	} else if (!vblank->config.disable_immediate) {
+		if (needs_deferred_disable)
+			mod_delayed_work(dev->deferred_vblank_wq,
+					 &vblank->disable_work,
+					 msecs_to_jiffies(vblank_offdelay));
+		else
 			mod_timer(&vblank->disable_timer,
 				  jiffies + ((vblank_offdelay * HZ) / 1000));
 	}
@@ -1348,6 +1496,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
+	if (crtc->funcs->pre_disable_vblank)
+		crtc->funcs->pre_disable_vblank(crtc);
+
 	/*
 	 * Grab event_lock early to prevent vblank work from being scheduled
 	 * while we're in the middle of shutting down vblank interrupts
@@ -1394,6 +1545,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 
 	spin_unlock_irq(&dev->event_lock);
 
+	if (crtc->funcs->post_disable_vblank)
+		crtc->funcs->post_disable_vblank(crtc);
+
 	/* Will be reset by the modeset helpers when re-enabling the crtc by
 	 * calling drm_calc_timestamping_constants(). */
 	vblank->hwmode.crtc_clock = 0;
@@ -1489,6 +1643,9 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
+	if (crtc->funcs->pre_enable_vblank)
+		crtc->funcs->pre_enable_vblank(crtc);
+
 	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
@@ -1510,6 +1667,9 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
 		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
 	spin_unlock_irq(&dev->vbl_lock);
+
+	if (crtc->funcs->post_enable_vblank)
+		crtc->funcs->post_enable_vblank(crtc);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_on_config);
 
@@ -1962,8 +2122,14 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
 
-	if (disable_irq)
-		vblank_disable_fn(&vblank->disable_timer);
+	if (disable_irq) {
+		if (drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe)))
+			mod_delayed_work(dev->deferred_vblank_wq,
+					 &vblank->disable_work,
+					 0);
+		else
+			vblank_disable_fn(&vblank->disable_timer);
+	}
 
 	return true;
 }
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd68..1088b63b64816 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -892,6 +892,40 @@ struct drm_crtc_funcs {
 	 */
 	void (*disable_vblank)(struct drm_crtc *crtc);
 
+	/**
+	 * @pre_enable_vblank:
+	 *
+	 * Optional callback to do blocking work prior to vblank_enable(). If
+	 * set, vblank enable/disable will be deferred to a single-threaded
+	 * worker.
+	 */
+	void (*pre_enable_vblank)(struct drm_crtc *crtc);
+
+	/**
+	 * @post_enable_vblank:
+	 *
+	 * Optional callback to do blocking work after vblank_enable(). If set,
+	 * vblank enable/disable will be deferred to a single-threaded worker.
+	 */
+	void (*post_enable_vblank)(struct drm_crtc *crtc);
+
+	/**
+	 * @pre_disable_vblank:
+	 *
+	 * Optional callback to do blocking work prior to vblank_disable(). If
+	 * set, vblank enable/disable will be deferred to a single-threaded
+	 * worker.
+	 */
+	void (*pre_disable_vblank)(struct drm_crtc *crtc);
+
+	/**
+	 * @post_disable_vblank:
+	 *
+	 * Optional callback to do blocking work after vblank_disable(). If set,
+	 * vblank enable/disable will be deferred to a single-threaded worker.
+	 */
+	void (*post_disable_vblank)(struct drm_crtc *crtc);
+
 	/**
 	 * @get_vblank_timestamp:
 	 *
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bc78fb77cc279..c0e22f8d868b2 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -333,6 +333,12 @@ struct drm_device {
 	 */
 	spinlock_t event_lock;
 
+	/**
+	 * @deferred_vblank_wq: Workqueue used for deferred vblank
+	 * enable/disable work.
+	 */
+	struct workqueue_struct *deferred_vblank_wq;
+
 	/** @num_crtcs: Number of CRTCs on this device */
 	unsigned int num_crtcs;
 
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 2fcef9c0f5b1b..6bd3cbf1bb831 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -282,6 +282,25 @@ struct drm_vblank_crtc {
 	 * @vblank_timer: Holds the state of the vblank timer
 	 */
 	struct drm_vblank_crtc_timer vblank_timer;
+
+	/**
+	 * @enable_work: Deferred enable work for this vblank CRTC
+	 */
+	struct work_struct enable_work;
+
+	/**
+	 * @disable_work: Delayed disable work for this vblank CRTC
+	 */
+	struct delayed_work disable_work;
+
+	/**
+	 * @enable_done: Signals completion of deferred vblank enable
+	 *
+	 * If deferred enable work is needed, it is reinitialized before
+	 * queueing the enable worker, and completed after the deferred
+	 * drm_vblank_enable() completes.
+	 */
+	struct completion enable_done;
 };
 
 struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
@@ -302,6 +321,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
+void drm_crtc_vblank_wait_deferred_enable(struct drm_crtc *crtc);
 int drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
-- 
2.52.0

