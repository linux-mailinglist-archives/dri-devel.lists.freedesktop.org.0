Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27540A531
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F236E3C6;
	Tue, 14 Sep 2021 04:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC8B6E3C6;
 Tue, 14 Sep 2021 04:24:25 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DNXxdC005145; 
 Tue, 14 Sep 2021 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Kdlz1rFetrgoS3D/hKM55vu40SM50nR6DPvC3uIz2iM=;
 b=PcqufK6gJvebjLtIXQibxiCfo5oEQ9PZ/oR+DVTO8tE/wMxEN1Mlo4HgoDwSwm5q5twD
 UIX3bBvxOta0q7yUHgkSWXUFLLAiGjRPVi8p8GCodslo6nGawHcL+B44B2+YUDFB/zq0
 8qQwWGZ6yK+Z02PzOeegbRGW76TnDtP5gbCG4DHDAPZB2rZr8B6LR4pUYL03cwNbSXH9
 LDjSpTaM6evMlZIV5Qq2CT0zlMLe+bHiybTjm3ZAxCV+AcHE/0lgiskfL/Ry/S4mQAkw
 jFEKg1ngGuOUlv2Vz9zgfPhMCW/gQehubPFif4FrF7evTTfYThAzMcSuCn8pOFYi+5va UQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=Kdlz1rFetrgoS3D/hKM55vu40SM50nR6DPvC3uIz2iM=;
 b=ph20IZnmgvECHnsybKwVH+iJXRU1TsFQfYndXjYL/YAqsaM/+1oVrpiR1mvuFYOxLZxQ
 tAGsQFXiGCt2u3nfRKuLeCJAn8SeEAH6E0/TdcpX/DAZeNseFlT21GjbfJkO98/dFG/k
 Hpt0ahiE1mg2M8XjjuBcON5ZcEMqMvbnfkhmbMYvSpY08pzyg4Q0xnH/Xbm3igpKtmY/
 9nBxxVD6YEbfuU5Mun2pYL/cP3japrPAFK5M9LMUmxJ6IuILMg5eNI5TpgoGcUt4osVu
 f/KF0Fq+lonV0V4ymR6OqocKxwQ05nrsz/R4mnZJ45enjdCra0ZyUPzm09Gr9Evf66Wu 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b1ka9509a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 04:24:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18E4ALTY192643;
 Tue, 14 Sep 2021 04:24:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by aserp3020.oracle.com with ESMTP id 3b0m95p6xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 04:24:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doQo0zV4neMvXHM/6NCqSPqlBuQoEixvbpicZynTcgjCbTyaCI1yYOfCgVghSOVBA3SkV9vj4q4D9dl+SUGvo/Sj7yGn2LSBmqi5XggKDTO0dUtrrKimE7YxcrUO7JEN3CE9da2Nqk1LpI+aXaxVUF0foDtZavuTA6/gw8xvl/8ityZ2NGAGlGGLyosKQjWvyBFMzUYFN0ZnN3wLGqE7FjZEBq9a2+jXrs6DPY5oxw6bLCVr27QtgFRE2++QqqUXZA4h+nOjp6JLPhiN71LqQlTE8WcaSFqRofvawee3Jgvo67vrzYOwWjKV9iq3qMIO31IuRFSRB87hstzAYz37LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Kdlz1rFetrgoS3D/hKM55vu40SM50nR6DPvC3uIz2iM=;
 b=VSjxu+A2susnjv6r/P274iMgQ7yQLaEh+70OWPKBOpzqtH1Zfql6c5gRXBUQcyqmFTmpkgTwpOw9wu9AXC/0PcAtIgWM5XAmV2c6xiVfGvOXfqn4oLd2gkYSRJWk6A28omgfax1uu2BI6sRxeCrTuQkl72/f34FnXCZExEUb5tvjOruEtlD+PqTK3nfE1td8aCVPQjTEy8q0hWdhHmpcyHxwxQpfQpp1M5KO7C0zS1s6dKatvKs//6QNvcDm1scQAntXPCV5gubRkoqRGZEYZPtxVkhSwDQRUNULgGPnBuSd/hXYQz5Gn+gzsZeOihR0il2sBTdaci6W4hmrRPi1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdlz1rFetrgoS3D/hKM55vu40SM50nR6DPvC3uIz2iM=;
 b=RvGAuNrJouyP/4x3TswLXTzGdx5f78TXomkyFg6eFycNBUOZuNAAIx60XFbvIa0G3ywfeOw4Ll/DlVnAw8iuF3I22dg0KSytyUoM/D2P4JFcpUiJebxXHiB5QNyFOaiXBbQPjs6HxC0FHu14Ff2HIxceVenYvNu6bwIDGSP7HU0=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1727.namprd10.prod.outlook.com (2603:10b6:301:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 04:23:57 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 04:23:57 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH v2 1/1] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Tue, 14 Sep 2021 14:23:45 +1000
Message-Id: <20210914042345.1919996-2-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914042345.1919996-1-imran.f.khan@oracle.com>
References: <20210914042345.1919996-1-imran.f.khan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:10:31::28) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYCPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:10:31::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 04:23:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b74b6eb-6a92-4556-7df0-08d97737782f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1727:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1727F1FDCE070E86EFCCDB7FB0DA9@MWHPR10MB1727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CymA2pnBzK8MnJH6wOcoX/i6TpHeVxHxKBeBnlXnr9yu+/cDlm90ujLn9upj0vMaqdDztkb/A0pydznt4XylLLV/oGhFM2sKOuVyEpvuW1XtuRmoplBS2OBq9zoKTvP0L3LgyI/48neL2GZYO8v5A62QINbcGk1tr5BIjd/j97BqQICxOmhffLn9HSGGa30R+QUuCP5Zls8joKNEMlIdHGU4ew1SQDVQPPT0eVwGYY/bOkpuIVfDl6x6HFXJ5lDFicFkrLgI1JOxQanvRiK03a77qR6WJs0KKh0eiF9h9m9QzJcd0E7txuoG5kmDIj3KNrcGS2JOVDaFh7uHNppM70dzWfOiYrN5lA2RqmOw4o8F6lfwiC7yrT3jXcFETWI/hz5dILyrNdzIHOXglO92ISZ1XTqYXLMvUvU9+p1uJk5R1EgFwLgCuyQYDGxUp9uBjv52W4qdWG3iXmKzFkzGfxlAoUiRjAcbPjBDjaxWzl9ER08acvtmZ79hESGabhIW5IZjHx8aTgUKbebduuzKqercp9JpFj7aj/8fCZlAxuGRI2Q0kjdvKlxMFFSFHtxMFZK4i5Uxz/Skg7In3I6Qs8BVl6daeykI2UAXDKTlLSryfEKxMF14aNYQAP+lIEjKYw78O7PuVKm8b9ldSyUUa6k85V6QfJEGe2A2CTT4ITj7uKNphN1PU24vi819/NpQUx3KvDoI3qVfHtyCnyTQJIsV4s67NXLwXbBrJbjgFBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(376002)(39860400002)(6486002)(921005)(956004)(6506007)(8936002)(7416002)(1076003)(26005)(478600001)(103116003)(186003)(316002)(8676002)(36756003)(38350700002)(38100700002)(5660300002)(86362001)(66556008)(66476007)(6512007)(66946007)(4326008)(52116002)(83380400001)(6666004)(2906002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wRmpgCNfNbMicQrin8Hw4xfvzZBJ1u+BBUOy0YJE00OaOWUPQH46+6nNztdo?=
 =?us-ascii?Q?Jj01pXY9Eawiqft/p3Hyi2hy0TUvuJ9kJP9aCe8hPgWzUjthJkndvA7iO5s9?=
 =?us-ascii?Q?mkRqRhMWkMbAqgovEM3WX7DK8FYknu2MGnZ3g0NFWcKJI5XeuXr/zYO6ka3J?=
 =?us-ascii?Q?22NTEBuStmUrWER8T+8ouMSRyvIhp6+fsV1IUp1piDtcmDa5jsH138hrPfqB?=
 =?us-ascii?Q?e7gv/AJinRyvzNI4tL2EK15smNzAchagJWD3VHe/PNQyAqjqBJzHI7gYtltL?=
 =?us-ascii?Q?7/pkFP5MDPKXdy+YsBP4xJdzuaOJsWAP0JRHjsO5JTW22c8dpBMg3Ny47gXx?=
 =?us-ascii?Q?3El2/mVsgGgFKOhqvGKw6KvphKVHpuNOQvewd7AOOnOdBI1nSXS8KMWrMfZs?=
 =?us-ascii?Q?6pSvvljaj+L8XBoibCDTAKq/D6TDX4HqUuf9vW2xTMafZ6x+8vJyR4uSBg3c?=
 =?us-ascii?Q?hqqcCs7ZeZDZaQdTNx+KP21TO3or4B0oUs27cBm/dSTSXf3tKk1gf3gXFk0s?=
 =?us-ascii?Q?SkdTZrCmWn6OV4bGBsH5mzmmPcWkOK1WLuZV7Soy13PjxSf1uj8hvBi26OTy?=
 =?us-ascii?Q?CbMOz0W5n/Nl5jEgeplBctIMz2rGiAaEpprAgQI+H3GWcqiD4lRn+OrjY+3b?=
 =?us-ascii?Q?wBM6aAO9MWSuUwd0FL+yrVRKvQqQDvhJcUbGzzT4zfb0nJ5vK7vX/3dN/gur?=
 =?us-ascii?Q?YCQ7cJVSNMh5hBnNp2V5Ot3WfLLDCsBu29EnRiJ5j+GyhcRYNobfopLY66Rx?=
 =?us-ascii?Q?QGVTqpOX0d53AcHZ66lQ9wAcBle8h1XSx5gSOG2UoClRwANWiOUliSLTsBUF?=
 =?us-ascii?Q?tbsGbLLhp7PtsQI77pTeMxMaKbyNzmQWKzTU2O6meqN7zoRvKslD2MUWeAIe?=
 =?us-ascii?Q?zrDhnWsdCUAFYdQbzTa6MqHuU2MTT93Xj0PtKGfzA3ipoAYyd7z+xAFy1eXl?=
 =?us-ascii?Q?dCxOvPTA6hLu0H9Mw9hBKckZUHAWqbQoyQXvA1wEJlbzsAOLvpbyC7imcAbF?=
 =?us-ascii?Q?wrCJS4p7FHz9d+DcF89IExiB5VvqvothCdjk2AnaiDWQ1dWoa9wFU+gaLOyN?=
 =?us-ascii?Q?kmbfb0D/QXmdEbBI3hfC1vaKnrrYzsfRd/Ldk5aWjgEca27Zqdo5nOEDjP4u?=
 =?us-ascii?Q?3yXS1b8UiFqxqvjQUuGRTumNRZ/t02v5oXnNge79c358yZ6FSNj37C9XBro5?=
 =?us-ascii?Q?WSxXBX+ZgmpM5swIYZFHI9xOMjl99UUA8SGGtuScNBTamrw45FCoFeWJEiCW?=
 =?us-ascii?Q?c1DBbLwMaDkVC7kGdIBCkGb41mRyNWHWD/GrLnGXAe+Hx16TtrL+gnWch2ZD?=
 =?us-ascii?Q?mH9E06sR7gadCQE2qkjZe51e?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b74b6eb-6a92-4556-7df0-08d97737782f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 04:23:57.3916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnFurecnXJl/h/ismf6La9qUNyh4+iBjN9KFFq35mtmG+E4oJMCkYRpwXUBkRSyAr6QDeBsCDXNNdJ/mD65XzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109140024
X-Proofpoint-GUID: RTQok1vewhHDGq5uMFy7mQQ8SVEil-t-
X-Proofpoint-ORIG-GUID: RTQok1vewhHDGq5uMFy7mQQ8SVEil-t-
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
index 873aeb152f52..d6524fab28e8 100644
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

