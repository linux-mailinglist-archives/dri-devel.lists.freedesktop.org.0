Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E7B1B8EC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860CF10E6D1;
	Tue,  5 Aug 2025 17:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="MuoADmWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012030.outbound.protection.outlook.com [52.101.126.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E947F10E253
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 07:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jj2R8cHBWepoXr5slSaVZfLbrENfplhEJLqdGhsKfoPwqQf9Kz6ZMvcoUvEoy5EtqcKgo3A6u756trzYQmOzgHDkJiT9nB7RI7hY1P+cbzzAsdIXscM4MV8F/CWJerSizby2mh7/0aiERQkYsRxZyjjJ48hwav9zpcPCCCYzi42lotGrb9vaPj9EISNcGcr27Jy1rfFnFXW/d4LSiKIY7iX1eR+/5Jpw96w7cxRywyiNsVrnD8KN/myFwiAhlkCw/a+PJFG949CcHWZQBbwPKSotxID9NFGM4WJQdJLwxIbMMeyTrE/Pify6Dm3/xpdy40kvlbhq4A2vBX6shqVgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kn4sW4IhzAA+ke7p+V3NUwe4u5d14gCPB2MCmX0wfkI=;
 b=xK2RtZ6stDE/h4hOZkBf8zxZLi2XHM6GJUF0MnCvK4Qv98DypMKqeGcrVTPsbgahSnlN2SOzJZgwadAiK9/vbWOWDewbGpX6T9wfehjt/JQT4MTeyUs8xq/2H7y7LYQ5F0Zh19DNqLjyK9xqTj3aXoMx2s5leQvJ+213q+AqrnyoeIg/NyzJn6wN5fANIc+aNbEWMtIl13t96j8lQU5CWAGwSp12L07HK3w6NNQYBM8vgsogNTA9GyQ+0SIbk1h7NB7424mPcNq6vYVNq91Flvw30Faoe5VSp4cnBG1rrZVJM40P76TCbZjDwHO8KFzSjVhDV1FSEefydp7K84zD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn4sW4IhzAA+ke7p+V3NUwe4u5d14gCPB2MCmX0wfkI=;
 b=MuoADmWTmL332aS4vl10wt17c8eyZ+r355vhnFWuFEjtPrOA5DAjQNewqteWsSvVjHa+9WTFk6vWJl3hcb4W2HyGtLXCLoELaLC8Ppc+mb32BGzlt5ST8q0m4QDqMrBnbmZLqI2xLj1hn+apvz7kEG31KxpjyjaI4NBCiR42EFkOKjFHK23vXWJ/PwXjP8SKyu1eaxTT7txpS23AhrZuy8D0qSj2brhnW//mkRB3GLfm1avjuzzyIXxrfFxphSOavjRPRnUw7rPjduRVTrwPD1GYQf6kk8IkUXsL2OuuNtHE6eNc7jPDqhXH23o4EWHWIYPkfmqKNLM/qE+RbH6NWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSQPR06MB7278.apcprd06.prod.outlook.com (2603:1096:604:29c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 07:47:02 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 07:47:02 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Liao Yuanhong <liaoyuanhong@vivo.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE)
Subject: [PATCH 0/4] drm: Remove goto label that are only used once
Date: Tue,  5 Aug 2025 15:46:15 +0800
Message-Id: <20250805074645.625911-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSQPR06MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bc8477-80d7-45e6-29af-08ddd3f443a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HgO203TYbMWzwAKZ86y/G2dQmcfj6S2AO3E0lftGOZ+/KQb7kxO1jIGbWi9y?=
 =?us-ascii?Q?AR/YdDlMZNEElFoHYkZLyc8SqyvcJN9lEkdiaEguE4/C3OE6n6D9nsENv6O5?=
 =?us-ascii?Q?MSaUk7r7UL4StCH2kmdfcyzJTOJMrF75Bms8r1Wf5e2i0Qgc3ymCIv8uZTc9?=
 =?us-ascii?Q?283czI9lQdEulI8jTZA0B4ZCpk2xs7F6eE6wFbO0deXJuv0P2CWfw5J53GZF?=
 =?us-ascii?Q?3eR4iFW7V0snyShVFJN2Lsv4kgP3dvu1pf+OAKpbf2S/z0Lqnb0bR4ksjF2b?=
 =?us-ascii?Q?jnUEMxJWnIz88bWK7hyYN5df8LK1jIguJkwQaZCSsv3t3Ej7egQf88zyViRN?=
 =?us-ascii?Q?0HQoiiv1W2a2eCbQHQLC32ctJJ2IRNBdoc+FUIy9Z5rXcTG081F1LkbWck/v?=
 =?us-ascii?Q?16onCwzhnLfnzWpqzSrMExWpQ1RELiptmIYZwY4u0zw2W76ItQcMWT1kNg7d?=
 =?us-ascii?Q?4U/vJIOnB3oXTJviGvr1aGsdWU60CnSA3YKuwGFMzCvN5jm5qJjloRLUBjlx?=
 =?us-ascii?Q?hh1YShgQefSUwJtEk0m5JqSkbK0tOj0F8DPCm4eytsxrRPZcb9VUrJJgOHnn?=
 =?us-ascii?Q?uRGgNTSD66UTOmCdsbJMOPGV94b1FbAcHjTEi295cYoQ6iixH989t3c9b/o8?=
 =?us-ascii?Q?jzWzTkQjCpaC2imWLLW/VhaeoKiX+OwqLcK01sVtPOAHrz6KQRwysXxKrHj2?=
 =?us-ascii?Q?lcZPdpPGh76aVMQaJoTiEylmyt3z/QaVXMtKieKOu1qV8g9EN+0QawvyWhW7?=
 =?us-ascii?Q?Mm+WXNN9vsx002vbBBul8DN3d7GROoMTo/GzJUy1E9zIr1je7lk7KKETgz1K?=
 =?us-ascii?Q?4T2/e/FkvapqLgsay3MLQ8r3wy2BOGw8tVQvmjwQIYFc7VeBc5liZ+jxC0+2?=
 =?us-ascii?Q?QeA9/6Gh+QBbs/7NdTLsEWO8Q5nNSQ9vqDcUJWbd5WqhqgVs6lQC4DsxNCKp?=
 =?us-ascii?Q?NfhijyUTdptHT8tVaBSxNaIOi8dp1yzoPXOfmJRfY74UeWqq8cN9fadmrU5r?=
 =?us-ascii?Q?drWRPED7eMaPcsIbdkmA/UGpFY0vmVKvyZ4nuty+1x1+d9JjzHVlKzHLZ40h?=
 =?us-ascii?Q?zLjD4QYaVai4WaabZCxVUVm49OTP2W8WZhuRDykhIpqEJYGKMU0k9yj0pFfq?=
 =?us-ascii?Q?DObeMtUnnWctLJIVZSMxTqgNRCn1C5akixpjH5WM2mDiQkMsfth8KmbgAceb?=
 =?us-ascii?Q?5j1Dnksg++XkWeVYdpTe4M7KD2K1DS1EWej86qpryq6itErh7a1kx709ntPv?=
 =?us-ascii?Q?jVEfE43t/el6+7QvP0Bg2yftMyF71XiVTehAQxU0sGW6aaXs3GWGL6kzRhQE?=
 =?us-ascii?Q?+vb+8sCsx2KTwtI+y6tUdDn+Tl78/lqdiB28LWhdlma8fRcgtt4R4l0OEKUw?=
 =?us-ascii?Q?zzDZ2MiS2eL0UjP7bglg7yFlCOqCmGXROQ5iT23yh/JhD9dI/uiUyUZ0gImw?=
 =?us-ascii?Q?8ucdJzBAKILncAhx5GoMgPiwWyCi5nIwaw5a7eG+ZfLm9WPdTSnV4vY6zhfv?=
 =?us-ascii?Q?ldQl76rj8AvOSnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jkytGuB0iN78wvbAyci/IsOuVcdMmvHpYCTX0A5ALVkKyAguA3WMHWULBzyQ?=
 =?us-ascii?Q?yU7Yqg10mfj6MM2HkqronAz7jOL5N4JeT3MBo1QcYZ5iDuEXQ3prb5KFzoLN?=
 =?us-ascii?Q?RzgevZ+AvvEEB5wTuoa4BhmAgY/5TX/QMxlgZfda/kwJkRCIR/1b+L/N/vyo?=
 =?us-ascii?Q?mMUO66dvxSQ12MwprSQ54HRe4SLYxaILIUzCMAwXWXpBo1Hl3R2CJ/uvzXvc?=
 =?us-ascii?Q?lbZHcgd98tVsXrPjT3drNESferUqle+QD34FqVfKPFvZNuv/+SRKLbvwU4Tl?=
 =?us-ascii?Q?4/azV+bXt0g0wbAjnceqqjCjHI2dT47dL9nMLghc1r/9j0UI0mnf4fxarLCF?=
 =?us-ascii?Q?K57PpfVxgFK2bY4tVfzM6kPkvO6rrkRm0VyKqKZpSf/DcAcBoNc39DyIqyGV?=
 =?us-ascii?Q?+ZVxm96wMpybvwnJ96ZnFvxn3atj7PDbTB/ROoKHBmqYUjqAm+A48CE2A80g?=
 =?us-ascii?Q?MQXpQAVXYm8upWwcsNfZHnQZgJ/xIIpG02II7lcUUxgvkAaFSi+K/wAWaohk?=
 =?us-ascii?Q?QFJ38KfWUpTIBQB33SA2IhufkwQMormP6Lg4V/cqJdDv/rOIl1Wk9HL6YOwn?=
 =?us-ascii?Q?jorEaYg7g/HYcjYW1lB1I77TMVc/vA6Fl4KfHKXMwW91c9g9XF0NOq7rUl7m?=
 =?us-ascii?Q?TLh1zaSItz2w/O3F5eM1vVNzKhe+e+PHJelnUjJDkCWz7yiO4g3k445Yz2HY?=
 =?us-ascii?Q?CXJczMccNyQ6TnOZdM43i067RtLbkQHNONrFYnfvwzlB9tn7IqE2HxbzVSEf?=
 =?us-ascii?Q?XhsOqLprQngp9llKtt8ZNXfW/NdAAw0Nsz2LvAZ01vDasO0wyg5J9h5rPlge?=
 =?us-ascii?Q?hSHDeWRLEL1TQYCUria5IQ2KK/CW1gckSxm0pjpzJYqBCB2TVYPZdaPgOYG1?=
 =?us-ascii?Q?8eRmXUz2/efC3ac/eGFf9iaenBV2yV2iERP0MOs550hSa7cNFXhMMQdt5exf?=
 =?us-ascii?Q?uDckFA+chox12K6vKs3K7cbf0C+QZ8QuWGh610l0gc1+idgSaD3Y+V05MpPj?=
 =?us-ascii?Q?TvGL6I9xzsinVnc69b/BoJc0qM1/sw1Wg2bG/xjlaiY/da6Z38EHnidqljad?=
 =?us-ascii?Q?5wwtANM6SE5BXpkZWV66/6UZTkiZRc4CL8e5SZLFOd8eV5n/AMdUiMrAxpwj?=
 =?us-ascii?Q?BdogmkBixmOKHIrStgNs+33jVy7VGN0R5Ad/tMvoOzxUL3FvOY5EziFvgJWp?=
 =?us-ascii?Q?zP+WosJRvbQHeZaPb98NOqTEgiJX6QRuJRK7e5s/fJR+ZnJKCgR/sI0CfO2Y?=
 =?us-ascii?Q?hqbMLiRziBlPVRnsogWtDzaRou/uKlufd+Bu6UBJdaUbDFPlZAX043YCdi0w?=
 =?us-ascii?Q?jqKo+orfiXFGfOktAGfyCg1DhVFS0Z3vTXc0AHzGGXTDTprjCVSfd6MzzTCJ?=
 =?us-ascii?Q?mybRCFDvVgfWqGhjgMtnHtY7VPhIUlO3z2u6a5SSrFiJYOg9czquDPYExCTV?=
 =?us-ascii?Q?qZb0K6hf/GAkut5SztnpFID5QLJCU3eMlblnLm4gttT7jfDazE7yjeHwqnRl?=
 =?us-ascii?Q?jMHhk/CuMJW19Rfky3drxEREcoMW9ts9sldYht8+ew6YkrATrX+4VNHXYx0e?=
 =?us-ascii?Q?ebCVytsUs+3DWYwJB+HqCsRWxlrn9aUAieHXN2OQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bc8477-80d7-45e6-29af-08ddd3f443a7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 07:47:01.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ur2c35Q/0MwkLrob5uCGgxUkOzSghNk24qwDBsfZDIbW9fYMJNNqqCERA3/hyd0ivATgv43ukWNlik1nBEk1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7278
X-Mailman-Approved-At: Tue, 05 Aug 2025 17:05:36 +0000
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

Remove unnecessary goto labels to improve code readability.

Liao Yuanhong (4):
  drm/i915/gem: Remove goto label that are only used once
  drm/imagination: Remove goto label that are only used once
  drm/imx: Remove goto label that are only used once
  drm/panel: Remove goto label that are only used once

 drivers/gpu/drm/i915/gem/i915_gem_region.c       | 10 ++++------
 drivers/gpu/drm/imagination/pvr_cccb.c           |  8 ++------
 drivers/gpu/drm/imagination/pvr_fw_startstop.c   | 13 +++++--------
 drivers/gpu/drm/imx/dcss/dcss-drv.c              |  8 ++------
 drivers/gpu/drm/panel/panel-innolux-ej030na.c    |  7 ++-----
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c |  7 ++-----
 6 files changed, 17 insertions(+), 36 deletions(-)

-- 
2.34.1

