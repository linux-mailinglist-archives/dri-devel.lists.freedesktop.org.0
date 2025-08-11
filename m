Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D576B1FFB8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44E10E2EC;
	Mon, 11 Aug 2025 07:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1536 seconds by postgrey-1.36 at gabe;
 Mon, 11 Aug 2025 07:00:08 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B550610E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 07:00:07 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 57B4Zaiq1805370; Sun, 10 Aug 2025 23:34:25 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48e1m114wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Aug 2025 23:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFAtM4ZrMZxVBTsMB73aOVcJRNlBEjRUl7cuZiMrRZwvA4uI1XEVkyXDDD9qyPL4Z2Nke02tIsmE8wVr3hbuQrwwkzYh8Q5ZI7zRkOPONfztAsOtGOZZj3mj5KZmKt6KSXQCWI3DA0QhSgBPRIcenp/XNetcTcunbiNjgQvpqJiAbK2SA7gZjVTxaxxHdr36oDQgThwuBxhzNihpBTvqOXubLOySzRniAndvk4MqqWtid3xZs3MDdheAj3xrRRT+5h9IVFKtB8vpwI/W8NTO2/NivKTvQPMRAO6fUfy6GgkevgivP8qckv6n3huMiC+buxUN5XtGIUvbp0pHnwIF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpZaaSf3Vgem893vUYoyfr9ElrmF8LHnJ7ZSx6Uqdnw=;
 b=ieGhgTDjPf31O6LoCKapV88gLAzThEZPlL/5p76HVVgNxo+VCGTi/tGv//toK8AgMUXfRgQbkpBkebjvhJv/GwFWzj1I6jJwxKHIRrkHD99hQtopYgdS51Vr1j/SUMfKv/GFp7fTYCY2RbHx2j3eN0KDZnntCZhkg335cMYeXj7yLj8MzMckDzMcER10+mMcc/FH7YeECSVGkG+o0YBpjZaO8h+2isvKU6mgSUQIzsNARV8/cAeyAWZ02RLHzHgtfNlyuHBVswzm0rcU4YgqZm7l4mSq+s3WsyXO2Q8r2EATMdnVa3SDU8GgbwPd/XXfGwGEzOWTLGFV4iOJXEazGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB8520.namprd11.prod.outlook.com
 (2603:10b6:610:1af::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 06:34:21 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 06:34:21 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tests: modeset: Add drm connector
 atomic_[duplicate/destroy]_state
Date: Mon, 11 Aug 2025 14:34:03 +0800
Message-ID: <20250811063403.98739-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2049b1-882d-4288-1b87-08ddd8a11b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PEWtKxw7ZwdwtJILdh8cbQNS4DvSLT7oPkBMqNeY42TKf9wq6TMIobxMK4F/?=
 =?us-ascii?Q?7tUtdukiAf5qZdQkKCZqIF3lxzah7dV7rvTmb3m61VsnR2K6n9pEkFNxhHut?=
 =?us-ascii?Q?l7aaBlfXeDLxNznBqmKQX0hMn0RCSn8VpnQeG5wWiQYCJOuIPmmQ4cP75fck?=
 =?us-ascii?Q?rhf78k7RZ2DpoY7VYQJhq/XQb3rMWsJ+rLSQnovheqPHwohV/wc5FCmuZBY9?=
 =?us-ascii?Q?txk5DTH5Y7RJ5e1KI3LPNDUPt5Yfpj5H6+e+T7gkb5B/0WuqmtQeijQsQ/x1?=
 =?us-ascii?Q?NaliO3qJfzhLvFRbjsKkyQNfU5DCCa+WYf30Ria4b3THXYUPdhaUVVgTEe7x?=
 =?us-ascii?Q?chQ3N0ycxxjL1qXCvQrIp7j09DMS76T9Iv0DL1VqcYXWaNDkjTN6qRBeQFaq?=
 =?us-ascii?Q?n9RfHBvdRcRfInOxfsasX2DxJbEQp1GoUwxeD4eyCKksaq7ifGLTeOEwkAce?=
 =?us-ascii?Q?1dRZS8wjWquYmYNQq3HxtYjULORyEs0y0aeU/gXpaV+c6NrdvazD339hHq/+?=
 =?us-ascii?Q?7cheM7krsz7NRQeYeHDRd9L64V1C/KKi2eNvihNnvV21lxl3Brqnge+XBxAE?=
 =?us-ascii?Q?lZzvFlFSBHkPpR5gXztmi81SvW43lUphxnoUHCkWcq4z+IEfrNg9aReq49ne?=
 =?us-ascii?Q?AmWQ+2reuprgLaz3E5wk9iapwtMyMiNvxXVK6WwWSl8Fdm9iXy/YeliEvLgV?=
 =?us-ascii?Q?Y16u1EPgkeQ7PuZT1WQkjyNb5o9VWBA3HOZvGleSZyKn10zTP5npqoqvcTAU?=
 =?us-ascii?Q?qIfjotdrJplMRWn3epYHW1FbPHi4XXcx9bGKeYQYCFw+j0opQ2qS1fB8AvKK?=
 =?us-ascii?Q?ZwtNQOX2x3AJi43JJPPQxXBVm1kTK3CTEv9rdP4wMUjqBvr4o7vZxdAPOG1p?=
 =?us-ascii?Q?n622TG5lgaSU+SHjw4iG90m2tFksYEnxVYrFfqikNeM/qaoNI1FGfG7I87R2?=
 =?us-ascii?Q?bOuXFzopfwKSLTtbApAb6QQa/1+LTkXns9Cj3qe5j+/un51c3zK8d9F0S0lM?=
 =?us-ascii?Q?gt8dJZZNBkWgYaMZC41rnj+tQp3w3GTZNhO5GTvG1u9Hn2AsYH0ooPeeGqvB?=
 =?us-ascii?Q?147lrgbwy3K8siimOdy8PQofc+RpOCP8F5Pzy8H4jUatqAQVtTh6ZY+zeHZZ?=
 =?us-ascii?Q?KoiGGwqEGr3t73Ne2pQ7syZ15xd/vIhz8ACH1cTgaaw9776nJuxcGd0y2/ON?=
 =?us-ascii?Q?B5KMxlDEZrpEc8yQoRxtfQV6i0QSXHv9QcPAUosdBi9zhERJpQvReLlRvw4z?=
 =?us-ascii?Q?Afhs2xuUPc50l4Lld+qA4VGYL1IhEw6wTBNFhKCA6bszqczZCpKSUjQUZ0bR?=
 =?us-ascii?Q?F9RWh1YWfeLq3Bxh+xU16bPAdUkjIvhoX9/OAnN7483d5uOXKkqwFrC5jr7D?=
 =?us-ascii?Q?Pwv/Pg8Qz4NkkrRMomDAP9qgKm78Lv6Zr8M5a3iP/m79We5CeLTgwOzPc849?=
 =?us-ascii?Q?D3c/pa/DRUafQCtnYemqAcA/K7AN8/t5dATp4qvQEhgosO/Fvge1Uw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mrawZP7BLPHXnbfwAlx66Gkezey7ozB1wEW3nAmJ80gl0kbg+AJYqFBcKnIX?=
 =?us-ascii?Q?hT2w1hfHPOp88Ii2z2lvh8s1ZYrkowsCC8CZ5byLYQBXKnjwLPeO8QHSjmDW?=
 =?us-ascii?Q?cVgI4dxqVIQ5+Pv0//6Z3Y9SPd6No5jpt38GXEbd+E/j5r4wZ2tJm6ImQFr4?=
 =?us-ascii?Q?IyYx5kLITiP0DLZUl6QVk5SF3pKlVoG4DgLOlX77IKDEZpIy746bPwk7dGAB?=
 =?us-ascii?Q?u3hE6j031Jbx3v/B78qWig/2y+Nfk6+5m4mOALNir4t0lR9vhtxeKr9zuznv?=
 =?us-ascii?Q?y4H/q810mNz2096a87OCsWmJ4ave8JDSvZSdvdy3ynnVHopoNIz9Gdtt1aFu?=
 =?us-ascii?Q?oCicXVOu+ZQqEU7pNgW/ELM/kkEM1gV74msklRfWeu5RgnlupcDMZGyoF6R/?=
 =?us-ascii?Q?C/hQA8ODhDYa5NjW5qSrqNMiKySUkcHiypfqvLZDunNEnXvSHWaXzJ5Fbn4L?=
 =?us-ascii?Q?uQ8hzelTEklJpvQFa3SR/FcJIA5Ip+EMV9csCrZ846IQ8QY6VR54J/L5Yi73?=
 =?us-ascii?Q?GOX4m85iHIoGhGw+W4AZp2W3PL1ZNCL/+rmPuOjPpSZfrVr8JgN/DZrXwfHG?=
 =?us-ascii?Q?Dr2ZJRU9Q0ZOSuvjylBHLYQ/XODeYMooXvKKqbCvYIROh73T8xBoXM91GeWN?=
 =?us-ascii?Q?Wge2PdfYo0CA6xqCqTn6heDTVhe7gqaRxPzFIqyKrOMP7wt/Jv2qWw1Oiv8N?=
 =?us-ascii?Q?OPi5lyopf+Jw7QvqF1dIUKVR+rrLVkdISOeMcvEDoFS5eHxh7lmnKyqZ7IBq?=
 =?us-ascii?Q?rn3NDD5Hjbdu4S859B0O+FeAlrvb9hXBq299EiFNX5fIGUf6Cmyf/6YkPdsI?=
 =?us-ascii?Q?QIUrRliz/pqVVmsD5UBFtFZeXzZZIZVxYFV58vvGZWYbIq+U/29LdPH24r63?=
 =?us-ascii?Q?CSDeAPRq9PXvbU0HwqxRC8yvsQQjS//Qemzsd0BWx/obw7KRXBLkjel/b8pD?=
 =?us-ascii?Q?tSh0SPYHBR6K3+Yjw0lVRRZpxJ+nqwbBsSbHeVymVJw3Ms5fGsPvjC6l1/JI?=
 =?us-ascii?Q?fnzvpmWGmixYQ/tWaDR1Easm7aNkTIBnJuieVFyNO9zz+eSzom4kQxtd3ay8?=
 =?us-ascii?Q?iLyhiqGbbefkNGmdOVngwE3mdAHWWA9DQTI6LOIhjrCRW/Sg+ckfMc0c2d3Z?=
 =?us-ascii?Q?Z2MDzaSnJpoFZrZ9AMomCZP+9khB0tIeUxmiCiCPyRNl8xrmgyTLY7Omg4sK?=
 =?us-ascii?Q?FGTnrpItp4O8VI83XlySQ3jpBX3aIQkvzxZRM/VZFfFLehCnh357RiQDY+zi?=
 =?us-ascii?Q?H2x5P+vjexFryGON/zoQKPieiNmBY9zgVCgpUpmInRFiIfyma9gOpOn67vWx?=
 =?us-ascii?Q?OZResf7AE8Mjy+xUKk9wf8WoLUuKB6adhsaKAbFvL4NVCqXvbrK5H8AtackK?=
 =?us-ascii?Q?/bT7ZQVmqdmikLpyD68HshubKcYWoy1nSzqANsyIXRtEp0kRyy25JWtMtLLF?=
 =?us-ascii?Q?bBxUlcWyP4CosILcHBKAr3W0t4PAuh4O4bOh0WWi6/ffUYgFNI7ecgTvU9XZ?=
 =?us-ascii?Q?MkLaRZlwH9I+5bUwYZdfoV9RNMJr40yMYAPcTtx7TgqTY57rBniuJk6MT8qI?=
 =?us-ascii?Q?aAymNVyCTHBZjXaoHu783OSDm1C/MR8Hbw4ZUDqgqAiFKrD5YdtO0x9S6Ccj?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2049b1-882d-4288-1b87-08ddd8a11b08
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 06:34:21.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3QNf0UF3KsbAlvTcQ8Y3qIgXl3rUE9ez+HQr9ArBmH7FKTe5jh0jF8684HemUydDm1PwmJYRTrAnOR/xPYb+xun7Vrr0S9VIokkPFedCOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
X-Proofpoint-ORIG-GUID: tZKVYkFnQeyzIaT72jbsnGnNEiuMxDSg
X-Authority-Analysis: v=2.4 cv=L90dQ/T8 c=1 sm=1 tr=0 ts=68998ef1 cx=c_pps
 a=5wdrYVy+bJgWrn4CB57dMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=3rJ62GqNzUNojHlaeWkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA0MiBTYWx0ZWRfX4JvtvJ7Xl6t8
 xE0C+x1Nakk9NMf4Q7UqMeRVQUMgglV8pSafiIe9dPiLYNIVjNLLDZ1BcS8iSqJib1DFIXpWIPl
 9F0U/Ap4ChW44HPg4K0xJkypKYzCaheRIwWOW1aTy0B9WmGPEFbWRvWkveGyUlSIoBhTTRJymUd
 HyS+YsMrixkmhcFfrsNwZToj7w5E1AAFABjGwjWwt2m0rJr6Wz0eKY2O5I0f4nSpAYm90TGcx4D
 sott/FgVXc0G1I4KCfGwzc0d8ZStgJBUwNa3W3EYxrsM0dLI7YUImZoK0ku0l9SmXZprOueOsmK
 vWO9uLQ6lleF49k6I71kErWJ5RHGQEdhe0zhOieXla6UZpJFsdY5g1t0/zpb3g=
X-Proofpoint-GUID: tZKVYkFnQeyzIaT72jbsnGnNEiuMxDSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-10_06,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
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

Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
added the atomic state path, so adding the drm connector
atomic_[duplicate/destroy]_state is also necessary.

WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/drm_connector.c:234 drm_connector_init_only+0x934/0xee0
 Call trace:
  drm_connector_init_only+0x934/0xee0 (P)
  drmm_connector_init+0xe0/0x1b0
  drm_client_modeset_test_init+0x290/0x534
  kunit_try_run_case+0x110/0x3b4
  kunit_generic_run_threadfn_adapter+0x80/0xec
  kthread+0x3b8/0x6c0
  ret_from_fork+0x10/0x20

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 3f44fe5e92e4..e702a27c2368 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -12,6 +12,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 
 struct drm_client_modeset_test_priv {
 	struct drm_device *drm;
@@ -48,6 +49,9 @@ static const struct drm_connector_helper_funcs drm_client_modeset_connector_help
 };
 
 static const struct drm_connector_funcs drm_client_modeset_connector_funcs = {
+	.reset                  = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };
 
 static int drm_client_modeset_test_init(struct kunit *test)
-- 
2.43.0

