Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8940CBFD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 19:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4B06E9CC;
	Wed, 15 Sep 2021 17:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9676E9CC;
 Wed, 15 Sep 2021 17:53:47 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FGQVkA032050; 
 Wed, 15 Sep 2021 17:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=zKfVn/Mqc1xE4x64XLRXmpSvVCJ62Twm1d236cJpZl9yPnf66sJN5O1h3sxSx5CrYynG
 8lmXGungbTTMcSe9my5CjeksvNiRH+PTn/AFhLifnx8WHwSlYa9WeQ78EZV/MPgDBjz+
 ZEOS0IZ7G2fHpCyptOo6FvfQ7xifFZcP9wa/2SKhEsX1g/zi2ZrOc+tHFcsCo3Aoilof
 5q4MXdTXpuAHy6+XVrXJ4vcnVysiAX2kGUZurk8x56XwHf+3i6jxKj1yLBhfJ5UoFSFo
 1k9AC8n2C5qkOVq081ilpW0JNuAlpb6zpsIOS/2Mzq+7NCS5dkKQjUOFGQJdrkD0EITj kQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=a5XfrbiPavTh73+Y+eCYxpGJxgeyAneBzfbm0VoSukjpNtEyckOWA56PzHWWasrfZNKZ
 N4uD4H2fOHQNuJvq2j6XG+0YS/2DA85ANqD/JL5eYB0pKTGKEo74q8ff4v2C8dNFfkXY
 mIvXjzz96EnV4dHXw4CkqmyA8BEizxAl2l3XkA3VPZ+0lv399xBR5cxT50kxE8b7BZT6
 kfh4QiyehHRLR3y9u+F7ynbcMe2p6Gi7ENcEMKC3Wr5VXwjH4menpM/kJG2LkEBWX5ZJ
 SyY90rILeVedQov5oo+RUo5E7dHg/vcRCOp1KqbwEIJlFYIEaDgGG96wHtBSi5+28kq+ lQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2p3mp3nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18FHkb8R011001;
 Wed, 15 Sep 2021 17:53:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3030.oracle.com with ESMTP id 3b0jgeywkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXTB79vBiWsMnI5lwanDOdzOLQ138GrKLjAT6ueT8DrLoZ1XJ3ZmF1N2rF3+paQQ+LxYqkf9bLzJle/X4pSTFmZn5IsTMcGFU8rYGYk5vlR/ycKWTLcCu2PlBpZxe7qXL3zFLRx6gbs7MMYpGtGJAvXgEPv2I6UB+9Fb5gg1vgaC+3DCWWLY+4fo52pe6t0QH81fUyhPh+H/kwx8u1FUEnbuzbFkQPuHDl9ij4H2y8Ut8xulhvfXeDeBxh63Hz1onNEo+o/ppjsvxt2nknwtpazrwdppwG39mYnpjx7f3RdSdBxhLoVJFe22Uhjz0ZvQi7jm295s6n2ziz5QqO9b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=f3UH+543Ve8LOpISL1CKTl/atkRXkIHoPLLLUgkwOsOQK0cEv14kw6o4RLLa1M/shX2h2Lxu0YkKIxJ4To8/0jb0R4/nST5nfo14ARayhuEwY/Hj72omBNlnYV6r0a+8A+6V7pZy8b0oImuh8pY7zHIV7i5y0rWd927gg+EdyPAGnfYMvKXO0AhwlwQWzDHrQKKPH59p8PB5IdP66w8qBw04v4h30FcIRs7hIf2Y2H/azlz8RZHwj2QxPkkJeoe9daLormBDmxzGABgQXGNFsdxkYrK0ojMrXRAcZHp/UtmANyP2pxFfBFEDIMc18o20sJDB7nWgLAIpvA4SpLKQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djpiZ+Iw4TesK+uaQeTOjrZ8ApiLlTS279wKi/Fpmok=;
 b=d3ZUtT44ww5GbBBWPuPNZCleqrABnJfcRts8/xdfweJizuuzFAVS5Dx5iwzCbVgsHQd8w7tNexP9ZMfcDwW/hCDlljgFiS3bEB188g8AS0IN4RaNp7u/xoPEDcsp9REh1Cntj3rso1GIaMrCzISI+MpO8/uZ7Tb6/Rn0vddny70=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1568.namprd10.prod.outlook.com (2603:10b6:300:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 17:53:33 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 17:53:33 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v2 1/3] lib,
 stackdepot: check stackdepot handle before accessing slabs.
Date: Thu, 16 Sep 2021 03:53:19 +1000
Message-Id: <20210915175321.3472770-2-imran.f.khan@oracle.com>
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
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 17:53:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a069c18a-1825-4b5e-b4a7-08d97871bbbf
X-MS-TrafficTypeDiagnostic: MWHPR10MB1568:
X-Microsoft-Antispam-PRVS: <MWHPR10MB15680A0B236C98FE4700A8EDB0DB9@MWHPR10MB1568.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3Lm5TQIlUVOZO2oecX7ouScxglXQmPxd68bP8BnIrxS8W+ksohXkLBwwCNuFMm/tlO+zm3gXbp0kqUNVSiNmJOCyC+Zzo3pYb9KfVTTVmFGvyjXT3RnKdaOUF9lu2SnZ5Pmp87jFzhjt103vADjqaW1EEMLfPVIfh1Bpu0wPscmgDhaXS6zh/MnWIdd1WPhYDrqvVdLdQ7F/MD0izMwhBPyI4bVXnM12v7xUew3jdCJoN4H+lZD0R36m+MdkGE6DtECdGJweXC06yIdMR9W4P56Q6Z47nxczab2a3dP6+KiShl2XgYi7GmjRRaRTSULdc2Zc+Ouu3xbYClVGQJsrlHG7rsplKn7yvJLg7RePFwuNiuV9QzRkeJ4OwCtKylREWVwNcq/gfNGVJ+5kLWO00vxh2bQPdvtCbVdkVfhbf5CdMf0YamtvOiQDNfpFGWji2DHWImEjTswjv5d3bW55+LvcIPweOm5uma45ACpGaOYTBBRT4cAixHvWiu93fDn9tzvqWapwEbRJlAc11Ds5IRwL2gqfPZr4tCgQXyMjBS7Pl4LkPT70S41EwFzA5/3wjOBuJrvhUnD8bJelV9NgD1QJnG2/FIpWL4JV6gVH4yRfLisV0Vd3FrRsvtiRKcBjKttDOMZhGD7DezMuXIROxxY5IpX2Ew7l4DaEajtAOpRQS6CKRUSi2grXjIeBAfCCb42ZiPj9Cv+W4uCt/sBUi5AfKbE9aizIYKb610I8Cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(396003)(366004)(346002)(6486002)(66556008)(66946007)(2906002)(6666004)(921005)(66476007)(38100700002)(8936002)(6506007)(38350700002)(7416002)(956004)(2616005)(8676002)(26005)(186003)(52116002)(103116003)(36756003)(316002)(86362001)(1076003)(5660300002)(478600001)(6512007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Trjx/dKqg0i7yvemaymtLmhGpKWMn8ohJQp91GR+HhOkJUp0FBTwJ3SGcQuX?=
 =?us-ascii?Q?j2M8cjnzP/hyzxZSTLdFSCD7Z/9T9IhCz1sJvvSr29iUog3lLddVtdudkqig?=
 =?us-ascii?Q?j65K8d3CdU2P+RNNpGR1Sf7sne515aSyAKYonG+DQU0ndw7m4PFklfGAdQCV?=
 =?us-ascii?Q?+WQg3Km1k/jD9KDuYMtF3gxDM7l71dXJJ3FgCS5lqOunP1rOB8yFJRVXfruh?=
 =?us-ascii?Q?Z4cwWdfRa4SX+gi6KZoi4G60U1loIVkARFROvMMIY8yaUdVjoH5kUuM8y3Th?=
 =?us-ascii?Q?Z9aeTlZUzO2B4jps4jx7nIlxrOhOUewcbTuMxPDYKgXANgzfje4DoB/DvZcI?=
 =?us-ascii?Q?Idbld22fmjeiO78Gj1Intcx8a9pqhjdWPdJroWh993k+zenE/uJQctim2rfX?=
 =?us-ascii?Q?7jkxD6K3fMOCDhUjE5DdGkiHWiTW53URAHFe23qYveCnz/YLM2aNYGrJtIoU?=
 =?us-ascii?Q?XOjwC7m2Pqi4AwBMpvP5FM9ZdRQ1Y17YesNPI/x9G8XKJTWcOEMqQumQgBeg?=
 =?us-ascii?Q?4irwfBXlIS+nncpXDL/MYzHzTUxdbwJXqU491wq+ijOi56f7YbjUSPUXU+A9?=
 =?us-ascii?Q?XT8ajuE51/0V1tFPAR/vRVtUBacWFbhnLt0gM1N005m4aM6eXP1HKrgp4obC?=
 =?us-ascii?Q?L4/WtWPDP5daHZlRaTneci4azcmT2T2uUQ5Z61sMu+RyedseH2sPxPJUBmC8?=
 =?us-ascii?Q?NMcfUhhpH78xN6BkAHzQrekzbZENN/fQgGaLXO++1FNMvi3cV1XygWdEwZfk?=
 =?us-ascii?Q?FZU0p7WCM4zzVLH0XkDEI3R4t8Io/kUn+25NjeHj66drLRXkoMYmHRou98h7?=
 =?us-ascii?Q?4LNbeM25v+/K5qDYh3t3HMbuZPCtaJ9oUsMgSxrJWKwX8B7dok1sLpbM3D+C?=
 =?us-ascii?Q?ot/jWJCD81KBSyYph4NH37uanLTkAqoEBWUl7V1X2vxC3QtvwyGel14GDW0b?=
 =?us-ascii?Q?5ZEVCbvvcuoV5mo9TueMIVxQZwIQ+dkWOBIgWaom9RK0cR7nG4OD3QBAzvXc?=
 =?us-ascii?Q?uRaV89a/vkcUls/4lwi6d2ztuWMe0FfbvrKVzbmEYIEOnCJlUEpoSZbiYbpl?=
 =?us-ascii?Q?VqivIM46V6HEV82uxPBGxUZ0jrwTevY4ceLmVeMtLB0dkMAgvGmv2Xj28YOC?=
 =?us-ascii?Q?cVc9YLYYKDPz+lzZOr31UwLH9RXy4P6ZOTAUnK3zaVbVzLelGTREalasmh8N?=
 =?us-ascii?Q?Xp72OE/oJnc2OxoU0XviEKIPIRe2PMaMxYPULiA7EYh0ktXe44B8FiGy+IEr?=
 =?us-ascii?Q?sfOzGi9gSBzmE/8B9h++P6sGJm39kbrooQreqJtLrnzSzWwvlbTLSWLAvEVf?=
 =?us-ascii?Q?xwVxp5J2I7IsloCaLqk1apFO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a069c18a-1825-4b5e-b4a7-08d97871bbbf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 17:53:32.9850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6R+y6355P3zst+4PNstQuQc3mXzVlBTEw9S5HxG8STyHm9exRZFjBebDxJ4Loj3fJGU91Puw/+VOYTlMs8GAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1568
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150105
X-Proofpoint-GUID: 3bRBentITE57k1T5UTIDpPS-FFao9OqJ
X-Proofpoint-ORIG-GUID: 3bRBentITE57k1T5UTIDpPS-FFao9OqJ
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

