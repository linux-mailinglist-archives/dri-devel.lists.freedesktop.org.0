Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179D94C3F8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 19:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B934410E7BF;
	Thu,  8 Aug 2024 17:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3mA7ImV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A0310E7B9;
 Thu,  8 Aug 2024 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723139724; x=1754675724;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=58BkO78xbfY691v7YXeDRoPIsPUG8OkQamkNzARJCDw=;
 b=b3mA7ImV/rj2LpD12aw+5OO46e/jgPE1G6lJKMTGUaYBU5cXFCBdjyqH
 0REQeFbfG6YB21sjGxPDwUOt0kLXP1jUPfaxv8uiIEh0zQl3g7h+xHlz1
 LWliHZlCfi6QHZYcQ3zbBbmg3h69V8sS2wrOLjACr6kDDERs0M6R1rs1g
 nU1+FTuNOuihQf5hNirEZiqhD4WwhwzVft033Fasksdl6yS9GHCEERJ5R
 XTYijfGuuaPMo3Q8GHBMh5emyMqqZRYgwJPDnTaT4zbPK0yyuJ4BZGY32
 Yb7YzypoeWUkaMhGHA1nxSA94/5zSI0x8TJdCMaFB9Rh0dHZ6GUWoOCm5 A==;
X-CSE-ConnectionGUID: bAj6KwpCRoip+zDl+vXDag==
X-CSE-MsgGUID: +7uVCVFySPuMk/HGf/2+XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43803568"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="43803568"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:55:23 -0700
X-CSE-ConnectionGUID: kwCzr+7kQQqljyZcRFWGCg==
X-CSE-MsgGUID: /lmCeBzVTnSaSHZwg3todw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="61942233"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 10:55:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 10:55:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 10:55:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 10:55:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 10:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knEJGcvINvNf3eDzNl9Cs5xzdJ2z5pn72bE3WEZhO5XDT++PM6sSTgtSFD1tA4ZdczZiDOFz9jzGf4OJuIEMpBJJfikKQUOcb8ePV3Z9YV0t9z8f5Hr5TRBkfeO2dXRb0cuUHo6VdQ8tSTGh8Bv/mXqy5yju1qxzh7lZwQ7oAtTItrI1xOLdfjw/cOuvmH9xOPssHU0BFCafDdTjxHCDPa61HgR6pDRd+Oc+IvXDrcyqAZDY2bGSbZJezdDuNft+aQTjxseSvW0HJlj2eskMy6WNMSYis7FwjXtm5Luc3xQ2/yOn1+CMwoX9zPDXIIxExOjEYn7HpL+081RUBhMc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwGV21C9XJ1kyiJHdTf6auJuRVfZN08ClSO78wCsN1Y=;
 b=LB1CtW2RcZ4kLqfZKugQcChUEh2CHw2YpkQYnx/qVaxkRTFWqYm3ghFg4H+AJPPY+SJAv45fDzo/ijQ/CrZB7FKHegnwfbJ32laXMHxc9AyjgRDWTS0YNW6Q7x3JW5QTdAVUwmfPQWfJHJ554biVmL2ZyIvsI54QjzfR6L8h1XTpWq3F7uF5ftXmvtnVFW5tJZJKSYeyv8LDtngtSFzURZ9mOt7QCEX2OwhqsqSISyhbDtYm/rh/AHXlzuqA+DIIq9fnzmTZuqNkcxqZiT3I98k7zZg3dX/79Ez9k0ShsknPU/MRR06NSYdH4P12VWqn88ERp6YTAqyNogYuIKMqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 17:55:19 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 17:55:19 +0000
Date: Thu, 8 Aug 2024 13:55:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <ZrUGgVrgTJ_vF2PS@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c06c8d-455e-4a92-667d-08dcb7d3446a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p395hxhs2XMJsSrnnCou41bMtOgm9Q0Sy0xVkEpePTul6KJXf0ekGFgaN4dZ?=
 =?us-ascii?Q?bQPaIyMxHXwzLOojd+uvZYuoLxO36agX5phM9LiF8IChl+ZyjMc4/YgRQ1XD?=
 =?us-ascii?Q?QZGGM341/IeUGi+KtNYgScolw9xvbfa+7YbnrQdqLsQIdUrCAJFAcvKsKf0B?=
 =?us-ascii?Q?bzpZj3kmYZ7vCuVO2CJ06EpNWafaJUm2C8YZuiGyn1tDF5evIiOdk+5jXOv6?=
 =?us-ascii?Q?WkTztWowGOLJTvjMlTPCji6WzAJt0j913Fw3AVsVzaXa0bIqE5dq7ABn9eto?=
 =?us-ascii?Q?j12Qd0A8B28oaBmUQMMETgKQBMkoS/ae7zxLsWfPE6OR1W+d293dAFkybd9j?=
 =?us-ascii?Q?O31Pf0aTy6G6x6129jdTXuTJH3UKG0/zXE17yvwdKl+GgmWWLRd3nOE7Uj86?=
 =?us-ascii?Q?p2XFvbGuiAxH/I2eXh5XwPH7B9mFUGBYupWqR5YJpoRsWuBrhihfdjc2dkHv?=
 =?us-ascii?Q?T/2wU+Xt69GtpSujF6fRTO1/VJquzZXJQd9KkbUzlbOjwC9HiPbxkqAgHWPy?=
 =?us-ascii?Q?jnyYIz+TlIgo0MrxpkJXFPIzZnFL8AWKQDMZvvQQ9RaGtHOs/pIPDNYUY+/p?=
 =?us-ascii?Q?Gy1bRJdH6x4YjNE+3M+RyLm3F0SNMmFJ+X1fVT/kmmjiWeCNvkcUa/sS7vUn?=
 =?us-ascii?Q?sYFvQFHvU61iqGQrcWGiBI3jZXeLykzMzWf8llGu0wz2UoJz/SzHRB/7sJ42?=
 =?us-ascii?Q?ycdxxeor7i5JD1MFQf5xsp8xCMnyonOBjaudVOf4oClWioUNcYNl9ky/xbHz?=
 =?us-ascii?Q?XNhTh5HqMgvzhkVae6164jcKFRGfcWEctyZoALe3a9kmL2t/fB5ADqYWMoyN?=
 =?us-ascii?Q?oBWkeyjQc3XHwHcDklLqHzKBJYVfq7ldkHlOFkCOvcRAaV/OakC3JntJBpxg?=
 =?us-ascii?Q?zdQkhPXU44akvcJrpcpDUZUpmoeqxBkX/46kDNOU8Z/ZGudV4uGuZMW+oeoj?=
 =?us-ascii?Q?HMwpSs45CsFQ7lcUyCqSal11y/1AkRrt4tTcVg1l1RIemHfd2g//kcgY5AN4?=
 =?us-ascii?Q?MxPajTqjmAhrk+ektHu3qNCHoDKGuUAgOsIUmiyX960nVeZowLOKH40LU5lb?=
 =?us-ascii?Q?JKJq2msE/+7xtHh4ZKZ32IZoB5oowI5BgPsD87pbOb8bIdnlTh7XHZPK29KD?=
 =?us-ascii?Q?WTXKFEMKtUVOGx4MOlBLdZYjx3tSBdq7u5c8ES1ljeZC9JP1t2MPuz+atEXG?=
 =?us-ascii?Q?BWu5cZz6qx8++Ezb/rUvEkVnlA9lAc1T6s73TYaMqz4vyGm7t+r6qsHN/kWy?=
 =?us-ascii?Q?x5M5uMBpk1WacBGnHPMVTKB4KdD1pp4QTPJGzs/cc1lP6u3DeBt1kaFHvcck?=
 =?us-ascii?Q?vRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAZ77g/KOtUCJWs/3uCpAFfv+fd83SazHpLXONdP4aWzxXkZcXdyCQYBBmyL?=
 =?us-ascii?Q?uBkZeA8AzimOoofZlk45IF28bPVuW9Y9gr+NZVqISWk18k0lLeN6QTkta8VF?=
 =?us-ascii?Q?kuNgj6UNKBy3GGB/Ed61NaoXjgyYfxLoLk+pAwaxPto1T9JE4P45aPl/Mb51?=
 =?us-ascii?Q?XbIE12qk368jREMvPoNhu2FVfzOc/NhmTdwSI9d06z7vrLPfuc8DsMGizfcI?=
 =?us-ascii?Q?KFBtRmN/LODAf3VSWzoMpWaiLAwzD4dAIZCx4L1WCd3DHcGT7JqRxzmMluAB?=
 =?us-ascii?Q?gEuvVKKyrpDKnIILnJ8fYgfkk3R7EGGdXtxyugacOvB+DMbqXXe2t9XQq0lz?=
 =?us-ascii?Q?AB+a9uBlwAOJSXZN2Xv+koU8Kn9nJiiGk9Oq/gz1/pmPJuj1/+nQaFBEsbUa?=
 =?us-ascii?Q?7B0FhgB+zLfpZILXPtfQmCaD2CaTXVkvp5B20jqct6mTJhm6pMxrX0YSM1Xz?=
 =?us-ascii?Q?bDOkvpTYnio3Cb/6cHAAdhBRw++fuDW25KzWNxiJdrV+gt4y2qjpIwt9jGFp?=
 =?us-ascii?Q?BUI6AHsiYmKfVXA5zd1KFOAR4UP9A8FAZJ6jgcUVCwdquvRI5Mv7KzMqN02M?=
 =?us-ascii?Q?8HiIJRT/aK8utxNUKSfgpjj7fsL5zrCPwpMCV9kvT234yR/4HyrMB/FNsDx5?=
 =?us-ascii?Q?nIDpF/E+KAYuP5GU2aRILQqRCBb29Usuolq0WmBFASAvKhMCpzdAg3AnkJqX?=
 =?us-ascii?Q?DDCWmG+QRGOPfZA+S0AgyoH42yjHDk2wcb+50P89VXK1pdbn9dxakMyYgh9Y?=
 =?us-ascii?Q?LwmeONzT05WOcyAakWa+XGBHfDYndPHULIqheLh5VUxjAUZW+T5lTmZC0FJ9?=
 =?us-ascii?Q?cZOY2uwFJstKHxhVQKbxYc55ZqIO/HjwsGcumnuyFZlM/8mUEBgOGeITM0Yk?=
 =?us-ascii?Q?Gu2V5XcMzxaik7qUWhPObl8lSk/+1SKnMT6WuKBaIJKQxX2AdSKwrOKY1WWZ?=
 =?us-ascii?Q?qKfPifeHm9zOKRXBBiO5H6DSgAIJakI9Ry1c8u2PJHk4l6RX+j6ySs7AZ7ZI?=
 =?us-ascii?Q?hoELWi37DBvjjCn7+1FgnwfvdLgfVzSOb1LVV+k0mx/r04Ax1x6MyfkgheKG?=
 =?us-ascii?Q?i7ty4nVs0+c6mNXFjJmxKbsNNoBzd0cNuuoNYdKfaSGCGPzba8LjiMwW2Eum?=
 =?us-ascii?Q?QQPdVM9WNG6DvViy8ZrrUn11AFVUS1ZMw0Yd+4HfyMFEJlQnKFDV8dnFkKLN?=
 =?us-ascii?Q?YEs6ye3d2SxgMb1g6p7LnuP+fcVaSYieA9xUkwkg4jv6FUj5xVJ4dmCLec47?=
 =?us-ascii?Q?IFcvYLRjsMcAXC0UOqJm0H2Y5vDVv8fi/H8zHB93U7jmKkQZaFNz9A/gt4V/?=
 =?us-ascii?Q?A/2ULrnttXovFW2k3VsVg8HVHPHzLS+t08Tsqc+VHimd+lPnxtbs/jgX/12k?=
 =?us-ascii?Q?xgJ0nL/Ef0fvnuPhACqkrbgAbfeChq/BH5gAIsQc2h1o6FGR+P9t/qiRprhp?=
 =?us-ascii?Q?sPc5AQJYqOMxnqNYQksSNyLFpjTPZ415uSH785O7OTwnsSf42HcIFCmbTTA6?=
 =?us-ascii?Q?duj27lVfnpDSZx+TL6K0fJnsMGVz3jRsUGa4LXh3SLbE9E9BI+79EyQV7Va0?=
 =?us-ascii?Q?Wb6R5x5k+gEKdpQKL3R8oDHUCtIL0NWJX56S8LX0LTHH1B18/tJuBuuRYGcn?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c06c8d-455e-4a92-667d-08dcb7d3446a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 17:55:19.6178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbHUk37jovpafpFTrF7WaobwRj92resR98oBc/1QieeSo/NRR1LVcomDM9WyhxZecH0vNb4y/RXojYYow9Hmww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
X-OriginatorOrg: intel.com
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

Hi Dave and Sima,

Here goes our first round of 6.11 fixes as I was out last week.

Dim failed to cherry-pick some cases that I'm going to take a
deeper look today/tomorrow, so probably some more fixes coming next
week towards -rc4...

Thanks,
Rodrigo.

drm-xe-fixes-2024-08-08:
- Fix off-by-one when processing RTP rules (Lucas)
- Use dma_fence_chain_free in chain fence unused as a sync (Brost)
- Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
- Take ref to VM in delayed dump snapshot (Brost)
The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-08-08

for you to fetch changes up to 642dfc9d5964b26f66fa6c28ce2861e11f9232aa:

  drm/xe: Take ref to VM in delayed snapshot (2024-08-08 13:48:01 -0400)

----------------------------------------------------------------
- Fix off-by-one when processing RTP rules (Lucas)
- Use dma_fence_chain_free in chain fence unused as a sync (Brost)
- Fix PL1 disable flow in xe_hwmon_power_max_write (Karthik)
- Take ref to VM in delayed dump snapshot (Brost)

----------------------------------------------------------------
Karthik Poosa (1):
      drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write

Lucas De Marchi (1):
      drm/xe/rtp: Fix off-by-one when processing rules

Matthew Brost (2):
      drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
      drm/xe: Take ref to VM in delayed snapshot

 drivers/gpu/drm/xe/xe_hwmon.c |  3 ++-
 drivers/gpu/drm/xe/xe_lrc.c   | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.c   |  2 +-
 drivers/gpu/drm/xe/xe_sync.c  |  2 +-
 4 files changed, 18 insertions(+), 4 deletions(-)
