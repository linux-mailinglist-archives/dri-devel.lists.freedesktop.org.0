Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCC8B9EBC
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6321125DE;
	Thu,  2 May 2024 16:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ix9nsMcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690C61125B7;
 Thu,  2 May 2024 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714667874; x=1746203874;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=T53GrUnlDndSBKuNbnRGsM/r3ZC8MtObbgM5O0/mjfA=;
 b=Ix9nsMcxl86NCzwK06cUj+bX9qS3Aq/uF25KDdc/zkXGMqYwqdI0/ddj
 uP2eYvnkHrs2Eb4CTezmZ+8HxR9fPEIdLO1RVQ6plRMpNDdvxenLrCI0C
 q3H4sLAiILjmlxqyHxy384axFd9eetfaTP5vFWk3EMlRXjCi9sjdtIEsg
 dvCfROT5lSJhBbVfcML6e3FfRJuW1Swzx4AuGhGisqS54VTbakuq61kG5
 82wCJTQPW2v/U5O9DoULr5OtsAePO6hI0AuOuLDC39oPZE5c2ODcCy7Xu
 b3aQHLhKzb1ucGnT12dt38wGifp3EPmGM1qX7sgrw5Vd95nkIbd4UuFs4 Q==;
X-CSE-ConnectionGUID: J0dtbxzVTgCOGcdNAO6C3w==
X-CSE-MsgGUID: tRCzM9GfSjyqjLld2m/YJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10987688"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10987688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 09:37:45 -0700
X-CSE-ConnectionGUID: ao/tq2i7RhKLsv/oEx8kuA==
X-CSE-MsgGUID: 1J3fXTdWSZ6/mN/kQX02uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58061460"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 09:37:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 09:37:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 09:37:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 09:37:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 09:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMQGnFsfGMj6BPqttZ87asJU9kWwZ+seV7l6hJWkEeSvj1Vk8gGUlEW1MOXXscbPSeWZ7Lc2HKOcyvDHFjP7yxoDrQJUEZDr6jRtcaGlpuSzY0s9EHZ4SlMyJOZIGze9nXHu1MYGp1a5jcqpN9eS7Yw6Jj/nMk0K0DWf9rgK/9SMW/y3INWXpjIOsc9Z9vc4M8qaXmbGo6WFqFUodA+lKrzpBtQH28srogtwO9uBZy5l4ZYH+JCenrGIyNwn9oGlwV5h/FdteJawhO1bDUxjSlfBqx7QlvIla28Mu8wH7RNaLGZKinZ4xI0+efprepx+c0orwt3LLav9TOWvA4ImOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl0WUz0UcLyEDwBNzeEucPVBmbTYhGlWlaeT6TNOSD0=;
 b=VBoC97JdMDGC4LrIy8gxVlM+6ZW6lngderHoDBaM4BBuzaPqQZMGRXEG7Sf1MZg8Aoev7Wh5kGcSxUCueCf18g0ZlSzI+RjWuzgl2gPCx6rTkjHCagmMgcfwYN4VSDnShmoBbD3GnEUrt3jz1NN8QiZ3pfkwCiVgNdZhk6ih88cu6I45RtJCfY0xDzsuNkX2FOIhyLKClfO+0Ev/Xg2HS2K64GA49PwLp13roggXdhHNsH4bAkgWvSIoZQGhteGnxKK4oU8jnloYh52J6vtRhFcaMrs0R1bEaITVvWFWvx5BAJ2qa5VzLHwnk5zORAncTjsrzp5v2NXVE5KAJXlz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Thu, 2 May
 2024 16:37:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 16:37:35 +0000
Date: Thu, 2 May 2024 11:37:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <6bontwst3mbxozs6u3ad5n3g5zmaucrngbfwv4hkfhpscnwlym@wlwjgjx6pwue>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0330.namprd04.prod.outlook.com
 (2603:10b6:303:82::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae33c00-6fdf-4be6-0ee9-08dc6ac62bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DUsT+M+WQtzhuAZHIumcza2MVEtoxv4U4oBH1tNENJ/j55SWFmMg4ajyanen?=
 =?us-ascii?Q?eVcOrAPafaDpVoPlaN933ykcKOQDNQpzmCOu4FrYmF8oVh/3ptbBeRwxT+Lh?=
 =?us-ascii?Q?lnDl2cqj8X1GId91xJLY6+O7mSxgdMmUYwUuEjIEpn7PLU2FCCu5V6VsuEgy?=
 =?us-ascii?Q?0eVLYPkhlVUT9nISmM9za8ggIhdcKiI+c4w3gDjnlM2roAw5dAP7P1gxoIOo?=
 =?us-ascii?Q?p+ym5CQ1+ML18cKYN3XK25a9pIdEWhhowN0Sv6iOegtmZtJQXj+Xee8c+E94?=
 =?us-ascii?Q?OUYrcrfsm3dYkQhq3ieDZ1hGUXb/i1TX033M/Z/3RhMROjusJA0EmU+Pe4lG?=
 =?us-ascii?Q?UCcbjLri5ubnqv4FKhQEjwsx9uzONE/Wk7oXNoBn8VXilvBClo5sIDYbETNf?=
 =?us-ascii?Q?CaaRMucIZ3QTakpATc6Lld2mxzSKMNCZUNao3qTuq1Kcd2IJE9oADCQbIBEs?=
 =?us-ascii?Q?eEuDInNeRZEDI/r9f8l9tzIkmfFk2nFyT5/0USASMeZzD2Fo5nPscEDPWSqI?=
 =?us-ascii?Q?Zkm7T0Yjeaov4+DNmMyTEeGf0aKcHzLEDUAKUPLC2Nl1HHI7Y9WB/BjSMGqD?=
 =?us-ascii?Q?+dbHO0NUf39nYvIF2gerulao7GvkOngNXfKHjD93RQ3EHHNBSrpvuO9hDDts?=
 =?us-ascii?Q?P1C3/pqOJGYDqNNGISDjKMFSoQUcRjoQaVdxdcIjAMBXedUR/zi8J+k7bbNo?=
 =?us-ascii?Q?Fj8yzvK8jNQ59mQAaDeTnsKoQUmbmzu9BMWmPHfR3sI+KvfpRFd+PHxGDGuA?=
 =?us-ascii?Q?/R1C7efgic7+z3dJC77Yuc9jF8RLZv265sIVI1SRkNtIiFr7+wMut4e6UilO?=
 =?us-ascii?Q?HnSKEcuMzh0iip+J7qweegZIgwkOQUT0FkWtHlquf+pfOF4RkeXZ8wYfzDZT?=
 =?us-ascii?Q?0Ko0X00Hj1g/GOYyKw7wrvmme6fveRC4AuI2BZUPG/V7YFumLvAIEzaPioxr?=
 =?us-ascii?Q?6J2p8JOlhbMuUmvv6SMcLjfiJvlZMWooTVGusA/v4hBuMbvVCYxnYCx99YCz?=
 =?us-ascii?Q?7wpllJNi90yVJROC9vRaBUh5o3qSkOXKwLnSCi9AH8m84NXmalBD+NJHm4ci?=
 =?us-ascii?Q?kHbQ5d3ToFQKplMrbr67wwWvOP/UodWkHe5S/4mxRnqfibNfm1iwUwbNs127?=
 =?us-ascii?Q?Q5WpYEPf7tE0C0Ag613iON1B9dpLep7GQ/nVtYxjk2fF2UecgJ/SoZUkm0t4?=
 =?us-ascii?Q?TyGRX61jEyOmnxhK/FCUEjXG6BNO1F9mra98sF48YxURYbfhMkgYPz9RsOQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?973VWqqu0bm08aCIH6JqANKrVa69AgMgjyPg8/wr5nsrXnF29eHbM4EyVy+n?=
 =?us-ascii?Q?+2gLvnKpfN/S26ZFRcXSQNIjk+LGG3vaSEfhaRxKJslpRI16MhjpRyf/3Z/b?=
 =?us-ascii?Q?XHdPOr4otFR10ZW3mclcXeXS0104vkmwOJePCZjS05caATLf94IVCIW85ktR?=
 =?us-ascii?Q?Hs4v6k5sluJQC2A87cwEguUOAOqTIGxNjZABG5cvKe1O9oDOF/mjYHcmreed?=
 =?us-ascii?Q?RaVbIyJqDoOESfrbgZfRBRLw/Okpgk/AJ2tqmTx5LG23D1nXpPbd1yrZu9gk?=
 =?us-ascii?Q?ee5sX291lhSicdZNJWwOldBdGm5qGWxHsxwvUHqBHaqWb6H/k2GpqCmg+yvU?=
 =?us-ascii?Q?DEoBkb5yNmjYfqKRl0vFCuQ3xbQyp6ncnrpobC8/Kfba8DhNFLw6c8L340UA?=
 =?us-ascii?Q?cWoOrWWMC1d1jFvp9FnXntX+WFEyhoxUfH4HJ21aI0lsEjjH9xqUQiF2IkB6?=
 =?us-ascii?Q?+O+RTH2TKVTjckXLOGFDX3+fpUeQx2MWAghUqGR/azAoj5CFnDQpsnFwGKOm?=
 =?us-ascii?Q?4ZhdICDyCJllGZjq1JdAobf7tw8UUcb8mgfvCMIUtm9oVE530jikX5afojdU?=
 =?us-ascii?Q?mamh3JVYrvJNiLaSbXw3MCuzKyhRIqX4DHn/ekF8AnZ8MDrJimqCnSLM5ujo?=
 =?us-ascii?Q?TZcC81aTnLTA9i7/5m4RcJ+ydeLgmJT5t1vTiLk2CDYyNy8mrnmkn2qAJrDN?=
 =?us-ascii?Q?fa0kyUyrGKiUcOPaqG7fNe4y10Z1zsr9zqD/4x5PkNCi655A8Y9EFr2dcTkB?=
 =?us-ascii?Q?uRkZ9BFb5HBQQGtywyCiAltQLxwOgNuzz5eaoE2v5QgtUkOTQmDkv1qaG+E+?=
 =?us-ascii?Q?u5NgsXscH9TnTNq7ZRQ9+roBh8Uhx7X2dtKFJheIa4N6xAad4vTGWubmTD/R?=
 =?us-ascii?Q?uJwnSagsIpcqWgT19OUyfzHsCHX81umRTMiaMm8KnLVV0gnNT9ulLioCMk5P?=
 =?us-ascii?Q?ot4XL3Lmu+4lnlhuSdVteFVcQxrzjq8jb6jccHG0lS0kg6+8i560cyUZo2Wf?=
 =?us-ascii?Q?tGc3Euiyy+JKh0/7qOT4Wt+h0BwaYZ04f+XidIP6zW98Cpx9SYeMxPDKQ8Uz?=
 =?us-ascii?Q?fKgvAvWHxwOax6IjN9/mTbFIsRBoKtpu4jg/1XYQRWg01SInpiVs7pNMsprk?=
 =?us-ascii?Q?qIcQDxJ2l0OTLemMCbb225hSC6zKgxoRSvvqOR4O1oQvin25iYhoCYijdyEL?=
 =?us-ascii?Q?bYVx00jv76gtETgZHAxM7xZBMHoxVXltZzDMO5uUSBcyujT4j31SQaIt/Ljq?=
 =?us-ascii?Q?Vd3i1szm2LIhfzGSGaZ9aed40/czCG4B3b1N3Ejiw5CunkoEqkegJsqzpHBS?=
 =?us-ascii?Q?Nv6rCr7hdwJTbhGq4ZPv51KcUufMsR4bUYAgS9V32Udn9/b6pTgj0VV2Zew/?=
 =?us-ascii?Q?UJOCOYnDWCgZ0RJ94VjLSHZzDdqV3QiPoA5AEICbrjTaAakHWavIS2NKpZ57?=
 =?us-ascii?Q?jMluois4E7/W9TwNc4HmbkB0+IYKn7Sqc6bxL9serHWU+99pa8DYp3oyYrtS?=
 =?us-ascii?Q?adNsa8HmoXU1yN4b/s8/CkFAX/pivDfdX7ExheWUrA54TEZkcyVtu4ACKhOk?=
 =?us-ascii?Q?1kocBDEZB0ldMjZISQZg8YQShm+y7OfDRs2UVuT8nz5tF56B6A6hEK03xQGE?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae33c00-6fdf-4be6-0ee9-08dc6ac62bf7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 16:37:35.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfWkGQjhtDt6i9O5lRFL7h9/PQtHmYz23SobxPY+K3t/l4z2kA84EPHbyiNCKI11Hn+vB3MV7CsL+2WRbAyqNnG8laMkt/QdCFPpuSN0FKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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

Please pull the drm-xe-fixes for this week targeting v6.9-rc7.

Two important fixes: one avoiding a use-after-free in the rebind worker
and the other to make display work in ADL-N.

thanks
Lucas De Marchi

drm-xe-fixes-2024-05-02:
- Fix UAF on rebind worker
- Fix ADL-N display integration
The following changes since commit e67572cd2204894179d89bd7b984072f19313b03:

   Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-05-02

for you to fetch changes up to df04b152fca2d46e75fbb74ed79299bc420bc9e6:

   drm/xe/display: Fix ADL-N detection (2024-05-02 11:11:01 -0500)

----------------------------------------------------------------
- Fix UAF on rebind worker
- Fix ADL-N display integration

----------------------------------------------------------------
Lucas De Marchi (1):
       drm/xe/display: Fix ADL-N detection

Matthew Auld (1):
       drm/xe/vm: prevent UAF in rebind_work_func()

  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 3 ++-
  drivers/gpu/drm/xe/xe_vm.c                        | 3 +++
  2 files changed, 5 insertions(+), 1 deletion(-)
