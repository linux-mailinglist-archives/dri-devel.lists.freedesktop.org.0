Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7C40DB61
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6F06EDC3;
	Thu, 16 Sep 2021 13:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8A36EDCA;
 Thu, 16 Sep 2021 13:36:06 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GDC7sd010930; 
 Thu, 16 Sep 2021 13:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=cRRk+sXogVrt4bTvErjKswwrG1qLWtjGxrr6AKaZ/bge1sOzQi3buAFEXdgg1Ymw7Wxk
 1bTJ9OB3vXYkdQVJ270JwzHpKHuOLY+dz6YtcbO3aoqIKp89186uHjwVC3zOsfyTZ/MD
 SXU/isMEd/3MLTz7eYLqv1q62G+aqBAFrsrNIvjgmUXJZwiI1A4hZwONNH5dRvbCcqh2
 o/GEvW3S57pzla3+tmFz03DbE/SMSZxZqCPnAV0aWieDdcTUgmwOxYhkINXfzxiLiJ7t
 nlUs7EWYFbky7wWTM5flZxcL76TQoHmn+oQfMAPcFzBAC1HhXM8wOQrKmjCJjxGDkZUs 3Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=PBIShyqfa39NTpEwTzd6S94mQtwYR6jG/Kxt8NIKGZ9wC6+b+XbLThNubgDpGztFR68h
 NtDOKNyElrmzptUl72UA5DO+gilxFtekmIDSAWPMjE6/fESvCsdsyaruzDzXT83knMCE
 N0in/7oTLbQjWniKEnLg15eXnMcsa1wesF5LEdg7HGXEPEM+CVq1VNeCW+nzytsa4OQA
 PBIf9ZLf0dOGX/9pN47zlaaziq0wICKa7QD1ienjw1hWCIW9zwQNUHgoysyqTeijeFgu
 hz5/qcK5HuFg5w6+t3ozmAhsJ661zNywbPssukF2fX5xstxmuw/c9OogFBYTwY9FJo4I mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3jyskn1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDUfa2023552;
 Thu, 16 Sep 2021 13:35:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by aserp3030.oracle.com with ESMTP id 3b0jgg51es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkKZUFi6wxJOxH5W/ksUDEFL5BUR04I3qL5dpWVTYfRjDWPSr3mbcgHEjfm9HDk7GK49KAhZPZIOY43jpjVkz98SF5+sMwLLHbgumB21FD5KUj+RvC8AyI4/I9rWSHFUda5b+O3R1R8XSs4neYI5n+I10VK7NzbC8t3Rd5p2pMlyD9AkKH5/9CvepXrtSaTZeUVeyDiX26dXUEwnMv4ehje69EMdQAOCL70BHisl2m3Ew7KYhJ/uYj65/FzTFGfd2jCnDEOoH2ndo6+pcxOyM5YyRM71nrhUnHyGkPFKAXYHh+Vuz+Vy+gQHzfrqGRWkqmYVLDlPl6sgW9iTttd+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=GJtU+V0VK4+KQUIQdjY1iidT0oKmbV09vDk8Q9Nfc5dk4VElQnCP7VvaxEyFz3X0bWQ7a89VAGcpRNBoE+LIgVrmNNQtU526AJ8Tu/jORwiA5N4rgvr1ml0n9k6+A8ZJSHTX64fM/3/o5OAaOWct6RPyrq+9eOvGxnWSoAUfriifaVyqo+RTY909jPOLKq+oTczDWyQSR3Y5MuYqRkRzp5I2w3ayei87tg0V/XqbozWGDdpzBhuumxietxy2vW2KkDJyy58tTS8e6cNeN674BNEXmLet1haGiNlq12mXCJPG/+1XyvkHu0rMyGR9FAtjw2hjVUFte6+/IGO+e3jIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dipXClo1/UKYWeu/BfE3k5ffLLi+bpTaCkDFmK7oqGU=;
 b=vi6R+eta9BDrwyNmrVWM0n9KQr0kBWdPq+mx0OxJY3T6/4FWMdDhNxIM3zxUlxdhIYrIg8RbjEcdRmY4BOX1OfwS1x8mUIkLPghGBPGlwuJKFjzKklfmCAqbiYypyF5epVtO7wahFNmUyy+c6glabdT7sbZ/CUB21g59wuuN8Z8=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO6PR10MB5572.namprd10.prod.outlook.com (2603:10b6:303:147::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:35:51 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:35:51 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v3 2/3] lib,
 stackdepot: Add helper to print stack entries.
Date: Thu, 16 Sep 2021 23:35:34 +1000
Message-Id: <20210916133535.3592491-3-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916133535.3592491-1-imran.f.khan@oracle.com>
References: <20210916133535.3592491-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20)
 To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 13:35:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76386376-b021-4bfe-9bce-08d97916e6a5
X-MS-TrafficTypeDiagnostic: CO6PR10MB5572:
X-Microsoft-Antispam-PRVS: <CO6PR10MB557240177FC16350DA39CAABB0DC9@CO6PR10MB5572.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0MITbsavNlclSW5Cw0SpIzMO7cTH+lgrtr2eDrIMtM7T0Tj3GDPfW17eIppALHgwcX1OSCd61ZSFu8kT/xJJWNtRaGnMegffVrugRJlb2uVyBcnNd6bHgHgenbrgRvsdvGDVRjhZ+ZCzujZA5sN56oKpse7ZsVGOBO8zvZu870Cu6olpr7phItUb4COzasAdLC4Jq0nLqAjTyzaGnpyoIshVj89JtxICU5tw3aO6RCTUxnuEicL7a3AkXaPY5cTEchJ62qse17nU65V4NmmuvD1bi0PR2q5+df2KnRw4DbXtmUCyj+Kn5mbNPiDxbwq8H1Yff0Djg95pBCaYAWOLcP7w9QmejgQjebCT5nEtJLhfUKh0grP/c4409y7W2K4HjBeNowh48GKCn0e3PpJZ3Yt4xTimwmW0XGtL8ciX4mXSYfOMx4ouA2llAZ1jj7gccFEAtdeYYm7X8o5WeudUJrK4c9yLEFl8q4YnZTlBJMUrmlaVKOjIvj3AEDUDqfmxBfWaM4XwfHlGi2vgimdFlC3zWePrYqt74lfUBSTv7jn/Xkb5vm22x5PU7/y1sE0aefZsCQAeU27FscY+QExpCb7dpWXPkYOouzcJrB4K6VIVOZb2ycSszgJn0A9+5NRhArmhJhrCLfTdUSRn/+EJc+id12KvWDIzaioGDXMD2viVICxsqIUexliR3aZQnEMNVaofIH34RPFzdTqs2IueFr/FId8Oyqx99kmWI4//6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(396003)(366004)(346002)(956004)(26005)(38100700002)(36756003)(83380400001)(2616005)(8936002)(38350700002)(186003)(316002)(2906002)(8676002)(921005)(52116002)(6486002)(6666004)(7416002)(6512007)(6506007)(103116003)(4326008)(478600001)(66946007)(5660300002)(86362001)(66556008)(66476007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PtEAU187fu+/0W2gJFPJB68US1Q/mShYGjElkxD11pj4s50+SrAOqrZVS+R9?=
 =?us-ascii?Q?xf60QkLFw72Tp6vBZlAMvd0SWeCHyvKsm0DFay4a2AwzKIyz6OREcoZtzSzG?=
 =?us-ascii?Q?LikcnHIz/xXehi+6KXR0o3M24kZwvyDWFVCRXNOIBMcjmeH0W1huU333kPRv?=
 =?us-ascii?Q?PBIkqVA6wSHuOZayVVkD2idz90TXyAaFYX4QpNwGY9hKU7znxZKf6g5wBB0c?=
 =?us-ascii?Q?QI89qrOxUYSWwqiQ9oeGgBmLMHEO/68Nh/K9v79dtI7Wbmx/EAlBom9/jCpF?=
 =?us-ascii?Q?5Ppl8dTCD4SHgSXULm/5XzHM/GQW9H/yrcedJW3cAZmi4YS9eRdoNK3M2vDa?=
 =?us-ascii?Q?GKODoQ+H01ZVQ9lLwUKhVPsNJ6EerfomOQELQgpDMKEw5IqN+jeb972AvEuz?=
 =?us-ascii?Q?saVt1TGuTfMLIukKvKnxeIg5nT4nXVpyVg2Mhhaj5WjlykYkFnmEmjXUDSW+?=
 =?us-ascii?Q?RG/MHxvcJNuY9LsQJHHieJSkCz6gLo4duQ5RBLSbfD2NRNxMyjzEq+G83AcO?=
 =?us-ascii?Q?KyAHC1qn6BDWZeUb67NVacT4BQzZaHYCiV2NW2scQQA4h1O9jN4c+EYXJ8NA?=
 =?us-ascii?Q?iyERD3602TSABK5QupLc+V1afhT0xi0jdW+otT5gVwCkUhxBj2IaaVBfeUhT?=
 =?us-ascii?Q?ooKxMK372/QZ7BkrwNt0um16f4UZth4kE0JdGbzj7ejpqT1N6G8oQl1q4mGe?=
 =?us-ascii?Q?ryCT6Y5GAkNsWbhb325vVl8gabhf9GU+FZCaT7qmHzF2NY9BoeqC8QnQuRhK?=
 =?us-ascii?Q?3Ge30RmbFcLKGMV+fCmh5ioLa9j0ttbM/sCxl2gKQFP8rGS/WdPLHFZ+w5Vl?=
 =?us-ascii?Q?gmVm/YKD5zr1by1DComZyX6DUb2KDwxsCIci9ru8FuUgYePbDEFSh3sIxZsQ?=
 =?us-ascii?Q?SARdz3b66radLnvIj5clveLGyjCL+D9p5e/cWdUji42M/4W7x9SEi93Zabky?=
 =?us-ascii?Q?ESZn5J38ckdPljVYYTbtS9VtmqXHtN8gmaB/mOENhZZPYpbLIZJNKRLWxIam?=
 =?us-ascii?Q?GchnGNVLpgJUymBQBfgVRxB7nN6n3Ksl2WY5DUwRyO2yqrARhFlp7f+fZ9QW?=
 =?us-ascii?Q?PEDm5plJoZxMXKz5NdEvzjXHX/MHnPfAy5++GxRPEtvRsChRN2vjm2uu7Lw0?=
 =?us-ascii?Q?DR862I9Uq+VsrOaVmpDB4rDbZc0e4wVyu6+v9BsfTv5OLpGitKAw5j5/ry8f?=
 =?us-ascii?Q?hfA7f2GYNbdP6WEZJIJRNcXHoVZePRg9EFVw65+FXdjEGJTlM2NvCMt3DpGr?=
 =?us-ascii?Q?AgsaAyxvYOff39O6ZT6uKKdnJoxy3c6MXySAOY73FQ9ArviO04fGuZJKMBl3?=
 =?us-ascii?Q?Mhd+ZzpnMFT22vyqxZ2rwUSi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76386376-b021-4bfe-9bce-08d97916e6a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:35:51.6993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6XpVfrWld3wDGQZqLYlfp66viGkf0R6wcpfGzioFeW6rijcW9fDtNhXo0dnAEGM3YMZDjGbgQX0HvTIpb4xOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5572
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160086
X-Proofpoint-GUID: 0aRCC4A6EcNd4V9Tz7sex4gGDkYD4kzC
X-Proofpoint-ORIG-GUID: 0aRCC4A6EcNd4V9Tz7sex4gGDkYD4kzC
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

To print a stack entries, users of stackdepot, first
use stack_depot_fetch to get a list of stack entries
and then use stack_trace_print to print this list.
Provide a helper in stackdepot to print stack entries
based on stackdepot handle.
Also change above mentioned users to use this helper.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Suggested-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
 include/linux/stackdepot.h |  2 ++
 lib/stackdepot.c           | 18 ++++++++++++++++++
 mm/kasan/report.c          | 15 +++------------
 mm/page_owner.c            | 13 ++++---------
 4 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 6bb4bc1a5f54..d77a30543dd4 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -19,6 +19,8 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 			       unsigned long **entries);
 
+void stack_depot_print(depot_stack_handle_t stack);
+
 unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
 
 #ifdef CONFIG_STACKDEPOT
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 67439c082490..354fe1b62017 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -214,6 +214,24 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
 	return NULL;
 }
 
+/**
+ * stack_depot_print - print stack entries from a depot
+ *
+ * @stack:		Stack depot handle which was returned from
+ *			stack_depot_save().
+ *
+ */
+void stack_depot_print(depot_stack_handle_t stack)
+{
+	unsigned long *entries;
+	unsigned int nr_entries;
+
+	nr_entries = stack_depot_fetch(stack, &entries);
+	if (nr_entries > 0)
+		stack_trace_print(entries, nr_entries, 0);
+}
+EXPORT_SYMBOL_GPL(stack_depot_print);
+
 /**
  * stack_depot_fetch - Fetch stack entries from a depot
  *
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 884a950c7026..3239fd8f8747 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -132,20 +132,11 @@ static void end_report(unsigned long *flags, unsigned long addr)
 	kasan_enable_current();
 }
 
-static void print_stack(depot_stack_handle_t stack)
-{
-	unsigned long *entries;
-	unsigned int nr_entries;
-
-	nr_entries = stack_depot_fetch(stack, &entries);
-	stack_trace_print(entries, nr_entries, 0);
-}
-
 static void print_track(struct kasan_track *track, const char *prefix)
 {
 	pr_err("%s by task %u:\n", prefix, track->pid);
 	if (track->stack) {
-		print_stack(track->stack);
+		stack_depot_print(track->stack);
 	} else {
 		pr_err("(stack is not available)\n");
 	}
@@ -214,12 +205,12 @@ static void describe_object_stacks(struct kmem_cache *cache, void *object,
 		return;
 	if (alloc_meta->aux_stack[0]) {
 		pr_err("Last potentially related work creation:\n");
-		print_stack(alloc_meta->aux_stack[0]);
+		stack_depot_print(alloc_meta->aux_stack[0]);
 		pr_err("\n");
 	}
 	if (alloc_meta->aux_stack[1]) {
 		pr_err("Second to last potentially related work creation:\n");
-		print_stack(alloc_meta->aux_stack[1]);
+		stack_depot_print(alloc_meta->aux_stack[1]);
 		pr_err("\n");
 	}
 #endif
diff --git a/mm/page_owner.c b/mm/page_owner.c
index d24ed221357c..7918770c2b2b 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -394,8 +394,6 @@ void __dump_page_owner(const struct page *page)
 	struct page_ext *page_ext = lookup_page_ext(page);
 	struct page_owner *page_owner;
 	depot_stack_handle_t handle;
-	unsigned long *entries;
-	unsigned int nr_entries;
 	gfp_t gfp_mask;
 	int mt;
 
@@ -423,20 +421,17 @@ void __dump_page_owner(const struct page *page)
 		 page_owner->pid, page_owner->ts_nsec, page_owner->free_ts_nsec);
 
 	handle = READ_ONCE(page_owner->handle);
-	if (!handle) {
+	if (!handle)
 		pr_alert("page_owner allocation stack trace missing\n");
-	} else {
-		nr_entries = stack_depot_fetch(handle, &entries);
-		stack_trace_print(entries, nr_entries, 0);
-	}
+	else
+		stack_depot_print(handle);
 
 	handle = READ_ONCE(page_owner->free_handle);
 	if (!handle) {
 		pr_alert("page_owner free stack trace missing\n");
 	} else {
-		nr_entries = stack_depot_fetch(handle, &entries);
 		pr_alert("page last free stack trace:\n");
-		stack_trace_print(entries, nr_entries, 0);
+		stack_depot_print(handle);
 	}
 
 	if (page_owner->last_migrate_reason != -1)
-- 
2.30.2

