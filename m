Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC04B604E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8310E308;
	Tue, 15 Feb 2022 01:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2115.outbound.protection.outlook.com [40.107.215.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DD110E122;
 Tue, 15 Feb 2022 01:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxyekOn0xd0uRDjnw1EIkkk/TVW22iJ9jUBd7X/zYE80yhB9wdYFd7p6L+jNm7o4nmMSRQUH/zzdBEy3logJYTJbDU7bPeNkTgZ5P61r6h+5cKxMD057v5KFwXbI8RPrOCvD8WAUt2hKlnYIRMWvLDcEMiDceRXW9ZfrbAMmyMwty00ADqiRz3vbP0hJPBVe70dabU+QPWuE/xcmuLVtLp5i1msrdTYAdPhOWfLCKqc/iPvYrDPpxvavHIi1liEumNlrDWhqSX6FwtuAap1/Ucy8fBH/XbA7noygUIa0LPyU8eIUZ0jhMNVu4RGnSSIk6Rcb83uuiEGlIzWCSdfCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bemy+Gq7ABlPwIU++P44NvR//lf8OkN3Np/nSYUmUPU=;
 b=BYU1E91EIYLKq2q0ugclQNVMVovtsuuVZ2TANYrpY6kGyvOVIECfhGd5udaua9M6SqJpDEAND0CEu9JFt/TaiQw8gSUXLynSC2zE/yhOZc4DhGb08doE5dIjRJsKygLzEm2I6XTCfRjy7xrufHZfYLQRa3d5b5+jXJF5ADTsu2G5Q1LNhTBECr3orzFi6qZfICYLHag2HjaMqhJ/zc7i2gfahLMbOpExDozhzJo4C0MeczAJBcpO2y+l4l47MzowVWcjOT/KLY2Y7qUgcp6i+xrlOCVd1IbLm3uNer/3/fc6YTz6e14rXYHw2Af0hAS08/0EZNUx3EdCPG0iyyM9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bemy+Gq7ABlPwIU++P44NvR//lf8OkN3Np/nSYUmUPU=;
 b=gH8/KWPf+iZDwo2egUH/t5w3xd0OppjMijYZda1yVspD77clE/jzO+F6NIPEY3uEM4mNzx+mDB+96YpDvuKNdmcvCNjzEpT2riGdpHyUVIFa9Rs6Lc2pbnMhsXmY7motHOctWjKSs3caBNvYYwfIkVRzUL6EvUVKoTx2P2n+zxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS1PR06MB2742.apcprd06.prod.outlook.com (2603:1096:803:44::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 15 Feb
 2022 01:56:19 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:19 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH V3 1/13] block: xen: use time_is_before_eq_jiffies() instead
 of open coding it
Date: Mon, 14 Feb 2022 17:55:38 -0800
Message-Id: <1644890154-64915-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb48ae59-c9b7-4af7-8709-08d9f0265c03
X-MS-TrafficTypeDiagnostic: PS1PR06MB2742:EE_
X-Microsoft-Antispam-PRVS: <PS1PR06MB27423EC36C6F9582DAF639D1BD349@PS1PR06MB2742.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehW9dcRQCl7K0OMhzYVyylPcjX6nmo4VnlZxjXHT/Hbn7cG/CjXh2qgz1JMDO7YB3r12scgWD2Bdr92pIAh42huOKciVe14TRT1jHAM7qzCJoA/wFKQaaK5lqsvkXJTOIFWhuiCSX8FigPl7Kehj9sLOnbeeBcpPY6zUwiKLs0xATy3fyWIa+1ZRBDrrkW0ePTHr/xppkjVcdb8J6oXrut22PlWGvH9hg//n0oLDMiR6H2qNe8nyXrrOZLQWWk8OC0CN+koj3CS0wCox/DACsxYBPIOyO4SYFN45QMHIASPy9o46ynzISosljwFHLGi8TTS6ZzCphElgic+aV7rMe+HWU5EeoAhKYrxuBBlwpEfOuzaDlr3atqzQEPKf7C3XBeJDNqkESpsHbXjmSY8ccp1Khac9mwM4QxJ5PMKYvRuExwa0mZVP6C6r28k+tKe1oBueGivJHpXDb0/1KElGF1QOumDv2hRZYQ1LDzHNSYulOAOFwhpt9r0N8qi+/YIyR2Ni2FcYcn+fVeYn6lQvY2bRiYdYuauWaSsk9Qelr3P+gPi1Q80ySgUi9uOuPaCMN725/O+Fx+A/Swct/igciicCB2rTc9lsL6nNysWADFTQlGZjrhRHh1eZkZPx2S9ZliVj3ZwP1fVDXV3/6n8FAd5PvSH4rPKO16xYSyNy3G8x50qsh5QHz/UYtBxSYxpmjQ1kHor1irQW4lI+j1T0kvr5EBO8w/HWg7flFW7lVeQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7406005)(66476007)(66556008)(6512007)(6506007)(6666004)(110136005)(8936002)(66946007)(508600001)(52116002)(6486002)(8676002)(316002)(86362001)(4326008)(36756003)(921005)(83380400001)(107886003)(26005)(5660300002)(7416002)(38350700002)(186003)(2616005)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q3S7zj+RBCohZ7GKUMLGIIoYe0d8605t5V57WjF7+5w8/WSiyKZSLbPBIHus?=
 =?us-ascii?Q?aRVX1K74LqbDqCEJrGGcVmakino4+ECanyPXwF5eQrINE4uehvMyV+FJbG6I?=
 =?us-ascii?Q?yUdIkz9QOd1PrU2bUKf8KGiJF9pVB5s+IZxriRzyfkeDufC4StTtp8IQres6?=
 =?us-ascii?Q?savaBhbOKzdhK64Lbv6TP7g+r/SSThIDN11w3cOgx+O9v/RaPHOCUuQsrvjy?=
 =?us-ascii?Q?aiJgxJvi51Ex0BwIuVRfkVjPMfpg+HbsH30T0qzcgIjmZziBETOhr59mciqL?=
 =?us-ascii?Q?dtjugoPVj2luJSrbSN4uThUdLJtxVTpovm+6NHaU7PeDG2bbtnjUtqcl0Nna?=
 =?us-ascii?Q?PytWGUz4kZQ2gv3tddmoKACWnRqEXyYqznENhIyeDPASw6pRUXt/fyayZ//l?=
 =?us-ascii?Q?yRLC1b/5Py74FMgy8uZErYunte7FqsJmF+Lh7FAVbm8GnU4JtJ1hgyvkOnMr?=
 =?us-ascii?Q?hyU32Fk+hxocwrQ3aH/arLboiITlGeeYtWDKCvHeqFgXFyDKFCkRhd4jb6j2?=
 =?us-ascii?Q?4Oy+ZljnPAcEHMoTvRaw9HTOff77umac9Rq4XjnuzBta9lbMuCRbP+42WPR6?=
 =?us-ascii?Q?1ivCrJsDk/QYfVOOjDyEVFeJYpZJkdD9Lcrusc87UDcutoSxolL9HuaClr6I?=
 =?us-ascii?Q?1sMQIPhzHsyz2p5KjAbWUj+FDNLvmzXU9W8aamD0rKzGwG/T/tcxCSM2lXiK?=
 =?us-ascii?Q?bs/F+0AoTlkrqw7U2phqGfzet5eU4qiNWsglBOhFFCOjos5gGT1O8yW4ru3w?=
 =?us-ascii?Q?dpxhLx0bbp0dfDnKM+373j7xdU2tGbrJi9FMwp+B8EAFPmG6jW3KY23OR9+J?=
 =?us-ascii?Q?7t0YPkVhmPeeBbsFZGyOLPSJfF4Gk4WrGk4xdHWlmfEC/EIklvkNT4vXAto3?=
 =?us-ascii?Q?YFJw8LZgMEz4m7gNTmuyMp0lUySKog99xDUJ73dYKbSmJjKebtQpwQBatG3e?=
 =?us-ascii?Q?vIpMs63Y2qcVLmwBIVFTZP6BGlyl24YskItviO7/0eFd5G28cQRrK3SDHy27?=
 =?us-ascii?Q?TmNxBbiDr+pNQYimRo6mWH3HqnCqXWeYJCeRICNnCJ3WVEXFd/cxlNpjEqvb?=
 =?us-ascii?Q?K2IWhdjNb+hEYw/rvV7uXQAbBGUuR0aUnz9Rz621K4dWtqHRWENKKaL9U8fB?=
 =?us-ascii?Q?esX9T+oJVWZXA26j1ZhMt8JHt8XMhuriGIfWpX2WLM/vYAaqX8n3BXWQ+Z6m?=
 =?us-ascii?Q?hCnpG0JWpSWvo9byfGlut8MSJMORQ3aICn8OxC7+5Db8JmgLfz1T2WqQsUHh?=
 =?us-ascii?Q?KwstSFOeKrm+pWD4GSTHz8JOcy+l1dIbSEb0PcAylN+Uwsv7spBOhhFTMM+3?=
 =?us-ascii?Q?JNSKlIIRhMpt9npGDIFB2VZh5tELPLIsVW8mC5Aigy4R9LOm/sjlKbzccvEz?=
 =?us-ascii?Q?yVfK8Vcg6a/wF8pv2Dy93pz5yQvBM91dcCmmqbRzYshkR4pMtPRZ0z5ZFi1f?=
 =?us-ascii?Q?KGkSO1H6HIRLjTUv+CTF5E2BG25NI8JYMmt9CniFVJfpfHRZDz2ldFjaVYU/?=
 =?us-ascii?Q?cYAeYnA6UwsRVF/R9ZxLrFRsOEzWRKh2o/qd2SZrQbCYsZ3brOeWJmDW8F/2?=
 =?us-ascii?Q?eq6o2YgMFyXc6+4HJIP7xe7nUNXbWuQdJncP0C+TOyIXp8XUf9n+ME84NM8v?=
 =?us-ascii?Q?dHH30FU76winpYAxatJhhH8=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb48ae59-c9b7-4af7-8709-08d9f0265c03
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:19.5294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM6S87sQg7cP78QKhQf2JR+tZXuodYcczaGXperdxW2+QNWMAMXRGKpMD+CVex5j8J/w7BJXOtbIkzGfqsHx8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR06MB2742
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/block/xen-blkback/blkback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index d1e2646..aecc1f4
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -42,6 +42,7 @@
 #include <linux/delay.h>
 #include <linux/freezer.h>
 #include <linux/bitmap.h>
+#include <linux/jiffies.h>
 
 #include <xen/events.h>
 #include <xen/page.h>
@@ -134,8 +135,8 @@ module_param(log_stats, int, 0644);
 
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persistent_gnt)
 {
-	return pgrant_timeout && (jiffies - persistent_gnt->last_used >=
-			HZ * pgrant_timeout);
+	return pgrant_timeout && time_is_before_eq_jiffies(
+			persistent_gnt->last_used + HZ * pgrant_timeout);
 }
 
 #define vaddr(page) ((unsigned long)pfn_to_kaddr(page_to_pfn(page)))
-- 
2.7.4

