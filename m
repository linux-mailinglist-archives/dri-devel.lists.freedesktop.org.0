Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69E406DE6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 17:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E79F6EA0C;
	Fri, 10 Sep 2021 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3D56EA05;
 Fri, 10 Sep 2021 14:11:36 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ADtSgZ013678; 
 Fri, 10 Sep 2021 14:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=hZNsNqnSdzDoRrs9n34z5zvOt/SaZiw+wnihnux4hcg=;
 b=rXv6QiKOA9QO9KxvkVfHsvQbGHlKSm5ClSMxFoMA2uHNq2iEaOg0227akIVlmrtsat/h
 GaT7NOqS4TyNQbLdYL7CdTd3oqRRwquYnVjljvKuuKyM9mulx035Dm7CapnDlUPiwxEY
 Z9dUG2a1DHZbX7h8+nDLy/L5o3fBuYjBG2gygRi983TtLLu+qgjsaC5WvRYYewV1rlHZ
 mV3UDKJI1FauLVA5LOELtg2zpvtrflsY1+extPitDdcgqLHDg35oS8TUU+fhEZxpmtr2
 1QpMpgN4KL4veNMMUlMHgXG6anCW8ccDq/0sIoUNR+PajDrh3eX0eUnYeURkn31EH8OA 9Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=hZNsNqnSdzDoRrs9n34z5zvOt/SaZiw+wnihnux4hcg=;
 b=WcK7DeMU8OxukcfeMPTuCceZQ0+2a9+L5vm76ukIXdawHPnUzG1u9YCIwcMBCEjfM6mb
 0RkYlyxXHZfu4Enb1g6KO/D9dzRlMOVNbpZMuMJD7+5+oV2Hoyhw6rhMPXzz5esy84si
 GF1nuL7Hld6fjCYYwo6nrIIuaTU6LvsGesBYpIne2SP2+TzyXvVdqpHk1Zo+ZOpafi4Q
 XCd7hOVKgkCAGucVeh1JrRshzyEZLdxlC7ll5d3PmRzPWNcJPyR3AV2qpt9QHLZUYEwU
 xhOq1QWfzbmdhA9GMBcd4RKPRM+g1MVxVP6RJSk/RXznkPUQn198mQXSaXwIY250fJtU uQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ayty4a0wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:10:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AE6Joh115900;
 Fri, 10 Sep 2021 14:10:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by aserp3030.oracle.com with ESMTP id 3aytgemu08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE/XeJ1u2xNBh5A4z0/pnouufRZmTFVJnbqieloqLtdd60HqYZk6dsdIeQ2oJ4Lr8zmEm+iJAM786t6G2xaBTAhrsZTaNccflAzq0Lfeim6ihSrBUN9dY6A+n9fQu0VPIxfxllt4LYOZHztKbiGD6iaaFHMPbPw37qcVpznNZJOpH8ChqmQyDN7Yicb0wa2vEQLqP2xS0ztpB5S05IT5CoINpmaC5TcRk5hBeXumPVyubWHCRJVlPr4iSGKRs79jj8L1zhz8nqb6+MRwIgLVjK37Y8ed6xsuuWBKCkm+W1QR9Tm7mYkK4TGo7aqtfnL1Keolsf/kzBGZJ0aYu+wJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hZNsNqnSdzDoRrs9n34z5zvOt/SaZiw+wnihnux4hcg=;
 b=KPVlBERe+zJ2nzvV0dtnT7fpbzerZuLXY14sz2GQPkZn7IMIx9BobKXgIqmMGNqAI6UB2orIMOpVLnstdQLkyk2zj8Ttks/kwRKMb79NLcPsqTriGepq6RHiMfNTmL7L7r/UJYKYrbffJD+Eza+9A2fFRxurvEjcqREIui2IMcVx1+6bYXLVo9haVmWvBVQ6md5q3H203I2kHbx0rlUszvuyYsGP26Vlhgb+AxpEVSQq1rxNHtbUCFXyO4RF4X9syOLprdGxodOeFyoHoAtDfvv3AlFuUhab9lX+q+l7DLFHlluunEBGYskWcjpGWY4nC+2R/WEdq1ARfhYreIat9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZNsNqnSdzDoRrs9n34z5zvOt/SaZiw+wnihnux4hcg=;
 b=YhLiVCT9xLiXGWMkz0+fODM8v8tXby4x0vEqpuEHyqC0gJb2JIswZCnFVeAAA/nm6ZnX8hrcaarUnMsjXis2AtsMkh07GsOLZFiQQ+oMPjk177HPdnh01IXwlKmfC1JtyOm91Y+cw2zcOQagqkBNGOXqp31uhDqPUiEyUcPlFy4=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1488.namprd10.prod.outlook.com (2603:10b6:300:23::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 14:10:24 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::e1f7:a0f4:46c5:3df]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::e1f7:a0f4:46c5:3df%6]) with mapi id 15.20.4478.025; Fri, 10 Sep 2021
 14:10:24 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH 1/1] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Sat, 11 Sep 2021 00:10:01 +1000
Message-Id: <20210910141001.1622130-2-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910141001.1622130-1-imran.f.khan@oracle.com>
References: <20210910141001.1622130-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ME2PR01CA0181.ausprd01.prod.outlook.com
 (2603:10c6:220:20::25) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 ME2PR01CA0181.ausprd01.prod.outlook.com (2603:10c6:220:20::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 14:10:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02aeeb9c-e2e5-4851-1e26-08d97464baf7
X-MS-TrafficTypeDiagnostic: MWHPR10MB1488:
X-Microsoft-Antispam-PRVS: <MWHPR10MB14883F7830BA7E9A9AB71C21B0D69@MWHPR10MB1488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6qFpNXsmY6v3uyQweGLFoYSsZGY349CvLiqb/bIhIV0KGL01VFOnnLKtEZ+PAeL2Zc6crZlF/qKtlo0mByFFKEFUb+xnppZTIpG95ELFrRCFZWEQwFcjTg3dnXMl3NPQY+f+whD5bbYSOt0Mvl1w81imwqW8RYJJylre7uXjx50zbbu9Yg50887BZ1pV7Sig8WnWUCi3y7MkNXjjNnOneauUvnhPk5UQeEoEhqjsXJy/zVCdGJ5J8et8YZl27Oy5bsLr6vg47Ig4yqczbbN0ufl+HQ+cnZGNziQTLhGqpfEmjEfEEDqi8Y1I8UUxo1lz3PiqS7fFuGuA2YcZYe2ZYue4L5WfXr/B+j0q6Hg7dMHyoWcLBsaz4gcp6MpG8xklDm9VeKpqLHS3xJhLlp5+Qk67mtj8eotVbNg3JLHeGBo9ZHrYKB06MQ4WmzXS5Gk3oELMMF/xumMTRqbeWA7OZHfaflY2b460Vx3YW7zx4EEXSImGMWGZ+dErC46ShFU3xu+g0GYmsPaTzJN3v269MIfYseoYWq1xHq73IvoJWo/vFaliHH7MnAPQCJas5eK/RQqihorEtfsmHAYsBdpazkw6dxHyU9rJy3LL4r1afIX5oU4eypncuEG4hzBPyF2iJYR4dr3nqxNnZX4tCEgSno1/LUpZobji7AaX2K3qdsJ+3oqB8Xgu4tPzAi8mZFZgLz9u95i5tQI/2CHr0tofzBWFgFlwWrkIeQmh3UVtE30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(39860400002)(376002)(396003)(956004)(38350700002)(66556008)(2616005)(66476007)(7416002)(316002)(2906002)(8676002)(478600001)(6486002)(103116003)(186003)(6666004)(5660300002)(38100700002)(66946007)(6512007)(26005)(8936002)(4326008)(83380400001)(6506007)(921005)(52116002)(1076003)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AlPZDsIwwxSJjFpy6HUj/DTSkraGvXHO8xTwBxEgwpV3c/sSmaLCEnXbQUwC?=
 =?us-ascii?Q?ihyJF9rib6gEF4wDnYLAMIgcKE5TzOprh75riqTaQkd6K2VwecTrAubB1+qX?=
 =?us-ascii?Q?6kP120FLQWYCmKK+9QU3g9vFG4YACZn9DG+tOehcNGZTVCs9uo6WvSULD7zV?=
 =?us-ascii?Q?B6z45AIILr9QxMqfGvvlUk/6ZdEya7a+pqNj0Wsqai0/PLlTJOsMTQ1cSVIy?=
 =?us-ascii?Q?FOpC79AD7FSd52VSCoYJ3m+1HUEEy9NkahMZypCuUnKA0Q62lJ3XuO7Ij7qM?=
 =?us-ascii?Q?5M8s6xKIQ7mVbwFrsAqKYTZWr+hppdjSTttyS1s38dwoP+yWCK5olUsqrEy6?=
 =?us-ascii?Q?Wxvt5adVJJw9d80wOC+jM86+k/q4KQ0eg3WWw7b2v9eluUg1WK757osSEKz5?=
 =?us-ascii?Q?AVaqwozyTEB0c0IBqBbqIxqJL8geF7mfEYkLuCmwelKf4MBGlJ95n1SvBuuf?=
 =?us-ascii?Q?SfsXciReVKeq5m+OE2IKlOS7pEsfVxs2CYmv87fNTwRyg3vewfgXZnIF+hIy?=
 =?us-ascii?Q?D/YElAnu3n0Ow4t3A1r9E26XWpjKPmgFUYDjDxId+hFaGZYtmIekiiOo8O+/?=
 =?us-ascii?Q?jqjYKD1wiemdD74PuQKC0No/U1dRS9iBl0srnXKlYyGTqaX+oZ0GGlXU33MA?=
 =?us-ascii?Q?+OhNlsXgFlyO/1XPw+9s0u37EAsV4paX/98HDn4GuGGgns+VQfSwNAMbmBl2?=
 =?us-ascii?Q?botRCKvy9/8y+t78xECWvI4WEknAbZxV4kDTjUCefruUeusGskDq1kkVjN/C?=
 =?us-ascii?Q?Jl7O4ytL6mQt0vbzldegxmbbV9H/FGxs0monYqDM0448WS8LQnes75d2ZuOP?=
 =?us-ascii?Q?/aZkKEXZ76Nn8QS08GlOdv51wRk2EVRWTou2nPudRJQOM0s9dVt9/R+LJRKk?=
 =?us-ascii?Q?9oFN4wUjB6cK143nuKtuGwQy/bmDiQUVpdwNn88eizu3rj8Sg4Cs+mZW3vC7?=
 =?us-ascii?Q?Icq7dhg7y1MyweQRbYfhmfeFkdEYjNBSeeoVNfS6fkUQTQPQMxz5//UmZpiI?=
 =?us-ascii?Q?xnkUAe1DMfKUO8oUh37xnzI6fT7N9R+Ixbr00TPdrzVFMmlSRIpdiaotyyzp?=
 =?us-ascii?Q?fa8+r/hlAOtm6tOZTab4dI44+oxtSWaPora2F4qK7ebrSApQl2bfsO3Ay+mo?=
 =?us-ascii?Q?ERVY8iX826qo4fgodgOPIK1h7B3Erz4V57QounJdyKvK+HxrBMnHQgZKIM9T?=
 =?us-ascii?Q?c5Bdj13Ip0tUHHw52BiPVxL91xCFRZ97pXh1LfdwzcloVzLWdOHQNCgcR838?=
 =?us-ascii?Q?b5m1KxDlW19EkF2NLscyRodkPS050XTJdqwmQKBqeN7eXXP3q0P//eek6eLk?=
 =?us-ascii?Q?jxJNhsX+V/pa3vJECUuQg6sF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02aeeb9c-e2e5-4851-1e26-08d97464baf7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 14:10:23.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8AhzCybq2Y3PcgfG15gcOtVkwY0VjXioYocg97qML5qX9e7IdriUr3CO5j0+pUsl2FvM/Fw4pTyOqhOlgvCwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1488
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100081
X-Proofpoint-ORIG-GUID: _uHMzcZHLUa-Fx1E0_DkNcB4qN0T27rk
X-Proofpoint-GUID: _uHMzcZHLUa-Fx1E0_DkNcB4qN0T27rk
X-Mailman-Approved-At: Fri, 10 Sep 2021 15:02:45 +0000
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
---
 drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
 drivers/gpu/drm/drm_mm.c                |  5 +----
 drivers/gpu/drm/i915/i915_vma.c         |  5 +----
 drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
 include/linux/stackdepot.h              |  3 +++
 lib/stackdepot.c                        | 23 +++++++++++++++++++++++
 mm/page_owner.c                         |  5 +----
 7 files changed, 35 insertions(+), 31 deletions(-)

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
+		stack_depot_snprint(node->stack, buf, BUFSZ);
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
+		stack_depot_print(stack, buf, PAGE_SIZE, 2);
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
index 873aeb152f52..e1c1d7683f6b 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -214,6 +214,29 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
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
+	return stack_trace_snprint(buf, size, entries, nr_entries, 0);
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

