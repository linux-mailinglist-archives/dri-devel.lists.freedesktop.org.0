Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4856640BD50
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 03:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16CF6E890;
	Wed, 15 Sep 2021 01:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26F6E890;
 Wed, 15 Sep 2021 01:48:40 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18EL03ZZ011618; 
 Wed, 15 Sep 2021 01:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Pa3eVO8EmjUg1TgHiwOuFRxKd1we5HRnv9MYKYeTm3E=;
 b=b9QMhFeAI8nF0WDMHMq+Tb8zJqeSXq+C98MA+sWZnOGTHfO4VMRTPgIbItWMMRpLLOyr
 J2R8UNSrwak3kV78InKJVlnXlWbaWUL9LzWj5ZxX71CUK40D6S1es2BlcSsoC+a+z8hs
 /DUQEpxaQ/LJLdQNtl8q4StSTZrgicnAUieKzjWA5mx8oj1v9yDLvwm5epaVgguNkjDf
 xRmRUbHesggPFqzrRuldhyQSzNdyLqt1deopsXNslEI8isCXbyHEwbPUz2+qwOO7GI3o
 FKqTp4DlfisJ5LUYUmJ7L6jrfV1xoEmodQZGcs5VpPQBqYcvKiNHsxN19UQ+KR0B8JXf Rw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=Pa3eVO8EmjUg1TgHiwOuFRxKd1we5HRnv9MYKYeTm3E=;
 b=Xco2hKGFDertlfU9FXztvpFFZrlBqZTXnMCLuEyDJVpX3MV9y67qPMvbnQ2ZW7fQ4lvN
 KW4RqVk9lyneZKAz1aMcolGhQyC4yOEwtNhCib5c/XsnLti4+sUkRNySmdM0PfgyAD05
 Plo/ScN3uBhra3R//15plsK5jZ58W+sjScUXDxotjWs6mKaYYNsP4/s3S79UrTsfSoU7
 R7/9PA+7kaeyy9zZFKoAqH6VHgRhgQTt8wZoLe25PVEvf52Ry/uoxDlrvkoIqpBU04OL
 +Vfj/atpTG2gEwqS9p/mccaCKOtGQDqu9KNSxu+qoLxClU+fl63Afa9E382WSNGDmCjD tQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2pygb1xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F1eZSl138012;
 Wed, 15 Sep 2021 01:48:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by aserp3030.oracle.com with ESMTP id 3b0jgdwmr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+RppqQDOi2jCeRo6vhsmBW0UtGDqkPXGtwszCPZbYUhfRnnEFjw3nbWZa6hg3j8FN4GyBnX0EU3DAKpQu50jYygqmWiizVOEoZ67tGnC+bMOS88PNEBWUL72HSjvTvn87RnCHt+XPHLTETZT7bthXjTWycdQ6VMhswFVbf/478X+w0mj49Uk4IV/cwbywDKGsP1Ypv5zIogMgV9yJj8xUjlOTD9+uaeCfPem6kAyrM7hNGtITfVS61lVcV2AoaWGtMp+8ET19ioJrYqpUvO9yIRAKKAOWAgtmQeFhJIA1/DxEr7I3Ik8toNKENShyH9IltdHt12HoSdEE0jXTTe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Pa3eVO8EmjUg1TgHiwOuFRxKd1we5HRnv9MYKYeTm3E=;
 b=m0HnoGAIK3591qypgJi2CuKsK3ahrMXb/7boGcyAtPO2RjnMtu3w37/VcoziaH1NfFMj+3jLg6r44rwMRWzPfAcjcs9mRdr5iqf4BDY6iXXLA+uecp+kmu2KbYfqx357cjw5lr+agqijwnQZoBkHogI+Q+m+RCMMkk+348CXd6TQTWEyb7QrI0wzoWVf0HmE9pnioXvtwZegeG2Wyc/j0AJcwqO6httAGC7L7RtCVDQrTZwLMZ6pn6Ux0NYWpLw/v9sr+ZdnTXcPpoNcCvGOzQrzcJ9JTMhyp7o20enoNf2BzgldXcAjuM730eRUaTWVLb2YZYYVE/ezP0IvCyYyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa3eVO8EmjUg1TgHiwOuFRxKd1we5HRnv9MYKYeTm3E=;
 b=wtbdyfX6LihWE9ofo0dLJ2dFmO2631xjYHK6zxXeAB2PkQoyLN4G+biyQGNZ01kZdNhxQbE4C/HAr1x5gpk1exGeJVbrxeGYJiHYWZnlkv+wxsnrRXRWmadu87RnElUmpCe4WqiTy647VrggFBHFny/i/7g9saXoUuCnJZmvdaY=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 01:48:27 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 01:48:27 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND 3/3] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Wed, 15 Sep 2021 11:48:06 +1000
Message-Id: <20210915014806.3206938-4-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915014806.3206938-1-imran.f.khan@oracle.com>
References: <20210915014806.3206938-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28)
 To CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 01:48:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 056df092-c7d3-4d0e-2d76-08d977eae914
X-MS-TrafficTypeDiagnostic: CO1PR10MB4577:
X-Microsoft-Antispam-PRVS: <CO1PR10MB45777EF8939C182483A13394B0DB9@CO1PR10MB4577.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nS45bygikH55TCJuw5b+JyRog/iLq9b8/hGIZmGcYFvDQdYOQwk/lY19i/Eqd6zcO4xNWKXtp2xChgqcBkXqJvkYajsYEqTJrqxg2DQRMwpWwx+5UVRvv7+kjAHtQRcUU/xwUNe3SXyz6Bxv0dlUigYNpcXmI5rmJvcOKaZXQdcjueAGae1N8sxHuRTapnopyIW+HzkPUa/7EvZj0DPiu4+paoNyYk4qGGiFhVbiIH0H/W+SQgZIv+ewZUrWDxyxjLHQu2L94T+YXuHkMJ5n9JBBFRIeMsu5uoYhbKMsOWYaxgRzHhufxOnnQ+uYv8D3tscmO6gQFPQQXsLSZF3Mrhuap324K0QlXX8ABslJpRO4kcZ6uSDQczQTcv80kaLQgicTmzaNRoFP7e4uWZNB92xfhe6+qd2j8BEqcpC+4sqPfhLX4d1D54hu+X/G75JQm3pyhQ8PYytRMCUV2rFMJh69b32T5MOjDY3lwss1o/YW/TQzMWosYbCQMej+oo47MhaktNmKgaPJ+a5vtC185KQH5isaH4y/HTvPWdl71ve0pGQb4FEwfU+CR8XY9OY0I+vYUo06Gd60ky9+qHzzDZOdeS1Xv+BdGYxIhi+HuC0LRYYfVrZTlgJ8RRAsRLrssVpmjopCURcigC0PE0eDPrzFXjr6Y7xBhMoj8hEd5RI7GKAxgqJ5KE1vsBNqFZ6mNkaBvCgy1jjHMtrsKlz1Thci4hgrST3yL19yU6xPkFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(136003)(366004)(103116003)(36756003)(478600001)(86362001)(956004)(4326008)(52116002)(5660300002)(6486002)(66946007)(2906002)(38350700002)(186003)(38100700002)(66556008)(26005)(66476007)(6506007)(6666004)(6512007)(316002)(8676002)(8936002)(1076003)(7416002)(83380400001)(2616005)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k7RiKFSyQaA8WocPwfNBn4M99RNRm301yxmnOzI9CtV8Iif9D3Fo+Lbl0n/g?=
 =?us-ascii?Q?d4Exat99ja97f2uVUN4kuv1tG4i0A+xdyIzSQIe/DyMthN1WXSXt7kochwGa?=
 =?us-ascii?Q?8aYfJYQpMUVZs4MPW8mbIrd1TfJJXbEQhlUKDSYYgYpH6Htn1LD9Lo2fcdK2?=
 =?us-ascii?Q?zM5z84CejZQTLmaKBNjbXiSmHxS5QNtUfWBYjM19Hnvl8nZx62PIjOyew0eu?=
 =?us-ascii?Q?XJ2B36fBE4RoWuMXWLX9bhdNp3B8i+Y5BUksmndI/ELq6JUB41v0jaBe3AEu?=
 =?us-ascii?Q?XwCg7EYv//Yd7hAHgyOAW4ziV/PrTq+CqHMPG+faQisw/6RktPj0ZfgP9+ci?=
 =?us-ascii?Q?PTQbBtYkr4vq8c1ZhJ04QseWgA2PBKfpQPezjLsdTx3mRL8en7UEhZIyHXm+?=
 =?us-ascii?Q?bEN8da5i0Y6e+CdWaZECisjFPXIkzWXDPcp3WmnBj1nIRm/Cj6uGgZn5gD9W?=
 =?us-ascii?Q?eCUK5ZpI19AHzxrxPwwXGy3Hr2o+warpGHNnD7UYV8G1gWOk0xMIaQMcMS1h?=
 =?us-ascii?Q?LWDVwvL8aYL0irvC+fZOyaGi/6FhNV8Ag5W0GO9P0qm4sSs24MOD/FtrcAVS?=
 =?us-ascii?Q?yjpYyIgvMmyRorbbLXM+SNVpoOyFC16hlDmSokz1zeZ+RZTks89jobNNcAQ7?=
 =?us-ascii?Q?fx9yhl6IdxTCB1YL9WvGnkfpWM24Hb2UTvSouwpJ/M3VGug80KVA1q7WJ9VH?=
 =?us-ascii?Q?6fFzI1jqBP1vz7pq+ItT8lnOcsuY4WH+TmkWFUHXyRZbUk18LWOC+lk49gWq?=
 =?us-ascii?Q?vAHey7W6NAOHPjM8W0c2NjmGKn3ldymAihlBvRzn4LPGRAkT/eVbQ2V3ydqm?=
 =?us-ascii?Q?N+CsrCsfwQSSpkvZvXndCd9V7oX5aFkiwgcu5FTOPsJtSximbffClp4vrKYn?=
 =?us-ascii?Q?axG5W0UbQSoRv/TN8OM86fiKrjhPAhpIr6zcHElo+jQ1yinOm7HmN1DcGNmw?=
 =?us-ascii?Q?Pm0QPuepMnuefWyTo8XOj2ejy4DUFr0hfCavYp5bwrMgK1pQG9++67cZhXL3?=
 =?us-ascii?Q?oAzkJ32sZa78hDev8QrjFUyloVs7nna+mRLJ4tI5MlZinaPtF4QAQ7KcHMVc?=
 =?us-ascii?Q?MPDBFaVqj127pSmJ3bYMzJiMoRKiWsrsFcP34JUp15yFwNQBjVERlhdSygg0?=
 =?us-ascii?Q?cQz4pZ/oEqlqiixSPF0O04mD5sE62ibDsS0U1Vu8MFIgrZSmwLgM2EWSYBjB?=
 =?us-ascii?Q?CzR/5fhEEyrfSJJ5vFRueIoDtCA53ZRYstjlr4iQ0f+pl4gvYC9XXqoL1fjy?=
 =?us-ascii?Q?fHCbUqCL5iCK3ft8J9zamKUyNxwakQ/9wGORFXnML3EpNPwTMCXzcs4u9Xw+?=
 =?us-ascii?Q?tkzqQj9EMW4rhIV37qpL0PlD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056df092-c7d3-4d0e-2d76-08d977eae914
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 01:48:27.1896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPpU44yMGTo6mvoDklPyyy9AALlLsGNb58FSCSilW2H04VmUNOjEoCmrGTaKPn8gGsgsFWFe+p1Sq0N8x2hi4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150008
X-Proofpoint-GUID: gKYRBf5Tr875t2dmjJBiYoEh_PwN657d
X-Proofpoint-ORIG-GUID: gKYRBf5Tr875t2dmjJBiYoEh_PwN657d
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

