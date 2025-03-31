Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C31A770E8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A92110E4A8;
	Mon, 31 Mar 2025 22:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Mon, 31 Mar 2025 12:44:20 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E9D10E036;
 Mon, 31 Mar 2025 12:44:19 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VB7cCD008419;
 Mon, 31 Mar 2025 05:37:39 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pnshhjjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Mar 2025 05:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsqjKjz6dak4MljIj54ej7XxhURPFa8LJynY7ISIIIiIDXv5hK/rwJFpWzksACdneF7WHkgMb2bE/yXvtFgGjuTXf2KZihod7EUZmgq7Y09F3W+AHJwrIU/1f9X0KI2+Q5gFJYysYkELIkddRw6gd62a/cJJbrLWtX8o1He3WJwtRtWA1tF9a7xy1jhq7N+H7L1XE09kVCyV8uO2+XLLARpiNPM4wbdngz4fqFR8NSiumt+1s5RK3aYOHRIO62tvMJHp4I26Eke2U2i9G8oFdiuO+/spj+HZDc2m+rz/XCfXPO8GdQ1Ru95PSN24SZF2Zrs8m3G/SYx0oWevmdH79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQcEqpOxTiXrF/wRrze+Cugv6ccRy8OHIU8uAP+4Soo=;
 b=QsvtX7+955xqTgT5vmiiUUt1WiS9GoEvdR2Dg6WtpjE1lGVNUAu7u/plo5VOfoyTQICHPq3Fs482kRuf/dK/Xg1fTI1vOwnuoj/c3Clp4edIHqTSSIpoajPbD02StJVURCsayG4ZRCooCafRL+n2AjadSMmhZOqtCqkRYpP4rFasAxe3gmCroMGPJQcDyhAdRdEXfS4H6b6S87oP07II6hLoWSoZv1Hm1q1Sxey7FSczmDYh3hpla6npB4jRLUkxvJ1TwyRhF/rW8EhFR5hcTosfw57RnCzbX+Ke16XL6wvo0we1elqCZ9dTV0t0+zOvsuoVLqHvA9j0Qr52T4QXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:37:36 +0000
Received: from CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d]) by CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d%4]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 12:37:36 +0000
From: Cliff Liu <donghua.liu@windriver.com>
To: stable@vger.kernel.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 alex.hung@amd.com, jetlan9@163.com, wayne.lin@amd.com,
 donghua.liu@windriver.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhe.He@windriver.com
Subject: [PATCH 6.1.y] drm/amd/display: Check denominator crb_pipes before used
Date: Mon, 31 Mar 2025 20:37:23 +0800
Message-Id: <20250331123723.711372-1-donghua.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:404:a6::13) To CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7012:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: c036e910-69e2-4c54-8767-08dd7050d0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJEEy2VaFX+YoFkHNr4+b3K/J0WBDKc85ruDRHvAngiEiq6tBeQkZrzOLdMe?=
 =?us-ascii?Q?Qfvhm6lcZJfE5Gn9P3wuYZR/TjM+1S9Nc3N3VUz98kviJwZnFvOr5IHKcs5x?=
 =?us-ascii?Q?XwFfZxRXOL0fpz2qrWKBXfqpPjltxqOnDuo0pVbJ1aZtIRAuQKYLPltXFq8T?=
 =?us-ascii?Q?thYSZHrbWx0bAGmFx7rKAnNiIxdDepb4APle7Ce3DOvF2n+SufcltBh2tFl3?=
 =?us-ascii?Q?BqqLQSUcnDEaYNfphpMkMIKafeYpuTB04006XSfhlHYH6diyuti+F6yo/iOY?=
 =?us-ascii?Q?wFcvfI+mm9Klqyy3NCQghCzc2dKRZVn8AdryYFvGPO5g9x/AyvN5GLSq3F48?=
 =?us-ascii?Q?LiJrUz1pSEDVqVIJ1q7rOX9UIb3pXc++j3LlmQBS8vE2giAL8K+YheqvixQT?=
 =?us-ascii?Q?YiMrt2nP6uKIqxdDMfMCa6FqygcvrrmCmo0pJGmi5TNKCOr3Bj15GK6xHwR7?=
 =?us-ascii?Q?rTtyuxyVabKF30Wya16YvG2fm/YjesXB9t1otkEKedyZUpyn+BbOaPxOgaLW?=
 =?us-ascii?Q?zsZtoT3xVrgH3o9unqS/gLZ+6GDDH5tr9YQqk8RLqAIHWLTTkOLvgzfowu9G?=
 =?us-ascii?Q?hJNwSKML2eYo7FRXIHYNppJLest/i7yCyoplb+OtnHG/N7Xm7th/nqkWCL6X?=
 =?us-ascii?Q?VS8Mo/eQg82aOPWxjcPWczoqgIquQB1joTj4rA5ITSeaYLoPQB7fG5BGY4/N?=
 =?us-ascii?Q?Z4HpXzaI+7kFZOgOn0KG8SnjzCCa5nFlg8hEh0+M7g3O+ipooBcfLwTP16oj?=
 =?us-ascii?Q?BW42c1bT79mB/lwzAkm5akUY2QWBUN0ukbp+7bPqyOSm88lxlqFNwiNn9U9J?=
 =?us-ascii?Q?2Z91ciVJMWJBtgvFmSZdKuxYvorliCcYHiTu6/a7wPCu9Uf0QlfzxaNB5Q4m?=
 =?us-ascii?Q?+Zb3I96hqEw3RJKIl02j9KKQqA/wFVtKJiFcZcTzymU+n3okvrMjwezCwSh6?=
 =?us-ascii?Q?aBJEzSx9GPW0sUYJnILvopIr4LE0Fil0lCxyQQCcZSsaknmVoasXM4QsCEmy?=
 =?us-ascii?Q?MTsH/pthCxBD06oC8eoMd2W/594JpSEuTXsntFKe0zCC79GbyhJ/x+P+NzvT?=
 =?us-ascii?Q?ewlGDjx4l0XdDaDqgh5RWovvXq7WprAVgvhThRg6KWmOFfkZVOZNU9jC0R1P?=
 =?us-ascii?Q?8cDUPUNXcsEsAaaD6A+Rdz0kqnR+A0XiFQG5lnvGPyDHHfa5CXafjEPJMxWO?=
 =?us-ascii?Q?stZfvI5JIHV6y7S6gu4rXpvGvuP6uuQ/EM/3sRWAX+aXLBwvNzMLa/AmV3Bm?=
 =?us-ascii?Q?rN7o9fkInoRih+a1epEU+q1VP7g+7Vskctg8vO6faGXnMmI/CXHGxjqqRV+P?=
 =?us-ascii?Q?rRV3tJDWcS5jVgrW29y8glw5phLcpXMh+eVdu8Smp8oQxQhsehiMzhLNFsyP?=
 =?us-ascii?Q?2RyddksNbc/O35d4c1EJ3sh3T1xOLA7+cgwAIiLxRZctln3+GjFj+gFx9gdj?=
 =?us-ascii?Q?2KeVV7kFMIQvK0Mb1V+TmMYGmlCgcj1c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7012.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OqgoiTpXTpWx0arn7mj806KZA0RDn/25Lu4sa/+okyX74caGaDv69eRdinRu?=
 =?us-ascii?Q?85zvEu68rbP3cdGmpAhKmgJeaagVF0H7jyU+NKTLQYZWro6tmNULdZsJsgsq?=
 =?us-ascii?Q?wG0KOCJRQ6+sO1zUmCTE5/sIGUXYlROSFSJhHodehylIrnWU36aql5kY5uvv?=
 =?us-ascii?Q?3GSC+zP/8wvPYnFqD5MYIdOoyUIsp4MXvD0I2bbSmJoJxYs8ib84w4VNH72k?=
 =?us-ascii?Q?i8f8KnVuHZlFBxoA5XVgJb9Dr1R7uUGxWHMw6q1udXGXvlp7bKdE4gg13w0F?=
 =?us-ascii?Q?1vv+WUIBdlMFLDpyqRsh66/rnRV0vrJxgnTcYxLTL2KWgsBFKoE/3p+dFehW?=
 =?us-ascii?Q?lw54D9RAH43bCBKOdQTSKDm3z4BvjeuvjEsfpAWDFU7t5bl7NBUd7tcdb4q1?=
 =?us-ascii?Q?LDivKahGcwb4mf2Jf/zPTiqHpkQRIIxQOK4czOyj6fFaRVZBFnGKgDhleJxr?=
 =?us-ascii?Q?Gf7n5BKKSfYRRLM8PCvqLKtbJz3D4P2IOgOta3U390exCx5RxYt293k9v3+g?=
 =?us-ascii?Q?lY6qwhIZYZYZ5WQTNFhu4vijmcQQ5Q4TRV5fZdssvjOfXDJzmGmGuiwdepDb?=
 =?us-ascii?Q?TgPNYLh4lU2Auf4UDf5QNWt/2Y2glovlMkpH8An1OTpZH543iilSO9A4M1c3?=
 =?us-ascii?Q?fSJtcrYDix5y6HG4Ka6bbvgvJuTpLSykEmNjsxW+j6GyE+BC7cJfFwN6LTqp?=
 =?us-ascii?Q?yk2bCRASphc7eFtFgQ40qenUUqyEFgPdO6NYXrlvj1NjHEEEgaqS/v7hD9rT?=
 =?us-ascii?Q?2pp6mF3YTQ7cQ86Ym0NgWedlHDEtM2DyaWetYLrhEFGfSSiac4e/WuBf1eGg?=
 =?us-ascii?Q?CZFJrW9R5bTLXcSnYIuVQBm2ACq7wFp7Pg/Ct7/+1tKQ2K0N12OO3QbmFZ8G?=
 =?us-ascii?Q?AKqOQCRGPW9ZqttpQMOe9N7HskYQWESsDENvweY3rEnaayYVaP4EItjB7yfw?=
 =?us-ascii?Q?pRYjfB+XUB1TfsbuimDGKxTdSpMYdYxSdG9Yo79pGckmmXMqtJ/8NsRkr3OD?=
 =?us-ascii?Q?N9H/NCmsbZx1UoVsUHoNU+dCNeURoja2zNcyIjFxpSgb/vqrqp1l9LnmYuyj?=
 =?us-ascii?Q?ht9OIgLdkdJiDqAzoJHh+Ovdk0wha/22MK3dMZzHoCBmnInGO+C/OF7MuyTJ?=
 =?us-ascii?Q?nIVHHNroegAmTn94Qlpo5c13Q4f0eoAZsVYcy8w7vHy0aG1aEdZLX8FC6Uqi?=
 =?us-ascii?Q?+rX8sn2IvUn0ox5UeF5pz34JA777bu287ik0TXrPZCDhiqofbo4StmI+7jm3?=
 =?us-ascii?Q?RsJAuL3GP+NyBNPE9r/AfVLtuh9LI6DmwOmPvRy+5AlCi7UGGucZjMLqIwdk?=
 =?us-ascii?Q?Pa94hIH/EIrSr6NTkpjlMPo4n2Rxk9O6DG9MOL2ljrW1nF9UsEX0GPCEDVct?=
 =?us-ascii?Q?ZMA90WwjAZD/QSUHHXIrGvVsFrQoyV3LUrOM6dAZxL5FFz+UNNqbwB7izD9N?=
 =?us-ascii?Q?H4lJogykoYETLXBq4/Lb6wBBJPg4z94W/k6w/U5Y9PBnZMnfFIeAS5I/ADr8?=
 =?us-ascii?Q?ICh0Mz0CtrVJlUJ36JMrxK1/cTAfoFKKVY8Lp6cbqhOJo5Tr8/J1tYr3OUpC?=
 =?us-ascii?Q?UR0rh3m/1QpCmnbwyy46LdA+tNkXspAZO9umhMbz/Dg3T4x3sDmbm2l3F4pX?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c036e910-69e2-4c54-8767-08dd7050d0c0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 12:37:36.0515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THHy3s+knMNpP6/bsYcWRemAXF1R/tkeaQ7wAahoAShj8agXXaHKO9KaIyacfaGdqaiR0nOMfd+jV3i/3JvC5ra90yldqWZDfVN63jiKPek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
X-Proofpoint-ORIG-GUID: ZasZ1E9Gy5Eofdss_MXUPOgpL1KHxnox
X-Authority-Analysis: v=2.4 cv=I8FlRMgg c=1 sm=1 tr=0 ts=67ea8c93 cx=c_pps
 a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=zd2uoN0lAAAA:8 a=t7CeM3EgAAAA:8 a=aTfnAkCI7xLfuEqasgEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZasZ1E9Gy5Eofdss_MXUPOgpL1KHxnox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1011 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310090
X-Mailman-Approved-At: Mon, 31 Mar 2025 22:34:12 +0000
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit ea79068d4073bf303f8203f2625af7d9185a1bc6 ]

[WHAT & HOW]
A denominator cannot be 0, and is checked before used.

This fixes 2 DIVIDE_BY_ZERO issues reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Cliff Liu <donghua.liu@windriver.com>
Signed-off-by: He Zhe <Zhe.He@windriver.com>
---
Verified the build test.
---
 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
index e78954514e3e..958170fbfece 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -1772,7 +1772,7 @@ static int dcn315_populate_dml_pipes_from_context(
 				bool split_required = pipe->stream->timing.pix_clk_100hz >= dcn_get_max_non_odm_pix_rate_100hz(&dc->dml.soc)
 						|| (pipe->plane_state && pipe->plane_state->src_rect.width > 5120);
 
-				if (remaining_det_segs > MIN_RESERVED_DET_SEGS)
+				if (remaining_det_segs > MIN_RESERVED_DET_SEGS && crb_pipes != 0)
 					pipes[pipe_cnt].pipe.src.det_size_override += (remaining_det_segs - MIN_RESERVED_DET_SEGS) / crb_pipes +
 							(crb_idx < (remaining_det_segs - MIN_RESERVED_DET_SEGS) % crb_pipes ? 1 : 0);
 				if (pipes[pipe_cnt].pipe.src.det_size_override > 2 * DCN3_15_MAX_DET_SEGS) {
-- 
2.34.1

