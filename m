Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBDA74518
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 09:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B843C10E99D;
	Fri, 28 Mar 2025 08:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2145 seconds by postgrey-1.36 at gabe;
 Fri, 28 Mar 2025 02:44:25 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A915410E968;
 Fri, 28 Mar 2025 02:44:25 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S0McTC020317;
 Fri, 28 Mar 2025 02:08:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hm68pphk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Mar 2025 02:08:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAdWrntS1OzS1SDRy+FkSD3vGflQZmxk/Exf0HbV3o1V0uyHMBu7qFWVfOfr5pueG8rewBAsmSlCebSPCBXRscV5SsL85hq90vFH3V++0zLJ4cVhTQYOgXOlzZ8yRY3PV0u5EioheJTlRVxcQ9IZu2e7IJ2weSfusPUV+sZbL4xJpQYKlrkD7W2yfbvapiJVt7sn9j297C26JG3KZwmHR2XpYmJFP6oscKDNsQUA9BKzcI/IxtuTRzLRQe04qQ4l9l/2Bp4K1M3WSjf2O8T9pjKRQecw1j30IGYdif6tdlPbx/vAV7FW2ETTlZnL0XAWKTxN0ZBGXcStkJc0WBQbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBIewwJ9W7QBgrRHAgUN0MqJcWu4YKJufTK2yPxrIjY=;
 b=KVldg4KctsJ9rohusrVeNEqUq/kntcxwN/H9KegjRTsfx42pfKyDNt9WlckTIXuO0YU588k2eDAyq22SOR1Yoz0WiS/9AaK/k8S65oJs/+4AQiqUNKPN5ZUWRrBVWSr6XvbVgJqTNb8ZrCv2jwsVmc7fLlOSMoE/BWyilBXUnbGAiaz41CBbIjzlWYO4vj8xDkkNkCcKRMYo1huU8elP/F8yloTDCvC1lVT1ZOfJUs227qPQd8w6r65Wct2TqCOL5bw6aSVl9wrJGoRmri6xNAYjt7EcKpis5ahBr63v9je/NfvIkkTNtmjc2dhYpLd6+yVMrF8krWCc+e1HnNMi+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 02:08:30 +0000
Received: from CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d]) by CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:08:29 +0000
From: Cliff Liu <donghua.liu@windriver.com>
To: stable@vger.kernel.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 hersenxs.wu@amd.com, wayne.lin@amd.com, alex.hung@amd.com,
 bin.lan.cn@windriver.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhe.He@windriver.com, donghua.liu@windriver.com
Subject: [PATCH 6.6.y] drm/amd/display: Check denominator crb_pipes before used
Date: Fri, 28 Mar 2025 10:08:13 +0800
Message-ID: <20250328020814.2986133-1-donghua.liu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7012:EE_|SJ0PR11MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: b719b6c0-fbc8-4cf4-adf6-08dd6d9d6efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V5nA1zCBnFzd4uLIzHkRKhhWvktFELEUNAG6Ao01UTCPQ0fxKKmE0qc5Z0QU?=
 =?us-ascii?Q?7hvIxq8wCl4pMsraUPGJT3bTn+XtnBGIrfjL56fTk14aek+VsFkmeHJ9ougj?=
 =?us-ascii?Q?GQ4B1zsTK7pkmZQb7g2rO1XG2WehbBaZYYabJ+eWi8tFTfAShnzYHgjp+iD5?=
 =?us-ascii?Q?ye5ffAdN7OfS64ZanCExcrXlw8Rz/LBCtIYay5JUP6fBJ/4TG/CBhH7exn1Y?=
 =?us-ascii?Q?gLAPiL9WEBwnRQePmTZWKtrCXVkIwaOOWdhl0k4NZQmaTaHZlhwtEDYOBp+7?=
 =?us-ascii?Q?qVk5z9QtWD7keATU5ECeQUBMgcmfRKSaV77LhcJx4o8yqu0micNrZIel4vls?=
 =?us-ascii?Q?RAvmvh0DTKX4HQpd9zsyAxz0y/nMsr1u7XJc0tiSfb+zegzYF/dfLwGBOBJP?=
 =?us-ascii?Q?gOOJpGARUyPNabQGh8zZ2KBgL0vvbeOI5uPpIgHL95q6uhhz3Etzwi2575Hu?=
 =?us-ascii?Q?g1Z0rh908Ro/33JIIRlEGfi8H2hhHhU677Us+7jVD7hmuhovvv/1apJO2UwO?=
 =?us-ascii?Q?iUToBJHcYaYGLaDqdnF/I1wi/+cHsdCMIiFKY2vFLuk06syBYLOzqbp8oYJK?=
 =?us-ascii?Q?JDli8pk6UGEJfiyZ3oH+xIaMxgswjS1oOKAAlgspqZPcGWjPeAfHG2iJOfxm?=
 =?us-ascii?Q?CbpmCvCm1mB7QP3cxiV/I10LPXe+hd5m+QSdkug+d94GjXGRHFTZSZVvt9Oa?=
 =?us-ascii?Q?xAYfqGBKWCa6XP7CaQ1lpRxEO6/mAxu2XGbdFmduvd2bG9ou0h8Smhlv2MvK?=
 =?us-ascii?Q?NHNo6IwGJ4YW6di5VoCQoz7FrM5g6Wmtlb9kf+AHCloaeu50nKZ1W658gGxA?=
 =?us-ascii?Q?sKfNz/4x5/afKsp64NNvYzSOWQMeK/6oClo6YHKq18RIG7h7t8T/TbyqOY7q?=
 =?us-ascii?Q?cLHSTQ8CYNGT/Ud3d5GESSXVTPKyMb3l8TsptqYcbVY+WWRPyUHkJt70tKnf?=
 =?us-ascii?Q?8FFqWgkUT6fBVT5TJlDJXX5zSora7qJw4c28NjwT1BhM8uy5PdTSvwvv1tqy?=
 =?us-ascii?Q?Cqnh9GqUG55j1wNxC/e45grAihpErlWIklnYM8edfmOEgNAJ40eKeIpUpxAP?=
 =?us-ascii?Q?GdEIVl4q6CoIm6o0zbkvhNNJUUW/1XBlw743CNNyT+K7pXeNMKir9bzmZS3M?=
 =?us-ascii?Q?IK2ODRFm97RYRbaApeOsbIuGILbWU9z8rIu2vKBx3qsh+IFvevVxuq+bjI17?=
 =?us-ascii?Q?9bckt6jFyVso8ypnlkWr92mMOZjaslRbBMixnxpFsnL11oZNeybrUnkmge0N?=
 =?us-ascii?Q?EzW0WOk2KM2t8oM39tSR1vCh1lAfjrHk//Nx+NRw5EuimyUgBrOsp7sAvqZP?=
 =?us-ascii?Q?Yq/D+iF+AlGaakdUpfgSDsZUamEi4+Agae1ZCvSVTOLaV7B88SZ8t7oFwI3S?=
 =?us-ascii?Q?w3wkdfkqU5Td/y8GhHD8YJzpsdO+lTBbBh9eVYcrvw+F+P1B3nIKjJ++t396?=
 =?us-ascii?Q?NFtSEWjWc6tIWHpmkbunPKwUxp1prn6l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7012.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dp6PwBM4P49umiTU2SkUy1C1qD6HoZfNXJ+XSHU9GogxYfsmue/YZ914baU3?=
 =?us-ascii?Q?PZVWuRhQ4OXyd11xH+h95iWY5QCzeAlPO0cW9F/ySPTVnBI4iEq3yOZ27ie6?=
 =?us-ascii?Q?DuXU1w8bgg00JrXnvTcoxpOk25M0cENLPf131Plsp6z28GygxXKJLDevHuvo?=
 =?us-ascii?Q?PG9V4dXN7rmxbCHo8MihgJZR4nGjFn/0wuuUxiDpFhClaCDJ6zQ/Md8k2fmd?=
 =?us-ascii?Q?MkPAS6NElKUTaHbmKk11iLzwVW6dutQfVjUBFSAUDjBuh8HOE8nlKRw/huSc?=
 =?us-ascii?Q?ucOfj3KZYFSuvfYFITUqOAsPglLt+TaNrZXiF9q3zNB+75TKu4uBBt5Zw2hc?=
 =?us-ascii?Q?Q/9+n8grmEVbvrs8FWoYQuZoV5E2U8D2t6SWVzjvGEtedO3OSPPL0oAb6K9f?=
 =?us-ascii?Q?I+8UobuxM3cF6XIxqgiehrH7owi7zJZ6IPsB2Ub03Nbu5KV3Io2SMGC/bQvK?=
 =?us-ascii?Q?lA3ubJHyFNcVG2YrDDY0OwGhoKmAEbviOgrifqDUqwYlkGB8lCQ+lb4TWrTo?=
 =?us-ascii?Q?wvmfl86yaWIAF8xSMdBoBSW4ZVuFWc9A+jTHwNUDxG97IXDmXceGs18dUt1s?=
 =?us-ascii?Q?dJVWQgCzEnKPqVPsOt3HmaNNg6GKXCCRq+6KlOyjLW4dPEUedaQ77eSHQWao?=
 =?us-ascii?Q?Hax4bSsnDkpD78489aHRIb8lCuI4PTfnQbRb84qJTCKuN3gb4e4m0HFjyR4m?=
 =?us-ascii?Q?lJBPcf3vPsmkUkyOXo7dU/YlJh9PAsr/A/f127Gn4l2cyRYf0YMw8QibnXlo?=
 =?us-ascii?Q?8nUuv3i3P06wC/XlaBETvenOgAMuweavkcDdIg1bHgv3pH2aljGZ6eLqg0f3?=
 =?us-ascii?Q?maWoDFTpUzh6nCEUQBCPWO6BBTPhJuIdOrtMKRGt3mw+rEbcpjJfblfuOyC5?=
 =?us-ascii?Q?1r4ZrR9hPsZQFHVr3KnoM4knp3eZibBMUfgRWDAoBeIc8nROERsSbHeVzz0x?=
 =?us-ascii?Q?b2JX+tEeQNZfbK5/oNhOSXGm7GPOXIyvtaex4oEl8qdHvXobOQqU6aZVB1SR?=
 =?us-ascii?Q?d7w/3eFzxUIx6uA3yRnqr/VAfqAWoJODxFrtTilAc0u+bN67R+8lAqCLC/CM?=
 =?us-ascii?Q?UZ3pMcQS+ImuwWvgwbo63sUU/xfwXsAoHmovkj1REGXcAQNT+jCO2TfeOFKt?=
 =?us-ascii?Q?vToMzKkdOWxUKEbnz63ZcKuILrXjOVT3w0+hUkhtF3E0TxqlEWSJ32ZfKvuM?=
 =?us-ascii?Q?fvbMrCqSbadRJ3VvZP/6ub8v5W182z9WWgKhn5rocWcHIC7Wcu+Q2Q7hpk0l?=
 =?us-ascii?Q?eaWUASfJ6gMUE4WfStK/Yiv3LhyR5Ob0ScdDNYSo56yNVI3w2rteQq/Yy95d?=
 =?us-ascii?Q?e0G6UUfzwtMqJR+AeN9v0tYMi50oRBzJbjV08Xv4vwX5kWNEi6OSgIlkV2dn?=
 =?us-ascii?Q?e/c5lwm2bij/01nRBx3odIX8LDw4z6ow9eYOjLQ4pAu4tNATZkCiolzT3+79?=
 =?us-ascii?Q?TU2Joqk47LF8etBkd0ipd0jwAUF2bw8qJkAeEiApAhE2qjljyD90L84kjITC?=
 =?us-ascii?Q?pvt0I0xvrnbSeQYXDK27L5eEoP0ZP3V3KacbOdT0e0yxLeex5aC8yJ/QUIVu?=
 =?us-ascii?Q?cAPRnEv6pwIgiPfLkJnF0AcDtuiPt7gcbU2n6+iXl2mjqu8LEpCzl7ebpVbV?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b719b6c0-fbc8-4cf4-adf6-08dd6d9d6efe
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 02:08:29.7800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXgbJbYkIl/S4/pULy8mqGDco56bpeO0KMD1LyPmVaTSUVW1pf3lc5i423256ZgBCHK+nDtAZWqexYksImdMRmNfHNWOdLU0+gdasswF3O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
X-Proofpoint-ORIG-GUID: z7bxrfyL-Vspw4LNuMbPio1g-PA7nxlD
X-Authority-Analysis: v=2.4 cv=etjfzppX c=1 sm=1 tr=0 ts=67e604a3 cx=c_pps
 a=6L7f6dt9FWfToKUQdDsCmg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=zd2uoN0lAAAA:8 a=t7CeM3EgAAAA:8 a=mDnyKbIW6HB3Ii1mfYIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: z7bxrfyL-Vspw4LNuMbPio1g-PA7nxlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280013
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:10:26 +0000
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
index 3f3b555b4523..597fa0364a3a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -1753,7 +1753,7 @@ static int dcn315_populate_dml_pipes_from_context(
 				bool split_required = pipe->stream->timing.pix_clk_100hz >= dcn_get_max_non_odm_pix_rate_100hz(&dc->dml.soc)
 						|| (pipe->plane_state && pipe->plane_state->src_rect.width > 5120);
 
-				if (remaining_det_segs > MIN_RESERVED_DET_SEGS)
+				if (remaining_det_segs > MIN_RESERVED_DET_SEGS && crb_pipes != 0)
 					pipes[pipe_cnt].pipe.src.det_size_override += (remaining_det_segs - MIN_RESERVED_DET_SEGS) / crb_pipes +
 							(crb_idx < (remaining_det_segs - MIN_RESERVED_DET_SEGS) % crb_pipes ? 1 : 0);
 				if (pipes[pipe_cnt].pipe.src.det_size_override > 2 * DCN3_15_MAX_DET_SEGS) {
-- 
2.43.0

