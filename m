Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1D40CC01
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 19:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC1D6E9CE;
	Wed, 15 Sep 2021 17:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A846E9CA;
 Wed, 15 Sep 2021 17:53:56 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FH454G011618; 
 Wed, 15 Sep 2021 17:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=FC3CDR+RmeesGimiizfM0qUR4bmRON7IwaqMVC/gjSw=;
 b=iSrIVOmNa+m+EQdv9g29+QKODZ1O9cl0dMaXotxlRHbg2CjoZ3Btw8rzhBBd+n79ClrB
 rGPzm1YeDKpHG6sCjKAjfUzzwEQ1qPSGHl+pfToTi02JY1amIQGAsuOrDrXQNFSpzbvn
 pDfj/Pobl8aG8Fc0CUqenUyP0IJWRchlenOnhb2PTssqjsaTZyUyL/778ka3qJML+COC
 XKXFEmxTOHrO/TyLf1+nKwPTjCTYWHJNdLhPAqyPGdIsVKkpLRTCGcotYdqW4D4/V1wf
 BwXOjnwpxy1tHKT5E0WU1NIl2blatL0t1XsEgpqonCNukgn8p0ApkZCk6jWV4d6gILGB ZQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=FC3CDR+RmeesGimiizfM0qUR4bmRON7IwaqMVC/gjSw=;
 b=irrXnZlKTBWMJaNXs0s43Bx/VrdCg24TIG7meI2OMAAXkuYhhaSIgOBBSnRN8YZM9zWr
 r/W7wvsVVpAnORyKDY8VLoBW/ehr8pzyUwdNd9gP4wc2qYwFtZs1AwBZqQH28CmfWnMS
 nmgVk8NcfFNyUYbwt2mYB+5PMXkMSj1GlJeZG2JHb/QK140Qff3VZe55NWg0JTrvfvEr
 Xc0vKQUjnG4BgT3J3K+fdYd4UUk8EDdWEpXV53s0AzH02AcbmFgizsyAusnX28wVE+4h
 13DJ2FrUJ5L886p39hB589ALclZQx59YJMpVWf6hu0687D4gzuRSao16wCd/C+ez9NKz GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2pygdjjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18FHkSNe160992;
 Wed, 15 Sep 2021 17:53:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by aserp3020.oracle.com with ESMTP id 3b0m986m2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaOrk7zwq/cDvPA8f3xunohQVdK2G/FBP8FDxmld6xPLzOHf7AaJg+ax80ZF/lNSTMG+ZPF7LYimfjT9T4K7KEuQMhdqmt95UXZ/tYLX5p5Thn9A3QiAfCmJkCcZGwhQuYVi2N/m3kOt6DbbissAk+MkChIcMTvNgYJaTCwhuuyu7hc+1nBtrbn9Nb13zbE2EfxjV2lKgf5cR1ssWGSy987ZZi/QMUHgWiAKC2F/e707oYuGGlJ5WcgoZc0f1HtZ7RjsMXk2QMCwi3WG2cTYfGmhFPhrbCSMqYmNgmUw7heQ+mEikEKaYq5XTV27Bb2o6eENymq9yllC0BIqQoRzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=FC3CDR+RmeesGimiizfM0qUR4bmRON7IwaqMVC/gjSw=;
 b=jUnF5hkpAUaeU2vVU9aWDNrgtnztBlDfmaVn7315H+w81JCvpTm5kXnOgW3P1zm7070w81jGYhy5loIXAy3uYnefi3nZgw2lbo0IsEqMngXr6Nxm7h23mszjOFVRwXSApJHk0p9Xu4tKGMa2EyPoHNNxgVvi6JMOYn9dn9DH782Yxtg2RHTPTZT3EsKRtYIoYOAxR1SiCDd6Ab6Ga5RyKQTM+Qfh7uhKgmoS3ar36wTAn95OUeyOS9AMbJ4tKMKPnMeklgO5U1tLKMI6+OVmFJIE/pa+V5vNtv3cbH8sQuY3xbC/n6j5niCqmv9RDs6cGiqiHX2nKQverNlOpjVhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC3CDR+RmeesGimiizfM0qUR4bmRON7IwaqMVC/gjSw=;
 b=eUx0hfc2ZzEeBtlPxq2EZVRKa2PPTSmMQORFzNmbmFH/TLoDVrj46qEVjuUbsMrwThPUxmEkUGH7SlC71CUgepAsmpu6qMT8DlbEUqOHBxSdjju4bi3zRZdn/t4hhYGvxol3608vvJHgKzjKjZbZQkzlIVEyTs6KxBY0HMLyNN0=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1568.namprd10.prod.outlook.com (2603:10b6:300:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 17:53:41 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 17:53:41 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v2 3/3] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Thu, 16 Sep 2021 03:53:21 +1000
Message-Id: <20210915175321.3472770-4-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915175321.3472770-1-imran.f.khan@oracle.com>
References: <20210915175321.3472770-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0105.ausprd01.prod.outlook.com
 (2603:10c6:10:111::20) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SY6PR01CA0105.ausprd01.prod.outlook.com (2603:10c6:10:111::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 17:53:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0857f70c-1259-42e7-cb43-08d97871c0ef
X-MS-TrafficTypeDiagnostic: MWHPR10MB1568:
X-Microsoft-Antispam-PRVS: <MWHPR10MB15682399349A5C5DB5F32CE9B0DB9@MWHPR10MB1568.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0dJnxuV61BVEE2rRoIqmNBuJBPY7+YvLaf57jujpTvQJfcdGKtoaIJgy80E5Y6gpvnrGAvfx/3xdWO+5LnmSZbnUPKKUvDPrwv2Zcc2tYXDvv3SZIK6FKBYlPfrCLdMqGoiCCBms10aN90bfyFRSu1Ytte5gNSmPeLYYryDfoDtUAAgJuVrD4Ur0GfqRvTwUQ+HwQrtuWmhO5NhR7q6ALJDgJDzXSZugychmjUU9GykPc6TTmgVA4fnJZw+y0TYZmj561w6XjOh8Gz0uqLZJ+EzevXK2n3gXXtisfsxJZpz9SFcHCjV9RciHqsLcF0wCTZt9siGdD+IuFe6/LIxr/9ImS7DNoB2qYUz1ADhUx497AnKSToH46TJSXMtufGygQw69GrHsgAamAc2r5m15UXVwXHkL0XvLs0f35jMqgSK+a8oACDjjg+OGHZcF1BUxG0ak1sjKqxwaNDw9vLsdUOG9BH0/jsxaTEwU6wsu6VrsYSYJy+ct2sC8K/kNy0tmLPQrsOZXnT1/dZ6DsjShIRSGVusDUggMMc0b7Aa2e9b03ua34YS21nFKjSGYXK5rYOp0HcQS8Q30b4ptSNSbsM+4gruBfdQt0NNWn66YEdXN+EVdgBNhaUb1nFkWho6yQVQj1AOpY9OFX3IFqsVIu8EGO31SYYIuS8XggcovgJhA62/so6c8jaO5J1pmwitH0OeHtdnPBfXnXHL7m0kMRLm5pfbmKvWVei3ijM70ww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(396003)(366004)(346002)(6486002)(66556008)(66946007)(2906002)(6666004)(921005)(66476007)(38100700002)(8936002)(6506007)(38350700002)(83380400001)(7416002)(956004)(2616005)(8676002)(26005)(186003)(52116002)(103116003)(36756003)(316002)(86362001)(1076003)(5660300002)(478600001)(6512007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2inWXrnL2Fa9yhkTcZkzc+kdR4Mnumn0htgy+wn1DbSvpH+QVLloqxEIVYTu?=
 =?us-ascii?Q?LrUjTNftCAhDSFhqxAtd5tY1H/7C8etqORNNSQx9dgn8k7xjKX4MUqe574hO?=
 =?us-ascii?Q?p0LycYq+hw24M/bJi20SO5UFWtLBUkGo657JyrBqQZx/WgfGCEGGxjd33uVN?=
 =?us-ascii?Q?46SwZsi2RYj/4ICFdbxIRDCegK/GJBKdzyI2dJf3R7Te1ibuYiRvUknYx/K0?=
 =?us-ascii?Q?bJgV6T8OIjD9u2Sed4klMJ1xo7spmW/n6XM/t0uli06fJxK2LtGVnEwbYU58?=
 =?us-ascii?Q?0ktcFrPRen+gdlMOA9jhbBeW8OowiLkxqzzfLLLIhIjYzJza4I2CvVD+UCG0?=
 =?us-ascii?Q?Rnoi+gNvkfKzeCY065geLo/I2hgSuViCr1HpHgoOxOOx0Xjlt80p7/OLAysZ?=
 =?us-ascii?Q?+v33+GwVfI4fHd41Zc2nIPCg+nDMyTKr2r//5wsRoEAQoSGk4cuxfw1THymu?=
 =?us-ascii?Q?h8WJHbLkBUhLDox34521cqBrhMMd3iWi9+7XyBwyq2g+xfaYOBlKjY5Sa+iO?=
 =?us-ascii?Q?3v/NPgFxMP7yrrE0fe7iOAwhZfPEoVJVUIsmMCpypVGy34tfRMwxOcDhd6Us?=
 =?us-ascii?Q?pq4367nerhBMHnSZek8zji7uGBlAx8hHmqBiY/pthALhJs941diPTY5YIApE?=
 =?us-ascii?Q?9K25r8LzDGo6XNMmK1t8cHLgMs2MRQIdBaCs3i4yE7c6khg6yM4yDZGPu5yM?=
 =?us-ascii?Q?u19gRsBe6DZV5JvLisBg2PmXIpqiyvcqWjcEapKY+qvTvZBhXGrxfW7AWyf9?=
 =?us-ascii?Q?Szucl0l4684i6d4DIQ83qG96unug6eCg/C+hEdJXoZ9gkTdaaB2mA5L47fiF?=
 =?us-ascii?Q?PdlxXDl/KwV0C1CVQugubEAoLNMlNXXB/tZaal7e1MalqRXCmJAbebhcpruE?=
 =?us-ascii?Q?L5fuq0hXNLcTc5XDqVqhss/8beqgeROf0FAntodLdfaRedEuXHKShmK+8cfW?=
 =?us-ascii?Q?mwGhJaTm9noptPhNTJvcvrOWwaug9Vs+5YMeAjQBO93xS+dGHx3AO8kngqQG?=
 =?us-ascii?Q?El5rskDeQQNyHhWP7Xcn7JX7rjYMo8cvhjIfEEj+rGSaLQLzph/UQ4n/Qh4X?=
 =?us-ascii?Q?z4DbYH+XvNPv+lOr2Pz1UvfJTrrLMOHDIrFyJz/VVDeG4aRgWUXvIwLfXprz?=
 =?us-ascii?Q?JOYwnBsZMDb9Z6XdXRW2uzlLVtPos+zIm1ocur9B+AKgQGMMI98BmMM+JOvI?=
 =?us-ascii?Q?9MvoWJZcX5iloB+l9kGj9ToduRb4os2kBLWM5nsBK0NkZImaKxHZx71JEDFX?=
 =?us-ascii?Q?tbrVp5+IwU8l3almenbKG+2FdssAVCJgydBh+vDKpVAbiqPP4T0JiR4zUpQB?=
 =?us-ascii?Q?K+SXh23EdfnyFYwxo9jn9BJ/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0857f70c-1259-42e7-cb43-08d97871c0ef
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 17:53:41.4687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF56ntTIcEKI0DzAcVmQ5ZmFPikH/MxO5BlMb7/XhEBkbKxLLv+KF4QssGvZfn9GdrdPSv3nK0IeYp63lcekAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1568
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150105
X-Proofpoint-GUID: UW8Padu6tX-5JHoxAtdUDZVa37uy40LA
X-Proofpoint-ORIG-GUID: UW8Padu6tX-5JHoxAtdUDZVa37uy40LA
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

To print stack entries into a buffer, users of stackdepot,
first get a list of stack entries using stack_depot_fetch
and then print this list into a buffer using stack_trace_snprint.
Provide a helper in stackdepot for this purpose.
Also change above mentioned users to use this helper.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Suggested-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
 drivers/gpu/drm/drm_mm.c                |  5 +----
 drivers/gpu/drm/i915/i915_vma.c         |  5 +----
 drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
 include/linux/stackdepot.h              |  3 +++
 lib/stackdepot.c                        | 24 ++++++++++++++++++++++++
 mm/page_owner.c                         |  5 +----
 7 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 86d13d6bc463..2d1adab9e360 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1668,13 +1668,10 @@ __dump_topology_ref_history(struct drm_dp_mst_topology_ref_history *history,
 	for (i = 0; i < history->len; i++) {
 		const struct drm_dp_mst_topology_ref_entry *entry =
 			&history->entries[i];
-		ulong *entries;
-		uint nr_entries;
 		u64 ts_nsec = entry->ts_nsec;
 		u32 rem_nsec = do_div(ts_nsec, 1000000000);
 
-		nr_entries = stack_depot_fetch(entry->backtrace, &entries);
-		stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 4);
+		stack_depot_snprint(entry->backtrace, buf, PAGE_SIZE, 4);
 
 		drm_printf(&p, "  %d %ss (last at %5llu.%06u):\n%s",
 			   entry->count,
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 93d48a6f04ab..ca04d7f6f7b5 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -118,8 +118,6 @@ static noinline void save_stack(struct drm_mm_node *node)
 static void show_leaks(struct drm_mm *mm)
 {
 	struct drm_mm_node *node;
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *buf;
 
 	buf = kmalloc(BUFSZ, GFP_KERNEL);
@@ -133,8 +131,7 @@ static void show_leaks(struct drm_mm *mm)
 			continue;
 		}
 
-		nr_entries = stack_depot_fetch(node->stack, &entries);
-		stack_trace_snprint(buf, BUFSZ, entries, nr_entries, 0);
+		stack_depot_snprint(node->stack, buf, BUFSZ, 0);
 		DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
 			  node->start, node->size, buf);
 	}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 4b7fc4647e46..f2d9ed375109 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -56,8 +56,6 @@ void i915_vma_free(struct i915_vma *vma)
 
 static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 {
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char buf[512];
 
 	if (!vma->node.stack) {
@@ -66,8 +64,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 		return;
 	}
 
-	nr_entries = stack_depot_fetch(vma->node.stack, &entries);
-	stack_trace_snprint(buf, sizeof(buf), entries, nr_entries, 0);
+	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
 	DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: inserted at %s\n",
 			 vma->node.start, vma->node.size, reason, buf);
 }
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index eaf7688f517d..cc312f0a05eb 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -65,16 +65,6 @@ static noinline depot_stack_handle_t __save_depot_stack(void)
 	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
 }
 
-static void __print_depot_stack(depot_stack_handle_t stack,
-				char *buf, int sz, int indent)
-{
-	unsigned long *entries;
-	unsigned int nr_entries;
-
-	nr_entries = stack_depot_fetch(stack, &entries);
-	stack_trace_snprint(buf, sz, entries, nr_entries, indent);
-}
-
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	spin_lock_init(&rpm->debug.lock);
@@ -146,12 +136,12 @@ static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
 		if (!buf)
 			return;
 
-		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
 		DRM_DEBUG_DRIVER("wakeref %x from\n%s", stack, buf);
 
 		stack = READ_ONCE(rpm->debug.last_release);
 		if (stack) {
-			__print_depot_stack(stack, buf, PAGE_SIZE, 2);
+			stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
 			DRM_DEBUG_DRIVER("wakeref last released at\n%s", buf);
 		}
 
@@ -183,12 +173,12 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
 		return;
 
 	if (dbg->last_acquire) {
-		__print_depot_stack(dbg->last_acquire, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(dbg->last_acquire, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref last acquired:\n%s", buf);
 	}
 
 	if (dbg->last_release) {
-		__print_depot_stack(dbg->last_release, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(dbg->last_release, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref last released:\n%s", buf);
 	}
 
@@ -203,7 +193,7 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
 		rep = 1;
 		while (i + 1 < dbg->count && dbg->owners[i + 1] == stack)
 			rep++, i++;
-		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
+		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
 		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
 	}
 
diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index d77a30543dd4..88b0b4cc9906 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -19,6 +19,9 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 			       unsigned long **entries);
 
+int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
+		       int spaces);
+
 void stack_depot_print(depot_stack_handle_t stack);
 
 unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 354fe1b62017..caca95e6660e 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -214,6 +214,30 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
 	return NULL;
 }
 
+/**
+ * stack_depot_snprint - print stack entries from a depot into a buffer
+ *
+ * @handle:	Stack depot handle which was returned from
+ *		stack_depot_save().
+ * @buf:	Pointer to the print buffer
+ *
+ * @size:	Size of the print buffer
+ *
+ * @spaces:	Number of leading spaces to print
+ *
+ * Return:	Number of bytes printed.
+ */
+int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
+		       int spaces)
+{
+	unsigned long *entries;
+	unsigned int nr_entries;
+
+	nr_entries = stack_depot_fetch(handle, &entries);
+	return nr_entries ? stack_trace_snprint(buf, size, entries, nr_entries,
+						spaces) : 0;
+}
+
 /**
  * stack_depot_print - print stack entries from a depot
  *
diff --git a/mm/page_owner.c b/mm/page_owner.c
index 7918770c2b2b..a83f546c06b5 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -329,8 +329,6 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 		depot_stack_handle_t handle)
 {
 	int ret, pageblock_mt, page_mt;
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *kbuf;
 
 	count = min_t(size_t, count, PAGE_SIZE);
@@ -361,8 +359,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 	if (ret >= count)
 		goto err;
 
-	nr_entries = stack_depot_fetch(handle, &entries);
-	ret += stack_trace_snprint(kbuf + ret, count - ret, entries, nr_entries, 0);
+	ret += stack_depot_snprint(handle, kbuf + ret, count - ret, 0);
 	if (ret >= count)
 		goto err;
 
-- 
2.30.2

