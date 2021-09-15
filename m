Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3D40BD4C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 03:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B935E6E88E;
	Wed, 15 Sep 2021 01:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861F86E88E;
 Wed, 15 Sep 2021 01:48:31 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18EKxd85018637; 
 Wed, 15 Sep 2021 01:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=0WYbvxcL1nXMXdPRZda/ZyvjEv2VdoJb171b9bFAmLCusfiTW3tOKsDdZc41wgWSERPj
 KVuggQ28rmbePwXJLdAYaU9w3sRqHgQUp8GALJz4cy/VbrA3S54y4Bwmt/xpfRDHp+qQ
 m28ZabiYowg87hrmySZCYhfwCXUu3zpoBKm2Ao1M/+aRKqc8A+yIjyYCLsuX4p8C115G
 mWSNBMYRHGXYFusX9tKO/QF/qdR1EIH2X7N7sGH7nBwnVmjR4+S6m0HYp6hsQ4ghgtPm
 bWxc3Qz97Reu2o7/ddE41VFKnWv3AqGuJIqe1bVHrBK1jfAEBNmMtOqAUYtGVhm2Linp eA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=rEMRty+pr7bOs7TMcIuAqqs4GMDTyjiZxWYvn0pk4sx2g6XGVPQAWFCHpGCw2+zVCaeu
 R2GzzOu8jpAbLkr4nO9GtT/8m7c1x7K7SzPzczbnG8OnB8BCKI4Py5qRV8b16baJCT/H
 kktW8XdjMbFfmh4PxhpNKb+SyX4D2zr04lIJY0HznViWOyIJ0lQJ/k1kVcbVIUjfzv3H
 6Izn0ZHn+SzaEZBYoqO2/kePMst5EhAE2Vyv8GxHfbFie5CGNXAX0hlQT3h1XLAxi/7E
 DyplYWg91ytpyT2snB+YyhWwoZUJOE5HlsRyofRWYGKkFTdIz6GNVKHRE8LZ0pWE7HJO kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2kj5uqw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F1fD30052378;
 Wed, 15 Sep 2021 01:48:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3030.oracle.com with ESMTP id 3b0hjvy76m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNaBqUojL/VDMbqSjamac7gKEwB8WmM//uW90OIjhC5Ofxv+wT83SjAWnkWPXLawE/CE9GVh4loJcP9da2dLQxZLHU1OjmP/yp3kGOSksnM/npMBprmsVoUTTCg8aiOMZU6GuvVHWJL9qlVMhTYqq83MzgmAoZe/LCDw6c9AZKDLnm5Ofp3Cjd0+g55+PbfHneW9bhp2a/RogErqw1k1n7fK3PQEw5YnSn02bdaEPaLPYK3F3078i2V+JiDxfyrp+qrve1gvtHs1EhOdei3NIZD8Kw+VIH5JKz4twwj2mORAD5lf3KrPL7HlI2uO+WW+n7X86uuDJbnCqnfSpiqzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=kth80nVzuzts7+H+N+u2xgqSL1SeaZQrVptIL2zc6z7UNGxX6FPiEr4B/sQr/18NOdVFenh8uZgcKKtCDBZtdqwfJAi27IheaOD2cuZK1wIxK084SDrY3lO/ZpsdE5jXBsnSqq+GUEjgRD79SH+DzIpcmZNIhhyonMgjtMCKs7YigIjG7epOJ6SbYbR3T0tBndLFjkEHBUlwneeP8FQLf4cOpFdW23Y6dRhU91DUt+cpeeo/DTsX5R/k21uAt7T/dEGsAVTaD+gf1fHT2aV1a47gnDqiBgW07YNbiFWKhxVYhON+m6/oXUkcipt8LqAwIgZYqILMPvLYCkDgc4mqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=cPr866EibBQWKj5HU2cSczv+7PCjUHnKUA9HU3wg+v9CF2Cd4xcY1gPgJ7xvfgzXv4dG8+8hZAQrsVK1q5P/VcilTbdIkMoUAhR01VvhOeHcb18z/9JJ/aC5dooZAsS8wtbJ76f/i1GEZQKERkYm9qZd7rGjfzB1O8PBg9NGW5o=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 01:48:18 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 01:48:18 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND 1/3] lib,
 stackdepot: check stackdepot handle before accessing slabs.
Date: Wed, 15 Sep 2021 11:48:04 +1000
Message-Id: <20210915014806.3206938-2-imran.f.khan@oracle.com>
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
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 01:48:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab695376-890f-4571-7ef2-08d977eae3c4
X-MS-TrafficTypeDiagnostic: CO1PR10MB4577:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4577AFF8A301FAC88AFD41E9B0DB9@CO1PR10MB4577.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: skUWA7aNH26xNnLi4/upUvdZsKq8mcqyRuXkG5xcV4EaWrYbE45yARJ1rYAoje/v3VgKN3gXxp2vntAsH42Sp2+tkdoJzSj1G0mtIYsd9YnhsUKfdlHLLSXP0NIj4h3oFxSUH83sjdx/2FjGCSVp4dsFCVMXI41tmqCHguYg3XN7zERpyKLjYDlaVi/XzdwLcjjpVkNIEdrIs+FqgikR89kn9y9azgRCI+7ZL8RMHIZbpJCfRS8ZlJMLzRAPB+hnDnmn7wCbQzu21MsZKGyMTjsY7Ei/K8k0mbAjaushsNAkVIUIjhG9OhksXXFYwmXQ1l+fTQo3pPfkDO9NNxLMBrEZeVesFxuy6UOxrG8h0WztaBTXQ5BLZyecmf1zpr2UDshRPmV6t/q72Af98baiXAknG1nAeujDnAwGbNh3mmP6eJHLrL3xbQMnoWmhPqTDnldD/Kx9Ybsi+8kxUtAosomwKr03JwepSfohqTqbji07/AiqrBtYU7jL9snN/7cq0eZMv3VnBZObeE5KTjPuvYHP7tG6JZpN45hbFQkHr6BmENJRP80OAeBr1HrDeDcPp1n7OU6vGWZ/0loXUwG78sBcCVBXX9HGKdgg9ti74ACxmdJ+nR+nAVvuGZC3q5igCNZXHqvxzUpKwCqwp2ksLb0vBIQUbjzKscfBSP3U+0ioXREJppNXIFReAzFafM8AJ9jvwhr4qK5s+fIvKkiAoiOlqq0xi4+1hIv4TgPqVvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(136003)(366004)(103116003)(36756003)(478600001)(86362001)(956004)(4326008)(52116002)(5660300002)(6486002)(66946007)(2906002)(38350700002)(186003)(38100700002)(66556008)(26005)(66476007)(6506007)(6666004)(6512007)(316002)(8676002)(8936002)(1076003)(7416002)(2616005)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1bPdLn+D0iT9oFWnEnYIGyU/lLmNaAr/56ll0nXp9tBj6YfhJN0JOqeodoB?=
 =?us-ascii?Q?L/BaxwRxU6awo5XA2GNN4lVsE3SvxDHQ/0OFenzWbkzJJu2v0+A0ApubDD+l?=
 =?us-ascii?Q?6Th5EKXf9tD6UmHVJ8UQz+uIEB6ScKr3x8mXa8UMv0ckowqmCiBraGFmK6eB?=
 =?us-ascii?Q?ojEH+Gnc682SbHieecBcVFe06/hV4s18/O8A7F3l/SICt0LfG4WY0Ak7HubI?=
 =?us-ascii?Q?NrifMHcNyXkZ643QMkCkmDarxupm4NvI130HU6KQEVxj3vC5T1fQ+3h5Z57A?=
 =?us-ascii?Q?SyDOsG0gLMdXwmkeueUCOWHMFDHBh2J5fYWgdGmNUqjlSjRqQw9SOlzUDyBS?=
 =?us-ascii?Q?LSHEbX6weDHEHA8ByUY7z1f352jsndd3yHt3mLYscPRgxkLU3X4V8PnQTOp9?=
 =?us-ascii?Q?gsB9J4qyNZRoPs5NrkvlgRtMwAAYqCcSOwS5z6M9sqbv448Wca9AvMXjjSwh?=
 =?us-ascii?Q?gKFJSHDks8lom8IZtZMb8tkxiVXRry9OqkWveRMWTkdGDbX5GtppqCczduSX?=
 =?us-ascii?Q?gn7Q8Ydsbx5ipW1auduGpbuRcQXxA8KJdWjpZP4/Ac3xdegodY85OfdFUnFS?=
 =?us-ascii?Q?HHab2ItY1/rV63V9VYfnO56smhfbvN1wHYVfhSsDC9P2AY5Eo4SZGBcFrF3H?=
 =?us-ascii?Q?2mheHnr/0CIzth0K5h5Biy+WskAQi/sdzN5g6aVMYkIwh8sICmBWaur1ElXH?=
 =?us-ascii?Q?AZElpoKr7r+pt20MaeJgRuYBN9OeEordYSQxIhasYjLLtFRGuMfg5gjBqRCr?=
 =?us-ascii?Q?AiNjs64POCKE2dh4VdHCLgs+I7rMxQBNuXIeRyblrII+JvfaGXOswyReVHnx?=
 =?us-ascii?Q?EGsbu6zyWsdSIRm7H7QPCDcO9vl3ZNP89WZfNsRlPVp2F/m/TYh6PlQpS8Xj?=
 =?us-ascii?Q?4eGZYQDP04rCryW1pcaGEc1QnonB/denfSWrKXPNhBbWbRuKl7pC+g8sK+ku?=
 =?us-ascii?Q?38Hey65MalHaDNkSIJuicJe225omqx68h7jqPuOOF2LNHCE9uy/7hUXwz15O?=
 =?us-ascii?Q?VjJrFYZCfJsPyoFzevOGYruJdnlSmR66KhuXx8eJeS+k8bxUW30/uGWMVKID?=
 =?us-ascii?Q?OZI1Nn5APrHq0yiFX3Y4wy5Z0p0MwLbz0gGH8yx8bRBvRI02EU2O60Lk6a+U?=
 =?us-ascii?Q?dwf17c9KvRmeDnziaiV1thKeXa0D9O7ccb5RKiFxfjtbxMTFAMA70abhI/AD?=
 =?us-ascii?Q?cW4uQMsUpwsuV4cShxeToWNyeF5TVfjsIZEzy0E8AdMk10HKggIQRoIBs/au?=
 =?us-ascii?Q?bIBTdlSTK2YOR2PMwgKWppqShgyGmpqE4UCgDXyo674M5FL0K3buDiBWMpR4?=
 =?us-ascii?Q?bIryKbgvNIajKODtLbZP6wg7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab695376-890f-4571-7ef2-08d977eae3c4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 01:48:18.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJc5RPVxjWnkugCi4qjIG4Gprb0X/JHywoZuH2po+P0m5L4vfeqOshk08yvlcySYLMNf3kJdtkPNc2K02Tg/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150008
X-Proofpoint-ORIG-GUID: njEqINB1AZsZzz96KfLP4lMeuopx5NwH
X-Proofpoint-GUID: njEqINB1AZsZzz96KfLP4lMeuopx5NwH
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

stack_depot_save allocates slabs that will be used for storing
objects in future.If this slab allocation fails we may get to
a situation where space allocation for a new stack_record fails,
causing stack_depot_save to return 0 as handle.
If user of this handle ends up invoking stack_depot_fetch with
this handle value, current implementation of stack_depot_fetch
will end up using slab from wrong index.
To avoid this check handle value at the beginning.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Suggested-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 lib/stackdepot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 0a2e417f83cb..67439c082490 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -232,6 +232,9 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 	struct stack_record *stack;
 
 	*entries = NULL;
+	if (!handle)
+		return 0;
+
 	if (parts.slabindex > depot_index) {
 		WARN(1, "slab index %d out of bounds (%d) for stack id %08x\n",
 			parts.slabindex, depot_index, handle);
-- 
2.30.2

