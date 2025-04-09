Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8936A81D2E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BCC10E276;
	Wed,  9 Apr 2025 06:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1544 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 03:24:30 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666910E146;
 Wed,  9 Apr 2025 03:24:30 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5391VfCC020515;
 Wed, 9 Apr 2025 02:58:29 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8mvyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Apr 2025 02:58:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXsjJZgQU14YQDFS6gB65L7Ko1oNapIT/ff948uitkXGZmfPy7qVLWrG1Hwwp5SSqG0ulu0x/LfRc8Fr5d+3DhdWS+Ax/T0jxdfdanDIf/7Rh1VLq9XceHJpMg80StChf0R5YQFmIU4kTN523Zgay/97pnGSOj5OeSvOWgsP64yyxzzpRL2kPXyvitUnekJiMnwCrdxEIhgXFgwCbpc8mGuCO6HEY4t5nuS78Q+se29M5BqVY2uwGT3Usox5z8TfUtjlMfQ/ePfKGmWefyxlBEn3/Proqw8zeyzJ1l+e7Nt/BIdzoktHQIHfKqMWR170RmXIkjPcs5lTSK3yuPSikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLYiN8UVElOJ1vuNq4gH2mMqrN+Hjh95TLGq7bXWoDU=;
 b=cd3p269PWNazaAzl7WAdKL9pZWi7+fJ9pzWeKb9H4Q5JponuxfzAIKiIDKfiShJ+QEQOMju1+eXxSoFIYWvhEJieDidQlukp/ImvjZF3BaWfr6ls6ftDdGM6mM9FzkBfL5jmpeUgixbvpGYYXN+CmmnShyDTcHiOntSA/+6DaNYhRYhqJzCVuUAAdUnQey/ZaAtooI8aLzDQqxHGc2dsxZgHOAbyQ35YZKavmCuL6xK1j1dgL+RxTyzEdlRdOItzmJ71ry56OvyABn/VVK1s5nvhs/a4MQUo9XkpsoBXe9NzsujYA1C/wfFtzojGmliINfnChd6gcj6JhEDm0p+HkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM6PR11MB3324.namprd11.prod.outlook.com (2603:10b6:5:59::15) by
 DM3PPF31D2DA56C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 02:58:25 +0000
Received: from DM6PR11MB3324.namprd11.prod.outlook.com
 ([fe80::fd0:4a9d:56d7:c039]) by DM6PR11MB3324.namprd11.prod.outlook.com
 ([fe80::fd0:4a9d:56d7:c039%4]) with mapi id 15.20.8606.028; Wed, 9 Apr 2025
 02:58:24 +0000
From: Zhi Yang <Zhi.Yang@eng.windriver.com>
To: stable@vger.kernel.org, chris.p.wilson@intel.com
Cc: xiangyu.chen@windriver.com, zhe.he@windriver.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 matthew.d.roper@intel.com, Zhi.Yang@windriver.com,
 janusz.krzysztofik@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5.10.y] drm/i915/gt: Cleanup partial engine discovery failures
Date: Wed,  9 Apr 2025 10:58:09 +0800
Message-Id: <20250409025809.2812082-1-Zhi.Yang@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To DM6PR11MB3324.namprd11.prod.outlook.com
 (2603:10b6:5:59::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3324:EE_|DM3PPF31D2DA56C:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9bfe9f-0b1a-4238-7f25-08dd77126516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iugkXE0UhlyZ457Z5NojukUU0RtHHfziE0jLA1K8LTZt96cMLlu3rT94SUmu?=
 =?us-ascii?Q?7YHfPA3wjPJuGTYLEWqQuIIKDBVbjTU1LHav/2ZUGr9vSqSEiARCoM56FZk0?=
 =?us-ascii?Q?2rV3/khB2dZzGHwhPSHKPPU2I4iIOIPUngLU6LqApwapOGxPzRQXMUrkhz0t?=
 =?us-ascii?Q?R953jSBby3dmL0ZaM6tCJsmaPs9IgSHpQMehmckikm6Pm8O74nBki464f41+?=
 =?us-ascii?Q?5FMwM2KoUA3RV9EgEGxAtso/E3tELs7IWVjqB8Cslf3DSbKtav/PrCj79QxF?=
 =?us-ascii?Q?dmmYgOuP7Iybp1gttrRkJU7rQ8wdUVEDChiDufSgRbil2Jj/P8OG4b5456qo?=
 =?us-ascii?Q?yPHLxANqOA6AFxRn62vxnwTuc8a/mmY4yUfPIUinDLSdwr77sQBviHyRsx2L?=
 =?us-ascii?Q?aPGG1oNwjny7E2j9+fYNHfpCNQ3aNKwOFqwal19Zf1NVSjSOs7gvyMX8saOw?=
 =?us-ascii?Q?QwtEMdAf9tjLMNeIo7gK+zlqXCruZRenCb1I01vwyVQzvIIzz873JpDP7tJs?=
 =?us-ascii?Q?DZcbtKScTEYRdbHJ4wog57wwsCRJIPifJ8r4f++1ObHnIEd7jygDgacYEzmT?=
 =?us-ascii?Q?QNoU2p88KS90hWweFE40H/eHM2t+YyqRThKETeEqUt1rXhIPhoem6PdvveSb?=
 =?us-ascii?Q?uG/sviTDoImoCaU56PqfbD3EbgCQ3C6Px005kdzIy85xTz9dCiTjgNJlfTUu?=
 =?us-ascii?Q?750ii0Vl0ZAcZG4Eft3rb4W223mCQD6MqvbMmGxb6+5Oi1DmmxrdYL0IGcio?=
 =?us-ascii?Q?5/iqP/oKTAVBiELHTSbqwmtHK3+13y7lr+Doa9RUALTfsJFz5c1nol/Zk1WB?=
 =?us-ascii?Q?FEDY62I9G9JEOQcLjXONUY/7jun/hZA10Gb5hQCl2sgLdo2hKW2XMAFeJ8at?=
 =?us-ascii?Q?cnSgQkCl44DuKHs4UMmqSnja4Fi7vdBfIry9kn9TSVv84fVzdtTIWBl+0lcg?=
 =?us-ascii?Q?TdyhNdeHdQb3bCyNlw+CCvxFMQh/JyJRnFUdYl5gc+kKNiplO7W77198DSfc?=
 =?us-ascii?Q?QlAVoEKsMruRiK8fERL+Yw0DxJW2/k+SHjpxmWJk2kjU6aeo+jbkdni7L92p?=
 =?us-ascii?Q?qUsVGWa/X0oFU2TIzGCZLNJhh/rZ1cDl7wlDXCZW1CC4mUsl9WFprE/rZza6?=
 =?us-ascii?Q?vVmOJlP0zrpToEcCoKMyi57xU69qCaRS8btuAO++KCUF9I60gtmPbZQJc/56?=
 =?us-ascii?Q?L3aAz45rpDgDQDPXrnxfBonETElW+8xFmOJ9/VGZy7w2nucRMjLRwoPLHD2H?=
 =?us-ascii?Q?4W3yHX340dE3/DWUu+AyxvigQ2TGizMpC2HNVNTzKidIU4l9F5/3qeibV5CL?=
 =?us-ascii?Q?xrNjUkH+Sef1Rsg5yupb4r7rLUSiCalHt97uIVOFP0icwCJSGOaPEQEOub4b?=
 =?us-ascii?Q?KDgUPVtmw3uFz19SExm3Zss1CPaMDq1gfiP/r1a2osh9Z5TENVXFylf5++ga?=
 =?us-ascii?Q?HsPzgVScuBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GKbt108OHFbmu3k7pigZxTj8oFMHL7I3bNNuVCSZQKy7Pu7vj9nYt/TGd3SR?=
 =?us-ascii?Q?i+r4sgZmYnuOGHa86sts4he0q4dR9WQ6MA/AsFCEplqB8WnreV9rmcADX3f/?=
 =?us-ascii?Q?KOAZOE5Ncs6EDs7xZ2fKwwxjgf90W4evUKj8TfnkviaiSURBldzVCbC3JD2F?=
 =?us-ascii?Q?Q3o9wNvi3pqgzMJ7m//1j24d7QgZRREDDVf3tRBop8ffZzVZk7j3KonB5TWt?=
 =?us-ascii?Q?EJFxPXjHehpSjH/M3yHp4LDkd6ESUdn7xCZp35gulYQqzal1BRXTNB26AMup?=
 =?us-ascii?Q?8emsqsjXbgpu2RAW4GIGSpl0TdAgPsY3FN3afzFknOYADxgeB79ZrCiXhTEZ?=
 =?us-ascii?Q?Rf0VS0IOBj0kg/7JxEvHeLKgIa+Ts5C3tbAudNs97yJi0mlIi3CYUxYC5SON?=
 =?us-ascii?Q?Ea6pKWTXXgdL3yb/90mdX8CLnuHeVBma7Ca3X4YI2miSzr5qESAl0sOZ/9Cv?=
 =?us-ascii?Q?X/wTXsWRR/f3Tc2ALS+XVpRYEOIwes7RU5Jzq4hnyXb7LTltEoQqhkz5vCOc?=
 =?us-ascii?Q?taf38xp8j6cEUE48OjYuX9YEEWuaqDMuW28cEpyrxc649i8lErEODU809yGM?=
 =?us-ascii?Q?lOs+o4zSqwoYWV0PpG44rd4YkFvQkp7Joz6l6w3QQvpBoftBJKwp3+cC1iZT?=
 =?us-ascii?Q?FN+A+K0mubazcFpshTlMDCaIAtt0gLTSHzInzN6s7+T0RzTV1utkq9+UrB/4?=
 =?us-ascii?Q?fuyNUai2mEsXAJEVbaunUf3RUT5MPP1hNTL5mPCbe/DQouPW+FsviprPzbjg?=
 =?us-ascii?Q?hY6yzFN+KqOnNmHv5rBCQ4SRgy6/wFj0GKWaKoGVum0NJezRC0i2Or528sR9?=
 =?us-ascii?Q?ONG+LGB1iTlCZbSFhcjSNKQmO2ETPRJbhKcuuuuwaCTQHOK1LHMhsZEDl7+c?=
 =?us-ascii?Q?lf5XKWTdFgz7YIU/wVK7QhWODTA9c2qtBWuaolym6GK2JovxCPs6pfkM2gxq?=
 =?us-ascii?Q?WUwyascBI1ny4fSa5dipbauxe6aqBpndGqk0I0DTdFy1ttmsqdZTgzoLjLpY?=
 =?us-ascii?Q?svb8FBLnmccpg8Hr9nL7yfk5C5AJNBfWjk81/xUP5QMKoDD7awDQPANQDanw?=
 =?us-ascii?Q?15kvnGsORu7iX4Ulc5X/SOJVlWwN+8njMmIM+TlPDrAEqvVGl/aBCqbY+o2B?=
 =?us-ascii?Q?f5M546yI+RNi7SHEFCkvyAvlwUuV+we+wh+28FIgGaK6FgHAY/tFVxU2PT3H?=
 =?us-ascii?Q?wBxJmUyl4wnvXA5SzJFckeCTEBVIAlyu8Oy/Rbxf6enjuHVr0KAHlH1b5gMW?=
 =?us-ascii?Q?C+ycfy++voABqM7hr2rdLHCRhW+YamCV825DlBoQczKrgGU1ZZ337luXaxIG?=
 =?us-ascii?Q?spv5HgsLcRBMINpGcbSo/be2xd2AGROpKS94rkDGNQU6LJtGxCBuSFjA1Sfy?=
 =?us-ascii?Q?tr/LgNGnaU7CQf/akJ8D5sXGAZxfmj8jU2mwlPiu5NivqTkq3/j7mxJdiyAd?=
 =?us-ascii?Q?UkFrLaUtUQ31V2dEllJv7YSUgUkzpSN39bb7qK2QMUVLZi9mdNoJfitWR00M?=
 =?us-ascii?Q?tKVWye3vNVmNXdvyi1BDMeVhykYwn5wdwYE4BaDSbXPi/jIZ5ys8qEaNEukO?=
 =?us-ascii?Q?GoDdOKLLyTdsv0nfIQhH41Q89ggeqtQ5cw5uMOIH?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9bfe9f-0b1a-4238-7f25-08dd77126516
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:58:24.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Z22uXPj0pO0UrJIzT+T5FFpZ8N3pe0eC4TGEzdKBoRFjLDkbvOpDdAlyli2N7lUolGLoAEb33CSpb+Va1gG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF31D2DA56C
X-Proofpoint-GUID: UJQQVHeo023lbeEBvfKnCbH9nRzPx4hu
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f5e255 cx=c_pps
 a=yfraj20uO1EtZH+TM7jpHA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=t7CeM3EgAAAA:8 a=5jjrFKfR0PwuKcLNdasA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: UJQQVHeo023lbeEBvfKnCbH9nRzPx4hu
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090006
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
index a19537706ed1..eb6f4d7f1e34 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -904,8 +904,13 @@ int intel_engines_init(struct intel_gt *gt)
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

