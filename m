Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C49022AB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 15:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE3610E26D;
	Mon, 10 Jun 2024 13:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dGFbeu1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD3410E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 13:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPThnPHXiyD4rQTP9LXCdNmFP4CcoEdY4bqrJLR3R9Ep1D/UAm/tqyejITEaVsMSGo3w9mvpMqrW+wlLErSQb676kVwwKg4HkUh5WMbRlgh7jH8jtO12VaV1OkTmEPp/En6h1XbaK0zhzm3slkOLEomroMyyFTNeSEQoHsYXUwKUJubbE+8iGtDw0SPaGnPrdfaQFjsVf+/jUx/JDfaeRufqugLJE59yXOBSkHLqsznbWVAT18/I0cE3T2B0wmSTqt3rNc+2dTdiS7csQx/PuWMUnZmW3SP3lH6xyjbMuZiF8aGn+DXLXKr1q1N4iQmyeYYaS8UttD9TadCsfO+cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5jjL2nkC/J+3hwvcjLHk4K7DLKJJXc/Lfbemc4YRqc=;
 b=Ky2z1ljqnrYB6YExhtD6DHkhAhKCHwDmPUpBzKe68RU0Tsz71BkHMfO93GN3xwyvSEreNHL4/eEYgYmkdKbXEUZDd2M7wjquyF2ZAj943Uop1K+xdNPNeT/q++c7Y7nKtioTyJOj9uKtUyk2ouKMfaaLxyJ4WZ/9ogCkAViZwS0ibvQRvP9t9u2rcBd9OTTRY/b17soZDAv1CuAXZo73fcvllGNu7/XlqYJGNBFIiOYaVtWwF2YyYbskjo6fJXTJ/+XL1alhYKoWaYPERm113sxvph7qyTYrCKAhCDakMqpW+LoTELo1yeHnQCcmPhqk4RAQsLhgREcPkjFbiW8hFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5jjL2nkC/J+3hwvcjLHk4K7DLKJJXc/Lfbemc4YRqc=;
 b=dGFbeu1O7veCtAs+VlUwQt1Mt3htYCRAlDaheN0fMpgCtxvTLmh3jtmB3X2UvPdbx8BJvqTFfA8kZq9OVI382kK6WMCqOJSwytHPo8V+rnNvp7IsSF39UZEg/cDBuP3BOxcd9JbadcUp/qQ+oasQ2Vl69FsxMy5n+56cpx8tVBo=
Received: from BN7PR02CA0033.namprd02.prod.outlook.com (2603:10b6:408:20::46)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 13:27:54 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:20:cafe::7f) by BN7PR02CA0033.outlook.office365.com
 (2603:10b6:408:20::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Mon, 10 Jun 2024 13:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 13:27:53 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Jun
 2024 08:27:50 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v4 1/3] drm/sched: add device name to the
 drm_sched_process_job event
Date: Mon, 10 Jun 2024 15:26:54 +0200
Message-ID: <20240610132707.61404-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c1bda4-a7d8-47d8-58e8-08dc89512240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|7416005|1800799015|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gl0TerqKJw0oKYLFDMNaEI+8/oRCcrYZuu5Hlw5eMcEf8SUZ6k6xUq5uV6wu?=
 =?us-ascii?Q?buN+AnbGOtmnjYNcGVH8eNZerNxRQYL6+TqXLB1foW0yuCcmRxJmqM0LIIqr?=
 =?us-ascii?Q?tnP+2TYghia6aAxKLGbgir6wb4eLvyQWQgHDBvrNWbm6m5KL9Wgpc72qHIaY?=
 =?us-ascii?Q?M9FQa9kfD98Igbz0qvV8fDJJj1EKsHVvCqGOnm0uPsyeyV5NaqfFWs0dhgej?=
 =?us-ascii?Q?c2pazWPdsZ46hqMNVZY0ON2d9sVZDRzZ5pgx/3RABKV3qvGOtKHHZo774uOE?=
 =?us-ascii?Q?yuTa7PFkoYvxgD0qA1T3dMSvOeay5qIC1ugodOBrSyVyXGHwH9Rj0a6wlVwP?=
 =?us-ascii?Q?/x4LKW40+wYyWnNkXJ9KPQcGvtZh44iVTsVrTNYM4D8I7nJXYfRsBY3jyEMN?=
 =?us-ascii?Q?03ViwzHVgCpFGQ6O/Ar6j4FZW7crbu7iVH2ECWFT2nFe2TbxQw+DKEr5LCcb?=
 =?us-ascii?Q?nu13ru2HdOIJvUnoo4GZFy3vGZljyTH7iwasMs9IvK4ozGoRYtZz4m5/QIHW?=
 =?us-ascii?Q?3N+nrmP22jZ2upmcXwD+LXGCWAUK2ZaWE1oo6p4eG8NksJXdpPMzQYsBnYIi?=
 =?us-ascii?Q?9SXAOX714oOv5cfY/9KNW2TZ3zV23s9FHseoOnd5a9WsW8VaNo1lZQ0VbKHC?=
 =?us-ascii?Q?w5navt+Gl6Gn3tf63ozMXqU/nryLu/9dVivZfk8rpLW4jJNhqrp1BYrxvsf9?=
 =?us-ascii?Q?a7nP0oZPvG4BxyeJJp/f51S7E25uYfHHErU6UKQoUGuxO/t1xVYl7eI0x+tv?=
 =?us-ascii?Q?gjKfT0Ipc7Zda4nEu/YZPoxibtWlyplkSXej52bjrF316zbMYzPD9PurD5jt?=
 =?us-ascii?Q?EW/2TT9X9VS6S3+7LPrEChohnN6LI2rh4H2EJadgpOtWsw4sc0Ncc7HhhFVh?=
 =?us-ascii?Q?InRhukDCKq9jL4QVqrCFDoS2xJUKltUOFR+gkoLjzLp2+3qHS+uXguqvxjfA?=
 =?us-ascii?Q?dDn7Xi/xMYEGuWdDxrfURaKp1DUtx4O3WHgCKaCfnqiliLBtPV+cL48r4FUY?=
 =?us-ascii?Q?q4pVaOeTrHjtTPhlkOKxnLidSHSZeggvUNc8hOq4z2k4+wIBjriu7pTbksuF?=
 =?us-ascii?Q?Q4YujR/5cNxZna5wEcq4dPddHLRP3Cub/B25gWgv8akiSHOT/3thuX+oUl9Z?=
 =?us-ascii?Q?uQOl2wtDXJV9gZf0G+x+soQ+pn+907ViBYdQeh3V0wamcpa/Soy6n4L/E24+?=
 =?us-ascii?Q?UnbYux56jQK72VNhJjJVCNWWqOC/NK+/T8eu1nMazqdUHKvyDZ4ZBV4+C2p7?=
 =?us-ascii?Q?+Ml4d0Y3CelmWTovWlGx+QZOxU1k2oKBHRck590UHHcOejrT/Lrd1QJwgLiQ?=
 =?us-ascii?Q?S+zrYIVnrh7GTs0mir3oGUJQGjPxei7TxaFLAWyngw2qRcxkSpKEjP/sMAd/?=
 =?us-ascii?Q?dhLC5EMe/hajaG7gq7FiEUKm0O4d1U7nkKm8ScmN3q034rRiX2FYaB8F5PFw?=
 =?us-ascii?Q?2HQJm8eZzpo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(7416005)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 13:27:53.9141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c1bda4-a7d8-47d8-58e8-08dc89512240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938
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

Until the switch from kthread to workqueue, a userspace application could
determine the source device from the pid of the thread sending the event.

With workqueues this is not possible anymore, so the event needs to contain
the dev_name() to identify the device.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..1f9c5a884487 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			     __field(uint64_t, id)
 			     __field(u32, job_count)
 			     __field(int, hw_job_count)
+			     __string(dev, dev_name(sched_job->sched->dev))
 			     ),
 
 	    TP_fast_assign(
@@ -52,6 +53,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
 				   &sched_job->sched->credit_count);
+			   __assign_str(dev);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
@@ -64,9 +66,13 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
 	    TP_ARGS(sched_job, entity)
 );
 
-DEFINE_EVENT(drm_sched_job, drm_run_job,
+DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity)
+	    TP_ARGS(sched_job, entity),
+	    TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
+		      __get_str(dev), __entry->entity, __entry->id,
+		      __entry->fence, __get_str(name),
+		      __entry->job_count, __entry->hw_job_count)
 );
 
 TRACE_EVENT(drm_sched_process_job,
-- 
2.40.1

