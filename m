Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FAAA81D2F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37AD10E2EF;
	Wed,  9 Apr 2025 06:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2508 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 02:31:22 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0C310E7B4;
 Wed,  9 Apr 2025 02:31:21 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5391IpnJ004320;
 Tue, 8 Apr 2025 18:49:19 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4cm1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Apr 2025 18:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AljL5J7xujh16N/TR9XZK9GdheW9sAlUp2bkR8TqtGbYyEgU1F0F2h7EktperZzyfj3TUrHtik0UyMYoKYBA2EETKJZiCpWI9SDUdcppsphtCTBKQbcNR3XpvjOGm0IXYxSy1zoE4eGM/HjQck0Johoogq98vJH+77Jm05WNkHfJSjNx314LpID1N1HUoVqQKL8oSDIPvRTA/VlUvOCGIWNC5o+yBkpyh7jiPWTd6JEoQmb5ZzX6dhH5DP1Z5RnBwQ3fG5/BOzVQI6rqP5uIRffI/DRtapjaO417vzw2Hhj5UxxfXfxY4/7eTKCjTrmShvZ84c+8nuHCk0iyGuHQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd2BBCC9lQCTUoHOdELpIJih6jCH4OeALNWGISTJdsw=;
 b=STe1VJC0+lRPMV09y7Irx/3N3q3SStVLDqLDNKoLHGGWps74/nhk22qiiAlHwFehr+lAlOZ2iBwAPmv3PCD/wdPrmBBcw/opzU+xX00OdpL8wDnzS7Y7TWrYb0O0mBCVbxq3X5erDvjIkh1F0Xk9GKgrrv+e/yE0wdsIDj3W2o3J4dhRhRCMmb28Y8ymk/UGBnI1E36XimA4S2ucgFnHLzks8TvXDqgcYjgFblEF3kShFWIJZvjQRKg97InUJ/98XYimVAp8mTHq3X3hAjJD8JKEf8UW3m/9CxdeFwGuyP7lBiEXR6R1P7YDWR8PffLbD5TcaD3bk/uiR+T9vLfm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM6PR11MB3324.namprd11.prod.outlook.com (2603:10b6:5:59::15) by
 PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Wed, 9 Apr
 2025 01:49:13 +0000
Received: from DM6PR11MB3324.namprd11.prod.outlook.com
 ([fe80::fd0:4a9d:56d7:c039]) by DM6PR11MB3324.namprd11.prod.outlook.com
 ([fe80::fd0:4a9d:56d7:c039%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 01:49:12 +0000
From: Zhi Yang <Zhi.Yang@eng.windriver.com>
To: stable@vger.kernel.org, chris.p.wilson@intel.com
Cc: xiangyu.chen@windriver.com, zhe.he@windriver.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 matthew.d.roper@intel.com, Zhi.Yang@windriver.com,
 janusz.krzysztofik@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] drm/i915/gt: Cleanup partial engine discovery failures
Date: Wed,  9 Apr 2025 09:48:56 +0800
Message-Id: <20250409014856.2484814-1-Zhi.Yang@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To DM6PR11MB3324.namprd11.prod.outlook.com
 (2603:10b6:5:59::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3324:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b6e1c2-a6f0-42d2-3a11-08dd7708b9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rxdlPCyJ8tb6AmtU1jW53weH+TvFl11qV9h2c6LB6ei6n7Az2k0ufjTriFMM?=
 =?us-ascii?Q?Kttktx+PARb79XqqtLL16jASmozy8NkWpSfpI/+xCeb+LvddzNbWi/OEH0IZ?=
 =?us-ascii?Q?9MBikuKiKE/CHznBLQJQwaHLf9Y4wdrmzjUtPpGuYJeSGRNaKXGbMom9otrt?=
 =?us-ascii?Q?Kw9jZbA9N75ReJ6R9TZiZx2a8Wx76YvpZsqo1GbfRdLwZ3G3k7+MzFmGUsut?=
 =?us-ascii?Q?dMpjXeLSpbUjDdB9EbnPFkBknoUI1+J1csCDBc9LlOBoWBg8lGXokxN02IEs?=
 =?us-ascii?Q?KP2YThVvgdLg+sPYdfzPvAn86vX/tCfHNaus+FBfOxONeowA2mahJ/wvB02h?=
 =?us-ascii?Q?uhUhLpVk9sjEkYS7U54t7nYpqDlE/5V0EdSRQJx/TYIbCrZGvZd23EgMLv0U?=
 =?us-ascii?Q?7J6E2cHpmjcA5LupP9dH/yyec5nBS5uUZYulaT9ZsJZQp+yHAmbJVLGkO8Hp?=
 =?us-ascii?Q?QNYvqBEBNIJFwLDFlTGeY7v13epUO590D5RPwBt8FB47nLLOwLi6MwSVodga?=
 =?us-ascii?Q?yBMH4dZJ2eb9a8jjxhWDZZGPqgqCOonbWo83t/9E86Uf4M0la2C3u3QD4wGm?=
 =?us-ascii?Q?WT+olIHW+E2MWqlvLDf2h+bf2J6hvFnv/ziOabC3SWf8VoSWKnK/TZiagLy7?=
 =?us-ascii?Q?9XWbnoPHl1F26Ac1n1M8C+i4iQFxqoUb+mRQ0fAH9Uu8ngq6z15t5GoArYva?=
 =?us-ascii?Q?lhX6moaTh/3QntVbKa4Cf29vciw2YZVT+TebI38IBr3xZmqxoVd5xJtX0P0Y?=
 =?us-ascii?Q?gzXwmMhTG8LsJEWVSGp96btplg6WJS1uq9eVoe2GKXg+dYPPQd75+Rtri8X0?=
 =?us-ascii?Q?kG9hdPjtugHYtAcuo7rjNLoCk2AUVewUKI0wCMkERbOauxALsmNyze4ien3Z?=
 =?us-ascii?Q?wl8I2+jLp0pDLngq8qcGv1WymG29Au3Z2H1p0yAIvZh8Hf+uk2QT6FVThoD8?=
 =?us-ascii?Q?wzFy5msXFdLE08B0r1ZOEs3JxDaawodmYaoz42lqU9C6D0D2CydiSSrsfrQG?=
 =?us-ascii?Q?tRiMC2XkwjtWzKrWJoCDzVCwqMKvkKgWG/Ww/Et10y5a6g73TcvfAXVh95yc?=
 =?us-ascii?Q?u8PfUjtrUPi9rKxBDVD1myQYww6+izHZQuRRkcLzIzmPfVkKni2U1NlJknxK?=
 =?us-ascii?Q?tlff1JWbgpPd+8ze+rqERkQTJZ5B9bPy3K143UM3bJgSclCSxXxuo5/lbDCX?=
 =?us-ascii?Q?QuLlXZbu76GYvWSaK4K+m2y201Jtpx8oNR65IKsqaHmxKUvh6ZF2AOtv7LLV?=
 =?us-ascii?Q?0N1Gd4+mGSRCsX44jYi4cZB0WhHWB5wh9+wAnmJq/652mPwH6hsUTE/qeEEI?=
 =?us-ascii?Q?m6FQgCAGxfjhJKefLw6DZQkIx0NNPmKmMUqM+G2lddWlvUdBQzcyxqLB84/p?=
 =?us-ascii?Q?ugZSNOrlC2Aew5qF9lfKy2jYHdWVCztdl0tRls+B+xKSTw/YT0HvEgj3/fil?=
 =?us-ascii?Q?7nJDsTmRhoU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?euffg6a1U1kwe2A39jcFGTEytrpYfkxa9k9K9puYRZw4f8MQZtmN7/QK3bKv?=
 =?us-ascii?Q?Sq1CL2BHek+hWzixAkkWYoAr3QnqDXTScIGTHmE8UbzugDFQxAi2ObPgHKM9?=
 =?us-ascii?Q?TW9CSa05bswajMsiUsq9JNeQPxs6i1l9cIXCns8XAQImtFiGvIO3/F6AYgb8?=
 =?us-ascii?Q?mmlcZklTeVdESEU0obQdO1WAFWEE9WUtJZ/hqiQTuzGWSCcWA8rY4OqHGAfC?=
 =?us-ascii?Q?ha7QSskgpLjYQs3LQf1jMP3QU8/MzAeY5L/iV9hi7ndPnhX3WYen5V7vkD8Z?=
 =?us-ascii?Q?Dmy+T7FOPNWNiL6Gvix9jdiHa6IQBIk6BZxS5snJojk7wt7ZJ1+IacckNHJb?=
 =?us-ascii?Q?g/Ie+I91oq7J7v5SKnV7+Dwhon2e0vIkPxVHL7oN/JNUErf8piHgUXIaktrw?=
 =?us-ascii?Q?I5jJJrE6qezWM2PrK/XeYaTDUkt7X1QWJGG/AXBYTbCoVS4QLqxLmYtkzBS8?=
 =?us-ascii?Q?7X8unsj5zw5H2A7G1xPtSLILiaYPzoc+PVBKxFqrHW3HyGEil4D70knP4CQm?=
 =?us-ascii?Q?Bf0UZHFoazo8KN3wCeKiyOR+GhLevE+PFjGwFiw5mO27RcfPjnRqSJiAevse?=
 =?us-ascii?Q?aizOV7mTEy/LH/mSMy/dA3PV37lVegFIpdJ2jyr2qV/68N+uVwwMYonYt5IO?=
 =?us-ascii?Q?PyYrM4NC7xb0RG5Qzr8FrAvWBrtsAiX/65YWrsQ4iMzR2OAcNPV06v/qiNiv?=
 =?us-ascii?Q?QGpO+sCR7QcqdwcdVBLeLthSS1G6mAbcaqV34CxozAN3bq9noCERIN4JY6e5?=
 =?us-ascii?Q?mXMLEY14R09k4bFRw0ErTQHt+UgFf1G3zB3Vd9uei4kFpgt6MloICViL6fgB?=
 =?us-ascii?Q?eykoN5jAENJEACbR9+00iazwxK41VzO6lUwM6jS6HHgCd4lZoV36BOxJ/U6b?=
 =?us-ascii?Q?szPcbICIv0uIFPQ7Vm98nMZ+PEyaILf9qZ8eb94VA7sjK5qJUztbSpElVcIu?=
 =?us-ascii?Q?KSsx2lWkjRdgWSv6hprXk5ngCifTxMy5QotLHjLx1Pj+/UYsTLdQS/+Q0CeC?=
 =?us-ascii?Q?7PqfMxexmTWoxBXUqNO/dEm2PpaFEFIFvvHGoD6/ulf1sGNHTJRxfNAnUDqz?=
 =?us-ascii?Q?TFlZ6AAG9XDg6392oi2/yiBNkGp09csNkNntxHh9XJKDx476LYvUURKBR5Zt?=
 =?us-ascii?Q?J/R9I1tGu3DF/yO4YevgCYsMQp0HcDhtZmwGCcyKb4dIuVLvkUE1MMWZHu+1?=
 =?us-ascii?Q?+iLGll5CwaRKHd0Ne/nQUcrzWed682PEpsp4o/TGmdJRFSLKr5yPenltO+1m?=
 =?us-ascii?Q?8qdQ2SO1aakYUbtliKRpTDFcYJcz+jWCqYbQbTzNRSBenl3v0aj2Q/PZWcqC?=
 =?us-ascii?Q?6LYkq25dl7TeVkRi2Tbbhi5oxtRi0kWl5NSxB9BIPCZOA/CWRbKDqS/DNQzG?=
 =?us-ascii?Q?8SSv+kR1x4xUiRzgiha5Z53LhusgUqNPcOLwWPhLi6BNb3qa2Gni4NXA/Zc8?=
 =?us-ascii?Q?rwc3NSLr10QHHWQQ88sKWAzMd0PqOTQG/0YVhOfxzzKCaa1X69M5qkitl+GC?=
 =?us-ascii?Q?nLTnwx7KORZodt/bZoLNMyPXIkNPdKoOsi+3oQy/4P8MeW58npe5gR20Kqvl?=
 =?us-ascii?Q?n4Swgr7/dWukkKkMr3RjCHZ6ugJy8KKOIaRi34kE?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b6e1c2-a6f0-42d2-3a11-08dd7708b9c8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 01:49:12.2531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Hw5konlKMbbrjkbt8Lr8Wk1YndSmqJDGu8ZkbWVAPV1bsKJ8Ibq089gQCotdcmFDEGUNrAO83HHaaWcfmKEqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
X-Proofpoint-ORIG-GUID: 70_5l2hsWY3vCrwnD40gp6XUF03C7G0o
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f5d21f cx=c_pps
 a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=t7CeM3EgAAAA:8 a=5jjrFKfR0PwuKcLNdasA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: 70_5l2hsWY3vCrwnD40gp6XUF03C7G0o
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090002
X-Mailman-Approved-At: Wed, 09 Apr 2025 06:39:13 +0000
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

From: Chris Wilson <chris.p.wilson@intel.com>

commit 78a033433a5ae4fee85511ee075bc9a48312c79e upstream.

If we abort driver initialisation in the middle of gt/engine discovery,
some engines will be fully setup and some not. Those incompletely setup
engines only have 'engine->release == NULL' and so will leak any of the
common objects allocated.

v2:
 - Drop the destroy_pinned_context() helper for now.  It's not really
   worth it with just a single callsite at the moment.  (Janusz)

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220915232654.3283095-2-matthew.d.roper@intel.com
Signed-off-by: Zhi Yang <Zhi.Yang@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Build test passed.
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index eb99441e0ada..42cb3ad04d89 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -983,8 +983,13 @@ int intel_engines_init(struct intel_gt *gt)
 			return err;
 
 		err = setup(engine);
-		if (err)
+		if (err) {
+			intel_engine_cleanup_common(engine);
 			return err;
+		}
+
+		/* The backend should now be responsible for cleanup */
+		GEM_BUG_ON(engine->release == NULL);
 
 		err = engine_init_common(engine);
 		if (err)
-- 
2.34.1

