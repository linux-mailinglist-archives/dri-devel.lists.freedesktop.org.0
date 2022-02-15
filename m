Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8424B6073
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E071410E3CA;
	Tue, 15 Feb 2022 01:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DCF10E3C5;
 Tue, 15 Feb 2022 01:56:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpP2y20MYGOxSEPc0GcMSozyevJPDMsBxdqncEMYFHZUXIqHOQUm3U6zc6bX08gaWINByP0mgLWcyEolNUIbMZUeVR96jnNGOS+3qKNK+yAFcoz0I0QHsQ1q3zhvUWmGVn08pviy2JxcOgV1kSzDnz/WcGizMamgwuDG40BMa3sE3Lg0eqG7lojfUpm0W0DBqkxn5Z1byrPwJmzkfXPTcQHaoea4iNsETG6/gzEI59iABrXLCsIUODhVzFT6LRDzqTqLCxNgijfHbaF7okxJiNSs5Lztfkk2abY0vsd/odOXWeDhGEffamBtN1iKHJ6cwpUJtnUhFbyxfzLRfI6RRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnUOhbL312WydrIZGtqkVI+fDJEpdEbLKHZMp2nzkhA=;
 b=D1RYtJG1lkD9GW/NYymXmdEiW2jdSVEIIn2KMRY/hA9qYrNP4vgCeZ3xhQBGhmojpAzoA6x9EFUv4Bs6XcTekRDrjf1WRc9M+k2zLsIVwP75PQbukCQMn78Vye1NOShtL4PVSzb1IK2Z9iSsGYo5kYd3DZbCvqlXZScvpo2BVVmYAG0J+RGE987ZbCA7MuZ5iM7Frn/ooh0HA/wgjoELLQ8JC+qric+6xM9d+AxioqQhehszvk4X3VBEdaBP1prb3KnVuadVjhlVNbsE3w78LWOlsqguietVUT1TlxU1TEypxwGQZ4UnQ8yn7P8p0i2uXVdYwnE/j3LEjCTKeJMZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnUOhbL312WydrIZGtqkVI+fDJEpdEbLKHZMp2nzkhA=;
 b=GqIiQDLhuwcAXjWmqE+Zqk8WJ6EWQNe17U22epLF/Taq6SR7LyNVqeiDYrifXWhE6Kih08KhndBdwUzfXFhvo2gzZ2wdYFnC9f9GnNpVgKYxMKR+TjXg5wVlAHteb+FZKYnYOeU5tE/AuGwA8p5TUuuJ9ha81r51sD0n38p/J1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:50 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:50 +0000
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
Subject: [PATCH V3 10/13] md: use time_is_before_eq_jiffies() instead of open
 coding it
Date: Mon, 14 Feb 2022 17:55:45 -0800
Message-Id: <1644890154-64915-9-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc486b2e-0c4b-42c7-dbe7-08d9f0266e9e
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2771BEC0CF4E3EFFBC004F06BD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QCWO2F/w7eHbPOL0e0e9xQNZ3K7Xw38kdf5QuAOps+fk4Qcyo4C93c+aP8pDzbFZqheTj3ekgZGi/KEmlKhO2hsT4HRpBrVAuDZtGAA/7+AhyggclMFAiPWcNsA85irQz1bxTwY4PAmsNiAwaQ7U5Spvdh/RaA08wsakr0eXNmjSl0CdZH2L7u52GJYQ+dB8pnl1cXqlAAk5se8p/5iZHmzeUUX1/TPuhcLcqUzRk2Eeo16YhX3yIkbFJ99sKMhYD2+1kDbpuUZct0ntXKZAy7BcLIGijpcXw0Y6emoKi4BJDB5WcD0wrbuEmvkgfGgyFwom4EhwUeuFZTyP1kHt35Ik673k2CMg80JKoPspYnxTcI2o5Xik5vtOOMqx/eT9W/9H8SZvl2hIT0dF3Wq5m0q+k7tNOi24kWszEVv9suEW8przc+tNA6lbAigv+gB8vbkfrg7QqsER7o9iPLvqpJTmdX2gUoNzdjHT6tCUiyLZQAvPLNgteDYd1Dzkg4eTX70lexMX35irUPEM2RmPi0t2FAljly1zKbkzhvyAl36WulZgHESjauZzgep/bb5v/rCPUyHKd8bgsMfHtFUXthTtzyD9BWd4ajwAsRRZbgQU05R+VhaLX38K/km+TYJ0bayJRFx9pzwfXH1M8z9nUyxmTz21Ial9TeG9T4gHHsfvkQSskZ4H6FJ81jCQZ9P6/CoG+ox2E6Dwdcz2v2DYxiJtDjHnbDQrDqcOOvtT8h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OcTsoEukQ+WkoN81aeNCUVTtA/p+y9SYnPvIhqVkCOJ9JSD22yIhnJ75M5XE?=
 =?us-ascii?Q?n1Q4ZkQbaUON6f4JhZ5u52/RF/0lL9DGkR2VdAFmwZ7gbTKvT7PynwlXP0Sj?=
 =?us-ascii?Q?vYMWATYITfIVvjjwBQs+QxLhR0zB8XQ/iq78eCj4TYCPdttxNVqr8S4J5Krt?=
 =?us-ascii?Q?L9Zxsj0cXdrtrvCIcr46hltG7mlz+KPHoF2zHRCFoLDMr52n6gbLaF8wzJ3K?=
 =?us-ascii?Q?2InTyLh+JIhF+HH28Pr1pKUvCFwooMpQxcfalNpV/gPowcgYE5jmr9mk2nE5?=
 =?us-ascii?Q?ilzdTc0KFh5COYqtoWV0rBnOlNbOtrOJEIlV6QM8D8TU0UZpUZxmQkC2jd9P?=
 =?us-ascii?Q?AfL2IeaLgjV3AwyMjvD25DjleeiAC/CxM2g8KGW+4ExcNLMEgvFVVMPEZ+KC?=
 =?us-ascii?Q?KhLpNU+/05zcGqmMhuSBLgb19vIqEsQy0QxKp2TbqB++U5FpQErjW6q9oyU2?=
 =?us-ascii?Q?zv7iIanbMDFBDUQguUWX/ERXS6lfk4MdXNjfnyEAnALVBHhsbd7tCOzo0glj?=
 =?us-ascii?Q?vGfxQwyoZSX+Ew6rI9vupdC29l8bA9ElFFLxb5sHOO9THvvx19MUzgby6HnC?=
 =?us-ascii?Q?qIUsGJy1ZnNJI3RBMcN6PBJRbfNGmTh/+ltPTrQW6cF8qTl1ij7i8BC4oaW+?=
 =?us-ascii?Q?DzDJA8X0vlfP+HYOpo6xn3OkZiY+4PIxo/oIHsoYIRzTm+vJZEFeGEggF6U+?=
 =?us-ascii?Q?Kk/XMD84YTzQpLJ4J15NuhHdGqLejgr9F5ZkpNv8A6SPmDEv7N4/KEL9RmR3?=
 =?us-ascii?Q?sssQ4cKyyiaKsJYrcZd8QPNzgiJiMCafib0OQuI44eC93V+uqVglogDPRyVd?=
 =?us-ascii?Q?3l3RvfAHjE0PC3S03f9pYHQlxYaZnn8JotaFCD8vcaXmerI1CF+4qnd+nOaY?=
 =?us-ascii?Q?BYf0BkKZIJTr6od28EU8QMVMLVZXRrPY40XOYX+x0AzMYstmE9zTyUyiIsWO?=
 =?us-ascii?Q?YV/6U3z/A9F7+0CYe14WCbQyYTQ5H8+BosKseJCVFyjSuSeGI06TnWDyaT8S?=
 =?us-ascii?Q?TedbubTINWAXQ1EGqIomyQ2nL5wpZMvI5SpBiWo3yr0/onds5rh//9fIpiu6?=
 =?us-ascii?Q?8vRLvF7QXRtLJdIBF79KfPw+Oj3lqe6saxXgSYx2y630EiT3ll0KLFi2kYMc?=
 =?us-ascii?Q?yod2o2L7hp48sEXqisDoBVWeoVbGUmPlZM/f6wnG2WesR4A2DK+GGlhqbBMY?=
 =?us-ascii?Q?S01mGc0wkRazG72SFuP5RjTwFEdqJ+jaRTlMx2gSARnvcG9cxJeRhIsIYZHz?=
 =?us-ascii?Q?vXQ6oe5jmGF9GGtRSsxTT6gW+VKjtZT/xpVMYw0cA7jrD6Fo/BtEPgR61ueP?=
 =?us-ascii?Q?qnDevb8DlIdYexCFURi6YX5aVdQTCijIT2SeKV0D8NgIgbyKIebVF5Ig89LV?=
 =?us-ascii?Q?KC8/fSMejiS3bwajXrLzv0dNXTJGsSx8oLVGFcaolZRNbGi6+JhZpsBIBqY4?=
 =?us-ascii?Q?lFyBkAdQ3bpSCr9Rvk+7T2K68fUaVC9ryHb7xWFpB8NMG/yYbxGTVNoUtaxQ?=
 =?us-ascii?Q?qVHbF5DIgAwlsnIoFv7dGrWtY3/i7VolntJhqo5JtSAi38QA2b9HhMJjY63j?=
 =?us-ascii?Q?sfbOhvCrzqV5bsjbSeml63n/PoRUV1knUfBzS+nz/JcBuzxJoW2O4wAS2s9D?=
 =?us-ascii?Q?37807mfgId4FgCldTVMHQ74=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc486b2e-0c4b-42c7-dbe7-08d9f0266e9e
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:50.7151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDKERJZpmV9cVwhCSBeq6+6IG4Ar72+JGr5GCs+hxdBhDvlX4ABHT2cnopQws+WWqunLrTbVc5vaE8NzrOjsrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2771
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
 drivers/md/dm-writecache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 5630b47..125bb5d
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -16,6 +16,7 @@
 #include <linux/pfn_t.h>
 #include <linux/libnvdimm.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include "dm-io-tracker.h"
 
 #define DM_MSG_PREFIX "writecache"
@@ -1971,8 +1972,8 @@ static void writecache_writeback(struct work_struct *work)
 	while (!list_empty(&wc->lru) &&
 	       (wc->writeback_all ||
 		wc->freelist_size + wc->writeback_size <= wc->freelist_low_watermark ||
-		(jiffies - container_of(wc->lru.prev, struct wc_entry, lru)->age >=
-		 wc->max_age - wc->max_age / MAX_AGE_DIV))) {
+		time_is_before_eq_jiffies(container_of(wc->lru.prev, struct wc_entry, lru)->age
+		  + wc->max_age - wc->max_age / MAX_AGE_DIV)) {
 
 		n_walked++;
 		if (unlikely(n_walked > WRITEBACK_LATENCY) &&
-- 
2.7.4

