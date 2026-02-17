Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBU5Dl7BlGkwHgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:28:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4C14FA71
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1D010E02D;
	Tue, 17 Feb 2026 19:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lX2riNI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5370610E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 19:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqFD4IxN/FfxxyVif3ftPKkESyXPy2hgFx/kRhTn0E8zaG6YN9CfSL/LgGccZu6SR/TZ0wbgJ9natUQknSVHW+7CRwJn5lvL/hPx+sZD3lN8uENPjoormiY/ATiwRmmcBHGEeejvCeXOffBt+RSdOgwyrT9mE0QkLlcgpKf+yTGHekZTW6SE7mNau1pjiAK1avo0lj79qxXg+r6/pUsJD/nzpAKzSkfcWpwy4S59fSMcS1/WfgRBvvsH510TH1frEaoLrSujhFGhqeh2mAJ9GDYJL9Tzgxpxk6NTJGTsswrSzaROzROkD9LqRSEiIK45+aTAJFGkktZ90Fo8eZDBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fH0VDSYo/EOQjeIUO9JjnY7Ajf+NUxPU+OvZvABL98=;
 b=DoHOCNebysYluCCTqrVb9QOy49LaKX/lX2vFsDEO1ctE2Zh/CZcuGIu6uniAjlKSN9heAw5ClNm+1sKhoNSabMRL63BdwxY7McCTf73DHB45HMwD0pMJmf0iDZ1XPq2xOUgh7tA1VAYUoLhxape9OINwPHh/jaz/kEgWJYTKEgVcZUDSDOL+G2wk28uFN3w6S8LKRNQYNAHDksR7hb7zwiJfDu9+RIPkAZrUQ55koajTRocuPgvXGwWLhFslp9oUR2IY82irjduQpjd4W7yaFwXBtAYsyEt/LJDtoXIvLP6JO/JjmqpkfucZ1ZlxWqrS4Kdz08TI3qcum1AF2rJ2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fH0VDSYo/EOQjeIUO9JjnY7Ajf+NUxPU+OvZvABL98=;
 b=lX2riNI2uLqCO16fZY9zAedLpj+nnr5M4e6ELJb31O6cbE0RyKR68LqQOjFXy95RjJRgcX11qUMOl3ASBvenZUb9Qt0V8ldS0vykZP8WTgoM9bDdGm+0t1RvV+0N8zvMp3zE22rJeX1SDGwhI0EYdi1bs3wXaAABoFtwOyXX+Yw=
Received: from SJ0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:a03:39c::9)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 19:28:18 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::b0) by SJ0PR03CA0334.outlook.office365.com
 (2603:10b6:a03:39c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 19:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 19:28:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Feb
 2026 13:28:17 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Feb 2026 13:28:17 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Prevent ubuf size overflow
Date: Tue, 17 Feb 2026 11:28:15 -0800
Message-ID: <20260217192815.1784689-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 4410bed0-4b40-44ba-0afd-08de6e5ab483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+elcOLa5csj1eFfYhGLpx6h3poscI7ISaYTPHl4HcuHw8/EjW/J0FL6OTJ7k?=
 =?us-ascii?Q?RYouabIPMQisrDmuF88X2S0qYQrU2s/vOwVwocoDCiAuJQR32SvzFnlHYQSf?=
 =?us-ascii?Q?aRW/KutAvXFgg0plpxLRhUgLrFmoRMAqIp8x6OCAclm5D/EK4ghm+rbQpHHQ?=
 =?us-ascii?Q?e8D/AJkXLJw48OwD1EuOPDJDqB3Qn2LxFdVam4t2rV9+ArxZaWjz/8I50znp?=
 =?us-ascii?Q?VLxGEmjVy9FQAYIlnUY6SBhMtTlUFfabz8+z8riL1qWnzAoRlFsU8+kyvRpr?=
 =?us-ascii?Q?+nfdczdHKqoi/QCPxjEkoDM2JhMfS/RtZa5R6MLD2WIOIWHElGyA6LxdS+An?=
 =?us-ascii?Q?f5hnshVgO4ZvZ1RpxosJUnNoPwYFTcUbojoPJ14aThcfxMUvoyMAOUk3BVKf?=
 =?us-ascii?Q?PFBR8MLUW2JjCbW32F179LC/gexS6pIEh9wZu0NKBaB7fkX3yeY4ybxmWRNh?=
 =?us-ascii?Q?Y5AJy4cpeeoAhyGJ3rKmdsjxIIGi4jQUJcc7KUiNTsJHxlwJkumVdFePOfmC?=
 =?us-ascii?Q?bbBEbhEAy3zzQC4rERTAEan8LpcWwHwGrFPObxn5R5acDvhEgavFFQ0HbraZ?=
 =?us-ascii?Q?Tjk5Urw4ZOlp1xSEJEwOc64cQ5NsaV9z9DWFEmLoFkhMK1RLlIEi7dghu9Pr?=
 =?us-ascii?Q?lBAWw+ezuXoa+Se+cdm2cYIEatbxobDoBrto6TBr1LDEnR+pTHz2ZNxJIix9?=
 =?us-ascii?Q?Any4oxFGaCumd4cuxqRFvaNqhRfZZWI0etioj36MhWIAyhtiHpee1VPFJNny?=
 =?us-ascii?Q?jxFFi6xueJOpcy59LXLWd2KmORH9cnGP4mv9vlEkjSuq/shlg/DEJQ6mqrjS?=
 =?us-ascii?Q?1jXlisrfiW4K63CWVGAVYe0Bv6k2bD1H7nq6ymrhHkGOZ61/P6slmmnt9QJa?=
 =?us-ascii?Q?nPetc0vVUSHqqJJrIzKEMJQ0rJHp1bll6LdrZp4k5Zp2qiyJ/WNN3JQCvQGi?=
 =?us-ascii?Q?Hpq7371aqQeheyvXqRBRjj934YM/xLVfDA7Oexw/zpBSfYUi3lh6mxsBIrc0?=
 =?us-ascii?Q?1TNzJXACXcN1IQxfGjOIfHYsdFbtzlHZT3GSHudL0faCxg21wwtflq2XczYK?=
 =?us-ascii?Q?QWfWR4XQEeJjqM8M3b87da5+pdVnt3bWbDJZ1u/STltgRnNow2W84MQNdPkP?=
 =?us-ascii?Q?ikxM4oTkBfX3Vz0jti2+e1WZN4w2Q1vWdCDu7KBxkaRqCMN303ZEbQdCf1Lt?=
 =?us-ascii?Q?NksBnw+O6SFmUSwS/Y8BnqKKgvQeSMu9Xqn/h4STyiMNwjHnBUkmr1ryv7Nq?=
 =?us-ascii?Q?Rd40Lp9U0nNRmY6vqMep3yAG3UkEeScPugmRYbGHFaOtZmWtTlDGUAO6byxR?=
 =?us-ascii?Q?vDMs31O6LMLlLojmk9ijBU4lfxcBFfj64ljXWcYrBqV76swOwAjDaMezmle6?=
 =?us-ascii?Q?+F3yqggs7b09USGxRb3pePFn4E1JDff/FehlylQUradxPRPcG1VwFqskvOeX?=
 =?us-ascii?Q?o5kSOorZi0vkV1Euu6C8gtMobjwItyyj5C7b7kTTo2p9w62PbWjYKUO5kPhG?=
 =?us-ascii?Q?gN6tQ4IU92wyX50GpziPr5tUE0lXcDY0kgDvKmT/90pOCMvzooGFid+ntOA1?=
 =?us-ascii?Q?9g7NcUE2+JtEtuNE8wDM37BxkkFXwnRtOLm7/R3SjYte7QnDv2rehwHNJBRZ?=
 =?us-ascii?Q?dPzalduv0JE912KXXq1QMpNdV4q9rCgFEIZpIr0cZrSRVOAC8PEIPxOsvYpu?=
 =?us-ascii?Q?mrpkZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ARR0uLg1iORcbbGu5v1jc0/jZfIPmrghsDHKzKlSbNh6ricR87upsbClrNg9W32T/3IYdt82SXN0J8FKadW2tYy2ovExCeH3HAUKMc/EdI1n6RnKIOSPqExwrCGmJ3WNrU1YXCiWaCPWWlKpq56SiXiNlYgCVb7si5iqQi0/3OmyKUfQdHOFseNh4gIKHkaYzASyETMCCpu5Yz2cnn/Yc1Uu2upiPRHWuJNUHTJ0BJGFVKdojA9SoXrjE5FsEl6/z4kCmaLJh88CfDMo2K51OaAXXa/sgQlktMNnfStBFG+P+boL/roBsX7X104M1ooIzhZw0z083c4HVQDkBH1zcrfbZ4SVil8zFm+xNgWmE2cIZD0wQHCYEcjk8i3gV8EP7/QnAHbNv6mIdQc50GX5fIHGemILTbJ69FBLdSPI4vriHMnsXxt6MxlvpMhja7Dv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 19:28:18.6952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4410bed0-4b40-44ba-0afd-08de6e5ab483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74D4C14FA71
X-Rspamd-Action: no action

The ubuf size calculation may overflow, resulting in an undersized
allocation and possible memory corruption.

Use check_add_overflow() helpers to validate the size calculation before
allocation.

Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_ubuf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
index 9e3b3b055caa..62a478f6b45f 100644
--- a/drivers/accel/amdxdna/amdxdna_ubuf.c
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
@@ -7,6 +7,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
 #include <linux/dma-buf.h>
+#include <linux/overflow.h>
 #include <linux/pagemap.h>
 #include <linux/vmalloc.h>
 
@@ -176,7 +177,10 @@ struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
 			goto free_ent;
 		}
 
-		exp_info.size += va_ent[i].len;
+		if (check_add_overflow(exp_info.size, va_ent[i].len, &exp_info.size)) {
+			ret = -EINVAL;
+			goto free_ent;
+		}
 	}
 
 	ubuf->nr_pages = exp_info.size >> PAGE_SHIFT;
-- 
2.34.1

