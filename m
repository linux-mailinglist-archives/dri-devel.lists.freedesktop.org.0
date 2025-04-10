Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD06A844C5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C120C10E9C3;
	Thu, 10 Apr 2025 13:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27B010E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:53:07 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5JE4P018232;
 Thu, 10 Apr 2025 06:52:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8pgm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 06:52:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKA/7FlmSEGfa8OaOxi55FXhH851fXnhFPw+6yC0NiuatgecCR8pluupoy6fO5UgPyXCf17WO0jaY4zUq59l5ELj7RTHLE2RGBrqfBHMsC8sSB5xB+gbsX2eYM+Rc4sZr2A8DlQTreC83OEp2PHESQ/LV0OiOibKe2V/MK0Xqwn7zcFHFOyZCZ3RgcgKwey+jMFv+Fw923qx45ncby+b70QU1kphlKjqpTkHkCe0fDm2vUeQh+wApy/fe6DuhS4ppuxnTvndflKCj7u/rvn0RzZdjuIvIV7oD/fDRW9rpIpTH5liH8thCuT0uh5ncuVj08P7d4KUGsGkfH7DIuB3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPgz8AwzZCzTLku5OKLLwSi1UVCeY8qSYO1r4LH4ew0=;
 b=gkPgL7tX7bqOVQHLrF9Sjrj+BLX4ErRTFnePAWXS42GwQZdyg2UiTuAnanvv+Fq+i2GeeeHsNNOM4uT85iXAXwHsPu80wtU4IddZF5N2bFBMctP2vPFGex8nlqvy3M0x6uz827QFU911guJVWHA68FZlzJG8EvyEaHP/07GBu1C7hSEjB/SNX5i3dtR5BnkiD5zks5zEzYwq5LZs0/EDOcmbg27hUMa/rHw1GHB0mpDyaBTiNby6TzSA+ZS35oCIZoCxLtqGNF+lDj7ZDoSkwHtMFDfvjVTmeY3QcWo2b6A/8+ToNgi7sL3SfMiyXa/eKoBsCrJK/CUkyek/Va951w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM6PR11MB3324.namprd11.prod.outlook.com (2603:10b6:5:59::15) by
 IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 06:52:27 +0000
Received: from DM6PR11MB3324.namprd11.prod.outlook.com
 ([fe80::fd0:4a9d:56d7:c039]) by DM6PR11MB3324.namprd11.prod.outlook.com
 ([fe80::fd0:4a9d:56d7:c039%4]) with mapi id 15.20.8606.028; Thu, 10 Apr 2025
 06:52:27 +0000
From: Zhi Yang <Zhi.Yang@eng.windriver.com>
To: stable@vger.kernel.org, srinivasan.shanmugam@amd.com
Cc: zhe.he@windriver.com, xiangyu.chen@windriver.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, sashal@kernel.org, wayne.lin@amd.com,
 wenjing.liu@amd.com, hanghong.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] drm/amd/display: Add null checks for 'stream' and
 'plane' before dereferencing
Date: Thu, 10 Apr 2025 14:52:08 +0800
Message-Id: <20250410065208.848340-1-Zhi.Yang@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::33)
 To DM6PR11MB3324.namprd11.prod.outlook.com
 (2603:10b6:5:59::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3324:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7dc89a-1ac8-4299-5c33-08dd77fc4151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ScC6Ox+W26WxJ/FdgahAIlTPcR63+BP0oXY6VF3btWC5j5uAf6/JcYkl1p3o?=
 =?us-ascii?Q?PNmjNf5UZ9M6ty+WbslyfJyOOIt0HBp0qut0PvYt2o+szx8tBhPgzLwkoMlI?=
 =?us-ascii?Q?4P8Z3famcc99zhrgPf5+W3HpvGyjG8TKC+wTRSWRaXi8tBIwx2CSOyIESone?=
 =?us-ascii?Q?NayOzZXEHIbZ6Gw9QZp7shMkmsQgKGBt/cGszT9810l0oQd/TJLDAn/02i1e?=
 =?us-ascii?Q?32UccH4AyAv/ghcrd5kTFFO1tm8d2VT8KDt34JPAfvWVM5bzaDIn4Gw59Mj4?=
 =?us-ascii?Q?04foHHzlXsADE/PEXyLUtAYzI8kCZxc4/XlzLdib0R4NKNMpmSQodg37ehdB?=
 =?us-ascii?Q?08OnVFD0LGv+YMHKuquKwqszzIA0Uh7IlHSgeHNsDTkjQBq7ioGcK0R0dL08?=
 =?us-ascii?Q?i45jAuYOESXyrca0mZeLVLioQH/2drSFKuBu1LZdddqhNrquMCrJIBAPpx9m?=
 =?us-ascii?Q?yavzapWFgV+6MRWLuH2UOVnKSPeSbdkgjA9SmpFf2DYR1vOm6MiyrrAfSmZ9?=
 =?us-ascii?Q?eE60vVzuwV71mzk1RzZwZGFMKBP5R+jGgbJlSqJxkHbGq7dYE7r+JsuudDmA?=
 =?us-ascii?Q?Xn5SUk5i2g1fK4MM7+85D3g6Ne96wk7HWmDmnWjmYynKiUlwZIFBLqO5OM8C?=
 =?us-ascii?Q?cyeGoYx0HeJRW3OWOfdqcLh9QqXEZLIVojy/7MzV1qFfjG2Gw7iXnl4JTzyB?=
 =?us-ascii?Q?m3fXpeTBiRF83Vmr1EFt1v0MgidL6C/sgM9qmF2ihd0quOv2LohXl5zyd1dT?=
 =?us-ascii?Q?98ExAfR2fEu9XO94g3PKxusn7cTyM4TF0N8YxM6Kfd3niP8l0UUKgscN8xlu?=
 =?us-ascii?Q?fpKeCbJfdW+O09R9ab+ZFuUBAg/+vjuBqqLmpYeCMiCp5ea2ZKQJ0nkZoleP?=
 =?us-ascii?Q?joL0ysjUKeIvZoU2xyj//HMlugoSe63xusNUTPijOxeETQaINVMOWMGRZaoF?=
 =?us-ascii?Q?W64IVr/gIObZEBvOi72BWhenOhkMWsZ8vLSrPDlTYIoNaO5qMVBHOsLySDHZ?=
 =?us-ascii?Q?HISQLnq/iHLgxZz2VcHGjQn0wQBwGveeLebqFf4wZ/DYc4GHno/ws4mFK27p?=
 =?us-ascii?Q?dNyt2CJljsN8WVS3+i9hvM9zGicn/acJWdttW06iySFAhafsy+01FEmrecLa?=
 =?us-ascii?Q?zBK99deg63w/ICCdiruQFSs9KwYT0qnUBV/zxv3VUv5wkTmqVaa4JaFAE1J+?=
 =?us-ascii?Q?BWy/PoFOKkvYsARDmQstOWEDteyCj1uVw7lBSEQH3rWSY8EY9iiVL7YkL88R?=
 =?us-ascii?Q?OVh4u6ekFXgvvNFa19LoMFFQg+ZHLtfvzK1ktlQuN8lMJ5yQHCaE8qeG8FtB?=
 =?us-ascii?Q?zWLVLpHF9L/cCcf9pyGEj1dGvxAefaFVI+bSttoReTo55cG6vbuN+9ItpWOs?=
 =?us-ascii?Q?x3/IZ7U/wdpjMcsksog1+JOouDdnt4DzHbuj2I4d8BlGr8iKYq8fFEep4vdL?=
 =?us-ascii?Q?+hc5yZUia9ECV4f1RGmLgXaH+bEMmJc/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iecCqHWyUV/YVHGmaC7jfAl7xBj7C2aqDGJHOMdGl61qtkUWbK0iq8PHPDIC?=
 =?us-ascii?Q?cxRRX/unZHlkstXlZjwLyYhF0lRGolSRlzDO77smWxd+XxMpe9BpfMV9DHtB?=
 =?us-ascii?Q?O965mAFwknVEB/nW1va0WXeTxj9IV9v7/JY1q8/QwdZmxU1Ojg17bC5Vqgf0?=
 =?us-ascii?Q?aLfeMjjJMAaQ5xqSt/QiXSxFFH55U+NtlaorHvz2AsicMxUiayElBqX8ozv2?=
 =?us-ascii?Q?omb7XQM6ndT2I5GoLhWPlXNFirYeG7aoNXluwdcVthfO8h8dItFIyb90ql/j?=
 =?us-ascii?Q?ps5OUUbwPv9pmqs1ROKUOZPHtXinyJxiH2z3YWJBwM79LzQKFfjKu1Qcetir?=
 =?us-ascii?Q?t+/rIyj7VQFUoRcrqUNDdWx4q10TiBbveh/mGiFinDOWVrORlwbd7XBIPL/O?=
 =?us-ascii?Q?4fOeZo8GH0OhfPBqaGnNOcy3oKYJI7640G9on/O22cS7+bMijijiSFFWsTwU?=
 =?us-ascii?Q?xB4ATIU11znCYpvIgi8AMxYSbWbeQqC5lks2+eKG0TIvXUGnwBUr8ujoOSQg?=
 =?us-ascii?Q?8w7IMUrs5ysgJRwA2sJ3zfopJtLHbNdrr9JazZlHC1FVNwYusDGMx4jXl3CA?=
 =?us-ascii?Q?zfpLc5fhJcwEVp9IK2sUONkvs6/0loU0q8EG9zS7xuCDEZoBoOPwLXTugk1a?=
 =?us-ascii?Q?uVbgn4Sktnj7c/SPt8/h4fthg9HLHsb22qplfzcClk3VcIUKuzBFmZh09f+a?=
 =?us-ascii?Q?Mks27TVBv4XH8EzyRPAERT5bvqCljKB0oFBFlZg+f5T8l8yxp0UUg4BGnO7R?=
 =?us-ascii?Q?sBsVoUVS26KJCT4grh4l8RQ5/Gtbq/8XFADPqAvmSGLh07imwG5BLQUz1d2j?=
 =?us-ascii?Q?lE2VSSSiqD+PRjiIOhPeE0MI50DSJKCtyu7tJUJPZ5/bOby7CM/hCU5uf6y5?=
 =?us-ascii?Q?sjd8iVgMH9JXfkvRDmARDKCl0aj4n3YR1LGZJLFDVVzVgWKi3z+3BGnkluaO?=
 =?us-ascii?Q?hotxDMcGJaHt7eJ/uqaaXQ4g0djMB5xq3DniPZJ0oNRcri/EhSGiPHon4DA2?=
 =?us-ascii?Q?vmHBna9M7vIwc6/jrDMh5qEGAT7hCvwGqY2ytBKhL8gkArbiPbMppTaP1sOa?=
 =?us-ascii?Q?qyiCc/xg/5bT3QOUSMbMq3TBbkVHY6JXzMGTa2dBJVH3wiqJtORVPtF7cIQ/?=
 =?us-ascii?Q?3I1OJnoIsebvYGfbgQR9GRO+mjn6M4ARxS70KaVU0KefRVmYcKZa1sjdv022?=
 =?us-ascii?Q?IqIBew8B55uO9j47n048APmkkfRCBNdyNm1x3Bz7lBhA4NxqIBwiKDCR8OVp?=
 =?us-ascii?Q?DJhshF9SN8O5ko13S0PWGJ3sEv2svzrSuNURv/aPC3itguZyNzPwU522F1ZB?=
 =?us-ascii?Q?OY+srnkRXiLx0QgXBvBXzJHJp94VTz+gQ+JFejGS31CXLUe6TWKqEqfrVMQt?=
 =?us-ascii?Q?s0yaPsalpZFXpbfYZU+V1JMNiz3BKlQ+30bHB5BRiEPbQcBLBwlAmx5FzrsM?=
 =?us-ascii?Q?Fb6jbrrIN+g041bniS1rEU/vNO1rYHG4phNkiMpB+5sKZiqQmWcDy2J+oVLI?=
 =?us-ascii?Q?7uLH6CrwX280AKTGtSHfHAW9uCyXsyJhojvUyaxEia6SYG5qvxAB8ir0PC70?=
 =?us-ascii?Q?wZCbsWEUiuSVHwIdVI0BoWn/dAwYBzmZ3bVv29Hs?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7dc89a-1ac8-4299-5c33-08dd77fc4151
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:52:27.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlLIYHwIRAsrylueHwtce4kLygz1JADG/JtFHX5cYRhCsPP2a8Bspta4Ob9eq/Cj69bzRjzoJw9lmXFdBYZL8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-Proofpoint-GUID: on4DC2W6eu5omi1nB6LfpV1R2wK6pP6n
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f76ab2 cx=c_pps
 a=sGbpJkUcFVeWJOR+0qTsNQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=zd2uoN0lAAAA:8 a=t7CeM3EgAAAA:8 a=fmkVBTeLr2XkT1_ESlIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: on4DC2W6eu5omi1nB6LfpV1R2wK6pP6n
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100050
X-Mailman-Approved-At: Thu, 10 Apr 2025 13:28:46 +0000
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

commit 15c2990e0f0108b9c3752d7072a97d45d4283aea upstream.

This commit adds null checks for the 'stream' and 'plane' variables in
the dcn30_apply_idle_power_optimizations function. These variables were
previously assumed to be null at line 922, but they were used later in
the code without checking if they were null. This could potentially lead
to a null pointer dereference, which would cause a crash.

The null checks ensure that 'stream' and 'plane' are not null before
they are used, preventing potential crashes.

Fixes the below static smatch checker:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_hwseq.c:938 dcn30_apply_idle_power_optimizations() error: we previously assumed 'stream' could be null (see line 922)
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn30/dcn30_hwseq.c:940 dcn30_apply_idle_power_optimizations() error: we previously assumed 'plane' could be null (see line 922)

Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Zhi Yang <Zhi.Yang@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Build test passed.
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 81547178a934..30716b88136c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -784,6 +784,9 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 			stream = dc->current_state->streams[0];
 			plane = (stream ? dc->current_state->stream_status[0].plane_states[0] : NULL);
 
+			if (!stream || !plane)
+				return false;
+
 			if (stream && plane) {
 				cursor_cache_enable = stream->cursor_position.enable &&
 						plane->address.grph.cursor_cache_addr.quad_part;
-- 
2.34.1

